Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U8QJh-0000wI-B2
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 08:11:41 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Feb 2013 22:54:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,706,1355126400"; d="scan'208";a="288637694"
Received: from unknown (HELO [10.255.12.136]) ([10.255.12.136])
	by orsmga002.jf.intel.com with ESMTP; 20 Feb 2013 22:55:16 -0800
Message-ID: <5125C4D4.5040700@linux.intel.com>
Date: Wed, 20 Feb 2013 22:55:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: =?UTF-8?B?QmrDtnJuIFN0ZW5iZXJn?= <bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-4-git-send-email-bjst@enea.com>
In-Reply-To: <1361279644-17675-4-git-send-email-bjst@enea.com>
Cc: jack zhang <jack.zhang@enea.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/8] udev: Add ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Feb 2013 07:11:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02/19/2013 05:13 AM, Björn Stenberg wrote:
> From: jack zhang <jack.zhang@enea.com>
>
>
> Signed-off-by: Björn Stenberg <bjst@enea.com>
> ---
>   meta/recipes-core/udev/udev.inc                    |   19 ++++++-
>   .../recipes-core/udev/udev/add-install-ptest.patch |   60 ++++++++++++++++++++
>   meta/recipes-core/udev/udev/run-ptest              |    3 +
>   3 files changed, 80 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
>   create mode 100755 meta/recipes-core/udev/udev/run-ptest
>

Seems this one needs to be rebased against master

Sau!

> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index facad0c..8c26eee 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -27,9 +27,12 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>              file://local.rules \
>              file://udev-cache \
>              file://udev-cache.default \
> -           file://init"
> +           file://init \
> +           file://add-install-ptest.patch \
> +           file://run-ptest \
> +          "
>
> -inherit autotools pkgconfig update-rc.d
> +inherit autotools pkgconfig update-rc.d ptest
>
>   # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
>   sbindir = "${base_sbindir}"
> @@ -105,3 +108,15 @@ python () {
>       if oe.utils.contains ('DISTRO_FEATURES', 'systemd', True, False, d):
>           raise bb.parse.SkipPackage("'systemd' in DISTRO_FEATURES")
>   }
> +
> +do_compile_append() {
> +    if [ "${PN}" = "${BPN}" -a ${PTEST_ENABLED} = "1" ]; then
> +        oe_runmake test-udev
> +    fi
> +}
> +
> +do_install_append() {
> +    if [ "${PN}" = "${BPN}" -a ${PTEST_ENABLED} = "1" ]; then
> +        ptest_do_install
> +    fi
> +}
> diff --git a/meta/recipes-core/udev/udev/add-install-ptest.patch b/meta/recipes-core/udev/udev/add-install-ptest.patch
> new file mode 100644
> index 0000000..db6cf17
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev/add-install-ptest.patch
> @@ -0,0 +1,60 @@
> +Adjustements for ptest:
> +
> +- Add 'install-ptest' rule.
> +- Print a standard result line for each test.
> +- Replace the use of "tree" with "find".
> +
> +Signed-off-by: Björn Stenberg <bjst@enea.com>
> +Upstream-status: Pending
> +
> +--- a/Makefile.am	2012-03-18 16:28:14.000000000 +0100
> ++++ b/Makefile.am	2013-02-18 10:03:36.531101244 +0100
> +@@ -708,3 +708,11 @@
> + 	for i in src/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.sign /pub/linux/utils/kernel/hotplug/libudev/; done
> + 	for i in src/gudev/docs/html/*.{html,css,png}; do rm -f $$i.sign; gpg --armor --detach-sign --output=$$i.sign $$i; done
> + 	for i in src/gudev/docs/html/*.{html,css,png}; do echo $$i; kup put $$i $$i.sign /pub/linux/utils/kernel/hotplug/gudev/; done
> ++
> ++install-ptest:
> ++	install test-udev $(DESTDIR)
> ++	cp Makefile $(DESTDIR)
> ++	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
> ++	$(MKDIR_P) $(DESTDIR)/test
> ++	install $(TESTS) $(DESTDIR)/test
> ++	tar -C $(DESTDIR)/test/ -xJf $(top_srcdir)/test/sys.tar.xz
> +--- a/test/udev-test.pl	2012-03-18 16:43:36.000000000 +0100
> ++++ b/test/udev-test.pl	2013-02-18 10:31:29.706357321 +0100
> +@@ -1459,11 +1459,13 @@
> +                 print "add:         error";
> +                 if ($rules->{exp_add_error}) {
> +                         print " as expected\n";
> ++                        print "XFAIL: TEST $number: $rules->{desc}: add\n";
> +                 } else {
> +                         print "\n";
> +-                        system("tree $udev_root");
> ++                        system("find $udev_root");
> +                         print "\n";
> +                         $error++;
> ++                        print "FAIL: TEST $number: $rules->{desc}: add\n";
> +                         sleep(1);
> +                 }
> +         }
> +@@ -1479,15 +1481,18 @@
> +                 print "remove:      error";
> +                 if ($rules->{exp_rem_error}) {
> +                         print " as expected\n";
> ++                        print "XFAIL: TEST $number: $rules->{desc}: remove\n";
> +                 } else {
> +                         print "\n";
> +-                        system("tree $udev_root");
> ++                        system("find $udev_root");
> +                         print "\n";
> +                         $error++;
> ++                        print "FAIL: TEST $number: $rules->{desc}: remove\n";
> +                         sleep(1);
> +                 }
> +         } else {
> +                 print "remove:      ok\n";
> ++                print "PASS: TEST $number: $rules->{desc}: remove\n";
> +         }
> +
> +         print "\n";
> diff --git a/meta/recipes-core/udev/udev/run-ptest b/meta/recipes-core/udev/udev/run-ptest
> new file mode 100755
> index 0000000..6817ef7
> --- /dev/null
> +++ b/meta/recipes-core/udev/udev/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +make -k check-TESTS
> \ No newline at end of file
>


