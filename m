Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5EAE360721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 07:54:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5N7soaB003092
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jun 2016 00:54:50 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 23 Jun 2016 00:54:49 -0700
To: Stephen Arnold <stephen.arnold42@gmail.com>, Patches and discussions about
	the oe-core layer <openembedded-core@lists.openembedded.org>
References: <CAOLEWZUQRF1LBjviUmbHqLO6kTM=ExC=4soBBTmdhvpuRekbmw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <576B95C8.7070002@windriver.com>
Date: Thu, 23 Jun 2016 15:54:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAOLEWZUQRF1LBjviUmbHqLO6kTM=ExC=4soBBTmdhvpuRekbmw@mail.gmail.com>
Subject: Re: [PATCH v4] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Thu, 23 Jun 2016 07:54:53 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi, I got build errors on Ubuntu 12.04 with this patch:

| DEBUG: Executing shell function do_configure
|
| ERROR: "gcc " cannot build an executable (is your linker broken?)


// Robert

On 06/21/2016 09:18 AM, Stephen Arnold wrote:
> And I finally figured out git send-email no longer has a
> --subject-prefix= option so it looks like --compose and hand-edit the
> Subject line in the patch is the only way to increment the version.
>
> This is [PATCH v4] btw...
>
> Steve
>
> On Mon, Jun 20, 2016 at 5:54 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
>> The main thing is build failures with gold linker, but qemu is also a
>> little too aggressive at finding random tools on the build host, so we
>> also set the build env for qemu-native and make sure it doesn't reset
>> its own (hard-coded) cflags when we don't want it to.
>>
>> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
>>
>> The cflags patch was imported from Gentoo Portage and has been
>> manitained over several versions; this version was rebased against
>> upstream qemu git.
>>
>> Upstream-Status: Inappropriate
>>   - Patch addresses distribution maintenance and build environment
>>     sanity.
>>
>> Signed-off-by: Stephen Arnold <nerdboy@gentoo.org>
>> ---
>>   meta/recipes-devtools/qemu/qemu.inc                | 11 ++++++--
>>   .../qemu/qemu/qemu-2.6.0-cflags.patch              | 31 ++++++++++++++++++++++
>>   meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
>>   3 files changed, 41 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
>> index bf689bb..0a68f05 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -30,8 +30,10 @@ SRC_URI_append_class-native = "\
>>
>>   EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>>
>> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
>> -                               "
>> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
>> +
>> +EXTRA_OEMAKE_append_class-native = " LD="${TARGET_PREFIX}ld.bfd" AR="${AR}" OBJCOPY="${OBJCOPY}" LDFLAGS="${LDFLAGS}""
>> +
>>   export LIBTOOL="${HOST_SYS}-libtool"
>>
>>   do_configure_prepend_class-native() {
>> @@ -40,6 +42,11 @@ do_configure_prepend_class-native() {
>>          if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>>                  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>>          fi
>> +
>> +       # Alter target makefiles to accept CFLAGS set via env
>> +       sed -i -r \
>> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
>> +               "${S}"/Makefile "${S}"/Makefile.target
>>   }
>>
>>   KVMENABLE = "--enable-kvm"
>> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>> new file mode 100644
>> index 0000000..5b78edf
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>> @@ -0,0 +1,31 @@
>> +From 5d29baaf7a8c09f2f97231116e0f396b0402b23d Mon Sep 17 00:00:00 2001
>> +From: Steve Arnold <stephen.arnold42@gmail.com>
>> +Date: Sun, 19 Jun 2016 11:29:44 -0700
>> +Subject: [PATCH] configure: remove hard-coded flags and let build env handle
>> + it
>> +
>> +Apply distribution patch for handling debug and fortify source options.
>> +
>> +Signed-off-by: Steve Arnold <nerdboy@gentoo.org>
>> +---
>> + configure | 4 ----
>> + 1 file changed, 4 deletions(-)
>> +
>> +diff --git a/configure b/configure
>> +index 10cb212..6f1b10c 100755
>> +--- a/configure
>> ++++ b/configure
>> +@@ -4539,10 +4539,6 @@ fi
>> + if test "$gcov" = "yes" ; then
>> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
>> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
>> +-elif test "$fortify_source" = "yes" ; then
>> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
>> +-elif test "$debug" = "no"; then
>> +-  CFLAGS="-O2 $CFLAGS"
>> + fi
>> +
>> + ##########################################
>> +--
>> +2.8.1
>> +
>> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> index e391326..62c509b 100644
>> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
>> @@ -8,6 +8,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>>               file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>>               file://no-valgrind.patch \
>>               file://pathlimit.patch \
>> +            file://qemu-2.5.0-cflags.patch \
>>              "
>>   SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>>   SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

