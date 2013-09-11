Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 958CC6BBDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 02:04:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B24Vcp021722
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 19:04:31 -0700 (PDT)
Received: from msp-dhcp10.wrs.com (172.25.34.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 10 Sep 2013 19:04:30 -0700
Message-ID: <522FCFAD.2030400@windriver.com>
Date: Tue, 10 Sep 2013 21:04:29 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1378864775-7094-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1378864775-7094-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH] python-smartpm: Add an attempt install mode
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
X-List-Received-Date: Wed, 11 Sep 2013 02:04:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Time measurements with:

MACHINE = "qemux86"
PACKAGE_CLASSES = "package_rpm"
EXTRA_IMAGE_FEATURES = "dev-pkgs staticdev-pkgs doc-pkgs dbg-pkgs ptest-pkgs"
BB_NUMBER_THREADS ?= "8"
PARALLEL_MAKE ?= "-j 8"

image: core-image-sato

Quad Core i7 workstation...

With all of the recipes built, and just executing the do_rootfs:

Before this change:
  real    26m2.541s
  user    21m8.458s
  sys     7m9.683s

After this change:
  real    14m43.436s
  user    15m57.525s
  sys     5m16.412s

This is a significant performance boost when using the 'complementary' installs 
and attemptonly installs.  The performance is by doing the complementary 
installs as a batch instead of one at a time, ignoring failures.

--Mark

On 9/10/13 8:59 PM, Mark Hatle wrote:
> [ YOCTO #3723 ]
>
> Add a mode to smart that will allow an installation to continue, instead of
> failure in the case that one or more items is uninstallable.
>
> Uninstallable packages are simply ignored, and no error is generated.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/classes/package_rpm.bbclass                   |  7 +--
>   .../python/python-smartpm/smart-attempt.patch      | 59 ++++++++++++++++++++++
>   .../python/python-smartpm_1.4.1.bb                 |  1 +
>   3 files changed, 62 insertions(+), 5 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
>
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 8ab42c4..699d0f2 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -472,11 +472,8 @@ EOF
>   		echo "Attempting $pkgs_to_install"
>   		echo "Note: see `dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
>   		translate_oe_to_smart ${sdk_mode} --attemptonly $package_attemptonly
> -		for each_pkg in $pkgs_to_install ;  do
> -			# We need to try each package individually as a single dependency failure
> -			# will break the whole set otherwise.
> -			smart --data-dir=${target_rootfs}/var/lib/smart install -y $each_pkg >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
> -		done
> +		echo "Attempting $pkgs_to_install" >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
> +		smart --data-dir=${target_rootfs}/var/lib/smart install --attempt -y ${pkgs_to_install} >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1
>   	fi
>   }
>
> diff --git a/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> new file mode 100644
> index 0000000..0d603d3
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python-smartpm/smart-attempt.patch
> @@ -0,0 +1,59 @@
> +Add a mechanism to attempt the install operation, w/o failing.
> +
> +For complementary and 'attemptonly' packages, we need a way to instruct smart to
> +try to install, but ignore any failures.
> +
> +This option only works for the install operation.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +Index: smart-1.4.1/smart/commands/install.py
> +===================================================================
> +--- smart-1.4.1.orig/smart/commands/install.py
> ++++ smart-1.4.1/smart/commands/install.py
> +@@ -50,6 +50,8 @@ def option_parser():
> +     parser = OptionParser(usage=USAGE,
> +                           description=DESCRIPTION,
> +                           examples=EXAMPLES)
> ++    parser.add_option("--attempt", action="store_true",
> ++                      help=_("attempt to install packages, ignore failures"))
> +     parser.add_option("--stepped", action="store_true",
> +                       help=_("split operation in steps"))
> +     parser.add_option("--urls", action="store_true",
> +@@ -80,6 +82,9 @@ def main(ctrl, opts):
> +     if not opts.args:
> +         raise Error, _("no package(s) given")
> +
> ++    if opts.attempt:
> ++	sysconf.set("attempt-install", True, soft=True)
> ++
> +     if opts.explain:
> +         sysconf.set("explain-changesets", True, soft=True)
> +
> +Index: smart-1.4.1/smart/transaction.py
> +===================================================================
> +--- smart-1.4.1.orig/smart/transaction.py
> ++++ smart-1.4.1/smart/transaction.py
> +@@ -1216,9 +1216,17 @@ class Transaction(object):
> +                     else:
> +                         op = REMOVE
> +                 if op is INSTALL or op is REINSTALL:
> +-                    self._install(pkg, changeset, locked, pending)
> +-                    if pkg in changeset:
> +-                        changeset.setRequested(pkg, True)
> ++                    try:
> ++                        self._install(pkg, changeset, locked, pending)
> ++                        if pkg in changeset:
> ++                            changeset.setRequested(pkg, True)
> ++                    except Failed, e:
> ++                        if sysconf.has("attempt-install", soft=True):
> ++                            if pkg in changeset:
> ++                                del changeset[pkg]
> ++                            continue
> ++                        else:
> ++                            raise Failed, e
> +                 elif op is REMOVE:
> +                     self._remove(pkg, changeset, locked, pending)
> +                 elif op is UPGRADE:
> diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> index 5d673b9..f406d69 100644
> --- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> +++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
> @@ -30,6 +30,7 @@ SRC_URI = "\
>             file://smart-flag-ignore-recommends.patch \
>             file://smart-flag-exclude-packages.patch \
>             file://smart-config-ignore-all-recommends.patch \
> +          file://smart-attempt.patch \
>             "
>
>   SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
>


