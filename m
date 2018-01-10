Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D23E078432
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 14:51:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 06:51:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,340,1511856000"; d="scan'208";a="165679216"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga004.jf.intel.com with ESMTP; 10 Jan 2018 06:51:54 -0800
Date: Wed, 10 Jan 2018 09:01:45 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <20180110090145.5729ba28@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <20180110122742.1226-4-alexander.kanavin@linux.intel.com>
References: <20180110122742.1226-1-alexander.kanavin@linux.intel.com>
	<20180110122742.1226-4-alexander.kanavin@linux.intel.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gnupg: use native version for signing, rather than one provided by host
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
X-List-Received-Date: Wed, 10 Jan 2018 14:51:55 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Great that you figure out a solution.

So I belive we need to revert this commit:

commit 043d9ac0ae441e9a7e2ea8934bfc595a03ef9a52
Author: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date:   Mon Sep 25 13:52:59 2017 -0700

    sign_rpm.bbclass: force rpm serial signing
    
    Newer versions of gpg (at least 2.1.5 and 2.2.1) have issues when signing occurs in parallel
    so (unfortunately) the signing must be done serially. Once the upstream problem is fixed,
    this patch must be reverted, otherwise we loose all the intrinsic parallelism from
    bitbake.
    
    [YOCTO #12022]
    
    (From OE-Core rev: 5301712f9735fcf8d3dec756772668de930e53fe)
    


On Wed, 10 Jan 2018 14:27:42 +0200
Alexander Kanavin <alexander.kanavin@linux.intel.com> wrote:

> Using host gpg has been problematic, and particularly this removes
> the need to serialize package creation, as long as --auto-expand-secmem
> is passed to gpg-agent, and gnupg >= 2.2.4 is in use
> (https://dev.gnupg.org/T3530).
> 
> Sadly, gpg-agent itself is single-threaded, so in the longer run
> we might want to seek alternatives:
> https://lwn.net/Articles/742542/
> 
> (a smaller issue is that rpm itself runs the gpg fronted in a serial
> fashion, which slows down the build in cases of recipes with very
> large amount of packages, e.g. glibc-locale)
> 
> Note that sstate signing and verification continues to use host
> gpg, as depending on native gpg would create circular dependencies.
> 
> [YOCTO #12022]
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/classes/sign_package_feed.bbclass | 2 +-
>  meta/classes/sign_rpm.bbclass          | 6 +-----
>  meta/lib/oe/gpg_sign.py                | 8 ++++++--
>  meta/recipes-core/meta/signing-keys.bb | 1 +
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
> index f03c4802d06..7ff3a35a2fa 100644
> --- a/meta/classes/sign_package_feed.bbclass
> +++ b/meta/classes/sign_package_feed.bbclass
> @@ -43,4 +43,4 @@ python () {
>  }
>  
>  do_package_index[depends] += "signing-keys:do_deploy"
> -do_rootfs[depends] += "signing-keys:do_populate_sysroot"
> +do_rootfs[depends] += "signing-keys:do_populate_sysroot gnupg-native:do_populate_sysroot"
> diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
> index 4961b03618f..64ae7ce30e3 100644
> --- a/meta/classes/sign_rpm.bbclass
> +++ b/meta/classes/sign_rpm.bbclass
> @@ -68,8 +68,4 @@ python sign_rpm () {
>  do_package_index[depends] += "signing-keys:do_deploy"
>  do_rootfs[depends] += "signing-keys:do_populate_sysroot"
>  
> -# Newer versions of gpg (at least 2.1.5 and 2.2.1) have issues when signing occurs in parallel
> -# so unfortunately the signing must be done serially. Once the upstream problem is fixed,
> -# the following line must be removed otherwise we loose all the intrinsic parallelism from
> -# bitbake.  For more information, check https://bugzilla.yoctoproject.org/show_bug.cgi?id=12022.
> -do_package_write_rpm[lockfiles] += "${TMPDIR}/gpg.lock"
> +PACKAGE_WRITE_DEPS += "gnupg-native"
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index 9cc88f020c1..b17272928fc 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -12,6 +12,7 @@ class LocalSigner(object):
>          self.gpg_path = d.getVar('GPG_PATH')
>          self.gpg_version = self.get_gpg_version()
>          self.rpm_bin = bb.utils.which(os.getenv('PATH'), "rpmsign")
> +        self.gpg_agent_bin = bb.utils.which(os.getenv('PATH'), "gpg-agent")
>  
>      def export_pubkey(self, output_file, keyid, armor=True):
>          """Export GPG public key to a file"""
> @@ -31,7 +32,7 @@ class LocalSigner(object):
>          """Sign RPM files"""
>  
>          cmd = self.rpm_bin + " --addsign --define '_gpg_name %s'  " % keyid
> -        gpg_args = '--no-permission-warning --batch --passphrase=%s' % passphrase
> +        gpg_args = '--no-permission-warning --batch --passphrase=%s --agent-program=%s|--auto-expand-secmem' % (passphrase, self.gpg_agent_bin)
>          if self.gpg_version > (2,1,):
>              gpg_args += ' --pinentry-mode=loopback'
>          cmd += "--define '_gpg_sign_cmd_extra_args %s' " % gpg_args
> @@ -71,6 +72,9 @@ class LocalSigner(object):
>          if self.gpg_version > (2,1,):
>              cmd += ['--pinentry-mode', 'loopback']
>  
> +        if self.gpg_agent_bin:
> +            cmd += ["--agent-program=%s|--auto-expand-secmem" % (self.gpg_agent_bin)]
> +
>          cmd += [input_file]
>  
>          try:
> @@ -99,7 +103,7 @@ class LocalSigner(object):
>          import subprocess
>          try:
>              ver_str = subprocess.check_output((self.gpg_bin, "--version", "--no-permission-warning")).split()[2].decode("utf-8")
> -            return tuple([int(i) for i in ver_str.split('.')])
> +            return tuple([int(i) for i in ver_str.split("-")[0].split('.')])
>          except subprocess.CalledProcessError as e:
>              raise bb.build.FuncFailed("Could not get gpg version: %s" % e)
>  
> diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
> index 2c1cc3845ea..6387d90d474 100644
> --- a/meta/recipes-core/meta/signing-keys.bb
> +++ b/meta/recipes-core/meta/signing-keys.bb
> @@ -41,6 +41,7 @@ python do_get_public_keys () {
>  }
>  do_get_public_keys[cleandirs] = "${B}"
>  addtask get_public_keys before do_install
> +do_get_public_keys[depends] += "gnupg-native:do_populate_sysroot"
>  
>  do_install () {
>      if [ -f "${B}/rpm-key" ]; then
> -- 
> 2.15.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

