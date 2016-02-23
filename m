Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 589F177315
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:25:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Feb 2016 02:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,488,1449561600"; d="scan'208";a="892551805"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2016 02:25:32 -0800
Message-ID: <1456223131.2298.40.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Feb 2016 12:25:31 +0200
In-Reply-To: <4e53f5b5f4e5f9120695e83c4a44b5f99179ed5a.1455895912.git.adrian.ratiu@ni.com>
References: <cover.1455895912.git.adrian.ratiu@ni.com>
	<4e53f5b5f4e5f9120695e83c4a44b5f99179ed5a.1455895912.git.adrian.ratiu@ni.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Subject: Re: [PATCH v6 1/4] gpg_sign: add local ipk package signing functionality
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
X-List-Received-Date: Tue, 23 Feb 2016 10:25:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Resending as my I got a strange "Only members may post to the list."
error yesterday...

On Fri, 2016-02-19 at 17:43 +0200, Ioan-Adrian Ratiu wrote:
> Implement ipk signing inside the sign_ipk bbclass using the gpg_sign
> module and configure signing similar to how rpm does it. sign_ipk
> uses
> gpg_sign's detach_sign because its functionality is identical to
> package
> feed signing.
> 
> IPK signing process is a bit different from rpm:
>     - Signatures are stored outside ipk files; opkg connects to a
> feed
> server and downloads them to verify a package.
>     - Signatures are of two types (both supported by opkg): binary or
> ascii armoured. By default we sign using ascii armoured.
>     - Public keys are stored on targets to verify ipks using the
> opkg-keyrings recipe.
> 
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/classes/package_ipk.bbclass |  5 ++++
>  meta/classes/sign_ipk.bbclass    | 52
> ++++++++++++++++++++++++++++++++++++++++
>  meta/lib/oe/gpg_sign.py          | 50 ++++++++++++++++++++++++++++--
> --------
>  3 files changed, 94 insertions(+), 13 deletions(-)
>  create mode 100644 meta/classes/sign_ipk.bbclass
> 
> diff --git a/meta/classes/package_ipk.bbclass
> b/meta/classes/package_ipk.bbclass
> index 51bee28..f64837a 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -246,6 +246,11 @@ python do_package_ipk () {
>              bb.utils.unlockfile(lf)
>              raise bb.build.FuncFailed("opkg-build execution failed")
>  
> +        if d.getVar('IPK_SIGN_PACKAGES', True) == '1':
> +            ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
> +            ipk_to_sign = "%s/%s_%s_%s.ipk" % (pkgoutdir, pkgname,
> ipkver, d.getVar('PACKAGE_ARCH', True))
> +            sign_ipk(d, ipk_to_sign)
> +
>          cleanupcontrol(root)
>          bb.utils.unlockfile(lf)
>  
> diff --git a/meta/classes/sign_ipk.bbclass
> b/meta/classes/sign_ipk.bbclass
> new file mode 100644
> index 0000000..a481f6d
> --- /dev/null
> +++ b/meta/classes/sign_ipk.bbclass
> @@ -0,0 +1,52 @@
> +# Class for generating signed IPK packages.
> +#
> +# Configuration variables used by this class:
> +# IPK_GPG_PASSPHRASE_FILE
> +#           Path to a file containing the passphrase of the signing
> key.
> +# IPK_GPG_NAME
> +#           Name of the key to sign with.
> +# IPK_GPG_BACKEND
> +#           Optional variable for specifying the backend to use for
> signing.
> +#           Currently the only available option is 'local', i.e.
> local signing
> +#           on the build host.
> +# IPK_GPG_SIGNATURE_TYPE
> +#           Optional variable for specifying the type of gpg
> signatures, can be:
> +#                     1. Ascii armored (ASC), default if not set
> +#                     2. Binary (BIN)
> +# GPG_BIN
> +#           Optional variable for specifying the gpg binary/wrapper
> to use for
> +#           signing.
> +# GPG_PATH
> +#           Optional variable for specifying the gnupg "home"
> directory:
> +#
> +
> +inherit sanity
> +
> +IPK_SIGN_PACKAGES = '1'
> +IPK_GPG_BACKEND ?= 'local'
> +IPK_GPG_SIGNATURE_TYPE ?= 'ASC'
> +
> +python () {
> +    # Check configuration
> +    for var in ('IPK_GPG_NAME', 'IPK_GPG_PASSPHRASE_FILE'):
> +        if not d.getVar(var, True):
> +            raise_sanity_error("You need to define %s in the config"
> % var, d)
> +
> +    sigtype = d.getVar("IPK_GPG_SIGNATURE_TYPE", True)
> +    if sigtype.upper() != "ASC" and sigtype.upper() != "BIN":
> +        raise_sanity_error("Bad value for IPK_GPG_SIGNATURE_TYPE
> (%s), use either ASC or BIN" % sigtype)
> +}
> +
> +def sign_ipk(d, ipk_to_sign):
> +    from oe.gpg_sign import get_signer
> +
> +    bb.debug(1, 'Signing ipk: %s' % ipk_to_sign)
> +
> +    signer = get_signer(d, d.getVar('IPK_GPG_BACKEND', True))
> +    sig_type = d.getVar('IPK_GPG_SIGNATURE_TYPE', True)
> +    is_ascii_sig = (sig_type.upper() != "BIN")
> +
> +    signer.detach_sign(ipk_to_sign,
> +                       d.getVar('IPK_GPG_NAME', True),
> +                       d.getVar('IPK_GPG_PASSPHRASE_FILE', True),
> +                       armor=is_ascii_sig)
> diff --git a/meta/lib/oe/gpg_sign.py b/meta/lib/oe/gpg_sign.py
> index ada1b2f..ef47d1a 100644
> --- a/meta/lib/oe/gpg_sign.py
> +++ b/meta/lib/oe/gpg_sign.py
> @@ -1,5 +1,6 @@
>  """Helper module for GPG signing"""
>  import os
> +import sys
>  
>  import bb
>  import oe.utils
> @@ -50,6 +51,7 @@ class LocalSigner(object):
>              bb.error('rpmsign failed: %s' % proc.before.strip())
>              raise bb.build.FuncFailed("Failed to sign RPM packages")
>  
> +
>      def detach_sign(self, input_file, keyid, passphrase_file,
> passphrase=None, armor=True):
>          """Create a detached signature of a file"""
>          import subprocess
> @@ -57,23 +59,45 @@ class LocalSigner(object):
>          if passphrase_file and passphrase:
>              raise Exception("You should use either passphrase_file
> of passphrase, not both")
>  
> -        cmd = [self.gpg_bin, '--detach-sign', '--batch', '--no-tty',
> '--yes',
> -               '-u', keyid]
> -        if passphrase_file:
> -            cmd += ['--passphrase-file', passphrase_file]
> -        else:
> -            cmd += ['--passphrase-fd', '0']
> +        cmd = [self.gpg_bin, '--detach-sign', '--batch', '--no-tty',
> '--yes', '-u', keyid]
> +
>          if self.gpg_path:
>              cmd += ['--homedir', self.gpg_path]
>          if armor:
>              cmd += ['--armor']
> -        cmd.append(input_file)
> -        job = subprocess.Popen(cmd, stdin=subprocess.PIPE,
> stdout=subprocess.PIPE,
> -                               stderr=subprocess.PIPE)
> -        _, stderr = job.communicate(passphrase)
> -        if job.returncode:
> -            raise bb.build.FuncFailed("Failed to create signature
> for '%s': %s" %
> -                                      (input_file, stderr))
> +
> +        try:
> +            keypipe = os.pipe()
> +
> +            if passphrase_file:
> +                with open(passphrase_file) as fobj:
> +                    os.write(keypipe[1], fobj.readline());
> +            else:
> +                os.write(keypipe[1], passphrase)
> +
> +            cmd += ["--passphrase-fd",  str(keypipe[0])]
> +            cmd += [input_file]
> +
> +            job = subprocess.Popen(cmd, stdin=subprocess.PIPE,
> stderr=subprocess.PIPE)
> +            (_, stderr) = job.communicate(passphrase)
> +
> +            os.close(keypipe[1])
> +            os.close(keypipe[0])

I still fail to see why you want to complicate the code with os.pipe.
Why not ditch pipe and just do something like:
    if passphrase_file:
        with open(passphrase_file) as fobj:
            _, stderr = job.communicate(fobj.readline())



Thanks,
  Markus



> +
> +            if job.returncode:
> +                raise bb.build.FuncFailed("GPG exited with code %d:
> %s" %
> +                                          (job.returncode, stderr))
> +
> +        except IOError as e:
> +            bb.error("IO error (%s): %s" % (e.errno, e.strerror))
> +            raise Exception("Failed to sign '%s'" % input_file)
> +        except OSError as e:
> +            bb.error("OS error (%s): %s" % (e.errno, e.strerror))
> +            raise Exception("Failed to sign '%s" % input_file)
> +        except:
> +            bb.error("Unexpected error (%s): %s" %
> (sys.exc_info()[0], sys.exc_info()[1]))
> +            raise Exception("Failed to sign '%s'" % input_file)
> +
>  
>      def verify(self, sig_file):
>          """Verify signature"""

