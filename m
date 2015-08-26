Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09310734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:04:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7QF46Xa002840
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 08:04:06 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 26 Aug 2015 08:04:05 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1440587914-1280-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1440587914-1280-2-git-send-email-markus.lehtonen@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55DDD564.9090304@windriver.com>
Date: Wed, 26 Aug 2015 10:04:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1440587914-1280-2-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH 1/3] package_rpm: support signing of rpm packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 15:04:07 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/26/15 6:18 AM, Markus Lehtonen wrote:
> This patch adds a new bbclass for generating rpm packages that are
> signed with a user defined key. The packages are signed as part of the
> "package_write_rpm" task.
> 
> In order to enable the feature you need to
> 1. 'INHERIT += " sign_rpm"' in bitbake config (e.g. local or
>    distro)
> 2. Create a file that contains the passphrase to your gpg secret key
> 3. 'RPM_GPG_PASSPHRASE_FILE = "<path_to_file>" in bitbake config,
>    pointing to the passphrase file created in 2.
> 4. Define GPG key name to use by either defining
>    'RPM_GPG_NAME = "<key_id>" in bitbake config OR by defining
>    %_gpg_name <key_id> in your ~/.oerpmmacros file
> 5. 'RPM_GPG_PUBKEY = "<path_to_pubkey>" in bitbake config pointing to
>    the public key (in "armor" format)
> 
> The sign_rpm.bbclass implements a simple scenario of locally signing the
> packages. It could be replaced by a more advanced class that would
> utilize a separate signing server for signing the packages, for example.
> 
> [YOCTO #8134]
> 
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>  meta/classes/package_rpm.bbclass |  5 ++++
>  meta/classes/sign_rpm.bbclass    | 58 ++++++++++++++++++++++++++++++++++++++++
>  meta/lib/oe/package_manager.py   | 28 +++++++++++++++++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 meta/classes/sign_rpm.bbclass
> 
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 8fd0685..3e933ef 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -695,6 +695,8 @@ python do_package_rpm () {
>      else:
>          d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
>      pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
> +    d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
> +    bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR', True))
>      pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
>      magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
>      bb.utils.mkdirhier(pkgwritedir)
> @@ -730,6 +732,9 @@ python do_package_rpm () {
>      d.setVar('BUILDSPEC', cmd + "\n")
>      d.setVarFlag('BUILDSPEC', 'func', '1')
>      bb.build.exec_func('BUILDSPEC', d)
> +
> +    if d.getVar('RPM_SIGN_PACKAGES', True) == '1':
> +        bb.build.exec_func("sign_rpm", d)
>  }
>  
>  python () {
> diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
> new file mode 100644
> index 0000000..ddf6c3b
> --- /dev/null
> +++ b/meta/classes/sign_rpm.bbclass
> @@ -0,0 +1,58 @@
> +inherit sanity
> +
> +RPM_SIGN_PACKAGES='1'
> +
> +
> +_check_gpg_name () {
> +    macrodef=`rpm -E '%_gpg_name'`
> +    [ "$macrodef" == "%_gpg_name" ] && return 1 || return 0
> +}
> +
> +
> +def rpmsign_wrapper(d, files, passphrase, gpg_name=None):
> +    import pexpect
> +
> +    # Find the correct rpm binary
> +    rpm_bin_path = d.getVar('STAGING_BINDIR_NATIVE', True) + '/rpm'
> +    cmd = rpm_bin_path + " --addsign "
> +    if gpg_name:
> +        cmd += "--define '%%_gpg_name %s' " % gpg_name
> +    else:
> +        try:
> +            bb.build.exec_func('_check_gpg_name', d)
> +        except bb.build.FuncFailed:
> +            raise_sanity_error("You need to define RPM_GPG_NAME in bitbake "
> +                               "config or the %_gpg_name RPM macro defined "
> +                               "(e.g. in  ~/.oerpmmacros", d)
> +    cmd += ' '.join(files)
> +
> +    # Need to use pexpect for feeding the passphrase
> +    proc = pexpect.spawn(cmd)
> +    try:
> +        proc.expect_exact('Enter pass phrase:', timeout=15)
> +        proc.sendline(passphrase)
> +        proc.expect(pexpect.EOF, timeout=900)
> +        proc.close()
> +    except pexpect.TIMEOUT as err:
> +        bb.debug('rpmsign timeout: %s' % err)
> +        proc.terminate()
> +    return proc.exitstatus
> +
> +
> +python sign_rpm () {
> +    import glob
> +
> +    rpm_gpg_pass_file = (d.getVar("RPM_GPG_PASSPHRASE_FILE", True) or "")
> +    if rpm_gpg_pass_file:
> +        with open(rpm_gpg_pass_file) as fobj:
> +            rpm_gpg_passphrase = fobj.readlines()[0].rstrip('\n')
> +    else:
> +        raise_sanity_error("You need to define RPM_GPG_PASSPHRASE_FILE in the config", d)
> +
> +    rpm_gpg_name = (d.getVar("RPM_GPG_NAME", True) or "")
> +
> +    rpms = glob.glob(d.getVar('RPM_PKGWRITEDIR', True) + '/*')
> +
> +    if rpmsign_wrapper(d, rpms, rpm_gpg_passphrase, rpm_gpg_name) != 0:
> +        raise bb.build.FuncFailed("RPM signing failed")
> +}
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 2ab1d78..753b3eb 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -108,7 +108,14 @@ class RpmIndexer(Indexer):
>          archs = archs.union(set(sdk_pkg_archs))
>  
>          rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
> +        rpm_bin = bb.utils.which(os.getenv('PATH'), "rpm")
> +        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
> +            rpm_pubkey = self.d.getVar('RPM_GPG_PUBKEY', True)
> +        else:
> +            rpm_pubkey = None
> +
>          index_cmds = []
> +        key_import_cmds = []
>          rpm_dirs_found = False
>          for arch in archs:
>              dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
> @@ -118,6 +125,9 @@ class RpmIndexer(Indexer):
>              if not os.path.isdir(arch_dir):
>                  continue
>  
> +            if rpm_pubkey:
> +                key_import_cmds.append("%s --define '_dbpath %s' --import %s" %
> +                                   (rpm_bin, dbpath, rpm_pubkey))
>              index_cmds.append("%s --dbpath %s --update -q %s" % \
>                               (rpm_createrepo, dbpath, arch_dir))
>  
> @@ -127,9 +137,18 @@ class RpmIndexer(Indexer):
>              bb.note("There are no packages in %s" % self.deploy_dir)
>              return
>  
> +        # Import GPG key to all temporary RPMDBs
> +        result = oe.utils.multiprocess_exec(key_import_cmds, create_index)
> +        if result:
> +            bb.fatal('%s' % ('\n'.join(result)))
> +        # Create repodata
>          result = oe.utils.multiprocess_exec(index_cmds, create_index)
>          if result:
>              bb.fatal('%s' % ('\n'.join(result)))
> +        # Copy pubkey to repo
> +        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
> +            shutil.copy2(self.d.getVar('RPM_GPG_PUBKEY', True),
> +                         os.path.join(self.deploy_dir, 'RPM-GPG-KEY-oe'))

Do you really need to do the above hunk?

createrepo can very easily be modified to ignore the key in a signed package
from being validated as the repository information is created.

The only reason why I think you'd want to do the above is simply to have
createrepo verify the (externally signed) package has not been
modified/corrupted before createrepo runs.  (Even if it has, the test would fail
for people using the package feed... so I think it's unlikely to be an issue.)

Without pasting the whole patch:

--- createrepo-0.4.11.orig/dumpMetadata.py
+++ createrepo-0.4.11/dumpMetadata.py
@@ -92,7 +92,7 @@ def returnHdr(ts, package):
-    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
+
ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD|rpm.RPMVSF_NODSA|rpm.RPMVSF_NORSA|rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER))

I can send up this change if you think it's useful in this case (and would
eliminate these steps.)

(The reason I question the steps is purely because we've seen in the past these
temporary RPM databases seem to be fragile at times.  So anything we can do to
avoid that is probably good.)

>  class OpkgIndexer(Indexer):
> @@ -352,6 +371,9 @@ class RpmPkgsList(PkgsList):
>              pkg = line.split()[0]
>              arch = line.split()[1]
>              ver = line.split()[2]
> +            # Skip GPG keys
> +            if pkg == 'gpg-pubkey':
> +                continue
>              if self.rpm_version == 4:
>                  pkgorigin = "unknown"
>              else:
> @@ -864,6 +886,12 @@ class RpmPM(PackageManager):
>          except subprocess.CalledProcessError as e:
>              bb.fatal("Create rpm database failed. Command '%s' "
>                       "returned %d:\n%s" % (cmd, e.returncode, e.output))
> +        # Import GPG key to RPM database of the target system
> +        if self.d.getVar('RPM_SIGN_PACKAGES', True) == '1':
> +            pubkey_path = self.d.getVar('RPM_GPG_PUBKEY', True)
> +            cmd = "%s --root %s --dbpath /var/lib/rpm --import %s > /dev/null" % (
> +                  self.rpm_cmd, self.target_rootfs, pubkey_path)
> +            subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
>  
>          # Configure smart
>          bb.note("configuring Smart settings")
> 


