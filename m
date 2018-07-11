Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D8E0360807
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 08:01:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6B81F6Q015111
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2018 01:01:15 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 11 Jul 2018 01:01:11 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1530775716.git.Qi.Chen@windriver.com>
	<64ff479e5f6380bdf8d9521f2ea727b4e89f2b36.1530775716.git.Qi.Chen@windriver.com>
	<50455583-91e1-8ecf-b737-27b773a7fd82@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <2fb407de-6278-c40a-a416-133eaf349ca1@windriver.com>
Date: Wed, 11 Jul 2018 16:04:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <50455583-91e1-8ecf-b737-27b773a7fd82@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Wed, 11 Jul 2018 08:01:16 -0000
Content-Type: multipart/alternative;
	boundary="------------15266F481D0F0AF7B96DF0DC"

--------------15266F481D0F0AF7B96DF0DC
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

Thanks for your review.

I've gone through your feedback one by one. Please see comments in line.

I'll send out V2 with a few other fixes.


On 07/06/2018 12:37 AM, Khem Raj wrote:
> On 7/5/18 12:31 AM, Chen Qi wrote:
>> Upgrade systemd to 239.
>>
>> 1. Patch Changes
>> * Rebased Patches
>>    0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>>    0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>>    0006-Make-root-s-home-directory-configurable.patch
>>    0027-remove-nobody-user-group-checking.patch
>>    0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>>    0013-add-fallback-parse_printf_format-implementation.patch
>>    0014-src-basic-missing.h-check-for-missing-strndupa.patch
>>    0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>>    0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>>    0017-Include-netinet-if_ether.h.patch
>>    0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>>    0022-don-t-use-glibc-specific-qsort_r.patch
>>    0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>>    0026-Use-uintmax_t-for-handling-rlim_t.patch
>>    0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>>    0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>>    0001-core-device.c-Change-the-default-device-timeout-to-2.patch
>>    0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>>
>> * Dropped Patches and Reasons
>>    0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>>      This patch is dropped because there's no build and runtime
>>      error without it. In the patch's commit message, it says for
>>      some unknown reason, systemd 234 needs it. But after doing
>>      build and runtime test, I can see that systemd 239 doesn't
>>      need it.
> IIRC it happend with gold linker see
> https://github.com/systemd/systemd/issues/234
>
> If we need to drop it then please validate it ld-is-gold distro feature
> the relevant linker bug seems to be fixed but we need to ensure

The problem has been fixed by binutils upstream.
I'll update the reason about why dropping this patch in commit message 
in V2.

>>    0007-Revert-rules-remove-firmware-loading-rules.patch
>>    0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>>      These two patches are dropped because they are for kernel < 3.7.
>>      But the current minimal requirement of kernel to build systemd
>>      is as below.
>>      REQUIREMENTS:
>>          Linux kernel >= 3.13
>>          Linux kernel >= 4.2 for unified cgroup hierarchy support
>>      So these two patches no long make any sense.
>>
> I think there were/are OE users who still use kernel < 3.7, if no one
> chimes in, I am ok to drop them.
>

>>    0009-remove-duplicate-include-uchar.h.patch
>>    0010-check-for-uchar.h-in-meson.build.patch
>>      These two patches are dropped because musl has implemented
>>      uchar.h. See commit below from musl repo.
>>      """
>>      ab9672ae73248f51e30f4553c4b8878525e46383
>>      implement uchar.h (C11 UTF-16/32 conversion) interfaces
>>      """
>>
> This is fine.
>
>>    0018-check-for-missing-canonicalize_file_name.patch
>>      The above patch is dropped because current systemd does not need
>>      canonicalize_file_name.
> OK
>
>>    0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>>      The above patch is dropped because utmp makes no sense in musl.
>>      Check code below from musl.
>>      include/utmp.h:#define _PATH_UTMP "/dev/null/utmp"
>>      And utmp PACKAGECONFIG has been explicitly disabled for musl.
>>      So we don't need this patch.
>>
> while utmp is disabled for musl, I think the above patch is in direction
> to enable it fully for musl. I would suggest that we first try to enable
> utmp for musl along with this patch, I remember there were some kinks
> and if the build still fails probably its fine to drop it.

In glibc, we have
sysdeps/unix/sysv/linux/paths.h:#define    _PATH_WTMP "/var/log/wtmp"

In musl, we have:
include/utmp.h:#define _PATH_WTMP "/dev/null/wtmp"

Please see the following commit in musl repo:
"""
commit 1e2281b8356d1935a129ddb199d71677f19a1619
Author: Rich Felker <dalias@aerifal.cx>
Date:   Thu Jun 27 20:00:29 2013 -0400

     minor compatibility fixes in utmp.h and fixing mismatch with paths.h

     the pathnames prefixed with /dev/null/ are guaranteed never to be
     valid. the previous use of /dev/null alone was mildly dangerous in
     that bad software might attempt to unlink the name when it found a
     non-regular file there and create a new file.

"""

So enabling utmp does not have any real effect for musl.
That's why I dropped this patch.

>>    0032-memfd.patch
>>    0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>>    libmount.patch
>>    0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>>      The above patches are dropped because they are backported patches.
>>      And current systemd has contained these patches.
>>
> OK
>
>>    0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>>      The above patch is dropped because it has been merged and is now
>>      in new version.
> OK
>
>> * Newly Added Patch
>>    0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>>      This patch is added to fix build for musl.
> OK
>
>>    0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>>      This patch is added to fix the following error which caused system
>>      unable to boot up.
>>        systemd-udevd.service: Failed to adjust OOM setting: Invalid argument
>>        dbus.service: Failed to adjust OOM setting: Invalid argument
>>
> I wonder if a patch should be cooked in line of this one
> https://github.com/floppym/systemd/commit/19ef148a26ef11afad1baad1211c825bc4d31ba7
>

It's similar but it's not the same.
The commit you mentioned is more about avoiding losing correct value of 
errno.
My patch is to ensure we feed '-900' to /proc/PID/oom_score_adj instead 
of just a '-'.

Please check the following commit in systemd.
"""
commit 9f8168eb233d00b10e7d8ae25d9fb4c9688b4bc6
Author: Lennart Poettering <lennart@poettering.net>
Date:   Mon May 7 20:44:41 2018 +0200

     process-util: add new helper call for adjusting the OOM score

     And let's make use of it in execute.c
"""

Before this commit, it's using
write_string_file("/proc/self/oom_score_adj", t, 0);

After this commit, it's using
write_string_file("/proc/self/oom_score_adj", t, 
WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);

I think just removing WRITE_STRING_FILE_DISABLE_BUFFER is enough.

The problem occurred on musl but not glibc. I guess it's some 
implementation details in musl and glibc that make this difference. As I 
don't see any runtime problem without this patch for glibc, this patch 
is marked as 'musl specific'.

>> 2. PACKAGECONFIG and Dependency Changes
>> * Add a new PACKAGECONFIG item 'gshadow'. Enable it by default for glibc
>>    but disable it by default for musl. This is because musl does not provide
>>    gshadow.h.
> OK
>
>> * Add a new PACKAGECONFIG item 'portabled'. Default to disable it because
>>    it's still experimental, according to the announcement letter.
>>    """
>>    Currently, the support is still experimental, but this is expected to
>>    change soon. Reflecting this experimental state, the "portablectl" binary
>>    is not installed into /usr/bin yet.
>>    """
>>
>> * Change 'kmod' from a hard dependency to a PACKAGECONFIG item. Default
>>    to enable it.
>>
>> * Change 'acl' from a hard dependency to a PACKAGECONFIG item. Default
>>    to enable it.
>>
>> * Remove 'readline' from DEPENDS. systemd does not need it.
>>
>> * Remove 'libcgroup' from DEPENDS. The dependency on libcgroup has been
>>    removed from systemd a long time ago. We now remove this unnecessary
>>    dependency from DEPENDS.
>>
>> 3. update-alternatives changes
>>    The utilities like shutdown, poweroff, etc. are now created as symlinks
>>    at do_install. So there's no need to use update-alternatives mechanism
>>    anymore to create the symlinks now. In addtion, I don't think we now
>>    support multiple init systems at one running system, so there's really
>>    no need to use update-alternatives mechanism here.
>>
>>    Also update the FILES_${PN} to include these files to avoid QA issue.
>>
>> 4. SRC_URI Change
>>    I've put all musl specific patches to SRC_URI_MUSL and they will only
>>    be applied when TCLIBC is musl. The reason I do this is that systemd
>>    upstream has been rejected non-glibc fixes for a long time and it will
>>    continue to reject non-glibc fixes. A typical reply is like "please
>>    work with the other libcs to provide glibc compatibility." Please see
>>    an example in this link below.
>>    https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg40130.html
>>
> Specifiying them under a separate variable is good however applying them
> conditionally is going to cause maintenance issues. It also makes it
> hard to keep the argument going with systemd devs since we do no longer
> test them with glibc. So lets drop the conditional applying of these
> patches.

I've done some serious thinking on this issue. I finally come to a very 
different view here.

The current status is that systemd community is not going to accept 
non-glibc fixes.
IMHO, I don't think some arguments are enough to make systemd community 
change its mind.
So as far as I can see, this status will last for a long time.

If we do unconditional apply of these musl patches, we are giving glibc 
systemd images patches that 1) fix no error and 2) are not likely to be 
accepted by systemd upstream.
I don't think this should be the default behavior.

For you concern, these musl patches could work with glibc. I've done 
build and runtime testing to confirm it.

Having said that, it's more important for me to push things forward 
instead of insisting on some default value.

*So if other people also require unconditional apply of these musl 
patches, let's do it.*

But for now, I'd suggest we don't apply musl patches in case of glibc.

Best Regards,
Chen Qi


>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-core/systemd/systemd.inc              |   2 +-
>>   ...rt_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch |  34 --
>>   ...ck-protector-flags-to-workaround-musl-bui.patch |  28 +-
>>   ...nv-when-secure-versions-are-not-available.patch |  10 +-
>>   ...-install-dependency-links-at-install-tim.patch} |  22 +-
>>   ....c-Change-the-default-device-timeout-to-2.patch |  19 +-
>>   ...=> 0002-don-t-use-glibc-specific-qsort_r.patch} | 108 +++++-
>>   ...per-instead-of-looking-for-relative-opti.patch} |  16 +-
>>   ...n_t-is-glibc-specific-use-raw-signature-.patch} |  25 +-
>>   ...003-implment-systemd-sysv-install-for-OE.patch} |  10 +-
>>   ...lback-parse_printf_format-implementation.patch} |  49 +--
>>   ...patch => 0004-rules-whitelist-hd-devices.patch} |   8 +-
>>   ...-Make-root-s-home-directory-configurable.patch} |  34 +-
>>   ...clude-gshadow-only-if-ENABLE_GSHADOW-is-1.patch |  29 ++
>>   ...> 0006-remove-nobody-user-group-checking.patch} |  40 +--
>>   ...sic-missing.h-check-for-missing-strndupa.patch} |  66 ++--
>>   ...patch => 0007-Include-netinet-if_ether.h.patch} |  51 +--
>>   ...evert-rules-remove-firmware-loading-rules.patch |  28 --
>>   ...es-watch-metadata-changes-in-ide-devices.patch} |   6 +-
>>   ...e-nss-tests-if-nss-systemd-is-not-enable.patch} |  16 +-
>>   ...-remove-userspace-firmware-loading-suppor.patch | 377 ---------------------
>>   ...f-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} |  86 +++--
>>   ...=> 0009-add-missing-FTW_-macros-for-musl.patch} |  12 +-
>>   ...es-Build-conditionally-when-ENABLE_MYHOS.patch} |  10 +-
>>   .../0009-remove-duplicate-include-uchar.h.patch    |  41 ---
>>   .../0010-check-for-uchar.h-in-meson.build.patch    |  45 ---
>>   ...l-don-t-fail-if-libc-doesn-t-support-IDN.patch} |  17 +-
>>   ...ssing.h-check-for-missing-__compar_fn_t-.patch} |  23 +-
>>   ...of-__register_atfork-for-non-glibc-build.patch} |  18 +-
>>   ...> 0013-Use-uintmax_t-for-handling-rlim_t.patch} |  33 +-
>>   ...ULONG_LONG_MAX-definition-in-case-of-mus.patch} |  12 +-
>>   ...xdecoct.c-Include-missing.h-for-strndupa.patch} |  12 +-
>>   ...c-Disable-tests-for-missing-typedefs-in-.patch} |  14 +-
>>   ...ss-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} |  20 +-
>>   ...-compatible-basename-for-non-glibc-syste.patch} |  11 +-
>>   ...-check-for-missing-canonicalize_file_name.patch |  47 ---
>>   ...ble-buffering-when-writing-to-oom_score_a.patch |  39 +++
>>   ...PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch |  43 ---
>>   meta/recipes-core/systemd/systemd/0032-memfd.patch | 272 ---------------
>>   ...cros-rename-noreturn-into-_noreturn_-8456.patch | 203 -----------
>>   ...truncation-compile-failure-by-typecasting.patch | 173 ----------
>>   ...ix-build-with-gcc8-Werror-format-truncati.patch |  53 ---
>>   meta/recipes-core/systemd/systemd/libmount.patch   |  75 ----
>>   .../systemd/{systemd_237.bb => systemd_239.bb}     | 124 +++----
>>   44 files changed, 559 insertions(+), 1802 deletions(-)
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>>   rename meta/recipes-core/systemd/systemd/{0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (83%)
>>   rename meta/recipes-core/systemd/systemd/{0022-don-t-use-glibc-specific-qsort_r.patch => 0002-don-t-use-glibc-specific-qsort_r.patch} (52%)
>>   rename meta/recipes-core/systemd/systemd/{0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch => 0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch} (83%)
>>   rename meta/recipes-core/systemd/systemd/{0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch => 0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch} (47%)
>>   rename meta/recipes-core/systemd/systemd/{0004-implment-systemd-sysv-install-for-OE.patch => 0003-implment-systemd-sysv-install-for-OE.patch} (86%)
>>   rename meta/recipes-core/systemd/systemd/{0013-add-fallback-parse_printf_format-implementation.patch => 0004-add-fallback-parse_printf_format-implementation.patch} (93%)
>>   rename meta/recipes-core/systemd/systemd/{0005-rules-whitelist-hd-devices.patch => 0004-rules-whitelist-hd-devices.patch} (89%)
>>   rename meta/recipes-core/systemd/systemd/{0006-Make-root-s-home-directory-configurable.patch => 0005-Make-root-s-home-directory-configurable.patch} (70%)
>>   create mode 100644 meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>>   rename meta/recipes-core/systemd/systemd/{0027-remove-nobody-user-group-checking.patch => 0006-remove-nobody-user-group-checking.patch} (40%)
>>   rename meta/recipes-core/systemd/systemd/{0014-src-basic-missing.h-check-for-missing-strndupa.patch => 0006-src-basic-missing.h-check-for-missing-strndupa.patch} (73%)
>>   rename meta/recipes-core/systemd/systemd/{0017-Include-netinet-if_ether.h.patch => 0007-Include-netinet-if_ether.h.patch} (68%)
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
>>   rename meta/recipes-core/systemd/systemd/{0012-rules-watch-metadata-changes-in-ide-devices.patch => 0007-rules-watch-metadata-changes-in-ide-devices.patch} (92%)
>>   rename meta/recipes-core/systemd/systemd/{0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch => 0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch} (60%)
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>>   rename meta/recipes-core/systemd/systemd/{0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch => 0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch} (67%)
>>   rename meta/recipes-core/systemd/systemd/{0028-add-missing-FTW_-macros-for-musl.patch => 0009-add-missing-FTW_-macros-for-musl.patch} (79%)
>>   rename meta/recipes-core/systemd/systemd/{0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch => 0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch} (84%)
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>>   rename meta/recipes-core/systemd/systemd/{0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch => 0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch} (68%)
>>   rename meta/recipes-core/systemd/systemd/{0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch => 0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch} (63%)
>>   rename meta/recipes-core/systemd/systemd/{0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch => 0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch} (75%)
>>   rename meta/recipes-core/systemd/systemd/{0026-Use-uintmax_t-for-handling-rlim_t.patch => 0013-Use-uintmax_t-for-handling-rlim_t.patch} (77%)
>>   rename meta/recipes-core/systemd/systemd/{0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch => 0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch} (66%)
>>   rename meta/recipes-core/systemd/systemd/{0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch => 0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch} (70%)
>>   rename meta/recipes-core/systemd/systemd/{0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch => 0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch} (73%)
>>   rename meta/recipes-core/systemd/systemd/{0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch => 0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch} (89%)
>>   rename meta/recipes-core/systemd/systemd/{0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch => 0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch} (78%)
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
>>   create mode 100644 meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0032-memfd.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>>   delete mode 100644 meta/recipes-core/systemd/systemd/libmount.patch
>>   rename meta/recipes-core/systemd/{systemd_237.bb => systemd_239.bb} (86%)
>>
>> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
>> index 5fa48e7a..736e0a0 100644
>> --- a/meta/recipes-core/systemd/systemd.inc
>> +++ b/meta/recipes-core/systemd/systemd.inc
>> @@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
>>   LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>>                       file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>>   
>> -SRCREV = "46659f7deb962f55c728e70597e37c2a3ab6326d"
>> +SRCREV = "de7436b02badc82200dc127ff190b8155769b8e7"
>>   
>>   SRC_URI = "git://github.com/systemd/systemd.git;protocol=git"
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch b/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>> deleted file mode 100644
>> index 2cffc42..0000000
>> --- a/meta/recipes-core/systemd/systemd/0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From 687a5af8dc5d38f918a6ce08fed5297234bf8346 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 2 Mar 2018 18:00:17 -0800
>> -Subject: [PATCH] Hide __start_BUS_ERROR_MAP and __stop_BUS_ERROR_MAP
>> -
>> -for currently unknown reasons they get exported to the shared libries
>> -even without being listed in the sym file
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> -
>> -Upstream-Status: Pending [ Conditional on master needing this, 234 does need it ]
>> -
>> - src/libsystemd/sd-bus/bus-error.c | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/src/libsystemd/sd-bus/bus-error.c b/src/libsystemd/sd-bus/bus-error.c
>> -index 378f7a377..49d797abd 100644
>> ---- a/src/libsystemd/sd-bus/bus-error.c
>> -+++ b/src/libsystemd/sd-bus/bus-error.c
>> -@@ -71,8 +71,8 @@ BUS_ERROR_MAP_ELF_REGISTER const sd_bus_error_map bus_standard_errors[] = {
>> - };
>> -
>> - /* GCC maps this magically to the beginning and end of the BUS_ERROR_MAP section */
>> --extern const sd_bus_error_map __start_BUS_ERROR_MAP[];
>> --extern const sd_bus_error_map __stop_BUS_ERROR_MAP[];
>> -+extern const sd_bus_error_map __start_BUS_ERROR_MAP[] _hidden_;
>> -+extern const sd_bus_error_map __stop_BUS_ERROR_MAP[] _hidden_;
>> -
>> - /* Additional maps registered with sd_bus_error_add_map() are in this
>> -  * NULL terminated array */
>> ---
>> -2.16.2
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>> index e913e3f..d745800 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>> +++ b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
>> @@ -1,6 +1,6 @@
>> -From e361f6b4aefae57efff7e457df8db4d1067bec23 Mon Sep 17 00:00:00 2001
>> +From 9e3816bcaa36e1a11647ca0cf4f8044449c77fe0 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Wed, 28 Feb 2018 21:50:23 -0800
>> +Date: Mon, 2 Jul 2018 15:28:22 +0800
>>   Subject: [PATCH] Remove fstack-protector flags to workaround musl build
>>   
>>   Remove fstack-protector and fstack-protector-strong flags to fix
>> @@ -8,7 +8,7 @@ the following build failure for qemux86 and qemuppc with musl.
>>   
>>     undefined reference to `__stack_chk_fail_local'
>>   
>> -Upstream-Status: Inappropriate [OE Specific]
>> +Upstream-Status: Inappropriate [musl Specific]
>>   
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> @@ -16,18 +16,18 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 2 deletions(-)
>>   
>>   diff --git a/meson.build b/meson.build
>> -index 7610ab12b..591b9cbab 100644
>> +index f432ea072..a734a295c 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -329,8 +329,6 @@ foreach arg : ['-Wextra',
>> -                '-fdiagnostics-show-option',
>> -                '-fno-strict-aliasing',
>> -                '-fvisibility=hidden',
>> --               '-fstack-protector',
>> --               '-fstack-protector-strong',
>> -                '--param=ssp-buffer-size=4',
>> -               ]
>> -         if cc.has_argument(arg)
>> +@@ -333,8 +333,6 @@ possible_cc_flags = [
>> +         '-fdiagnostics-show-option',
>> +         '-fno-strict-aliasing',
>> +         '-fvisibility=hidden',
>> +-        '-fstack-protector',
>> +-        '-fstack-protector-strong',
>> +         '--param=ssp-buffer-size=4',
>> + ]
>> +
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>> index f4c15e1..03f6ead 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>> +++ b/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch
>> @@ -1,7 +1,7 @@
>> -From b1192a6e171413291d9d64fafc04773c6bbc9cab Mon Sep 17 00:00:00 2001
>> +From 6dd136512896979feb6883a16226d640a7e5ca74 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>>   Date: Fri, 23 Feb 2018 10:04:48 +0800
>> -Subject: [PATCH 01/31] Use getenv when secure versions are not available
>> +Subject: [PATCH 01/19] Use getenv when secure versions are not available
>>   
>>   musl doesnt implement secure version, so we default
>>   to it if configure does not detect a secure implementation
>> @@ -16,10 +16,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/src/basic/missing.h b/src/basic/missing.h
>> -index 1280e6c41..39c1fb700 100644
>> +index 71a07d057..0e33abb9f 100644
>>   --- a/src/basic/missing.h
>>   +++ b/src/basic/missing.h
>> -@@ -605,7 +605,7 @@ struct btrfs_ioctl_quota_ctl_args {
>> +@@ -592,7 +592,7 @@ struct btrfs_ioctl_quota_ctl_args {
>>    #  if HAVE___SECURE_GETENV
>>    #    define secure_getenv __secure_getenv
>>    #  else
>> @@ -29,5 +29,5 @@ index 1280e6c41..39c1fb700 100644
>>    #endif
>>    
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> similarity index 83%
>> rename from meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> rename to meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> index c3f4b39..e24e7f8 100644
>> --- a/meta/recipes-core/systemd/systemd/0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
>> @@ -1,7 +1,7 @@
>> -From c93eb6cdec03f5e243e59e95dc49273fcb90e7c1 Mon Sep 17 00:00:00 2001
>> +From 87dd61be2e28e78ce4f9f173794812e6c2d904d1 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Fri, 23 Feb 2018 10:23:40 +0800
>> -Subject: [PATCH 02/31] binfmt: Don't install dependency links at install time
>> +Date: Wed, 27 Jun 2018 16:01:22 +0800
>> +Subject: [PATCH 1/9] binfmt: Don't install dependency links at install time
>>    for the binfmt services
>>   
>>   use [Install] blocks so that they get created when the service is enabled
>> @@ -23,10 +23,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    3 files changed, 9 insertions(+), 4 deletions(-)
>>   
>>   diff --git a/units/meson.build b/units/meson.build
>> -index 814ee7885..49ace0d0f 100644
>> +index e4ac6ced6..698734e44 100644
>>   --- a/units/meson.build
>>   +++ b/units/meson.build
>> -@@ -60,8 +60,7 @@ units = [
>> +@@ -46,8 +46,7 @@ units = [
>>            ['poweroff.target',                     '',
>>             'runlevel0.target'],
>>            ['printer.target',                      ''],
>> @@ -36,7 +36,7 @@ index 814ee7885..49ace0d0f 100644
>>            ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
>>            ['reboot.target',                       '',
>>             'runlevel6.target ctrl-alt-del.target'],
>> -@@ -144,8 +143,7 @@ in_units = [
>> +@@ -130,8 +129,7 @@ in_units = [
>>            ['systemd-ask-password-console.service', ''],
>>            ['systemd-ask-password-wall.service',    ''],
>>            ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
>> @@ -58,18 +58,18 @@ index 30a6bc991..4231f3b70 100644
>>   +[Install]
>>   +WantedBy=sysinit.target
>>   diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
>> -index df9396d89..0687f4648 100644
>> +index e940c7c9a..6be7f5cc9 100644
>>   --- a/units/systemd-binfmt.service.in
>>   +++ b/units/systemd-binfmt.service.in
>> -@@ -13,6 +13,7 @@ Documentation=man:systemd-binfmt.service(8) man:binfmt.d(5)
>> - Documentation=https://www.kernel.org/doc/Documentation/binfmt_misc.txt
>> +@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
>> + Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>>    DefaultDependencies=no
>>    Conflicts=shutdown.target
>>   +Wants=proc-sys-fs-binfmt_misc.automount
>>    After=proc-sys-fs-binfmt_misc.automount
>>    Before=sysinit.target shutdown.target
>>    ConditionPathIsReadWrite=/proc/sys/
>> -@@ -27,3 +28,6 @@ Type=oneshot
>> +@@ -28,3 +29,6 @@ Type=oneshot
>>    RemainAfterExit=yes
>>    ExecStart=@rootlibexecdir@/systemd-binfmt
>>    TimeoutSec=90s
>> @@ -77,5 +77,5 @@ index df9396d89..0687f4648 100644
>>   +[Install]
>>   +WantedBy=sysinit.target
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
>> index 98c8362..fd7bf3f 100644
>> --- a/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
>> +++ b/meta/recipes-core/systemd/systemd/0001-core-device.c-Change-the-default-device-timeout-to-2.patch
>> @@ -1,7 +1,9 @@
>> -From 7844e070745611a52e355b73e7890f360dd540d0 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 14 Dec 2015 04:09:19 +0000
>> +From 2925c0c3b6ce4056622b86c1c61ee14add430790 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Thu, 28 Jun 2018 10:56:29 +0800
>>   Subject: [PATCH] core/device.c: Change the default device timeout to 240 sec.
>> + MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
>> + Content-Transfer-Encoding: 8bit
>>   MIME-Version: 1.0
>>   Content-Type: text/plain; charset=UTF-8
>>   Content-Transfer-Encoding: 8bit
>> @@ -10,16 +12,16 @@ Upstream-Status: Inappropriate [Specific case QEMU/AB]
>>   
>>   Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>>    src/core/device.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/src/core/device.c b/src/core/device.c
>> -index a43664d3b..4b16a8aec 100644
>> +index a2d00a0fb..f26e55ebb 100644
>>   --- a/src/core/device.c
>>   +++ b/src/core/device.c
>> -@@ -113,7 +113,7 @@ static void device_init(Unit *u) {
>> +@@ -95,7 +95,7 @@ static void device_init(Unit *u) {
>>             * indefinitely for plugged in devices, something which cannot
>>             * happen for the other units since their operations time out
>>             * anyway. */
>> @@ -27,4 +29,7 @@ index a43664d3b..4b16a8aec 100644
>>   +        u->job_running_timeout = (240 * USEC_PER_SEC);
>>    
>>            u->ignore_on_isolate = true;
>> - }
>> +
>> +--
>> +2.11.0
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-qsort_r.patch b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
>> similarity index 52%
>> rename from meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-qsort_r.patch
>> rename to meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
>> index a5f7442..f07211b 100644
>> --- a/meta/recipes-core/systemd/systemd/0022-don-t-use-glibc-specific-qsort_r.patch
>> +++ b/meta/recipes-core/systemd/systemd/0002-don-t-use-glibc-specific-qsort_r.patch
>> @@ -1,21 +1,99 @@
>> -From d343757d629402c70ca8e5eaa551deaf175c96f3 Mon Sep 17 00:00:00 2001
>> +From d43faf6d253db789225b7c454c8f255fbc68857e Mon Sep 17 00:00:00 2001
>>   From: Emil Renner Berthing <systemd@esmil.dk>
>>   Date: Thu, 18 Sep 2014 15:24:56 +0200
>> -Subject: [PATCH 22/31] don't use glibc-specific qsort_r
>> +Subject: [PATCH 02/19] don't use glibc-specific qsort_r
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   ---
>> - src/hwdb/hwdb.c         | 18 +++++++++++-------
>> - src/udev/udevadm-hwdb.c | 16 ++++++++++------
>> - 2 files changed, 21 insertions(+), 13 deletions(-)
>> + src/basic/format-table.c | 27 ++++++++++++++++-----------
>> + src/basic/util.h         |  7 -------
>> + src/hwdb/hwdb.c          | 18 +++++++++++-------
>> + src/udev/udevadm-hwdb.c  | 16 ++++++++++------
>> + 4 files changed, 37 insertions(+), 31 deletions(-)
>>   
>> +diff --git a/src/basic/format-table.c b/src/basic/format-table.c
>> +index 94e796d1c..f7b4eade9 100644
>> +--- a/src/basic/format-table.c
>> ++++ b/src/basic/format-table.c
>> +@@ -745,29 +745,29 @@ static int cell_data_compare(TableData *a, size_t index_a, TableData *b, size_t
>> +         return 0;
>> + }
>> +
>> +-static int table_data_compare(const void *x, const void *y, void *userdata) {
>> ++static Table *user_table;
>> ++static int table_data_compare(const void *x, const void *y) {
>> +         const size_t *a = x, *b = y;
>> +-        Table *t = userdata;
>> +         size_t i;
>> +         int r;
>> +
>> +-        assert(t);
>> +-        assert(t->sort_map);
>> ++        assert(user_table);
>> ++        assert(user_table->sort_map);
>> +
>> +         /* Make sure the header stays at the beginning */
>> +-        if (*a < t->n_columns && *b < t->n_columns)
>> ++        if (*a < user_table->n_columns && *b < user_table->n_columns)
>> +                 return 0;
>> +-        if (*a < t->n_columns)
>> ++        if (*a < user_table->n_columns)
>> +                 return -1;
>> +-        if (*b < t->n_columns)
>> ++        if (*b < user_table->n_columns)
>> +                 return 1;
>> +
>> +         /* Order other lines by the sorting map */
>> +-        for (i = 0; i < t->n_sort_map; i++) {
>> ++        for (i = 0; i < user_table->n_sort_map; i++) {
>> +                 TableData *d, *dd;
>> +
>> +-                d = t->data[*a + t->sort_map[i]];
>> +-                dd = t->data[*b + t->sort_map[i]];
>> ++                d = user_table->data[*a + user_table->sort_map[i]];
>> ++                dd = user_table->data[*b + user_table->sort_map[i]];
>> +
>> +                 r = cell_data_compare(d, *a, dd, *b);
>> +                 if (r != 0)
>> +@@ -960,7 +960,12 @@ int table_print(Table *t, FILE *f) {
>> +                 for (i = 0; i < n_rows; i++)
>> +                         sorted[i] = i * t->n_columns;
>> +
>> +-                qsort_r_safe(sorted, n_rows, sizeof(size_t), table_data_compare, t);
>> ++                if (n_rows <= 1)
>> ++                        return;
>> ++                assert(sorted);
>> ++                user_table = t;
>> ++                qsort(sorted, n_rows, sizeof(size_t), table_data_compare);
>> ++                user_table = NULL;
>> +         }
>> +
>> +         if (t->display_map)
>> +diff --git a/src/basic/util.h b/src/basic/util.h
>> +index 9699d228f..40eaf518c 100644
>> +--- a/src/basic/util.h
>> ++++ b/src/basic/util.h
>> +@@ -105,13 +105,6 @@ static inline void qsort_safe(void *base, size_t nmemb, size_t size, comparison_
>> +                 qsort_safe((p), (n), sizeof((p)[0]), (__compar_fn_t) _func_); \
>> +         })
>> +
>> +-static inline void qsort_r_safe(void *base, size_t nmemb, size_t size, int (*compar)(const void*, const void*, void*), void *userdata) {
>> +-        if (nmemb <= 1)
>> +-                return;
>> +-
>> +-        assert(base);
>> +-        qsort_r(base, nmemb, size, compar, userdata);
>> +-}
>> +
>> + /**
>> +  * Normal memcpy requires src to be nonnull. We do nothing if n is 0.
>>   diff --git a/src/hwdb/hwdb.c b/src/hwdb/hwdb.c
>> -index 4540260f9..81aca7a9b 100644
>> +index 317cad8a6..701d59a1e 100644
>>   --- a/src/hwdb/hwdb.c
>>   +++ b/src/hwdb/hwdb.c
>> -@@ -152,13 +152,12 @@ static void trie_free(struct trie *trie) {
>> +@@ -135,13 +135,12 @@ static void trie_free(struct trie *trie) {
>>    
>>    DEFINE_TRIVIAL_CLEANUP_FUNC(struct trie*, trie_free);
>>    
>> @@ -33,7 +111,7 @@ index 4540260f9..81aca7a9b 100644
>>    }
>>    
>>    static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>> -@@ -183,7 +182,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>> +@@ -166,7 +165,10 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>>                            .value_off = v,
>>                    };
>>    
>> @@ -45,7 +123,7 @@ index 4540260f9..81aca7a9b 100644
>>                    if (val) {
>>                            /* At this point we have 2 identical properties on the same match-string.
>>                             * Since we process files in order, we just replace the previous value.
>> -@@ -208,7 +210,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>> +@@ -191,7 +193,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>>            node->values[node->values_count].file_priority = file_priority;
>>            node->values[node->values_count].line_number = line_number;
>>            node->values_count++;
>> @@ -57,10 +135,10 @@ index 4540260f9..81aca7a9b 100644
>>    }
>>    
>>   diff --git a/src/udev/udevadm-hwdb.c b/src/udev/udevadm-hwdb.c
>> -index ab5dc7ab6..c777e30ab 100644
>> +index 02408a428..491d367d1 100644
>>   --- a/src/udev/udevadm-hwdb.c
>>   +++ b/src/udev/udevadm-hwdb.c
>> -@@ -130,13 +130,13 @@ static void trie_node_cleanup(struct trie_node *node) {
>> +@@ -114,13 +114,13 @@ static void trie_node_cleanup(struct trie_node *node) {
>>            free(node);
>>    }
>>    
>> @@ -78,7 +156,7 @@ index ab5dc7ab6..c777e30ab 100644
>>    }
>>    
>>    static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>> -@@ -157,7 +157,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>> +@@ -141,7 +141,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>>                            .value_off = v,
>>                    };
>>    
>> @@ -89,7 +167,7 @@ index ab5dc7ab6..c777e30ab 100644
>>                    if (val) {
>>                            /* replace existing earlier key with new value */
>>                            val->value_off = v;
>> -@@ -174,7 +176,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>> +@@ -158,7 +160,9 @@ static int trie_node_add_value(struct trie *trie, struct trie_node *node,
>>            node->values[node->values_count].key_off = k;
>>            node->values[node->values_count].value_off = v;
>>            node->values_count++;
>> @@ -101,5 +179,5 @@ index ab5dc7ab6..c777e30ab 100644
>>    }
>>    
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> similarity index 83%
>> rename from meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> rename to meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> index 28f1b21..1d7f523 100644
>> --- a/meta/recipes-core/systemd/systemd/0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> +++ b/meta/recipes-core/systemd/systemd/0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch
>> @@ -1,8 +1,8 @@
>> -From 8b9d194e956848e0d1fb35ef2fba714b2691ebe6 Mon Sep 17 00:00:00 2001
>> +From 6e62be87a2722fbe531310a1b052c1301bdf06fb Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Wed, 28 Feb 2018 20:47:49 -0800
>> -Subject: [PATCH 03/31] use lnr wrapper instead of looking for --relative
>> - option for ln
>> +Date: Wed, 27 Jun 2018 16:09:24 +0800
>> +Subject: [PATCH 2/9] use lnr wrapper instead of looking for --relative option
>> + for ln
>>   
>>   Remove file manually to avoid the 'File Exists' error when creating
>>   symlink. This is because the original 'ln' command uses '-f' option.
>> @@ -18,15 +18,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    3 files changed, 8 insertions(+), 6 deletions(-)
>>   
>>   diff --git a/meson.build b/meson.build
>> -index 36a62d280..7347ea880 100644
>> +index 04331dd41..6d5edcb4e 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -570,10 +570,6 @@ endforeach
>> +@@ -558,10 +558,6 @@ endforeach
>>    
>>    conf.set_quoted('TELINIT', get_option('telinit-path'))
>>    
>>   -if run_command('ln', '--relative', '--help').returncode() != 0
>> --        error('ln does not support --relative')
>> +-        error('ln does not support --relative (added in coreutils 8.16)')
>>   -endif
>>   -
>>    ############################################################
>> @@ -60,5 +60,5 @@ index 70f7172ae..a42666aac 100755
>>   +        lnr "$unitpath" "$dir"
>>   +fi
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>> similarity index 47%
>> rename from meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>> rename to meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>> index fe7e623..115fb33 100644
>> --- a/meta/recipes-core/systemd/systemd/0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
>> @@ -1,23 +1,32 @@
>> -From 76c71aa889155f29be1d5d2b74a2c4faa5909c8c Mon Sep 17 00:00:00 2001
>> +From e965e748c7030df0709e63128db2f023540a06ba Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>>   Date: Sat, 12 Sep 2015 18:53:31 +0000
>> -Subject: [PATCH 24/31] comparison_fn_t is glibc specific, use raw signature in
>> +Subject: [PATCH 03/19] comparison_fn_t is glibc specific, use raw signature in
>>    function pointer
>>   
>>   make it work with musl where comparison_fn_t is not provided
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   ---
>> - src/basic/util.h | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> + src/basic/util.h | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>>   
>>   diff --git a/src/basic/util.h b/src/basic/util.h
>> -index 9d1b10756..12db53a93 100644
>> +index 40eaf518c..c58392397 100644
>>   --- a/src/basic/util.h
>>   +++ b/src/basic/util.h
>> -@@ -95,7 +95,7 @@ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
>> +@@ -77,7 +77,7 @@ void *xbsearch_r(const void *key, const void *base, size_t nmemb, size_t size,
>> +  * that only if nmemb > 0.
>> +  */
>> + static inline void* bsearch_safe(const void *key, const void *base,
>> +-                                 size_t nmemb, size_t size, comparison_fn_t compar) {
>> ++                                 size_t nmemb, size_t size, int (*compar)(const void *, const void *)) {
>> +         if (nmemb <= 0)
>> +                 return NULL;
>> +
>> +@@ -89,7 +89,7 @@ static inline void* bsearch_safe(const void *key, const void *base,
>>     * Normal qsort requires base to be nonnull. Here were require
>>     * that only if nmemb > 0.
>>     */
>> @@ -27,5 +36,5 @@ index 9d1b10756..12db53a93 100644
>>                    return;
>>    
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
>> similarity index 86%
>> rename from meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
>> rename to meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
>> index 83fdb53..6c595ae 100644
>> --- a/meta/recipes-core/systemd/systemd/0004-implment-systemd-sysv-install-for-OE.patch
>> +++ b/meta/recipes-core/systemd/systemd/0003-implment-systemd-sysv-install-for-OE.patch
>> @@ -1,7 +1,7 @@
>> -From 70d456fb21de2a80697fa364f08475339d6396c1 Mon Sep 17 00:00:00 2001
>> +From 0fcb6e646401205e17cc6c129441a49023c62cef Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>>   Date: Sat, 5 Sep 2015 06:31:47 +0000
>> -Subject: [PATCH 04/31] implment systemd-sysv-install for OE
>> +Subject: [PATCH 3/9] implment systemd-sysv-install for OE
>>   
>>   Use update-rc.d for enabling/disabling and status command
>>   to check the status of the sysv service
>> @@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>   
>>   diff --git a/src/systemctl/systemd-sysv-install.SKELETON b/src/systemctl/systemd-sysv-install.SKELETON
>> -index a53a3e622..5d877b06e 100755
>> +index 8c16cf999..9f078a121 100755
>>   --- a/src/systemctl/systemd-sysv-install.SKELETON
>>   +++ b/src/systemctl/systemd-sysv-install.SKELETON
>> -@@ -30,17 +30,17 @@ case "$1" in
>> +@@ -32,17 +32,17 @@ case "$1" in
>>        enable)
>>            # call the command to enable SysV init script $NAME here
>>            # (consider optional $ROOT)
>> @@ -39,5 +39,5 @@ index a53a3e622..5d877b06e 100755
>>        *)
>>            usage ;;
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
>> similarity index 93%
>> rename from meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
>> rename to meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
>> index 9c9278d..7652a2d 100644
>> --- a/meta/recipes-core/systemd/systemd/0013-add-fallback-parse_printf_format-implementation.patch
>> +++ b/meta/recipes-core/systemd/systemd/0004-add-fallback-parse_printf_format-implementation.patch
>> @@ -1,29 +1,29 @@
>> -From 580d23cf0b32e36a8fb96710336ffef432b3c7ce Mon Sep 17 00:00:00 2001
>> +From 582af7ec13131dfcc620ed81de7b211914c4cb03 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Wed, 28 Feb 2018 21:10:58 -0800
>> -Subject: [PATCH] add fallback parse_printf_format implementation
>> +Date: Fri, 29 Jun 2018 13:43:49 +0800
>> +Subject: [PATCH 04/19] add fallback parse_printf_format implementation
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>>    meson.build                     |   1 +
>> - src/basic/meson.build           |   4 +
>> + src/basic/meson.build           |   5 +
>>    src/basic/parse-printf-format.c | 273 ++++++++++++++++++++++++++++++++++++++++
>>    src/basic/parse-printf-format.h |  57 +++++++++
>>    src/basic/stdio-util.h          |   2 +-
>>    src/journal/journal-send.c      |   2 +-
>> - 6 files changed, 337 insertions(+), 2 deletions(-)
>> + 6 files changed, 338 insertions(+), 2 deletions(-)
>>    create mode 100644 src/basic/parse-printf-format.c
>>    create mode 100644 src/basic/parse-printf-format.h
>>   
>>   diff --git a/meson.build b/meson.build
>> -index 94a16712b..4eabaafe8 100644
>> +index e045b9224..8c16bc979 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -620,6 +620,7 @@ foreach header : ['crypt.h',
>> +@@ -598,6 +598,7 @@ foreach header : ['crypt.h',
>>                      'linux/btrfs.h',
>>                      'linux/memfd.h',
>>                      'linux/vm_sockets.h',
>> @@ -32,20 +32,21 @@ index 94a16712b..4eabaafe8 100644
>>                      'valgrind/memcheck.h',
>>                      'valgrind/valgrind.h',
>>   diff --git a/src/basic/meson.build b/src/basic/meson.build
>> -index 44cd31ecb..435c6ee02 100644
>> +index 31625b178..0c27528e7 100644
>>   --- a/src/basic/meson.build
>>   +++ b/src/basic/meson.build
>> -@@ -310,6 +310,10 @@ endforeach
>> +@@ -302,6 +302,11 @@ foreach item : [['af',     af_list_txt,     'af',         ''],
>> + endforeach
>>    
>>    basic_sources += [missing_h] + generated_gperf_headers
>> -
>> ++
>>   +if conf.get('HAVE_PRINTF_H') != 1
>>   +        basic_sources += [files('parse-printf-format.c')]
>>   +endif
>>   +
>> - libbasic = static_library(
>> -         'basic',
>> -         basic_sources,
>> + basic_gcrypt_sources = files(
>> +         'gcrypt-util.c',
>> +         'gcrypt-util.h')
>>   diff --git a/src/basic/parse-printf-format.c b/src/basic/parse-printf-format.c
>>   new file mode 100644
>>   index 000000000..49437e544
>> @@ -389,12 +390,12 @@ index 000000000..47be7522d
>>   +
>>   +#endif /* HAVE_PRINTF_H */
>>   diff --git a/src/basic/stdio-util.h b/src/basic/stdio-util.h
>> -index dbfafba26..8038380d6 100644
>> +index 73c03274c..30192cd71 100644
>>   --- a/src/basic/stdio-util.h
>>   +++ b/src/basic/stdio-util.h
>> -@@ -20,12 +20,12 @@
>> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
>> - ***/
>> +@@ -1,12 +1,12 @@
>> + /* SPDX-License-Identifier: LGPL-2.1+ */
>> + #pragma once
>>    
>>   -#include <printf.h>
>>    #include <stdarg.h>
>> @@ -404,13 +405,13 @@ index dbfafba26..8038380d6 100644
>>    #include "macro.h"
>>   +#include "parse-printf-format.h"
>>    
>> - #define xsprintf(buf, fmt, ...) \
>> -         assert_message_se((size_t) snprintf(buf, ELEMENTSOF(buf), fmt, __VA_ARGS__) < ELEMENTSOF(buf), "xsprintf: " #buf "[] must be big enough")
>> + #define snprintf_ok(buf, len, fmt, ...) \
>> +         ((size_t) snprintf(buf, len, fmt, __VA_ARGS__) < (len))
>>   diff --git a/src/journal/journal-send.c b/src/journal/journal-send.c
>> -index 73329ba02..70bb9e0e8 100644
>> +index a0621524a..65bcbcd2e 100644
>>   --- a/src/journal/journal-send.c
>>   +++ b/src/journal/journal-send.c
>> -@@ -20,7 +20,6 @@
>> +@@ -2,7 +2,6 @@
>>    
>>    #include <errno.h>
>>    #include <fcntl.h>
>> @@ -418,7 +419,7 @@ index 73329ba02..70bb9e0e8 100644
>>    #include <stddef.h>
>>    #include <sys/socket.h>
>>    #include <sys/un.h>
>> -@@ -39,6 +38,7 @@
>> +@@ -21,6 +20,7 @@
>>    #include "stdio-util.h"
>>    #include "string-util.h"
>>    #include "util.h"
>> @@ -427,5 +428,5 @@ index 73329ba02..70bb9e0e8 100644
>>    #define SNDBUF_SIZE (8*1024*1024)
>>    
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
>> similarity index 89%
>> rename from meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
>> rename to meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
>> index e4421c8..7e37cbc 100644
>> --- a/meta/recipes-core/systemd/systemd/0005-rules-whitelist-hd-devices.patch
>> +++ b/meta/recipes-core/systemd/systemd/0004-rules-whitelist-hd-devices.patch
>> @@ -1,7 +1,7 @@
>> -From 7b5b34993002b4418ba8a3c2ae661a7337fd8ed0 Mon Sep 17 00:00:00 2001
>> +From 5d8128f3832fd11fd046d1d1ad86c4ee7bc1dff0 Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>>   Date: Wed, 9 Nov 2016 19:41:13 -0800
>> -Subject: [PATCH 05/31] rules: whitelist hd* devices
>> +Subject: [PATCH 4/9] rules: whitelist hd* devices
>>   
>>   qemu by default emulates IDE and the linux-yocto kernel(s) use
>>   CONFIG_IDE instead of the more modern libsata, so disks appear as
>> @@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
>> -index 0de8cf3a1..d3f58f153 100644
>> +index 8ddb7577c..811e948ad 100644
>>   --- a/rules/60-persistent-storage.rules
>>   +++ b/rules/60-persistent-storage.rules
>>   @@ -7,7 +7,7 @@ ACTION=="remove", GOTO="persistent_storage_end"
>> @@ -29,5 +29,5 @@ index 0de8cf3a1..d3f58f153 100644
>>    # ignore partitions that span the entire disk
>>    TEST=="whole_disk", GOTO="persistent_storage_end"
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch
>> similarity index 70%
>> rename from meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>> rename to meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch
>> index 5ba9661..c137087 100644
>> --- a/meta/recipes-core/systemd/systemd/0006-Make-root-s-home-directory-configurable.patch
>> +++ b/meta/recipes-core/systemd/systemd/0005-Make-root-s-home-directory-configurable.patch
>> @@ -1,7 +1,7 @@
>> -From 9d63227420f0c4f093c1c2066eafe2b6152070cf Mon Sep 17 00:00:00 2001
>> +From 8b82663aeeedf9ca58e3b97116b4c4da5229e0f5 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Fri, 23 Feb 2018 13:47:37 +0800
>> -Subject: [PATCH 06/31] Make root's home directory configurable
>> +Date: Wed, 27 Jun 2018 16:46:45 +0800
>> +Subject: [PATCH 5/9] Make root's home directory configurable
>>   
>>   OpenEmbedded has a configurable home directory for root. Allow
>>   systemd to be built using its idea of what root's home directory
>> @@ -16,15 +16,15 @@ Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> - meson.build       | 8 ++++++++
>> + meson.build       | 7 +++++++
>>    meson_options.txt | 2 ++
>> - 2 files changed, 10 insertions(+)
>> + 2 files changed, 9 insertions(+)
>>   
>>   diff --git a/meson.build b/meson.build
>> -index 7347ea880..918101d6b 100644
>> +index 6d5edcb4e..323146fe1 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -94,6 +94,11 @@ if rootlibdir == ''
>> +@@ -89,6 +89,11 @@ if rootlibdir == ''
>>            rootlibdir = join_paths(rootprefixdir, libdir.split('/')[-1])
>>    endif
>>    
>> @@ -36,7 +36,7 @@ index 7347ea880..918101d6b 100644
>>    # Dirs of external packages
>>    pkgconfigdatadir = join_paths(datadir, 'pkgconfig')
>>    pkgconfiglibdir = join_paths(libdir, 'pkgconfig')
>> -@@ -205,6 +210,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                             udevlibexecdir)
>> +@@ -210,6 +215,7 @@ conf.set_quoted('UDEVLIBEXECDIR',                             udevlibexecdir)
>>    conf.set_quoted('POLKIT_AGENT_BINARY_PATH',                   join_paths(bindir, 'pkttyagent'))
>>    conf.set_quoted('LIBDIR',                                     libdir)
>>    conf.set_quoted('ROOTLIBDIR',                                 rootlibdir)
>> @@ -44,7 +44,7 @@ index 7347ea880..918101d6b 100644
>>    conf.set_quoted('ROOTLIBEXECDIR',                             rootlibexecdir)
>>    conf.set_quoted('BOOTLIBDIR',                                 bootlibdir)
>>    conf.set_quoted('SYSTEMD_PULL_PATH',                          join_paths(rootlibexecdir, 'systemd-pull'))
>> -@@ -221,6 +227,7 @@ substs.set('prefix',                                          prefixdir)
>> +@@ -228,6 +234,7 @@ substs.set('prefix',                                          prefixdir)
>>    substs.set('exec_prefix',                                     prefixdir)
>>    substs.set('libdir',                                          libdir)
>>    substs.set('rootlibdir',                                      rootlibdir)
>> @@ -52,19 +52,11 @@ index 7347ea880..918101d6b 100644
>>    substs.set('includedir',                                      includedir)
>>    substs.set('pkgsysconfdir',                                   pkgsysconfdir)
>>    substs.set('bindir',                                          bindir)
>> -@@ -2705,6 +2712,7 @@ status = [
>> -         'include directory:                 @0@'.format(includedir),
>> -         'lib directory:                     @0@'.format(libdir),
>> -         'rootlib directory:                 @0@'.format(rootlibdir),
>> -+        'roothome directory:                @0@'.format(roothomedir),
>> -         'SysV init scripts:                 @0@'.format(sysvinit_path),
>> -         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path),
>> -         'PAM modules directory:             @0@'.format(pamlibdir),
>>   diff --git a/meson_options.txt b/meson_options.txt
>> -index 39822d6cd..0b24f0e0f 100644
>> +index 16c1f2b2f..aa9a33368 100644
>>   --- a/meson_options.txt
>>   +++ b/meson_options.txt
>> -@@ -22,6 +22,8 @@ option('rootlibdir', type : 'string',
>> +@@ -9,6 +9,8 @@ option('rootlibdir', type : 'string',
>>           description : '''[/usr]/lib/x86_64-linux-gnu or such''')
>>    option('rootprefix', type : 'string',
>>           description : '''override the root prefix''')
>> @@ -72,7 +64,7 @@ index 39822d6cd..0b24f0e0f 100644
>>   +       description : '''override the root home directory''')
>>    option('link-udev-shared', type : 'boolean',
>>           description : 'link systemd-udev and its helpers to libsystemd-shared.so')
>> -
>> + option('link-systemctl-shared', type: 'boolean',
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch b/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>> new file mode 100644
>> index 0000000..6d5faf5
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>> @@ -0,0 +1,29 @@
>> +From a2c4d46944892174930135672508389a04e191f0 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Fri, 29 Jun 2018 13:53:29 +0800
>> +Subject: [PATCH 05/19] include gshadow only if ENABLE_GSHADOW is 1
>> +
>> +Upstream-Status: Inappropriate [musl]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + src/basic/user-util.h | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/src/basic/user-util.h b/src/basic/user-util.h
>> +index b74f16885..f9c1e29c4 100644
>> +--- a/src/basic/user-util.h
>> ++++ b/src/basic/user-util.h
>> +@@ -2,7 +2,9 @@
>> + #pragma once
>> +
>> + #include <grp.h>
>> ++#if ENABLE_GSHADOW
>> + #include <gshadow.h>
>> ++#endif
>> + #include <pwd.h>
>> + #include <shadow.h>
>> + #include <stdbool.h>
>> +--
>> +2.11.0
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch b/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch
>> similarity index 40%
>> rename from meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
>> rename to meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch
>> index 42f59b0..eb6eb8b 100644
>> --- a/meta/recipes-core/systemd/systemd/0027-remove-nobody-user-group-checking.patch
>> +++ b/meta/recipes-core/systemd/systemd/0006-remove-nobody-user-group-checking.patch
>> @@ -1,7 +1,7 @@
>> -From 5354eb767d1eba2ec41eb273f6b657f4a630ca8a Mon Sep 17 00:00:00 2001
>> +From 5199ae5dec9b8a9c9e20477d5090f1732735fbe2 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Tue, 9 Jan 2018 14:45:46 +0800
>> -Subject: [PATCH 27/31] remove nobody user/group checking
>> +Date: Thu, 28 Jun 2018 09:38:12 +0800
>> +Subject: [PATCH 6/9] remove nobody user/group checking
>>   
>>   Upstream-Status: Inappropriate [OE Specific]
>>   
>> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 37 deletions(-)
>>   
>>   diff --git a/meson.build b/meson.build
>> -index f6515e97c..1b947adac 100644
>> +index 323146fe1..3bb087fef 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -700,43 +700,6 @@ substs.set('containeruidbasemax', container_uid_base_max)
>> +@@ -681,43 +681,6 @@ substs.set('containeruidbasemax', container_uid_base_max)
>>    nobody_user = get_option('nobody-user')
>>    nobody_group = get_option('nobody-group')
>>    
>> @@ -22,18 +22,18 @@ index f6515e97c..1b947adac 100644
>>   -if getent_result.returncode() == 0
>>   -        name = getent_result.stdout().split(':')[0]
>>   -        if name != nobody_user
>> --                message('WARNING:\n' +
>> --                        '        The local user with the UID 65534 does not match the configured user name "@0@" of the nobody user (its name is @1@).\n'.format(nobody_user, name) +
>> --                        '        Your build will result in an user table setup that is incompatible with the local system.')
>> +-                warning('\n' +
>> +-                        'The local user with the UID 65534 does not match the configured user name "@0@" of the nobody user (its name is @1@).\n'.format(nobody_user, name) +
>> +-                        'Your build will result in an user table setup that is incompatible with the local system.')
>>   -        endif
>>   -endif
>>   -id_result = run_command('id', '-u', nobody_user)
>>   -if id_result.returncode() == 0
>>   -        id = id_result.stdout().to_int()
>>   -        if id != 65534
>> --                message('WARNING:\n' +
>> --                        '        The local user with the configured user name "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.format(nobody_user, id) +
>> --                        '        Your build will result in an user table setup that is incompatible with the local system.')
>> +-                warning('\n' +
>> +-                        'The local user with the configured user name "@0@" of the nobody user does not have UID 65534 (it has @1@).\n'.format(nobody_user, id) +
>> +-                        'Your build will result in an user table setup that is incompatible with the local system.')
>>   -        endif
>>   -endif
>>   -
>> @@ -41,23 +41,23 @@ index f6515e97c..1b947adac 100644
>>   -if getent_result.returncode() == 0
>>   -        name = getent_result.stdout().split(':')[0]
>>   -        if name != nobody_group
>> --                message('WARNING:\n' +
>> --                        '        The local group with the GID 65534 does not match the configured group name "@0@" of the nobody group (its name is @1@).\n'.format(nobody_group, name) +
>> --                        '        Your build will result in an group table setup that is incompatible with the local system.')
>> +-                warning('\n' +
>> +-                        'The local group with the GID 65534 does not match the configured group name "@0@" of the nobody group (its name is @1@).\n'.format(nobody_group, name) +
>> +-                        'Your build will result in an group table setup that is incompatible with the local system.')
>>   -        endif
>>   -endif
>>   -id_result = run_command('id', '-g', nobody_group)
>>   -if id_result.returncode() == 0
>>   -        id = id_result.stdout().to_int()
>>   -        if id != 65534
>> --                message('WARNING:\n' +
>> --                        '        The local group with the configured group name "@0@" of the nobody group does not have UID 65534 (it has @1@).\n'.format(nobody_group, id) +
>> --                        '        Your build will result in an group table setup that is incompatible with the local system.')
>> +-                warning('\n' +
>> +-                        'The local group with the configured group name "@0@" of the nobody group does not have UID 65534 (it has @1@).\n'.format(nobody_group, id) +
>> +-                        'Your build will result in an group table setup that is incompatible with the local system.')
>>   -        endif
>>   -endif
>>    if nobody_user != nobody_group and not (nobody_user == 'nobody' and nobody_group == 'nogroup')
>> -         message('WARNING:\n' +
>> -                 '        The configured user name "@0@" and group name "@0@" of the nobody user/group are not equivalent.\n'.format(nobody_user, nobody_group) +
>> +         warning('\n' +
>> +                 'The configured user name "@0@" and group name "@0@" of the nobody user/group are not equivalent.\n'.format(nobody_user, nobody_group) +
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-for-missing-strndupa.patch
>> similarity index 73%
>> rename from meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
>> rename to meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-for-missing-strndupa.patch
>> index 9f62cbb..107a794 100644
>> --- a/meta/recipes-core/systemd/systemd/0014-src-basic-missing.h-check-for-missing-strndupa.patch
>> +++ b/meta/recipes-core/systemd/systemd/0006-src-basic-missing.h-check-for-missing-strndupa.patch
>> @@ -1,11 +1,11 @@
>> -From 33be9052315cc4ec8e929fa238e1f0cc0161ad07 Mon Sep 17 00:00:00 2001
>> +From 03fd19fc87573276e0d359260c8fe591f5f0216a Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Wed, 28 Feb 2018 21:15:28 -0800
>> -Subject: [PATCH] src/basic/missing.h: check for missing strndupa
>> +Date: Fri, 29 Jun 2018 16:34:50 +0800
>> +Subject: [PATCH 06/19] src/basic/missing.h: check for missing strndupa
>>   
>>   include missing.h  for definition of strndupa
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> @@ -13,29 +13,29 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    meson.build             |  1 +
>>    src/basic/missing.h     | 11 +++++++++++
>>    src/basic/mkdir.c       |  1 +
>> + src/basic/pager.c       |  1 +
>>    src/basic/parse-util.c  |  1 +
>>    src/basic/procfs-util.c |  1 +
>> - src/shared/pager.c      |  1 +
>>    src/shared/uid-range.c  |  1 +
>>    7 files changed, 17 insertions(+)
>>   
>>   diff --git a/meson.build b/meson.build
>> -index 4eabaafe8..12811b3f3 100644
>> +index 8c16bc979..a734a295c 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -525,6 +525,7 @@ foreach ident : [
>> -         ['bpf',               '''#include <sys/syscall.h>
>> +@@ -503,6 +503,7 @@ foreach ident : [
>>                                     #include <unistd.h>'''],
>>            ['explicit_bzero' ,   '''#include <string.h>'''],
>> +         ['reallocarray',      '''#include <malloc.h>'''],
>>   +        ['strndupa' ,         '''#include <string.h>'''],
>>    ]
>>    
>>            have = cc.has_function(ident[0], prefix : ident[1], args : '-D_GNU_SOURCE')
>>   diff --git a/src/basic/missing.h b/src/basic/missing.h
>> -index 84d6d9167..07a8c8364 100644
>> +index 0e33abb9f..02397f1b6 100644
>>   --- a/src/basic/missing.h
>>   +++ b/src/basic/missing.h
>> -@@ -1187,6 +1187,17 @@ struct input_mask {
>> +@@ -1184,6 +1184,17 @@ struct input_mask {
>>    typedef int32_t key_serial_t;
>>    #endif
>>    
>> @@ -54,22 +54,34 @@ index 84d6d9167..07a8c8364 100644
>>    #define KEYCTL_JOIN_SESSION_KEYRING 1
>>    #endif
>>   diff --git a/src/basic/mkdir.c b/src/basic/mkdir.c
>> -index de4746c86..d51518a5a 100644
>> +index 6ab1b4422..77c3e0863 100644
>>   --- a/src/basic/mkdir.c
>>   +++ b/src/basic/mkdir.c
>> -@@ -30,6 +30,7 @@
>> - #include "path-util.h"
>> +@@ -13,6 +13,7 @@
>>    #include "stat-util.h"
>> + #include "stdio-util.h"
>>    #include "user-util.h"
>>   +#include "missing.h"
>>    
>> - int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, bool follow_symlink, mkdir_func_t _mkdir) {
>> + int mkdir_safe_internal(const char *path, mode_t mode, uid_t uid, gid_t gid, MkdirFlags flags, mkdir_func_t _mkdir) {
>>            struct stat st;
>> +diff --git a/src/basic/pager.c b/src/basic/pager.c
>> +index f24126111..8223bff02 100644
>> +--- a/src/basic/pager.c
>> ++++ b/src/basic/pager.c
>> +@@ -21,6 +21,7 @@
>> + #include "string-util.h"
>> + #include "strv.h"
>> + #include "terminal-util.h"
>> ++#include "missing.h"
>> +
>> + static pid_t pager_pid = 0;
>> +
>>   diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
>> -index 2c22753de..97533721d 100644
>> +index 6becf8587..52576f536 100644
>>   --- a/src/basic/parse-util.c
>>   +++ b/src/basic/parse-util.c
>> -@@ -33,6 +33,7 @@
>> +@@ -17,6 +17,7 @@
>>    #include "parse-util.h"
>>    #include "process-util.h"
>>    #include "string-util.h"
>> @@ -78,10 +90,10 @@ index 2c22753de..97533721d 100644
>>    int parse_boolean(const char *v) {
>>            assert(v);
>>   diff --git a/src/basic/procfs-util.c b/src/basic/procfs-util.c
>> -index 9bb42cc7b..23bbd9e67 100644
>> +index a159e344b..ebc427d6b 100644
>>   --- a/src/basic/procfs-util.c
>>   +++ b/src/basic/procfs-util.c
>> -@@ -9,6 +9,7 @@
>> +@@ -11,6 +11,7 @@
>>    #include "procfs-util.h"
>>    #include "stdio-util.h"
>>    #include "string-util.h"
>> @@ -89,23 +101,11 @@ index 9bb42cc7b..23bbd9e67 100644
>>    
>>    int procfs_tasks_get_limit(uint64_t *ret) {
>>            _cleanup_free_ char *value = NULL;
>> -diff --git a/src/shared/pager.c b/src/shared/pager.c
>> -index 75db3c985..84f06bf7d 100644
>> ---- a/src/shared/pager.c
>> -+++ b/src/shared/pager.c
>> -@@ -39,6 +39,7 @@
>> - #include "string-util.h"
>> - #include "strv.h"
>> - #include "terminal-util.h"
>> -+#include "missing.h"
>> -
>> - static pid_t pager_pid = 0;
>> -
>>   diff --git a/src/shared/uid-range.c b/src/shared/uid-range.c
>> -index c38b7cc98..8ec6bf08d 100644
>> +index 434ce6ff4..37093ab7b 100644
>>   --- a/src/shared/uid-range.c
>>   +++ b/src/shared/uid-range.c
>> -@@ -25,6 +25,7 @@
>> +@@ -8,6 +8,7 @@
>>    #include "macro.h"
>>    #include "uid-range.h"
>>    #include "user-util.h"
>> @@ -114,5 +114,5 @@ index c38b7cc98..8ec6bf08d 100644
>>    static bool uid_range_intersect(UidRange *range, uid_t start, uid_t nr) {
>>            assert(range);
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch b/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h.patch
>> similarity index 68%
>> rename from meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
>> rename to meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h.patch
>> index a09cfdd..2df8cf9 100644
>> --- a/meta/recipes-core/systemd/systemd/0017-Include-netinet-if_ether.h.patch
>> +++ b/meta/recipes-core/systemd/systemd/0007-Include-netinet-if_ether.h.patch
>> @@ -1,14 +1,14 @@
>> -From f2b0173cd9807864db1ef3b102abaa76ef37e506 Mon Sep 17 00:00:00 2001
>> +From aab90d0dfa934d33879eaec1a878e93b201d33f1 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Wed, 28 Feb 2018 21:19:12 -0800
>> -Subject: [PATCH 17/31] Include netinet/if_ether.h
>> +Date: Fri, 29 Jun 2018 16:44:43 +0800
>> +Subject: [PATCH 07/19] Include netinet/if_ether.h
>>   
>>   Fixes
>>   /path/to/systemd/recipe-sysroot/usr/include/netinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
>>    struct ethhdr {
>>           ^~~~~~
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> @@ -17,14 +17,15 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    src/network/netdev/tuntap.c               | 1 +
>>    src/network/networkd-brvlan.c             | 1 +
>>    src/udev/net/ethtool-util.c               | 1 +
>> + src/udev/net/ethtool-util.h               | 1 +
>>    src/udev/udev-builtin-net_setup_link.c    | 1 +
>> - 5 files changed, 5 insertions(+)
>> + 6 files changed, 6 insertions(+)
>>   
>>   diff --git a/src/libsystemd/sd-netlink/netlink-types.c b/src/libsystemd/sd-netlink/netlink-types.c
>> -index 0ee7d6f0d..ef75893a6 100644
>> +index c93fe9cb4..2013d06e1 100644
>>   --- a/src/libsystemd/sd-netlink/netlink-types.c
>>   +++ b/src/libsystemd/sd-netlink/netlink-types.c
>> -@@ -21,6 +21,7 @@
>> +@@ -3,6 +3,7 @@
>>    #include <netinet/in.h>
>>    #include <stdint.h>
>>    #include <sys/socket.h>
>> @@ -33,10 +34,10 @@ index 0ee7d6f0d..ef75893a6 100644
>>    #include <linux/rtnetlink.h>
>>    #include <linux/genetlink.h>
>>   diff --git a/src/network/netdev/tuntap.c b/src/network/netdev/tuntap.c
>> -index 4fc9b610a..628c61c57 100644
>> +index 21fb7ab06..0afe5170c 100644
>>   --- a/src/network/netdev/tuntap.c
>>   +++ b/src/network/netdev/tuntap.c
>> -@@ -20,6 +20,7 @@
>> +@@ -2,6 +2,7 @@
>>    
>>    #include <errno.h>
>>    #include <fcntl.h>
>> @@ -45,10 +46,10 @@ index 4fc9b610a..628c61c57 100644
>>    #include <net/if.h>
>>    #include <netinet/if_ether.h>
>>   diff --git a/src/network/networkd-brvlan.c b/src/network/networkd-brvlan.c
>> -index 99dd41629..90407c9d8 100644
>> +index 8e8a618e2..52d523a67 100644
>>   --- a/src/network/networkd-brvlan.c
>>   +++ b/src/network/networkd-brvlan.c
>> -@@ -19,6 +19,7 @@
>> +@@ -4,6 +4,7 @@
>>    ***/
>>    
>>    #include <netinet/in.h>
>> @@ -57,29 +58,39 @@ index 99dd41629..90407c9d8 100644
>>    #include <stdbool.h>
>>    
>>   diff --git a/src/udev/net/ethtool-util.c b/src/udev/net/ethtool-util.c
>> -index 9bdaef8d9..948f89cf8 100644
>> +index 4bb4216ac..5f7383483 100644
>>   --- a/src/udev/net/ethtool-util.c
>>   +++ b/src/udev/net/ethtool-util.c
>> -@@ -18,6 +18,7 @@
>> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
>> - ***/
>> +@@ -1,5 +1,6 @@
>> + /* SPDX-License-Identifier: LGPL-2.1+ */
>>    
>>   +#include <netinet/if_ether.h>
>>    #include <net/if.h>
>>    #include <sys/ioctl.h>
>>    #include <linux/ethtool.h>
>> +diff --git a/src/udev/net/ethtool-util.h b/src/udev/net/ethtool-util.h
>> +index 064bf4d2b..ee0d4fb2a 100644
>> +--- a/src/udev/net/ethtool-util.h
>> ++++ b/src/udev/net/ethtool-util.h
>> +@@ -3,6 +3,7 @@
>> +
>> +
>> + #include <macro.h>
>> ++#include <netinet/if_ether.h>
>> + #include <linux/ethtool.h>
>> +
>> + #include "missing.h"
>>   diff --git a/src/udev/udev-builtin-net_setup_link.c b/src/udev/udev-builtin-net_setup_link.c
>> -index 40158e0af..b24b3fce8 100644
>> +index 8bed6399a..a3a96959b 100644
>>   --- a/src/udev/udev-builtin-net_setup_link.c
>>   +++ b/src/udev/udev-builtin-net_setup_link.c
>> -@@ -18,6 +18,7 @@
>> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
>> - ***/
>> +@@ -1,5 +1,6 @@
>> + /* SPDX-License-Identifier: LGPL-2.1+ */
>>    
>>   +#include <netinet/if_ether.h>
>>    #include "alloc-util.h"
>>    #include "link-config.h"
>>    #include "log.h"
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
>> deleted file mode 100644
>> index bb12d30..0000000
>> --- a/meta/recipes-core/systemd/systemd/0007-Revert-rules-remove-firmware-loading-rules.patch
>> +++ /dev/null
>> @@ -1,28 +0,0 @@
>> -From 35d6d384e83ac38077603611bb791969ef95fe68 Mon Sep 17 00:00:00 2001
>> -From: Jonathan Liu <net147@gmail.com>
>> -Date: Thu, 19 Mar 2015 15:01:29 +1100
>> -Subject: [PATCH 07/31] Revert "rules: remove firmware loading rules"
>> -
>> -This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
>> -Userspace firmware loading support is needed for Linux < 3.7.
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -
>> -Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ----
>> - rules/50-firmware.rules | 3 +++
>> - 1 file changed, 3 insertions(+)
>> - create mode 100644 rules/50-firmware.rules
>> -
>> -diff --git a/rules/50-firmware.rules b/rules/50-firmware.rules
>> -new file mode 100644
>> -index 000000000..f0ae68451
>> ---- /dev/null
>> -+++ b/rules/50-firmware.rules
>> -@@ -0,0 +1,3 @@
>> -+# do not edit this file, it will be overwritten on update
>> -+
>> -+SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
>> ---
>> -2.13.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-changes-in-ide-devices.patch
>> similarity index 92%
>> rename from meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
>> rename to meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-changes-in-ide-devices.patch
>> index 7207863..a5f65e6 100644
>> --- a/meta/recipes-core/systemd/systemd/0012-rules-watch-metadata-changes-in-ide-devices.patch
>> +++ b/meta/recipes-core/systemd/systemd/0007-rules-watch-metadata-changes-in-ide-devices.patch
>> @@ -1,7 +1,7 @@
>> -From 406a4c8692316e8c7e14c78f9a802689be304a95 Mon Sep 17 00:00:00 2001
>> +From 9302b72e5e69512aaa7106197b00c55baeb35b3c Mon Sep 17 00:00:00 2001
>>   From: Hongxu Jia <hongxu.jia@windriver.com>
>>   Date: Fri, 17 Nov 2017 09:46:00 +0800
>> -Subject: [PATCH 12/31] rules: watch metadata changes in ide devices
>> +Subject: [PATCH 7/9] rules: watch metadata changes in ide devices
>>   
>>   Formatting IDE storage does not trigger "change" uevents. As a result
>>   clients using udev API don't get any updates afterwards and get outdated
>> @@ -39,5 +39,5 @@ index 343fc06f8..b5237dac4 100644
>>   -ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
>>   +ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>> similarity index 60%
>> rename from meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>> rename to meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>> index 16b21a0..abecdc7 100644
>> --- a/meta/recipes-core/systemd/systemd/0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>> +++ b/meta/recipes-core/systemd/systemd/0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch
>> @@ -1,7 +1,7 @@
>> -From f5f313915d78bc43eb96e2aafb8ce3cda304c277 Mon Sep 17 00:00:00 2001
>> +From b6ba596fd1313a162cdc2eb88161dcf24d19ede7 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Mon, 26 Feb 2018 17:27:56 +0800
>> -Subject: [PATCH 19/31] Do not enable nss tests if nss-systemd is not enabled
>> +Date: Thu, 28 Jun 2018 10:10:02 +0800
>> +Subject: [PATCH 8/9] Do not enable nss tests if nss-systemd is not enabled
>>   
>>   Upstream-Status: Pending
>>   
>> @@ -12,18 +12,18 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>   
>>   diff --git a/src/test/meson.build b/src/test/meson.build
>> -index 1db8aa107..df3a1f5c5 100644
>> +index 7da7e3a22..7b7c257ff 100644
>>   --- a/src/test/meson.build
>>   +++ b/src/test/meson.build
>> -@@ -646,7 +646,7 @@ tests += [
>> +@@ -645,7 +645,7 @@ tests += [
>>            [['src/test/test-nss.c'],
>>             [],
>>             [libdl],
>>   -         '', 'manual'],
>>   +         'ENABLE_NSS_SYSTEMD', 'manual'],
>> - ]
>>    
>> - ############################################################
>> +         [['src/test/test-umount.c',
>> +           'src/core/mount-setup.c',
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>> deleted file mode 100644
>> index 15d7e02..0000000
>> --- a/meta/recipes-core/systemd/systemd/0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch
>> +++ /dev/null
>> @@ -1,377 +0,0 @@
>> -From 5cce7626f33e92f624ac06b613125813fb47d445 Mon Sep 17 00:00:00 2001
>> -From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Wed, 28 Feb 2018 21:05:39 -0800
>> -Subject: [PATCH 08/31] Revert "udev: remove userspace firmware loading
>> - support"
>> -
>> -This reverts commit be2ea723b1d023b3d385d3b791ee4607cbfb20ca.
>> -Userspace firmware loading support is needed for Linux < 3.7.
>> -
>> -Upstream-Status: Inappropriate [OE specific]
>> -
>> -Signed-off-by: Jonathan Liu <net147@gmail.com>
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ----
>> - README                           |   4 +-
>> - TODO                             |   1 +
>> - meson.build                      |   9 +++
>> - meson_options.txt                |   2 +
>> - rules/meson.build                |   4 +
>> - src/udev/meson.build             |   4 +
>> - src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
>> - src/udev/udev-builtin.c          |   3 +
>> - src/udev/udev.h                  |   6 ++
>> - src/udev/udevd.c                 |  12 +++
>> - 10 files changed, 197 insertions(+), 2 deletions(-)
>> - create mode 100644 src/udev/udev-builtin-firmware.c
>> -
>> -diff --git a/README b/README
>> -index 8807e5cfe..bfd7a35de 100644
>> ---- a/README
>> -+++ b/README
>> -@@ -58,8 +58,8 @@ REQUIREMENTS:
>> -         Legacy hotplug slows down the system and confuses udev:
>> -           CONFIG_UEVENT_HELPER_PATH=""
>> -
>> --        Userspace firmware loading is not supported and should
>> --        be disabled in the kernel:
>> -+        Userspace firmware loading is deprecated, will go away, and
>> -+        sometimes causes problems:
>> -           CONFIG_FW_LOADER_USER_HELPER=n
>> -
>> -         Some udev rules and virtualization detection relies on it:
>> -diff --git a/TODO b/TODO
>> -index a77028c7b..39e72d7ec 100644
>> ---- a/TODO
>> -+++ b/TODO
>> -@@ -783,6 +783,7 @@ Features:
>> - * initialize the hostname from the fs label of /, if /etc/hostname does not exist?
>> -
>> - * udev:
>> -+  - remove src/udev/udev-builtin-firmware.c (CONFIG_FW_LOADER_USER_HELPER=n)
>> -   - move to LGPL
>> -   - kill scsi_id
>> -   - add trigger --subsystem-match=usb/usb_device device
>> -diff --git a/meson.build b/meson.build
>> -index 918101d6b..9c25022a4 100644
>> ---- a/meson.build
>> -+++ b/meson.build
>> -@@ -72,6 +72,12 @@ conf.set10('HAVE_SYSV_COMPAT', have,
>> -            description : 'SysV init scripts and rcN.d links are supported')
>> - m4_defines += have ? ['-DHAVE_SYSV_COMPAT'] : []
>> -
>> -+firmware_path = get_option('firmware-path')
>> -+have = firmware_path != ''
>> -+conf.set10('HAVE_FIRMWARE', have,
>> -+           description : 'Userspace firmware loading is supported')
>> -+m4_defines += have ? ['-DHAVE_FIRMWARE'] : []
>> -+
>> - # join_paths ignore the preceding arguments if an absolute component is
>> - # encountered, so this should canonicalize various paths when they are
>> - # absolute or relative.
>> -@@ -178,6 +184,7 @@ conf.set_quoted('SYSTEM_CONFIG_UNIT_PATH',                    join_paths(pkgsysc
>> - conf.set_quoted('SYSTEM_DATA_UNIT_PATH',                      systemunitdir)
>> - conf.set_quoted('SYSTEM_SYSVINIT_PATH',                       sysvinit_path)
>> - conf.set_quoted('SYSTEM_SYSVRCND_PATH',                       sysvrcnd_path)
>> -+conf.set_quoted('FIRMWARE_PATH',                              firmware_path)
>> - conf.set_quoted('RC_LOCAL_SCRIPT_PATH_START',                 get_option('rc-local'))
>> - conf.set_quoted('RC_LOCAL_SCRIPT_PATH_STOP',                  get_option('halt-local'))
>> - conf.set_quoted('USER_CONFIG_UNIT_PATH',                      join_paths(pkgsysconfdir, 'user'))
>> -@@ -258,6 +265,7 @@ substs.set('SYSTEMCTL',                                       join_paths(rootbin
>> - substs.set('RANDOM_SEED',                                     join_paths(randomseeddir, 'random-seed'))
>> - substs.set('SYSTEM_SYSVINIT_PATH',                            sysvinit_path)
>> - substs.set('SYSTEM_SYSVRCND_PATH',                            sysvrcnd_path)
>> -+substs.set('FIRMWARE_PATH',                                   firmware_path)
>> - substs.set('RC_LOCAL_SCRIPT_PATH_START',                      get_option('rc-local'))
>> - substs.set('RC_LOCAL_SCRIPT_PATH_STOP',                       get_option('halt-local'))
>> -
>> -@@ -2715,6 +2723,7 @@ status = [
>> -         'roothome directory:                @0@'.format(roothomedir),
>> -         'SysV init scripts:                 @0@'.format(sysvinit_path),
>> -         'SysV rc?.d directories:            @0@'.format(sysvrcnd_path),
>> -+        'firmware path:                     @0@'.format(firmware_path),
>> -         'PAM modules directory:             @0@'.format(pamlibdir),
>> -         'PAM configuration directory:       @0@'.format(pamconfdir),
>> -         'RPM macros directory:              @0@'.format(rpmmacrosdir),
>> -diff --git a/meson_options.txt b/meson_options.txt
>> -index 0b24f0e0f..92d25fa35 100644
>> ---- a/meson_options.txt
>> -+++ b/meson_options.txt
>> -@@ -108,6 +108,8 @@ option('tmpfiles', type : 'boolean',
>> -        description : 'support for tmpfiles.d')
>> - option('importd', type : 'combo', choices : ['auto', 'true', 'false'],
>> -        description : 'install the systemd-importd daemon')
>> -+option('firmware-path', type : 'string', value : '',
>> -+       description : 'Firmware search path')
>> - option('hwdb', type : 'boolean',
>> -        description : 'support for the hardware database')
>> - option('rfkill', type : 'boolean',
>> -diff --git a/rules/meson.build b/rules/meson.build
>> -index e253b9f59..5eee5fbca 100644
>> ---- a/rules/meson.build
>> -+++ b/rules/meson.build
>> -@@ -41,6 +41,10 @@ rules = files('''
>> - install_data(rules,
>> -              install_dir : udevrulesdir)
>> -
>> -+if conf.get('HAVE_FIRMWARE') == 1
>> -+        install_data('50-firmware.rules', install_dir : udevrulesdir)
>> -+endif
>> -+
>> - all_rules = rules
>> -
>> - rules_in = '''
>> -diff --git a/src/udev/meson.build b/src/udev/meson.build
>> -index de2fd2d9c..b6b0ca006 100644
>> ---- a/src/udev/meson.build
>> -+++ b/src/udev/meson.build
>> -@@ -67,6 +67,10 @@ if conf.get('HAVE_ACL') == 1
>> -                                  sd_login_c]
>> - endif
>> -
>> -+if conf.get('HAVE_FIRMWARE') == 1
>> -+        libudev_core_sources += ['udev-builtin-firmware.c']
>> -+endif
>> -+
>> - ############################################################
>> -
>> - generate_keyboard_keys_list = find_program('generate-keyboard-keys-list.sh')
>> -diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
>> -new file mode 100644
>> -index 000000000..bd8c2fb96
>> ---- /dev/null
>> -+++ b/src/udev/udev-builtin-firmware.c
>> -@@ -0,0 +1,154 @@
>> -+/*
>> -+ * firmware - Kernel firmware loader
>> -+ *
>> -+ * Copyright (C) 2009 Piter Punk <piterpunk@slackware.com>
>> -+ * Copyright (C) 2009-2011 Kay Sievers <kay@vrfy.org>
>> -+ *
>> -+ * This program is free software; you can redistribute it and/or
>> -+ * modify it under the terms of the GNU General Public License as
>> -+ * published by the Free Software Foundation; either version 2 of the
>> -+ * License, or (at your option) any later version.
>> -+ *
>> -+ * This program is distributed in the hope that it will be useful, but
>> -+ * WITHOUT ANY WARRANTY; without even the implied warranty of
>> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> -+ * General Public License for more details:*
>> -+ */
>> -+
>> -+#include <unistd.h>
>> -+#include <stdlib.h>
>> -+#include <string.h>
>> -+#include <stdio.h>
>> -+#include <getopt.h>
>> -+#include <errno.h>
>> -+#include <stdbool.h>
>> -+#include <sys/utsname.h>
>> -+#include <sys/stat.h>
>> -+
>> -+#include "udev.h"
>> -+
>> -+static bool set_loading(struct udev *udev, char *loadpath, const char *state) {
>> -+        FILE *ldfile;
>> -+
>> -+        ldfile = fopen(loadpath, "we");
>> -+        if (ldfile == NULL) {
>> -+                log_error("error: can not open '%s'", loadpath);
>> -+                return false;
>> -+        };
>> -+        fprintf(ldfile, "%s\n", state);
>> -+        fclose(ldfile);
>> -+        return true;
>> -+}
>> -+
>> -+static bool copy_firmware(struct udev *udev, const char *source, const char *target, size_t size) {
>> -+        char *buf;
>> -+        FILE *fsource = NULL, *ftarget = NULL;
>> -+        bool ret = false;
>> -+
>> -+        buf = malloc(size);
>> -+        if (buf == NULL) {
>> -+                log_error("No memory available to load firmware file");
>> -+                return false;
>> -+        }
>> -+
>> -+        log_debug("writing '%s' (%zi) to '%s'", source, size, target);
>> -+
>> -+        fsource = fopen(source, "re");
>> -+        if (fsource == NULL)
>> -+                goto exit;
>> -+        ftarget = fopen(target, "we");
>> -+        if (ftarget == NULL)
>> -+                goto exit;
>> -+        if (fread(buf, size, 1, fsource) != 1)
>> -+                goto exit;
>> -+        if (fwrite(buf, size, 1, ftarget) == 1)
>> -+                ret = true;
>> -+exit:
>> -+        if (ftarget != NULL)
>> -+                fclose(ftarget);
>> -+        if (fsource != NULL)
>> -+                fclose(fsource);
>> -+        free(buf);
>> -+        return ret;
>> -+}
>> -+
>> -+static int builtin_firmware(struct udev_device *dev, int argc, char *argv[], bool test) {
>> -+        struct udev *udev = udev_device_get_udev(dev);
>> -+        static const char *searchpath[] = { FIRMWARE_PATH };
>> -+        char loadpath[UTIL_PATH_SIZE];
>> -+        char datapath[UTIL_PATH_SIZE];
>> -+        char fwpath[UTIL_PATH_SIZE];
>> -+        const char *firmware;
>> -+        FILE *fwfile = NULL;
>> -+        struct utsname kernel;
>> -+        struct stat statbuf;
>> -+        unsigned int i;
>> -+        int rc = EXIT_SUCCESS;
>> -+
>> -+        firmware = udev_device_get_property_value(dev, "FIRMWARE");
>> -+        if (firmware == NULL) {
>> -+                log_error("firmware parameter missing");
>> -+                rc = EXIT_FAILURE;
>> -+                goto exit;
>> -+        }
>> -+
>> -+        /* lookup firmware file */
>> -+        uname(&kernel);
>> -+        for (i = 0; i < ELEMENTSOF(searchpath); i++) {
>> -+                strscpyl(fwpath, sizeof(fwpath), searchpath[i], kernel.release, "/", firmware, NULL);
>> -+                fwfile = fopen(fwpath, "re");
>> -+                if (fwfile != NULL)
>> -+                        break;
>> -+
>> -+                strscpyl(fwpath, sizeof(fwpath), searchpath[i], firmware, NULL);
>> -+                fwfile = fopen(fwpath, "re");
>> -+                if (fwfile != NULL)
>> -+                        break;
>> -+        }
>> -+
>> -+        strscpyl(loadpath, sizeof(loadpath), udev_device_get_syspath(dev), "/loading", NULL);
>> -+
>> -+        if (fwfile == NULL) {
>> -+                log_debug("did not find firmware file '%s'", firmware);
>> -+                rc = EXIT_FAILURE;
>> -+                /*
>> -+                 * Do not cancel the request in the initrd, the real root might have
>> -+                 * the firmware file and the 'coldplug' run in the real root will find
>> -+                 * this pending request and fulfill or cancel it.
>> -+                 * */
>> -+                if (!in_initrd())
>> -+                        set_loading(udev, loadpath, "-1");
>> -+                goto exit;
>> -+        }
>> -+
>> -+        if (stat(fwpath, &statbuf) < 0 || statbuf.st_size == 0) {
>> -+                if (!in_initrd())
>> -+                        set_loading(udev, loadpath, "-1");
>> -+                rc = EXIT_FAILURE;
>> -+                goto exit;
>> -+        }
>> -+
>> -+        if (!set_loading(udev, loadpath, "1"))
>> -+                goto exit;
>> -+
>> -+        strscpyl(datapath, sizeof(datapath), udev_device_get_syspath(dev), "/data", NULL);
>> -+        if (!copy_firmware(udev, fwpath, datapath, statbuf.st_size)) {
>> -+                log_error("error sending firmware '%s' to device", firmware);
>> -+                set_loading(udev, loadpath, "-1");
>> -+                rc = EXIT_FAILURE;
>> -+                goto exit;
>> -+        };
>> -+
>> -+        set_loading(udev, loadpath, "0");
>> -+exit:
>> -+        if (fwfile)
>> -+                fclose(fwfile);
>> -+        return rc;
>> -+}
>> -+
>> -+const struct udev_builtin udev_builtin_firmware = {
>> -+        .name = "firmware",
>> -+        .cmd = builtin_firmware,
>> -+        .help = "kernel firmware loader",
>> -+        .run_once = true,
>> -+};
>> -diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
>> -index db2b6874f..ccd88638c 100644
>> ---- a/src/udev/udev-builtin.c
>> -+++ b/src/udev/udev-builtin.c
>> -@@ -32,6 +32,9 @@ static const struct udev_builtin *builtins[] = {
>> -         [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
>> - #endif
>> -         [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
>> -+#if HAVE_FIRMWARE
>> -+        [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
>> -+#endif
>> -         [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
>> -         [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
>> -         [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
>> -diff --git a/src/udev/udev.h b/src/udev/udev.h
>> -index ea11c2d29..c47dd3d88 100644
>> ---- a/src/udev/udev.h
>> -+++ b/src/udev/udev.h
>> -@@ -151,6 +151,9 @@ enum udev_builtin_cmd {
>> -         UDEV_BUILTIN_BLKID,
>> - #endif
>> -         UDEV_BUILTIN_BTRFS,
>> -+#if HAVE_FIRMWARE
>> -+        UDEV_BUILTIN_FIRMWARE,
>> -+#endif
>> -         UDEV_BUILTIN_HWDB,
>> -         UDEV_BUILTIN_INPUT_ID,
>> -         UDEV_BUILTIN_KEYBOARD,
>> -@@ -179,6 +182,9 @@ struct udev_builtin {
>> - extern const struct udev_builtin udev_builtin_blkid;
>> - #endif
>> - extern const struct udev_builtin udev_builtin_btrfs;
>> -+#if HAVE_FIRMWARE
>> -+extern const struct udev_builtin udev_builtin_firmware;
>> -+#endif
>> - extern const struct udev_builtin udev_builtin_hwdb;
>> - extern const struct udev_builtin udev_builtin_input_id;
>> - extern const struct udev_builtin udev_builtin_keyboard;
>> -diff --git a/src/udev/udevd.c b/src/udev/udevd.c
>> -index 5c757d513..2f3313007 100644
>> ---- a/src/udev/udevd.c
>> -+++ b/src/udev/udevd.c
>> -@@ -127,6 +127,9 @@ struct event {
>> -         bool is_block;
>> -         sd_event_source *timeout_warning;
>> -         sd_event_source *timeout;
>> -+#if HAVE_FIRMWARE
>> -+        bool nodelay;
>> -+#endif
>> - };
>> -
>> - static void event_queue_cleanup(Manager *manager, enum event_state type);
>> -@@ -609,6 +612,10 @@ static int event_queue_insert(Manager *manager, struct udev_device *dev) {
>> -         event->devnum = udev_device_get_devnum(dev);
>> -         event->is_block = streq("block", udev_device_get_subsystem(dev));
>> -         event->ifindex = udev_device_get_ifindex(dev);
>> -+#if HAVE_FIRMWARE
>> -+        if (streq(udev_device_get_subsystem(dev), "firmware"))
>> -+                event->nodelay = true;
>> -+#endif
>> -
>> -         log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
>> -              udev_device_get_action(dev), udev_device_get_subsystem(dev));
>> -@@ -692,6 +699,11 @@ static bool is_devpath_busy(Manager *manager, struct event *event) {
>> -                         return true;
>> -                 }
>> -
>> -+#if HAVE_FIRMWARE
>> -+                /* allow to bypass the dependency tracking */
>> -+                if (event->nodelay)
>> -+                        continue;
>> -+#endif
>> -                 /* parent device event found */
>> -                 if (event->devpath[common] == '/') {
>> -                         event->delaying_seqnum = loop_event->seqnum;
>> ---
>> -2.13.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch b/meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> similarity index 67%
>> rename from meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> rename to meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> index 4509476..bee5fb6 100644
>> --- a/meta/recipes-core/systemd/systemd/0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch
>> @@ -1,7 +1,7 @@
>> -From b45cf4923c7e1f1165925e9b4d7db2108faf2eae Mon Sep 17 00:00:00 2001
>> -From: Emil Renner Berthing <systemd@esmil.dk>
>> -Date: Mon, 23 Oct 2017 10:50:14 -0700
>> -Subject: [PATCH 15/31] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
>> +From 848e711d719a6d987bc7d14183e1c7b1f1c91c56 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Fri, 29 Jun 2018 17:10:29 +0800
>> +Subject: [PATCH 08/19] don't fail if GLOB_BRACE and GLOB_ALTDIRFUNC is not
>>    defined
>>   
>>   If the standard library doesn't provide brace
>> @@ -11,20 +11,21 @@ Dont use GNU GLOB extentions on non-glibc systems
>>   
>>   Conditionalize use of GLOB_ALTDIRFUNC
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> - src/basic/glob-util.c     | 20 +++++++++++++++++---
>> - src/test/test-glob-util.c | 17 +++++++++++++++--
>> - src/tmpfiles/tmpfiles.c   |  8 ++++++++
>> - 3 files changed, 40 insertions(+), 5 deletions(-)
>> + src/basic/glob-util.c     | 13 +++++++++++--
>> + src/test/test-glob-util.c | 15 +++++++++++++++
>> + src/tmpfiles/tmpfiles.c   | 10 ++++++++++
>> + 3 files changed, 36 insertions(+), 2 deletions(-)
>>   
>>   diff --git a/src/basic/glob-util.c b/src/basic/glob-util.c
>> -index 6e80a1e23..312bb3fd1 100644
>> +index 9fac676f2..8adb9559e 100644
>>   --- a/src/basic/glob-util.c
>>   +++ b/src/basic/glob-util.c
>> -@@ -28,13 +28,18 @@
>> +@@ -10,6 +10,11 @@
>>    #include "macro.h"
>>    #include "path-util.h"
>>    #include "strv.h"
>> @@ -34,17 +35,17 @@ index 6e80a1e23..312bb3fd1 100644
>>   +#define GLOB_BRACE 0
>>   +#endif
>>    
>> + static void closedir_wrapper(void* v) {
>> +         (void) closedir(v);
>> +@@ -18,6 +23,7 @@ static void closedir_wrapper(void* v) {
>>    int safe_glob(const char *path, int flags, glob_t *pglob) {
>>            int k;
>>    
>>   +#ifdef GLOB_ALTDIRFUNC
>>            /* We want to set GLOB_ALTDIRFUNC ourselves, don't allow it to be set. */
>>            assert(!(flags & GLOB_ALTDIRFUNC));
>> --
>> -         if (!pglob->gl_closedir)
>> -                 pglob->gl_closedir = (void (*)(void *)) closedir;
>> -         if (!pglob->gl_readdir)
>> -@@ -45,10 +50,13 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
>> +
>> +@@ -31,10 +37,13 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
>>                    pglob->gl_lstat = lstat;
>>            if (!pglob->gl_stat)
>>                    pglob->gl_stat = stat;
>> @@ -60,24 +61,11 @@ index 6e80a1e23..312bb3fd1 100644
>>            if (k == GLOB_NOMATCH)
>>                    return -ENOENT;
>>            if (k == GLOB_NOSPACE)
>> -@@ -61,6 +69,12 @@ int safe_glob(const char *path, int flags, glob_t *pglob) {
>> -         return 0;
>> - }
>> -
>> -+/* Don't fail if the standard library
>> -+ * doesn't provide brace expansion */
>> -+#ifndef GLOB_BRACE
>> -+#define GLOB_BRACE 0
>> -+#endif
>> -+
>> - int glob_exists(const char *path) {
>> -         _cleanup_globfree_ glob_t g = {};
>> -         int k;
>>   diff --git a/src/test/test-glob-util.c b/src/test/test-glob-util.c
>> -index bd2f8fcfd..a10c77427 100644
>> +index d78d6223c..f5943b26d 100644
>>   --- a/src/test/test-glob-util.c
>>   +++ b/src/test/test-glob-util.c
>> -@@ -30,6 +30,11 @@
>> +@@ -12,6 +12,11 @@
>>    #include "glob-util.h"
>>    #include "macro.h"
>>    #include "rm-rf.h"
>> @@ -89,23 +77,21 @@ index bd2f8fcfd..a10c77427 100644
>>    
>>    static void test_glob_exists(void) {
>>            char name[] = "/tmp/test-glob_exists.XXXXXX";
>> -@@ -52,25 +57,33 @@ static void test_glob_exists(void) {
>> - static void test_glob_no_dot(void) {
>> -         char template[] = "/tmp/test-glob-util.XXXXXXX";
>> +@@ -40,11 +45,13 @@ static void test_glob_no_dot(void) {
>>            const char *fn;
>> --
>> +
>>            _cleanup_globfree_ glob_t g = {
>>   +#ifdef GLOB_ALTDIRFUNC
>> -                 .gl_closedir = (void (*)(void *)) closedir,
>> +                 .gl_closedir = closedir_wrapper,
>>                    .gl_readdir = (struct dirent *(*)(void *)) readdir_no_dot,
>>                    .gl_opendir = (void *(*)(const char *)) opendir,
>>                    .gl_lstat = lstat,
>>                    .gl_stat = stat,
>>   +#endif
>>            };
>> --
>> -         int r;
>>    
>> +         int r;
>> +@@ -52,11 +59,19 @@ static void test_glob_no_dot(void) {
>>            assert_se(mkdtemp(template));
>>    
>>            fn = strjoina(template, "/*");
>> @@ -126,25 +112,35 @@ index bd2f8fcfd..a10c77427 100644
>>    
>>            (void) rm_rf(template, REMOVE_ROOT|REMOVE_PHYSICAL);
>>   diff --git a/src/tmpfiles/tmpfiles.c b/src/tmpfiles/tmpfiles.c
>> -index 38cbb739c..88cc543f0 100644
>> +index 927de35f3..5f0283da5 100644
>>   --- a/src/tmpfiles/tmpfiles.c
>>   +++ b/src/tmpfiles/tmpfiles.c
>> -@@ -76,6 +76,12 @@
>> - #include "umask-util.h"
>> +@@ -60,6 +60,12 @@
>>    #include "user-util.h"
>>    #include "util.h"
>> +
>>   +/* Don't fail if the standard library
>>   + * doesn't provide brace expansion */
>>   +#ifndef GLOB_BRACE
>>   +#define GLOB_BRACE 0
>>   +#endif
>>   +
>> -
>>    /* This reads all files listed in /etc/tmpfiles.d/?*.conf and creates
>>     * them in the file system. This is intended to be used to create
>> -@@ -1288,7 +1294,9 @@ static int item_do_children(Item *i, const char *path, action_t action) {
>> +  * properly owned directories beneath /tmp, /var/tmp, /run, which are
>> +@@ -1345,7 +1351,9 @@ finish:
>> +
>> + static int glob_item(Item *i, action_t action) {
>> +         _cleanup_globfree_ glob_t g = {
>> ++#ifdef GLOB_ALTDIRFUNC
>> +                 .gl_opendir = (void *(*)(const char *)) opendir_nomod,
>> ++#endif
>> +         };
>> +         int r = 0, k;
>> +         char **fn;
>> +@@ -1365,7 +1373,9 @@ static int glob_item(Item *i, action_t action) {
>>    
>> - static int glob_item(Item *i, action_t action, bool recursive) {
>> + static int glob_item_recursively(Item *i, fdaction_t action) {
>>            _cleanup_globfree_ glob_t g = {
>>   +#ifdef GLOB_ALTDIRFUNC
>>                    .gl_opendir = (void *(*)(const char *)) opendir_nomod,
>> @@ -153,5 +149,5 @@ index 38cbb739c..88cc543f0 100644
>>            int r = 0, k;
>>            char **fn;
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch b/meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-for-musl.patch
>> similarity index 79%
>> rename from meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
>> rename to meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-for-musl.patch
>> index 9ec3137..95287cce 100644
>> --- a/meta/recipes-core/systemd/systemd/0028-add-missing-FTW_-macros-for-musl.patch
>> +++ b/meta/recipes-core/systemd/systemd/0009-add-missing-FTW_-macros-for-musl.patch
>> @@ -1,13 +1,13 @@
>> -From 03cdd33be62db4c72a7fcf21b61d0d056c23c6a9 Mon Sep 17 00:00:00 2001
>> +From acc2c08082795802011e3c5f8626d63210021489 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>>   Date: Wed, 28 Feb 2018 21:36:32 -0800
>> -Subject: [PATCH 28/31] add missing FTW_ macros for musl
>> +Subject: [PATCH 09/19] add missing FTW_ macros for musl
>>   
>>   This is to avoid build failures like below for musl.
>>   
>>     locale-util.c:296:24: error: 'FTW_STOP' undeclared
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> @@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 20 insertions(+)
>>   
>>   diff --git a/src/basic/missing.h b/src/basic/missing.h
>> -index 1aee3346a..5b9fde692 100644
>> +index 02397f1b6..6dc750eba 100644
>>   --- a/src/basic/missing.h
>>   +++ b/src/basic/missing.h
>> -@@ -207,6 +207,26 @@ struct sockaddr_vm {
>> +@@ -189,6 +189,26 @@ struct sockaddr_vm {
>>    #define BTRFS_QGROUP_LEVEL_SHIFT 48
>>    #endif
>>    
>> @@ -46,5 +46,5 @@ index 1aee3346a..5b9fde692 100644
>>    #define BTRFS_IOC_QGROUP_ASSIGN _IOW(BTRFS_IOCTL_MAGIC, 41, \
>>                                   struct btrfs_ioctl_qgroup_assign_args)
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch b/meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>> similarity index 84%
>> rename from meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>> rename to meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>> index 517249f..a635fa9 100644
>> --- a/meta/recipes-core/systemd/systemd/0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>> +++ b/meta/recipes-core/systemd/systemd/0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch
>> @@ -1,7 +1,7 @@
>> -From 5845c82d1016a3e3f2696180d5ac91b46950540a Mon Sep 17 00:00:00 2001
>> +From f9625b5f3fd5dac3f3591dbeeb24dc9d6fda790d Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>>   Date: Tue, 27 Feb 2018 12:56:21 +0800
>> -Subject: [PATCH 29/31] nss-mymachines: Build conditionally when
>> +Subject: [PATCH 9/9] nss-mymachines: Build conditionally when
>>    ENABLE_MYHOSTNAME is set
>>   
>>   Fixes build failures when building with --disable-myhostname
>> @@ -15,10 +15,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 7 insertions(+), 4 deletions(-)
>>   
>>   diff --git a/meson.build b/meson.build
>> -index 1b947adac..1ed4dde72 100644
>> +index 3bb087fef..73bd70b0b 100644
>>   --- a/meson.build
>>   +++ b/meson.build
>> -@@ -1351,12 +1351,15 @@ test_dlopen = executable(
>> +@@ -1371,12 +1371,15 @@ test_dlopen = executable(
>>            link_with : [libbasic],
>>            dependencies : [libdl])
>>    
>> @@ -39,5 +39,5 @@ index 1b947adac..1ed4dde72 100644
>>                    module = tuple[0]
>>    
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch b/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
>> deleted file mode 100644
>> index 1b14369..0000000
>> --- a/meta/recipes-core/systemd/systemd/0009-remove-duplicate-include-uchar.h.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -From ffdf9cb6ba0d932b81933d824f23a878c313a8d4 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 22 Feb 2016 05:59:01 +0000
>> -Subject: [PATCH 09/31] remove duplicate include uchar.h
>> -
>> -missing.h already includes it
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Upstream-Status: Pending
>> ----
>> - src/basic/escape.h | 1 -
>> - src/basic/utf8.h   | 1 -
>> - 2 files changed, 2 deletions(-)
>> -
>> -diff --git a/src/basic/escape.h b/src/basic/escape.h
>> -index de89f43a8..9921ccbbd 100644
>> ---- a/src/basic/escape.h
>> -+++ b/src/basic/escape.h
>> -@@ -24,7 +24,6 @@
>> - #include <stddef.h>
>> - #include <stdint.h>
>> - #include <sys/types.h>
>> --#include <uchar.h>
>> -
>> - #include "string-util.h"
>> - #include "missing.h"
>> -diff --git a/src/basic/utf8.h b/src/basic/utf8.h
>> -index b0a7485ae..fa06d2906 100644
>> ---- a/src/basic/utf8.h
>> -+++ b/src/basic/utf8.h
>> -@@ -23,7 +23,6 @@
>> - #include <stdbool.h>
>> - #include <stddef.h>
>> - #include <stdint.h>
>> --#include <uchar.h>
>> -
>> - #include "macro.h"
>> - #include "missing.h"
>> ---
>> -2.13.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch b/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>> deleted file mode 100644
>> index 9a44b54..0000000
>> --- a/meta/recipes-core/systemd/systemd/0010-check-for-uchar.h-in-meson.build.patch
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -From ea4caaa1c6a6dc682bb04548ab05c5c73d0b45d6 Mon Sep 17 00:00:00 2001
>> -From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Mon, 26 Feb 2018 15:34:52 +0800
>> -Subject: [PATCH 10/31] check for uchar.h in meson.build
>> -
>> -Use #if HAVE_UCHAR_H to include uchar.h conditionally.
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ----
>> - meson.build         | 1 +
>> - src/basic/missing.h | 2 ++
>> - 2 files changed, 3 insertions(+)
>> -
>> -diff --git a/meson.build b/meson.build
>> -index 9c25022a4..94a16712b 100644
>> ---- a/meson.build
>> -+++ b/meson.build
>> -@@ -623,6 +623,7 @@ foreach header : ['crypt.h',
>> -                   'sys/auxv.h',
>> -                   'valgrind/memcheck.h',
>> -                   'valgrind/valgrind.h',
>> -+                  'uchar.h',
>> -                  ]
>> -
>> -         conf.set10('HAVE_' + header.underscorify().to_upper(),
>> -diff --git a/src/basic/missing.h b/src/basic/missing.h
>> -index 39c1fb700..84d6d9167 100644
>> ---- a/src/basic/missing.h
>> -+++ b/src/basic/missing.h
>> -@@ -38,7 +38,9 @@
>> - #include <sys/resource.h>
>> - #include <sys/socket.h>
>> - #include <sys/syscall.h>
>> -+#if HAVE_UCHAR_H
>> - #include <uchar.h>
>> -+#endif
>> - #include <unistd.h>
>> -
>> - #if HAVE_AUDIT
>> ---
>> -2.13.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch b/meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> similarity index 68%
>> rename from meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> rename to meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> index b0923d1..1654798 100644
>> --- a/meta/recipes-core/systemd/systemd/0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> +++ b/meta/recipes-core/systemd/systemd/0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>> @@ -1,23 +1,22 @@
>> -From 60dd411e9756fc2b14c0e061ad803782b4aee874 Mon Sep 17 00:00:00 2001
>> +From a0bd587300744dbb8e9cfbb043233670ce781c98 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Mon, 26 Feb 2018 15:46:05 +0800
>> -Subject: [PATCH 11/31] socket-util: don't fail if libc doesn't support IDN
>> +Date: Mon, 2 Jul 2018 13:22:41 +0800
>> +Subject: [PATCH 10/19] socket-util: don't fail if libc doesn't support IDN
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Emil Renner Berthing <systemd@esmil.dk>
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>>    src/basic/socket-util.c | 10 ++++++++++
>>    1 file changed, 10 insertions(+)
>>   
>>   diff --git a/src/basic/socket-util.c b/src/basic/socket-util.c
>> -index 2c70cade1..67aedadd4 100644
>> +index a913102e1..0d0154805 100644
>>   --- a/src/basic/socket-util.c
>>   +++ b/src/basic/socket-util.c
>> -@@ -50,6 +50,16 @@
>> +@@ -32,6 +32,16 @@
>>    #include "utf8.h"
>>    #include "util.h"
>>    
>> @@ -32,8 +31,8 @@ index 2c70cade1..67aedadd4 100644
>>   +#endif
>>   +
>>    #if ENABLE_IDN
>> - #  define IDN_FLAGS (NI_IDN|NI_IDN_USE_STD3_ASCII_RULES)
>> + #  define IDN_FLAGS NI_IDN
>>    #else
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>> similarity index 63%
>> rename from meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>> rename to meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>> index 53037ea..1a22ffd 100644
>> --- a/meta/recipes-core/systemd/systemd/0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch
>> @@ -1,24 +1,25 @@
>> -From efc57856f961c1f3bf016c511c53d990db8abdff Mon Sep 17 00:00:00 2001
>> -From: Emil Renner Berthing <systemd@esmil.dk>
>> -Date: Mon, 23 Oct 2017 11:31:03 -0700
>> -Subject: [PATCH 16/31] src/basic/missing.h: check for missing __compar_fn_t
>> +From 045f205fd21e5e380edf813de04fcfbf5a487219 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Mon, 2 Jul 2018 13:28:25 +0800
>> +Subject: [PATCH 11/19] src/basic/missing.h: check for missing __compar_fn_t
>>    typedef
>>   
>>   include missing.h for missing __compar_fn_t
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>>    src/basic/missing.h | 5 +++++
>>    src/basic/strbuf.c  | 1 +
>>    2 files changed, 6 insertions(+)
>>   
>>   diff --git a/src/basic/missing.h b/src/basic/missing.h
>> -index 07a8c8364..1aee3346a 100644
>> +index 6dc750eba..cd1cc109f 100644
>>   --- a/src/basic/missing.h
>>   +++ b/src/basic/missing.h
>> -@@ -1162,6 +1162,11 @@ struct input_mask {
>> +@@ -1179,6 +1179,11 @@ struct input_mask {
>>    #define RENAME_NOREPLACE (1 << 0)
>>    #endif
>>    
>> @@ -31,17 +32,17 @@ index 07a8c8364..1aee3346a 100644
>>    #define KCMP_FILE 0
>>    #endif
>>   diff --git a/src/basic/strbuf.c b/src/basic/strbuf.c
>> -index 8befffa66..bcb860f95 100644
>> +index e2ed776a0..4d3ebec4c 100644
>>   --- a/src/basic/strbuf.c
>>   +++ b/src/basic/strbuf.c
>> -@@ -24,6 +24,7 @@
>> -
>> +@@ -7,6 +7,7 @@
>>    #include "alloc-util.h"
>>    #include "strbuf.h"
>> + #include "util.h"
>>   +#include "missing.h"
>>    
>>    /*
>>     * Strbuf stores given strings in a single continuous allocated memory
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch b/meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>> similarity index 75%
>> rename from meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>> rename to meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>> index 7f0b4bf..d41bc4a 100644
>> --- a/meta/recipes-core/systemd/systemd/0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>> +++ b/meta/recipes-core/systemd/systemd/0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch
>> @@ -1,9 +1,9 @@
>> -From b7eacdf0388f930fc5271bdecfa46612c71dd65c Mon Sep 17 00:00:00 2001
>> +From 1fadf805cb391e3bcbd9a0286a9e4b7adb9e7427 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Tue, 27 Feb 2018 13:27:47 +0800
>> -Subject: [PATCH 30/31] fix missing of __register_atfork for non-glibc builds
>> +Date: Mon, 2 Jul 2018 13:34:09 +0800
>> +Subject: [PATCH 12/19] fix missing of __register_atfork for non-glibc builds
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 7 insertions(+)
>>   
>>   diff --git a/src/basic/process-util.c b/src/basic/process-util.c
>> -index dc7c9ef9e..85ce8a0cc 100644
>> +index 0a4f917cb..3543bc045 100644
>>   --- a/src/basic/process-util.c
>>   +++ b/src/basic/process-util.c
>> -@@ -39,6 +39,9 @@
>> +@@ -22,6 +22,9 @@
>>    #if HAVE_VALGRIND_VALGRIND_H
>>    #include <valgrind/valgrind.h>
>>    #endif
>> @@ -24,7 +24,7 @@ index dc7c9ef9e..85ce8a0cc 100644
>>    
>>    #include "alloc-util.h"
>>    #include "architecture.h"
>> -@@ -1112,11 +1115,15 @@ void reset_cached_pid(void) {
>> +@@ -1150,11 +1153,15 @@ void reset_cached_pid(void) {
>>            cached_pid = CACHED_PID_UNSET;
>>    }
>>    
>> @@ -39,7 +39,7 @@ index dc7c9ef9e..85ce8a0cc 100644
>>   +#endif
>>    
>>    pid_t getpid_cached(void) {
>> -         pid_t current_value;
>> +         static bool installed = false;
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling-rlim_t.patch b/meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling-rlim_t.patch
>> similarity index 77%
>> rename from meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling-rlim_t.patch
>> rename to meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling-rlim_t.patch
>> index 46d75ad..69b3c15 100644
>> --- a/meta/recipes-core/systemd/systemd/0026-Use-uintmax_t-for-handling-rlim_t.patch
>> +++ b/meta/recipes-core/systemd/systemd/0013-Use-uintmax_t-for-handling-rlim_t.patch
>> @@ -1,7 +1,7 @@
>> -From 88c48ea84db6fda19dfaeb64545fccf8fa0525ec Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 27 Oct 2017 13:00:41 -0700
>> -Subject: [PATCH 26/31] Use uintmax_t for handling rlim_t
>> +From a0ac0cfd90af6431c64d1b276f422a2092d569b3 Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Mon, 2 Jul 2018 13:44:21 +0800
>> +Subject: [PATCH 13/19] Use uintmax_t for handling rlim_t
>>   
>>   PRIu{32,64} is not right format to represent rlim_t type
>>   therefore use %ju and typecast the rlim_t variables to
>> @@ -15,9 +15,10 @@ execute.c:3446:36: error: format '%lu' expects argument of type 'long unsigned i
>>   |                                  prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
>>   |                                                               ~~~~~~~~~~~~~~~~~~~~~~
>>   
>> -Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/7199]
>> +Upstream-Status: Denied [https://github.com/systemd/systemd/pull/7199]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>>    src/basic/format-util.h | 8 --------
>>    src/basic/rlimit-util.c | 8 ++++----
>> @@ -25,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    3 files changed, 8 insertions(+), 16 deletions(-)
>>   
>>   diff --git a/src/basic/format-util.h b/src/basic/format-util.h
>> -index d9a78f781..9a1bc21d7 100644
>> +index 160550cd6..61245d1e3 100644
>>   --- a/src/basic/format-util.h
>>   +++ b/src/basic/format-util.h
>> -@@ -61,14 +61,6 @@
>> +@@ -43,14 +43,6 @@
>>    #  define PRI_TIMEX "li"
>>    #endif
>>    
>> @@ -44,10 +45,10 @@ index d9a78f781..9a1bc21d7 100644
>>    #  define DEV_FMT "%" PRIu64
>>    #elif SIZEOF_DEV_T == 4
>>   diff --git a/src/basic/rlimit-util.c b/src/basic/rlimit-util.c
>> -index 00648211d..df3d9ecc1 100644
>> +index be1ba615e..e328ce499 100644
>>   --- a/src/basic/rlimit-util.c
>>   +++ b/src/basic/rlimit-util.c
>> -@@ -286,13 +286,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
>> +@@ -299,13 +299,13 @@ int rlimit_format(const struct rlimit *rl, char **ret) {
>>            if (rl->rlim_cur >= RLIM_INFINITY && rl->rlim_max >= RLIM_INFINITY)
>>                    s = strdup("infinity");
>>            else if (rl->rlim_cur >= RLIM_INFINITY)
>> @@ -66,24 +67,24 @@ index 00648211d..df3d9ecc1 100644
>>            if (!s)
>>                    return -ENOMEM;
>>   diff --git a/src/core/execute.c b/src/core/execute.c
>> -index 0df3971df..aabdddb68 100644
>> +index 8ac69d1a0..efedf3842 100644
>>   --- a/src/core/execute.c
>>   +++ b/src/core/execute.c
>> -@@ -3991,10 +3991,10 @@ void exec_context_dump(ExecContext *c, FILE* f, const char *prefix) {
>> +@@ -3976,10 +3976,10 @@ void exec_context_dump(const ExecContext *c, FILE* f, const char *prefix) {
>>    
>>            for (i = 0; i < RLIM_NLIMITS; i++)
>>                    if (c->rlimit[i]) {
>> --                        fprintf(f, "%s%s: " RLIM_FMT "\n",
>> +-                        fprintf(f, "Limit%s%s: " RLIM_FMT "\n",
>>   -                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_max);
>> --                        fprintf(f, "%s%sSoft: " RLIM_FMT "\n",
>> +-                        fprintf(f, "Limit%s%sSoft: " RLIM_FMT "\n",
>>   -                                prefix, rlimit_to_string(i), c->rlimit[i]->rlim_cur);
>> -+                        fprintf(f, "%s%s: %ju\n",
>> ++                        fprintf(f, "Limit%s%s: %ju\n",
>>   +                                prefix, rlimit_to_string(i), (uintmax_t)c->rlimit[i]->rlim_max);
>> -+                        fprintf(f, "%s%sSoft: %ju\n",
>> ++                        fprintf(f, "Limit%s%sSoft: %ju\n",
>>   +                                prefix, rlimit_to_string(i), (uintmax_t)c->rlimit[i]->rlim_cur);
>>                    }
>>    
>>            if (c->ioprio_set) {
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch b/meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>> similarity index 66%
>> rename from meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>> rename to meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>> index 319c4b6..258a631 100644
>> --- a/meta/recipes-core/systemd/systemd/0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>> +++ b/meta/recipes-core/systemd/systemd/0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch
>> @@ -1,9 +1,9 @@
>> -From adcd7e426fcd80e754274a730221d1a1f49dbc21 Mon Sep 17 00:00:00 2001
>> +From cb59b3af54fb3bbd4d8264fef919810af8d08d16 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>>   Date: Tue, 27 Feb 2018 14:01:30 +0800
>> -Subject: [PATCH 31/31] fix missing ULONG_LONG_MAX definition in case of musl
>> +Subject: [PATCH 14/19] fix missing ULONG_LONG_MAX definition in case of musl
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl]
>>   
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>   ---
>> @@ -11,10 +11,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 4 insertions(+)
>>   
>>   diff --git a/src/basic/missing.h b/src/basic/missing.h
>> -index 5b9fde692..a922f1346 100644
>> +index cd1cc109f..144058a1a 100644
>>   --- a/src/basic/missing.h
>>   +++ b/src/basic/missing.h
>> -@@ -72,6 +72,10 @@ struct sockaddr_vm {
>> +@@ -54,6 +54,10 @@ struct sockaddr_vm {
>>    };
>>    #endif /* !HAVE_LINUX_VM_SOCKETS_H */
>>    
>> @@ -26,5 +26,5 @@ index 5b9fde692..a922f1346 100644
>>    #define RLIMIT_RTTIME 15
>>    #endif
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch b/meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>> similarity index 70%
>> rename from meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>> rename to meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>> index ad49cfe..c7ca9cd 100644
>> --- a/meta/recipes-core/systemd/systemd/0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>> +++ b/meta/recipes-core/systemd/systemd/0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch
>> @@ -1,9 +1,9 @@
>> -From d63d2fedcd80e58ee53655aeaf2836d4b0a14652 Mon Sep 17 00:00:00 2001
>> +From b11109ecc41110c518a98b6ac39611ff86477021 Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>>   Date: Mon, 23 Oct 2017 12:33:22 -0700
>> -Subject: [PATCH 20/31] test-hexdecoct.c: Include missing.h for strndupa
>> +Subject: [PATCH 15/19] test-hexdecoct.c: Include missing.h for strndupa
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> @@ -12,10 +12,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 1 insertion(+)
>>   
>>   diff --git a/src/test/test-hexdecoct.c b/src/test/test-hexdecoct.c
>> -index 3e25a0bac..ab3e508f1 100644
>> +index da9f3008b..7ff2dfe0c 100644
>>   --- a/src/test/test-hexdecoct.c
>>   +++ b/src/test/test-hexdecoct.c
>> -@@ -24,6 +24,7 @@
>> +@@ -6,6 +6,7 @@
>>    #include "hexdecoct.h"
>>    #include "macro.h"
>>    #include "string-util.h"
>> @@ -24,5 +24,5 @@ index 3e25a0bac..ab3e508f1 100644
>>    static void test_hexchar(void) {
>>            assert_se(hexchar(0xa) == 'a');
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch b/meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> similarity index 73%
>> rename from meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> rename to meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> index 9c8aeca..c06a370 100644
>> --- a/meta/recipes-core/systemd/systemd/0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> +++ b/meta/recipes-core/systemd/systemd/0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch
>> @@ -1,10 +1,10 @@
>> -From dfea4b98844795a0cd14fdaf40c67df389dbd27e Mon Sep 17 00:00:00 2001
>> +From c4bbf3efefffe0a4efadbf4e3f0adb54d76fe0e7 Mon Sep 17 00:00:00 2001
>>   From: Chen Qi <Qi.Chen@windriver.com>
>>   Date: Wed, 28 Feb 2018 21:25:22 -0800
>> -Subject: [PATCH 21/31] test-sizeof.c: Disable tests for missing typedefs in
>> +Subject: [PATCH 16/19] test-sizeof.c: Disable tests for missing typedefs in
>>    musl
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> @@ -13,10 +13,10 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>    1 file changed, 4 insertions(+)
>>   
>>   diff --git a/src/test/test-sizeof.c b/src/test/test-sizeof.c
>> -index aed6db842..0de6fa63c 100644
>> +index 7a1e496ed..386b314d5 100644
>>   --- a/src/test/test-sizeof.c
>>   +++ b/src/test/test-sizeof.c
>> -@@ -50,8 +50,10 @@ int main(void) {
>> +@@ -40,8 +40,10 @@ int main(void) {
>>            info(unsigned);
>>            info(long unsigned);
>>            info(long long unsigned);
>> @@ -27,7 +27,7 @@ index aed6db842..0de6fa63c 100644
>>    
>>            info(float);
>>            info(double);
>> -@@ -61,7 +63,9 @@ int main(void) {
>> +@@ -59,7 +61,9 @@ int main(void) {
>>            info(ssize_t);
>>            info(time_t);
>>            info(usec_t);
>> @@ -38,5 +38,5 @@ index aed6db842..0de6fa63c 100644
>>            info(uid_t);
>>            info(gid_t);
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch b/meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>> similarity index 89%
>> rename from meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>> rename to meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>> index 09c2b5c..8e47c6f5 100644
>> --- a/meta/recipes-core/systemd/systemd/0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>> +++ b/meta/recipes-core/systemd/systemd/0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch
>> @@ -1,7 +1,7 @@
>> -From 7b802ada1207ed00ed3867b9804dd0f316641b9b Mon Sep 17 00:00:00 2001
>> +From 91bb4f5c9c11464468e8d3fa4746d98d59997264 Mon Sep 17 00:00:00 2001
>>   From: Andre McCurdy <armccurdy@gmail.com>
>>   Date: Tue, 10 Oct 2017 14:33:30 -0700
>> -Subject: [PATCH 23/31] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
>> +Subject: [PATCH 17/19] don't pass AT_SYMLINK_NOFOLLOW flag to faccessat()
>>   
>>   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right
>>   thing to do and it's not portable (not supported by musl). See:
>> @@ -22,7 +22,7 @@ The laccess() macros was added to systemd some time ago and it's not
>>   clear if or why it needs to return success for broken symlinks. Maybe
>>   just historical and not actually necessary or desired behaviour?
>>   
>> -Upstream-Status: Pending
>> +Upstream-Status: Inappropriate [musl specific]
>>   
>>   Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>   ---
>> @@ -31,10 +31,10 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>    2 files changed, 24 insertions(+), 4 deletions(-)
>>   
>>   diff --git a/src/basic/fs-util.h b/src/basic/fs-util.h
>> -index 4dba1ea56..9c4b02ecc 100644
>> +index 28566773c..14b864cc5 100644
>>   --- a/src/basic/fs-util.h
>>   +++ b/src/basic/fs-util.h
>> -@@ -50,7 +50,27 @@ int fchmod_umask(int fd, mode_t mode);
>> +@@ -32,7 +32,27 @@ int fchmod_opath(int fd, mode_t m);
>>    
>>    int fd_warn_permissions(const char *path, int fd);
>>    
>> @@ -64,10 +64,10 @@ index 4dba1ea56..9c4b02ecc 100644
>>    int touch_file(const char *path, bool parents, usec_t stamp, uid_t uid, gid_t gid, mode_t mode);
>>    int touch(const char *path);
>>   diff --git a/src/shared/base-filesystem.c b/src/shared/base-filesystem.c
>> -index 3c25aa534..574ca71c7 100644
>> +index 89d7a7d59..34b4ad53a 100644
>>   --- a/src/shared/base-filesystem.c
>>   +++ b/src/shared/base-filesystem.c
>> -@@ -71,7 +71,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>> +@@ -53,7 +53,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>>                    return log_error_errno(errno, "Failed to open root file system: %m");
>>    
>>            for (i = 0; i < ELEMENTSOF(table); i ++) {
>> @@ -76,7 +76,7 @@ index 3c25aa534..574ca71c7 100644
>>                            continue;
>>    
>>                    if (table[i].target) {
>> -@@ -79,7 +79,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>> +@@ -61,7 +61,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>>    
>>                            /* check if one of the targets exists */
>>                            NULSTR_FOREACH(s, table[i].target) {
>> @@ -85,7 +85,7 @@ index 3c25aa534..574ca71c7 100644
>>                                            continue;
>>    
>>                                    /* check if a specific file exists at the target path */
>> -@@ -90,7 +90,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>> +@@ -72,7 +72,7 @@ int base_filesystem_create(const char *root, uid_t uid, gid_t gid) {
>>                                            if (!p)
>>                                                    return log_oom();
>>    
>> @@ -95,5 +95,5 @@ index 3c25aa534..574ca71c7 100644
>>                                    }
>>    
>>   --
>> -2.13.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch b/meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch
>> similarity index 78%
>> rename from meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch
>> rename to meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch
>> index 736d525..1bd0d60 100644
>> --- a/meta/recipes-core/systemd/systemd/0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch
>> +++ b/meta/recipes-core/systemd/systemd/0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch
>> @@ -1,7 +1,8 @@
>> -From 5f1f064c81ea30acf93cfa0fb466b38f094f488c Mon Sep 17 00:00:00 2001
>> +From 97fed07132533a1b2bce9c60e305a5d09aee2e9b Mon Sep 17 00:00:00 2001
>>   From: Khem Raj <raj.khem@gmail.com>
>>   Date: Sun, 27 May 2018 08:36:44 -0700
>> -Subject: [PATCH] Define glibc compatible basename() for non-glibc systems
>> +Subject: [PATCH 18/19] Define glibc compatible basename() for non-glibc
>> + systems
>>   
>>   Fixes builds with musl, even though systemd is adamant about
>>   using non-posix basename implementation, we have a way out
>> @@ -14,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>    1 file changed, 4 insertions(+)
>>   
>>   diff --git a/src/machine/machine-dbus.c b/src/machine/machine-dbus.c
>> -index 2d7806491b..9a3bdb1d76 100644
>> +index 7f41465cc..cee8a5d43 100644
>>   --- a/src/machine/machine-dbus.c
>>   +++ b/src/machine/machine-dbus.c
>> -@@ -29,6 +29,10 @@
>> +@@ -11,6 +11,10 @@
>>    #include <libgen.h>
>>    #undef basename
>>    
>> @@ -29,5 +30,5 @@ index 2d7806491b..9a3bdb1d76 100644
>>    #include "bus-common-errors.h"
>>    #include "bus-internal.h"
>>   --
>> -2.17.0
>> +2.11.0
>>   
>> diff --git a/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch b/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
>> deleted file mode 100644
>> index ab7edf5..0000000
>> --- a/meta/recipes-core/systemd/systemd/0018-check-for-missing-canonicalize_file_name.patch
>> +++ /dev/null
>> @@ -1,47 +0,0 @@
>> -From 690eeef9590c7ef1d9d2c31d8c1d5d8071da8c4c Mon Sep 17 00:00:00 2001
>> -From: Chen Qi <Qi.Chen@windriver.com>
>> -Date: Mon, 26 Feb 2018 17:21:11 +0800
>> -Subject: [PATCH 18/31] check for missing canonicalize_file_name
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ----
>> - meson.build                 | 2 ++
>> - src/basic/missing_syscall.h | 6 ++++++
>> - 2 files changed, 8 insertions(+)
>> -
>> -diff --git a/meson.build b/meson.build
>> -index 12811b3f3..f6515e97c 100644
>> ---- a/meson.build
>> -+++ b/meson.build
>> -@@ -520,6 +520,8 @@ foreach ident : [
>> -         ['kcmp',              '''#include <linux/kcmp.h>'''],
>> -         ['keyctl',            '''#include <sys/types.h>
>> -                                  #include <keyutils.h>'''],
>> -+        ['canonicalize_file_name', '''#define _GNU_SOURCE
>> -+                                      #include <stdlib.h>'''],
>> -         ['copy_file_range',   '''#include <sys/syscall.h>
>> -                                  #include <unistd.h>'''],
>> -         ['bpf',               '''#include <sys/syscall.h>
>> -diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
>> -index c938d0d97..308b9472b 100644
>> ---- a/src/basic/missing_syscall.h
>> -+++ b/src/basic/missing_syscall.h
>> -@@ -31,6 +31,12 @@ static inline int pivot_root(const char *new_root, const char *put_old) {
>> - }
>> - #endif
>> -
>> -+#if !HAVE_CANONICALIZE_FILE_NAME
>> -+static inline char *canonicalize_file_name(const char *path) {
>> -+        return realpath(path, NULL);
>> -+}
>> -+#endif
>> -+
>> - /* ======================================================================= */
>> -
>> - #if !HAVE_MEMFD_CREATE
>> ---
>> -2.13.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch b/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>> new file mode 100644
>> index 0000000..942f4c0
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>> @@ -0,0 +1,39 @@
>> +From 8440348bcac34249cdf6ac2dcae9ac66d3c727db Mon Sep 17 00:00:00 2001
>> +From: Chen Qi <Qi.Chen@windriver.com>
>> +Date: Wed, 4 Jul 2018 15:00:44 +0800
>> +Subject: [PATCH 19/19] Do not disable buffering when writing to oom_score_adj
>> +
>> +On musl, disabling buffering when writing to oom_score_adj will
>> +cause the following error.
>> +
>> +  Failed to adjust OOM setting: Invalid argument
>> +
>> +This error appears for systemd-udevd.service and dbus.service.
>> +This is because kernel receives '-' instead of the whole '-900'
>> +if buffering is disabled.
>> +
>> +This is libc implementation specific, as glibc does not have this issue.
>> +
>> +Upstream-Status: Inappropriate [musl specific]
>> +
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + src/basic/process-util.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/basic/process-util.c b/src/basic/process-util.c
>> +index 3543bc045..d0572e034 100644
>> +--- a/src/basic/process-util.c
>> ++++ b/src/basic/process-util.c
>> +@@ -1473,7 +1473,7 @@ int set_oom_score_adjust(int value) {
>> +         sprintf(t, "%i", value);
>> +
>> +         return write_string_file("/proc/self/oom_score_adj", t,
>> +-                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
>> ++                                 WRITE_STRING_FILE_VERIFY_ON_FAILURE);
>> + }
>> +
>> + static const char *const ioprio_class_table[] = {
>> +--
>> +2.11.0
>> +
>> diff --git a/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch b/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>> deleted file mode 100644
>> index 9376a8f..0000000
>> --- a/meta/recipes-core/systemd/systemd/0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From a0b1496322f4d7ce83f4fbfd2a90b91d0721f643 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Tue, 24 Oct 2017 23:08:24 -0700
>> -Subject: [PATCH 25/31] Define _PATH_WTMPX and _PATH_UTMPX if not defined
>> -
>> -Musl needs these defines
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - src/shared/utmp-wtmp.c | 8 ++++++++
>> - 1 file changed, 8 insertions(+)
>> -
>> -diff --git a/src/shared/utmp-wtmp.c b/src/shared/utmp-wtmp.c
>> -index cab1cd6a2..f5eedac18 100644
>> ---- a/src/shared/utmp-wtmp.c
>> -+++ b/src/shared/utmp-wtmp.c
>> -@@ -28,6 +28,7 @@
>> - #include <sys/time.h>
>> - #include <sys/utsname.h>
>> - #include <unistd.h>
>> -+#include <utmp.h>
>> - #include <utmpx.h>
>> -
>> - #include "alloc-util.h"
>> -@@ -42,6 +43,13 @@
>> - #include "util.h"
>> - #include "utmp-wtmp.h"
>> -
>> -+#if defined _PATH_UTMP && !defined _PATH_UTMPX
>> -+# define _PATH_UTMPX _PATH_UTMP
>> -+#endif
>> -+#if defined _PATH_WTMP && !defined _PATH_WTMPX
>> -+# define _PATH_WTMPX _PATH_WTMP
>> -+#endif
>> -+
>> - int utmp_get_runlevel(int *runlevel, int *previous) {
>> -         struct utmpx *found, lookup = { .ut_type = RUN_LVL };
>> -         int r;
>> ---
>> -2.13.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0032-memfd.patch b/meta/recipes-core/systemd/systemd/0032-memfd.patch
>> deleted file mode 100644
>> index f7cfd60..0000000
>> --- a/meta/recipes-core/systemd/systemd/0032-memfd.patch
>> +++ /dev/null
>> @@ -1,272 +0,0 @@
>> -missing_syscall: when adding syscall replacements, use different names (
>> -
>> -#8229)
>> -
>> -In meson.build we check that functions are available using:
>> -    meson.get_compiler('c').has_function('foo')
>> -which checks the following:
>> -- if __stub_foo or __stub___foo are defined, return false
>> -- if foo is declared (a pointer to the function can be taken), return true
>> -- otherwise check for __builtin_memfd_create
>> -
>> -_stub is documented by glibc as
>> -   It defines a symbol '__stub_FUNCTION' for each function
>> -   in the C library which is a stub, meaning it will fail
>> -   every time called, usually setting errno to ENOSYS.
>> -
>> -So if __stub is defined, we know we don't want to use the glibc version, but
>> -this doesn't tell us if the name itself is defined or not. If it _is_ defined,
>> -and we define our replacement as an inline static function, we get an error:
>> -
>> -In file included from ../src/basic/missing.h:1358:0,
>> -                 from ../src/basic/util.h:47,
>> -                 from ../src/basic/calendarspec.h:29,
>> -                 from ../src/basic/calendarspec.c:34:
>> -../src/basic/missing_syscall.h:65:19: error: static declaration of 'memfd_create' follows non-static declaration
>> - static inline int memfd_create(const char *name, unsigned int flags) {
>> -                   ^~~~~~~~~~~~
>> -.../usr/include/bits/mman-shared.h:46:5: note: previous declaration of 'memfd_create' was here
>> - int memfd_create (const char *__name, unsigned int __flags) __THROW;
>> -     ^~~~~~~~~~~~
>> -
>> -To avoid this problem, call our inline functions different than glibc,
>> -and use a #define to map the official name to our replacement.
>> -
>> -Fixes #8099.
>> -
>> -v2:
>> -- use "missing_" as the prefix instead of "_"
>> -
>> -v3:
>> -- rebase and update for statx()
>> -
>> -  Unfortunately "statx" is also present in "struct statx", so the define
>> -  causes issues. Work around this by using a typedef.
>> -
>> -I checked that systemd compiles with current glibc
>> -(glibc-devel-2.26-24.fc27.x86_64) if HAVE_MEMFD_CREATE, HAVE_GETTID,
>> -HAVE_PIVOT_ROOT, HAVE_SETNS, HAVE_RENAMEAT2, HAVE_KCMP, HAVE_KEYCTL,
>> -HAVE_COPY_FILE_RANGE, HAVE_BPF, HAVE_STATX are forced to 0.
>> -
>> -Setting HAVE_NAME_TO_HANDLE_AT to 0 causes an issue, but it's not because of
>> -the define, but because of struct file_handle.
>> -
>> -
>> -backport https://github.com/systemd/systemd/commit/5187dd2c403caf92d09f3491e41f1ceb3f10491f
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -Upstream-Status: Backport [https://github.com/systemd/systemd/issues/8099]
>> -Index: git/src/basic/missing_syscall.h
>> -===================================================================
>> ---- git.orig/src/basic/missing_syscall.h
>> -+++ git/src/basic/missing_syscall.h
>> -@@ -26,9 +26,11 @@
>> - #include <sys/types.h>
>> -
>> - #if !HAVE_PIVOT_ROOT
>> --static inline int pivot_root(const char *new_root, const char *put_old) {
>> -+static inline int missing_pivot_root(const char *new_root, const char *put_old) {
>> -         return syscall(SYS_pivot_root, new_root, put_old);
>> - }
>> -+
>> -+#  define pivot_root missing_pivot_root
>> - #endif
>> -
>> - #if !HAVE_CANONICALIZE_FILE_NAME
>> -@@ -68,7 +70,7 @@ static inline char *canonicalize_file_na
>> - #    endif
>> - #  endif
>> -
>> --static inline int memfd_create(const char *name, unsigned int flags) {
>> -+static inline int missing_memfd_create(const char *name, unsigned int flags) {
>> - #  ifdef __NR_memfd_create
>> -         return syscall(__NR_memfd_create, name, flags);
>> - #  else
>> -@@ -76,6 +78,8 @@ static inline int memfd_create(const cha
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define memfd_create missing_memfd_create
>> - #endif
>> -
>> - /* ======================================================================= */
>> -@@ -115,7 +119,7 @@ static inline int memfd_create(const cha
>> - #    endif
>> - #  endif
>> -
>> --static inline int getrandom(void *buffer, size_t count, unsigned flags) {
>> -+static inline int missing_getrandom(void *buffer, size_t count, unsigned flags) {
>> - #  ifdef __NR_getrandom
>> -         return syscall(__NR_getrandom, buffer, count, flags);
>> - #  else
>> -@@ -123,14 +127,18 @@ static inline int getrandom(void *buffer
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define getrandom missing_getrandom
>> - #endif
>> -
>> - /* ======================================================================= */
>> -
>> - #if !HAVE_GETTID
>> --static inline pid_t gettid(void) {
>> -+static inline pid_t missing_gettid(void) {
>> -         return (pid_t) syscall(SYS_gettid);
>> - }
>> -+
>> -+#  define gettid missing_gettid
>> - #endif
>> -
>> - /* ======================================================================= */
>> -@@ -158,7 +166,7 @@ struct file_handle {
>> -         unsigned char f_handle[0];
>> - };
>> -
>> --static inline int name_to_handle_at(int fd, const char *name, struct file_handle *handle, int *mnt_id, int flags) {
>> -+static inline int missing_name_to_handle_at(int fd, const char *name, struct file_handle *handle, int *mnt_id, int flags) {
>> - #  ifdef __NR_name_to_handle_at
>> -         return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_id, flags);
>> - #  else
>> -@@ -166,6 +174,8 @@ static inline int name_to_handle_at(int
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define name_to_handle_at missing_name_to_handle_at
>> - #endif
>> -
>> - /* ======================================================================= */
>> -@@ -183,7 +193,7 @@ static inline int name_to_handle_at(int
>> - #    endif
>> - #  endif
>> -
>> --static inline int setns(int fd, int nstype) {
>> -+static inline int missing_setns(int fd, int nstype) {
>> - #  ifdef __NR_setns
>> -         return syscall(__NR_setns, fd, nstype);
>> - #  else
>> -@@ -191,6 +201,8 @@ static inline int setns(int fd, int nsty
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define setns missing_setns
>> - #endif
>> -
>> - /* ======================================================================= */
>> -@@ -236,7 +248,7 @@ static inline pid_t raw_getpid(void) {
>> - #    endif
>> - #  endif
>> -
>> --static inline int renameat2(int oldfd, const char *oldname, int newfd, const char *newname, unsigned flags) {
>> -+static inline int missing_renameat2(int oldfd, const char *oldname, int newfd, const char *newname, unsigned flags) {
>> - #  ifdef __NR_renameat2
>> -         return syscall(__NR_renameat2, oldfd, oldname, newfd, newname, flags);
>> - #  else
>> -@@ -244,12 +256,14 @@ static inline int renameat2(int oldfd, c
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define renameat2 missing_renameat2
>> - #endif
>> -
>> - /* ======================================================================= */
>> -
>> - #if !HAVE_KCMP
>> --static inline int kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1, unsigned long idx2) {
>> -+static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1, unsigned long idx2) {
>> - #  ifdef __NR_kcmp
>> -         return syscall(__NR_kcmp, pid1, pid2, type, idx1, idx2);
>> - #  else
>> -@@ -257,36 +271,44 @@ static inline int kcmp(pid_t pid1, pid_t
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define kcmp missing_kcmp
>> - #endif
>> -
>> - /* ======================================================================= */
>> -
>> - #if !HAVE_KEYCTL
>> --static inline long keyctl(int cmd, unsigned long arg2, unsigned long arg3, unsigned long arg4,unsigned long arg5) {
>> -+static inline long missing_keyctl(int cmd, unsigned long arg2, unsigned long arg3, unsigned long arg4,unsigned long arg5) {
>> - #  ifdef __NR_keyctl
>> -         return syscall(__NR_keyctl, cmd, arg2, arg3, arg4, arg5);
>> - #  else
>> -         errno = ENOSYS;
>> -         return -1;
>> - #  endif
>> -+
>> -+#  define keyctl missing_keyctl
>> - }
>> -
>> --static inline key_serial_t add_key(const char *type, const char *description, const void *payload, size_t plen, key_serial_t ringid) {
>> -+static inline key_serial_t missing_add_key(const char *type, const char *description, const void *payload, size_t plen, key_serial_t ringid) {
>> - #  ifdef __NR_add_key
>> -         return syscall(__NR_add_key, type, description, payload, plen, ringid);
>> - #  else
>> -         errno = ENOSYS;
>> -         return -1;
>> - #  endif
>> -+
>> -+#  define add_key missing_add_key
>> - }
>> -
>> --static inline key_serial_t request_key(const char *type, const char *description, const char * callout_info, key_serial_t destringid) {
>> -+static inline key_serial_t missing_request_key(const char *type, const char *description, const char * callout_info, key_serial_t destringid) {
>> - #  ifdef __NR_request_key
>> -         return syscall(__NR_request_key, type, description, callout_info, destringid);
>> - #  else
>> -         errno = ENOSYS;
>> -         return -1;
>> - #  endif
>> -+
>> -+#  define request_key missing_request_key
>> - }
>> - #endif
>> -
>> -@@ -313,10 +335,10 @@ static inline key_serial_t request_key(c
>> - #    endif
>> - #  endif
>> -
>> --static inline ssize_t copy_file_range(int fd_in, loff_t *off_in,
>> --                                      int fd_out, loff_t *off_out,
>> --                                      size_t len,
>> --                                      unsigned int flags) {
>> -+static inline ssize_t missing_copy_file_range(int fd_in, loff_t *off_in,
>> -+                                              int fd_out, loff_t *off_out,
>> -+                                              size_t len,
>> -+                                              unsigned int flags) {
>> - #  ifdef __NR_copy_file_range
>> -         return syscall(__NR_copy_file_range, fd_in, off_in, fd_out, off_out, len, flags);
>> - #  else
>> -@@ -324,6 +346,8 @@ static inline ssize_t copy_file_range(in
>> -         return -1;
>> - #  endif
>> - }
>> -+
>> -+#  define copy_file_range missing_copy_file_range
>> - #endif
>> -
>> - /* ======================================================================= */
>> -@@ -351,7 +375,7 @@ static inline ssize_t copy_file_range(in
>> -
>> - union bpf_attr;
>> -
>> --static inline int bpf(int cmd, union bpf_attr *attr, size_t size) {
>> -+static inline int missing_bpf(int cmd, union bpf_attr *attr, size_t size) {
>> - #ifdef __NR_bpf
>> -         return (int) syscall(__NR_bpf, cmd, attr, size);
>> - #else
>> -@@ -360,6 +384,7 @@ static inline int bpf(int cmd, union bpf
>> - #endif
>> - }
>> -
>> -+#  define bpf missing_bpf
>> - #endif
>> -
>> - /* ======================================================================= */
>> diff --git a/meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch b/meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>> deleted file mode 100644
>> index 59647b2..0000000
>> --- a/meta/recipes-core/systemd/systemd/0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>> +++ /dev/null
>> @@ -1,203 +0,0 @@
>> -From 848e863acc51ecfb0f3955c498874588201d9130 Mon Sep 17 00:00:00 2001
>> -From: Franck Bui <fbui@suse.com>
>> -Date: Thu, 15 Mar 2018 06:23:46 +0100
>> -Subject: [PATCH] basic/macros: rename noreturn into _noreturn_ (#8456)
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -"noreturn" is reserved and can be used in other header files we include:
>> -
>> -  [   16s] In file included from /usr/include/gcrypt.h:30:0,
>> -  [   16s]                  from ../src/journal/journal-file.h:26,
>> -  [   16s]                  from ../src/journal/journal-vacuum.c:31:
>> -  [   16s] /usr/include/gpg-error.h:1544:46: error: expected ‘,’ or ‘;’ before ‘)’ token
>> -  [   16s]  void gpgrt_log_bug (const char *fmt, ...)    GPGRT_ATTR_NR_PRINTF(1,2);
>> -
>> -Here we include grcrypt.h (which in turns include gpg-error.h) *after* we
>> -"noreturn" was defined in macro.h.
>> ----
>> - src/basic/log.c                         |  4 ++--
>> - src/basic/log.h                         |  4 ++--
>> - src/basic/macro.h                       | 19 +++++++++----------
>> - src/basic/process-util.c                |  2 +-
>> - src/basic/process-util.h                |  2 +-
>> - src/core/main.c                         |  4 ++--
>> - src/journal/test-journal-interleaving.c |  2 +-
>> - src/shared/pager.c                      |  2 +-
>> - src/udev/collect/collect.c              |  2 +-
>> - 9 files changed, 20 insertions(+), 21 deletions(-)
>> -
>> -Upstream-Status: Backport [https://github.com/systemd/systemd/pull/8456]
>> -
>> -diff --git a/src/basic/log.c b/src/basic/log.c
>> -index 7a7f2cbec..16a2431c5 100644
>> ---- a/src/basic/log.c
>> -+++ b/src/basic/log.c
>> -@@ -814,7 +814,7 @@ static void log_assert(
>> -         log_dispatch_internal(level, 0, file, line, func, NULL, NULL, NULL, NULL, buffer);
>> - }
>> -
>> --noreturn void log_assert_failed_realm(
>> -+_noreturn_ void log_assert_failed_realm(
>> -                 LogRealm realm,
>> -                 const char *text,
>> -                 const char *file,
>> -@@ -826,7 +826,7 @@ noreturn void log_assert_failed_realm(
>> -         abort();
>> - }
>> -
>> --noreturn void log_assert_failed_unreachable_realm(
>> -+_noreturn_ void log_assert_failed_unreachable_realm(
>> -                 LogRealm realm,
>> -                 const char *text,
>> -                 const char *file,
>> -diff --git a/src/basic/log.h b/src/basic/log.h
>> -index efcf0f1bf..314be128a 100644
>> ---- a/src/basic/log.h
>> -+++ b/src/basic/log.h
>> -@@ -186,7 +186,7 @@ int log_dump_internal(
>> -                 char *buffer);
>> -
>> - /* Logging for various assertions */
>> --noreturn void log_assert_failed_realm(
>> -+_noreturn_ void log_assert_failed_realm(
>> -                 LogRealm realm,
>> -                 const char *text,
>> -                 const char *file,
>> -@@ -195,7 +195,7 @@ noreturn void log_assert_failed_realm(
>> - #define log_assert_failed(text, ...) \
>> -         log_assert_failed_realm(LOG_REALM, (text), __VA_ARGS__)
>> -
>> --noreturn void log_assert_failed_unreachable_realm(
>> -+_noreturn_ void log_assert_failed_unreachable_realm(
>> -                 LogRealm realm,
>> -                 const char *text,
>> -                 const char *file,
>> -diff --git a/src/basic/macro.h b/src/basic/macro.h
>> -index 95be63a20..8911edfc4 100644
>> ---- a/src/basic/macro.h
>> -+++ b/src/basic/macro.h
>> -@@ -53,6 +53,15 @@
>> - #else
>> - #define _fallthrough_
>> - #endif
>> -+/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
>> -+ * compiler versions */
>> -+#ifndef _noreturn_
>> -+#if __STDC_VERSION__ >= 201112L
>> -+#define _noreturn_ _Noreturn
>> -+#else
>> -+#define _noreturn_ __attribute__((noreturn))
>> -+#endif
>> -+#endif
>> -
>> - /* Temporarily disable some warnings */
>> - #define DISABLE_WARNING_DECLARATION_AFTER_STATEMENT                     \
>> -@@ -414,16 +423,6 @@ static inline unsigned long ALIGN_POWER2(unsigned long u) {
>> - #endif
>> - #endif
>> -
>> --/* Define C11 noreturn without <stdnoreturn.h> and even on older gcc
>> -- * compiler versions */
>> --#ifndef noreturn
>> --#if __STDC_VERSION__ >= 201112L
>> --#define noreturn _Noreturn
>> --#else
>> --#define noreturn __attribute__((noreturn))
>> --#endif
>> --#endif
>> --
>> - #define DEFINE_TRIVIAL_CLEANUP_FUNC(type, func)                 \
>> -         static inline void func##p(type *p) {                   \
>> -                 if (*p)                                         \
>> -diff --git a/src/basic/process-util.c b/src/basic/process-util.c
>> -index aa9846db5..e6120af5b 100644
>> ---- a/src/basic/process-util.c
>> -+++ b/src/basic/process-util.c
>> -@@ -987,7 +987,7 @@ bool is_main_thread(void) {
>> -         return cached > 0;
>> - }
>> -
>> --noreturn void freeze(void) {
>> -+_noreturn_ void freeze(void) {
>> -
>> -         log_close();
>> -
>> -diff --git a/src/basic/process-util.h b/src/basic/process-util.h
>> -index 93029e36e..5170adec7 100644
>> ---- a/src/basic/process-util.h
>> -+++ b/src/basic/process-util.h
>> -@@ -91,7 +91,7 @@ int pid_from_same_root_fs(pid_t pid);
>> -
>> - bool is_main_thread(void);
>> -
>> --noreturn void freeze(void);
>> -+_noreturn_ void freeze(void);
>> -
>> - bool oom_score_adjust_is_valid(int oa);
>> -
>> -diff --git a/src/core/main.c b/src/core/main.c
>> -index 076846a41..4b2d14923 100644
>> ---- a/src/core/main.c
>> -+++ b/src/core/main.c
>> -@@ -141,7 +141,7 @@ static uint64_t arg_default_tasks_max = UINT64_MAX;
>> - static sd_id128_t arg_machine_id = {};
>> - static EmergencyAction arg_cad_burst_action = EMERGENCY_ACTION_REBOOT_FORCE;
>> -
>> --noreturn static void freeze_or_reboot(void) {
>> -+_noreturn_ static void freeze_or_reboot(void) {
>> -
>> -         if (arg_crash_reboot) {
>> -                 log_notice("Rebooting in 10s...");
>> -@@ -156,7 +156,7 @@ noreturn static void freeze_or_reboot(void) {
>> -         freeze();
>> - }
>> -
>> --noreturn static void crash(int sig) {
>> -+_noreturn_ static void crash(int sig) {
>> -         struct sigaction sa;
>> -         pid_t pid;
>> -
>> -diff --git a/src/journal/test-journal-interleaving.c b/src/journal/test-journal-interleaving.c
>> -index 5a88b2774..d87bdbdd3 100644
>> ---- a/src/journal/test-journal-interleaving.c
>> -+++ b/src/journal/test-journal-interleaving.c
>> -@@ -37,7 +37,7 @@
>> -
>> - static bool arg_keep = false;
>> -
>> --noreturn static void log_assert_errno(const char *text, int error, const char *file, int line, const char *func) {
>> -+_noreturn_ static void log_assert_errno(const char *text, int error, const char *file, int line, const char *func) {
>> -         log_internal(LOG_CRIT, error, file, line, func,
>> -                      "'%s' failed at %s:%u (%s): %m", text, file, line, func);
>> -         abort();
>> -diff --git a/src/shared/pager.c b/src/shared/pager.c
>> -index 75db3c985..681af9c40 100644
>> ---- a/src/shared/pager.c
>> -+++ b/src/shared/pager.c
>> -@@ -47,7 +47,7 @@ static int stored_stderr = -1;
>> - static bool stdout_redirected = false;
>> - static bool stderr_redirected = false;
>> -
>> --noreturn static void pager_fallback(void) {
>> -+_noreturn_ static void pager_fallback(void) {
>> -         int r;
>> -
>> -         r = copy_bytes(STDIN_FILENO, STDOUT_FILENO, (uint64_t) -1, 0);
>> -diff --git a/src/udev/collect/collect.c b/src/udev/collect/collect.c
>> -index 2821640e9..c8fa47b3d 100644
>> ---- a/src/udev/collect/collect.c
>> -+++ b/src/udev/collect/collect.c
>> -@@ -58,7 +58,7 @@ static inline struct _mate *node_to_mate(struct udev_list_node *node)
>> -         return container_of(node, struct _mate, node);
>> - }
>> -
>> --noreturn static void sig_alrm(int signo)
>> -+_noreturn_ static void sig_alrm(int signo)
>> - {
>> -         exit(4);
>> - }
>> ---
>> -2.17.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch b/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>> deleted file mode 100644
>> index e56061f..0000000
>> --- a/meta/recipes-core/systemd/systemd/0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>> +++ /dev/null
>> @@ -1,173 +0,0 @@
>> -From c2b3ebe112ebfd9f9e82fb1531ee225c3152ca83 Mon Sep 17 00:00:00 2001
>> -From: Patrick Uiterwijk <patrick@puiterwijk.org>
>> -Date: Thu, 22 Feb 2018 19:41:30 +0100
>> -Subject: [PATCH] Fix format-truncation compile failure by typecasting USB IDs
>> - (#8250)
>> -
>> -This patch adds safe_atoux16 for parsing an unsigned hexadecimal 16bit int, and
>> -uses that for parsing USB device and vendor IDs.
>> -
>> -This fixes a compile error with gcc-8 because while we know that USB IDs are 2 bytes,
>> -the compiler does not know that.
>> -
>> -../src/udev/udev-builtin-hwdb.c:80:38: error: '%04X' directive output may be
>> -truncated writing between 4 and 8 bytes into a region of size between 2 and 6
>> -[-Werror=format-truncation=]
>> -
>> -Upstream-Status: Backport [https://github.com/systemd/systemd/commit/5547c12503a683290eaed47954ffcfb2d1bc03cd]
>> -
>> -Signed-off-by: Adam Williamson <awilliam@redhat.com>
>> -Signed-off-by: Patrick Uiterwijk <puiterwijk@redhat.com>
>> ----
>> - src/basic/parse-util.c       | 24 ++++++++++++++++++++++
>> - src/basic/parse-util.h       |  2 ++
>> - src/test/test-parse-util.c   | 39 ++++++++++++++++++++++++++++++++++++
>> - src/udev/udev-builtin-hwdb.c | 13 ++++++------
>> - 4 files changed, 71 insertions(+), 7 deletions(-)
>> -
>> -diff --git a/src/basic/parse-util.c b/src/basic/parse-util.c
>> -index 97533721d..ff3fc298a 100644
>> ---- a/src/basic/parse-util.c
>> -+++ b/src/basic/parse-util.c
>> -@@ -532,6 +532,30 @@ int safe_atoi16(const char *s, int16_t *ret) {
>> -         return 0;
>> - }
>> -
>> -+int safe_atoux16(const char *s, uint16_t *ret) {
>> -+        char *x = NULL;
>> -+        unsigned long l;
>> -+
>> -+        assert(s);
>> -+        assert(ret);
>> -+
>> -+        s += strspn(s, WHITESPACE);
>> -+
>> -+        errno = 0;
>> -+        l = strtoul(s, &x, 16);
>> -+        if (errno > 0)
>> -+                return -errno;
>> -+        if (!x || x == s || *x != 0)
>> -+                return -EINVAL;
>> -+        if (s[0] == '-')
>> -+                return -ERANGE;
>> -+        if ((unsigned long) (uint16_t) l != l)
>> -+                return -ERANGE;
>> -+
>> -+        *ret = (uint16_t) l;
>> -+        return 0;
>> -+}
>> -+
>> - int safe_atod(const char *s, double *ret_d) {
>> -         _cleanup_(freelocalep) locale_t loc = (locale_t) 0;
>> -         char *x = NULL;
>> -diff --git a/src/basic/parse-util.h b/src/basic/parse-util.h
>> -index 1eda1d7f9..727422056 100644
>> ---- a/src/basic/parse-util.h
>> -+++ b/src/basic/parse-util.h
>> -@@ -54,6 +54,8 @@ int safe_atou8(const char *s, uint8_t *ret);
>> - int safe_atou16(const char *s, uint16_t *ret);
>> - int safe_atoi16(const char *s, int16_t *ret);
>> -
>> -+int safe_atoux16(const char *s, uint16_t *ret);
>> -+
>> - static inline int safe_atou32(const char *s, uint32_t *ret_u) {
>> -         assert_cc(sizeof(uint32_t) == sizeof(unsigned));
>> -         return safe_atou(s, (unsigned*) ret_u);
>> -diff --git a/src/test/test-parse-util.c b/src/test/test-parse-util.c
>> -index 937500213..a99cea5a1 100644
>> ---- a/src/test/test-parse-util.c
>> -+++ b/src/test/test-parse-util.c
>> -@@ -468,6 +468,44 @@ static void test_safe_atoi16(void) {
>> -         assert_se(r == -EINVAL);
>> - }
>> -
>> -+static void test_safe_atoux16(void) {
>> -+        int r;
>> -+        uint16_t l;
>> -+
>> -+        r = safe_atoux16("1234", &l);
>> -+        assert_se(r == 0);
>> -+        assert_se(l == 0x1234);
>> -+
>> -+        r = safe_atoux16("abcd", &l);
>> -+        assert_se(r == 0);
>> -+        assert_se(l == 0xabcd);
>> -+
>> -+        r = safe_atoux16("  1234", &l);
>> -+        assert_se(r == 0);
>> -+        assert_se(l == 0x1234);
>> -+
>> -+        r = safe_atoux16("12345", &l);
>> -+        assert_se(r == -ERANGE);
>> -+
>> -+        r = safe_atoux16("-1", &l);
>> -+        assert_se(r == -ERANGE);
>> -+
>> -+        r = safe_atoux16("  -1", &l);
>> -+        assert_se(r == -ERANGE);
>> -+
>> -+        r = safe_atoux16("junk", &l);
>> -+        assert_se(r == -EINVAL);
>> -+
>> -+        r = safe_atoux16("123x", &l);
>> -+        assert_se(r == -EINVAL);
>> -+
>> -+        r = safe_atoux16("12.3", &l);
>> -+        assert_se(r == -EINVAL);
>> -+
>> -+        r = safe_atoux16("", &l);
>> -+        assert_se(r == -EINVAL);
>> -+}
>> -+
>> - static void test_safe_atou64(void) {
>> -         int r;
>> -         uint64_t l;
>> -@@ -745,6 +783,7 @@ int main(int argc, char *argv[]) {
>> -         test_safe_atolli();
>> -         test_safe_atou16();
>> -         test_safe_atoi16();
>> -+        test_safe_atoux16();
>> -         test_safe_atou64();
>> -         test_safe_atoi64();
>> -         test_safe_atod();
>> -diff --git a/src/udev/udev-builtin-hwdb.c b/src/udev/udev-builtin-hwdb.c
>> -index ca7f7c230..dbfe02429 100644
>> ---- a/src/udev/udev-builtin-hwdb.c
>> -+++ b/src/udev/udev-builtin-hwdb.c
>> -@@ -27,6 +27,7 @@
>> -
>> - #include "alloc-util.h"
>> - #include "hwdb-util.h"
>> -+#include "parse-util.h"
>> - #include "string-util.h"
>> - #include "udev-util.h"
>> - #include "udev.h"
>> -@@ -63,7 +64,7 @@ int udev_builtin_hwdb_lookup(struct udev_device *dev,
>> -
>> - static const char *modalias_usb(struct udev_device *dev, char *s, size_t size) {
>> -         const char *v, *p;
>> --        int vn, pn;
>> -+        uint16_t vn, pn;
>> -
>> -         v = udev_device_get_sysattr_value(dev, "idVendor");
>> -         if (!v)
>> -@@ -71,12 +72,10 @@ static const char *modalias_usb(struct udev_device *dev, char *s, size_t size) {
>> -         p = udev_device_get_sysattr_value(dev, "idProduct");
>> -         if (!p)
>> -                 return NULL;
>> --        vn = strtol(v, NULL, 16);
>> --        if (vn <= 0)
>> --                return NULL;
>> --        pn = strtol(p, NULL, 16);
>> --        if (pn <= 0)
>> --                return NULL;
>> -+        if (safe_atoux16(v, &vn) < 0)
>> -+		return NULL;
>> -+        if (safe_atoux16(p, &pn) < 0)
>> -+		return NULL;
>> -         snprintf(s, size, "usb:v%04Xp%04X*", vn, pn);
>> -         return s;
>> - }
>> ---
>> -2.17.0
>> -
>> diff --git a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch b/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>> deleted file mode 100644
>> index fcc7c50..0000000
>> --- a/meta/recipes-core/systemd/systemd/0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>> +++ /dev/null
>> @@ -1,53 +0,0 @@
>> -From f9fd4546c25a15629544bc4642a74d7909cc0840 Mon Sep 17 00:00:00 2001
>> -From: Martin Jansa <Martin.Jansa@gmail.com>
>> -Date: Fri, 1 Jun 2018 15:22:28 +0000
>> -Subject: [PATCH] time-util: fix build with gcc8 -Werror=format-truncation=
>> -
>> -* it fails with gcc8 when -O1 or -Os is used (and -ftree-vrp which is added by -O2 and higher isn't used)
>> -
>> -../git/src/basic/time-util.c: In function 'format_timespan':
>> -../git/src/basic/time-util.c:508:46: error: '%0*llu' directive output between 1 and 2147483647 bytes may cause result to exceed 'INT_MAX' [-Werror=format-truncation=]
>> -                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
>> -                                              ^~~~
>> -../git/src/basic/time-util.c:508:60: note: format string is defined here
>> -                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
>> -../git/src/basic/time-util.c:508:46: note: directive argument in the range [0, 18446744073709551614]
>> -                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
>> -                                              ^~~~
>> -../git/src/basic/time-util.c:507:37: note: 'snprintf' output 4 or more bytes (assuming 2147483651) into a destination of size 4294967295
>> -                                 k = snprintf(p, l,
>> -                                     ^~~~~~~~~~~~~~
>> -                                              "%s"USEC_FMT".%0*"PRI_USEC"%s",
>> -                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> -                                              p > buf ? " " : "",
>> -                                              ~~~~~~~~~~~~~~~~~~~
>> -                                              a,
>> -                                              ~~
>> -                                              j,
>> -                                              ~~
>> -                                              b,
>> -                                              ~~
>> -                                              table[i].suffix);
>> -                                              ~~~~~~~~~~~~~~~~
>> -cc1: some warnings being treated as errors
>> -
>> -Upstream-Status: Submitted https://github.com/systemd/systemd/pull/9156
>> -
>> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ----
>> - src/basic/time-util.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/src/basic/time-util.c b/src/basic/time-util.c
>> -index 0601d4fa9..db5a9cd78 100644
>> ---- a/src/basic/time-util.c
>> -+++ b/src/basic/time-util.c
>> -@@ -484,7 +484,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
>> -                 /* Let's see if we should shows this in dot notation */
>> -                 if (t < USEC_PER_MINUTE && b > 0) {
>> -                         usec_t cc;
>> --                        int j;
>> -+                        signed char j;
>> -
>> -                         j = 0;
>> -                         for (cc = table[i].usec; cc > 1; cc /= 10)
>> diff --git a/meta/recipes-core/systemd/systemd/libmount.patch b/meta/recipes-core/systemd/systemd/libmount.patch
>> deleted file mode 100644
>> index b59d5b7..0000000
>> --- a/meta/recipes-core/systemd/systemd/libmount.patch
>> +++ /dev/null
>> @@ -1,75 +0,0 @@
>> -Upstream-Status: Backport
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From 227b8a762fea1458547be2cdf0e6e4aac0079730 Mon Sep 17 00:00:00 2001
>> -From: Michael Olbrich <m.olbrich@pengutronix.de>
>> -Date: Mon, 26 Mar 2018 17:34:53 +0200
>> -Subject: [PATCH] core: don't include libmount.h in a header file (#8580)
>> -
>> -linux/fs.h sys/mount.h, libmount.h and missing.h all include MS_*
>> -definitions.
>> -
>> -To avoid problems, only one of linux/fs.h, sys/mount.h and libmount.h
>> -should be included. And missing.h must be included last.
>> -
>> -Without this, building systemd may fail with:
>> -
>> -In file included from [...]/libmount/libmount.h:31:0,
>> -                 from ../systemd-238/src/core/manager.h:23,
>> -                 from ../systemd-238/src/core/emergency-action.h:37,
>> -                 from ../systemd-238/src/core/unit.h:34,
>> -                 from ../systemd-238/src/core/dbus-timer.h:25,
>> -                 from ../systemd-238/src/core/timer.c:26:
>> -[...]/sys/mount.h:57:2: error: expected identifier before numeric constant
>> ----
>> - src/core/dbus-execute.c | 1 +
>> - src/core/manager.h      | 3 ++-
>> - src/core/mount.c        | 2 ++
>> - 3 files changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/src/core/dbus-execute.c b/src/core/dbus-execute.c
>> -index 7344623ebf6..c342093bca4 100644
>> ---- a/src/core/dbus-execute.c
>> -+++ b/src/core/dbus-execute.c
>> -@@ -18,6 +18,7 @@
>> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
>> - ***/
>> -
>> -+#include <sys/mount.h>
>> - #include <sys/prctl.h>
>> - #include <stdio_ext.h>
>> -
>> -diff --git a/src/core/manager.h b/src/core/manager.h
>> -index 28c5da225b1..e09e0cdf5e9 100644
>> ---- a/src/core/manager.h
>> -+++ b/src/core/manager.h
>> -@@ -20,7 +20,6 @@
>> -   along with systemd; If not, see <http://www.gnu.org/licenses/>.
>> - ***/
>> -
>> --#include <libmount.h>
>> - #include <stdbool.h>
>> - #include <stdio.h>
>> -
>> -@@ -34,6 +33,8 @@
>> - #include "list.h"
>> - #include "ratelimit.h"
>> -
>> -+struct libmnt_monitor;
>> -+
>> - /* Enforce upper limit how many names we allow */
>> - #define MANAGER_MAX_NAMES 131072 /* 128K */
>> -
>> -diff --git a/src/core/mount.c b/src/core/mount.c
>> -index 0e755da5c02..0154ebda5d6 100644
>> ---- a/src/core/mount.c
>> -+++ b/src/core/mount.c
>> -@@ -23,6 +23,8 @@
>> - #include <stdio.h>
>> - #include <sys/epoll.h>
>> -
>> -+#include <libmount.h>
>> -+
>> - #include "sd-messages.h"
>> -
>> - #include "alloc-util.h"
>> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_239.bb
>> similarity index 86%
>> rename from meta/recipes-core/systemd/systemd_237.bb
>> rename to meta/recipes-core/systemd/systemd_239.bb
>> index 3efca33..4cfb3be 100644
>> --- a/meta/recipes-core/systemd/systemd_237.bb
>> +++ b/meta/recipes-core/systemd/systemd_239.bb
>> @@ -4,7 +4,7 @@ PROVIDES = "udev"
>>   
>>   PE = "1"
>>   
>> -DEPENDS = "kmod intltool-native gperf-native acl readline libcap libcgroup util-linux"
>> +DEPENDS = "intltool-native gperf-native libcap util-linux"
>>   
>>   SECTION = "base/shell"
>>   
>> @@ -17,47 +17,41 @@ REQUIRED_DISTRO_FEATURES = "systemd"
>>   SRC_URI += "file://touchscreen.rules \
>>              file://00-create-volatile.conf \
>>              file://init \
>> -           file://0001-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
>> -           file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
>> -           file://0002-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>> -           file://0003-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
>> -           file://0004-implment-systemd-sysv-install-for-OE.patch \
>> -           file://0005-rules-whitelist-hd-devices.patch \
>> -           file://0006-Make-root-s-home-directory-configurable.patch \
>> -           file://0007-Revert-rules-remove-firmware-loading-rules.patch \
>> -           file://0008-Revert-udev-remove-userspace-firmware-loading-suppor.patch \
>> -           file://0009-remove-duplicate-include-uchar.h.patch \
>> -           file://0010-check-for-uchar.h-in-meson.build.patch \
>> -           file://0011-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
>> -           file://0012-rules-watch-metadata-changes-in-ide-devices.patch \
>> -           file://0013-add-fallback-parse_printf_format-implementation.patch \
>> -           file://0014-src-basic-missing.h-check-for-missing-strndupa.patch \
>> -           file://0015-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
>> -           file://0016-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch \
>> -           file://0017-Include-netinet-if_ether.h.patch \
>> -           file://0018-check-for-missing-canonicalize_file_name.patch \
>> -           file://0019-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch \
>> -           file://0020-test-hexdecoct.c-Include-missing.h-for-strndupa.patch \
>> -           file://0021-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
>> -           file://0022-don-t-use-glibc-specific-qsort_r.patch \
>> -           file://0023-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
>> -           file://0024-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
>> -           file://0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch \
>> -           file://0026-Use-uintmax_t-for-handling-rlim_t.patch \
>> -           file://0027-remove-nobody-user-group-checking.patch \
>> -           file://0028-add-missing-FTW_-macros-for-musl.patch \
>> -           file://0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
>> -           file://0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
>> -           file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
>> -           file://0032-memfd.patch \
>> -           file://0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch \
>> -           file://libmount.patch \
>> -           file://0034-Fix-format-truncation-compile-failure-by-typecasting.patch \
>> -           file://0035-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
>> -           file://0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch \
>> +           file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
>> +           file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
>> +           file://0003-implment-systemd-sysv-install-for-OE.patch \
>> +           file://0004-rules-whitelist-hd-devices.patch \
>> +           file://0005-Make-root-s-home-directory-configurable.patch \
>> +           file://0006-remove-nobody-user-group-checking.patch \
>> +           file://0007-rules-watch-metadata-changes-in-ide-devices.patch \
>> +           file://0008-Do-not-enable-nss-tests-if-nss-systemd-is-not-enable.patch \
>> +           file://0009-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
>>              "
>>   SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>   
>> +# patches made for musl are only applied on TCLIBC is musl
>> +SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') == 'musl' else ''}"
>> +SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-available.patch \
>> +               file://0002-don-t-use-glibc-specific-qsort_r.patch \
>> +               file://0003-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch \
>> +               file://0004-add-fallback-parse_printf_format-implementation.patch \
>> +               file://0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch \
>> +               file://0006-src-basic-missing.h-check-for-missing-strndupa.patch \
>> +               file://0007-Include-netinet-if_ether.h.patch \
>> +               file://0008-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
>> +               file://0009-add-missing-FTW_-macros-for-musl.patch \
>> +               file://0010-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
>> +               file://0011-src-basic-missing.h-check-for-missing-__compar_fn_t-.patch \
>> +               file://0012-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
>> +               file://0013-Use-uintmax_t-for-handling-rlim_t.patch \
>> +               file://0014-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
>> +               file://0015-test-hexdecoct.c-Include-missing.h-for-strndupa.patch \
>> +               file://0016-test-sizeof.c-Disable-tests-for-missing-typedefs-in-.patch \
>> +               file://0017-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch \
>> +               file://0018-Define-glibc-compatible-basename-for-non-glibc-syste.patch \
>> +               file://0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch \
>> +               "
>> +
>>   # Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
>>   SRC_URI_append_libc-musl_qemux86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
>>   SRC_URI_append_libc-musl_qemuppc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
>> @@ -72,12 +66,15 @@ PACKAGECONFIG ??= " \
>>       ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge', d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
>>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
>> +    acl \
>>       backlight \
>>       binfmt \
>>       firstboot \
>> +    gshadow \
>>       hibernate \
>>       hostnamed \
>>       ima \
>> +    kmod \
>>       localed \
>>       logind \
>>       machined \
>> @@ -98,6 +95,7 @@ PACKAGECONFIG ??= " \
>>   "
>>   
>>   PACKAGECONFIG_remove_libc-musl = " \
>> +    gshadow \
>>       localed \
>>       myhostname \
>>       nss \
>> @@ -113,6 +111,7 @@ PACKAGECONFIG_remove_libc-musl = " \
>>   # systemd-serialgetty.bb - not enabled by default.
>>   PACKAGECONFIG[serial-getty-generator] = ""
>>   
>> +PACKAGECONFIG[acl] = "-Dacl=true,-Dacl=false,acl"
>>   PACKAGECONFIG[audit] = "-Daudit=true,-Daudit=false,audit"
>>   PACKAGECONFIG[backlight] = "-Dbacklight=true,-Dbacklight=false"
>>   PACKAGECONFIG[binfmt] = "-Dbinfmt=true,-Dbinfmt=false"
>> @@ -125,6 +124,7 @@ PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils"
>>   PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
>>   # Sign the journal for anti-tampering
>>   PACKAGECONFIG[gcrypt] = "-Dgcrypt=true,-Dgcrypt=false,libgcrypt"
>> +PACKAGECONFIG[gshadow] = "-Dgshadow=true,-Dgshadow=false"
>>   PACKAGECONFIG[hibernate] = "-Dhibernate=true,-Dhibernate=false"
>>   PACKAGECONFIG[hostnamed] = "-Dhostnamed=true,-Dhostnamed=false"
>>   PACKAGECONFIG[ima] = "-Dima=true,-Dima=false"
>> @@ -133,6 +133,7 @@ PACKAGECONFIG[importd] = "-Dimportd=true,-Dimportd=false"
>>   # Update NAT firewall rules
>>   PACKAGECONFIG[iptc] = "-Dlibiptc=true,-Dlibiptc=false,iptables"
>>   PACKAGECONFIG[journal-upload] = "-Dlibcurl=true,-Dlibcurl=false,curl"
>> +PACKAGECONFIG[kmod] = "-Dkmod=true,-Dkmod=false,kmod"
>>   PACKAGECONFIG[ldconfig] = "-Dldconfig=true,-Dldconfig=false"
>>   PACKAGECONFIG[libidn] = "-Dlibidn=true,-Dlibidn=false,libidn"
>>   PACKAGECONFIG[localed] = "-Dlocaled=true,-Dlocaled=false"
>> @@ -146,6 +147,7 @@ PACKAGECONFIG[networkd] = "-Dnetworkd=true,-Dnetworkd=false"
>>   PACKAGECONFIG[nss] = "-Dnss-systemd=true,-Dnss-systemd=false"
>>   PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam,${PAM_PLUGINS}"
>>   PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false"
>> +PACKAGECONFIG[portabled] = "-Dportabled=true,-Dportabled=false"
>>   PACKAGECONFIG[qrencode] = "-Dqrencode=true,-Dqrencode=false,qrencode"
>>   PACKAGECONFIG[quotacheck] = "-Dquotacheck=true,-Dquotacheck=false"
>>   PACKAGECONFIG[randomseed] = "-Drandomseed=true,-Drandomseed=false"
>> @@ -181,7 +183,7 @@ EXTRA_OEMESON += "-Dlink-udev-shared=false"
>>   
>>   EXTRA_OEMESON += "-Dnobody-user=nobody \
>>                     -Dnobody-group=nobody \
>> -                  -Droothomedir=${ROOTHOME} \
>> +                  -Droothomedir=${ROOT_HOME} \
>>                     -Drootlibdir=${rootlibdir} \
>>                     -Drootprefix=${rootprefix} \
>>                     -Dsysvrcnd-path=${sysconfdir} \
>> @@ -314,7 +316,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--sys
>>   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
>>   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
>>   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
>> -GROUPADD_PARAM_${PN} = "-r systemd-journal"
>> +GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
>>   USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
>>   
>>   FILES_${PN}-analyze = "${bindir}/systemd-analyze"
>> @@ -432,6 +434,14 @@ CONFFILES_${PN} = "${sysconfdir}/machine-id \
>>                   ${sysconfdir}/systemd/user.conf"
>>   
>>   FILES_${PN} = " ${base_bindir}/* \
>> +                ${base_sbindir}/shutdown \
>> +                ${base_sbindir}/halt \
>> +                ${base_sbindir}/poweroff \
>> +                ${base_sbindir}/runlevel \
>> +                ${base_sbindir}/telinit \
>> +                ${base_sbindir}/resolvconf \
>> +                ${base_sbindir}/reboot \
>> +                ${base_sbindir}/init \
>>                   ${datadir}/dbus-1/services \
>>                   ${datadir}/dbus-1/system-services \
>>                   ${datadir}/polkit-1 \
>> @@ -456,6 +466,7 @@ FILES_${PN} = " ${base_bindir}/* \
>>                   ${bindir}/coredumpctl \
>>                   ${bindir}/localectl \
>>                   ${bindir}/hostnamectl \
>> +                ${bindir}/resolvectl \
>>                   ${bindir}/timedatectl \
>>                   ${bindir}/bootctl \
>>                   ${bindir}/kernel-install \
>> @@ -478,6 +489,8 @@ FILES_${PN} = " ${base_bindir}/* \
>>                   ${datadir}/dbus-1/system.d/org.freedesktop.systemd1.conf \
>>                   ${datadir}/dbus-1/system.d/org.freedesktop.hostname1.conf \
>>                   ${datadir}/dbus-1/system.d/org.freedesktop.login1.conf \
>> +                ${datadir}/dbus-1/system.d/org.freedesktop.timesync1.conf \
>> +                ${datadir}/dbus-1/system.d/org.freedesktop.portable1.conf \
>>                  "
>>   
>>   FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
>> @@ -536,34 +549,7 @@ python __anonymous() {
>>           d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>>   }
>>   
>> -# TODO:
>> -# u-a for runlevel and telinit
>> -
>> -ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
>> -
>> -ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
>> -ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
>> -ALTERNATIVE_PRIORITY[init] ?= "300"
>> -
>> -ALTERNATIVE_TARGET[halt] = "${base_bindir}/systemctl"
>> -ALTERNATIVE_LINK_NAME[halt] = "${base_sbindir}/halt"
>> -ALTERNATIVE_PRIORITY[halt] ?= "300"
>> -
>> -ALTERNATIVE_TARGET[reboot] = "${base_bindir}/systemctl"
>> -ALTERNATIVE_LINK_NAME[reboot] = "${base_sbindir}/reboot"
>> -ALTERNATIVE_PRIORITY[reboot] ?= "300"
>> -
>> -ALTERNATIVE_TARGET[shutdown] = "${base_bindir}/systemctl"
>> -ALTERNATIVE_LINK_NAME[shutdown] = "${base_sbindir}/shutdown"
>> -ALTERNATIVE_PRIORITY[shutdown] ?= "300"
>> -
>> -ALTERNATIVE_TARGET[poweroff] = "${base_bindir}/systemctl"
>> -ALTERNATIVE_LINK_NAME[poweroff] = "${base_sbindir}/poweroff"
>> -ALTERNATIVE_PRIORITY[poweroff] ?= "300"
>> -
>> -ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>> -ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>> -ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>> +ALTERNATIVE_${PN} = "resolv-conf"
>>   
>>   ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
>>   ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
>>
>


--------------15266F481D0F0AF7B96DF0DC
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9
dXRmLTgiIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSI+CiAgPC9oZWFkPgogIDxib2R5IGJn
Y29sb3I9IiNGRkZGRkYiIHRleHQ9IiMwMDAwMDAiPgogICAgPGRpdiBjbGFzcz0ibW96LWNp
dGUtcHJlZml4Ij5IaSBLaGVtLDxicj4KICAgICAgPGJyPgogICAgICBUaGFua3MgZm9yIHlv
dXIgcmV2aWV3Ljxicj4KICAgICAgPGJyPgogICAgICBJJ3ZlIGdvbmUgdGhyb3VnaCB5b3Vy
IGZlZWRiYWNrIG9uZSBieSBvbmUuIFBsZWFzZSBzZWUgY29tbWVudHMgaW4KICAgICAgbGlu
ZS48YnI+CiAgICAgIDxicj4KICAgICAgSSdsbCBzZW5kIG91dCBWMiB3aXRoIGEgZmV3IG90
aGVyIGZpeGVzLjxicj4KICAgICAgPGJyPgogICAgICA8YnI+CiAgICAgIE9uIDA3LzA2LzIw
MTggMTI6MzcgQU0sIEtoZW0gUmFqIHdyb3RlOjxicj4KICAgIDwvZGl2PgogICAgPGJsb2Nr
cXVvdGUKICAgICAgY2l0ZT0ibWlkOjUwNDU1NTgzLTkxZTEtOGVjZi1iNzM3LTI3Yjc3M2E3
ZmQ4MkBnbWFpbC5jb20iCiAgICAgIHR5cGU9ImNpdGUiPgogICAgICA8cHJlIHdyYXA9IiI+
T24gNy81LzE4IDEyOjMxIEFNLCBDaGVuIFFpIHdyb3RlOgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPlVwZ3JhZGUgc3lzdGVt
ZCB0byAyMzkuCgoxLiBQYXRjaCBDaGFuZ2VzCiogUmViYXNlZCBQYXRjaGVzCiAgMDAwMi1i
aW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWluc3RhbGwtdGltLnBh
dGNoCiAgMDAwMy11c2UtbG5yLXdyYXBwZXItaW5zdGVhZC1vZi1sb29raW5nLWZvci1yZWxh
dGl2ZS1vcHRpLnBhdGNoCiAgMDAwNi1NYWtlLXJvb3Qtcy1ob21lLWRpcmVjdG9yeS1jb25m
aWd1cmFibGUucGF0Y2gKICAwMDI3LXJlbW92ZS1ub2JvZHktdXNlci1ncm91cC1jaGVja2lu
Zy5wYXRjaAogIDAwMTEtc29ja2V0LXV0aWwtZG9uLXQtZmFpbC1pZi1saWJjLWRvZXNuLXQt
c3VwcG9ydC1JRE4ucGF0Y2gKICAwMDEzLWFkZC1mYWxsYmFjay1wYXJzZV9wcmludGZfZm9y
bWF0LWltcGxlbWVudGF0aW9uLnBhdGNoCiAgMDAxNC1zcmMtYmFzaWMtbWlzc2luZy5oLWNo
ZWNrLWZvci1taXNzaW5nLXN0cm5kdXBhLnBhdGNoCiAgMDAxNS1kb24tdC1mYWlsLWlmLUdM
T0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVOQy1pcy1ub3QtLnBhdGNoCiAgMDAxNi1zcmMt
YmFzaWMtbWlzc2luZy5oLWNoZWNrLWZvci1taXNzaW5nLV9fY29tcGFyX2ZuX3QtLnBhdGNo
CiAgMDAxNy1JbmNsdWRlLW5ldGluZXQtaWZfZXRoZXIuaC5wYXRjaAogIDAwMTktRG8tbm90
LWVuYWJsZS1uc3MtdGVzdHMtaWYtbnNzLXN5c3RlbWQtaXMtbm90LWVuYWJsZS5wYXRjaAog
IDAwMjItZG9uLXQtdXNlLWdsaWJjLXNwZWNpZmljLXFzb3J0X3IucGF0Y2gKICAwMDI0LWNv
bXBhcmlzb25fZm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3LXNpZ25hdHVyZS0ucGF0
Y2gKICAwMDI2LVVzZS11aW50bWF4X3QtZm9yLWhhbmRsaW5nLXJsaW1fdC5wYXRjaAogIDAw
MzAtZml4LW1pc3Npbmctb2YtX19yZWdpc3Rlcl9hdGZvcmstZm9yLW5vbi1nbGliYy1idWls
ZC5wYXRjaAogIDAwMzEtZml4LW1pc3NpbmctVUxPTkdfTE9OR19NQVgtZGVmaW5pdGlvbi1p
bi1jYXNlLW9mLW11cy5wYXRjaAogIDAwMDEtY29yZS1kZXZpY2UuYy1DaGFuZ2UtdGhlLWRl
ZmF1bHQtZGV2aWNlLXRpbWVvdXQtdG8tMi5wYXRjaAogIDAwMDEtUmVtb3ZlLWZzdGFjay1w
cm90ZWN0b3ItZmxhZ3MtdG8td29ya2Fyb3VuZC1tdXNsLWJ1aS5wYXRjaAoKKiBEcm9wcGVk
IFBhdGNoZXMgYW5kIFJlYXNvbnMKICAwMDAxLUhpZGUtX19zdGFydF9CVVNfRVJST1JfTUFQ
LWFuZC1fX3N0b3BfQlVTX0VSUk9SX01BUC5wYXRjaAogICAgVGhpcyBwYXRjaCBpcyBkcm9w
cGVkIGJlY2F1c2UgdGhlcmUncyBubyBidWlsZCBhbmQgcnVudGltZQogICAgZXJyb3Igd2l0
aG91dCBpdC4gSW4gdGhlIHBhdGNoJ3MgY29tbWl0IG1lc3NhZ2UsIGl0IHNheXMgZm9yCiAg
ICBzb21lIHVua25vd24gcmVhc29uLCBzeXN0ZW1kIDIzNCBuZWVkcyBpdC4gQnV0IGFmdGVy
IGRvaW5nCiAgICBidWlsZCBhbmQgcnVudGltZSB0ZXN0LCBJIGNhbiBzZWUgdGhhdCBzeXN0
ZW1kIDIzOSBkb2Vzbid0CiAgICBuZWVkIGl0Lgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICA8cHJlIHdyYXA9IiI+CklJUkMgaXQgaGFwcGVuZCB3aXRoIGdvbGQgbGlua2Vy
IHNlZQo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dp
dGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2lzc3Vlcy8yMzQiPmh0dHBzOi8vZ2l0aHViLmNv
bS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzIzNDwvYT4KCklmIHdlIG5lZWQgdG8gZHJvcCBp
dCB0aGVuIHBsZWFzZSB2YWxpZGF0ZSBpdCBsZC1pcy1nb2xkIGRpc3RybyBmZWF0dXJlCnRo
ZSByZWxldmFudCBsaW5rZXIgYnVnIHNlZW1zIHRvIGJlIGZpeGVkIGJ1dCB3ZSBuZWVkIHRv
IGVuc3VyZQo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIFRoZSBwcm9i
bGVtIGhhcyBiZWVuIGZpeGVkIGJ5IGJpbnV0aWxzIHVwc3RyZWFtLjxicj4KICAgIEknbGwg
dXBkYXRlIHRoZSByZWFzb24gYWJvdXQgd2h5IGRyb3BwaW5nIHRoaXMgcGF0Y2ggaW4gY29t
bWl0CiAgICBtZXNzYWdlIGluIFYyLjxicj4KICAgIDxicj4KICAgIDxibG9ja3F1b3RlCiAg
ICAgIGNpdGU9Im1pZDo1MDQ1NTU4My05MWUxLThlY2YtYjczNy0yN2I3NzNhN2ZkODJAZ21h
aWwuY29tIgogICAgICB0eXBlPSJjaXRlIj4KICAgICAgPHByZSB3cmFwPSIiPgo8L3ByZT4K
ICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPgog
IDAwMDctUmV2ZXJ0LXJ1bGVzLXJlbW92ZS1maXJtd2FyZS1sb2FkaW5nLXJ1bGVzLnBhdGNo
CiAgMDAwOC1SZXZlcnQtdWRldi1yZW1vdmUtdXNlcnNwYWNlLWZpcm13YXJlLWxvYWRpbmct
c3VwcG9yLnBhdGNoCiAgICBUaGVzZSB0d28gcGF0Y2hlcyBhcmUgZHJvcHBlZCBiZWNhdXNl
IHRoZXkgYXJlIGZvciBrZXJuZWwgJmx0OyAzLjcuCiAgICBCdXQgdGhlIGN1cnJlbnQgbWlu
aW1hbCByZXF1aXJlbWVudCBvZiBrZXJuZWwgdG8gYnVpbGQgc3lzdGVtZAogICAgaXMgYXMg
YmVsb3cuCiAgICBSRVFVSVJFTUVOVFM6CiAgICAgICAgTGludXgga2VybmVsICZndDs9IDMu
MTMKICAgICAgICBMaW51eCBrZXJuZWwgJmd0Oz0gNC4yIGZvciB1bmlmaWVkIGNncm91cCBo
aWVyYXJjaHkgc3VwcG9ydAogICAgU28gdGhlc2UgdHdvIHBhdGNoZXMgbm8gbG9uZyBtYWtl
IGFueSBzZW5zZS4KCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3Jh
cD0iIj4KSSB0aGluayB0aGVyZSB3ZXJlL2FyZSBPRSB1c2VycyB3aG8gc3RpbGwgdXNlIGtl
cm5lbCAmbHQ7IDMuNywgaWYgbm8gb25lCmNoaW1lcyBpbiwgSSBhbSBvayB0byBkcm9wIHRo
ZW0uCgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICAgIDxibG9ja3F1b3Rl
CiAgICAgIGNpdGU9Im1pZDo1MDQ1NTU4My05MWUxLThlY2YtYjczNy0yN2I3NzNhN2ZkODJA
Z21haWwuY29tIgogICAgICB0eXBlPSJjaXRlIj4KICAgICAgPGJsb2NrcXVvdGUgdHlwZT0i
Y2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPiAgMDAwOS1yZW1vdmUtZHVwbGljYXRlLWlu
Y2x1ZGUtdWNoYXIuaC5wYXRjaAogIDAwMTAtY2hlY2stZm9yLXVjaGFyLmgtaW4tbWVzb24u
YnVpbGQucGF0Y2gKICAgIFRoZXNlIHR3byBwYXRjaGVzIGFyZSBkcm9wcGVkIGJlY2F1c2Ug
bXVzbCBoYXMgaW1wbGVtZW50ZWQKICAgIHVjaGFyLmguIFNlZSBjb21taXQgYmVsb3cgZnJv
bSBtdXNsIHJlcG8uCiAgICAiIiIKICAgIGFiOTY3MmFlNzMyNDhmNTFlMzBmNDU1M2M0Yjg4
Nzg1MjVlNDYzODMKICAgIGltcGxlbWVudCB1Y2hhci5oIChDMTEgVVRGLTE2LzMyIGNvbnZl
cnNpb24pIGludGVyZmFjZXMKICAgICIiIgoKPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4K
ICAgICAgPHByZSB3cmFwPSIiPgpUaGlzIGlzIGZpbmUuCgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPiAgMDAxOC1jaGVjay1m
b3ItbWlzc2luZy1jYW5vbmljYWxpemVfZmlsZV9uYW1lLnBhdGNoCiAgICBUaGUgYWJvdmUg
cGF0Y2ggaXMgZHJvcHBlZCBiZWNhdXNlIGN1cnJlbnQgc3lzdGVtZCBkb2VzIG5vdCBuZWVk
CiAgICBjYW5vbmljYWxpemVfZmlsZV9uYW1lLgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3Rl
PgogICAgICA8cHJlIHdyYXA9IiI+Ck9LCgo8L3ByZT4KICAgICAgPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPgogIDAwMjUtRGVmaW5lLV9QQVRIX1dU
TVBYLWFuZC1fUEFUSF9VVE1QWC1pZi1ub3QtZGVmaW5lZC5wYXRjaAogICAgVGhlIGFib3Zl
IHBhdGNoIGlzIGRyb3BwZWQgYmVjYXVzZSB1dG1wIG1ha2VzIG5vIHNlbnNlIGluIG11c2wu
CiAgICBDaGVjayBjb2RlIGJlbG93IGZyb20gbXVzbC4KICAgIGluY2x1ZGUvdXRtcC5oOiNk
ZWZpbmUgX1BBVEhfVVRNUCAiL2Rldi9udWxsL3V0bXAiCiAgICBBbmQgdXRtcCBQQUNLQUdF
Q09ORklHIGhhcyBiZWVuIGV4cGxpY2l0bHkgZGlzYWJsZWQgZm9yIG11c2wuCiAgICBTbyB3
ZSBkb24ndCBuZWVkIHRoaXMgcGF0Y2guCgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgog
ICAgICA8cHJlIHdyYXA9IiI+CndoaWxlIHV0bXAgaXMgZGlzYWJsZWQgZm9yIG11c2wsIEkg
dGhpbmsgdGhlIGFib3ZlIHBhdGNoIGlzIGluIGRpcmVjdGlvbgp0byBlbmFibGUgaXQgZnVs
bHkgZm9yIG11c2wuIEkgd291bGQgc3VnZ2VzdCB0aGF0IHdlIGZpcnN0IHRyeSB0byBlbmFi
bGUKdXRtcCBmb3IgbXVzbCBhbG9uZyB3aXRoIHRoaXMgcGF0Y2gsIEkgcmVtZW1iZXIgdGhl
cmUgd2VyZSBzb21lIGtpbmtzCmFuZCBpZiB0aGUgYnVpbGQgc3RpbGwgZmFpbHMgcHJvYmFi
bHkgaXRzIGZpbmUgdG8gZHJvcCBpdC4KPC9wcmU+CiAgICA8L2Jsb2NrcXVvdGU+CiAgICA8
YnI+CiAgICBJbiBnbGliYywgd2UgaGF2ZTxicj4KICAgIHN5c2RlcHMvdW5peC9zeXN2L2xp
bnV4L3BhdGhzLmg6I2RlZmluZcKgwqDCoCBfUEFUSF9XVE1QwqDCoMKgCiAgICAiL3Zhci9s
b2cvd3RtcCI8YnI+CiAgICA8YnI+CiAgICBJbiBtdXNsLCB3ZSBoYXZlOjxicj4KICAgIGlu
Y2x1ZGUvdXRtcC5oOiNkZWZpbmUgX1BBVEhfV1RNUCAiL2Rldi9udWxsL3d0bXAiPGJyPgog
ICAgPGJyPgogICAgUGxlYXNlIHNlZSB0aGUgZm9sbG93aW5nIGNvbW1pdCBpbiBtdXNsIHJl
cG86PGJyPgogICAgIiIiPGJyPgogICAgY29tbWl0IDFlMjI4MWI4MzU2ZDE5MzVhMTI5ZGRi
MTk5ZDcxNjc3ZjE5YTE2MTk8YnI+CiAgICBBdXRob3I6IFJpY2ggRmVsa2VyIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpkYWxpYXNAYWVyaWZhbC5j
eCI+Jmx0O2RhbGlhc0BhZXJpZmFsLmN4Jmd0OzwvYT48YnI+CiAgICBEYXRlOsKgwqAgVGh1
IEp1biAyNyAyMDowMDoyOSAyMDEzIC0wNDAwPGJyPgogICAgPGJyPgogICAgwqDCoMKgIG1p
bm9yIGNvbXBhdGliaWxpdHkgZml4ZXMgaW4gdXRtcC5oIGFuZCBmaXhpbmcgbWlzbWF0Y2gg
d2l0aAogICAgcGF0aHMuaDxicj4KICAgIMKgwqDCoCA8YnI+CiAgICDCoMKgwqAgdGhlIHBh
dGhuYW1lcyBwcmVmaXhlZCB3aXRoIC9kZXYvbnVsbC8gYXJlIGd1YXJhbnRlZWQgbmV2ZXIg
dG8KICAgIGJlPGJyPgogICAgwqDCoMKgIHZhbGlkLiB0aGUgcHJldmlvdXMgdXNlIG9mIC9k
ZXYvbnVsbCBhbG9uZSB3YXMgbWlsZGx5IGRhbmdlcm91cwogICAgaW48YnI+CiAgICDCoMKg
wqAgdGhhdCBiYWQgc29mdHdhcmUgbWlnaHQgYXR0ZW1wdCB0byB1bmxpbmsgdGhlIG5hbWUg
d2hlbiBpdCBmb3VuZAogICAgYTxicj4KICAgIMKgwqDCoCBub24tcmVndWxhciBmaWxlIHRo
ZXJlIGFuZCBjcmVhdGUgYSBuZXcgZmlsZS48YnI+CiAgICA8YnI+CiAgICAiIiI8YnI+CiAg
ICA8YnI+CiAgICBTbyBlbmFibGluZyB1dG1wIGRvZXMgbm90IGhhdmUgYW55IHJlYWwgZWZm
ZWN0IGZvciBtdXNsLjxicj4KICAgIFRoYXQncyB3aHkgSSBkcm9wcGVkIHRoaXMgcGF0Y2gu
PGJyPgogICAgPGJyPgogICAgPGJsb2NrcXVvdGUKICAgICAgY2l0ZT0ibWlkOjUwNDU1NTgz
LTkxZTEtOGVjZi1iNzM3LTI3Yjc3M2E3ZmQ4MkBnbWFpbC5jb20iCiAgICAgIHR5cGU9ImNp
dGUiPgogICAgICA8cHJlIHdyYXA9IiI+CjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBl
PSJjaXRlIj4KICAgICAgICA8cHJlIHdyYXA9IiI+ICAwMDMyLW1lbWZkLnBhdGNoCiAgMDAz
My1iYXNpYy1tYWNyb3MtcmVuYW1lLW5vcmV0dXJuLWludG8tX25vcmV0dXJuXy04NDU2LnBh
dGNoCiAgbGlibW91bnQucGF0Y2gKICAwMDM0LUZpeC1mb3JtYXQtdHJ1bmNhdGlvbi1jb21w
aWxlLWZhaWx1cmUtYnktdHlwZWNhc3RpbmcucGF0Y2gKICAgIFRoZSBhYm92ZSBwYXRjaGVz
IGFyZSBkcm9wcGVkIGJlY2F1c2UgdGhleSBhcmUgYmFja3BvcnRlZCBwYXRjaGVzLgogICAg
QW5kIGN1cnJlbnQgc3lzdGVtZCBoYXMgY29udGFpbmVkIHRoZXNlIHBhdGNoZXMuCgo8L3By
ZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIHdyYXA9IiI+Ck9LCgo8L3ByZT4K
ICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSB3cmFwPSIiPiAg
MDAzNi10aW1lLXV0aWwtZml4LWJ1aWxkLXdpdGgtZ2NjOC1XZXJyb3ItZm9ybWF0LXRydW5j
YXRpLnBhdGNoCiAgICBUaGUgYWJvdmUgcGF0Y2ggaXMgZHJvcHBlZCBiZWNhdXNlIGl0IGhh
cyBiZWVuIG1lcmdlZCBhbmQgaXMgbm93CiAgICBpbiBuZXcgdmVyc2lvbi4KPC9wcmU+CiAg
ICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSB3cmFwPSIiPgpPSwoKPC9wcmU+CiAgICAg
IDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgd3JhcD0iIj4KKiBOZXds
eSBBZGRlZCBQYXRjaAogIDAwMDUtaW5jbHVkZS1nc2hhZG93LW9ubHktaWYtRU5BQkxFX0dT
SEFET1ctaXMtMS5wYXRjaAogICAgVGhpcyBwYXRjaCBpcyBhZGRlZCB0byBmaXggYnVpbGQg
Zm9yIG11c2wuCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0i
Ij4KT0sKCjwvcHJlPgogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8
cHJlIHdyYXA9IiI+CiAgMDAxOS1Eby1ub3QtZGlzYWJsZS1idWZmZXJpbmctd2hlbi13cml0
aW5nLXRvLW9vbV9zY29yZV9hLnBhdGNoCiAgICBUaGlzIHBhdGNoIGlzIGFkZGVkIHRvIGZp
eCB0aGUgZm9sbG93aW5nIGVycm9yIHdoaWNoIGNhdXNlZCBzeXN0ZW0KICAgIHVuYWJsZSB0
byBib290IHVwLgogICAgICBzeXN0ZW1kLXVkZXZkLnNlcnZpY2U6IEZhaWxlZCB0byBhZGp1
c3QgT09NIHNldHRpbmc6IEludmFsaWQgYXJndW1lbnQKICAgICAgZGJ1cy5zZXJ2aWNlOiBG
YWlsZWQgdG8gYWRqdXN0IE9PTSBzZXR0aW5nOiBJbnZhbGlkIGFyZ3VtZW50Cgo8L3ByZT4K
ICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIHdyYXA9IiI+Ckkgd29uZGVyIGlmIGEg
cGF0Y2ggc2hvdWxkIGJlIGNvb2tlZCBpbiBsaW5lIG9mIHRoaXMgb25lCjxhIGNsYXNzPSJt
b3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9mbG9wcHlt
L3N5c3RlbWQvY29tbWl0LzE5ZWYxNDhhMjZlZjExYWZhZDFiYWFkMTIxMWM4MjViYzRkMzFi
YTciPmh0dHBzOi8vZ2l0aHViLmNvbS9mbG9wcHltL3N5c3RlbWQvY29tbWl0LzE5ZWYxNDhh
MjZlZjExYWZhZDFiYWFkMTIxMWM4MjViYzRkMzFiYTc8L2E+Cgo8L3ByZT4KICAgIDwvYmxv
Y2txdW90ZT4KICAgIDxicj4KICAgIEl0J3Mgc2ltaWxhciBidXQgaXQncyBub3QgdGhlIHNh
bWUuPGJyPgogICAgVGhlIGNvbW1pdCB5b3UgbWVudGlvbmVkIGlzIG1vcmUgYWJvdXQgYXZv
aWRpbmcgbG9zaW5nIGNvcnJlY3QgdmFsdWUKICAgIG9mIGVycm5vLjxicj4KICAgIE15IHBh
dGNoIGlzIHRvIGVuc3VyZSB3ZSBmZWVkICctOTAwJyB0byAvcHJvYy9QSUQvb29tX3Njb3Jl
X2FkagogICAgaW5zdGVhZCBvZiBqdXN0IGEgJy0nLjxicj4KICAgIDxicj4KICAgIFBsZWFz
ZSBjaGVjayB0aGUgZm9sbG93aW5nIGNvbW1pdCBpbiBzeXN0ZW1kLjxicj4KICAgICIiIjxi
cj4KICAgIGNvbW1pdCA5ZjgxNjhlYjIzM2QwMGIxMGU3ZDhhZTI1ZDlmYjRjOTY4OGI0YmM2
PGJyPgogICAgQXV0aG9yOiBMZW5uYXJ0IFBvZXR0ZXJpbmcgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmxlbm5hcnRAcG9ldHRlcmluZy5uZXQiPiZs
dDtsZW5uYXJ0QHBvZXR0ZXJpbmcubmV0Jmd0OzwvYT48YnI+CiAgICBEYXRlOsKgwqAgTW9u
IE1heSA3IDIwOjQ0OjQxIDIwMTggKzAyMDA8YnI+CiAgICA8YnI+CiAgICDCoMKgwqAgcHJv
Y2Vzcy11dGlsOiBhZGQgbmV3IGhlbHBlciBjYWxsIGZvciBhZGp1c3RpbmcgdGhlIE9PTSBz
Y29yZTxicj4KICAgIMKgwqDCoCA8YnI+CiAgICDCoMKgwqAgQW5kIGxldCdzIG1ha2UgdXNl
IG9mIGl0IGluIGV4ZWN1dGUuYzxicj4KICAgICIiIjxicj4KICAgIDxicj4KICAgIEJlZm9y
ZSB0aGlzIGNvbW1pdCwgaXQncyB1c2luZzxicj4KICAgIHdyaXRlX3N0cmluZ19maWxlKCIv
cHJvYy9zZWxmL29vbV9zY29yZV9hZGoiLCB0LCAwKTs8YnI+CiAgICA8YnI+CiAgICBBZnRl
ciB0aGlzIGNvbW1pdCwgaXQncyB1c2luZzxicj4KICAgIHdyaXRlX3N0cmluZ19maWxlKCIv
cHJvYy9zZWxmL29vbV9zY29yZV9hZGoiLAogICAgdCzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAogICAgV1JJVEVfU1RS
SU5HX0ZJTEVfVkVSSUZZX09OX0ZBSUxVUkV8V1JJVEVfU1RSSU5HX0ZJTEVfRElTQUJMRV9C
VUZGRVIpOzxicj4KICAgIDxicj4KICAgIEkgdGhpbmsganVzdCByZW1vdmluZyBXUklURV9T
VFJJTkdfRklMRV9ESVNBQkxFX0JVRkZFUiBpcyBlbm91Z2guPGJyPgogICAgPGJyPgogICAg
VGhlIHByb2JsZW0gb2NjdXJyZWQgb24gbXVzbCBidXQgbm90IGdsaWJjLiBJIGd1ZXNzIGl0
J3Mgc29tZQogICAgaW1wbGVtZW50YXRpb24gZGV0YWlscyBpbiBtdXNsIGFuZCBnbGliYyB0
aGF0IG1ha2UgdGhpcyBkaWZmZXJlbmNlLgogICAgQXMgSSBkb24ndCBzZWUgYW55IHJ1bnRp
bWUgcHJvYmxlbSB3aXRob3V0IHRoaXMgcGF0Y2ggZm9yIGdsaWJjLAogICAgdGhpcyBwYXRj
aCBpcyBtYXJrZWQgYXMgJ211c2wgc3BlY2lmaWMnLiA8YnI+CiAgICA8YnI+CiAgICA8Ymxv
Y2txdW90ZQogICAgICBjaXRlPSJtaWQ6NTA0NTU1ODMtOTFlMS04ZWNmLWI3MzctMjdiNzcz
YTdmZDgyQGdtYWlsLmNvbSIKICAgICAgdHlwZT0iY2l0ZSI+CiAgICAgIDxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUgd3JhcD0iIj4yLiBQQUNLQUdFQ09ORklHIGFu
ZCBEZXBlbmRlbmN5IENoYW5nZXMKKiBBZGQgYSBuZXcgUEFDS0FHRUNPTkZJRyBpdGVtICdn
c2hhZG93Jy4gRW5hYmxlIGl0IGJ5IGRlZmF1bHQgZm9yIGdsaWJjCiAgYnV0IGRpc2FibGUg
aXQgYnkgZGVmYXVsdCBmb3IgbXVzbC4gVGhpcyBpcyBiZWNhdXNlIG11c2wgZG9lcyBub3Qg
cHJvdmlkZQogIGdzaGFkb3cuaC4KPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAg
PHByZSB3cmFwPSIiPgpPSwoKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
PgogICAgICAgIDxwcmUgd3JhcD0iIj4KKiBBZGQgYSBuZXcgUEFDS0FHRUNPTkZJRyBpdGVt
ICdwb3J0YWJsZWQnLiBEZWZhdWx0IHRvIGRpc2FibGUgaXQgYmVjYXVzZQogIGl0J3Mgc3Rp
bGwgZXhwZXJpbWVudGFsLCBhY2NvcmRpbmcgdG8gdGhlIGFubm91bmNlbWVudCBsZXR0ZXIu
CiAgIiIiCiAgQ3VycmVudGx5LCB0aGUgc3VwcG9ydCBpcyBzdGlsbCBleHBlcmltZW50YWws
IGJ1dCB0aGlzIGlzIGV4cGVjdGVkIHRvCiAgY2hhbmdlIHNvb24uIFJlZmxlY3RpbmcgdGhp
cyBleHBlcmltZW50YWwgc3RhdGUsIHRoZSAicG9ydGFibGVjdGwiIGJpbmFyeQogIGlzIG5v
dCBpbnN0YWxsZWQgaW50byAvdXNyL2JpbiB5ZXQuCiAgIiIiCgoqIENoYW5nZSAna21vZCcg
ZnJvbSBhIGhhcmQgZGVwZW5kZW5jeSB0byBhIFBBQ0tBR0VDT05GSUcgaXRlbS4gRGVmYXVs
dAogIHRvIGVuYWJsZSBpdC4KCiogQ2hhbmdlICdhY2wnIGZyb20gYSBoYXJkIGRlcGVuZGVu
Y3kgdG8gYSBQQUNLQUdFQ09ORklHIGl0ZW0uIERlZmF1bHQKICB0byBlbmFibGUgaXQuCgoq
IFJlbW92ZSAncmVhZGxpbmUnIGZyb20gREVQRU5EUy4gc3lzdGVtZCBkb2VzIG5vdCBuZWVk
IGl0LgoKKiBSZW1vdmUgJ2xpYmNncm91cCcgZnJvbSBERVBFTkRTLiBUaGUgZGVwZW5kZW5j
eSBvbiBsaWJjZ3JvdXAgaGFzIGJlZW4KICByZW1vdmVkIGZyb20gc3lzdGVtZCBhIGxvbmcg
dGltZSBhZ28uIFdlIG5vdyByZW1vdmUgdGhpcyB1bm5lY2Vzc2FyeQogIGRlcGVuZGVuY3kg
ZnJvbSBERVBFTkRTLgoKMy4gdXBkYXRlLWFsdGVybmF0aXZlcyBjaGFuZ2VzCiAgVGhlIHV0
aWxpdGllcyBsaWtlIHNodXRkb3duLCBwb3dlcm9mZiwgZXRjLiBhcmUgbm93IGNyZWF0ZWQg
YXMgc3ltbGlua3MKICBhdCBkb19pbnN0YWxsLiBTbyB0aGVyZSdzIG5vIG5lZWQgdG8gdXNl
IHVwZGF0ZS1hbHRlcm5hdGl2ZXMgbWVjaGFuaXNtCiAgYW55bW9yZSB0byBjcmVhdGUgdGhl
IHN5bWxpbmtzIG5vdy4gSW4gYWRkdGlvbiwgSSBkb24ndCB0aGluayB3ZSBub3cKICBzdXBw
b3J0IG11bHRpcGxlIGluaXQgc3lzdGVtcyBhdCBvbmUgcnVubmluZyBzeXN0ZW0sIHNvIHRo
ZXJlJ3MgcmVhbGx5CiAgbm8gbmVlZCB0byB1c2UgdXBkYXRlLWFsdGVybmF0aXZlcyBtZWNo
YW5pc20gaGVyZS4KCiAgQWxzbyB1cGRhdGUgdGhlIEZJTEVTXyR7UE59IHRvIGluY2x1ZGUg
dGhlc2UgZmlsZXMgdG8gYXZvaWQgUUEgaXNzdWUuCgo0LiBTUkNfVVJJIENoYW5nZQogIEkn
dmUgcHV0IGFsbCBtdXNsIHNwZWNpZmljIHBhdGNoZXMgdG8gU1JDX1VSSV9NVVNMIGFuZCB0
aGV5IHdpbGwgb25seQogIGJlIGFwcGxpZWQgd2hlbiBUQ0xJQkMgaXMgbXVzbC4gVGhlIHJl
YXNvbiBJIGRvIHRoaXMgaXMgdGhhdCBzeXN0ZW1kCiAgdXBzdHJlYW0gaGFzIGJlZW4gcmVq
ZWN0ZWQgbm9uLWdsaWJjIGZpeGVzIGZvciBhIGxvbmcgdGltZSBhbmQgaXQgd2lsbAogIGNv
bnRpbnVlIHRvIHJlamVjdCBub24tZ2xpYmMgZml4ZXMuIEEgdHlwaWNhbCByZXBseSBpcyBs
aWtlICJwbGVhc2UKICB3b3JrIHdpdGggdGhlIG90aGVyIGxpYmNzIHRvIHByb3ZpZGUgZ2xp
YmMgY29tcGF0aWJpbGl0eS4iIFBsZWFzZSBzZWUKICBhbiBleGFtcGxlIGluIHRoaXMgbGlu
ayBiZWxvdy4KICA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRw
czovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3N5c3RlbWQtZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21zZzQwMTMwLmh0bWwiPmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vc3lz
dGVtZC1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcvbXNnNDAxMzAuaHRtbDwvYT4KCjwv
cHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxwcmUgd3JhcD0iIj4KU3BlY2lmaXlp
bmcgdGhlbSB1bmRlciBhIHNlcGFyYXRlIHZhcmlhYmxlIGlzIGdvb2QgaG93ZXZlciBhcHBs
eWluZyB0aGVtCmNvbmRpdGlvbmFsbHkgaXMgZ29pbmcgdG8gY2F1c2UgbWFpbnRlbmFuY2Ug
aXNzdWVzLiBJdCBhbHNvIG1ha2VzIGl0CmhhcmQgdG8ga2VlcCB0aGUgYXJndW1lbnQgZ29p
bmcgd2l0aCBzeXN0ZW1kIGRldnMgc2luY2Ugd2UgZG8gbm8gbG9uZ2VyCnRlc3QgdGhlbSB3
aXRoIGdsaWJjLiBTbyBsZXRzIGRyb3AgdGhlIGNvbmRpdGlvbmFsIGFwcGx5aW5nIG9mIHRo
ZXNlCnBhdGNoZXMuCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgogICAgSSd2
ZSBkb25lIHNvbWUgc2VyaW91cyB0aGlua2luZyBvbiB0aGlzIGlzc3VlLiBJIGZpbmFsbHkg
Y29tZSB0byBhCiAgICB2ZXJ5IGRpZmZlcmVudCB2aWV3IGhlcmUuPGJyPgogICAgPGJyPgog
ICAgVGhlIGN1cnJlbnQgc3RhdHVzIGlzIHRoYXQgc3lzdGVtZCBjb21tdW5pdHkgaXMgbm90
IGdvaW5nIHRvIGFjY2VwdAogICAgbm9uLWdsaWJjIGZpeGVzLjxicj4KICAgIElNSE8sIEkg
ZG9uJ3QgdGhpbmsgc29tZSBhcmd1bWVudHMgYXJlIGVub3VnaCB0byBtYWtlIHN5c3RlbWQK
ICAgIGNvbW11bml0eSBjaGFuZ2UgaXRzIG1pbmQuPGJyPgogICAgU28gYXMgZmFyIGFzIEkg
Y2FuIHNlZSwgdGhpcyBzdGF0dXMgd2lsbCBsYXN0IGZvciBhIGxvbmcgdGltZS48YnI+CiAg
ICA8YnI+CiAgICBJZiB3ZSBkbyB1bmNvbmRpdGlvbmFsIGFwcGx5IG9mIHRoZXNlIG11c2wg
cGF0Y2hlcywgd2UgYXJlIGdpdmluZwogICAgZ2xpYmMgc3lzdGVtZCBpbWFnZXMgcGF0Y2hl
cyB0aGF0IDEpIGZpeCBubyBlcnJvciBhbmQgMikgYXJlIG5vdAogICAgbGlrZWx5IHRvIGJl
IGFjY2VwdGVkIGJ5IHN5c3RlbWQgdXBzdHJlYW0uPGJyPgogICAgSSBkb24ndCB0aGluayB0
aGlzIHNob3VsZCBiZSB0aGUgZGVmYXVsdCBiZWhhdmlvci48YnI+CiAgICA8YnI+CiAgICBG
b3IgeW91IGNvbmNlcm4sIHRoZXNlIG11c2wgcGF0Y2hlcyBjb3VsZCB3b3JrIHdpdGggZ2xp
YmMuIEkndmUgZG9uZQogICAgYnVpbGQgYW5kIHJ1bnRpbWUgdGVzdGluZyB0byBjb25maXJt
IGl0Ljxicj4KICAgIDxicj4KICAgIEhhdmluZyBzYWlkIHRoYXQsIGl0J3MgbW9yZSBpbXBv
cnRhbnQgZm9yIG1lIHRvIHB1c2ggdGhpbmdzIGZvcndhcmQKICAgIGluc3RlYWQgb2YgaW5z
aXN0aW5nIG9uIHNvbWUgZGVmYXVsdCB2YWx1ZS48YnI+CiAgICA8YnI+CiAgICA8Yj48Zm9u
dCBzaXplPSIrMSI+U28gaWYgb3RoZXIgcGVvcGxlIGFsc28gcmVxdWlyZSB1bmNvbmRpdGlv
bmFsCiAgICAgICAgYXBwbHkgb2YgdGhlc2UgbXVzbCBwYXRjaGVzLCBsZXQncyBkbyBpdC48
L2ZvbnQ+PC9iPjxicj4KICAgIDxicj4KICAgIEJ1dCBmb3Igbm93LCBJJ2Qgc3VnZ2VzdCB3
ZSBkb24ndCBhcHBseSBtdXNsIHBhdGNoZXMgaW4gY2FzZSBvZgogICAgZ2xpYmMuPGJyPgog
ICAgPGJyPgogICAgQmVzdCBSZWdhcmRzLDxicj4KICAgIENoZW4gUWk8YnI+CiAgICA8YnI+
CiAgICA8YnI+CiAgICA8YmxvY2txdW90ZQogICAgICBjaXRlPSJtaWQ6NTA0NTU1ODMtOTFl
MS04ZWNmLWI3MzctMjdiNzczYTdmZDgyQGdtYWlsLmNvbSIKICAgICAgdHlwZT0iY2l0ZSI+
CiAgICAgIDxwcmUgd3JhcD0iIj4KPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiPgogICAgICAgIDxwcmUgd3JhcD0iIj5TaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRy
aXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgotLS0KIG1ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMgICAgICAgICAgICAgIHwgICAyICst
CiAuLi5ydF9CVVNfRVJST1JfTUFQLWFuZC1fX3N0b3BfQlVTX0VSUk9SX01BUC5wYXRjaCB8
ICAzNCAtLQogLi4uY2stcHJvdGVjdG9yLWZsYWdzLXRvLXdvcmthcm91bmQtbXVzbC1idWku
cGF0Y2ggfCAgMjggKy0KIC4uLm52LXdoZW4tc2VjdXJlLXZlcnNpb25zLWFyZS1ub3QtYXZh
aWxhYmxlLnBhdGNoIHwgIDEwICstCiAuLi4taW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0
LWluc3RhbGwtdGltLnBhdGNofSB8ICAyMiArLQogLi4uLmMtQ2hhbmdlLXRoZS1kZWZhdWx0
LWRldmljZS10aW1lb3V0LXRvLTIucGF0Y2ggfCAgMTkgKy0KIC4uLj0mZ3Q7IDAwMDItZG9u
LXQtdXNlLWdsaWJjLXNwZWNpZmljLXFzb3J0X3IucGF0Y2h9IHwgMTA4ICsrKysrLQogLi4u
cGVyLWluc3RlYWQtb2YtbG9va2luZy1mb3ItcmVsYXRpdmUtb3B0aS5wYXRjaH0gfCAgMTYg
Ky0KIC4uLm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3LXNpZ25hdHVyZS0ucGF0Y2h9
IHwgIDI1ICstCiAuLi4wMDMtaW1wbG1lbnQtc3lzdGVtZC1zeXN2LWluc3RhbGwtZm9yLU9F
LnBhdGNofSB8ICAxMCArLQogLi4ubGJhY2stcGFyc2VfcHJpbnRmX2Zvcm1hdC1pbXBsZW1l
bnRhdGlvbi5wYXRjaH0gfCAgNDkgKy0tCiAuLi5wYXRjaCA9Jmd0OyAwMDA0LXJ1bGVzLXdo
aXRlbGlzdC1oZC1kZXZpY2VzLnBhdGNofSB8ICAgOCArLQogLi4uLU1ha2Utcm9vdC1zLWhv
bWUtZGlyZWN0b3J5LWNvbmZpZ3VyYWJsZS5wYXRjaH0gfCAgMzQgKy0KIC4uLmNsdWRlLWdz
aGFkb3ctb25seS1pZi1FTkFCTEVfR1NIQURPVy1pcy0xLnBhdGNoIHwgIDI5ICsrCiAuLi4m
Z3Q7IDAwMDYtcmVtb3ZlLW5vYm9keS11c2VyLWdyb3VwLWNoZWNraW5nLnBhdGNofSB8ICA0
MCArLS0KIC4uLnNpYy1taXNzaW5nLmgtY2hlY2stZm9yLW1pc3Npbmctc3RybmR1cGEucGF0
Y2h9IHwgIDY2ICsrLS0KIC4uLnBhdGNoID0mZ3Q7IDAwMDctSW5jbHVkZS1uZXRpbmV0LWlm
X2V0aGVyLmgucGF0Y2h9IHwgIDUxICstLQogLi4uZXZlcnQtcnVsZXMtcmVtb3ZlLWZpcm13
YXJlLWxvYWRpbmctcnVsZXMucGF0Y2ggfCAgMjggLS0KIC4uLmVzLXdhdGNoLW1ldGFkYXRh
LWNoYW5nZXMtaW4taWRlLWRldmljZXMucGF0Y2h9IHwgICA2ICstCiAuLi5lLW5zcy10ZXN0
cy1pZi1uc3Mtc3lzdGVtZC1pcy1ub3QtZW5hYmxlLnBhdGNofSB8ICAxNiArLQogLi4uLXJl
bW92ZS11c2Vyc3BhY2UtZmlybXdhcmUtbG9hZGluZy1zdXBwb3IucGF0Y2ggfCAzNzcgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiAuLi5mLUdMT0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVO
Qy1pcy1ub3QtLnBhdGNofSB8ICA4NiArKystLQogLi4uPSZndDsgMDAwOS1hZGQtbWlzc2lu
Zy1GVFdfLW1hY3Jvcy1mb3ItbXVzbC5wYXRjaH0gfCAgMTIgKy0KIC4uLmVzLUJ1aWxkLWNv
bmRpdGlvbmFsbHktd2hlbi1FTkFCTEVfTVlIT1MucGF0Y2h9IHwgIDEwICstCiAuLi4vMDAw
OS1yZW1vdmUtZHVwbGljYXRlLWluY2x1ZGUtdWNoYXIuaC5wYXRjaCAgICB8ICA0MSAtLS0K
IC4uLi8wMDEwLWNoZWNrLWZvci11Y2hhci5oLWluLW1lc29uLmJ1aWxkLnBhdGNoICAgIHwg
IDQ1IC0tLQogLi4ubC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBwb3J0LUlETi5w
YXRjaH0gfCAgMTcgKy0KIC4uLnNzaW5nLmgtY2hlY2stZm9yLW1pc3NpbmctX19jb21wYXJf
Zm5fdC0ucGF0Y2h9IHwgIDIzICstCiAuLi5vZi1fX3JlZ2lzdGVyX2F0Zm9yay1mb3Itbm9u
LWdsaWJjLWJ1aWxkLnBhdGNofSB8ICAxOCArLQogLi4uJmd0OyAwMDEzLVVzZS11aW50bWF4
X3QtZm9yLWhhbmRsaW5nLXJsaW1fdC5wYXRjaH0gfCAgMzMgKy0KIC4uLlVMT05HX0xPTkdf
TUFYLWRlZmluaXRpb24taW4tY2FzZS1vZi1tdXMucGF0Y2h9IHwgIDEyICstCiAuLi54ZGVj
b2N0LmMtSW5jbHVkZS1taXNzaW5nLmgtZm9yLXN0cm5kdXBhLnBhdGNofSB8ICAxMiArLQog
Li4uYy1EaXNhYmxlLXRlc3RzLWZvci1taXNzaW5nLXR5cGVkZWZzLWluLS5wYXRjaH0gfCAg
MTQgKy0KIC4uLnNzLUFUX1NZTUxJTktfTk9GT0xMT1ctZmxhZy10by1mYWNjZXNzYXQucGF0
Y2h9IHwgIDIwICstCiAuLi4tY29tcGF0aWJsZS1iYXNlbmFtZS1mb3Itbm9uLWdsaWJjLXN5
c3RlLnBhdGNofSB8ICAxMSArLQogLi4uLWNoZWNrLWZvci1taXNzaW5nLWNhbm9uaWNhbGl6
ZV9maWxlX25hbWUucGF0Y2ggfCAgNDcgLS0tCiAuLi5ibGUtYnVmZmVyaW5nLXdoZW4td3Jp
dGluZy10by1vb21fc2NvcmVfYS5wYXRjaCB8ICAzOSArKysKIC4uLlBBVEhfV1RNUFgtYW5k
LV9QQVRIX1VUTVBYLWlmLW5vdC1kZWZpbmVkLnBhdGNoIHwgIDQzIC0tLQogbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzItbWVtZmQucGF0Y2ggfCAyNzIgLS0tLS0t
LS0tLS0tLS0tCiAuLi5jcm9zLXJlbmFtZS1ub3JldHVybi1pbnRvLV9ub3JldHVybl8tODQ1
Ni5wYXRjaCB8IDIwMyAtLS0tLS0tLS0tLQogLi4udHJ1bmNhdGlvbi1jb21waWxlLWZhaWx1
cmUtYnktdHlwZWNhc3RpbmcucGF0Y2ggfCAxNzMgLS0tLS0tLS0tLQogLi4uaXgtYnVpbGQt
d2l0aC1nY2M4LVdlcnJvci1mb3JtYXQtdHJ1bmNhdGkucGF0Y2ggfCAgNTMgLS0tCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvbGlibW91bnQucGF0Y2ggICB8ICA3NSAt
LS0tCiAuLi4vc3lzdGVtZC97c3lzdGVtZF8yMzcuYmIgPSZndDsgc3lzdGVtZF8yMzkuYmJ9
ICAgICB8IDEyNCArKystLS0tCiA0NCBmaWxlcyBjaGFuZ2VkLCA1NTkgaW5zZXJ0aW9ucygr
KSwgMTgwMiBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMS1IaWRlLV9fc3RhcnRfQlVTX0VSUk9SX01BUC1h
bmQtX19zdG9wX0JVU19FUlJPUl9NQVAucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvezAwMDItYmluZm10LURvbi10LWluc3RhbGwtZGVwZW5kZW5j
eS1saW5rcy1hdC1pbnN0YWxsLXRpbS5wYXRjaCA9Jmd0OyAwMDAxLWJpbmZtdC1Eb24tdC1p
bnN0YWxsLWRlcGVuZGVuY3ktbGlua3MtYXQtaW5zdGFsbC10aW0ucGF0Y2h9ICg4MyUpCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL3swMDIyLWRvbi10LXVz
ZS1nbGliYy1zcGVjaWZpYy1xc29ydF9yLnBhdGNoID0mZ3Q7IDAwMDItZG9uLXQtdXNlLWds
aWJjLXNwZWNpZmljLXFzb3J0X3IucGF0Y2h9ICg1MiUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kL3swMDAzLXVzZS1sbnItd3JhcHBlci1pbnN0ZWFkLW9m
LWxvb2tpbmctZm9yLXJlbGF0aXZlLW9wdGkucGF0Y2ggPSZndDsgMDAwMi11c2UtbG5yLXdy
YXBwZXItaW5zdGVhZC1vZi1sb29raW5nLWZvci1yZWxhdGl2ZS1vcHRpLnBhdGNofSAoODMl
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAyNC1jb21w
YXJpc29uX2ZuX3QtaXMtZ2xpYmMtc3BlY2lmaWMtdXNlLXJhdy1zaWduYXR1cmUtLnBhdGNo
ID0mZ3Q7IDAwMDMtY29tcGFyaXNvbl9mbl90LWlzLWdsaWJjLXNwZWNpZmljLXVzZS1yYXct
c2lnbmF0dXJlLS5wYXRjaH0gKDQ3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvezAwMDQtaW1wbG1lbnQtc3lzdGVtZC1zeXN2LWluc3RhbGwtZm9yLU9F
LnBhdGNoID0mZ3Q7IDAwMDMtaW1wbG1lbnQtc3lzdGVtZC1zeXN2LWluc3RhbGwtZm9yLU9F
LnBhdGNofSAoODYlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVt
ZC97MDAxMy1hZGQtZmFsbGJhY2stcGFyc2VfcHJpbnRmX2Zvcm1hdC1pbXBsZW1lbnRhdGlv
bi5wYXRjaCA9Jmd0OyAwMDA0LWFkZC1mYWxsYmFjay1wYXJzZV9wcmludGZfZm9ybWF0LWlt
cGxlbWVudGF0aW9uLnBhdGNofSAoOTMlKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZC97MDAwNS1ydWxlcy13aGl0ZWxpc3QtaGQtZGV2aWNlcy5wYXRjaCA9
Jmd0OyAwMDA0LXJ1bGVzLXdoaXRlbGlzdC1oZC1kZXZpY2VzLnBhdGNofSAoODklKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAwNi1NYWtlLXJvb3Qt
cy1ob21lLWRpcmVjdG9yeS1jb25maWd1cmFibGUucGF0Y2ggPSZndDsgMDAwNS1NYWtlLXJv
b3Qtcy1ob21lLWRpcmVjdG9yeS1jb25maWd1cmFibGUucGF0Y2h9ICg3MCUpCiBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDUtaW5j
bHVkZS1nc2hhZG93LW9ubHktaWYtRU5BQkxFX0dTSEFET1ctaXMtMS5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAyNy1yZW1vdmUtbm9ib2R5
LXVzZXItZ3JvdXAtY2hlY2tpbmcucGF0Y2ggPSZndDsgMDAwNi1yZW1vdmUtbm9ib2R5LXVz
ZXItZ3JvdXAtY2hlY2tpbmcucGF0Y2h9ICg0MCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kL3swMDE0LXNyYy1iYXNpYy1taXNzaW5nLmgtY2hlY2stZm9y
LW1pc3Npbmctc3RybmR1cGEucGF0Y2ggPSZndDsgMDAwNi1zcmMtYmFzaWMtbWlzc2luZy5o
LWNoZWNrLWZvci1taXNzaW5nLXN0cm5kdXBhLnBhdGNofSAoNzMlKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAxNy1JbmNsdWRlLW5ldGluZXQtaWZf
ZXRoZXIuaC5wYXRjaCA9Jmd0OyAwMDA3LUluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLnBh
dGNofSAoNjglKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDA3LVJldmVydC1ydWxlcy1yZW1vdmUtZmlybXdhcmUtbG9hZGluZy1y
dWxlcy5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97
MDAxMi1ydWxlcy13YXRjaC1tZXRhZGF0YS1jaGFuZ2VzLWluLWlkZS1kZXZpY2VzLnBhdGNo
ID0mZ3Q7IDAwMDctcnVsZXMtd2F0Y2gtbWV0YWRhdGEtY2hhbmdlcy1pbi1pZGUtZGV2aWNl
cy5wYXRjaH0gKDkyJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3Rl
bWQvezAwMTktRG8tbm90LWVuYWJsZS1uc3MtdGVzdHMtaWYtbnNzLXN5c3RlbWQtaXMtbm90
LWVuYWJsZS5wYXRjaCA9Jmd0OyAwMDA4LURvLW5vdC1lbmFibGUtbnNzLXRlc3RzLWlmLW5z
cy1zeXN0ZW1kLWlzLW5vdC1lbmFibGUucGF0Y2h9ICg2MCUpCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDgtUmV2ZXJ0LXVkZXYt
cmVtb3ZlLXVzZXJzcGFjZS1maXJtd2FyZS1sb2FkaW5nLXN1cHBvci5wYXRjaAogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAxNS1kb24tdC1mYWlsLWlm
LUdMT0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVOQy1pcy1ub3QtLnBhdGNoID0mZ3Q7IDAw
MDgtZG9uLXQtZmFpbC1pZi1HTE9CX0JSQUNFLWFuZC1HTE9CX0FMVERJUkZVTkMtaXMtbm90
LS5wYXRjaH0gKDY3JSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3Rl
bWQvezAwMjgtYWRkLW1pc3NpbmctRlRXXy1tYWNyb3MtZm9yLW11c2wucGF0Y2ggPSZndDsg
MDAwOS1hZGQtbWlzc2luZy1GVFdfLW1hY3Jvcy1mb3ItbXVzbC5wYXRjaH0gKDc5JSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvezAwMjktbnNzLW15bWFj
aGluZXMtQnVpbGQtY29uZGl0aW9uYWxseS13aGVuLUVOQUJMRV9NWUhPUy5wYXRjaCA9Jmd0
OyAwMDA5LW5zcy1teW1hY2hpbmVzLUJ1aWxkLWNvbmRpdGlvbmFsbHktd2hlbi1FTkFCTEVf
TVlIT1MucGF0Y2h9ICg4NCUpCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDktcmVtb3ZlLWR1cGxpY2F0ZS1pbmNsdWRlLXVjaGFy
LmgucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3N5c3RlbWQvMDAxMC1jaGVjay1mb3ItdWNoYXIuaC1pbi1tZXNvbi5idWlsZC5wYXRjaAog
cmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAxMS1zb2NrZXQt
dXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBwb3J0LUlETi5wYXRjaCA9Jmd0
OyAwMDEwLXNvY2tldC11dGlsLWRvbi10LWZhaWwtaWYtbGliYy1kb2Vzbi10LXN1cHBvcnQt
SUROLnBhdGNofSAoNjglKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC97MDAxNi1zcmMtYmFzaWMtbWlzc2luZy5oLWNoZWNrLWZvci1taXNzaW5nLV9fY29t
cGFyX2ZuX3QtLnBhdGNoID0mZ3Q7IDAwMTEtc3JjLWJhc2ljLW1pc3NpbmcuaC1jaGVjay1m
b3ItbWlzc2luZy1fX2NvbXBhcl9mbl90LS5wYXRjaH0gKDYzJSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvezAwMzAtZml4LW1pc3Npbmctb2YtX19yZWdp
c3Rlcl9hdGZvcmstZm9yLW5vbi1nbGliYy1idWlsZC5wYXRjaCA9Jmd0OyAwMDEyLWZpeC1t
aXNzaW5nLW9mLV9fcmVnaXN0ZXJfYXRmb3JrLWZvci1ub24tZ2xpYmMtYnVpbGQucGF0Y2h9
ICg3NSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL3swMDI2
LVVzZS11aW50bWF4X3QtZm9yLWhhbmRsaW5nLXJsaW1fdC5wYXRjaCA9Jmd0OyAwMDEzLVVz
ZS11aW50bWF4X3QtZm9yLWhhbmRsaW5nLXJsaW1fdC5wYXRjaH0gKDc3JSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvezAwMzEtZml4LW1pc3NpbmctVUxP
TkdfTE9OR19NQVgtZGVmaW5pdGlvbi1pbi1jYXNlLW9mLW11cy5wYXRjaCA9Jmd0OyAwMDE0
LWZpeC1taXNzaW5nLVVMT05HX0xPTkdfTUFYLWRlZmluaXRpb24taW4tY2FzZS1vZi1tdXMu
cGF0Y2h9ICg2NiUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1k
L3swMDIwLXRlc3QtaGV4ZGVjb2N0LmMtSW5jbHVkZS1taXNzaW5nLmgtZm9yLXN0cm5kdXBh
LnBhdGNoID0mZ3Q7IDAwMTUtdGVzdC1oZXhkZWNvY3QuYy1JbmNsdWRlLW1pc3NpbmcuaC1m
b3Itc3RybmR1cGEucGF0Y2h9ICg3MCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kL3swMDIxLXRlc3Qtc2l6ZW9mLmMtRGlzYWJsZS10ZXN0cy1mb3ItbWlz
c2luZy10eXBlZGVmcy1pbi0ucGF0Y2ggPSZndDsgMDAxNi10ZXN0LXNpemVvZi5jLURpc2Fi
bGUtdGVzdHMtZm9yLW1pc3NpbmctdHlwZWRlZnMtaW4tLnBhdGNofSAoNzMlKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC97MDAyMy1kb24tdC1wYXNzLUFU
X1NZTUxJTktfTk9GT0xMT1ctZmxhZy10by1mYWNjZXNzYXQucGF0Y2ggPSZndDsgMDAxNy1k
b24tdC1wYXNzLUFUX1NZTUxJTktfTk9GT0xMT1ctZmxhZy10by1mYWNjZXNzYXQucGF0Y2h9
ICg4OSUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL3swMDM1
LURlZmluZS1nbGliYy1jb21wYXRpYmxlLWJhc2VuYW1lLWZvci1ub24tZ2xpYmMtc3lzdGUu
cGF0Y2ggPSZndDsgMDAxOC1EZWZpbmUtZ2xpYmMtY29tcGF0aWJsZS1iYXNlbmFtZS1mb3It
bm9uLWdsaWJjLXN5c3RlLnBhdGNofSAoNzglKQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE4LWNoZWNrLWZvci1taXNzaW5nLWNh
bm9uaWNhbGl6ZV9maWxlX25hbWUucGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxOS1Eby1ub3QtZGlzYWJsZS1idWZmZXJp
bmctd2hlbi13cml0aW5nLXRvLW9vbV9zY29yZV9hLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjUtRGVmaW5lLV9QQVRI
X1dUTVBYLWFuZC1fUEFUSF9VVE1QWC1pZi1ub3QtZGVmaW5lZC5wYXRjaAogZGVsZXRlIG1v
ZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDMyLW1lbWZk
LnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLzAwMzMtYmFzaWMtbWFjcm9zLXJlbmFtZS1ub3JldHVybi1pbnRvLV9ub3JldHVy
bl8tODQ1Ni5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZC8wMDM0LUZpeC1mb3JtYXQtdHJ1bmNhdGlvbi1jb21waWxlLWZhaWx1
cmUtYnktdHlwZWNhc3RpbmcucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAzNi10aW1lLXV0aWwtZml4LWJ1aWxkLXdpdGgt
Z2NjOC1XZXJyb3ItZm9ybWF0LXRydW5jYXRpLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kL2xpYm1vdW50LnBhdGNoCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZF8yMzcuYmIgPSZndDsgc3lz
dGVtZF8yMzkuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kLmluYyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5p
bmMKaW5kZXggNWZhNDhlN2EuLjczNmUwYTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLmluYwpAQCAtMTQsNyArMTQsNyBAQCBMSUNFTlNFID0gIkdQTHYyICZhbXA7
IExHUEx2Mi4xIgogTElDX0ZJTEVTX0NIS1NVTSA9IDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9ImZpbGU6Ly9MSUNFTlNFLkdQTDI7bWQ1PTc1MTQxOTI2MGFhOTU0
NDk5ZjdhYmFhYmFhODgyYmJlXGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7bWQ1PTRmYmQ2NTM4
MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIj4iZmlsZTovL0xJQ0VOU0UuR1BMMjttZDU9NzUx
NDE5MjYwYWE5NTQ0OTlmN2FiYWFiYWE4ODJiYmUgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vTElDRU5TRS5MR1BMMi4xO21kNT00ZmJkNjUzODBjZGQyNTU5NTEwNzkwMDhiMzY0
NTE2YyI8L2E+CiAKLVNSQ1JFViA9ICI0NjY1OWY3ZGViOTYyZjU1YzcyOGU3MDU5N2UzN2My
YTNhYjYzMjZkIgorU1JDUkVWID0gImRlNzQzNmIwMmJhZGM4MjIwMGRjMTI3ZmYxOTBiODE1
NTc2OWI4ZTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3Rl
bWQuZ2l0O3Byb3RvY29sPWdpdCIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kLzAwMDEtSGlkZS1fX3N0YXJ0X0JVU19FUlJPUl9NQVAtYW5kLV9f
c3RvcF9CVVNfRVJST1JfTUFQLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLzAwMDEtSGlkZS1fX3N0YXJ0X0JVU19FUlJPUl9NQVAtYW5kLV9fc3RvcF9CVVNf
RVJST1JfTUFQLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAyY2ZmYzQy
Li4wMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAx
LUhpZGUtX19zdGFydF9CVVNfRVJST1JfTUFQLWFuZC1fX3N0b3BfQlVTX0VSUk9SX01BUC5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM0ICswLDAgQEAKLUZyb20gNjg3YTVhZjhkYzVk
MzhmOTE4YTZjZTA4ZmVkNTI5NzIzNGJmODM0NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
LUZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7
PC9hPgotRGF0ZTogRnJpLCAyIE1hciAyMDE4IDE4OjAwOjE3IC0wODAwCi1TdWJqZWN0OiBb
UEFUQ0hdIEhpZGUgX19zdGFydF9CVVNfRVJST1JfTUFQIGFuZCBfX3N0b3BfQlVTX0VSUk9S
X01BUAotCi1mb3IgY3VycmVudGx5IHVua25vd24gcmVhc29ucyB0aGV5IGdldCBleHBvcnRl
ZCB0byB0aGUgc2hhcmVkIGxpYnJpZXMKLWV2ZW4gd2l0aG91dCBiZWluZyBsaXN0ZWQgaW4g
dGhlIHN5bSBmaWxlCi0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZs
dDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgotLS0tCi0KLVVwc3RyZWFtLVN0YXR1czog
UGVuZGluZyBbIENvbmRpdGlvbmFsIG9uIG1hc3RlciBuZWVkaW5nIHRoaXMsIDIzNCBkb2Vz
IG5lZWQgaXQgXQotCi0gc3JjL2xpYnN5c3RlbWQvc2QtYnVzL2J1cy1lcnJvci5jIHwgNCAr
Ky0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
LQotZGlmZiAtLWdpdCBhL3NyYy9saWJzeXN0ZW1kL3NkLWJ1cy9idXMtZXJyb3IuYyBiL3Ny
Yy9saWJzeXN0ZW1kL3NkLWJ1cy9idXMtZXJyb3IuYwotaW5kZXggMzc4ZjdhMzc3Li40OWQ3
OTdhYmQgMTAwNjQ0Ci0tLS0gYS9zcmMvbGlic3lzdGVtZC9zZC1idXMvYnVzLWVycm9yLmMK
LSsrKyBiL3NyYy9saWJzeXN0ZW1kL3NkLWJ1cy9idXMtZXJyb3IuYwotQEAgLTcxLDggKzcx
LDggQEAgQlVTX0VSUk9SX01BUF9FTEZfUkVHSVNURVIgY29uc3Qgc2RfYnVzX2Vycm9yX21h
cCBidXNfc3RhbmRhcmRfZXJyb3JzW10gPSB7Ci0gfTsKLSAKLSAvKiBHQ0MgbWFwcyB0aGlz
IG1hZ2ljYWxseSB0byB0aGUgYmVnaW5uaW5nIGFuZCBlbmQgb2YgdGhlIEJVU19FUlJPUl9N
QVAgc2VjdGlvbiAqLwotLWV4dGVybiBjb25zdCBzZF9idXNfZXJyb3JfbWFwIF9fc3RhcnRf
QlVTX0VSUk9SX01BUFtdOwotLWV4dGVybiBjb25zdCBzZF9idXNfZXJyb3JfbWFwIF9fc3Rv
cF9CVVNfRVJST1JfTUFQW107Ci0rZXh0ZXJuIGNvbnN0IHNkX2J1c19lcnJvcl9tYXAgX19z
dGFydF9CVVNfRVJST1JfTUFQW10gX2hpZGRlbl87Ci0rZXh0ZXJuIGNvbnN0IHNkX2J1c19l
cnJvcl9tYXAgX19zdG9wX0JVU19FUlJPUl9NQVBbXSBfaGlkZGVuXzsKLSAKLSAvKiBBZGRp
dGlvbmFsIG1hcHMgcmVnaXN0ZXJlZCB3aXRoIHNkX2J1c19lcnJvcl9hZGRfbWFwKCkgYXJl
IGluIHRoaXMKLSAgKiBOVUxMIHRlcm1pbmF0ZWQgYXJyYXkgKi8KLS0tIAotMi4xNi4yCi0K
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAxLVJl
bW92ZS1mc3RhY2stcHJvdGVjdG9yLWZsYWdzLXRvLXdvcmthcm91bmQtbXVzbC1idWkucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMS1SZW1vdmUtZnN0
YWNrLXByb3RlY3Rvci1mbGFncy10by13b3JrYXJvdW5kLW11c2wtYnVpLnBhdGNoCmluZGV4
IGU5MTNlM2YuLmQ3NDU4MDAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDAxLVJlbW92ZS1mc3RhY2stcHJvdGVjdG9yLWZsYWdzLXRvLXdvcmth
cm91bmQtbXVzbC1idWkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLzAwMDEtUmVtb3ZlLWZzdGFjay1wcm90ZWN0b3ItZmxhZ3MtdG8td29ya2Fyb3Vu
ZC1tdXNsLWJ1aS5wYXRjaApAQCAtMSw2ICsxLDYgQEAKLUZyb20gZTM2MWY2YjRhZWZhZTU3
ZWZmZjdlNDU3ZGY4ZGI0ZDEwNjdiZWMyMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gOWUzODE2YmNhYTM2ZTFhMTE2NDdjYTBjZjRmODA0NDQ0OWM3N2ZlMCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNo
ZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+Ci1EYXRlOiBXZWQsIDI4IEZlYiAyMDE4IDIxOjUw
OjIzIC0wODAwCitEYXRlOiBNb24sIDIgSnVsIDIwMTggMTU6Mjg6MjIgKzA4MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gUmVtb3ZlIGZzdGFjay1wcm90ZWN0b3IgZmxhZ3MgdG8gd29ya2Fyb3Vu
ZCBtdXNsIGJ1aWxkCiAKIFJlbW92ZSBmc3RhY2stcHJvdGVjdG9yIGFuZCBmc3RhY2stcHJv
dGVjdG9yLXN0cm9uZyBmbGFncyB0byBmaXgKQEAgLTgsNyArOCw3IEBAIHRoZSBmb2xsb3dp
bmcgYnVpbGQgZmFpbHVyZSBmb3IgcWVtdXg4NiBhbmQgcWVtdXBwYyB3aXRoIG11c2wuCiAK
ICAgdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19zdGFja19jaGtfZmFpbF9sb2NhbCcKIAot
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBTcGVjaWZpY10KK1Vwc3RyZWFt
LVN0YXR1czogSW5hcHByb3ByaWF0ZSBbbXVzbCBTcGVjaWZpY10KIAogU2lnbmVkLW9mZi1i
eTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0
OzwvYT4KIC0tLQpAQCAtMTYsMTggKzE2LDE4IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkg
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5A
d2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+CiAgMSBm
aWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWls
ZCBiL21lc29uLmJ1aWxkCi1pbmRleCA3NjEwYWIxMmIuLjU5MWI5Y2JhYiAxMDA2NDQKK2lu
ZGV4IGY0MzJlYTA3Mi4uYTczNGEyOTVjIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsr
KyBiL21lc29uLmJ1aWxkCi1AQCAtMzI5LDggKzMyOSw2IEBAIGZvcmVhY2ggYXJnIDogWyct
V2V4dHJhJywKLSAgICAgICAgICAgICAgICAnLWZkaWFnbm9zdGljcy1zaG93LW9wdGlvbics
Ci0gICAgICAgICAgICAgICAgJy1mbm8tc3RyaWN0LWFsaWFzaW5nJywKLSAgICAgICAgICAg
ICAgICAnLWZ2aXNpYmlsaXR5PWhpZGRlbicsCi0tICAgICAgICAgICAgICAgJy1mc3RhY2st
cHJvdGVjdG9yJywKLS0gICAgICAgICAgICAgICAnLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25n
JywKLSAgICAgICAgICAgICAgICAnLS1wYXJhbT1zc3AtYnVmZmVyLXNpemU9NCcsCi0gICAg
ICAgICAgICAgICBdCi0gICAgICAgICBpZiBjYy5oYXNfYXJndW1lbnQoYXJnKQorQEAgLTMz
Myw4ICszMzMsNiBAQCBwb3NzaWJsZV9jY19mbGFncyA9IFsKKyAgICAgICAgICctZmRpYWdu
b3N0aWNzLXNob3ctb3B0aW9uJywKKyAgICAgICAgICctZm5vLXN0cmljdC1hbGlhc2luZycs
CisgICAgICAgICAnLWZ2aXNpYmlsaXR5PWhpZGRlbicsCistICAgICAgICAnLWZzdGFjay1w
cm90ZWN0b3InLAorLSAgICAgICAgJy1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZycsCisgICAg
ICAgICAnLS1wYXJhbT1zc3AtYnVmZmVyLXNpemU9NCcsCisgXQorIAogLS0gCi0yLjEzLjAK
KzIuMTEuMAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3Rl
bWQvMDAwMS1Vc2UtZ2V0ZW52LXdoZW4tc2VjdXJlLXZlcnNpb25zLWFyZS1ub3QtYXZhaWxh
YmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDEtVXNl
LWdldGVudi13aGVuLXNlY3VyZS12ZXJzaW9ucy1hcmUtbm90LWF2YWlsYWJsZS5wYXRjaApp
bmRleCBmNGMxNWUxLi4wM2Y2ZWFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAwMS1Vc2UtZ2V0ZW52LXdoZW4tc2VjdXJlLXZlcnNpb25zLWFy
ZS1ub3QtYXZhaWxhYmxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC8wMDAxLVVzZS1nZXRlbnYtd2hlbi1zZWN1cmUtdmVyc2lvbnMtYXJlLW5vdC1h
dmFpbGFibGUucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIGIxMTkyYTZlMTcxNDEzMjkx
ZDlkNjRmYWZjMDQ3NzNjNmJiYzljYWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDZkZDEzNjUxMjg5Njk3OWZlYjY4ODNhMTYyMjZkNjQwYTdlNWNhNzQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVu
QHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogRGF0ZTogRnJpLCAyMyBGZWIgMjAxOCAxMDowNDo0
OCArMDgwMAotU3ViamVjdDogW1BBVENIIDAxLzMxXSBVc2UgZ2V0ZW52IHdoZW4gc2VjdXJl
IHZlcnNpb25zIGFyZSBub3QgYXZhaWxhYmxlCitTdWJqZWN0OiBbUEFUQ0ggMDEvMTldIFVz
ZSBnZXRlbnYgd2hlbiBzZWN1cmUgdmVyc2lvbnMgYXJlIG5vdCBhdmFpbGFibGUKIAogbXVz
bCBkb2VzbnQgaW1wbGVtZW50IHNlY3VyZSB2ZXJzaW9uLCBzbyB3ZSBkZWZhdWx0CiB0byBp
dCBpZiBjb25maWd1cmUgZG9lcyBub3QgZGV0ZWN0IGEgc2VjdXJlIGltcGxlbWVudGF0aW9u
CkBAIC0xNiwxMCArMTYsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9i
YXNpYy9taXNzaW5nLmggYi9zcmMvYmFzaWMvbWlzc2luZy5oCi1pbmRleCAxMjgwZTZjNDEu
LjM5YzFmYjcwMCAxMDA2NDQKK2luZGV4IDcxYTA3ZDA1Ny4uMGUzM2FiYjlmIDEwMDY0NAog
LS0tIGEvc3JjL2Jhc2ljL21pc3NpbmcuaAogKysrIGIvc3JjL2Jhc2ljL21pc3NpbmcuaAot
QEAgLTYwNSw3ICs2MDUsNyBAQCBzdHJ1Y3QgYnRyZnNfaW9jdGxfcXVvdGFfY3RsX2FyZ3Mg
eworQEAgLTU5Miw3ICs1OTIsNyBAQCBzdHJ1Y3QgYnRyZnNfaW9jdGxfcXVvdGFfY3RsX2Fy
Z3MgewogICMgIGlmIEhBVkVfX19TRUNVUkVfR0VURU5WCiAgIyAgICBkZWZpbmUgc2VjdXJl
X2dldGVudiBfX3NlY3VyZV9nZXRlbnYKICAjICBlbHNlCkBAIC0yOSw1ICsyOSw1IEBAIGlu
ZGV4IDEyODBlNmM0MS4uMzljMWZiNzAwIDEwMDY0NAogICNlbmRpZgogIAogLS0gCi0yLjEz
LjAKKzIuMTEuMAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvMDAwMi1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWlu
c3RhbGwtdGltLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAw
MDEtYmluZm10LURvbi10LWluc3RhbGwtZGVwZW5kZW5jeS1saW5rcy1hdC1pbnN0YWxsLXRp
bS5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDgzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMi1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRl
bmN5LWxpbmtzLWF0LWluc3RhbGwtdGltLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMS1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRl
bmN5LWxpbmtzLWF0LWluc3RhbGwtdGltLnBhdGNoCmluZGV4IGMzZjRiMzkuLmUyNGU3Zjgg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAyLWJp
bmZtdC1Eb24tdC1pbnN0YWxsLWRlcGVuZGVuY3ktbGlua3MtYXQtaW5zdGFsbC10aW0ucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDEtYmluZm10
LURvbi10LWluc3RhbGwtZGVwZW5kZW5jeS1saW5rcy1hdC1pbnN0YWxsLXRpbS5wYXRjaApA
QCAtMSw3ICsxLDcgQEAKLUZyb20gYzkzZWI2Y2RlYzAzZjVlMjQzZTU5ZTk1ZGM0OTI3M2Zj
YjkwZTdjMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODdkZDYxYmUyZTI4ZTc4
Y2U0ZjlmMTczNzk0ODEyZTZjMmQ5MDRkMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZy
b206IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZn
dDs8L2E+Ci1EYXRlOiBGcmksIDIzIEZlYiAyMDE4IDEwOjIzOjQwICswODAwCi1TdWJqZWN0
OiBbUEFUQ0ggMDIvMzFdIGJpbmZtdDogRG9uJ3QgaW5zdGFsbCBkZXBlbmRlbmN5IGxpbmtz
IGF0IGluc3RhbGwgdGltZQorRGF0ZTogV2VkLCAyNyBKdW4gMjAxOCAxNjowMToyMiArMDgw
MAorU3ViamVjdDogW1BBVENIIDEvOV0gYmluZm10OiBEb24ndCBpbnN0YWxsIGRlcGVuZGVu
Y3kgbGlua3MgYXQgaW5zdGFsbCB0aW1lIAogIGZvciB0aGUgYmluZm10IHNlcnZpY2VzCiAK
IHVzZSBbSW5zdGFsbF0gYmxvY2tzIHNvIHRoYXQgdGhleSBnZXQgY3JlYXRlZCB3aGVuIHRo
ZSBzZXJ2aWNlIGlzIGVuYWJsZWQKQEAgLTIzLDEwICsyMywxMCBAQCBTaWduZWQtb2ZmLWJ5
OiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7
PC9hPgogIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvdW5pdHMvbWVzb24uYnVpbGQgYi91bml0cy9tZXNvbi5idWls
ZAotaW5kZXggODE0ZWU3ODg1Li40OWFjZTBkMGYgMTAwNjQ0CitpbmRleCBlNGFjNmNlZDYu
LjY5ODczNGU0NCAxMDA2NDQKIC0tLSBhL3VuaXRzL21lc29uLmJ1aWxkCiArKysgYi91bml0
cy9tZXNvbi5idWlsZAotQEAgLTYwLDggKzYwLDcgQEAgdW5pdHMgPSBbCitAQCAtNDYsOCAr
NDYsNyBAQCB1bml0cyA9IFsKICAgICAgICAgIFsncG93ZXJvZmYudGFyZ2V0JywgICAgICAg
ICAgICAgICAgICAgICAnJywKICAgICAgICAgICAncnVubGV2ZWwwLnRhcmdldCddLAogICAg
ICAgICAgWydwcmludGVyLnRhcmdldCcsICAgICAgICAgICAgICAgICAgICAgICcnXSwKQEAg
LTM2LDcgKzM2LDcgQEAgaW5kZXggODE0ZWU3ODg1Li40OWFjZTBkMGYgMTAwNjQ0CiAgICAg
ICAgICBbJ3Byb2Mtc3lzLWZzLWJpbmZtdF9taXNjLm1vdW50JywgICAgICAgJ0VOQUJMRV9C
SU5GTVQnXSwKICAgICAgICAgIFsncmVib290LnRhcmdldCcsICAgICAgICAgICAgICAgICAg
ICAgICAnJywKICAgICAgICAgICAncnVubGV2ZWw2LnRhcmdldCBjdHJsLWFsdC1kZWwudGFy
Z2V0J10sCi1AQCAtMTQ0LDggKzE0Myw3IEBAIGluX3VuaXRzID0gWworQEAgLTEzMCw4ICsx
MjksNyBAQCBpbl91bml0cyA9IFsKICAgICAgICAgIFsnc3lzdGVtZC1hc2stcGFzc3dvcmQt
Y29uc29sZS5zZXJ2aWNlJywgJyddLAogICAgICAgICAgWydzeXN0ZW1kLWFzay1wYXNzd29y
ZC13YWxsLnNlcnZpY2UnLCAgICAnJ10sCiAgICAgICAgICBbJzxhIGNsYXNzPSJtb3otdHh0
LWxpbmstYWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpzeXN0ZW1kLWJhY2tsaWdodEAuc2Vy
dmljZSI+c3lzdGVtZC1iYWNrbGlnaHRALnNlcnZpY2U8L2E+JywgICAgICAgICAgICdFTkFC
TEVfQkFDS0xJR0hUJ10sCkBAIC01OCwxOCArNTgsMTggQEAgaW5kZXggMzBhNmJjOTkxLi40
MjMxZjNiNzAgMTAwNjQ0CiArW0luc3RhbGxdCiArV2FudGVkQnk9c3lzaW5pdC50YXJnZXQK
IGRpZmYgLS1naXQgYS91bml0cy9zeXN0ZW1kLWJpbmZtdC5zZXJ2aWNlLmluIGIvdW5pdHMv
c3lzdGVtZC1iaW5mbXQuc2VydmljZS5pbgotaW5kZXggZGY5Mzk2ZDg5Li4wNjg3ZjQ2NDgg
MTAwNjQ0CitpbmRleCBlOTQwYzdjOWEuLjZiZTdmNWNjOSAxMDA2NDQKIC0tLSBhL3VuaXRz
L3N5c3RlbWQtYmluZm10LnNlcnZpY2UuaW4KICsrKyBiL3VuaXRzL3N5c3RlbWQtYmluZm10
LnNlcnZpY2UuaW4KLUBAIC0xMyw2ICsxMyw3IEBAIERvY3VtZW50YXRpb249PGEgY2xhc3M9
Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0ibWFuOnN5c3RlbWQtYmluZm10LnNlcnZp
Y2UoOCkiPm1hbjpzeXN0ZW1kLWJpbmZtdC5zZXJ2aWNlKDgpPC9hPiA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJtYW46YmluZm10LmQoNSkiPm1hbjpiaW5mbXQu
ZCg1KTwvYT4KLSBEb2N1bWVudGF0aW9uPTxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRl
eHQiIGhyZWY9Imh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vYmlu
Zm10X21pc2MudHh0Ij5odHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9Eb2N1bWVudGF0aW9u
L2JpbmZtdF9taXNjLnR4dDwvYT4KK0BAIC0xNCw2ICsxNCw3IEBAIERvY3VtZW50YXRpb249
PGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvYWRtaW4tZ3VpZGUvYmluZm10LW1pc2MuaHRtIj5o
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9hZG1pbi1ndWlkZS9iaW5m
bXQtbWlzYy5odG08L2E+CisgRG9jdW1lbnRhdGlvbj08YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJodHRwczovL3d3dy5mcmVlZGVza3RvcC5vcmcvd2lraS9Tb2Z0
d2FyZS9zeXN0ZW1kL0FQSUZpbGVTeXN0ZW1zIj5odHRwczovL3d3dy5mcmVlZGVza3RvcC5v
cmcvd2lraS9Tb2Z0d2FyZS9zeXN0ZW1kL0FQSUZpbGVTeXN0ZW1zPC9hPgogIERlZmF1bHRE
ZXBlbmRlbmNpZXM9bm8KICBDb25mbGljdHM9c2h1dGRvd24udGFyZ2V0CiArV2FudHM9cHJv
Yy1zeXMtZnMtYmluZm10X21pc2MuYXV0b21vdW50CiAgQWZ0ZXI9cHJvYy1zeXMtZnMtYmlu
Zm10X21pc2MuYXV0b21vdW50CiAgQmVmb3JlPXN5c2luaXQudGFyZ2V0IHNodXRkb3duLnRh
cmdldAogIENvbmRpdGlvblBhdGhJc1JlYWRXcml0ZT0vcHJvYy9zeXMvCi1AQCAtMjcsMyAr
MjgsNiBAQCBUeXBlPW9uZXNob3QKK0BAIC0yOCwzICsyOSw2IEBAIFR5cGU9b25lc2hvdAog
IFJlbWFpbkFmdGVyRXhpdD15ZXMKICBFeGVjU3RhcnQ9QHJvb3RsaWJleGVjZGlyQC9zeXN0
ZW1kLWJpbmZtdAogIFRpbWVvdXRTZWM9OTBzCkBAIC03Nyw1ICs3Nyw1IEBAIGluZGV4IGRm
OTM5NmQ4OS4uMDY4N2Y0NjQ4IDEwMDY0NAogK1tJbnN0YWxsXQogK1dhbnRlZEJ5PXN5c2lu
aXQudGFyZ2V0CiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAxLWNvcmUtZGV2aWNlLmMtQ2hhbmdlLXRo
ZS1kZWZhdWx0LWRldmljZS10aW1lb3V0LXRvLTIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMS1jb3JlLWRldmljZS5jLUNoYW5nZS10aGUtZGVmYXVs
dC1kZXZpY2UtdGltZW91dC10by0yLnBhdGNoCmluZGV4IDk4YzgzNjIuLmZkN2JmM2YgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAxLWNvcmUt
ZGV2aWNlLmMtQ2hhbmdlLXRoZS1kZWZhdWx0LWRldmljZS10aW1lb3V0LXRvLTIucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDEtY29yZS1kZXZp
Y2UuYy1DaGFuZ2UtdGhlLWRlZmF1bHQtZGV2aWNlLXRpbWVvdXQtdG8tMi5wYXRjaApAQCAt
MSw3ICsxLDkgQEAKLUZyb20gNzg0NGUwNzA3NDU2MTFhNTJlMzU1YjczZTc4OTBmMzYwZGQ1
NDBkMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgotRGF0ZTogTW9uLCAxNCBEZWMg
MjAxNSAwNDowOToxOSArMDAwMAorRnJvbSAyOTI1YzBjM2I2Y2U0MDU2NjIyYjg2YzFjNjFl
ZTE0YWRkNDMwNzkwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogQ2hlbiBRaSA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3
aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KK0RhdGU6
IFRodSwgMjggSnVuIDIwMTggMTA6NTY6MjkgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gY29y
ZS9kZXZpY2UuYzogQ2hhbmdlIHRoZSBkZWZhdWx0IGRldmljZSB0aW1lb3V0IHRvIDI0MCBz
ZWMuCisgTUlNRS1WZXJzaW9uOiAxLjAgQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFy
c2V0PVVURi04CisgQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAogTUlNRS1WZXJz
aW9uOiAxLjAKIENvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAogQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdApAQCAtMTAsMTYgKzEyLDE2IEBAIFVwc3Ry
ZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbU3BlY2lmaWMgY2FzZSBRRU1VL0FCXQogCiBT
aWduZWQtb2ZmLWJ5OiBBbsOtYmFsIExpbcOzbiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86YW5pYmFsLmxpbW9uQGxpbnV4LmludGVsLmNvbSI+Jmx0
O2FuaWJhbC5saW1vbkBsaW51eC5pbnRlbC5jb20mZ3Q7PC9hPgogU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci0K
K1NpZ25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2lu
ZHJpdmVyLmNvbSZndDs8L2E+CiAtLS0KICBzcmMvY29yZS9kZXZpY2UuYyB8IDIgKy0KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAt
LWdpdCBhL3NyYy9jb3JlL2RldmljZS5jIGIvc3JjL2NvcmUvZGV2aWNlLmMKLWluZGV4IGE0
MzY2NGQzYi4uNGIxNmE4YWVjIDEwMDY0NAoraW5kZXggYTJkMDBhMGZiLi5mMjZlNTVlYmIg
MTAwNjQ0CiAtLS0gYS9zcmMvY29yZS9kZXZpY2UuYwogKysrIGIvc3JjL2NvcmUvZGV2aWNl
LmMKLUBAIC0xMTMsNyArMTEzLDcgQEAgc3RhdGljIHZvaWQgZGV2aWNlX2luaXQoVW5pdCAq
dSkgeworQEAgLTk1LDcgKzk1LDcgQEAgc3RhdGljIHZvaWQgZGV2aWNlX2luaXQoVW5pdCAq
dSkgewogICAgICAgICAgICogaW5kZWZpbml0ZWx5IGZvciBwbHVnZ2VkIGluIGRldmljZXMs
IHNvbWV0aGluZyB3aGljaCBjYW5ub3QKICAgICAgICAgICAqIGhhcHBlbiBmb3IgdGhlIG90
aGVyIHVuaXRzIHNpbmNlIHRoZWlyIG9wZXJhdGlvbnMgdGltZSBvdXQKICAgICAgICAgICAq
IGFueXdheS4gKi8KQEAgLTI3LDQgKzI5LDcgQEAgaW5kZXggYTQzNjY0ZDNiLi40YjE2YThh
ZWMgMTAwNjQ0CiArICAgICAgICB1LSZndDtqb2JfcnVubmluZ190aW1lb3V0ID0gKDI0MCAq
IFVTRUNfUEVSX1NFQyk7CiAgCiAgICAgICAgICB1LSZndDtpZ25vcmVfb25faXNvbGF0ZSA9
IHRydWU7Ci0gfQorIAorLS0gCisyLjExLjAKKwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjItZG9uLXQtdXNlLWdsaWJjLXNwZWNpZmljLXFz
b3J0X3IucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMi1k
b24tdC11c2UtZ2xpYmMtc3BlY2lmaWMtcXNvcnRfci5wYXRjaApzaW1pbGFyaXR5IGluZGV4
IDUyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAy
Mi1kb24tdC11c2UtZ2xpYmMtc3BlY2lmaWMtcXNvcnRfci5wYXRjaApyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDItZG9uLXQtdXNlLWdsaWJjLXNw
ZWNpZmljLXFzb3J0X3IucGF0Y2gKaW5kZXggYTVmNzQ0Mi4uZjA3MjExYiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjItZG9uLXQtdXNlLWds
aWJjLXNwZWNpZmljLXFzb3J0X3IucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kLzAwMDItZG9uLXQtdXNlLWdsaWJjLXNwZWNpZmljLXFzb3J0X3IucGF0
Y2gKQEAgLTEsMjEgKzEsOTkgQEAKLUZyb20gZDM0Mzc1N2Q2Mjk0MDJjNzBjYThlNWVhYTU1
MWRlYWYxNzVjOTZmMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZDQzZmFmNmQy
NTNkYjc4OTIyNWI3YzQ1NGM4ZjI1NWZiYzY4ODU3ZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpzeXN0ZW1kQGVzbWlsLmRrIj4mbHQ7c3lzdGVtZEBl
c21pbC5kayZndDs8L2E+CiBEYXRlOiBUaHUsIDE4IFNlcCAyMDE0IDE1OjI0OjU2ICswMjAw
Ci1TdWJqZWN0OiBbUEFUQ0ggMjIvMzFdIGRvbid0IHVzZSBnbGliYy1zcGVjaWZpYyBxc29y
dF9yCitTdWJqZWN0OiBbUEFUQ0ggMDIvMTldIGRvbid0IHVzZSBnbGliYy1zcGVjaWZpYyBx
c29ydF9yCiAKLVVwc3RyZWFtLVN0YXR1czogUGVuZGluZworVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFttdXNsIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJh
aiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmto
ZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIC0tLQotIHNy
Yy9od2RiL2h3ZGIuYyAgICAgICAgIHwgMTggKysrKysrKysrKystLS0tLS0tCi0gc3JjL3Vk
ZXYvdWRldmFkbS1od2RiLmMgfCAxNiArKysrKysrKysrLS0tLS0tCi0gMiBmaWxlcyBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKKyBzcmMvYmFzaWMvZm9y
bWF0LXRhYmxlLmMgfCAyNyArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KKyBzcmMvYmFz
aWMvdXRpbC5oICAgICAgICAgfCAgNyAtLS0tLS0tCisgc3JjL2h3ZGIvaHdkYi5jICAgICAg
ICAgIHwgMTggKysrKysrKysrKystLS0tLS0tCisgc3JjL3VkZXYvdWRldmFkbS1od2RiLmMg
IHwgMTYgKysrKysrKysrKy0tLS0tLQorIDQgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9u
cygrKSwgMzEgZGVsZXRpb25zKC0pCiAKK2RpZmYgLS1naXQgYS9zcmMvYmFzaWMvZm9ybWF0
LXRhYmxlLmMgYi9zcmMvYmFzaWMvZm9ybWF0LXRhYmxlLmMKK2luZGV4IDk0ZTc5NmQxYy4u
ZjdiNGVhZGU5IDEwMDY0NAorLS0tIGEvc3JjL2Jhc2ljL2Zvcm1hdC10YWJsZS5jCisrKysg
Yi9zcmMvYmFzaWMvZm9ybWF0LXRhYmxlLmMKK0BAIC03NDUsMjkgKzc0NSwyOSBAQCBzdGF0
aWMgaW50IGNlbGxfZGF0YV9jb21wYXJlKFRhYmxlRGF0YSAqYSwgc2l6ZV90IGluZGV4X2Es
IFRhYmxlRGF0YSAqYiwgc2l6ZV90CisgICAgICAgICByZXR1cm4gMDsKKyB9CisgCistc3Rh
dGljIGludCB0YWJsZV9kYXRhX2NvbXBhcmUoY29uc3Qgdm9pZCAqeCwgY29uc3Qgdm9pZCAq
eSwgdm9pZCAqdXNlcmRhdGEpIHsKKytzdGF0aWMgVGFibGUgKnVzZXJfdGFibGU7Cisrc3Rh
dGljIGludCB0YWJsZV9kYXRhX2NvbXBhcmUoY29uc3Qgdm9pZCAqeCwgY29uc3Qgdm9pZCAq
eSkgeworICAgICAgICAgY29uc3Qgc2l6ZV90ICphID0geCwgKmIgPSB5OworLSAgICAgICAg
VGFibGUgKnQgPSB1c2VyZGF0YTsKKyAgICAgICAgIHNpemVfdCBpOworICAgICAgICAgaW50
IHI7CisgCistICAgICAgICBhc3NlcnQodCk7CistICAgICAgICBhc3NlcnQodC0mZ3Q7c29y
dF9tYXApOworKyAgICAgICAgYXNzZXJ0KHVzZXJfdGFibGUpOworKyAgICAgICAgYXNzZXJ0
KHVzZXJfdGFibGUtJmd0O3NvcnRfbWFwKTsKKyAKKyAgICAgICAgIC8qIE1ha2Ugc3VyZSB0
aGUgaGVhZGVyIHN0YXlzIGF0IHRoZSBiZWdpbm5pbmcgKi8KKy0gICAgICAgIGlmICgqYSAm
bHQ7IHQtJmd0O25fY29sdW1ucyAmYW1wOyZhbXA7ICpiICZsdDsgdC0mZ3Q7bl9jb2x1bW5z
KQorKyAgICAgICAgaWYgKCphICZsdDsgdXNlcl90YWJsZS0mZ3Q7bl9jb2x1bW5zICZhbXA7
JmFtcDsgKmIgJmx0OyB1c2VyX3RhYmxlLSZndDtuX2NvbHVtbnMpCisgICAgICAgICAgICAg
ICAgIHJldHVybiAwOworLSAgICAgICAgaWYgKCphICZsdDsgdC0mZ3Q7bl9jb2x1bW5zKQor
KyAgICAgICAgaWYgKCphICZsdDsgdXNlcl90YWJsZS0mZ3Q7bl9jb2x1bW5zKQorICAgICAg
ICAgICAgICAgICByZXR1cm4gLTE7CistICAgICAgICBpZiAoKmIgJmx0OyB0LSZndDtuX2Nv
bHVtbnMpCisrICAgICAgICBpZiAoKmIgJmx0OyB1c2VyX3RhYmxlLSZndDtuX2NvbHVtbnMp
CisgICAgICAgICAgICAgICAgIHJldHVybiAxOworIAorICAgICAgICAgLyogT3JkZXIgb3Ro
ZXIgbGluZXMgYnkgdGhlIHNvcnRpbmcgbWFwICovCistICAgICAgICBmb3IgKGkgPSAwOyBp
ICZsdDsgdC0mZ3Q7bl9zb3J0X21hcDsgaSsrKSB7CisrICAgICAgICBmb3IgKGkgPSAwOyBp
ICZsdDsgdXNlcl90YWJsZS0mZ3Q7bl9zb3J0X21hcDsgaSsrKSB7CisgICAgICAgICAgICAg
ICAgIFRhYmxlRGF0YSAqZCwgKmRkOworIAorLSAgICAgICAgICAgICAgICBkID0gdC0mZ3Q7
ZGF0YVsqYSArIHQtJmd0O3NvcnRfbWFwW2ldXTsKKy0gICAgICAgICAgICAgICAgZGQgPSB0
LSZndDtkYXRhWypiICsgdC0mZ3Q7c29ydF9tYXBbaV1dOworKyAgICAgICAgICAgICAgICBk
ID0gdXNlcl90YWJsZS0mZ3Q7ZGF0YVsqYSArIHVzZXJfdGFibGUtJmd0O3NvcnRfbWFwW2ld
XTsKKysgICAgICAgICAgICAgICAgZGQgPSB1c2VyX3RhYmxlLSZndDtkYXRhWypiICsgdXNl
cl90YWJsZS0mZ3Q7c29ydF9tYXBbaV1dOworIAorICAgICAgICAgICAgICAgICByID0gY2Vs
bF9kYXRhX2NvbXBhcmUoZCwgKmEsIGRkLCAqYik7CisgICAgICAgICAgICAgICAgIGlmIChy
ICE9IDApCitAQCAtOTYwLDcgKzk2MCwxMiBAQCBpbnQgdGFibGVfcHJpbnQoVGFibGUgKnQs
IEZJTEUgKmYpIHsKKyAgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSAmbHQ7IG5fcm93
czsgaSsrKQorICAgICAgICAgICAgICAgICAgICAgICAgIHNvcnRlZFtpXSA9IGkgKiB0LSZn
dDtuX2NvbHVtbnM7CisgCistICAgICAgICAgICAgICAgIHFzb3J0X3Jfc2FmZShzb3J0ZWQs
IG5fcm93cywgc2l6ZW9mKHNpemVfdCksIHRhYmxlX2RhdGFfY29tcGFyZSwgdCk7CisrICAg
ICAgICAgICAgICAgIGlmIChuX3Jvd3MgJmx0Oz0gMSkKKysgICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm47CisrICAgICAgICAgICAgICAgIGFzc2VydChzb3J0ZWQpOworKyAgICAg
ICAgICAgICAgICB1c2VyX3RhYmxlID0gdDsKKysgICAgICAgICAgICAgICAgcXNvcnQoc29y
dGVkLCBuX3Jvd3MsIHNpemVvZihzaXplX3QpLCB0YWJsZV9kYXRhX2NvbXBhcmUpOworKyAg
ICAgICAgICAgICAgICB1c2VyX3RhYmxlID0gTlVMTDsKKyAgICAgICAgIH0KKyAKKyAgICAg
ICAgIGlmICh0LSZndDtkaXNwbGF5X21hcCkKK2RpZmYgLS1naXQgYS9zcmMvYmFzaWMvdXRp
bC5oIGIvc3JjL2Jhc2ljL3V0aWwuaAoraW5kZXggOTY5OWQyMjhmLi40MGVhZjUxOGMgMTAw
NjQ0CistLS0gYS9zcmMvYmFzaWMvdXRpbC5oCisrKysgYi9zcmMvYmFzaWMvdXRpbC5oCitA
QCAtMTA1LDEzICsxMDUsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcXNvcnRfc2FmZSh2b2lk
ICpiYXNlLCBzaXplX3Qgbm1lbWIsIHNpemVfdCBzaXplLCBjb21wYXJpc29uXworICAgICAg
ICAgICAgICAgICBxc29ydF9zYWZlKChwKSwgKG4pLCBzaXplb2YoKHApWzBdKSwgKF9fY29t
cGFyX2ZuX3QpIF9mdW5jXyk7IFwKKyAgICAgICAgIH0pCisgCistc3RhdGljIGlubGluZSB2
b2lkIHFzb3J0X3Jfc2FmZSh2b2lkICpiYXNlLCBzaXplX3Qgbm1lbWIsIHNpemVfdCBzaXpl
LCBpbnQgKCpjb21wYXIpKGNvbnN0IHZvaWQqLCBjb25zdCB2b2lkKiwgdm9pZCopLCB2b2lk
ICp1c2VyZGF0YSkgeworLSAgICAgICAgaWYgKG5tZW1iICZsdDs9IDEpCistICAgICAgICAg
ICAgICAgIHJldHVybjsKKy0KKy0gICAgICAgIGFzc2VydChiYXNlKTsKKy0gICAgICAgIHFz
b3J0X3IoYmFzZSwgbm1lbWIsIHNpemUsIGNvbXBhciwgdXNlcmRhdGEpOworLX0KKyAKKyAv
KioKKyAgKiBOb3JtYWwgbWVtY3B5IHJlcXVpcmVzIHNyYyB0byBiZSBub25udWxsLiBXZSBk
byBub3RoaW5nIGlmIG4gaXMgMC4KIGRpZmYgLS1naXQgYS9zcmMvaHdkYi9od2RiLmMgYi9z
cmMvaHdkYi9od2RiLmMKLWluZGV4IDQ1NDAyNjBmOS4uODFhY2E3YTliIDEwMDY0NAoraW5k
ZXggMzE3Y2FkOGE2Li43MDFkNTlhMWUgMTAwNjQ0CiAtLS0gYS9zcmMvaHdkYi9od2RiLmMK
ICsrKyBiL3NyYy9od2RiL2h3ZGIuYwotQEAgLTE1MiwxMyArMTUyLDEyIEBAIHN0YXRpYyB2
b2lkIHRyaWVfZnJlZShzdHJ1Y3QgdHJpZSAqdHJpZSkgeworQEAgLTEzNSwxMyArMTM1LDEy
IEBAIHN0YXRpYyB2b2lkIHRyaWVfZnJlZShzdHJ1Y3QgdHJpZSAqdHJpZSkgewogIAogIERF
RklORV9UUklWSUFMX0NMRUFOVVBfRlVOQyhzdHJ1Y3QgdHJpZSosIHRyaWVfZnJlZSk7CiAg
CkBAIC0zMyw3ICsxMTEsNyBAQCBpbmRleCA0NTQwMjYwZjkuLjgxYWNhN2E5YiAxMDA2NDQK
ICB9CiAgCiAgc3RhdGljIGludCB0cmllX25vZGVfYWRkX3ZhbHVlKHN0cnVjdCB0cmllICp0
cmllLCBzdHJ1Y3QgdHJpZV9ub2RlICpub2RlLAotQEAgLTE4Myw3ICsxODIsMTAgQEAgc3Rh
dGljIGludCB0cmllX25vZGVfYWRkX3ZhbHVlKHN0cnVjdCB0cmllICp0cmllLCBzdHJ1Y3Qg
dHJpZV9ub2RlICpub2RlLAorQEAgLTE2Niw3ICsxNjUsMTAgQEAgc3RhdGljIGludCB0cmll
X25vZGVfYWRkX3ZhbHVlKHN0cnVjdCB0cmllICp0cmllLCBzdHJ1Y3QgdHJpZV9ub2RlICpu
b2RlLAogICAgICAgICAgICAgICAgICAgICAgICAgIC52YWx1ZV9vZmYgPSB2LAogICAgICAg
ICAgICAgICAgICB9OwogIApAQCAtNDUsNyArMTIzLDcgQEAgaW5kZXggNDU0MDI2MGY5Li44
MWFjYTdhOWIgMTAwNjQ0CiAgICAgICAgICAgICAgICAgIGlmICh2YWwpIHsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAvKiBBdCB0aGlzIHBvaW50IHdlIGhhdmUgMiBpZGVudGljYWwg
cHJvcGVydGllcyBvbiB0aGUgc2FtZSBtYXRjaC1zdHJpbmcuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICogU2luY2Ugd2UgcHJvY2VzcyBmaWxlcyBpbiBvcmRlciwgd2UganVzdCBy
ZXBsYWNlIHRoZSBwcmV2aW91cyB2YWx1ZS4KLUBAIC0yMDgsNyArMjEwLDkgQEAgc3RhdGlj
IGludCB0cmllX25vZGVfYWRkX3ZhbHVlKHN0cnVjdCB0cmllICp0cmllLCBzdHJ1Y3QgdHJp
ZV9ub2RlICpub2RlLAorQEAgLTE5MSw3ICsxOTMsOSBAQCBzdGF0aWMgaW50IHRyaWVfbm9k
ZV9hZGRfdmFsdWUoc3RydWN0IHRyaWUgKnRyaWUsIHN0cnVjdCB0cmllX25vZGUgKm5vZGUs
CiAgICAgICAgICBub2RlLSZndDt2YWx1ZXNbbm9kZS0mZ3Q7dmFsdWVzX2NvdW50XS5maWxl
X3ByaW9yaXR5ID0gZmlsZV9wcmlvcml0eTsKICAgICAgICAgIG5vZGUtJmd0O3ZhbHVlc1tu
b2RlLSZndDt2YWx1ZXNfY291bnRdLmxpbmVfbnVtYmVyID0gbGluZV9udW1iZXI7CiAgICAg
ICAgICBub2RlLSZndDt2YWx1ZXNfY291bnQrKzsKQEAgLTU3LDEwICsxMzUsMTAgQEAgaW5k
ZXggNDU0MDI2MGY5Li44MWFjYTdhOWIgMTAwNjQ0CiAgfQogIAogZGlmZiAtLWdpdCBhL3Ny
Yy91ZGV2L3VkZXZhZG0taHdkYi5jIGIvc3JjL3VkZXYvdWRldmFkbS1od2RiLmMKLWluZGV4
IGFiNWRjN2FiNi4uYzc3N2UzMGFiIDEwMDY0NAoraW5kZXggMDI0MDhhNDI4Li40OTFkMzY3
ZDEgMTAwNjQ0CiAtLS0gYS9zcmMvdWRldi91ZGV2YWRtLWh3ZGIuYwogKysrIGIvc3JjL3Vk
ZXYvdWRldmFkbS1od2RiLmMKLUBAIC0xMzAsMTMgKzEzMCwxMyBAQCBzdGF0aWMgdm9pZCB0
cmllX25vZGVfY2xlYW51cChzdHJ1Y3QgdHJpZV9ub2RlICpub2RlKSB7CitAQCAtMTE0LDEz
ICsxMTQsMTMgQEAgc3RhdGljIHZvaWQgdHJpZV9ub2RlX2NsZWFudXAoc3RydWN0IHRyaWVf
bm9kZSAqbm9kZSkgewogICAgICAgICAgZnJlZShub2RlKTsKICB9CiAgCkBAIC03OCw3ICsx
NTYsNyBAQCBpbmRleCBhYjVkYzdhYjYuLmM3NzdlMzBhYiAxMDA2NDQKICB9CiAgCiAgc3Rh
dGljIGludCB0cmllX25vZGVfYWRkX3ZhbHVlKHN0cnVjdCB0cmllICp0cmllLCBzdHJ1Y3Qg
dHJpZV9ub2RlICpub2RlLAotQEAgLTE1Nyw3ICsxNTcsOSBAQCBzdGF0aWMgaW50IHRyaWVf
bm9kZV9hZGRfdmFsdWUoc3RydWN0IHRyaWUgKnRyaWUsIHN0cnVjdCB0cmllX25vZGUgKm5v
ZGUsCitAQCAtMTQxLDcgKzE0MSw5IEBAIHN0YXRpYyBpbnQgdHJpZV9ub2RlX2FkZF92YWx1
ZShzdHJ1Y3QgdHJpZSAqdHJpZSwgc3RydWN0IHRyaWVfbm9kZSAqbm9kZSwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAudmFsdWVfb2ZmID0gdiwKICAgICAgICAgICAgICAgICAgfTsK
ICAKQEAgLTg5LDcgKzE2Nyw3IEBAIGluZGV4IGFiNWRjN2FiNi4uYzc3N2UzMGFiIDEwMDY0
NAogICAgICAgICAgICAgICAgICBpZiAodmFsKSB7CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgLyogcmVwbGFjZSBleGlzdGluZyBlYXJsaWVyIGtleSB3aXRoIG5ldyB2YWx1ZSAqLwog
ICAgICAgICAgICAgICAgICAgICAgICAgIHZhbC0mZ3Q7dmFsdWVfb2ZmID0gdjsKLUBAIC0x
NzQsNyArMTc2LDkgQEAgc3RhdGljIGludCB0cmllX25vZGVfYWRkX3ZhbHVlKHN0cnVjdCB0
cmllICp0cmllLCBzdHJ1Y3QgdHJpZV9ub2RlICpub2RlLAorQEAgLTE1OCw3ICsxNjAsOSBA
QCBzdGF0aWMgaW50IHRyaWVfbm9kZV9hZGRfdmFsdWUoc3RydWN0IHRyaWUgKnRyaWUsIHN0
cnVjdCB0cmllX25vZGUgKm5vZGUsCiAgICAgICAgICBub2RlLSZndDt2YWx1ZXNbbm9kZS0m
Z3Q7dmFsdWVzX2NvdW50XS5rZXlfb2ZmID0gazsKICAgICAgICAgIG5vZGUtJmd0O3ZhbHVl
c1tub2RlLSZndDt2YWx1ZXNfY291bnRdLnZhbHVlX29mZiA9IHY7CiAgICAgICAgICBub2Rl
LSZndDt2YWx1ZXNfY291bnQrKzsKQEAgLTEwMSw1ICsxNzksNSBAQCBpbmRleCBhYjVkYzdh
YjYuLmM3NzdlMzBhYiAxMDA2NDQKICB9CiAgCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAzLXVzZS1s
bnItd3JhcHBlci1pbnN0ZWFkLW9mLWxvb2tpbmctZm9yLXJlbGF0aXZlLW9wdGkucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMi11c2UtbG5yLXdyYXBw
ZXItaW5zdGVhZC1vZi1sb29raW5nLWZvci1yZWxhdGl2ZS1vcHRpLnBhdGNoCnNpbWlsYXJp
dHkgaW5kZXggODMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDAzLXVzZS1sbnItd3JhcHBlci1pbnN0ZWFkLW9mLWxvb2tpbmctZm9yLXJlbGF0
aXZlLW9wdGkucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDAyLXVzZS1sbnItd3JhcHBlci1pbnN0ZWFkLW9mLWxvb2tpbmctZm9yLXJlbGF0
aXZlLW9wdGkucGF0Y2gKaW5kZXggMjhmMWIyMS4uMWQ3ZjUyMyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDMtdXNlLWxuci13cmFwcGVyLWlu
c3RlYWQtb2YtbG9va2luZy1mb3ItcmVsYXRpdmUtb3B0aS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMi11c2UtbG5yLXdyYXBwZXItaW5zdGVh
ZC1vZi1sb29raW5nLWZvci1yZWxhdGl2ZS1vcHRpLnBhdGNoCkBAIC0xLDggKzEsOCBAQAot
RnJvbSA4YjlkMTk0ZTk1Njg0OGUwZDFmYjM1ZWYyZmJhNzE0YjI2OTFlYmU2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2ZTYyYmU4N2EyNzIyZmJlNTMxMzEwYTFiMDUyYzEz
MDFiZGYwNmZiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8YSBj
bGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5k
cml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KLURhdGU6IFdl
ZCwgMjggRmViIDIwMTggMjA6NDc6NDkgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAwMy8zMV0g
dXNlIGxuciB3cmFwcGVyIGluc3RlYWQgb2YgbG9va2luZyBmb3IgLS1yZWxhdGl2ZQotIG9w
dGlvbiBmb3IgbG4KK0RhdGU6IFdlZCwgMjcgSnVuIDIwMTggMTY6MDk6MjQgKzA4MDAKK1N1
YmplY3Q6IFtQQVRDSCAyLzldIHVzZSBsbnIgd3JhcHBlciBpbnN0ZWFkIG9mIGxvb2tpbmcg
Zm9yIC0tcmVsYXRpdmUgb3B0aW9uCisgZm9yIGxuCiAKIFJlbW92ZSBmaWxlIG1hbnVhbGx5
IHRvIGF2b2lkIHRoZSAnRmlsZSBFeGlzdHMnIGVycm9yIHdoZW4gY3JlYXRpbmcKIHN5bWxp
bmsuIFRoaXMgaXMgYmVjYXVzZSB0aGUgb3JpZ2luYWwgJ2xuJyBjb21tYW5kIHVzZXMgJy1m
JyBvcHRpb24uCkBAIC0xOCwxNSArMTgsMTUgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3
aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KICAzIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDM2YTYyZDI4MC4uNzM0
N2VhODgwIDEwMDY0NAoraW5kZXggMDQzMzFkZDQxLi42ZDVlZGNiNGUgMTAwNjQ0CiAtLS0g
YS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC01NzAsMTAgKzU3MCw2IEBA
IGVuZGZvcmVhY2gKK0BAIC01NTgsMTAgKzU1OCw2IEBAIGVuZGZvcmVhY2gKICAKICBjb25m
LnNldF9xdW90ZWQoJ1RFTElOSVQnLCBnZXRfb3B0aW9uKCd0ZWxpbml0LXBhdGgnKSkKICAK
IC1pZiBydW5fY29tbWFuZCgnbG4nLCAnLS1yZWxhdGl2ZScsICctLWhlbHAnKS5yZXR1cm5j
b2RlKCkgIT0gMAotLSAgICAgICAgZXJyb3IoJ2xuIGRvZXMgbm90IHN1cHBvcnQgLS1yZWxh
dGl2ZScpCistICAgICAgICBlcnJvcignbG4gZG9lcyBub3Qgc3VwcG9ydCAtLXJlbGF0aXZl
IChhZGRlZCBpbiBjb3JldXRpbHMgOC4xNiknKQogLWVuZGlmCiAtCiAgIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCkBAIC02
MCw1ICs2MCw1IEBAIGluZGV4IDcwZjcxNzJhZS4uYTQyNjY2YWFjIDEwMDc1NQogKyAgICAg
ICAgbG5yICIkdW5pdHBhdGgiICIkZGlyIgogK2ZpCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDI0LWNv
bXBhcmlzb25fZm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3LXNpZ25hdHVyZS0ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMy1jb21wYXJpc29u
X2ZuX3QtaXMtZ2xpYmMtc3BlY2lmaWMtdXNlLXJhdy1zaWduYXR1cmUtLnBhdGNoCnNpbWls
YXJpdHkgaW5kZXggNDclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC8wMDI0LWNvbXBhcmlzb25fZm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3
LXNpZ25hdHVyZS0ucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC8wMDAzLWNvbXBhcmlzb25fZm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3
LXNpZ25hdHVyZS0ucGF0Y2gKaW5kZXggZmU3ZTYyMy4uMTE1ZmIzMyAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjQtY29tcGFyaXNvbl9mbl90
LWlzLWdsaWJjLXNwZWNpZmljLXVzZS1yYXctc2lnbmF0dXJlLS5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwMy1jb21wYXJpc29uX2ZuX3QtaXMt
Z2xpYmMtc3BlY2lmaWMtdXNlLXJhdy1zaWduYXR1cmUtLnBhdGNoCkBAIC0xLDIzICsxLDMy
IEBACi1Gcm9tIDc2YzcxYWE4ODkxNTVmMjliZTFkNWQyYjc0YTJjNGZhYTU5MDljOGMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU5NjVlNzQ4YzcwMzBkZjA3MDllNjMxMjhk
YjJmMDIzNTQwYTA2YmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJh
aiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmto
ZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IFNh
dCwgMTIgU2VwIDIwMTUgMTg6NTM6MzEgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAyNC8zMV0g
Y29tcGFyaXNvbl9mbl90IGlzIGdsaWJjIHNwZWNpZmljLCB1c2UgcmF3IHNpZ25hdHVyZSBp
bgorU3ViamVjdDogW1BBVENIIDAzLzE5XSBjb21wYXJpc29uX2ZuX3QgaXMgZ2xpYmMgc3Bl
Y2lmaWMsIHVzZSByYXcgc2lnbmF0dXJlIGluCiAgZnVuY3Rpb24gcG9pbnRlcgogCiBtYWtl
IGl0IHdvcmsgd2l0aCBtdXNsIHdoZXJlIGNvbXBhcmlzb25fZm5fdCBpcyBub3QgcHJvdmlk
ZWQKIAotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCitVcHN0cmVhbS1TdGF0dXM6IEluYXBw
cm9wcmlhdGUgW211c2wgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBn
bWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogLS0tCi0gc3JjL2Jh
c2ljL3V0aWwuaCB8IDIgKy0KLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKKyBzcmMvYmFzaWMvdXRpbC5oIHwgNCArKy0tCisgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3Ny
Yy9iYXNpYy91dGlsLmggYi9zcmMvYmFzaWMvdXRpbC5oCi1pbmRleCA5ZDFiMTA3NTYuLjEy
ZGI1M2E5MyAxMDA2NDQKK2luZGV4IDQwZWFmNTE4Yy4uYzU4MzkyMzk3IDEwMDY0NAogLS0t
IGEvc3JjL2Jhc2ljL3V0aWwuaAogKysrIGIvc3JjL2Jhc2ljL3V0aWwuaAotQEAgLTk1LDcg
Kzk1LDcgQEAgdm9pZCAqeGJzZWFyY2hfcihjb25zdCB2b2lkICprZXksIGNvbnN0IHZvaWQg
KmJhc2UsIHNpemVfdCBubWVtYiwgc2l6ZV90IHNpemUsCitAQCAtNzcsNyArNzcsNyBAQCB2
b2lkICp4YnNlYXJjaF9yKGNvbnN0IHZvaWQgKmtleSwgY29uc3Qgdm9pZCAqYmFzZSwgc2l6
ZV90IG5tZW1iLCBzaXplX3Qgc2l6ZSwKKyAgKiB0aGF0IG9ubHkgaWYgbm1lbWIgJmd0OyAw
LgorICAqLworIHN0YXRpYyBpbmxpbmUgdm9pZCogYnNlYXJjaF9zYWZlKGNvbnN0IHZvaWQg
KmtleSwgY29uc3Qgdm9pZCAqYmFzZSwKKy0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzaXplX3Qgbm1lbWIsIHNpemVfdCBzaXplLCBjb21wYXJpc29uX2ZuX3QgY29tcGFy
KSB7CisrICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG5tZW1iLCBz
aXplX3Qgc2l6ZSwgaW50ICgqY29tcGFyKShjb25zdCB2b2lkICosIGNvbnN0IHZvaWQgKikp
IHsKKyAgICAgICAgIGlmIChubWVtYiAmbHQ7PSAwKQorICAgICAgICAgICAgICAgICByZXR1
cm4gTlVMTDsKKyAKK0BAIC04OSw3ICs4OSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCogYnNl
YXJjaF9zYWZlKGNvbnN0IHZvaWQgKmtleSwgY29uc3Qgdm9pZCAqYmFzZSwKICAgKiBOb3Jt
YWwgcXNvcnQgcmVxdWlyZXMgYmFzZSB0byBiZSBub25udWxsLiBIZXJlIHdlcmUgcmVxdWly
ZQogICAqIHRoYXQgb25seSBpZiBubWVtYiAmZ3Q7IDAuCiAgICovCkBAIC0yNyw1ICszNiw1
IEBAIGluZGV4IDlkMWIxMDc1Ni4uMTJkYjUzYTkzIDEwMDY0NAogICAgICAgICAgICAgICAg
ICByZXR1cm47CiAgCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA0LWltcGxtZW50LXN5c3RlbWQtc3lz
di1pbnN0YWxsLWZvci1PRS5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDAzLWltcGxtZW50LXN5c3RlbWQtc3lzdi1pbnN0YWxsLWZvci1PRS5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAwNC1pbXBsbWVudC1zeXN0ZW1kLXN5c3YtaW5zdGFsbC1mb3ItT0Uu
cGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDAz
LWltcGxtZW50LXN5c3RlbWQtc3lzdi1pbnN0YWxsLWZvci1PRS5wYXRjaAppbmRleCA4M2Zk
YjUzLi42YzU5NWFlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvMDAwNC1pbXBsbWVudC1zeXN0ZW1kLXN5c3YtaW5zdGFsbC1mb3ItT0UucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDMtaW1wbG1lbnQt
c3lzdGVtZC1zeXN2LWluc3RhbGwtZm9yLU9FLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJv
bSA3MGQ0NTZmYjIxZGUyYTgwNjk3ZmEzNjRmMDg0NzUzMzlkNjM5NmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSAwZmNiNmU2NDY0MDEyMDVlMTdjYzZjMTI5NDQxYTQ5MDIz
YzYyY2VmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWls
LmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBTYXQsIDUgU2Vw
IDIwMTUgMDY6MzE6NDcgKzAwMDAKLVN1YmplY3Q6IFtQQVRDSCAwNC8zMV0gaW1wbG1lbnQg
c3lzdGVtZC1zeXN2LWluc3RhbGwgZm9yIE9FCitTdWJqZWN0OiBbUEFUQ0ggMy85XSBpbXBs
bWVudCBzeXN0ZW1kLXN5c3YtaW5zdGFsbCBmb3IgT0UKIAogVXNlIHVwZGF0ZS1yYy5kIGZv
ciBlbmFibGluZy9kaXNhYmxpbmcgYW5kIHN0YXR1cyBjb21tYW5kCiB0byBjaGVjayB0aGUg
c3RhdHVzIG9mIHRoZSBzeXN2IHNlcnZpY2UKQEAgLTE0LDEwICsxNCwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0
OzwvYT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvc3JjL3N5c3RlbWN0bC9zeXN0ZW1kLXN5c3YtaW5zdGFsbC5T
S0VMRVRPTiBiL3NyYy9zeXN0ZW1jdGwvc3lzdGVtZC1zeXN2LWluc3RhbGwuU0tFTEVUT04K
LWluZGV4IGE1M2EzZTYyMi4uNWQ4NzdiMDZlIDEwMDc1NQoraW5kZXggOGMxNmNmOTk5Li45
ZjA3OGExMjEgMTAwNzU1CiAtLS0gYS9zcmMvc3lzdGVtY3RsL3N5c3RlbWQtc3lzdi1pbnN0
YWxsLlNLRUxFVE9OCiArKysgYi9zcmMvc3lzdGVtY3RsL3N5c3RlbWQtc3lzdi1pbnN0YWxs
LlNLRUxFVE9OCi1AQCAtMzAsMTcgKzMwLDE3IEBAIGNhc2UgIiQxIiBpbgorQEAgLTMyLDE3
ICszMiwxNyBAQCBjYXNlICIkMSIgaW4KICAgICAgZW5hYmxlKQogICAgICAgICAgIyBjYWxs
IHRoZSBjb21tYW5kIHRvIGVuYWJsZSBTeXNWIGluaXQgc2NyaXB0ICROQU1FIGhlcmUKICAg
ICAgICAgICMgKGNvbnNpZGVyIG9wdGlvbmFsICRST09UKQpAQCAtMzksNSArMzksNSBAQCBp
bmRleCBhNTNhM2U2MjIuLjVkODc3YjA2ZSAxMDA3NTUKICAgICAgKikKICAgICAgICAgIHVz
YWdlIDs7CiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDEzLWFkZC1mYWxsYmFjay1wYXJzZV9wcmludGZf
Zm9ybWF0LWltcGxlbWVudGF0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLzAwMDQtYWRkLWZhbGxiYWNrLXBhcnNlX3ByaW50Zl9mb3JtYXQtaW1wbGVt
ZW50YXRpb24ucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTMtYWRkLWZhbGxiYWNrLXBhcnNlX3By
aW50Zl9mb3JtYXQtaW1wbGVtZW50YXRpb24ucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA0LWFkZC1mYWxsYmFjay1wYXJzZV9wcmludGZf
Zm9ybWF0LWltcGxlbWVudGF0aW9uLnBhdGNoCmluZGV4IDljOTI3OGQuLjc2NTJhMmQgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDEzLWFkZC1m
YWxsYmFjay1wYXJzZV9wcmludGZfZm9ybWF0LWltcGxlbWVudGF0aW9uLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA0LWFkZC1mYWxsYmFjay1w
YXJzZV9wcmludGZfZm9ybWF0LWltcGxlbWVudGF0aW9uLnBhdGNoCkBAIC0xLDI5ICsxLDI5
IEBACi1Gcm9tIDU4MGQyM2NmMGIzMmUzNmE4ZmI5NjcxMDMzNmZmZWY0MzJiM2M3Y2UgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU4MmFmN2VjMTMxMzFkZmNjNjIwZWQ4MWRl
N2IyMTE5MTRjNGNiMDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFp
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVu
QHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgotRGF0
ZTogV2VkLCAyOCBGZWIgMjAxOCAyMToxMDo1OCAtMDgwMAotU3ViamVjdDogW1BBVENIXSBh
ZGQgZmFsbGJhY2sgcGFyc2VfcHJpbnRmX2Zvcm1hdCBpbXBsZW1lbnRhdGlvbgorRGF0ZTog
RnJpLCAyOSBKdW4gMjAxOCAxMzo0Mzo0OSArMDgwMAorU3ViamVjdDogW1BBVENIIDA0LzE5
XSBhZGQgZmFsbGJhY2sgcGFyc2VfcHJpbnRmX2Zvcm1hdCBpbXBsZW1lbnRhdGlvbgogCi1V
cHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbbXVzbCBzcGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhp
bmcgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnN5c3Rl
bWRAZXNtaWwuZGsiPiZsdDtzeXN0ZW1kQGVzbWlsLmRrJmd0OzwvYT4KIFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9h
PgogU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3
aW5kcml2ZXIuY29tJmd0OzwvYT4KIC0tLQogIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKwotIHNyYy9iYXNpYy9tZXNvbi5idWlsZCAgICAgICAgICAgfCAgIDQg
KworIHNyYy9iYXNpYy9tZXNvbi5idWlsZCAgICAgICAgICAgfCAgIDUgKwogIHNyYy9iYXNp
Yy9wYXJzZS1wcmludGYtZm9ybWF0LmMgfCAyNzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogIHNyYy9iYXNpYy9wYXJzZS1wcmludGYtZm9ybWF0LmggfCAg
NTcgKysrKysrKysrCiAgc3JjL2Jhc2ljL3N0ZGlvLXV0aWwuaCAgICAgICAgICB8ICAgMiAr
LQogIHNyYy9qb3VybmFsL2pvdXJuYWwtc2VuZC5jICAgICAgfCAgIDIgKy0KLSA2IGZpbGVz
IGNoYW5nZWQsIDMzNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorIDYgZmlsZXMg
Y2hhbmdlZCwgMzM4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHNyYy9iYXNpYy9wYXJzZS1wcmludGYtZm9ybWF0LmMKICBjcmVhdGUgbW9k
ZSAxMDA2NDQgc3JjL2Jhc2ljL3BhcnNlLXByaW50Zi1mb3JtYXQuaAogCiBkaWZmIC0tZ2l0
IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggOTRhMTY3MTJiLi40ZWFiYWFm
ZTggMTAwNjQ0CitpbmRleCBlMDQ1YjkyMjQuLjhjMTZiYzk3OSAxMDA2NDQKIC0tLSBhL21l
c29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTYyMCw2ICs2MjAsNyBAQCBmb3Jl
YWNoIGhlYWRlciA6IFsnY3J5cHQuaCcsCitAQCAtNTk4LDYgKzU5OCw3IEBAIGZvcmVhY2gg
aGVhZGVyIDogWydjcnlwdC5oJywKICAgICAgICAgICAgICAgICAgICAnbGludXgvYnRyZnMu
aCcsCiAgICAgICAgICAgICAgICAgICAgJ2xpbnV4L21lbWZkLmgnLAogICAgICAgICAgICAg
ICAgICAgICdsaW51eC92bV9zb2NrZXRzLmgnLApAQCAtMzIsMjAgKzMyLDIxIEBAIGluZGV4
IDk0YTE2NzEyYi4uNGVhYmFhZmU4IDEwMDY0NAogICAgICAgICAgICAgICAgICAgICd2YWxn
cmluZC9tZW1jaGVjay5oJywKICAgICAgICAgICAgICAgICAgICAndmFsZ3JpbmQvdmFsZ3Jp
bmQuaCcsCiBkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL21lc29uLmJ1aWxkIGIvc3JjL2Jhc2lj
L21lc29uLmJ1aWxkCi1pbmRleCA0NGNkMzFlY2IuLjQzNWM2ZWUwMiAxMDA2NDQKK2luZGV4
IDMxNjI1YjE3OC4uMGMyNzUyOGU3IDEwMDY0NAogLS0tIGEvc3JjL2Jhc2ljL21lc29uLmJ1
aWxkCiArKysgYi9zcmMvYmFzaWMvbWVzb24uYnVpbGQKLUBAIC0zMTAsNiArMzEwLDEwIEBA
IGVuZGZvcmVhY2gKK0BAIC0zMDIsNiArMzAyLDExIEBAIGZvcmVhY2ggaXRlbSA6IFtbJ2Fm
JywgICAgIGFmX2xpc3RfdHh0LCAgICAgJ2FmJywgICAgICAgICAnJ10sCisgZW5kZm9yZWFj
aAogIAogIGJhc2ljX3NvdXJjZXMgKz0gW21pc3NpbmdfaF0gKyBnZW5lcmF0ZWRfZ3BlcmZf
aGVhZGVycwotIAorKwogK2lmIGNvbmYuZ2V0KCdIQVZFX1BSSU5URl9IJykgIT0gMQogKyAg
ICAgICAgYmFzaWNfc291cmNlcyArPSBbZmlsZXMoJ3BhcnNlLXByaW50Zi1mb3JtYXQuYycp
XQogK2VuZGlmCiArCi0gbGliYmFzaWMgPSBzdGF0aWNfbGlicmFyeSgKLSAgICAgICAgICdi
YXNpYycsCi0gICAgICAgICBiYXNpY19zb3VyY2VzLAorIGJhc2ljX2djcnlwdF9zb3VyY2Vz
ID0gZmlsZXMoCisgICAgICAgICAnZ2NyeXB0LXV0aWwuYycsCisgICAgICAgICAnZ2NyeXB0
LXV0aWwuaCcpCiBkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL3BhcnNlLXByaW50Zi1mb3JtYXQu
YyBiL3NyYy9iYXNpYy9wYXJzZS1wcmludGYtZm9ybWF0LmMKIG5ldyBmaWxlIG1vZGUgMTAw
NjQ0CiBpbmRleCAwMDAwMDAwMDAuLjQ5NDM3ZTU0NApAQCAtMzg5LDEyICszOTAsMTIgQEAg
aW5kZXggMDAwMDAwMDAwLi40N2JlNzUyMmQKICsKICsjZW5kaWYgLyogSEFWRV9QUklOVEZf
SCAqLwogZGlmZiAtLWdpdCBhL3NyYy9iYXNpYy9zdGRpby11dGlsLmggYi9zcmMvYmFzaWMv
c3RkaW8tdXRpbC5oCi1pbmRleCBkYmZhZmJhMjYuLjgwMzgzODBkNiAxMDA2NDQKK2luZGV4
IDczYzAzMjc0Yy4uMzAxOTJjZDcxIDEwMDY0NAogLS0tIGEvc3JjL2Jhc2ljL3N0ZGlvLXV0
aWwuaAogKysrIGIvc3JjL2Jhc2ljL3N0ZGlvLXV0aWwuaAotQEAgLTIwLDEyICsyMCwxMiBA
QAotICAgYWxvbmcgd2l0aCBzeXN0ZW1kOyBJZiBub3QsIHNlZSA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvIj4m
bHQ7aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLyZndDs8L2E+LgotICoqKi8KK0BAIC0x
LDEyICsxLDEyIEBACisgLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IExHUEwtMi4xKyAq
LworICNwcmFnbWEgb25jZQogIAogLSNpbmNsdWRlICZsdDtwcmludGYuaCZndDsKICAjaW5j
bHVkZSAmbHQ7c3RkYXJnLmgmZ3Q7CkBAIC00MDQsMTMgKzQwNSwxMyBAQCBpbmRleCBkYmZh
ZmJhMjYuLjgwMzgzODBkNiAxMDA2NDQKICAjaW5jbHVkZSAibWFjcm8uaCIKICsjaW5jbHVk
ZSAicGFyc2UtcHJpbnRmLWZvcm1hdC5oIgogIAotICNkZWZpbmUgeHNwcmludGYoYnVmLCBm
bXQsIC4uLikgXAotICAgICAgICAgYXNzZXJ0X21lc3NhZ2Vfc2UoKHNpemVfdCkgc25wcmlu
dGYoYnVmLCBFTEVNRU5UU09GKGJ1ZiksIGZtdCwgX19WQV9BUkdTX18pICZsdDsgRUxFTUVO
VFNPRihidWYpLCAieHNwcmludGY6ICIgI2J1ZiAiW10gbXVzdCBiZSBiaWcgZW5vdWdoIikK
KyAjZGVmaW5lIHNucHJpbnRmX29rKGJ1ZiwgbGVuLCBmbXQsIC4uLikgXAorICAgICAgICAg
KChzaXplX3QpIHNucHJpbnRmKGJ1ZiwgbGVuLCBmbXQsIF9fVkFfQVJHU19fKSAmbHQ7IChs
ZW4pKQogZGlmZiAtLWdpdCBhL3NyYy9qb3VybmFsL2pvdXJuYWwtc2VuZC5jIGIvc3JjL2pv
dXJuYWwvam91cm5hbC1zZW5kLmMKLWluZGV4IDczMzI5YmEwMi4uNzBiYjllMGU4IDEwMDY0
NAoraW5kZXggYTA2MjE1MjRhLi42NWJjYmNkMmUgMTAwNjQ0CiAtLS0gYS9zcmMvam91cm5h
bC9qb3VybmFsLXNlbmQuYwogKysrIGIvc3JjL2pvdXJuYWwvam91cm5hbC1zZW5kLmMKLUBA
IC0yMCw3ICsyMCw2IEBACitAQCAtMiw3ICsyLDYgQEAKICAKICAjaW5jbHVkZSAmbHQ7ZXJy
bm8uaCZndDsKICAjaW5jbHVkZSAmbHQ7ZmNudGwuaCZndDsKQEAgLTQxOCw3ICs0MTksNyBA
QCBpbmRleCA3MzMyOWJhMDIuLjcwYmI5ZTBlOCAxMDA2NDQKICAjaW5jbHVkZSAmbHQ7c3Rk
ZGVmLmgmZ3Q7CiAgI2luY2x1ZGUgJmx0O3N5cy9zb2NrZXQuaCZndDsKICAjaW5jbHVkZSAm
bHQ7c3lzL3VuLmgmZ3Q7Ci1AQCAtMzksNiArMzgsNyBAQAorQEAgLTIxLDYgKzIwLDcgQEAK
ICAjaW5jbHVkZSAic3RkaW8tdXRpbC5oIgogICNpbmNsdWRlICJzdHJpbmctdXRpbC5oIgog
ICNpbmNsdWRlICJ1dGlsLmgiCkBAIC00MjcsNSArNDI4LDUgQEAgaW5kZXggNzMzMjliYTAy
Li43MGJiOWUwZTggMTAwNjQ0CiAgI2RlZmluZSBTTkRCVUZfU0laRSAoOCoxMDI0KjEwMjQp
CiAgCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA1LXJ1bGVzLXdoaXRlbGlzdC1oZC1kZXZpY2VzLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDQtcnVsZXMtd2hp
dGVsaXN0LWhkLWRldmljZXMucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDUtcnVsZXMtd2hpdGVs
aXN0LWhkLWRldmljZXMucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDA0LXJ1bGVzLXdoaXRlbGlzdC1oZC1kZXZpY2VzLnBhdGNoCmluZGV4
IGU0NDIxYzguLjdlMzdjYmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDA1LXJ1bGVzLXdoaXRlbGlzdC1oZC1kZXZpY2VzLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA0LXJ1bGVzLXdoaXRlbGlz
dC1oZC1kZXZpY2VzLnBhdGNoCkBAIC0xLDcgKzEsNyBAQAotRnJvbSA3YjViMzQ5OTMwMDJi
NDQxOGJhOGEzYzJhZTY2MWE3MzM3ZmQ4ZWQwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA1ZDgxMjhmMzgzMmZkMTFmZDA0NmQxZDFhZDg2YzRlZTdiYzFkZmYwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5r
aGVtQGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBXZWQsIDkgTm92IDIwMTYgMTk6NDE6MTMg
LTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAwNS8zMV0gcnVsZXM6IHdoaXRlbGlzdCBoZCogZGV2
aWNlcworU3ViamVjdDogW1BBVENIIDQvOV0gcnVsZXM6IHdoaXRlbGlzdCBoZCogZGV2aWNl
cwogCiBxZW11IGJ5IGRlZmF1bHQgZW11bGF0ZXMgSURFIGFuZCB0aGUgbGludXgteW9jdG8g
a2VybmVsKHMpIHVzZQogQ09ORklHX0lERSBpbnN0ZWFkIG9mIHRoZSBtb3JlIG1vZGVybiBs
aWJzYXRhLCBzbyBkaXNrcyBhcHBlYXIgYXMKQEAgLTE2LDcgKzE2LDcgQEAgU2lnbmVkLW9m
Zi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8
L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAK
IGRpZmYgLS1naXQgYS9ydWxlcy82MC1wZXJzaXN0ZW50LXN0b3JhZ2UucnVsZXMgYi9ydWxl
cy82MC1wZXJzaXN0ZW50LXN0b3JhZ2UucnVsZXMKLWluZGV4IDBkZThjZjNhMS4uZDNmNThm
MTUzIDEwMDY0NAoraW5kZXggOGRkYjc1NzdjLi44MTFlOTQ4YWQgMTAwNjQ0CiAtLS0gYS9y
dWxlcy82MC1wZXJzaXN0ZW50LXN0b3JhZ2UucnVsZXMKICsrKyBiL3J1bGVzLzYwLXBlcnNp
c3RlbnQtc3RvcmFnZS5ydWxlcwogQEAgLTcsNyArNyw3IEBAIEFDVElPTj09InJlbW92ZSIs
IEdPVE89InBlcnNpc3RlbnRfc3RvcmFnZV9lbmQ8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86QEAtMjksNSsyOSw1QEBpbmRleDBkZThjZjNhMS4uZDNm
NThmMTUzMTAwNjQ0I2lnbm9yZXBhcnRpdGlvbnN0aGF0c3BhbnRoZWVudGlyZWRpc2tURVNU
PT0iPiIKQEAgLTI5LDUgKzI5LDUgQEAgaW5kZXggMGRlOGNmM2ExLi5kM2Y1OGYxNTMgMTAw
NjQ0CiAgIyBpZ25vcmUgcGFydGl0aW9ucyB0aGF0IHNwYW4gdGhlIGVudGlyZSBkaXNrCiAg
VEVTVD09IjwvYT53aG9sZV9kaXNrIiwgR09UTz0icGVyc2lzdGVudF9zdG9yYWdlX2VuZCIK
IC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUv
c3lzdGVtZC9zeXN0ZW1kLzAwMDYtTWFrZS1yb290LXMtaG9tZS1kaXJlY3RvcnktY29uZmln
dXJhYmxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDUt
TWFrZS1yb290LXMtaG9tZS1kaXJlY3RvcnktY29uZmlndXJhYmxlLnBhdGNoCnNpbWlsYXJp
dHkgaW5kZXggNzAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDA2LU1ha2Utcm9vdC1zLWhvbWUtZGlyZWN0b3J5LWNvbmZpZ3VyYWJsZS5wYXRj
aApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDUtTWFr
ZS1yb290LXMtaG9tZS1kaXJlY3RvcnktY29uZmlndXJhYmxlLnBhdGNoCmluZGV4IDViYTk2
NjEuLmMxMzcwODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDA2LU1ha2Utcm9vdC1zLWhvbWUtZGlyZWN0b3J5LWNvbmZpZ3VyYWJsZS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwNS1NYWtlLXJv
b3Qtcy1ob21lLWRpcmVjdG9yeS1jb25maWd1cmFibGUucGF0Y2gKQEAgLTEsNyArMSw3IEBA
Ci1Gcm9tIDlkNjMyMjc0MjBmMGM0ZjA5M2MxYzIwNjZlYWZlMmI2MTUyMDcwY2YgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhiODI2NjNhZWVlZGY5Y2E1OGUzYjk3MTE2YjRj
NGRhNTIyOWUwZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxh
IGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdp
bmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgotRGF0ZTog
RnJpLCAyMyBGZWIgMjAxOCAxMzo0NzozNyArMDgwMAotU3ViamVjdDogW1BBVENIIDA2LzMx
XSBNYWtlIHJvb3QncyBob21lIGRpcmVjdG9yeSBjb25maWd1cmFibGUKK0RhdGU6IFdlZCwg
MjcgSnVuIDIwMTggMTY6NDY6NDUgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSCA1LzldIE1ha2Ug
cm9vdCdzIGhvbWUgZGlyZWN0b3J5IGNvbmZpZ3VyYWJsZQogCiBPcGVuRW1iZWRkZWQgaGFz
IGEgY29uZmlndXJhYmxlIGhvbWUgZGlyZWN0b3J5IGZvciByb290LiBBbGxvdwogc3lzdGVt
ZCB0byBiZSBidWlsdCB1c2luZyBpdHMgaWRlYSBvZiB3aGF0IHJvb3QncyBob21lIGRpcmVj
dG9yeQpAQCAtMTYsMTUgKzE2LDE1IEBAIFNpZ25lZC1vZmYtYnk6IERhbiBNY0dyZWdvciA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZGFuLm1jZ3Jl
Z29yQHVzYXNrLmNhIj4mbHQ7ZGFuLm1jZ3JlZ29yQHVzYXNrLmNhJmd0OzwvYT4KIFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20m
Z3Q7PC9hPgogU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWku
Q2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KIC0tLQotIG1lc29uLmJ1aWxkICAgICAgIHwg
OCArKysrKysrKworIG1lc29uLmJ1aWxkICAgICAgIHwgNyArKysrKysrCiAgbWVzb25fb3B0
aW9ucy50eHQgfCAyICsrCi0gMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCisg
MiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL21lc29u
LmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDczNDdlYTg4MC4uOTE4MTAxZDZiIDEwMDY0
NAoraW5kZXggNmQ1ZWRjYjRlLi4zMjMxNDZmZTEgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWls
ZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC05NCw2ICs5NCwxMSBAQCBpZiByb290bGliZGly
ID09ICcnCitAQCAtODksNiArODksMTEgQEAgaWYgcm9vdGxpYmRpciA9PSAnJwogICAgICAg
ICAgcm9vdGxpYmRpciA9IGpvaW5fcGF0aHMocm9vdHByZWZpeGRpciwgbGliZGlyLnNwbGl0
KCcvJylbLTFdKQogIGVuZGlmCiAgCkBAIC0zNiw3ICszNiw3IEBAIGluZGV4IDczNDdlYTg4
MC4uOTE4MTAxZDZiIDEwMDY0NAogICMgRGlycyBvZiBleHRlcm5hbCBwYWNrYWdlcwogIHBr
Z2NvbmZpZ2RhdGFkaXIgPSBqb2luX3BhdGhzKGRhdGFkaXIsICdwa2djb25maWcnKQogIHBr
Z2NvbmZpZ2xpYmRpciA9IGpvaW5fcGF0aHMobGliZGlyLCAncGtnY29uZmlnJykKLUBAIC0y
MDUsNiArMjEwLDcgQEAgY29uZi5zZXRfcXVvdGVkKCdVREVWTElCRVhFQ0RJUicsICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1ZGV2bGliZXhlY2RpcikKK0BAIC0yMTAsNiArMjE1
LDcgQEAgY29uZi5zZXRfcXVvdGVkKCdVREVWTElCRVhFQ0RJUicsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1ZGV2bGliZXhlY2RpcikKICBjb25mLnNldF9xdW90ZWQoJ1BPTEtJ
VF9BR0VOVF9CSU5BUllfUEFUSCcsICAgICAgICAgICAgICAgICAgIGpvaW5fcGF0aHMoYmlu
ZGlyLCAncGt0dHlhZ2VudCcpKQogIGNvbmYuc2V0X3F1b3RlZCgnTElCRElSJywgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGliZGlyKQogIGNvbmYuc2V0X3F1b3Rl
ZCgnUk9PVExJQkRJUicsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcm9vdGxp
YmRpcikKQEAgLTQ0LDcgKzQ0LDcgQEAgaW5kZXggNzM0N2VhODgwLi45MTgxMDFkNmIgMTAw
NjQ0CiAgY29uZi5zZXRfcXVvdGVkKCdST09UTElCRVhFQ0RJUicsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByb290bGliZXhlY2RpcikKICBjb25mLnNldF9xdW90ZWQoJ0JPT1RM
SUJESVInLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb3RsaWJkaXIpCiAg
Y29uZi5zZXRfcXVvdGVkKCdTWVNURU1EX1BVTExfUEFUSCcsICAgICAgICAgICAgICAgICAg
ICAgICAgICBqb2luX3BhdGhzKHJvb3RsaWJleGVjZGlyLCAnc3lzdGVtZC1wdWxsJykpCi1A
QCAtMjIxLDYgKzIyNyw3IEBAIHN1YnN0cy5zZXQoJ3ByZWZpeCcsICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJlZml4ZGlyKQorQEAgLTIyOCw2ICsyMzQs
NyBAQCBzdWJzdHMuc2V0KCdwcmVmaXgnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHByZWZpeGRpcikKICBzdWJzdHMuc2V0KCdleGVjX3ByZWZpeCcsICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeGRpcikKICBzdWJzdHMu
c2V0KCdsaWJkaXInLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYmRpcikKICBzdWJzdHMuc2V0KCdyb290bGliZGlyJywgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJvb3RsaWJkaXIpCkBAIC01MiwxOSArNTIsMTEgQEAgaW5k
ZXggNzM0N2VhODgwLi45MTgxMDFkNmIgMTAwNjQ0CiAgc3Vic3RzLnNldCgnaW5jbHVkZWRp
cicsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbmNsdWRlZGlyKQog
IHN1YnN0cy5zZXQoJ3BrZ3N5c2NvbmZkaXInLCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGtnc3lzY29uZmRpcikKICBzdWJzdHMuc2V0KCdiaW5kaXInLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJpbmRpcikKLUBAIC0yNzA1LDYg
KzI3MTIsNyBAQCBzdGF0dXMgPSBbCi0gICAgICAgICAnaW5jbHVkZSBkaXJlY3Rvcnk6ICAg
ICAgICAgICAgICAgICBAMEAnLmZvcm1hdChpbmNsdWRlZGlyKSwKLSAgICAgICAgICdsaWIg
ZGlyZWN0b3J5OiAgICAgICAgICAgICAgICAgICAgIEAwQCcuZm9ybWF0KGxpYmRpciksCi0g
ICAgICAgICAncm9vdGxpYiBkaXJlY3Rvcnk6ICAgICAgICAgICAgICAgICBAMEAnLmZvcm1h
dChyb290bGliZGlyKSwKLSsgICAgICAgICdyb290aG9tZSBkaXJlY3Rvcnk6ICAgICAgICAg
ICAgICAgIEAwQCcuZm9ybWF0KHJvb3Rob21lZGlyKSwKLSAgICAgICAgICdTeXNWIGluaXQg
c2NyaXB0czogICAgICAgICAgICAgICAgIEAwQCcuZm9ybWF0KHN5c3Zpbml0X3BhdGgpLAot
ICAgICAgICAgJ1N5c1YgcmM/LmQgZGlyZWN0b3JpZXM6ICAgICAgICAgICAgQDBAJy5mb3Jt
YXQoc3lzdnJjbmRfcGF0aCksCi0gICAgICAgICAnUEFNIG1vZHVsZXMgZGlyZWN0b3J5OiAg
ICAgICAgICAgICBAMEAnLmZvcm1hdChwYW1saWJkaXIpLAogZGlmZiAtLWdpdCBhL21lc29u
X29wdGlvbnMudHh0IGIvbWVzb25fb3B0aW9ucy50eHQKLWluZGV4IDM5ODIyZDZjZC4uMGIy
NGYwZTBmIDEwMDY0NAoraW5kZXggMTZjMWYyYjJmLi5hYTlhMzMzNjggMTAwNjQ0CiAtLS0g
YS9tZXNvbl9vcHRpb25zLnR4dAogKysrIGIvbWVzb25fb3B0aW9ucy50eHQKLUBAIC0yMiw2
ICsyMiw4IEBAIG9wdGlvbigncm9vdGxpYmRpcicsIHR5cGUgOiAnc3RyaW5nJywKK0BAIC05
LDYgKzksOCBAQCBvcHRpb24oJ3Jvb3RsaWJkaXInLCB0eXBlIDogJ3N0cmluZycsCiAgICAg
ICAgIGRlc2NyaXB0aW9uIDogJycnWy91c3JdL2xpYi94ODZfNjQtbGludXgtZ251IG9yIHN1
Y2gnJycpCiAgb3B0aW9uKCdyb290cHJlZml4JywgdHlwZSA6ICdzdHJpbmcnLAogICAgICAg
ICBkZXNjcmlwdGlvbiA6ICcnJ292ZXJyaWRlIHRoZSByb290IHByZWZpeCcnJykKQEAgLTcy
LDcgKzY0LDcgQEAgaW5kZXggMzk4MjJkNmNkLi4wYjI0ZjBlMGYgMTAwNjQ0CiArICAgICAg
IGRlc2NyaXB0aW9uIDogJycnb3ZlcnJpZGUgdGhlIHJvb3QgaG9tZSBkaXJlY3RvcnknJycp
CiAgb3B0aW9uKCdsaW5rLXVkZXYtc2hhcmVkJywgdHlwZSA6ICdib29sZWFuJywKICAgICAg
ICAgZGVzY3JpcHRpb24gOiAnbGluayBzeXN0ZW1kLXVkZXYgYW5kIGl0cyBoZWxwZXJzIHRv
IGxpYnN5c3RlbWQtc2hhcmVkLnNvJykKLSAKKyBvcHRpb24oJ2xpbmstc3lzdGVtY3RsLXNo
YXJlZCcsIHR5cGU6ICdib29sZWFuJywKIC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDUtaW5jbHVkZS1n
c2hhZG93LW9ubHktaWYtRU5BQkxFX0dTSEFET1ctaXMtMS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA1LWluY2x1ZGUtZ3NoYWRvdy1vbmx5LWlmLUVO
QUJMRV9HU0hBRE9XLWlzLTEucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMC4uNmQ1ZmFmNQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZC8wMDA1LWluY2x1ZGUtZ3NoYWRvdy1vbmx5LWlmLUVOQUJMRV9HU0hB
RE9XLWlzLTEucGF0Y2gKQEAgLTAsMCArMSwyOSBAQAorRnJvbSBhMmM0ZDQ2OTQ0ODkyMTc0
OTMwMTM1NjcyNTA4Mzg5YTA0ZTE5MWYwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0
OzwvYT4KK0RhdGU6IEZyaSwgMjkgSnVuIDIwMTggMTM6NTM6MjkgKzA4MDAKK1N1YmplY3Q6
IFtQQVRDSCAwNS8xOV0gaW5jbHVkZSBnc2hhZG93IG9ubHkgaWYgRU5BQkxFX0dTSEFET1cg
aXMgMQorCitVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW211c2xdCisKK1NpZ25l
ZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVy
LmNvbSZndDs8L2E+CistLS0KKyBzcmMvYmFzaWMvdXNlci11dGlsLmggfCAyICsrCisgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvc3JjL2Jhc2lj
L3VzZXItdXRpbC5oIGIvc3JjL2Jhc2ljL3VzZXItdXRpbC5oCitpbmRleCBiNzRmMTY4ODUu
LmY5YzFlMjljNCAxMDA2NDQKKy0tLSBhL3NyYy9iYXNpYy91c2VyLXV0aWwuaAorKysrIGIv
c3JjL2Jhc2ljL3VzZXItdXRpbC5oCitAQCAtMiw3ICsyLDkgQEAKKyAjcHJhZ21hIG9uY2UK
KyAKKyAjaW5jbHVkZSAmbHQ7Z3JwLmgmZ3Q7CisrI2lmIEVOQUJMRV9HU0hBRE9XCisgI2lu
Y2x1ZGUgJmx0O2dzaGFkb3cuaCZndDsKKysjZW5kaWYKKyAjaW5jbHVkZSAmbHQ7cHdkLmgm
Z3Q7CisgI2luY2x1ZGUgJmx0O3NoYWRvdy5oJmd0OworICNpbmNsdWRlICZsdDtzdGRib29s
LmgmZ3Q7CistLSAKKzIuMTEuMAorCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAyNy1yZW1vdmUtbm9ib2R5LXVzZXItZ3JvdXAtY2hlY2tpbmcu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwNi1yZW1vdmUt
bm9ib2R5LXVzZXItZ3JvdXAtY2hlY2tpbmcucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA0MCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjctcmVt
b3ZlLW5vYm9keS11c2VyLWdyb3VwLWNoZWNraW5nLnBhdGNoCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwNi1yZW1vdmUtbm9ib2R5LXVzZXItZ3Jv
dXAtY2hlY2tpbmcucGF0Y2gKaW5kZXggNDJmNTliMC4uZWI2ZWI4YiAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjctcmVtb3ZlLW5vYm9keS11
c2VyLWdyb3VwLWNoZWNraW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDA2LXJlbW92ZS1ub2JvZHktdXNlci1ncm91cC1jaGVja2luZy5wYXRj
aApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNTM1NGViNzY3ZDFlYmEyZWM0MWViMjczZjZiNjU3
ZjRhNjMwY2E4YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTE5OWFlNWRlYzli
OGE5YzllMjA0NzdkNTA5MGYxNzMyNzM1ZmJlMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNv
bSZndDs8L2E+Ci1EYXRlOiBUdWUsIDkgSmFuIDIwMTggMTQ6NDU6NDYgKzA4MDAKLVN1Ympl
Y3Q6IFtQQVRDSCAyNy8zMV0gcmVtb3ZlIG5vYm9keSB1c2VyL2dyb3VwIGNoZWNraW5nCitE
YXRlOiBUaHUsIDI4IEp1biAyMDE4IDA5OjM4OjEyICswODAwCitTdWJqZWN0OiBbUEFUQ0gg
Ni85XSByZW1vdmUgbm9ib2R5IHVzZXIvZ3JvdXAgY2hlY2tpbmcKIAogVXBzdHJlYW0tU3Rh
dHVzOiBJbmFwcHJvcHJpYXRlIFtPRSBTcGVjaWZpY10KIApAQCAtMTEsMTAgKzExLDEwIEBA
IFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2lu
ZHJpdmVyLmNvbSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDM3IGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggZjY1MTVl
OTdjLi4xYjk0N2FkYWMgMTAwNjQ0CitpbmRleCAzMjMxNDZmZTEuLjNiYjA4N2ZlZiAxMDA2
NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTcwMCw0MyAr
NzAwLDYgQEAgc3Vic3RzLnNldCgnY29udGFpbmVydWlkYmFzZW1heCcsIGNvbnRhaW5lcl91
aWRfYmFzZV9tYXgpCitAQCAtNjgxLDQzICs2ODEsNiBAQCBzdWJzdHMuc2V0KCdjb250YWlu
ZXJ1aWRiYXNlbWF4JywgY29udGFpbmVyX3VpZF9iYXNlX21heCkKICBub2JvZHlfdXNlciA9
IGdldF9vcHRpb24oJ25vYm9keS11c2VyJykKICBub2JvZHlfZ3JvdXAgPSBnZXRfb3B0aW9u
KCdub2JvZHktZ3JvdXAnKQogIApAQCAtMjIsMTggKzIyLDE4IEBAIGluZGV4IGY2NTE1ZTk3
Yy4uMWI5NDdhZGFjIDEwMDY0NAogLWlmIGdldGVudF9yZXN1bHQucmV0dXJuY29kZSgpID09
IDAKIC0gICAgICAgIG5hbWUgPSBnZXRlbnRfcmVzdWx0LnN0ZG91dCgpLnNwbGl0KCc6Jylb
MF0KIC0gICAgICAgIGlmIG5hbWUgIT0gbm9ib2R5X3VzZXIKLS0gICAgICAgICAgICAgICAg
bWVzc2FnZSgnV0FSTklORzpcbicgKwotLSAgICAgICAgICAgICAgICAgICAgICAgICcgICAg
ICAgIFRoZSBsb2NhbCB1c2VyIHdpdGggdGhlIFVJRCA2NTUzNCBkb2VzIG5vdCBtYXRjaCB0
aGUgY29uZmlndXJlZCB1c2VyIG5hbWUgIkAwQCIgb2YgdGhlIG5vYm9keSB1c2VyIChpdHMg
bmFtZSBpcyBAMUApLlxuJy5mb3JtYXQobm9ib2R5X3VzZXIsIG5hbWUpICsKLS0gICAgICAg
ICAgICAgICAgICAgICAgICAnICAgICAgICBZb3VyIGJ1aWxkIHdpbGwgcmVzdWx0IGluIGFu
IHVzZXIgdGFibGUgc2V0dXAgdGhhdCBpcyBpbmNvbXBhdGlibGUgd2l0aCB0aGUgbG9jYWwg
c3lzdGVtLicpCistICAgICAgICAgICAgICAgIHdhcm5pbmcoJ1xuJyArCistICAgICAgICAg
ICAgICAgICAgICAgICAgJ1RoZSBsb2NhbCB1c2VyIHdpdGggdGhlIFVJRCA2NTUzNCBkb2Vz
IG5vdCBtYXRjaCB0aGUgY29uZmlndXJlZCB1c2VyIG5hbWUgIkAwQCIgb2YgdGhlIG5vYm9k
eSB1c2VyIChpdHMgbmFtZSBpcyBAMUApLlxuJy5mb3JtYXQobm9ib2R5X3VzZXIsIG5hbWUp
ICsKKy0gICAgICAgICAgICAgICAgICAgICAgICAnWW91ciBidWlsZCB3aWxsIHJlc3VsdCBp
biBhbiB1c2VyIHRhYmxlIHNldHVwIHRoYXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGxv
Y2FsIHN5c3RlbS4nKQogLSAgICAgICAgZW5kaWYKIC1lbmRpZgogLWlkX3Jlc3VsdCA9IHJ1
bl9jb21tYW5kKCdpZCcsICctdScsIG5vYm9keV91c2VyKQogLWlmIGlkX3Jlc3VsdC5yZXR1
cm5jb2RlKCkgPT0gMAogLSAgICAgICAgaWQgPSBpZF9yZXN1bHQuc3Rkb3V0KCkudG9faW50
KCkKIC0gICAgICAgIGlmIGlkICE9IDY1NTM0Ci0tICAgICAgICAgICAgICAgIG1lc3NhZ2Uo
J1dBUk5JTkc6XG4nICsKLS0gICAgICAgICAgICAgICAgICAgICAgICAnICAgICAgICBUaGUg
bG9jYWwgdXNlciB3aXRoIHRoZSBjb25maWd1cmVkIHVzZXIgbmFtZSAiQDBAIiBvZiB0aGUg
bm9ib2R5IHVzZXIgZG9lcyBub3QgaGF2ZSBVSUQgNjU1MzQgKGl0IGhhcyBAMUApLlxuJy5m
b3JtYXQobm9ib2R5X3VzZXIsIGlkKSArCi0tICAgICAgICAgICAgICAgICAgICAgICAgJyAg
ICAgICAgWW91ciBidWlsZCB3aWxsIHJlc3VsdCBpbiBhbiB1c2VyIHRhYmxlIHNldHVwIHRo
YXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGxvY2FsIHN5c3RlbS4nKQorLSAgICAgICAg
ICAgICAgICB3YXJuaW5nKCdcbicgKworLSAgICAgICAgICAgICAgICAgICAgICAgICdUaGUg
bG9jYWwgdXNlciB3aXRoIHRoZSBjb25maWd1cmVkIHVzZXIgbmFtZSAiQDBAIiBvZiB0aGUg
bm9ib2R5IHVzZXIgZG9lcyBub3QgaGF2ZSBVSUQgNjU1MzQgKGl0IGhhcyBAMUApLlxuJy5m
b3JtYXQobm9ib2R5X3VzZXIsIGlkKSArCistICAgICAgICAgICAgICAgICAgICAgICAgJ1lv
dXIgYnVpbGQgd2lsbCByZXN1bHQgaW4gYW4gdXNlciB0YWJsZSBzZXR1cCB0aGF0IGlzIGlu
Y29tcGF0aWJsZSB3aXRoIHRoZSBsb2NhbCBzeXN0ZW0uJykKIC0gICAgICAgIGVuZGlmCiAt
ZW5kaWYKIC0KQEAgLTQxLDIzICs0MSwyMyBAQCBpbmRleCBmNjUxNWU5N2MuLjFiOTQ3YWRh
YyAxMDA2NDQKIC1pZiBnZXRlbnRfcmVzdWx0LnJldHVybmNvZGUoKSA9PSAwCiAtICAgICAg
ICBuYW1lID0gZ2V0ZW50X3Jlc3VsdC5zdGRvdXQoKS5zcGxpdCgnOicpWzBdCiAtICAgICAg
ICBpZiBuYW1lICE9IG5vYm9keV9ncm91cAotLSAgICAgICAgICAgICAgICBtZXNzYWdlKCdX
QVJOSU5HOlxuJyArCi0tICAgICAgICAgICAgICAgICAgICAgICAgJyAgICAgICAgVGhlIGxv
Y2FsIGdyb3VwIHdpdGggdGhlIEdJRCA2NTUzNCBkb2VzIG5vdCBtYXRjaCB0aGUgY29uZmln
dXJlZCBncm91cCBuYW1lICJAMEAiIG9mIHRoZSBub2JvZHkgZ3JvdXAgKGl0cyBuYW1lIGlz
IEAxQCkuXG4nLmZvcm1hdChub2JvZHlfZ3JvdXAsIG5hbWUpICsKLS0gICAgICAgICAgICAg
ICAgICAgICAgICAnICAgICAgICBZb3VyIGJ1aWxkIHdpbGwgcmVzdWx0IGluIGFuIGdyb3Vw
IHRhYmxlIHNldHVwIHRoYXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGxvY2FsIHN5c3Rl
bS4nKQorLSAgICAgICAgICAgICAgICB3YXJuaW5nKCdcbicgKworLSAgICAgICAgICAgICAg
ICAgICAgICAgICdUaGUgbG9jYWwgZ3JvdXAgd2l0aCB0aGUgR0lEIDY1NTM0IGRvZXMgbm90
IG1hdGNoIHRoZSBjb25maWd1cmVkIGdyb3VwIG5hbWUgIkAwQCIgb2YgdGhlIG5vYm9keSBn
cm91cCAoaXRzIG5hbWUgaXMgQDFAKS5cbicuZm9ybWF0KG5vYm9keV9ncm91cCwgbmFtZSkg
KworLSAgICAgICAgICAgICAgICAgICAgICAgICdZb3VyIGJ1aWxkIHdpbGwgcmVzdWx0IGlu
IGFuIGdyb3VwIHRhYmxlIHNldHVwIHRoYXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGxv
Y2FsIHN5c3RlbS4nKQogLSAgICAgICAgZW5kaWYKIC1lbmRpZgogLWlkX3Jlc3VsdCA9IHJ1
bl9jb21tYW5kKCdpZCcsICctZycsIG5vYm9keV9ncm91cCkKIC1pZiBpZF9yZXN1bHQucmV0
dXJuY29kZSgpID09IDAKIC0gICAgICAgIGlkID0gaWRfcmVzdWx0LnN0ZG91dCgpLnRvX2lu
dCgpCiAtICAgICAgICBpZiBpZCAhPSA2NTUzNAotLSAgICAgICAgICAgICAgICBtZXNzYWdl
KCdXQVJOSU5HOlxuJyArCi0tICAgICAgICAgICAgICAgICAgICAgICAgJyAgICAgICAgVGhl
IGxvY2FsIGdyb3VwIHdpdGggdGhlIGNvbmZpZ3VyZWQgZ3JvdXAgbmFtZSAiQDBAIiBvZiB0
aGUgbm9ib2R5IGdyb3VwIGRvZXMgbm90IGhhdmUgVUlEIDY1NTM0IChpdCBoYXMgQDFAKS5c
bicuZm9ybWF0KG5vYm9keV9ncm91cCwgaWQpICsKLS0gICAgICAgICAgICAgICAgICAgICAg
ICAnICAgICAgICBZb3VyIGJ1aWxkIHdpbGwgcmVzdWx0IGluIGFuIGdyb3VwIHRhYmxlIHNl
dHVwIHRoYXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGxvY2FsIHN5c3RlbS4nKQorLSAg
ICAgICAgICAgICAgICB3YXJuaW5nKCdcbicgKworLSAgICAgICAgICAgICAgICAgICAgICAg
ICdUaGUgbG9jYWwgZ3JvdXAgd2l0aCB0aGUgY29uZmlndXJlZCBncm91cCBuYW1lICJAMEAi
IG9mIHRoZSBub2JvZHkgZ3JvdXAgZG9lcyBub3QgaGF2ZSBVSUQgNjU1MzQgKGl0IGhhcyBA
MUApLlxuJy5mb3JtYXQobm9ib2R5X2dyb3VwLCBpZCkgKworLSAgICAgICAgICAgICAgICAg
ICAgICAgICdZb3VyIGJ1aWxkIHdpbGwgcmVzdWx0IGluIGFuIGdyb3VwIHRhYmxlIHNldHVw
IHRoYXQgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIGxvY2FsIHN5c3RlbS4nKQogLSAgICAg
ICAgZW5kaWYKIC1lbmRpZgogIGlmIG5vYm9keV91c2VyICE9IG5vYm9keV9ncm91cCBhbmQg
bm90IChub2JvZHlfdXNlciA9PSAnbm9ib2R5JyBhbmQgbm9ib2R5X2dyb3VwID09ICdub2dy
b3VwJykKLSAgICAgICAgIG1lc3NhZ2UoJ1dBUk5JTkc6XG4nICsKLSAgICAgICAgICAgICAg
ICAgJyAgICAgICAgVGhlIGNvbmZpZ3VyZWQgdXNlciBuYW1lICJAMEAiIGFuZCBncm91cCBu
YW1lICJAMEAiIG9mIHRoZSBub2JvZHkgdXNlci9ncm91cCBhcmUgbm90IGVxdWl2YWxlbnQu
XG4nLmZvcm1hdChub2JvZHlfdXNlciwgbm9ib2R5X2dyb3VwKSArCisgICAgICAgICB3YXJu
aW5nKCdcbicgKworICAgICAgICAgICAgICAgICAnVGhlIGNvbmZpZ3VyZWQgdXNlciBuYW1l
ICJAMEAiIGFuZCBncm91cCBuYW1lICJAMEAiIG9mIHRoZSBub2JvZHkgdXNlci9ncm91cCBh
cmUgbm90IGVxdWl2YWxlbnQuXG4nLmZvcm1hdChub2JvZHlfdXNlciwgbm9ib2R5X2dyb3Vw
KSArCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE0LXNyYy1iYXNpYy1taXNzaW5nLmgtY2hlY2stZm9y
LW1pc3Npbmctc3RybmR1cGEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvMDAwNi1zcmMtYmFzaWMtbWlzc2luZy5oLWNoZWNrLWZvci1taXNzaW5nLXN0cm5k
dXBhLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE0LXNyYy1iYXNpYy1taXNzaW5nLmgtY2hlY2st
Zm9yLW1pc3Npbmctc3RybmR1cGEucGF0Y2gKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvc3lzdGVtZC8wMDA2LXNyYy1iYXNpYy1taXNzaW5nLmgtY2hlY2stZm9yLW1p
c3Npbmctc3RybmR1cGEucGF0Y2gKaW5kZXggOWY2MmNiYi4uMTA3YTc5NCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTQtc3JjLWJhc2ljLW1p
c3NpbmcuaC1jaGVjay1mb3ItbWlzc2luZy1zdHJuZHVwYS5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwNi1zcmMtYmFzaWMtbWlzc2luZy5oLWNo
ZWNrLWZvci1taXNzaW5nLXN0cm5kdXBhLnBhdGNoCkBAIC0xLDExICsxLDExIEBACi1Gcm9t
IDMzYmU5MDUyMzE1Y2M0ZWM4ZTkyOWZhMjM4ZTFmMGNjMDE2MWFkMDcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDAzZmQxOWZjODc1NzMyNzZlMGQzNTkyNjBjOGZlNTkxZjVm
MDIxNmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZl
ci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgotRGF0ZTogV2VkLCAy
OCBGZWIgMjAxOCAyMToxNToyOCAtMDgwMAotU3ViamVjdDogW1BBVENIXSBzcmMvYmFzaWMv
bWlzc2luZy5oOiBjaGVjayBmb3IgbWlzc2luZyBzdHJuZHVwYQorRGF0ZTogRnJpLCAyOSBK
dW4gMjAxOCAxNjozNDo1MCArMDgwMAorU3ViamVjdDogW1BBVENIIDA2LzE5XSBzcmMvYmFz
aWMvbWlzc2luZy5oOiBjaGVjayBmb3IgbWlzc2luZyBzdHJuZHVwYQogCiBpbmNsdWRlIG1p
c3NpbmcuaCAgZm9yIGRlZmluaXRpb24gb2Ygc3RybmR1cGEKIAotVXBzdHJlYW0tU3RhdHVz
OiBQZW5kaW5nCitVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW211c2wgc3BlY2lm
aWNdCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hl
bUBnbWFpbC5jb20mZ3Q7PC9hPgogU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIu
Y29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KQEAgLTEzLDI5ICsxMywy
OSBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVu
QHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogIG1lc29uLmJ1aWxkICAgICAgICAgICAgIHwgIDEg
KwogIHNyYy9iYXNpYy9taXNzaW5nLmggICAgIHwgMTEgKysrKysrKysrKysKICBzcmMvYmFz
aWMvbWtkaXIuYyAgICAgICB8ICAxICsKKyBzcmMvYmFzaWMvcGFnZXIuYyAgICAgICB8ICAx
ICsKICBzcmMvYmFzaWMvcGFyc2UtdXRpbC5jICB8ICAxICsKICBzcmMvYmFzaWMvcHJvY2Zz
LXV0aWwuYyB8ICAxICsKLSBzcmMvc2hhcmVkL3BhZ2VyLmMgICAgICB8ICAxICsKICBzcmMv
c2hhcmVkL3VpZC1yYW5nZS5jICB8ICAxICsKICA3IGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWlu
ZGV4IDRlYWJhYWZlOC4uMTI4MTFiM2YzIDEwMDY0NAoraW5kZXggOGMxNmJjOTc5Li5hNzM0
YTI5NWMgMTAwNjQ0CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBA
IC01MjUsNiArNTI1LDcgQEAgZm9yZWFjaCBpZGVudCA6IFsKLSAgICAgICAgIFsnYnBmJywg
ICAgICAgICAgICAgICAnJycjaW5jbHVkZSAmbHQ7c3lzL3N5c2NhbGwuaCZndDsKK0BAIC01
MDMsNiArNTAzLDcgQEAgZm9yZWFjaCBpZGVudCA6IFsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAjaW5jbHVkZSAmbHQ7dW5pc3RkLmgmZ3Q7JycnXSwKICAgICAgICAg
IFsnZXhwbGljaXRfYnplcm8nICwgICAnJycjaW5jbHVkZSAmbHQ7c3RyaW5nLmgmZ3Q7Jycn
XSwKKyAgICAgICAgIFsncmVhbGxvY2FycmF5JywgICAgICAnJycjaW5jbHVkZSAmbHQ7bWFs
bG9jLmgmZ3Q7JycnXSwKICsgICAgICAgIFsnc3RybmR1cGEnICwgICAgICAgICAnJycjaW5j
bHVkZSAmbHQ7c3RyaW5nLmgmZ3Q7JycnXSwKICBdCiAgCiAgICAgICAgICBoYXZlID0gY2Mu
aGFzX2Z1bmN0aW9uKGlkZW50WzBdLCBwcmVmaXggOiBpZGVudFsxXSwgYXJncyA6ICctRF9H
TlVfU09VUkNFJykKIGRpZmYgLS1naXQgYS9zcmMvYmFzaWMvbWlzc2luZy5oIGIvc3JjL2Jh
c2ljL21pc3NpbmcuaAotaW5kZXggODRkNmQ5MTY3Li4wN2E4YzgzNjQgMTAwNjQ0CitpbmRl
eCAwZTMzYWJiOWYuLjAyMzk3ZjFiNiAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9taXNzaW5n
LmgKICsrKyBiL3NyYy9iYXNpYy9taXNzaW5nLmgKLUBAIC0xMTg3LDYgKzExODcsMTcgQEAg
c3RydWN0IGlucHV0X21hc2sgeworQEAgLTExODQsNiArMTE4NCwxNyBAQCBzdHJ1Y3QgaW5w
dXRfbWFzayB7CiAgdHlwZWRlZiBpbnQzMl90IGtleV9zZXJpYWxfdDsKICAjZW5kaWYKICAK
QEAgLTU0LDIyICs1NCwzNCBAQCBpbmRleCA4NGQ2ZDkxNjcuLjA3YThjODM2NCAxMDA2NDQK
ICAjZGVmaW5lIEtFWUNUTF9KT0lOX1NFU1NJT05fS0VZUklORyAxCiAgI2VuZGlmCiBkaWZm
IC0tZ2l0IGEvc3JjL2Jhc2ljL21rZGlyLmMgYi9zcmMvYmFzaWMvbWtkaXIuYwotaW5kZXgg
ZGU0NzQ2Yzg2Li5kNTE1MThhNWEgMTAwNjQ0CitpbmRleCA2YWIxYjQ0MjIuLjc3YzNlMDg2
MyAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9ta2Rpci5jCiArKysgYi9zcmMvYmFzaWMvbWtk
aXIuYwotQEAgLTMwLDYgKzMwLDcgQEAKLSAjaW5jbHVkZSAicGF0aC11dGlsLmgiCitAQCAt
MTMsNiArMTMsNyBAQAogICNpbmNsdWRlICJzdGF0LXV0aWwuaCIKKyAjaW5jbHVkZSAic3Rk
aW8tdXRpbC5oIgogICNpbmNsdWRlICJ1c2VyLXV0aWwuaCIKICsjaW5jbHVkZSAibWlzc2lu
Zy5oIgogIAotIGludCBta2Rpcl9zYWZlX2ludGVybmFsKGNvbnN0IGNoYXIgKnBhdGgsIG1v
ZGVfdCBtb2RlLCB1aWRfdCB1aWQsIGdpZF90IGdpZCwgYm9vbCBmb2xsb3dfc3ltbGluaywg
bWtkaXJfZnVuY190IF9ta2RpcikgeworIGludCBta2Rpcl9zYWZlX2ludGVybmFsKGNvbnN0
IGNoYXIgKnBhdGgsIG1vZGVfdCBtb2RlLCB1aWRfdCB1aWQsIGdpZF90IGdpZCwgTWtkaXJG
bGFncyBmbGFncywgbWtkaXJfZnVuY190IF9ta2RpcikgewogICAgICAgICAgc3RydWN0IHN0
YXQgc3Q7CitkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL3BhZ2VyLmMgYi9zcmMvYmFzaWMvcGFn
ZXIuYworaW5kZXggZjI0MTI2MTExLi44MjIzYmZmMDIgMTAwNjQ0CistLS0gYS9zcmMvYmFz
aWMvcGFnZXIuYworKysrIGIvc3JjL2Jhc2ljL3BhZ2VyLmMKK0BAIC0yMSw2ICsyMSw3IEBA
CisgI2luY2x1ZGUgInN0cmluZy11dGlsLmgiCisgI2luY2x1ZGUgInN0cnYuaCIKKyAjaW5j
bHVkZSAidGVybWluYWwtdXRpbC5oIgorKyNpbmNsdWRlICJtaXNzaW5nLmgiCisgCisgc3Rh
dGljIHBpZF90IHBhZ2VyX3BpZCA9IDA7CisgCiBkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL3Bh
cnNlLXV0aWwuYyBiL3NyYy9iYXNpYy9wYXJzZS11dGlsLmMKLWluZGV4IDJjMjI3NTNkZS4u
OTc1MzM3MjFkIDEwMDY0NAoraW5kZXggNmJlY2Y4NTg3Li41MjU3NmY1MzYgMTAwNjQ0CiAt
LS0gYS9zcmMvYmFzaWMvcGFyc2UtdXRpbC5jCiArKysgYi9zcmMvYmFzaWMvcGFyc2UtdXRp
bC5jCi1AQCAtMzMsNiArMzMsNyBAQAorQEAgLTE3LDYgKzE3LDcgQEAKICAjaW5jbHVkZSAi
cGFyc2UtdXRpbC5oIgogICNpbmNsdWRlICJwcm9jZXNzLXV0aWwuaCIKICAjaW5jbHVkZSAi
c3RyaW5nLXV0aWwuaDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpAQC03OCwxMCs5MCwxMEBAaW5kZXgyYzIyNzUzZGUuLjk3NTMzNzIxZDEwMDY0NGlu
dHBhcnNlX2Jvb2xlYW4oY29uc3RjaGFyKnYpe2Fzc2VydCh2KTtkaWZmLS1naXRhL3NyYy9i
YXNpYy9wcm9jZnMtdXRpbC5jYi9zcmMvYmFzaWMvcHJvY2ZzLXV0aWwuYy1pbmRleDliYjQy
Y2M3Yi4uMjNiYmQ5ZTY3MTAwNjQ0K2luZGV4YTE1OWUzNDRiLi5lYmM0MjdkNmIxMDA2NDQt
LS1hL3NyYy9iYXNpYy9wcm9jZnMtdXRpbC5jKysrYi9zcmMvYmFzaWMvcHJvY2ZzLXV0aWwu
Yy1AQC05LDYrOSw3QEArQEAtMTEsNisxMSw3QEAjaW5jbHVkZSI+IgpAQCAtNzgsMTAgKzkw
LDEwIEBAIGluZGV4IDJjMjI3NTNkZS4uOTc1MzM3MjFkIDEwMDY0NAogIGludCBwYXJzZV9i
b29sZWFuKGNvbnN0IGNoYXIgKnYpIHsKICAgICAgICAgIGFzc2VydCh2KTsKIGRpZmYgLS1n
aXQgYS9zcmMvYmFzaWMvcHJvY2ZzLXV0aWwuYyBiL3NyYy9iYXNpYy9wcm9jZnMtdXRpbC5j
Ci1pbmRleCA5YmI0MmNjN2IuLjIzYmJkOWU2NyAxMDA2NDQKK2luZGV4IGExNTllMzQ0Yi4u
ZWJjNDI3ZDZiIDEwMDY0NAogLS0tIGEvc3JjL2Jhc2ljL3Byb2Nmcy11dGlsLmMKICsrKyBi
L3NyYy9iYXNpYy9wcm9jZnMtdXRpbC5jCi1AQCAtOSw2ICs5LDcgQEAKK0BAIC0xMSw2ICsx
MSw3IEBACiAgI2luY2x1ZGUgIjwvYT5wcm9jZnMtdXRpbC5oIgogICNpbmNsdWRlICJzdGRp
by11dGlsLmgiCiAgI2luY2x1ZGUgInN0cmluZy11dGlsLmg8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86QEAtODksMjMrMTAxLDExQEBpbmRleDliYjQy
Y2M3Yi4uMjNiYmQ5ZTY3MTAwNjQ0aW50cHJvY2ZzX3Rhc2tzX2dldF9saW1pdCh1aW50NjRf
dCpyZXQpe19jbGVhbnVwX2ZyZWVfY2hhcip2YWx1ZT1OVUxMOy1kaWZmLS1naXRhL3NyYy9z
aGFyZWQvcGFnZXIuY2Ivc3JjL3NoYXJlZC9wYWdlci5jLWluZGV4NzVkYjNjOTg1Li44NGYw
NmJmN2QxMDA2NDQtLS0tYS9zcmMvc2hhcmVkL3BhZ2VyLmMtKysrYi9zcmMvc2hhcmVkL3Bh
Z2VyLmMtQEAtMzksNiszOSw3QEAtI2luY2x1ZGUiPiIKQEAgLTg5LDIzICsxMDEsMTEgQEAg
aW5kZXggOWJiNDJjYzdiLi4yM2JiZDllNjcgMTAwNjQ0CiAgCiAgaW50IHByb2Nmc190YXNr
c19nZXRfbGltaXQodWludDY0X3QgKnJldCkgewogICAgICAgICAgX2NsZWFudXBfZnJlZV8g
Y2hhciAqdmFsdWUgPSBOVUxMOwotZGlmZiAtLWdpdCBhL3NyYy9zaGFyZWQvcGFnZXIuYyBi
L3NyYy9zaGFyZWQvcGFnZXIuYwotaW5kZXggNzVkYjNjOTg1Li44NGYwNmJmN2QgMTAwNjQ0
Ci0tLS0gYS9zcmMvc2hhcmVkL3BhZ2VyLmMKLSsrKyBiL3NyYy9zaGFyZWQvcGFnZXIuYwot
QEAgLTM5LDYgKzM5LDcgQEAKLSAjaW5jbHVkZSAiPC9hPnN0cmluZy11dGlsLmgiCi0gI2lu
Y2x1ZGUgInN0cnYuaCIKLSAjaW5jbHVkZSAidGVybWluYWwtdXRpbC5oIgotKyNpbmNsdWRl
ICJtaXNzaW5nLmgiCi0gCi0gc3RhdGljIHBpZF90IHBhZ2VyX3BpZCA9IDA7Ci0gCiBkaWZm
IC0tZ2l0IGEvc3JjL3NoYXJlZC91aWQtcmFuZ2UuYyBiL3NyYy9zaGFyZWQvdWlkLXJhbmdl
LmMKLWluZGV4IGMzOGI3Y2M5OC4uOGVjNmJmMDhkIDEwMDY0NAoraW5kZXggNDM0Y2U2ZmY0
Li4zNzA5M2FiN2IgMTAwNjQ0CiAtLS0gYS9zcmMvc2hhcmVkL3VpZC1yYW5nZS5jCiArKysg
Yi9zcmMvc2hhcmVkL3VpZC1yYW5nZS5jCi1AQCAtMjUsNiArMjUsNyBAQAorQEAgLTgsNiAr
OCw3IEBACiAgI2luY2x1ZGUgIm1hY3JvLmgiCiAgI2luY2x1ZGUgInVpZC1yYW5nZS5oIgog
ICNpbmNsdWRlICJ1c2VyLXV0aWwuaCIKQEAgLTExNCw1ICsxMTQsNSBAQCBpbmRleCBjMzhi
N2NjOTguLjhlYzZiZjA4ZCAxMDA2NDQKICBzdGF0aWMgYm9vbCB1aWRfcmFuZ2VfaW50ZXJz
ZWN0KFVpZFJhbmdlICpyYW5nZSwgdWlkX3Qgc3RhcnQsIHVpZF90IG5yKSB7CiAgICAgICAg
ICBhc3NlcnQocmFuZ2UpOwogLS0gCi0yLjEzLjAKKzIuMTEuMAogCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxNy1JbmNsdWRlLW5ldGluZXQt
aWZfZXRoZXIuaC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8w
MDA3LUluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXgg
NjglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE3
LUluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwNy1JbmNsdWRlLW5ldGluZXQtaWZfZXRoZXIu
aC5wYXRjaAppbmRleCBhMDljZmRkLi4yZGY4Y2Y5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxNy1JbmNsdWRlLW5ldGluZXQtaWZfZXRoZXIu
aC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwNy1J
bmNsdWRlLW5ldGluZXQtaWZfZXRoZXIuaC5wYXRjaApAQCAtMSwxNCArMSwxNCBAQAotRnJv
bSBmMmIwMTczY2Q5ODA3ODY0ZGIxZWYzYjEwMmFiYWE3NmVmMzdlNTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQorRnJvbSBhYWI5MGQwZGZhOTM0ZDMzODc5ZWFlYzFhODc4ZTkzYjIw
MWQzM2YxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2
ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KLURhdGU6IFdlZCwg
MjggRmViIDIwMTggMjE6MTk6MTIgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAxNy8zMV0gSW5j
bHVkZSBuZXRpbmV0L2lmX2V0aGVyLmgKK0RhdGU6IEZyaSwgMjkgSnVuIDIwMTggMTY6NDQ6
NDMgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSCAwNy8xOV0gSW5jbHVkZSBuZXRpbmV0L2lmX2V0
aGVyLmgKIAogRml4ZXMKIC9wYXRoL3RvL3N5c3RlbWQvcmVjaXBlLXN5c3Jvb3QvdXNyL2lu
Y2x1ZGUvbmV0aW5ldC9pZl9ldGhlci5oOjEwMTo4OiBlcnJvcjogcmVkZWZpbml0aW9uIG9m
ICdzdHJ1Y3QgZXRoaGRyJwogIHN0cnVjdCBldGhoZHIgewogICAgICAgICBefn5+fn4KIAot
VXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCitVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlh
dGUgW211c2wgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgogU2lnbmVkLW9mZi1ieTogQ2hl
biBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWku
Q2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4K
QEAgLTE3LDE0ICsxNywxNSBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5j
b20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogIHNyYy9uZXR3b3JrL25l
dGRldi90dW50YXAuYyAgICAgICAgICAgICAgIHwgMSArCiAgc3JjL25ldHdvcmsvbmV0d29y
a2QtYnJ2bGFuLmMgICAgICAgICAgICAgfCAxICsKICBzcmMvdWRldi9uZXQvZXRodG9vbC11
dGlsLmMgICAgICAgICAgICAgICB8IDEgKworIHNyYy91ZGV2L25ldC9ldGh0b29sLXV0aWwu
aCAgICAgICAgICAgICAgIHwgMSArCiAgc3JjL3VkZXYvdWRldi1idWlsdGluLW5ldF9zZXR1
cF9saW5rLmMgICAgfCAxICsKLSA1IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQor
IDYgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMv
bGlic3lzdGVtZC9zZC1uZXRsaW5rL25ldGxpbmstdHlwZXMuYyBiL3NyYy9saWJzeXN0ZW1k
L3NkLW5ldGxpbmsvbmV0bGluay10eXBlcy5jCi1pbmRleCAwZWU3ZDZmMGQuLmVmNzU4OTNh
NiAxMDA2NDQKK2luZGV4IGM5M2ZlOWNiNC4uMjAxM2QwNmUxIDEwMDY0NAogLS0tIGEvc3Jj
L2xpYnN5c3RlbWQvc2QtbmV0bGluay9uZXRsaW5rLXR5cGVzLmMKICsrKyBiL3NyYy9saWJz
eXN0ZW1kL3NkLW5ldGxpbmsvbmV0bGluay10eXBlcy5jCi1AQCAtMjEsNiArMjEsNyBAQAor
QEAgLTMsNiArMyw3IEBACiAgI2luY2x1ZGUgJmx0O25ldGluZXQvaW4uaCZndDsKICAjaW5j
bHVkZSAmbHQ7c3RkaW50LmgmZ3Q7CiAgI2luY2x1ZGUgJmx0O3N5cy9zb2NrZXQuaCZndDsK
QEAgLTMzLDEwICszNCwxMCBAQCBpbmRleCAwZWU3ZDZmMGQuLmVmNzU4OTNhNiAxMDA2NDQK
ICAjaW5jbHVkZSAmbHQ7bGludXgvcnRuZXRsaW5rLmgmZ3Q7CiAgI2luY2x1ZGUgJmx0O2xp
bnV4L2dlbmV0bGluay5oJmd0OwogZGlmZiAtLWdpdCBhL3NyYy9uZXR3b3JrL25ldGRldi90
dW50YXAuYyBiL3NyYy9uZXR3b3JrL25ldGRldi90dW50YXAuYwotaW5kZXggNGZjOWI2MTBh
Li42MjhjNjFjNTcgMTAwNjQ0CitpbmRleCAyMWZiN2FiMDYuLjBhZmU1MTcwYyAxMDA2NDQK
IC0tLSBhL3NyYy9uZXR3b3JrL25ldGRldi90dW50YXAuYwogKysrIGIvc3JjL25ldHdvcmsv
bmV0ZGV2L3R1bnRhcC5jCi1AQCAtMjAsNiArMjAsNyBAQAorQEAgLTIsNiArMiw3IEBACiAg
CiAgI2luY2x1ZGUgJmx0O2Vycm5vLmgmZ3Q7CiAgI2luY2x1ZGUgJmx0O2ZjbnRsLmgmZ3Q7
CkBAIC00NSwxMCArNDYsMTAgQEAgaW5kZXggNGZjOWI2MTBhLi42MjhjNjFjNTcgMTAwNjQ0
CiAgI2luY2x1ZGUgJmx0O25ldC9pZi5oJmd0OwogICNpbmNsdWRlICZsdDtuZXRpbmV0L2lm
X2V0aGVyLmgmZ3Q7CiBkaWZmIC0tZ2l0IGEvc3JjL25ldHdvcmsvbmV0d29ya2QtYnJ2bGFu
LmMgYi9zcmMvbmV0d29yay9uZXR3b3JrZC1icnZsYW4uYwotaW5kZXggOTlkZDQxNjI5Li45
MDQwN2M5ZDggMTAwNjQ0CitpbmRleCA4ZThhNjE4ZTIuLjUyZDUyM2E2NyAxMDA2NDQKIC0t
LSBhL3NyYy9uZXR3b3JrL25ldHdvcmtkLWJydmxhbi5jCiArKysgYi9zcmMvbmV0d29yay9u
ZXR3b3JrZC1icnZsYW4uYwotQEAgLTE5LDYgKzE5LDcgQEAKK0BAIC00LDYgKzQsNyBAQAog
ICoqKi8KICAKICAjaW5jbHVkZSAmbHQ7bmV0aW5ldC9pbi5oJmd0OwpAQCAtNTcsMjkgKzU4
LDM5IEBAIGluZGV4IDk5ZGQ0MTYyOS4uOTA0MDdjOWQ4IDEwMDY0NAogICNpbmNsdWRlICZs
dDtzdGRib29sLmgmZ3Q7CiAgCiBkaWZmIC0tZ2l0IGEvc3JjL3VkZXYvbmV0L2V0aHRvb2wt
dXRpbC5jIGIvc3JjL3VkZXYvbmV0L2V0aHRvb2wtdXRpbC5jCi1pbmRleCA5YmRhZWY4ZDku
Ljk0OGY4OWNmOCAxMDA2NDQKK2luZGV4IDRiYjQyMTZhYy4uNWY3MzgzNDgzIDEwMDY0NAog
LS0tIGEvc3JjL3VkZXYvbmV0L2V0aHRvb2wtdXRpbC5jCiArKysgYi9zcmMvdWRldi9uZXQv
ZXRodG9vbC11dGlsLmMKLUBAIC0xOCw2ICsxOCw3IEBACi0gICBhbG9uZyB3aXRoIHN5c3Rl
bWQ7IElmIG5vdCwgc2VlIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Imh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8iPiZsdDtodHRwOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvJmd0OzwvYT4uCi0gKioqLworQEAgLTEsNSArMSw2IEBACisgLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IExHUEwtMi4xKyAqLwogIAogKyNpbmNsdWRlICZsdDtuZXRp
bmV0L2lmX2V0aGVyLmgmZ3Q7CiAgI2luY2x1ZGUgJmx0O25ldC9pZi5oJmd0OwogICNpbmNs
dWRlICZsdDtzeXMvaW9jdGwuaCZndDsKICAjaW5jbHVkZSAmbHQ7bGludXgvZXRodG9vbC5o
Jmd0OworZGlmZiAtLWdpdCBhL3NyYy91ZGV2L25ldC9ldGh0b29sLXV0aWwuaCBiL3NyYy91
ZGV2L25ldC9ldGh0b29sLXV0aWwuaAoraW5kZXggMDY0YmY0ZDJiLi5lZTBkNGZiMmEgMTAw
NjQ0CistLS0gYS9zcmMvdWRldi9uZXQvZXRodG9vbC11dGlsLmgKKysrKyBiL3NyYy91ZGV2
L25ldC9ldGh0b29sLXV0aWwuaAorQEAgLTMsNiArMyw3IEBACisgCisgCisgI2luY2x1ZGUg
Jmx0O21hY3JvLmgmZ3Q7CisrI2luY2x1ZGUgJmx0O25ldGluZXQvaWZfZXRoZXIuaCZndDsK
KyAjaW5jbHVkZSAmbHQ7bGludXgvZXRodG9vbC5oJmd0OworIAorICNpbmNsdWRlICJtaXNz
aW5nLmgiCiBkaWZmIC0tZ2l0IGEvc3JjL3VkZXYvdWRldi1idWlsdGluLW5ldF9zZXR1cF9s
aW5rLmMgYi9zcmMvdWRldi91ZGV2LWJ1aWx0aW4tbmV0X3NldHVwX2xpbmsuYwotaW5kZXgg
NDAxNThlMGFmLi5iMjRiM2ZjZTggMTAwNjQ0CitpbmRleCA4YmVkNjM5OWEuLmEzYTk2OTU5
YiAxMDA2NDQKIC0tLSBhL3NyYy91ZGV2L3VkZXYtYnVpbHRpbi1uZXRfc2V0dXBfbGluay5j
CiArKysgYi9zcmMvdWRldi91ZGV2LWJ1aWx0aW4tbmV0X3NldHVwX2xpbmsuYwotQEAgLTE4
LDYgKzE4LDcgQEAKLSAgIGFsb25nIHdpdGggc3lzdGVtZDsgSWYgbm90LCBzZWUgPGEgY2xh
c3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0iaHR0cDovL3d3dy5nbnUub3JnL2xp
Y2Vuc2VzLyI+Jmx0O2h0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8mZ3Q7PC9hPi4KLSAq
KiovCitAQCAtMSw1ICsxLDYgQEAKKyAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTEdQ
TC0yLjErICovCiAgCiArI2luY2x1ZGUgJmx0O25ldGluZXQvaWZfZXRoZXIuaCZndDsKICAj
aW5jbHVkZSAiYWxsb2MtdXRpbC5oIgogICNpbmNsdWRlICJsaW5rLWNvbmZpZy5oIgogICNp
bmNsdWRlICJsb2cuaCIKIC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDctUmV2ZXJ0LXJ1bGVzLXJlbW92
ZS1maXJtd2FyZS1sb2FkaW5nLXJ1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kLzAwMDctUmV2ZXJ0LXJ1bGVzLXJlbW92ZS1maXJtd2FyZS1sb2FkaW5n
LXJ1bGVzLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBiYjEyZDMwLi4w
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA3LVJl
dmVydC1ydWxlcy1yZW1vdmUtZmlybXdhcmUtbG9hZGluZy1ydWxlcy5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDI4ICswLDAgQEAKLUZyb20gMzVkNmQzODRlODNhYzM4MDc3NjAzNjEx
YmI3OTE5NjllZjk1ZmU2OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEpvbmF0
aGFuIExpdSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86
bmV0MTQ3QGdtYWlsLmNvbSI+Jmx0O25ldDE0N0BnbWFpbC5jb20mZ3Q7PC9hPgotRGF0ZTog
VGh1LCAxOSBNYXIgMjAxNSAxNTowMToyOSArMTEwMAotU3ViamVjdDogW1BBVENIIDA3LzMx
XSBSZXZlcnQgInJ1bGVzOiByZW1vdmUgZmlybXdhcmUgbG9hZGluZyBydWxlcyIKLQotVGhp
cyByZXZlcnRzIGNvbW1pdCA3MGU3ZDc1NGRkYjM1NmZiMWEyOTQyYjI2MmY4Y2VlOTY1MGUy
YTE5LgotVXNlcnNwYWNlIGZpcm13YXJlIGxvYWRpbmcgc3VwcG9ydCBpcyBuZWVkZWQgZm9y
IExpbnV4ICZsdDsgMy43LgotCi1VcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW09F
IHNwZWNpZmljXQotCi1TaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBMaXUgPGEgY2xhc3M9Im1v
ei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOm5ldDE0N0BnbWFpbC5jb20iPiZs
dDtuZXQxNDdAZ21haWwuY29tJmd0OzwvYT4KLS0tLQotIHJ1bGVzLzUwLWZpcm13YXJlLnJ1
bGVzIHwgMyArKysKLSAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCi0gY3JlYXRl
IG1vZGUgMTAwNjQ0IHJ1bGVzLzUwLWZpcm13YXJlLnJ1bGVzCi0KLWRpZmYgLS1naXQgYS9y
dWxlcy81MC1maXJtd2FyZS5ydWxlcyBiL3J1bGVzLzUwLWZpcm13YXJlLnJ1bGVzCi1uZXcg
ZmlsZSBtb2RlIDEwMDY0NAotaW5kZXggMDAwMDAwMDAwLi5mMGFlNjg0NTEKLS0tLSAvZGV2
L251bGwKLSsrKyBiL3J1bGVzLzUwLWZpcm13YXJlLnJ1bGVzCi1AQCAtMCwwICsxLDMgQEAK
LSsjIGRvIG5vdCBlZGl0IHRoaXMgZmlsZSwgaXQgd2lsbCBiZSBvdmVyd3JpdHRlbiBvbiB1
cGRhdGUKLSsKLStTVUJTWVNURU09PSJmaXJtd2FyZSIsIEFDVElPTj09ImFkZCIsIFJVTnti
dWlsdGlufT0iZmlybXdhcmUiCi0tLSAKLTIuMTMuMAotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMi1ydWxlcy13YXRjaC1tZXRhZGF0YS1j
aGFuZ2VzLWluLWlkZS1kZXZpY2VzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLzAwMDctcnVsZXMtd2F0Y2gtbWV0YWRhdGEtY2hhbmdlcy1pbi1pZGUtZGV2
aWNlcy5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMi1ydWxlcy13YXRjaC1tZXRhZGF0YS1jaGFu
Z2VzLWluLWlkZS1kZXZpY2VzLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAwNy1ydWxlcy13YXRjaC1tZXRhZGF0YS1jaGFuZ2VzLWluLWlk
ZS1kZXZpY2VzLnBhdGNoCmluZGV4IDcyMDc4NjMuLmE1ZjY1ZTYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDEyLXJ1bGVzLXdhdGNoLW1ldGFk
YXRhLWNoYW5nZXMtaW4taWRlLWRldmljZXMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDctcnVsZXMtd2F0Y2gtbWV0YWRhdGEtY2hhbmdlcy1p
bi1pZGUtZGV2aWNlcy5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20gNDA2YTRjODY5MjMx
NmU4YzdlMTRjNzhmOWE4MDI2ODliZTMwNGE5NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOTMwMmI3MmU1ZTY5NTEyYWFhNzEwNjE5N2IwMGM1NWJhZWIzNWIzYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEhvbmd4dSBKaWEgPGEgY2xhc3M9Im1vei10eHQt
bGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbSI+
Jmx0O2hvbmd4dS5qaWFAd2luZHJpdmVyLmNvbSZndDs8L2E+CiBEYXRlOiBGcmksIDE3IE5v
diAyMDE3IDA5OjQ2OjAwICswODAwCi1TdWJqZWN0OiBbUEFUQ0ggMTIvMzFdIHJ1bGVzOiB3
YXRjaCBtZXRhZGF0YSBjaGFuZ2VzIGluIGlkZSBkZXZpY2VzCitTdWJqZWN0OiBbUEFUQ0gg
Ny85XSBydWxlczogd2F0Y2ggbWV0YWRhdGEgY2hhbmdlcyBpbiBpZGUgZGV2aWNlcwogCiBG
b3JtYXR0aW5nIElERSBzdG9yYWdlIGRvZXMgbm90IHRyaWdnZXIgImNoYW5nZSIgdWV2ZW50
cy4gQXMgYSByZXN1bHQKIGNsaWVudHMgdXNpbmcgdWRldiBBUEkgZG9uJ3QgZ2V0IGFueSB1
cGRhdGVzIGFmdGVyd2FyZHMgYW5kIGdldCBvdXRkYXRlZApAQCAtMzksNSArMzksNSBAQCBp
bmRleCAzNDNmYzA2ZjguLmI1MjM3ZGFjNCAxMDA2NDQKIC1BQ1RJT04hPSJyZW1vdmUiLCBT
VUJTWVNURU09PSJibG9jayIsIEtFUk5FTD09Imxvb3AqfG52bWUqfHNkKnx2ZCp8eHZkKnxw
bWVtKnxtbWNibGsqIiwgT1BUSU9OUys9IndhdGNoIgogK0FDVElPTiE9InJlbW92ZSIsIFNV
QlNZU1RFTT09ImJsb2NrIiwgS0VSTkVMPT0ibG9vcCp8bnZtZSp8c2QqfHZkKnx4dmQqfHBt
ZW0qfG1tY2Jsayp8aGQqIiwgT1BUSU9OUys9IndhdGNoIgogLS0gCi0yLjEzLjAKKzIuMTEu
MAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAx
OS1Eby1ub3QtZW5hYmxlLW5zcy10ZXN0cy1pZi1uc3Mtc3lzdGVtZC1pcy1ub3QtZW5hYmxl
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDgtRG8tbm90
LWVuYWJsZS1uc3MtdGVzdHMtaWYtbnNzLXN5c3RlbWQtaXMtbm90LWVuYWJsZS5wYXRjaApz
aW1pbGFyaXR5IGluZGV4IDYwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAxOS1Eby1ub3QtZW5hYmxlLW5zcy10ZXN0cy1pZi1uc3Mtc3lzdGVt
ZC1pcy1ub3QtZW5hYmxlLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAwOC1Eby1ub3QtZW5hYmxlLW5zcy10ZXN0cy1pZi1uc3Mtc3lzdGVt
ZC1pcy1ub3QtZW5hYmxlLnBhdGNoCmluZGV4IDE2YjIxYTAuLmFiZWNkYzcgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE5LURvLW5vdC1lbmFi
bGUtbnNzLXRlc3RzLWlmLW5zcy1zeXN0ZW1kLWlzLW5vdC1lbmFibGUucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDgtRG8tbm90LWVuYWJsZS1u
c3MtdGVzdHMtaWYtbnNzLXN5c3RlbWQtaXMtbm90LWVuYWJsZS5wYXRjaApAQCAtMSw3ICsx
LDcgQEAKLUZyb20gZjVmMzEzOTE1ZDc4YmM0M2ViOTZlMmFhZmI4Y2UzY2RhMzA0YzI3NyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjZiYTU5NmZkMTMxM2ExNjJjZGMyZWI4
ODE2MWRjZjI0ZDE5ZWRlNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IENoZW4g
UWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNo
ZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+Ci1E
YXRlOiBNb24sIDI2IEZlYiAyMDE4IDE3OjI3OjU2ICswODAwCi1TdWJqZWN0OiBbUEFUQ0gg
MTkvMzFdIERvIG5vdCBlbmFibGUgbnNzIHRlc3RzIGlmIG5zcy1zeXN0ZW1kIGlzIG5vdCBl
bmFibGVkCitEYXRlOiBUaHUsIDI4IEp1biAyMDE4IDEwOjEwOjAyICswODAwCitTdWJqZWN0
OiBbUEFUQ0ggOC85XSBEbyBub3QgZW5hYmxlIG5zcyB0ZXN0cyBpZiBuc3Mtc3lzdGVtZCBp
cyBub3QgZW5hYmxlZAogCiBVcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIApAQCAtMTIsMTgg
KzEyLDE4IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1Fp
LkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMvdGVzdC9tZXNvbi5i
dWlsZCBiL3NyYy90ZXN0L21lc29uLmJ1aWxkCi1pbmRleCAxZGI4YWExMDcuLmRmM2ExZjVj
NSAxMDA2NDQKK2luZGV4IDdkYTdlM2EyMi4uN2I3YzI1N2ZmIDEwMDY0NAogLS0tIGEvc3Jj
L3Rlc3QvbWVzb24uYnVpbGQKICsrKyBiL3NyYy90ZXN0L21lc29uLmJ1aWxkCi1AQCAtNjQ2
LDcgKzY0Niw3IEBAIHRlc3RzICs9IFsKK0BAIC02NDUsNyArNjQ1LDcgQEAgdGVzdHMgKz0g
WwogICAgICAgICAgW1snc3JjL3Rlc3QvdGVzdC1uc3MuYyddLAogICAgICAgICAgIFtdLAog
ICAgICAgICAgIFtsaWJkbF0sCiAtICAgICAgICAgJycsICdtYW51YWwnXSwKICsgICAgICAg
ICAnRU5BQkxFX05TU19TWVNURU1EJywgJ21hbnVhbCddLAotIF0KICAKLSAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyAg
ICAgICAgIFtbJ3NyYy90ZXN0L3Rlc3QtdW1vdW50LmMnLAorICAgICAgICAgICAnc3JjL2Nv
cmUvbW91bnQtc2V0dXAuYycsCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA4LVJldmVydC11ZGV2LXJl
bW92ZS11c2Vyc3BhY2UtZmlybXdhcmUtbG9hZGluZy1zdXBwb3IucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwOC1SZXZlcnQtdWRldi1yZW1vdmUtdXNl
cnNwYWNlLWZpcm13YXJlLWxvYWRpbmctc3VwcG9yLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAxNWQ3ZTAyLi4wMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvc3lzdGVtZC8wMDA4LVJldmVydC11ZGV2LXJlbW92ZS11c2Vyc3BhY2UtZmly
bXdhcmUtbG9hZGluZy1zdXBwb3IucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwzNzcgKzAs
MCBAQAotRnJvbSA1Y2NlNzYyNmYzM2U5MmY2MjRhYzA2YjYxMzEyNTgxM2ZiNDdkNDQ1IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4m
bHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KLURhdGU6IFdlZCwgMjggRmViIDIw
MTggMjE6MDU6MzkgLTA4MDAKLVN1YmplY3Q6IFtQQVRDSCAwOC8zMV0gUmV2ZXJ0ICJ1ZGV2
OiByZW1vdmUgdXNlcnNwYWNlIGZpcm13YXJlIGxvYWRpbmcKLSBzdXBwb3J0IgotCi1UaGlz
IHJldmVydHMgY29tbWl0IGJlMmVhNzIzYjFkMDIzYjNkMzg1ZDNiNzkxZWU0NjA3Y2JmYjIw
Y2EuCi1Vc2Vyc3BhY2UgZmlybXdhcmUgbG9hZGluZyBzdXBwb3J0IGlzIG5lZWRlZCBmb3Ig
TGludXggJmx0OyAzLjcuCi0KLVVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbT0Ug
c3BlY2lmaWNdCi0KLVNpZ25lZC1vZmYtYnk6IEpvbmF0aGFuIExpdSA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86bmV0MTQ3QGdtYWlsLmNvbSI+Jmx0
O25ldDE0N0BnbWFpbC5jb20mZ3Q7PC9hPgotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEg
Y2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdt
YWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci1TaWduZWQtb2ZmLWJ5
OiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0
bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7
PC9hPgotLS0tCi0gUkVBRE1FICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDQgKy0K
LSBUT0RPICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCi0gbWVzb24uYnVp
bGQgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKysrCi0gbWVzb25fb3B0aW9ucy50eHQg
ICAgICAgICAgICAgICAgfCAgIDIgKwotIHJ1bGVzL21lc29uLmJ1aWxkICAgICAgICAgICAg
ICAgIHwgICA0ICsKLSBzcmMvdWRldi9tZXNvbi5idWlsZCAgICAgICAgICAgICB8ICAgNCAr
Ci0gc3JjL3VkZXYvdWRldi1idWlsdGluLWZpcm13YXJlLmMgfCAxNTQgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCi0gc3JjL3VkZXYvdWRldi1idWlsdGluLmMg
ICAgICAgICAgfCAgIDMgKwotIHNyYy91ZGV2L3VkZXYuaCAgICAgICAgICAgICAgICAgIHwg
ICA2ICsrCi0gc3JjL3VkZXYvdWRldmQuYyAgICAgICAgICAgICAgICAgfCAgMTIgKysrCi0g
MTAgZmlsZXMgY2hhbmdlZCwgMTk3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCi0g
Y3JlYXRlIG1vZGUgMTAwNjQ0IHNyYy91ZGV2L3VkZXYtYnVpbHRpbi1maXJtd2FyZS5jCi0K
LWRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKLWluZGV4IDg4MDdlNWNmZS4uYmZkN2Ez
NWRlIDEwMDY0NAotLS0tIGEvUkVBRE1FCi0rKysgYi9SRUFETUUKLUBAIC01OCw4ICs1OCw4
IEBAIFJFUVVJUkVNRU5UUzoKLSAgICAgICAgIExlZ2FjeSBob3RwbHVnIHNsb3dzIGRvd24g
dGhlIHN5c3RlbSBhbmQgY29uZnVzZXMgdWRldjoKLSAgICAgICAgICAgQ09ORklHX1VFVkVO
VF9IRUxQRVJfUEFUSD0iIgotIAotLSAgICAgICAgVXNlcnNwYWNlIGZpcm13YXJlIGxvYWRp
bmcgaXMgbm90IHN1cHBvcnRlZCBhbmQgc2hvdWxkCi0tICAgICAgICBiZSBkaXNhYmxlZCBp
biB0aGUga2VybmVsOgotKyAgICAgICAgVXNlcnNwYWNlIGZpcm13YXJlIGxvYWRpbmcgaXMg
ZGVwcmVjYXRlZCwgd2lsbCBnbyBhd2F5LCBhbmQKLSsgICAgICAgIHNvbWV0aW1lcyBjYXVz
ZXMgcHJvYmxlbXM6Ci0gICAgICAgICAgIENPTkZJR19GV19MT0FERVJfVVNFUl9IRUxQRVI9
bgotIAotICAgICAgICAgU29tZSB1ZGV2IHJ1bGVzIGFuZCB2aXJ0dWFsaXphdGlvbiBkZXRl
Y3Rpb24gcmVsaWVzIG9uIGl0OgotZGlmZiAtLWdpdCBhL1RPRE8gYi9UT0RPCi1pbmRleCBh
NzcwMjhjN2IuLjM5ZTcyZDdlYyAxMDA2NDQKLS0tLSBhL1RPRE8KLSsrKyBiL1RPRE8KLUBA
IC03ODMsNiArNzgzLDcgQEAgRmVhdHVyZXM6Ci0gKiBpbml0aWFsaXplIHRoZSBob3N0bmFt
ZSBmcm9tIHRoZSBmcyBsYWJlbCBvZiAvLCBpZiAvZXRjL2hvc3RuYW1lIGRvZXMgbm90IGV4
aXN0PwotIAotICogdWRldjoKLSsgIC0gcmVtb3ZlIHNyYy91ZGV2L3VkZXYtYnVpbHRpbi1m
aXJtd2FyZS5jIChDT05GSUdfRldfTE9BREVSX1VTRVJfSEVMUEVSPW4pCi0gICAtIG1vdmUg
dG8gTEdQTAotICAgLSBraWxsIHNjc2lfaWQKLSAgIC0gYWRkIHRyaWdnZXIgLS1zdWJzeXN0
ZW0tbWF0Y2g9dXNiL3VzYl9kZXZpY2UgZGV2aWNlCi1kaWZmIC0tZ2l0IGEvbWVzb24uYnVp
bGQgYi9tZXNvbi5idWlsZAotaW5kZXggOTE4MTAxZDZiLi45YzI1MDIyYTQgMTAwNjQ0Ci0t
LS0gYS9tZXNvbi5idWlsZAotKysrIGIvbWVzb24uYnVpbGQKLUBAIC03Miw2ICs3MiwxMiBA
QCBjb25mLnNldDEwKCdIQVZFX1NZU1ZfQ09NUEFUJywgaGF2ZSwKLSAgICAgICAgICAgIGRl
c2NyaXB0aW9uIDogJ1N5c1YgaW5pdCBzY3JpcHRzIGFuZCByY04uZCBsaW5rcyBhcmUgc3Vw
cG9ydGVkJykKLSBtNF9kZWZpbmVzICs9IGhhdmUgPyBbJy1ESEFWRV9TWVNWX0NPTVBBVCdd
IDogW10KLSAKLStmaXJtd2FyZV9wYXRoID0gZ2V0X29wdGlvbignZmlybXdhcmUtcGF0aCcp
Ci0raGF2ZSA9IGZpcm13YXJlX3BhdGggIT0gJycKLStjb25mLnNldDEwKCdIQVZFX0ZJUk1X
QVJFJywgaGF2ZSwKLSsgICAgICAgICAgIGRlc2NyaXB0aW9uIDogJ1VzZXJzcGFjZSBmaXJt
d2FyZSBsb2FkaW5nIGlzIHN1cHBvcnRlZCcpCi0rbTRfZGVmaW5lcyArPSBoYXZlID8gWyct
REhBVkVfRklSTVdBUkUnXSA6IFtdCi0rCi0gIyBqb2luX3BhdGhzIGlnbm9yZSB0aGUgcHJl
Y2VkaW5nIGFyZ3VtZW50cyBpZiBhbiBhYnNvbHV0ZSBjb21wb25lbnQgaXMKLSAjIGVuY291
bnRlcmVkLCBzbyB0aGlzIHNob3VsZCBjYW5vbmljYWxpemUgdmFyaW91cyBwYXRocyB3aGVu
IHRoZXkgYXJlCi0gIyBhYnNvbHV0ZSBvciByZWxhdGl2ZS4KLUBAIC0xNzgsNiArMTg0LDcg
QEAgY29uZi5zZXRfcXVvdGVkKCdTWVNURU1fQ09ORklHX1VOSVRfUEFUSCcsICAgICAgICAg
ICAgICAgICAgICBqb2luX3BhdGhzKHBrZ3N5c2MKLSBjb25mLnNldF9xdW90ZWQoJ1NZU1RF
TV9EQVRBX1VOSVRfUEFUSCcsICAgICAgICAgICAgICAgICAgICAgIHN5c3RlbXVuaXRkaXIp
Ci0gY29uZi5zZXRfcXVvdGVkKCdTWVNURU1fU1lTVklOSVRfUEFUSCcsICAgICAgICAgICAg
ICAgICAgICAgICBzeXN2aW5pdF9wYXRoKQotIGNvbmYuc2V0X3F1b3RlZCgnU1lTVEVNX1NZ
U1ZSQ05EX1BBVEgnLCAgICAgICAgICAgICAgICAgICAgICAgc3lzdnJjbmRfcGF0aCkKLStj
b25mLnNldF9xdW90ZWQoJ0ZJUk1XQVJFX1BBVEgnLCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGZpcm13YXJlX3BhdGgpCi0gY29uZi5zZXRfcXVvdGVkKCdSQ19MT0NBTF9TQ1JJ
UFRfUEFUSF9TVEFSVCcsICAgICAgICAgICAgICAgICBnZXRfb3B0aW9uKCdyYy1sb2NhbCcp
KQotIGNvbmYuc2V0X3F1b3RlZCgnUkNfTE9DQUxfU0NSSVBUX1BBVEhfU1RPUCcsICAgICAg
ICAgICAgICAgICAgZ2V0X29wdGlvbignaGFsdC1sb2NhbCcpKQotIGNvbmYuc2V0X3F1b3Rl
ZCgnVVNFUl9DT05GSUdfVU5JVF9QQVRIJywgICAgICAgICAgICAgICAgICAgICAgam9pbl9w
YXRocyhwa2dzeXNjb25mZGlyLCAndXNlcicpKQotQEAgLTI1OCw2ICsyNjUsNyBAQCBzdWJz
dHMuc2V0KCdTWVNURU1DVEwnLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGpvaW5fcGF0aHMocm9vdGJpbgotIHN1YnN0cy5zZXQoJ1JBTkRPTV9TRUVEJywgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgam9pbl9wYXRocyhyYW5kb21zZWVk
ZGlyLCAncmFuZG9tLXNlZWQnKSkKLSBzdWJzdHMuc2V0KCdTWVNURU1fU1lTVklOSVRfUEFU
SCcsICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN5c3Zpbml0X3BhdGgpCi0gc3Vic3Rz
LnNldCgnU1lTVEVNX1NZU1ZSQ05EX1BBVEgnLCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzeXN2cmNuZF9wYXRoKQotK3N1YnN0cy5zZXQoJ0ZJUk1XQVJFX1BBVEgnLCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZmlybXdhcmVfcGF0aCkKLSBzdWJzdHMuc2V0
KCdSQ19MT0NBTF9TQ1JJUFRfUEFUSF9TVEFSVCcsICAgICAgICAgICAgICAgICAgICAgIGdl
dF9vcHRpb24oJ3JjLWxvY2FsJykpCi0gc3Vic3RzLnNldCgnUkNfTE9DQUxfU0NSSVBUX1BB
VEhfU1RPUCcsICAgICAgICAgICAgICAgICAgICAgICBnZXRfb3B0aW9uKCdoYWx0LWxvY2Fs
JykpCi0gCi1AQCAtMjcxNSw2ICsyNzIzLDcgQEAgc3RhdHVzID0gWwotICAgICAgICAgJ3Jv
b3Rob21lIGRpcmVjdG9yeTogICAgICAgICAgICAgICAgQDBAJy5mb3JtYXQocm9vdGhvbWVk
aXIpLAotICAgICAgICAgJ1N5c1YgaW5pdCBzY3JpcHRzOiAgICAgICAgICAgICAgICAgQDBA
Jy5mb3JtYXQoc3lzdmluaXRfcGF0aCksCi0gICAgICAgICAnU3lzViByYz8uZCBkaXJlY3Rv
cmllczogICAgICAgICAgICBAMEAnLmZvcm1hdChzeXN2cmNuZF9wYXRoKSwKLSsgICAgICAg
ICdmaXJtd2FyZSBwYXRoOiAgICAgICAgICAgICAgICAgICAgIEAwQCcuZm9ybWF0KGZpcm13
YXJlX3BhdGgpLAotICAgICAgICAgJ1BBTSBtb2R1bGVzIGRpcmVjdG9yeTogICAgICAgICAg
ICAgQDBAJy5mb3JtYXQocGFtbGliZGlyKSwKLSAgICAgICAgICdQQU0gY29uZmlndXJhdGlv
biBkaXJlY3Rvcnk6ICAgICAgIEAwQCcuZm9ybWF0KHBhbWNvbmZkaXIpLAotICAgICAgICAg
J1JQTSBtYWNyb3MgZGlyZWN0b3J5OiAgICAgICAgICAgICAgQDBAJy5mb3JtYXQocnBtbWFj
cm9zZGlyKSwKLWRpZmYgLS1naXQgYS9tZXNvbl9vcHRpb25zLnR4dCBiL21lc29uX29wdGlv
bnMudHh0Ci1pbmRleCAwYjI0ZjBlMGYuLjkyZDI1ZmEzNSAxMDA2NDQKLS0tLSBhL21lc29u
X29wdGlvbnMudHh0Ci0rKysgYi9tZXNvbl9vcHRpb25zLnR4dAotQEAgLTEwOCw2ICsxMDgs
OCBAQCBvcHRpb24oJ3RtcGZpbGVzJywgdHlwZSA6ICdib29sZWFuJywKLSAgICAgICAgZGVz
Y3JpcHRpb24gOiAnc3VwcG9ydCBmb3IgdG1wZmlsZXMuZCcpCi0gb3B0aW9uKCdpbXBvcnRk
JywgdHlwZSA6ICdjb21ibycsIGNob2ljZXMgOiBbJ2F1dG8nLCAndHJ1ZScsICdmYWxzZSdd
LAotICAgICAgICBkZXNjcmlwdGlvbiA6ICdpbnN0YWxsIHRoZSBzeXN0ZW1kLWltcG9ydGQg
ZGFlbW9uJykKLStvcHRpb24oJ2Zpcm13YXJlLXBhdGgnLCB0eXBlIDogJ3N0cmluZycsIHZh
bHVlIDogJycsCi0rICAgICAgIGRlc2NyaXB0aW9uIDogJ0Zpcm13YXJlIHNlYXJjaCBwYXRo
JykKLSBvcHRpb24oJ2h3ZGInLCB0eXBlIDogJ2Jvb2xlYW4nLAotICAgICAgICBkZXNjcmlw
dGlvbiA6ICdzdXBwb3J0IGZvciB0aGUgaGFyZHdhcmUgZGF0YWJhc2UnKQotIG9wdGlvbign
cmZraWxsJywgdHlwZSA6ICdib29sZWFuJywKLWRpZmYgLS1naXQgYS9ydWxlcy9tZXNvbi5i
dWlsZCBiL3J1bGVzL21lc29uLmJ1aWxkCi1pbmRleCBlMjUzYjlmNTkuLjVlZWU1ZmJjYSAx
MDA2NDQKLS0tLSBhL3J1bGVzL21lc29uLmJ1aWxkCi0rKysgYi9ydWxlcy9tZXNvbi5idWls
ZAotQEAgLTQxLDYgKzQxLDEwIEBAIHJ1bGVzID0gZmlsZXMoJycnCi0gaW5zdGFsbF9kYXRh
KHJ1bGVzLAotICAgICAgICAgICAgICBpbnN0YWxsX2RpciA6IHVkZXZydWxlc2RpcikKLSAK
LStpZiBjb25mLmdldCgnSEFWRV9GSVJNV0FSRScpID09IDEKLSsgICAgICAgIGluc3RhbGxf
ZGF0YSgnNTAtZmlybXdhcmUucnVsZXMnLCBpbnN0YWxsX2RpciA6IHVkZXZydWxlc2RpcikK
LStlbmRpZgotKwotIGFsbF9ydWxlcyA9IHJ1bGVzCi0gCi0gcnVsZXNfaW4gPSAnJycKLWRp
ZmYgLS1naXQgYS9zcmMvdWRldi9tZXNvbi5idWlsZCBiL3NyYy91ZGV2L21lc29uLmJ1aWxk
Ci1pbmRleCBkZTJmZDJkOWMuLmI2YjBjYTAwNiAxMDA2NDQKLS0tLSBhL3NyYy91ZGV2L21l
c29uLmJ1aWxkCi0rKysgYi9zcmMvdWRldi9tZXNvbi5idWlsZAotQEAgLTY3LDYgKzY3LDEw
IEBAIGlmIGNvbmYuZ2V0KCdIQVZFX0FDTCcpID09IDEKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzZF9sb2dpbl9jXQotIGVuZGlmCi0gCi0raWYgY29uZi5nZXQoJ0hB
VkVfRklSTVdBUkUnKSA9PSAxCi0rICAgICAgICBsaWJ1ZGV2X2NvcmVfc291cmNlcyArPSBb
J3VkZXYtYnVpbHRpbi1maXJtd2FyZS5jJ10KLStlbmRpZgotKwotICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotIAotIGdl
bmVyYXRlX2tleWJvYXJkX2tleXNfbGlzdCA9IGZpbmRfcHJvZ3JhbSgnZ2VuZXJhdGUta2V5
Ym9hcmQta2V5cy1saXN0LnNoJykKLWRpZmYgLS1naXQgYS9zcmMvdWRldi91ZGV2LWJ1aWx0
aW4tZmlybXdhcmUuYyBiL3NyYy91ZGV2L3VkZXYtYnVpbHRpbi1maXJtd2FyZS5jCi1uZXcg
ZmlsZSBtb2RlIDEwMDY0NAotaW5kZXggMDAwMDAwMDAwLi5iZDhjMmZiOTYKLS0tLSAvZGV2
L251bGwKLSsrKyBiL3NyYy91ZGV2L3VkZXYtYnVpbHRpbi1maXJtd2FyZS5jCi1AQCAtMCww
ICsxLDE1NCBAQAotKy8qCi0rICogZmlybXdhcmUgLSBLZXJuZWwgZmlybXdhcmUgbG9hZGVy
Ci0rICoKLSsgKiBDb3B5cmlnaHQgKEMpIDIwMDkgUGl0ZXIgUHVuayA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cGl0ZXJwdW5rQHNsYWNrd2FyZS5j
b20iPiZsdDtwaXRlcnB1bmtAc2xhY2t3YXJlLmNvbSZndDs8L2E+Ci0rICogQ29weXJpZ2h0
IChDKSAyMDA5LTIwMTEgS2F5IFNpZXZlcnMgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMy
Mzk2RSIgaHJlZj0ibWFpbHRvOmtheUB2cmZ5Lm9yZyI+Jmx0O2theUB2cmZ5Lm9yZyZndDs8
L2E+Ci0rICoKLSsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiBy
ZWRpc3RyaWJ1dGUgaXQgYW5kL29yCi0rICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBv
ZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMKLSsgKiBwdWJsaXNoZWQgYnkg
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUK
LSsgKiBMaWNlbnNlLCBvciAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgot
KyAqCi0rICogVGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQg
aXQgd2lsbCBiZSB1c2VmdWwsIGJ1dAotKyAqIFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKLSsgKiBNRVJDSEFOVEFCSUxJVFkg
b3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQotKyAq
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlsczoqCi0rICovCi0rCi0r
I2luY2x1ZGUgJmx0O3VuaXN0ZC5oJmd0OwotKyNpbmNsdWRlICZsdDtzdGRsaWIuaCZndDsK
LSsjaW5jbHVkZSAmbHQ7c3RyaW5nLmgmZ3Q7Ci0rI2luY2x1ZGUgJmx0O3N0ZGlvLmgmZ3Q7
Ci0rI2luY2x1ZGUgJmx0O2dldG9wdC5oJmd0OwotKyNpbmNsdWRlICZsdDtlcnJuby5oJmd0
OwotKyNpbmNsdWRlICZsdDtzdGRib29sLmgmZ3Q7Ci0rI2luY2x1ZGUgJmx0O3N5cy91dHNu
YW1lLmgmZ3Q7Ci0rI2luY2x1ZGUgJmx0O3N5cy9zdGF0LmgmZ3Q7Ci0rCi0rI2luY2x1ZGUg
InVkZXYuaCIKLSsKLStzdGF0aWMgYm9vbCBzZXRfbG9hZGluZyhzdHJ1Y3QgdWRldiAqdWRl
diwgY2hhciAqbG9hZHBhdGgsIGNvbnN0IGNoYXIgKnN0YXRlKSB7Ci0rICAgICAgICBGSUxF
ICpsZGZpbGU7Ci0rCi0rICAgICAgICBsZGZpbGUgPSBmb3Blbihsb2FkcGF0aCwgIndlIik7
Ci0rICAgICAgICBpZiAobGRmaWxlID09IE5VTEwpIHsKLSsgICAgICAgICAgICAgICAgbG9n
X2Vycm9yKCJlcnJvcjogY2FuIG5vdCBvcGVuICclcyciLCBsb2FkcGF0aCk7Ci0rICAgICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsKLSsgICAgICAgIH07Ci0rICAgICAgICBmcHJpbnRm
KGxkZmlsZSwgIiVzXG4iLCBzdGF0ZSk7Ci0rICAgICAgICBmY2xvc2UobGRmaWxlKTsKLSsg
ICAgICAgIHJldHVybiB0cnVlOwotK30KLSsKLStzdGF0aWMgYm9vbCBjb3B5X2Zpcm13YXJl
KHN0cnVjdCB1ZGV2ICp1ZGV2LCBjb25zdCBjaGFyICpzb3VyY2UsIGNvbnN0IGNoYXIgKnRh
cmdldCwgc2l6ZV90IHNpemUpIHsKLSsgICAgICAgIGNoYXIgKmJ1ZjsKLSsgICAgICAgIEZJ
TEUgKmZzb3VyY2UgPSBOVUxMLCAqZnRhcmdldCA9IE5VTEw7Ci0rICAgICAgICBib29sIHJl
dCA9IGZhbHNlOwotKwotKyAgICAgICAgYnVmID0gbWFsbG9jKHNpemUpOwotKyAgICAgICAg
aWYgKGJ1ZiA9PSBOVUxMKSB7Ci0rICAgICAgICAgICAgICAgIGxvZ19lcnJvcigiTm8gbWVt
b3J5IGF2YWlsYWJsZSB0byBsb2FkIGZpcm13YXJlIGZpbGUiKTsKLSsgICAgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwotKyAgICAgICAgfQotKwotKyAgICAgICAgbG9nX2RlYnVnKCJ3
cml0aW5nICclcycgKCV6aSkgdG8gJyVzJyIsIHNvdXJjZSwgc2l6ZSwgdGFyZ2V0KTsKLSsK
LSsgICAgICAgIGZzb3VyY2UgPSBmb3Blbihzb3VyY2UsICJyZSIpOwotKyAgICAgICAgaWYg
KGZzb3VyY2UgPT0gTlVMTCkKLSsgICAgICAgICAgICAgICAgZ290byBleGl0OwotKyAgICAg
ICAgZnRhcmdldCA9IGZvcGVuKHRhcmdldCwgIndlIik7Ci0rICAgICAgICBpZiAoZnRhcmdl
dCA9PSBOVUxMKQotKyAgICAgICAgICAgICAgICBnb3RvIGV4aXQ7Ci0rICAgICAgICBpZiAo
ZnJlYWQoYnVmLCBzaXplLCAxLCBmc291cmNlKSAhPSAxKQotKyAgICAgICAgICAgICAgICBn
b3RvIGV4aXQ7Ci0rICAgICAgICBpZiAoZndyaXRlKGJ1Ziwgc2l6ZSwgMSwgZnRhcmdldCkg
PT0gMSkKLSsgICAgICAgICAgICAgICAgcmV0ID0gdHJ1ZTsKLStleGl0OgotKyAgICAgICAg
aWYgKGZ0YXJnZXQgIT0gTlVMTCkKLSsgICAgICAgICAgICAgICAgZmNsb3NlKGZ0YXJnZXQp
OwotKyAgICAgICAgaWYgKGZzb3VyY2UgIT0gTlVMTCkKLSsgICAgICAgICAgICAgICAgZmNs
b3NlKGZzb3VyY2UpOwotKyAgICAgICAgZnJlZShidWYpOwotKyAgICAgICAgcmV0dXJuIHJl
dDsKLSt9Ci0rCi0rc3RhdGljIGludCBidWlsdGluX2Zpcm13YXJlKHN0cnVjdCB1ZGV2X2Rl
dmljZSAqZGV2LCBpbnQgYXJnYywgY2hhciAqYXJndltdLCBib29sIHRlc3QpIHsKLSsgICAg
ICAgIHN0cnVjdCB1ZGV2ICp1ZGV2ID0gdWRldl9kZXZpY2VfZ2V0X3VkZXYoZGV2KTsKLSsg
ICAgICAgIHN0YXRpYyBjb25zdCBjaGFyICpzZWFyY2hwYXRoW10gPSB7IEZJUk1XQVJFX1BB
VEggfTsKLSsgICAgICAgIGNoYXIgbG9hZHBhdGhbVVRJTF9QQVRIX1NJWkVdOwotKyAgICAg
ICAgY2hhciBkYXRhcGF0aFtVVElMX1BBVEhfU0laRV07Ci0rICAgICAgICBjaGFyIGZ3cGF0
aFtVVElMX1BBVEhfU0laRV07Ci0rICAgICAgICBjb25zdCBjaGFyICpmaXJtd2FyZTsKLSsg
ICAgICAgIEZJTEUgKmZ3ZmlsZSA9IE5VTEw7Ci0rICAgICAgICBzdHJ1Y3QgdXRzbmFtZSBr
ZXJuZWw7Ci0rICAgICAgICBzdHJ1Y3Qgc3RhdCBzdGF0YnVmOwotKyAgICAgICAgdW5zaWdu
ZWQgaW50IGk7Ci0rICAgICAgICBpbnQgcmMgPSBFWElUX1NVQ0NFU1M7Ci0rCi0rICAgICAg
ICBmaXJtd2FyZSA9IHVkZXZfZGV2aWNlX2dldF9wcm9wZXJ0eV92YWx1ZShkZXYsICJGSVJN
V0FSRSIpOwotKyAgICAgICAgaWYgKGZpcm13YXJlID09IE5VTEwpIHsKLSsgICAgICAgICAg
ICAgICAgbG9nX2Vycm9yKCJmaXJtd2FyZSBwYXJhbWV0ZXIgbWlzc2luZyIpOwotKyAgICAg
ICAgICAgICAgICByYyA9IEVYSVRfRkFJTFVSRTsKLSsgICAgICAgICAgICAgICAgZ290byBl
eGl0OwotKyAgICAgICAgfQotKwotKyAgICAgICAgLyogbG9va3VwIGZpcm13YXJlIGZpbGUg
Ki8KLSsgICAgICAgIHVuYW1lKCZhbXA7a2VybmVsKTsKLSsgICAgICAgIGZvciAoaSA9IDA7
IGkgJmx0OyBFTEVNRU5UU09GKHNlYXJjaHBhdGgpOyBpKyspIHsKLSsgICAgICAgICAgICAg
ICAgc3Ryc2NweWwoZndwYXRoLCBzaXplb2YoZndwYXRoKSwgc2VhcmNocGF0aFtpXSwga2Vy
bmVsLnJlbGVhc2UsICIvIiwgZmlybXdhcmUsIE5VTEwpOwotKyAgICAgICAgICAgICAgICBm
d2ZpbGUgPSBmb3Blbihmd3BhdGgsICJyZSIpOwotKyAgICAgICAgICAgICAgICBpZiAoZndm
aWxlICE9IE5VTEwpCi0rICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Ci0rCi0rICAg
ICAgICAgICAgICAgIHN0cnNjcHlsKGZ3cGF0aCwgc2l6ZW9mKGZ3cGF0aCksIHNlYXJjaHBh
dGhbaV0sIGZpcm13YXJlLCBOVUxMKTsKLSsgICAgICAgICAgICAgICAgZndmaWxlID0gZm9w
ZW4oZndwYXRoLCAicmUiKTsKLSsgICAgICAgICAgICAgICAgaWYgKGZ3ZmlsZSAhPSBOVUxM
KQotKyAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwotKyAgICAgICAgfQotKwotKyAg
ICAgICAgc3Ryc2NweWwobG9hZHBhdGgsIHNpemVvZihsb2FkcGF0aCksIHVkZXZfZGV2aWNl
X2dldF9zeXNwYXRoKGRldiksICIvbG9hZGluZyIsIE5VTEwpOwotKwotKyAgICAgICAgaWYg
KGZ3ZmlsZSA9PSBOVUxMKSB7Ci0rICAgICAgICAgICAgICAgIGxvZ19kZWJ1ZygiZGlkIG5v
dCBmaW5kIGZpcm13YXJlIGZpbGUgJyVzJyIsIGZpcm13YXJlKTsKLSsgICAgICAgICAgICAg
ICAgcmMgPSBFWElUX0ZBSUxVUkU7Ci0rICAgICAgICAgICAgICAgIC8qCi0rICAgICAgICAg
ICAgICAgICAqIERvIG5vdCBjYW5jZWwgdGhlIHJlcXVlc3QgaW4gdGhlIGluaXRyZCwgdGhl
IHJlYWwgcm9vdCBtaWdodCBoYXZlCi0rICAgICAgICAgICAgICAgICAqIHRoZSBmaXJtd2Fy
ZSBmaWxlIGFuZCB0aGUgJ2NvbGRwbHVnJyBydW4gaW4gdGhlIHJlYWwgcm9vdCB3aWxsIGZp
bmQKLSsgICAgICAgICAgICAgICAgICogdGhpcyBwZW5kaW5nIHJlcXVlc3QgYW5kIGZ1bGZp
bGwgb3IgY2FuY2VsIGl0LgotKyAgICAgICAgICAgICAgICAgKiAqLwotKyAgICAgICAgICAg
ICAgICBpZiAoIWluX2luaXRyZCgpKQotKyAgICAgICAgICAgICAgICAgICAgICAgIHNldF9s
b2FkaW5nKHVkZXYsIGxvYWRwYXRoLCAiLTEiKTsKLSsgICAgICAgICAgICAgICAgZ290byBl
eGl0OwotKyAgICAgICAgfQotKwotKyAgICAgICAgaWYgKHN0YXQoZndwYXRoLCAmYW1wO3N0
YXRidWYpICZsdDsgMCB8fCBzdGF0YnVmLnN0X3NpemUgPT0gMCkgewotKyAgICAgICAgICAg
ICAgICBpZiAoIWluX2luaXRyZCgpKQotKyAgICAgICAgICAgICAgICAgICAgICAgIHNldF9s
b2FkaW5nKHVkZXYsIGxvYWRwYXRoLCAiLTEiKTsKLSsgICAgICAgICAgICAgICAgcmMgPSBF
WElUX0ZBSUxVUkU7Ci0rICAgICAgICAgICAgICAgIGdvdG8gZXhpdDsKLSsgICAgICAgIH0K
LSsKLSsgICAgICAgIGlmICghc2V0X2xvYWRpbmcodWRldiwgbG9hZHBhdGgsICIxIikpCi0r
ICAgICAgICAgICAgICAgIGdvdG8gZXhpdDsKLSsKLSsgICAgICAgIHN0cnNjcHlsKGRhdGFw
YXRoLCBzaXplb2YoZGF0YXBhdGgpLCB1ZGV2X2RldmljZV9nZXRfc3lzcGF0aChkZXYpLCAi
L2RhdGEiLCBOVUxMKTsKLSsgICAgICAgIGlmICghY29weV9maXJtd2FyZSh1ZGV2LCBmd3Bh
dGgsIGRhdGFwYXRoLCBzdGF0YnVmLnN0X3NpemUpKSB7Ci0rICAgICAgICAgICAgICAgIGxv
Z19lcnJvcigiZXJyb3Igc2VuZGluZyBmaXJtd2FyZSAnJXMnIHRvIGRldmljZSIsIGZpcm13
YXJlKTsKLSsgICAgICAgICAgICAgICAgc2V0X2xvYWRpbmcodWRldiwgbG9hZHBhdGgsICIt
MSIpOwotKyAgICAgICAgICAgICAgICByYyA9IEVYSVRfRkFJTFVSRTsKLSsgICAgICAgICAg
ICAgICAgZ290byBleGl0OwotKyAgICAgICAgfTsKLSsKLSsgICAgICAgIHNldF9sb2FkaW5n
KHVkZXYsIGxvYWRwYXRoLCAiMCIpOwotK2V4aXQ6Ci0rICAgICAgICBpZiAoZndmaWxlKQot
KyAgICAgICAgICAgICAgICBmY2xvc2UoZndmaWxlKTsKLSsgICAgICAgIHJldHVybiByYzsK
LSt9Ci0rCi0rY29uc3Qgc3RydWN0IHVkZXZfYnVpbHRpbiB1ZGV2X2J1aWx0aW5fZmlybXdh
cmUgPSB7Ci0rICAgICAgICAubmFtZSA9ICJmaXJtd2FyZSIsCi0rICAgICAgICAuY21kID0g
YnVpbHRpbl9maXJtd2FyZSwKLSsgICAgICAgIC5oZWxwID0gImtlcm5lbCBmaXJtd2FyZSBs
b2FkZXIiLAotKyAgICAgICAgLnJ1bl9vbmNlID0gdHJ1ZSwKLSt9OwotZGlmZiAtLWdpdCBh
L3NyYy91ZGV2L3VkZXYtYnVpbHRpbi5jIGIvc3JjL3VkZXYvdWRldi1idWlsdGluLmMKLWlu
ZGV4IGRiMmI2ODc0Zi4uY2NkODg2MzhjIDEwMDY0NAotLS0tIGEvc3JjL3VkZXYvdWRldi1i
dWlsdGluLmMKLSsrKyBiL3NyYy91ZGV2L3VkZXYtYnVpbHRpbi5jCi1AQCAtMzIsNiArMzIs
OSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVkZXZfYnVpbHRpbiAqYnVpbHRpbnNbXSA9IHsK
LSAgICAgICAgIFtVREVWX0JVSUxUSU5fQkxLSURdID0gJmFtcDt1ZGV2X2J1aWx0aW5fYmxr
aWQsCi0gI2VuZGlmCi0gICAgICAgICBbVURFVl9CVUlMVElOX0JUUkZTXSA9ICZhbXA7dWRl
dl9idWlsdGluX2J0cmZzLAotKyNpZiBIQVZFX0ZJUk1XQVJFCi0rICAgICAgICBbVURFVl9C
VUlMVElOX0ZJUk1XQVJFXSA9ICZhbXA7dWRldl9idWlsdGluX2Zpcm13YXJlLAotKyNlbmRp
ZgotICAgICAgICAgW1VERVZfQlVJTFRJTl9IV0RCXSA9ICZhbXA7dWRldl9idWlsdGluX2h3
ZGIsCi0gICAgICAgICBbVURFVl9CVUlMVElOX0lOUFVUX0lEXSA9ICZhbXA7dWRldl9idWls
dGluX2lucHV0X2lkLAotICAgICAgICAgW1VERVZfQlVJTFRJTl9LRVlCT0FSRF0gPSAmYW1w
O3VkZXZfYnVpbHRpbl9rZXlib2FyZCwKLWRpZmYgLS1naXQgYS9zcmMvdWRldi91ZGV2Lmgg
Yi9zcmMvdWRldi91ZGV2LmgKLWluZGV4IGVhMTFjMmQyOS4uYzQ3ZGQzZDg4IDEwMDY0NAot
LS0tIGEvc3JjL3VkZXYvdWRldi5oCi0rKysgYi9zcmMvdWRldi91ZGV2LmgKLUBAIC0xNTEs
NiArMTUxLDkgQEAgZW51bSB1ZGV2X2J1aWx0aW5fY21kIHsKLSAgICAgICAgIFVERVZfQlVJ
TFRJTl9CTEtJRCwKLSAjZW5kaWYKLSAgICAgICAgIFVERVZfQlVJTFRJTl9CVFJGUywKLSsj
aWYgSEFWRV9GSVJNV0FSRQotKyAgICAgICAgVURFVl9CVUlMVElOX0ZJUk1XQVJFLAotKyNl
bmRpZgotICAgICAgICAgVURFVl9CVUlMVElOX0hXREIsCi0gICAgICAgICBVREVWX0JVSUxU
SU5fSU5QVVRfSUQsCi0gICAgICAgICBVREVWX0JVSUxUSU5fS0VZQk9BUkQsCi1AQCAtMTc5
LDYgKzE4Miw5IEBAIHN0cnVjdCB1ZGV2X2J1aWx0aW4gewotIGV4dGVybiBjb25zdCBzdHJ1
Y3QgdWRldl9idWlsdGluIHVkZXZfYnVpbHRpbl9ibGtpZDsKLSAjZW5kaWYKLSBleHRlcm4g
Y29uc3Qgc3RydWN0IHVkZXZfYnVpbHRpbiB1ZGV2X2J1aWx0aW5fYnRyZnM7Ci0rI2lmIEhB
VkVfRklSTVdBUkUKLStleHRlcm4gY29uc3Qgc3RydWN0IHVkZXZfYnVpbHRpbiB1ZGV2X2J1
aWx0aW5fZmlybXdhcmU7Ci0rI2VuZGlmCi0gZXh0ZXJuIGNvbnN0IHN0cnVjdCB1ZGV2X2J1
aWx0aW4gdWRldl9idWlsdGluX2h3ZGI7Ci0gZXh0ZXJuIGNvbnN0IHN0cnVjdCB1ZGV2X2J1
aWx0aW4gdWRldl9idWlsdGluX2lucHV0X2lkOwotIGV4dGVybiBjb25zdCBzdHJ1Y3QgdWRl
dl9idWlsdGluIHVkZXZfYnVpbHRpbl9rZXlib2FyZDsKLWRpZmYgLS1naXQgYS9zcmMvdWRl
di91ZGV2ZC5jIGIvc3JjL3VkZXYvdWRldmQuYwotaW5kZXggNWM3NTdkNTEzLi4yZjMzMTMw
MDcgMTAwNjQ0Ci0tLS0gYS9zcmMvdWRldi91ZGV2ZC5jCi0rKysgYi9zcmMvdWRldi91ZGV2
ZC5jCi1AQCAtMTI3LDYgKzEyNyw5IEBAIHN0cnVjdCBldmVudCB7Ci0gICAgICAgICBib29s
IGlzX2Jsb2NrOwotICAgICAgICAgc2RfZXZlbnRfc291cmNlICp0aW1lb3V0X3dhcm5pbmc7
Ci0gICAgICAgICBzZF9ldmVudF9zb3VyY2UgKnRpbWVvdXQ7Ci0rI2lmIEhBVkVfRklSTVdB
UkUKLSsgICAgICAgIGJvb2wgbm9kZWxheTsKLSsjZW5kaWYKLSB9OwotIAotIHN0YXRpYyB2
b2lkIGV2ZW50X3F1ZXVlX2NsZWFudXAoTWFuYWdlciAqbWFuYWdlciwgZW51bSBldmVudF9z
dGF0ZSB0eXBlKTsKLUBAIC02MDksNiArNjEyLDEwIEBAIHN0YXRpYyBpbnQgZXZlbnRfcXVl
dWVfaW5zZXJ0KE1hbmFnZXIgKm1hbmFnZXIsIHN0cnVjdCB1ZGV2X2RldmljZSAqZGV2KSB7
Ci0gICAgICAgICBldmVudC0mZ3Q7ZGV2bnVtID0gdWRldl9kZXZpY2VfZ2V0X2Rldm51bShk
ZXYpOwotICAgICAgICAgZXZlbnQtJmd0O2lzX2Jsb2NrID0gc3RyZXEoImJsb2NrIiwgdWRl
dl9kZXZpY2VfZ2V0X3N1YnN5c3RlbShkZXYpKTsKLSAgICAgICAgIGV2ZW50LSZndDtpZmlu
ZGV4ID0gdWRldl9kZXZpY2VfZ2V0X2lmaW5kZXgoZGV2KTsKLSsjaWYgSEFWRV9GSVJNV0FS
RQotKyAgICAgICAgaWYgKHN0cmVxKHVkZXZfZGV2aWNlX2dldF9zdWJzeXN0ZW0oZGV2KSwg
ImZpcm13YXJlIikpCi0rICAgICAgICAgICAgICAgIGV2ZW50LSZndDtub2RlbGF5ID0gdHJ1
ZTsKLSsjZW5kaWYKLSAKLSAgICAgICAgIGxvZ19kZWJ1Zygic2VxICVsbHUgcXVldWVkLCAn
JXMnICclcyciLCB1ZGV2X2RldmljZV9nZXRfc2VxbnVtKGRldiksCi0gICAgICAgICAgICAg
IHVkZXZfZGV2aWNlX2dldF9hY3Rpb24oZGV2KSwgdWRldl9kZXZpY2VfZ2V0X3N1YnN5c3Rl
bShkZXYpKTsKLUBAIC02OTIsNiArNjk5LDExIEBAIHN0YXRpYyBib29sIGlzX2RldnBhdGhf
YnVzeShNYW5hZ2VyICptYW5hZ2VyLCBzdHJ1Y3QgZXZlbnQgKmV2ZW50KSB7Ci0gICAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Ci0gICAgICAgICAgICAgICAgIH0KLSAK
LSsjaWYgSEFWRV9GSVJNV0FSRQotKyAgICAgICAgICAgICAgICAvKiBhbGxvdyB0byBieXBh
c3MgdGhlIGRlcGVuZGVuY3kgdHJhY2tpbmcgKi8KLSsgICAgICAgICAgICAgICAgaWYgKGV2
ZW50LSZndDtub2RlbGF5KQotKyAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwot
KyNlbmRpZgotICAgICAgICAgICAgICAgICAvKiBwYXJlbnQgZGV2aWNlIGV2ZW50IGZvdW5k
ICovCi0gICAgICAgICAgICAgICAgIGlmIChldmVudC0mZ3Q7ZGV2cGF0aFtjb21tb25dID09
ICcvJykgewotICAgICAgICAgICAgICAgICAgICAgICAgIGV2ZW50LSZndDtkZWxheWluZ19z
ZXFudW0gPSBsb29wX2V2ZW50LSZndDtzZXFudW07Ci0tLSAKLTIuMTMuMAotCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxNS1kb24tdC1mYWls
LWlmLUdMT0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVOQy1pcy1ub3QtLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDgtZG9uLXQtZmFpbC1pZi1HTE9C
X0JSQUNFLWFuZC1HTE9CX0FMVERJUkZVTkMtaXMtbm90LS5wYXRjaApzaW1pbGFyaXR5IGlu
ZGV4IDY3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQv
MDAxNS1kb24tdC1mYWlsLWlmLUdMT0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVOQy1pcy1u
b3QtLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQv
MDAwOC1kb24tdC1mYWlsLWlmLUdMT0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVOQy1pcy1u
b3QtLnBhdGNoCmluZGV4IDQ1MDk0NzYuLmJlZTVmYjYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE1LWRvbi10LWZhaWwtaWYtR0xPQl9CUkFD
RS1hbmQtR0xPQl9BTFRESVJGVU5DLWlzLW5vdC0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDgtZG9uLXQtZmFpbC1pZi1HTE9CX0JSQUNFLWFu
ZC1HTE9CX0FMVERJUkZVTkMtaXMtbm90LS5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20g
YjQ1Y2Y0OTIzYzdlMWYxMTY1OTI1ZTliNGQ3ZGIyMTA4ZmFmMmVhZSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKLUZyb206IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpzeXN0ZW1kQGVzbWlsLmRrIj4mbHQ7
c3lzdGVtZEBlc21pbC5kayZndDs8L2E+Ci1EYXRlOiBNb24sIDIzIE9jdCAyMDE3IDEwOjUw
OjE0IC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMTUvMzFdIGRvbid0IGZhaWwgaWYgR0xPQl9C
UkFDRSBhbmQgR0xPQl9BTFRESVJGVU5DIGlzIG5vdAorRnJvbSA4NDhlNzExZDcxOWE2ZDk4
N2JjN2QxNDE4M2UxYzdiMWYxYzkxYzU2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0
OzwvYT4KK0RhdGU6IEZyaSwgMjkgSnVuIDIwMTggMTc6MTA6MjkgKzA4MDAKK1N1YmplY3Q6
IFtQQVRDSCAwOC8xOV0gZG9uJ3QgZmFpbCBpZiBHTE9CX0JSQUNFIGFuZCBHTE9CX0FMVERJ
UkZVTkMgaXMgbm90CiAgZGVmaW5lZAogCiBJZiB0aGUgc3RhbmRhcmQgbGlicmFyeSBkb2Vz
bid0IHByb3ZpZGUgYnJhY2UKQEAgLTExLDIwICsxMSwyMSBAQCBEb250IHVzZSBHTlUgR0xP
QiBleHRlbnRpb25zIG9uIG5vbi1nbGliYyBzeXN0ZW1zCiAKIENvbmRpdGlvbmFsaXplIHVz
ZSBvZiBHTE9CX0FMVERJUkZVTkMKIAotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCitVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW211c2wgc3BlY2lmaWNdCiAKIFNpZ25lZC1v
ZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7
PC9hPgorU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hl
bkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KIC0tLQotIHNyYy9iYXNpYy9nbG9iLXV0aWwuYyAg
ICAgfCAyMCArKysrKysrKysrKysrKysrKy0tLQotIHNyYy90ZXN0L3Rlc3QtZ2xvYi11dGls
LmMgfCAxNyArKysrKysrKysrKysrKystLQotIHNyYy90bXBmaWxlcy90bXBmaWxlcy5jICAg
fCAgOCArKysrKysrKwotIDMgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgNSBk
ZWxldGlvbnMoLSkKKyBzcmMvYmFzaWMvZ2xvYi11dGlsLmMgICAgIHwgMTMgKysrKysrKysr
KystLQorIHNyYy90ZXN0L3Rlc3QtZ2xvYi11dGlsLmMgfCAxNSArKysrKysrKysrKysrKysK
KyBzcmMvdG1wZmlsZXMvdG1wZmlsZXMuYyAgIHwgMTAgKysrKysrKysrKworIDMgZmlsZXMg
Y2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL3NyYy9iYXNpYy9nbG9iLXV0aWwuYyBiL3NyYy9iYXNpYy9nbG9iLXV0aWwuYwotaW5k
ZXggNmU4MGExZTIzLi4zMTJiYjNmZDEgMTAwNjQ0CitpbmRleCA5ZmFjNjc2ZjIuLjhhZGI5
NTU5ZSAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9nbG9iLXV0aWwuYwogKysrIGIvc3JjL2Jh
c2ljL2dsb2ItdXRpbC5jCi1AQCAtMjgsMTMgKzI4LDE4IEBACitAQCAtMTAsNiArMTAsMTEg
QEAKICAjaW5jbHVkZSAibWFjcm8uaCIKICAjaW5jbHVkZSAicGF0aC11dGlsLmgiCiAgI2lu
Y2x1ZGUgInN0cnYuaCIKQEAgLTM0LDE3ICszNSwxNyBAQCBpbmRleCA2ZTgwYTFlMjMuLjMx
MmJiM2ZkMSAxMDA2NDQKICsjZGVmaW5lIEdMT0JfQlJBQ0UgMAogKyNlbmRpZgogIAorIHN0
YXRpYyB2b2lkIGNsb3NlZGlyX3dyYXBwZXIodm9pZCogdikgeworICAgICAgICAgKHZvaWQp
IGNsb3NlZGlyKHYpOworQEAgLTE4LDYgKzIzLDcgQEAgc3RhdGljIHZvaWQgY2xvc2VkaXJf
d3JhcHBlcih2b2lkKiB2KSB7CiAgaW50IHNhZmVfZ2xvYihjb25zdCBjaGFyICpwYXRoLCBp
bnQgZmxhZ3MsIGdsb2JfdCAqcGdsb2IpIHsKICAgICAgICAgIGludCBrOwogIAogKyNpZmRl
ZiBHTE9CX0FMVERJUkZVTkMKICAgICAgICAgIC8qIFdlIHdhbnQgdG8gc2V0IEdMT0JfQUxU
RElSRlVOQyBvdXJzZWx2ZXMsIGRvbid0IGFsbG93IGl0IHRvIGJlIHNldC4gKi8KICAgICAg
ICAgIGFzc2VydCghKGZsYWdzICZhbXA7IEdMT0JfQUxURElSRlVOQykpOwotLQotICAgICAg
ICAgaWYgKCFwZ2xvYi0mZ3Q7Z2xfY2xvc2VkaXIpCi0gICAgICAgICAgICAgICAgIHBnbG9i
LSZndDtnbF9jbG9zZWRpciA9ICh2b2lkICgqKSh2b2lkICopKSBjbG9zZWRpcjsKLSAgICAg
ICAgIGlmICghcGdsb2ItJmd0O2dsX3JlYWRkaXIpCi1AQCAtNDUsMTAgKzUwLDEzIEBAIGlu
dCBzYWZlX2dsb2IoY29uc3QgY2hhciAqcGF0aCwgaW50IGZsYWdzLCBnbG9iX3QgKnBnbG9i
KSB7CisgCitAQCAtMzEsMTAgKzM3LDEzIEBAIGludCBzYWZlX2dsb2IoY29uc3QgY2hhciAq
cGF0aCwgaW50IGZsYWdzLCBnbG9iX3QgKnBnbG9iKSB7CiAgICAgICAgICAgICAgICAgIHBn
bG9iLSZndDtnbF9sc3RhdCA9IGxzdGF0OwogICAgICAgICAgaWYgKCFwZ2xvYi0mZ3Q7Z2xf
c3RhdCkKICAgICAgICAgICAgICAgICAgcGdsb2ItJmd0O2dsX3N0YXQgPSBzdGF0OwpAQCAt
NjAsMjQgKzYxLDExIEBAIGluZGV4IDZlODBhMWUyMy4uMzEyYmIzZmQxIDEwMDY0NAogICAg
ICAgICAgaWYgKGsgPT0gR0xPQl9OT01BVENIKQogICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT0VOVDsKICAgICAgICAgIGlmIChrID09IEdMT0JfTk9TUEFDRSkKLUBAIC02MSw2ICs2
OSwxMiBAQCBpbnQgc2FmZV9nbG9iKGNvbnN0IGNoYXIgKnBhdGgsIGludCBmbGFncywgZ2xv
Yl90ICpwZ2xvYikgewotICAgICAgICAgcmV0dXJuIDA7Ci0gfQotIAotKy8qIERvbid0IGZh
aWwgaWYgdGhlIHN0YW5kYXJkIGxpYnJhcnkKLSsgKiBkb2Vzbid0IHByb3ZpZGUgYnJhY2Ug
ZXhwYW5zaW9uICovCi0rI2lmbmRlZiBHTE9CX0JSQUNFCi0rI2RlZmluZSBHTE9CX0JSQUNF
IDAKLSsjZW5kaWYKLSsKLSBpbnQgZ2xvYl9leGlzdHMoY29uc3QgY2hhciAqcGF0aCkgewot
ICAgICAgICAgX2NsZWFudXBfZ2xvYmZyZWVfIGdsb2JfdCBnID0ge307Ci0gICAgICAgICBp
bnQgazsKIGRpZmYgLS1naXQgYS9zcmMvdGVzdC90ZXN0LWdsb2ItdXRpbC5jIGIvc3JjL3Rl
c3QvdGVzdC1nbG9iLXV0aWwuYwotaW5kZXggYmQyZjhmY2ZkLi5hMTBjNzc0MjcgMTAwNjQ0
CitpbmRleCBkNzhkNjIyM2MuLmY1OTQzYjI2ZCAxMDA2NDQKIC0tLSBhL3NyYy90ZXN0L3Rl
c3QtZ2xvYi11dGlsLmMKICsrKyBiL3NyYy90ZXN0L3Rlc3QtZ2xvYi11dGlsLmMKLUBAIC0z
MCw2ICszMCwxMSBAQAorQEAgLTEyLDYgKzEyLDExIEBACiAgI2luY2x1ZGUgImdsb2ItdXRp
bC5oIgogICNpbmNsdWRlICJtYWNyby5oIgogICNpbmNsdWRlICJybS1yZi5oPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOkBALTg5LDIzKzc3LDIxQEBp
bmRleGJkMmY4ZmNmZC4uYTEwYzc3NDI3MTAwNjQ0c3RhdGljdm9pZHRlc3RfZ2xvYl9leGlz
dHModm9pZCl7Y2hhcm5hbWVbXT0iPiIKQEAgLTg5LDIzICs3NywyMSBAQCBpbmRleCBiZDJm
OGZjZmQuLmExMGM3NzQyNyAxMDA2NDQKICAKICBzdGF0aWMgdm9pZCB0ZXN0X2dsb2JfZXhp
c3RzKHZvaWQpIHsKICAgICAgICAgIGNoYXIgbmFtZVtdID0gIjwvYT4vdG1wL3Rlc3QtZ2xv
Yl9leGlzdHMuWFhYWFhYIjsKLUBAIC01MiwyNSArNTcsMzMgQEAgc3RhdGljIHZvaWQgdGVz
dF9nbG9iX2V4aXN0cyh2b2lkKSB7Ci0gc3RhdGljIHZvaWQgdGVzdF9nbG9iX25vX2RvdCh2
b2lkKSB7Ci0gICAgICAgICBjaGFyIHRlbXBsYXRlW10gPSAiL3RtcC90ZXN0LWdsb2ItdXRp
bC5YWFhYWFhYPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OjsrQEAtNDAsMTErNDUsMTNAQHN0YXRpY3ZvaWR0ZXN0X2dsb2Jfbm9fZG90KHZvaWQpe2Nv
bnN0Y2hhcipmbjstLStfY2xlYW51cF9nbG9iZnJlZV9nbG9iX3RnPXsrI2lmZGVmR0xPQl9B
TFRESVJGVU5DLS5nbF9jbG9zZWRpcj0odm9pZCgqKSh2b2lkKikpY2xvc2VkaXIsKy5nbF9j
bG9zZWRpcj1jbG9zZWRpcl93cmFwcGVyLC5nbF9yZWFkZGlyPShzdHJ1Y3RkaXJlbnQqKCop
KHZvaWQqKSlyZWFkZGlyX25vX2RvdCwuZ2xfb3BlbmRpcj0odm9pZCooKikoY29uc3RjaGFy
Kikpb3BlbmRpciwuZ2xfbHN0YXQ9bHN0YXQsLmdsX3N0YXQ9c3RhdCwrI2VuZGlmfTstLS1p
bnRyOytpbnRyOytAQC01MiwxMSs1OSwxOUBAc3RhdGljdm9pZHRlc3RfZ2xvYl9ub19kb3Qo
dm9pZCl7YXNzZXJ0X3NlKG1rZHRlbXAodGVtcGxhdGUpKTtmbj1zdHJqb2luYSh0ZW1wbGF0
ZSwiPiI7CitAQCAtNDAsMTEgKzQ1LDEzIEBAIHN0YXRpYyB2b2lkIHRlc3RfZ2xvYl9ub19k
b3Qodm9pZCkgewogICAgICAgICAgY29uc3QgY2hhciAqZm47Ci0tCisgCiAgICAgICAgICBf
Y2xlYW51cF9nbG9iZnJlZV8gZ2xvYl90IGcgPSB7CiArI2lmZGVmIEdMT0JfQUxURElSRlVO
QwotICAgICAgICAgICAgICAgICAuZ2xfY2xvc2VkaXIgPSAodm9pZCAoKikodm9pZCAqKSkg
Y2xvc2VkaXIsCisgICAgICAgICAgICAgICAgIC5nbF9jbG9zZWRpciA9IGNsb3NlZGlyX3dy
YXBwZXIsCiAgICAgICAgICAgICAgICAgIC5nbF9yZWFkZGlyID0gKHN0cnVjdCBkaXJlbnQg
KigqKSh2b2lkICopKSByZWFkZGlyX25vX2RvdCwKICAgICAgICAgICAgICAgICAgLmdsX29w
ZW5kaXIgPSAodm9pZCAqKCopKGNvbnN0IGNoYXIgKikpIG9wZW5kaXIsCiAgICAgICAgICAg
ICAgICAgIC5nbF9sc3RhdCA9IGxzdGF0LAogICAgICAgICAgICAgICAgICAuZ2xfc3RhdCA9
IHN0YXQsCiArI2VuZGlmCiAgICAgICAgICB9OwotLQotICAgICAgICAgaW50IHI7CiAgCisg
ICAgICAgICBpbnQgcjsKK0BAIC01MiwxMSArNTksMTkgQEAgc3RhdGljIHZvaWQgdGVzdF9n
bG9iX25vX2RvdCh2b2lkKSB7CiAgICAgICAgICBhc3NlcnRfc2UobWtkdGVtcCh0ZW1wbGF0
ZSkpOwogIAogICAgICAgICAgZm4gPSBzdHJqb2luYSh0ZW1wbGF0ZSwgIjwvYT4vKjxhIGNs
YXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzopO0BALTEyNiwyNSsx
MTIsMzVAQGluZGV4YmQyZjhmY2ZkLi5hMTBjNzc0MjcxMDA2NDQodm9pZClybV9yZih0ZW1w
bGF0ZSxSRU1PVkVfUk9PVHxSRU1PVkVfUEhZU0lDQUwpO2RpZmYtLWdpdGEvc3JjL3RtcGZp
bGVzL3RtcGZpbGVzLmNiL3NyYy90bXBmaWxlcy90bXBmaWxlcy5jLWluZGV4MzhjYmI3Mzlj
Li44OGNjNTQzZjAxMDA2NDQraW5kZXg5MjdkZTM1ZjMuLjVmMDI4M2RhNTEwMDY0NC0tLWEv
c3JjL3RtcGZpbGVzL3RtcGZpbGVzLmMrKytiL3NyYy90bXBmaWxlcy90bXBmaWxlcy5jLUBA
LTc2LDYrNzYsMTJAQC0jaW5jbHVkZSI+Iik7CkBAIC0xMjYsMjUgKzExMiwzNSBAQCBpbmRl
eCBiZDJmOGZjZmQuLmExMGM3NzQyNyAxMDA2NDQKICAKICAgICAgICAgICh2b2lkKSBybV9y
Zih0ZW1wbGF0ZSwgUkVNT1ZFX1JPT1R8UkVNT1ZFX1BIWVNJQ0FMKTsKIGRpZmYgLS1naXQg
YS9zcmMvdG1wZmlsZXMvdG1wZmlsZXMuYyBiL3NyYy90bXBmaWxlcy90bXBmaWxlcy5jCi1p
bmRleCAzOGNiYjczOWMuLjg4Y2M1NDNmMCAxMDA2NDQKK2luZGV4IDkyN2RlMzVmMy4uNWYw
MjgzZGE1IDEwMDY0NAogLS0tIGEvc3JjL3RtcGZpbGVzL3RtcGZpbGVzLmMKICsrKyBiL3Ny
Yy90bXBmaWxlcy90bXBmaWxlcy5jCi1AQCAtNzYsNiArNzYsMTIgQEAKLSAjaW5jbHVkZSAi
PC9hPnVtYXNrLXV0aWwuaCIKK0BAIC02MCw2ICs2MCwxMiBAQAogICNpbmNsdWRlICJ1c2Vy
LXV0aWwuaCIKICAjaW5jbHVkZSAidXRpbC5oIgorIAogKy8qIERvbid0IGZhaWwgaWYgdGhl
IHN0YW5kYXJkIGxpYnJhcnkKICsgKiBkb2Vzbid0IHByb3ZpZGUgYnJhY2UgZXhwYW5zaW9u
ICovCiArI2lmbmRlZiBHTE9CX0JSQUNFCiArI2RlZmluZSBHTE9CX0JSQUNFIDAKICsjZW5k
aWYKICsKLSAKICAvKiBUaGlzIHJlYWRzIGFsbCBmaWxlcyBsaXN0ZWQgaW4gL2V0Yy90bXBm
aWxlcy5kLz8qLmNvbmYgYW5kIGNyZWF0ZXMKICAgKiB0aGVtIGluIHRoZSBmaWxlIHN5c3Rl
bS4gVGhpcyBpcyBpbnRlbmRlZCB0byBiZSB1c2VkIHRvIGNyZWF0ZQotQEAgLTEyODgsNyAr
MTI5NCw5IEBAIHN0YXRpYyBpbnQgaXRlbV9kb19jaGlsZHJlbihJdGVtICppLCBjb25zdCBj
aGFyICpwYXRoLCBhY3Rpb25fdCBhY3Rpb24pIHsKKyAgKiBwcm9wZXJseSBvd25lZCBkaXJl
Y3RvcmllcyBiZW5lYXRoIC90bXAsIC92YXIvdG1wLCAvcnVuLCB3aGljaCBhcmUKK0BAIC0x
MzQ1LDcgKzEzNTEsOSBAQCBmaW5pc2g6CisgCisgc3RhdGljIGludCBnbG9iX2l0ZW0oSXRl
bSAqaSwgYWN0aW9uX3QgYWN0aW9uKSB7CisgICAgICAgICBfY2xlYW51cF9nbG9iZnJlZV8g
Z2xvYl90IGcgPSB7CisrI2lmZGVmIEdMT0JfQUxURElSRlVOQworICAgICAgICAgICAgICAg
ICAuZ2xfb3BlbmRpciA9ICh2b2lkICooKikoY29uc3QgY2hhciAqKSkgb3BlbmRpcl9ub21v
ZCwKKysjZW5kaWYKKyAgICAgICAgIH07CisgICAgICAgICBpbnQgciA9IDAsIGs7CisgICAg
ICAgICBjaGFyICoqZm47CitAQCAtMTM2NSw3ICsxMzczLDkgQEAgc3RhdGljIGludCBnbG9i
X2l0ZW0oSXRlbSAqaSwgYWN0aW9uX3QgYWN0aW9uKSB7CiAgCi0gc3RhdGljIGludCBnbG9i
X2l0ZW0oSXRlbSAqaSwgYWN0aW9uX3QgYWN0aW9uLCBib29sIHJlY3Vyc2l2ZSkgeworIHN0
YXRpYyBpbnQgZ2xvYl9pdGVtX3JlY3Vyc2l2ZWx5KEl0ZW0gKmksIGZkYWN0aW9uX3QgYWN0
aW9uKSB7CiAgICAgICAgICBfY2xlYW51cF9nbG9iZnJlZV8gZ2xvYl90IGcgPSB7CiArI2lm
ZGVmIEdMT0JfQUxURElSRlVOQwogICAgICAgICAgICAgICAgICAuZ2xfb3BlbmRpciA9ICh2
b2lkICooKikoY29uc3QgY2hhciAqKSkgb3BlbmRpcl9ub21vZCwKQEAgLTE1Myw1ICsxNDks
NSBAQCBpbmRleCAzOGNiYjczOWMuLjg4Y2M1NDNmMCAxMDA2NDQKICAgICAgICAgIGludCBy
ID0gMCwgazsKICAgICAgICAgIGNoYXIgKipmbjsKIC0tIAotMi4xMy4wCisyLjExLjAKIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjgtYWRk
LW1pc3NpbmctRlRXXy1tYWNyb3MtZm9yLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvMDAwOS1hZGQtbWlzc2luZy1GVFdfLW1hY3Jvcy1mb3ItbXVz
bC5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDc5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAyOC1hZGQtbWlzc2luZy1GVFdfLW1hY3Jvcy1mb3It
bXVzbC5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1k
LzAwMDktYWRkLW1pc3NpbmctRlRXXy1tYWNyb3MtZm9yLW11c2wucGF0Y2gKaW5kZXggOWVj
MzEzNy4uOTUyODdjY2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQv
c3lzdGVtZC8wMDI4LWFkZC1taXNzaW5nLUZUV18tbWFjcm9zLWZvci1tdXNsLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA5LWFkZC1taXNzaW5n
LUZUV18tbWFjcm9zLWZvci1tdXNsLnBhdGNoCkBAIC0xLDEzICsxLDEzIEBACi1Gcm9tIDAz
Y2RkMzNiZTYyZGI0YzcyYTdmY2YyMWI2MWQwZDA1NmMyM2M2YTkgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIGFjYzJjMDgwODI3OTU4MDIwMTFlM2M1Zjg2MjZkNjMyMTAwMjE0
ODkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5j
b20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogRGF0ZTogV2VkLCAyOCBG
ZWIgMjAxOCAyMTozNjozMiAtMDgwMAotU3ViamVjdDogW1BBVENIIDI4LzMxXSBhZGQgbWlz
c2luZyBGVFdfIG1hY3JvcyBmb3IgbXVzbAorU3ViamVjdDogW1BBVENIIDA5LzE5XSBhZGQg
bWlzc2luZyBGVFdfIG1hY3JvcyBmb3IgbXVzbAogCiBUaGlzIGlzIHRvIGF2b2lkIGJ1aWxk
IGZhaWx1cmVzIGxpa2UgYmVsb3cgZm9yIG11c2wuCiAKICAgbG9jYWxlLXV0aWwuYzoyOTY6
MjQ6IGVycm9yOiAnRlRXX1NUT1AnIHVuZGVjbGFyZWQKIAotVXBzdHJlYW0tU3RhdHVzOiBQ
ZW5kaW5nCitVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW211c2wgc3BlY2lmaWNd
CiAKIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMy
Mzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5A
d2luZHJpdmVyLmNvbSZndDs8L2E+CiAtLS0KQEAgLTE1LDEwICsxNSwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5j
b20mZ3Q7PC9hPgogIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCiAKIGRpZmYg
LS1naXQgYS9zcmMvYmFzaWMvbWlzc2luZy5oIGIvc3JjL2Jhc2ljL21pc3NpbmcuaAotaW5k
ZXggMWFlZTMzNDZhLi41YjlmZGU2OTIgMTAwNjQ0CitpbmRleCAwMjM5N2YxYjYuLjZkYzc1
MGViYSAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9taXNzaW5nLmgKICsrKyBiL3NyYy9iYXNp
Yy9taXNzaW5nLmgKLUBAIC0yMDcsNiArMjA3LDI2IEBAIHN0cnVjdCBzb2NrYWRkcl92bSB7
CitAQCAtMTg5LDYgKzE4OSwyNiBAQCBzdHJ1Y3Qgc29ja2FkZHJfdm0gewogICNkZWZpbmUg
QlRSRlNfUUdST1VQX0xFVkVMX1NISUZUIDQ4CiAgI2VuZGlmCiAgCkBAIC00Niw1ICs0Niw1
IEBAIGluZGV4IDFhZWUzMzQ2YS4uNWI5ZmRlNjkyIDEwMDY0NAogICNkZWZpbmUgQlRSRlNf
SU9DX1FHUk9VUF9BU1NJR04gX0lPVyhCVFJGU19JT0NUTF9NQUdJQywgNDEsIFwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGJ0cmZzX2lvY3RsX3Fncm91cF9h
c3NpZ25fYXJncykKIC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjktbnNzLW15bWFjaGluZXMtQnVpbGQt
Y29uZGl0aW9uYWxseS13aGVuLUVOQUJMRV9NWUhPUy5wYXRjaCBiL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC8wMDA5LW5zcy1teW1hY2hpbmVzLUJ1aWxkLWNvbmRpdGlv
bmFsbHktd2hlbi1FTkFCTEVfTVlIT1MucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA4NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjktbnNzLW15
bWFjaGluZXMtQnVpbGQtY29uZGl0aW9uYWxseS13aGVuLUVOQUJMRV9NWUhPUy5wYXRjaApy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDktbnNzLW15
bWFjaGluZXMtQnVpbGQtY29uZGl0aW9uYWxseS13aGVuLUVOQUJMRV9NWUhPUy5wYXRjaApp
bmRleCA1MTcyNDlmLi5hNjM1ZmE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAyOS1uc3MtbXltYWNoaW5lcy1CdWlsZC1jb25kaXRpb25hbGx5
LXdoZW4tRU5BQkxFX01ZSE9TLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDA5LW5zcy1teW1hY2hpbmVzLUJ1aWxkLWNvbmRpdGlvbmFsbHktd2hl
bi1FTkFCTEVfTVlIT1MucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDU4NDVjODJkMTAx
NmEzZTNmMjY5NjE4MGQ1YWM5MWI0Njk1MDU0MGEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGY5NjI1YjVmM2ZkNWRhYzNmMzU5MWRiZWViMjRkYzlkNmZkYTc5MGQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxp
bmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtR
aS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogRGF0ZTogVHVlLCAyNyBGZWIgMjAxOCAx
Mjo1NjoyMSArMDgwMAotU3ViamVjdDogW1BBVENIIDI5LzMxXSBuc3MtbXltYWNoaW5lczog
QnVpbGQgY29uZGl0aW9uYWxseSB3aGVuCitTdWJqZWN0OiBbUEFUQ0ggOS85XSBuc3MtbXlt
YWNoaW5lczogQnVpbGQgY29uZGl0aW9uYWxseSB3aGVuCiAgRU5BQkxFX01ZSE9TVE5BTUUg
aXMgc2V0CiAKIEZpeGVzIGJ1aWxkIGZhaWx1cmVzIHdoZW4gYnVpbGRpbmcgd2l0aCAtLWRp
c2FibGUtbXlob3N0bmFtZQpAQCAtMTUsMTAgKzE1LDEwIEBAIFNpZ25lZC1vZmYtYnk6IENo
ZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFp
LkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+
CiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDFiOTQ3YWRh
Yy4uMWVkNGRkZTcyIDEwMDY0NAoraW5kZXggM2JiMDg3ZmVmLi43M2JkNzBiMGIgMTAwNjQ0
CiAtLS0gYS9tZXNvbi5idWlsZAogKysrIGIvbWVzb24uYnVpbGQKLUBAIC0xMzUxLDEyICsx
MzUxLDE1IEBAIHRlc3RfZGxvcGVuID0gZXhlY3V0YWJsZSgKK0BAIC0xMzcxLDEyICsxMzcx
LDE1IEBAIHRlc3RfZGxvcGVuID0gZXhlY3V0YWJsZSgKICAgICAgICAgIGxpbmtfd2l0aCA6
IFtsaWJiYXNpY10sCiAgICAgICAgICBkZXBlbmRlbmNpZXMgOiBbbGliZGxdKQogIApAQCAt
MzksNSArMzksNSBAQCBpbmRleCAxYjk0N2FkYWMuLjFlZDRkZGU3MiAxMDA2NDQKICAgICAg
ICAgICAgICAgICAgbW9kdWxlID0gdHVwbGVbMF0KICAKIC0tIAotMi4xMy4wCisyLjExLjAK
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMDkt
cmVtb3ZlLWR1cGxpY2F0ZS1pbmNsdWRlLXVjaGFyLmgucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
Y29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwOS1yZW1vdmUtZHVwbGljYXRlLWluY2x1ZGUtdWNo
YXIuaC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMWIxNDM2OS4uMDAw
MDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAwOS1yZW1v
dmUtZHVwbGljYXRlLWluY2x1ZGUtdWNoYXIuaC5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDQxICswLDAgQEAKLUZyb20gZmZkZjljYjZiYTBkOTMyYjgxOTMzZDgyNGYyM2E4NzhjMzEz
YThkNCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxhIGNsYXNz
PSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5j
b20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgotRGF0ZTogTW9uLCAyMiBGZWIg
MjAxNiAwNTo1OTowMSArMDAwMAotU3ViamVjdDogW1BBVENIIDA5LzMxXSByZW1vdmUgZHVw
bGljYXRlIGluY2x1ZGUgdWNoYXIuaAotCi1taXNzaW5nLmggYWxyZWFkeSBpbmNsdWRlcyBp
dAotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1A
Z21haWwuY29tJmd0OzwvYT4KLVVwc3RyZWFtLVN0YXR1czogUGVuZGluZwotLS0tCi0gc3Jj
L2Jhc2ljL2VzY2FwZS5oIHwgMSAtCi0gc3JjL2Jhc2ljL3V0ZjguaCAgIHwgMSAtCi0gMiBm
aWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2Jhc2lj
L2VzY2FwZS5oIGIvc3JjL2Jhc2ljL2VzY2FwZS5oCi1pbmRleCBkZTg5ZjQzYTguLjk5MjFj
Y2JiZCAxMDA2NDQKLS0tLSBhL3NyYy9iYXNpYy9lc2NhcGUuaAotKysrIGIvc3JjL2Jhc2lj
L2VzY2FwZS5oCi1AQCAtMjQsNyArMjQsNiBAQAotICNpbmNsdWRlICZsdDtzdGRkZWYuaCZn
dDsKLSAjaW5jbHVkZSAmbHQ7c3RkaW50LmgmZ3Q7Ci0gI2luY2x1ZGUgJmx0O3N5cy90eXBl
cy5oJmd0OwotLSNpbmNsdWRlICZsdDt1Y2hhci5oJmd0OwotIAotICNpbmNsdWRlICJzdHJp
bmctdXRpbC5oIgotICNpbmNsdWRlICJtaXNzaW5nLmgiCi1kaWZmIC0tZ2l0IGEvc3JjL2Jh
c2ljL3V0ZjguaCBiL3NyYy9iYXNpYy91dGY4LmgKLWluZGV4IGIwYTc0ODVhZS4uZmEwNmQy
OTA2IDEwMDY0NAotLS0tIGEvc3JjL2Jhc2ljL3V0ZjguaAotKysrIGIvc3JjL2Jhc2ljL3V0
ZjguaAotQEAgLTIzLDcgKzIzLDYgQEAKLSAjaW5jbHVkZSAmbHQ7c3RkYm9vbC5oJmd0Owot
ICNpbmNsdWRlICZsdDtzdGRkZWYuaCZndDsKLSAjaW5jbHVkZSAmbHQ7c3RkaW50LmgmZ3Q7
Ci0tI2luY2x1ZGUgJmx0O3VjaGFyLmgmZ3Q7Ci0gCi0gI2luY2x1ZGUgIm1hY3JvLmgiCi0g
I2luY2x1ZGUgIm1pc3NpbmcuaCIKLS0tIAotMi4xMy4wCi0KZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDEwLWNoZWNrLWZvci11Y2hhci5oLWlu
LW1lc29uLmJ1aWxkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1k
LzAwMTAtY2hlY2stZm9yLXVjaGFyLmgtaW4tbWVzb24uYnVpbGQucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDlhNDRiNTQuLjAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTAtY2hlY2stZm9yLXVjaGFyLmgtaW4tbWVz
b24uYnVpbGQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0NSArMCwwIEBACi1Gcm9tIGVh
NGNhYWExYzZhNmRjNjgyYmIwNDU0OGFiMDVjNWM3M2QwYjQ1ZDYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdp
bmRyaXZlci5jb20mZ3Q7PC9hPgotRGF0ZTogTW9uLCAyNiBGZWIgMjAxOCAxNTozNDo1MiAr
MDgwMAotU3ViamVjdDogW1BBVENIIDEwLzMxXSBjaGVjayBmb3IgdWNoYXIuaCBpbiBtZXNv
bi5idWlsZAotCi1Vc2UgI2lmIEhBVkVfVUNIQVJfSCB0byBpbmNsdWRlIHVjaGFyLmggY29u
ZGl0aW9uYWxseS4KLQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10
eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0
O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci1VcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcK
LQotU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3
aW5kcml2ZXIuY29tJmd0OzwvYT4KLS0tLQotIG1lc29uLmJ1aWxkICAgICAgICAgfCAxICsK
LSBzcmMvYmFzaWMvbWlzc2luZy5oIHwgMiArKwotIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1p
bmRleCA5YzI1MDIyYTQuLjk0YTE2NzEyYiAxMDA2NDQKLS0tLSBhL21lc29uLmJ1aWxkCi0r
KysgYi9tZXNvbi5idWlsZAotQEAgLTYyMyw2ICs2MjMsNyBAQCBmb3JlYWNoIGhlYWRlciA6
IFsnY3J5cHQuaCcsCi0gICAgICAgICAgICAgICAgICAgJ3N5cy9hdXh2LmgnLAotICAgICAg
ICAgICAgICAgICAgICd2YWxncmluZC9tZW1jaGVjay5oJywKLSAgICAgICAgICAgICAgICAg
ICAndmFsZ3JpbmQvdmFsZ3JpbmQuaCcsCi0rICAgICAgICAgICAgICAgICAgJ3VjaGFyLmgn
LAotICAgICAgICAgICAgICAgICAgXQotIAotICAgICAgICAgY29uZi5zZXQxMCgnSEFWRV8n
ICsgaGVhZGVyLnVuZGVyc2NvcmlmeSgpLnRvX3VwcGVyKCksCi1kaWZmIC0tZ2l0IGEvc3Jj
L2Jhc2ljL21pc3NpbmcuaCBiL3NyYy9iYXNpYy9taXNzaW5nLmgKLWluZGV4IDM5YzFmYjcw
MC4uODRkNmQ5MTY3IDEwMDY0NAotLS0tIGEvc3JjL2Jhc2ljL21pc3NpbmcuaAotKysrIGIv
c3JjL2Jhc2ljL21pc3NpbmcuaAotQEAgLTM4LDcgKzM4LDkgQEAKLSAjaW5jbHVkZSAmbHQ7
c3lzL3Jlc291cmNlLmgmZ3Q7Ci0gI2luY2x1ZGUgJmx0O3N5cy9zb2NrZXQuaCZndDsKLSAj
aW5jbHVkZSAmbHQ7c3lzL3N5c2NhbGwuaCZndDsKLSsjaWYgSEFWRV9VQ0hBUl9ICi0gI2lu
Y2x1ZGUgJmx0O3VjaGFyLmgmZ3Q7Ci0rI2VuZGlmCi0gI2luY2x1ZGUgJmx0O3VuaXN0ZC5o
Jmd0OwotIAotICNpZiBIQVZFX0FVRElUCi0tLSAKLTIuMTMuMAotCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMS1zb2NrZXQtdXRpbC1kb24t
dC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBwb3J0LUlETi5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDEwLXNvY2tldC11dGlsLWRvbi10LWZhaWwtaWYt
bGliYy1kb2Vzbi10LXN1cHBvcnQtSUROLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggNjglCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDExLXNvY2tl
dC11dGlsLWRvbi10LWZhaWwtaWYtbGliYy1kb2Vzbi10LXN1cHBvcnQtSUROLnBhdGNoCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMC1zb2NrZXQt
dXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBwb3J0LUlETi5wYXRjaAppbmRl
eCBiMDkyM2QxLi4xNjU0Nzk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAxMS1zb2NrZXQtdXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24t
dC1zdXBwb3J0LUlETi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvMDAxMC1zb2NrZXQtdXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBw
b3J0LUlETi5wYXRjaApAQCAtMSwyMyArMSwyMiBAQAotRnJvbSA2MGRkNDExZTk3NTZmYzJi
MTRjMGUwNjFhZDgwMzc4MmI0YWVlODc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBhMGJkNTg3MzAwNzQ0ZGJiOGU5Y2ZiYjA0MzIzMzY3MGNlNzgxYzk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hl
bkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KLURhdGU6IE1vbiwgMjYgRmViIDIwMTggMTU6NDY6
MDUgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSCAxMS8zMV0gc29ja2V0LXV0aWw6IGRvbid0IGZh
aWwgaWYgbGliYyBkb2Vzbid0IHN1cHBvcnQgSUROCitEYXRlOiBNb24sIDIgSnVsIDIwMTgg
MTM6MjI6NDEgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSCAxMC8xOV0gc29ja2V0LXV0aWw6IGRv
bid0IGZhaWwgaWYgbGliYyBkb2Vzbid0IHN1cHBvcnQgSUROCiAKLVVwc3RyZWFtLVN0YXR1
czogUGVuZGluZworVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFttdXNsIHNwZWNp
ZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86c3lzdGVtZEBlc21pbC5kayI+
Jmx0O3N5c3RlbWRAZXNtaWwuZGsmZ3Q7PC9hPgogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWog
PGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOnJhai5raGVt
QGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWlsLmNvbSZndDs8L2E+Ci0KIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNv
bSZndDs8L2E+CiAtLS0KICBzcmMvYmFzaWMvc29ja2V0LXV0aWwuYyB8IDEwICsrKysrKysr
KysKICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQogCiBkaWZmIC0tZ2l0IGEv
c3JjL2Jhc2ljL3NvY2tldC11dGlsLmMgYi9zcmMvYmFzaWMvc29ja2V0LXV0aWwuYwotaW5k
ZXggMmM3MGNhZGUxLi42N2FlZGFkZDQgMTAwNjQ0CitpbmRleCBhOTEzMTAyZTEuLjBkMDE1
NDgwNSAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9zb2NrZXQtdXRpbC5jCiArKysgYi9zcmMv
YmFzaWMvc29ja2V0LXV0aWwuYwotQEAgLTUwLDYgKzUwLDE2IEBACitAQCAtMzIsNiArMzIs
MTYgQEAKICAjaW5jbHVkZSAidXRmOC5oIgogICNpbmNsdWRlICJ1dGlsLmgiCiAgCkBAIC0z
Miw4ICszMSw4IEBAIGluZGV4IDJjNzBjYWRlMS4uNjdhZWRhZGQ0IDEwMDY0NAogKyNlbmRp
ZgogKwogICNpZiBFTkFCTEVfSUROCi0gIyAgZGVmaW5lIElETl9GTEFHUyAoTklfSUROfE5J
X0lETl9VU0VfU1REM19BU0NJSV9SVUxFUykKKyAjICBkZWZpbmUgSUROX0ZMQUdTIE5JX0lE
TgogICNlbHNlCiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE2LXNyYy1iYXNpYy1taXNzaW5nLmgtY2hl
Y2stZm9yLW1pc3NpbmctX19jb21wYXJfZm5fdC0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMS1zcmMtYmFzaWMtbWlzc2luZy5oLWNoZWNrLWZvci1t
aXNzaW5nLV9fY29tcGFyX2ZuX3QtLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggNjMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE2LXNyYy1iYXNp
Yy1taXNzaW5nLmgtY2hlY2stZm9yLW1pc3NpbmctX19jb21wYXJfZm5fdC0ucGF0Y2gKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDExLXNyYy1iYXNp
Yy1taXNzaW5nLmgtY2hlY2stZm9yLW1pc3NpbmctX19jb21wYXJfZm5fdC0ucGF0Y2gKaW5k
ZXggNTMwMzdlYS4uMWEyMmZmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lz
dGVtZC9zeXN0ZW1kLzAwMTYtc3JjLWJhc2ljLW1pc3NpbmcuaC1jaGVjay1mb3ItbWlzc2lu
Zy1fX2NvbXBhcl9mbl90LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1k
L3N5c3RlbWQvMDAxMS1zcmMtYmFzaWMtbWlzc2luZy5oLWNoZWNrLWZvci1taXNzaW5nLV9f
Y29tcGFyX2ZuX3QtLnBhdGNoCkBAIC0xLDI0ICsxLDI1IEBACi1Gcm9tIGVmYzU3ODU2Zjk2
MWMxZjNiZjAxNmM1MTFjNTNkOTkwZGI4YWJkZmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
Ci1Gcm9tOiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86c3lzdGVtZEBlc21pbC5kayI+Jmx0O3N5c3RlbWRAZXNt
aWwuZGsmZ3Q7PC9hPgotRGF0ZTogTW9uLCAyMyBPY3QgMjAxNyAxMTozMTowMyAtMDcwMAot
U3ViamVjdDogW1BBVENIIDE2LzMxXSBzcmMvYmFzaWMvbWlzc2luZy5oOiBjaGVjayBmb3Ig
bWlzc2luZyBfX2NvbXBhcl9mbl90CitGcm9tIDA0NWYyMDVmZDIxZTVlMzgwZWRmODEzZGUw
NGZjZmJmNWE0ODcyMTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBDaGVuIFFp
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVu
QHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgorRGF0
ZTogTW9uLCAyIEp1bCAyMDE4IDEzOjI4OjI1ICswODAwCitTdWJqZWN0OiBbUEFUQ0ggMTEv
MTldIHNyYy9iYXNpYy9taXNzaW5nLmg6IGNoZWNrIGZvciBtaXNzaW5nIF9fY29tcGFyX2Zu
X3QKICB0eXBlZGVmCiAKIGluY2x1ZGUgbWlzc2luZy5oIGZvciBtaXNzaW5nIF9fY29tcGFy
X2ZuX3QKIAotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCitVcHN0cmVhbS1TdGF0dXM6IElu
YXBwcm9wcmlhdGUgW211c2wgc3BlY2lmaWNdCiAKIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hl
bUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgorU2lnbmVkLW9m
Zi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Jmd0OzwvYT4KIC0tLQogIHNyYy9iYXNpYy9taXNzaW5nLmggfCA1ICsrKysrCiAgc3JjL2Jh
c2ljL3N0cmJ1Zi5jICB8IDEgKwogIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
CiAKIGRpZmYgLS1naXQgYS9zcmMvYmFzaWMvbWlzc2luZy5oIGIvc3JjL2Jhc2ljL21pc3Np
bmcuaAotaW5kZXggMDdhOGM4MzY0Li4xYWVlMzM0NmEgMTAwNjQ0CitpbmRleCA2ZGM3NTBl
YmEuLmNkMWNjMTA5ZiAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9taXNzaW5nLmgKICsrKyBi
L3NyYy9iYXNpYy9taXNzaW5nLmgKLUBAIC0xMTYyLDYgKzExNjIsMTEgQEAgc3RydWN0IGlu
cHV0X21hc2sgeworQEAgLTExNzksNiArMTE3OSwxMSBAQCBzdHJ1Y3QgaW5wdXRfbWFzayB7
CiAgI2RlZmluZSBSRU5BTUVfTk9SRVBMQUNFICgxICZsdDsmbHQ7IDApCiAgI2VuZGlmCiAg
CkBAIC0zMSwxNyArMzIsMTcgQEAgaW5kZXggMDdhOGM4MzY0Li4xYWVlMzM0NmEgMTAwNjQ0
CiAgI2RlZmluZSBLQ01QX0ZJTEUgMAogICNlbmRpZgogZGlmZiAtLWdpdCBhL3NyYy9iYXNp
Yy9zdHJidWYuYyBiL3NyYy9iYXNpYy9zdHJidWYuYwotaW5kZXggOGJlZmZmYTY2Li5iY2I4
NjBmOTUgMTAwNjQ0CitpbmRleCBlMmVkNzc2YTAuLjRkM2ViZWM0YyAxMDA2NDQKIC0tLSBh
L3NyYy9iYXNpYy9zdHJidWYuYwogKysrIGIvc3JjL2Jhc2ljL3N0cmJ1Zi5jCi1AQCAtMjQs
NiArMjQsNyBAQAotIAorQEAgLTcsNiArNyw3IEBACiAgI2luY2x1ZGUgImFsbG9jLXV0aWwu
aCIKICAjaW5jbHVkZSAic3RyYnVmLmgiCisgI2luY2x1ZGUgInV0aWwuaCIKICsjaW5jbHVk
ZSAibWlzc2luZy5oIgogIAogIC8qCiAgICogU3RyYnVmIHN0b3JlcyBnaXZlbiBzdHJpbmdz
IGluIGEgc2luZ2xlIGNvbnRpbnVvdXMgYWxsb2NhdGVkIG1lbW9yeQogLS0gCi0yLjEzLjAK
KzIuMTEuMAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3Rl
bWQvMDAzMC1maXgtbWlzc2luZy1vZi1fX3JlZ2lzdGVyX2F0Zm9yay1mb3Itbm9uLWdsaWJj
LWJ1aWxkLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTIt
Zml4LW1pc3Npbmctb2YtX19yZWdpc3Rlcl9hdGZvcmstZm9yLW5vbi1nbGliYy1idWlsZC5w
YXRjaApzaW1pbGFyaXR5IGluZGV4IDc1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvMDAzMC1maXgtbWlzc2luZy1vZi1fX3JlZ2lzdGVyX2F0Zm9y
ay1mb3Itbm9uLWdsaWJjLWJ1aWxkLnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMi1maXgtbWlzc2luZy1vZi1fX3JlZ2lzdGVyX2F0Zm9y
ay1mb3Itbm9uLWdsaWJjLWJ1aWxkLnBhdGNoCmluZGV4IDdmMGI0YmYuLmQ0MWJjNGEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDMwLWZpeC1t
aXNzaW5nLW9mLV9fcmVnaXN0ZXJfYXRmb3JrLWZvci1ub24tZ2xpYmMtYnVpbGQucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTItZml4LW1pc3Np
bmctb2YtX19yZWdpc3Rlcl9hdGZvcmstZm9yLW5vbi1nbGliYy1idWlsZC5wYXRjaApAQCAt
MSw5ICsxLDkgQEAKLUZyb20gYjdlYWNkZjAzODhmOTMwZmM1MjcxYmRlY2ZhNDY2MTJjNzFk
ZDY1YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWZhZGY4MDVjYjM5MWUzYmNi
ZDlhMDI4NmE5ZTRiN2FkYjllNzQyNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8
L2E+Ci1EYXRlOiBUdWUsIDI3IEZlYiAyMDE4IDEzOjI3OjQ3ICswODAwCi1TdWJqZWN0OiBb
UEFUQ0ggMzAvMzFdIGZpeCBtaXNzaW5nIG9mIF9fcmVnaXN0ZXJfYXRmb3JrIGZvciBub24t
Z2xpYmMgYnVpbGRzCitEYXRlOiBNb24sIDIgSnVsIDIwMTggMTM6MzQ6MDkgKzA4MDAKK1N1
YmplY3Q6IFtQQVRDSCAxMi8xOV0gZml4IG1pc3Npbmcgb2YgX19yZWdpc3Rlcl9hdGZvcmsg
Zm9yIG5vbi1nbGliYyBidWlsZHMKIAotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCitVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW211c2wgc3BlY2lmaWNdCiAKIFNpZ25lZC1v
ZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNv
bSZndDs8L2E+CiAtLS0KQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBDaGVu
IFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5D
aGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgog
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdpdCBhL3NyYy9i
YXNpYy9wcm9jZXNzLXV0aWwuYyBiL3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwuYwotaW5kZXgg
ZGM3YzllZjllLi44NWNlOGEwY2MgMTAwNjQ0CitpbmRleCAwYTRmOTE3Y2IuLjM1NDNiYzA0
NSAxMDA2NDQKIC0tLSBhL3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwuYwogKysrIGIvc3JjL2Jh
c2ljL3Byb2Nlc3MtdXRpbC5jCi1AQCAtMzksNiArMzksOSBAQAorQEAgLTIyLDYgKzIyLDkg
QEAKICAjaWYgSEFWRV9WQUxHUklORF9WQUxHUklORF9ICiAgI2luY2x1ZGUgJmx0O3ZhbGdy
aW5kL3ZhbGdyaW5kLmgmZ3Q7CiAgI2VuZGlmCkBAIC0yNCw3ICsyNCw3IEBAIGluZGV4IGRj
N2M5ZWY5ZS4uODVjZThhMGNjIDEwMDY0NAogIAogICNpbmNsdWRlICJhbGxvYy11dGlsLmgi
CiAgI2luY2x1ZGUgImFyY2hpdGVjdHVyZS5oIgotQEAgLTExMTIsMTEgKzExMTUsMTUgQEAg
dm9pZCByZXNldF9jYWNoZWRfcGlkKHZvaWQpIHsKK0BAIC0xMTUwLDExICsxMTUzLDE1IEBA
IHZvaWQgcmVzZXRfY2FjaGVkX3BpZCh2b2lkKSB7CiAgICAgICAgICBjYWNoZWRfcGlkID0g
Q0FDSEVEX1BJRF9VTlNFVDsKICB9CiAgCkBAIC0zOSw3ICszOSw3IEBAIGluZGV4IGRjN2M5
ZWY5ZS4uODVjZThhMGNjIDEwMDY0NAogKyNlbmRpZgogIAogIHBpZF90IGdldHBpZF9jYWNo
ZWQodm9pZCkgewotICAgICAgICAgcGlkX3QgY3VycmVudF92YWx1ZTsKKyAgICAgICAgIHN0
YXRpYyBib29sIGluc3RhbGxlZCA9IGZhbHNlOwogLS0gCi0yLjEzLjAKKzIuMTEuMAogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAyNi1Vc2Ut
dWludG1heF90LWZvci1oYW5kbGluZy1ybGltX3QucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQvMDAxMy1Vc2UtdWludG1heF90LWZvci1oYW5kbGluZy1ybGlt
X3QucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA3NyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVz
LWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjYtVXNlLXVpbnRtYXhfdC1mb3ItaGFuZGxpbmct
cmxpbV90LnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3Rl
bWQvMDAxMy1Vc2UtdWludG1heF90LWZvci1oYW5kbGluZy1ybGltX3QucGF0Y2gKaW5kZXgg
NDZkNzVhZC4uNjliM2MxNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLzAwMjYtVXNlLXVpbnRtYXhfdC1mb3ItaGFuZGxpbmctcmxpbV90LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDEzLVVzZS11aW50
bWF4X3QtZm9yLWhhbmRsaW5nLXJsaW1fdC5wYXRjaApAQCAtMSw3ICsxLDcgQEAKLUZyb20g
ODhjNDhlYTg0ZGI2ZmRhMTlkZmFlYjY0NTQ1ZmNjZjhmYTA1MjVlYyBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKLUZyb206IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZj
MjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBn
bWFpbC5jb20mZ3Q7PC9hPgotRGF0ZTogRnJpLCAyNyBPY3QgMjAxNyAxMzowMDo0MSAtMDcw
MAotU3ViamVjdDogW1BBVENIIDI2LzMxXSBVc2UgdWludG1heF90IGZvciBoYW5kbGluZyBy
bGltX3QKK0Zyb20gYTBhYzBjZmQ5MGFmNjQzMWM2NGQxYjI3NmY0MjJhMjA5MmQ1NjliMyBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IENoZW4gUWkgPGEgY2xhc3M9Im1vei10
eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+
Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+CitEYXRlOiBNb24sIDIgSnVsIDIw
MTggMTM6NDQ6MjEgKzA4MDAKK1N1YmplY3Q6IFtQQVRDSCAxMy8xOV0gVXNlIHVpbnRtYXhf
dCBmb3IgaGFuZGxpbmcgcmxpbV90CiAKIFBSSXV7MzIsNjR9IGlzIG5vdCByaWdodCBmb3Jt
YXQgdG8gcmVwcmVzZW50IHJsaW1fdCB0eXBlCiB0aGVyZWZvcmUgdXNlICVqdSBhbmQgdHlw
ZWNhc3QgdGhlIHJsaW1fdCB2YXJpYWJsZXMgdG8KQEAgLTE1LDkgKzE1LDEwIEBAIGV4ZWN1
dGUuYzozNDQ2OjM2OiBlcnJvcjogZm9ybWF0ICclbHUnIGV4cGVjdHMgYXJndW1lbnQgb2Yg
dHlwZSAnbG9uZyB1bnNpZ25lZCBpCiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHByZWZpeCwgcmxpbWl0X3RvX3N0cmluZyhpKSwgYy0mZ3Q7cmxpbWl0W2ldLSZndDty
bGltX21heCk7CiB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogCi1VcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZCBbPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIg
aHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzcxOTkiPmh0
dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvcHVsbC83MTk5PC9hPl0KK1Vwc3Ry
ZWFtLVN0YXR1czogRGVuaWVkIFs8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBo
cmVmPSJodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL3B1bGwvNzE5OSI+aHR0
cHM6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzcxOTk8L2E+XQogCiBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29t
Jmd0OzwvYT4KK1NpZ25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGlu
ay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1Fp
LkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8L2E+CiAtLS0KICBzcmMvYmFzaWMvZm9ybWF0LXV0
aWwuaCB8IDggLS0tLS0tLS0KICBzcmMvYmFzaWMvcmxpbWl0LXV0aWwuYyB8IDggKysrKy0t
LS0KQEAgLTI1LDEwICsyNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwu
Y29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KICAzIGZpbGVzIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9zcmMv
YmFzaWMvZm9ybWF0LXV0aWwuaCBiL3NyYy9iYXNpYy9mb3JtYXQtdXRpbC5oCi1pbmRleCBk
OWE3OGY3ODEuLjlhMWJjMjFkNyAxMDA2NDQKK2luZGV4IDE2MDU1MGNkNi4uNjEyNDVkMWUz
IDEwMDY0NAogLS0tIGEvc3JjL2Jhc2ljL2Zvcm1hdC11dGlsLmgKICsrKyBiL3NyYy9iYXNp
Yy9mb3JtYXQtdXRpbC5oCi1AQCAtNjEsMTQgKzYxLDYgQEAKK0BAIC00MywxNCArNDMsNiBA
QAogICMgIGRlZmluZSBQUklfVElNRVggImxpIgogICNlbmRpZgogIApAQCAtNDQsMTAgKzQ1
LDEwIEBAIGluZGV4IGQ5YTc4Zjc4MS4uOWExYmMyMWQ3IDEwMDY0NAogICMgIGRlZmluZSBE
RVZfRk1UICIlIiBQUkl1NjQKICAjZWxpZiBTSVpFT0ZfREVWX1QgPT0gNAogZGlmZiAtLWdp
dCBhL3NyYy9iYXNpYy9ybGltaXQtdXRpbC5jIGIvc3JjL2Jhc2ljL3JsaW1pdC11dGlsLmMK
LWluZGV4IDAwNjQ4MjExZC4uZGYzZDllY2MxIDEwMDY0NAoraW5kZXggYmUxYmE2MTVlLi5l
MzI4Y2U0OTkgMTAwNjQ0CiAtLS0gYS9zcmMvYmFzaWMvcmxpbWl0LXV0aWwuYwogKysrIGIv
c3JjL2Jhc2ljL3JsaW1pdC11dGlsLmMKLUBAIC0yODYsMTMgKzI4NiwxMyBAQCBpbnQgcmxp
bWl0X2Zvcm1hdChjb25zdCBzdHJ1Y3QgcmxpbWl0ICpybCwgY2hhciAqKnJldCkgeworQEAg
LTI5OSwxMyArMjk5LDEzIEBAIGludCBybGltaXRfZm9ybWF0KGNvbnN0IHN0cnVjdCBybGlt
aXQgKnJsLCBjaGFyICoqcmV0KSB7CiAgICAgICAgICBpZiAocmwtJmd0O3JsaW1fY3VyICZn
dDs9IFJMSU1fSU5GSU5JVFkgJmFtcDsmYW1wOyBybC0mZ3Q7cmxpbV9tYXggJmd0Oz0gUkxJ
TV9JTkZJTklUWSkKICAgICAgICAgICAgICAgICAgcyA9IHN0cmR1cCgiaW5maW5pdHkiKTsK
ICAgICAgICAgIGVsc2UgaWYgKHJsLSZndDtybGltX2N1ciAmZ3Q7PSBSTElNX0lORklOSVRZ
KQpAQCAtNjYsMjQgKzY3LDI0IEBAIGluZGV4IDAwNjQ4MjExZC4uZGYzZDllY2MxIDEwMDY0
NAogICAgICAgICAgaWYgKCFzKQogICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
IGRpZmYgLS1naXQgYS9zcmMvY29yZS9leGVjdXRlLmMgYi9zcmMvY29yZS9leGVjdXRlLmMK
LWluZGV4IDBkZjM5NzFkZi4uYWFiZGRkYjY4IDEwMDY0NAoraW5kZXggOGFjNjlkMWEwLi5l
ZmVkZjM4NDIgMTAwNjQ0CiAtLS0gYS9zcmMvY29yZS9leGVjdXRlLmMKICsrKyBiL3NyYy9j
b3JlL2V4ZWN1dGUuYwotQEAgLTM5OTEsMTAgKzM5OTEsMTAgQEAgdm9pZCBleGVjX2NvbnRl
eHRfZHVtcChFeGVjQ29udGV4dCAqYywgRklMRSogZiwgY29uc3QgY2hhciAqcHJlZml4KSB7
CitAQCAtMzk3NiwxMCArMzk3NiwxMCBAQCB2b2lkIGV4ZWNfY29udGV4dF9kdW1wKGNvbnN0
IEV4ZWNDb250ZXh0ICpjLCBGSUxFKiBmLCBjb25zdCBjaGFyICpwcmVmaXgpIHsKICAKICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgJmx0OyBSTElNX05MSU1JVFM7IGkrKykKICAgICAgICAg
ICAgICAgICAgaWYgKGMtJmd0O3JsaW1pdFtpXSkgewotLSAgICAgICAgICAgICAgICAgICAg
ICAgIGZwcmludGYoZiwgIiVzJXM6ICIgUkxJTV9GTVQgIlxuIiwKKy0gICAgICAgICAgICAg
ICAgICAgICAgICBmcHJpbnRmKGYsICJMaW1pdCVzJXM6ICIgUkxJTV9GTVQgIlxuIiwKIC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeCwgcmxpbWl0X3RvX3N0cmlu
ZyhpKSwgYy0mZ3Q7cmxpbWl0W2ldLSZndDtybGltX21heCk7Ci0tICAgICAgICAgICAgICAg
ICAgICAgICAgZnByaW50ZihmLCAiJXMlc1NvZnQ6ICIgUkxJTV9GTVQgIlxuIiwKKy0gICAg
ICAgICAgICAgICAgICAgICAgICBmcHJpbnRmKGYsICJMaW1pdCVzJXNTb2Z0OiAiIFJMSU1f
Rk1UICJcbiIsCiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmVmaXgsIHJs
aW1pdF90b19zdHJpbmcoaSksIGMtJmd0O3JsaW1pdFtpXS0mZ3Q7cmxpbV9jdXIpOwotKyAg
ICAgICAgICAgICAgICAgICAgICAgIGZwcmludGYoZiwgIiVzJXM6ICVqdVxuIiwKKysgICAg
ICAgICAgICAgICAgICAgICAgICBmcHJpbnRmKGYsICJMaW1pdCVzJXM6ICVqdVxuIiwKICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeCwgcmxpbWl0X3RvX3N0cmlu
ZyhpKSwgKHVpbnRtYXhfdCljLSZndDtybGltaXRbaV0tJmd0O3JsaW1fbWF4KTsKLSsgICAg
ICAgICAgICAgICAgICAgICAgICBmcHJpbnRmKGYsICIlcyVzU29mdDogJWp1XG4iLAorKyAg
ICAgICAgICAgICAgICAgICAgICAgIGZwcmludGYoZiwgIkxpbWl0JXMlc1NvZnQ6ICVqdVxu
IiwKICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZWZpeCwgcmxpbWl0X3Rv
X3N0cmluZyhpKSwgKHVpbnRtYXhfdCljLSZndDtybGltaXRbaV0tJmd0O3JsaW1fY3VyKTsK
ICAgICAgICAgICAgICAgICAgfQogIAogICAgICAgICAgaWYgKGMtJmd0O2lvcHJpb19zZXQp
IHsKIC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNv
cmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzEtZml4LW1pc3NpbmctVUxPTkdfTE9OR19NQVgtZGVm
aW5pdGlvbi1pbi1jYXNlLW9mLW11cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3Rl
bWQvc3lzdGVtZC8wMDE0LWZpeC1taXNzaW5nLVVMT05HX0xPTkdfTUFYLWRlZmluaXRpb24t
aW4tY2FzZS1vZi1tdXMucGF0Y2gKc2ltaWxhcml0eSBpbmRleCA2NiUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzEtZml4LW1pc3NpbmctVUxP
TkdfTE9OR19NQVgtZGVmaW5pdGlvbi1pbi1jYXNlLW9mLW11cy5wYXRjaApyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTQtZml4LW1pc3NpbmctVUxP
TkdfTE9OR19NQVgtZGVmaW5pdGlvbi1pbi1jYXNlLW9mLW11cy5wYXRjaAppbmRleCAzMTlj
NGI2Li4yNThhNjMxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvMDAzMS1maXgtbWlzc2luZy1VTE9OR19MT05HX01BWC1kZWZpbml0aW9uLWluLWNh
c2Utb2YtbXVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVt
ZC8wMDE0LWZpeC1taXNzaW5nLVVMT05HX0xPTkdfTUFYLWRlZmluaXRpb24taW4tY2FzZS1v
Zi1tdXMucGF0Y2gKQEAgLTEsOSArMSw5IEBACi1Gcm9tIGFkY2Q3ZTQyNmZjZDgwZTc1NDI3
NGE3MzAyMjFkMWExZjQ5ZGJjMjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNi
NTliM2FmNTRmYjNiYmQ0ZDgyNjRmZWY5MTk4MTBhZjhkMDhkMTYgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5
NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5DaGVuQHdp
bmRyaXZlci5jb20mZ3Q7PC9hPgogRGF0ZTogVHVlLCAyNyBGZWIgMjAxOCAxNDowMTozMCAr
MDgwMAotU3ViamVjdDogW1BBVENIIDMxLzMxXSBmaXggbWlzc2luZyBVTE9OR19MT05HX01B
WCBkZWZpbml0aW9uIGluIGNhc2Ugb2YgbXVzbAorU3ViamVjdDogW1BBVENIIDE0LzE5XSBm
aXggbWlzc2luZyBVTE9OR19MT05HX01BWCBkZWZpbml0aW9uIGluIGNhc2Ugb2YgbXVzbAog
Ci1VcHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbbXVzbF0KIAogU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4m
bHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KIC0tLQpAQCAtMTEsMTAgKzExLDEw
IEBAIFNpZ25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMy
Mzk2RSIgaHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5A
d2luZHJpdmVyLmNvbSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQogCiBkaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL21pc3NpbmcuaCBiL3NyYy9iYXNpYy9taXNz
aW5nLmgKLWluZGV4IDViOWZkZTY5Mi4uYTkyMmYxMzQ2IDEwMDY0NAoraW5kZXggY2QxY2Mx
MDlmLi4xNDQwNThhMWEgMTAwNjQ0CiAtLS0gYS9zcmMvYmFzaWMvbWlzc2luZy5oCiArKysg
Yi9zcmMvYmFzaWMvbWlzc2luZy5oCi1AQCAtNzIsNiArNzIsMTAgQEAgc3RydWN0IHNvY2th
ZGRyX3ZtIHsKK0BAIC01NCw2ICs1NCwxMCBAQCBzdHJ1Y3Qgc29ja2FkZHJfdm0gewogIH07
CiAgI2VuZGlmIC8qICFIQVZFX0xJTlVYX1ZNX1NPQ0tFVFNfSCAqLwogIApAQCAtMjYsNSAr
MjYsNSBAQCBpbmRleCA1YjlmZGU2OTIuLmE5MjJmMTM0NiAxMDA2NDQKICAjZGVmaW5lIFJM
SU1JVF9SVFRJTUUgMTUKICAjZW5kaWYKIC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMjAtdGVzdC1oZXhk
ZWNvY3QuYy1JbmNsdWRlLW1pc3NpbmcuaC1mb3Itc3RybmR1cGEucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxNS10ZXN0LWhleGRlY29jdC5jLUluY2x1
ZGUtbWlzc2luZy5oLWZvci1zdHJuZHVwYS5wYXRjaApzaW1pbGFyaXR5IGluZGV4IDcwJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAyMC10ZXN0
LWhleGRlY29jdC5jLUluY2x1ZGUtbWlzc2luZy5oLWZvci1zdHJuZHVwYS5wYXRjaApyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTUtdGVzdC1oZXhk
ZWNvY3QuYy1JbmNsdWRlLW1pc3NpbmcuaC1mb3Itc3RybmR1cGEucGF0Y2gKaW5kZXggYWQ0
OWNmZS4uYzdjYTljZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLzAwMjAtdGVzdC1oZXhkZWNvY3QuYy1JbmNsdWRlLW1pc3NpbmcuaC1mb3Itc3Ry
bmR1cGEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAw
MTUtdGVzdC1oZXhkZWNvY3QuYy1JbmNsdWRlLW1pc3NpbmcuaC1mb3Itc3RybmR1cGEucGF0
Y2gKQEAgLTEsOSArMSw5IEBACi1Gcm9tIGQ2M2QyZmVkY2Q4MGU1OGVlNTM2NTVhZWFmMjgz
NmQ0YjBhMTQ2NTIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGIxMTEwOWVjYzQx
MTEwYzUxOGE5OGI2YWMzOTYxMWZmODY0NzcwMjEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVm
PSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0
OzwvYT4KIERhdGU6IE1vbiwgMjMgT2N0IDIwMTcgMTI6MzM6MjIgLTA3MDAKLVN1YmplY3Q6
IFtQQVRDSCAyMC8zMV0gdGVzdC1oZXhkZWNvY3QuYzogSW5jbHVkZSBtaXNzaW5nLmggZm9y
IHN0cm5kdXBhCitTdWJqZWN0OiBbUEFUQ0ggMTUvMTldIHRlc3QtaGV4ZGVjb2N0LmM6IElu
Y2x1ZGUgbWlzc2luZy5oIGZvciBzdHJuZHVwYQogCi1VcHN0cmVhbS1TdGF0dXM6IFBlbmRp
bmcKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbbXVzbCBzcGVjaWZpY10KIAog
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2
RSIgaHJlZj0ibWFpbHRvOnJhai5raGVtQGdtYWlsLmNvbSI+Jmx0O3Jhai5raGVtQGdtYWls
LmNvbSZndDs8L2E+CiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0
LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZs
dDtRaS5DaGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgpAQCAtMTIsMTAgKzEyLDEwIEBAIFNp
Z25lZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIg
aHJlZj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJp
dmVyLmNvbSZndDs8L2E+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRp
ZmYgLS1naXQgYS9zcmMvdGVzdC90ZXN0LWhleGRlY29jdC5jIGIvc3JjL3Rlc3QvdGVzdC1o
ZXhkZWNvY3QuYwotaW5kZXggM2UyNWEwYmFjLi5hYjNlNTA4ZjEgMTAwNjQ0CitpbmRleCBk
YTlmMzAwOGIuLjdmZjJkZmUwYyAxMDA2NDQKIC0tLSBhL3NyYy90ZXN0L3Rlc3QtaGV4ZGVj
b2N0LmMKICsrKyBiL3NyYy90ZXN0L3Rlc3QtaGV4ZGVjb2N0LmMKLUBAIC0yNCw2ICsyNCw3
IEBACitAQCAtNiw2ICs2LDcgQEAKICAjaW5jbHVkZSAiaGV4ZGVjb2N0LmgiCiAgI2luY2x1
ZGUgIm1hY3JvLmgiCiAgI2luY2x1ZGUgInN0cmluZy11dGlsLmgiCkBAIC0yNCw1ICsyNCw1
IEBAIGluZGV4IDNlMjVhMGJhYy4uYWIzZTUwOGYxIDEwMDY0NAogIHN0YXRpYyB2b2lkIHRl
c3RfaGV4Y2hhcih2b2lkKSB7CiAgICAgICAgICBhc3NlcnRfc2UoaGV4Y2hhcigweGEpID09
ICdhJyk7CiAtLSAKLTIuMTMuMAorMi4xMS4wCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDIxLXRlc3Qtc2l6ZW9mLmMtRGlzYWJsZS10ZXN0
cy1mb3ItbWlzc2luZy10eXBlZGVmcy1pbi0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAxNi10ZXN0LXNpemVvZi5jLURpc2FibGUtdGVzdHMtZm9yLW1p
c3NpbmctdHlwZWRlZnMtaW4tLnBhdGNoCnNpbWlsYXJpdHkgaW5kZXggNzMlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDIxLXRlc3Qtc2l6ZW9m
LmMtRGlzYWJsZS10ZXN0cy1mb3ItbWlzc2luZy10eXBlZGVmcy1pbi0ucGF0Y2gKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE2LXRlc3Qtc2l6ZW9m
LmMtRGlzYWJsZS10ZXN0cy1mb3ItbWlzc2luZy10eXBlZGVmcy1pbi0ucGF0Y2gKaW5kZXgg
OWM4YWVjYS4uYzA2YTM3MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVt
ZC9zeXN0ZW1kLzAwMjEtdGVzdC1zaXplb2YuYy1EaXNhYmxlLXRlc3RzLWZvci1taXNzaW5n
LXR5cGVkZWZzLWluLS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5
c3RlbWQvMDAxNi10ZXN0LXNpemVvZi5jLURpc2FibGUtdGVzdHMtZm9yLW1pc3NpbmctdHlw
ZWRlZnMtaW4tLnBhdGNoCkBAIC0xLDEwICsxLDEwIEBACi1Gcm9tIGRmZWE0Yjk4ODQ0Nzk1
YTBjZDE0ZmRhZjQwYzY3ZGYzODlkYmQyN2UgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGM0YmJmM2VmZWZmZmUwYTRlZmFkYmY0ZTNmMGFkYjU0ZDc2ZmUwZTcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGVuIFFpIDxhIGNsYXNzPSJtb3otdHh0LWxpbmst
cmZjMjM5NkUiIGhyZWY9Im1haWx0bzpRaS5DaGVuQHdpbmRyaXZlci5jb20iPiZsdDtRaS5D
aGVuQHdpbmRyaXZlci5jb20mZ3Q7PC9hPgogRGF0ZTogV2VkLCAyOCBGZWIgMjAxOCAyMToy
NToyMiAtMDgwMAotU3ViamVjdDogW1BBVENIIDIxLzMxXSB0ZXN0LXNpemVvZi5jOiBEaXNh
YmxlIHRlc3RzIGZvciBtaXNzaW5nIHR5cGVkZWZzIGluCitTdWJqZWN0OiBbUEFUQ0ggMTYv
MTldIHRlc3Qtc2l6ZW9mLmM6IERpc2FibGUgdGVzdHMgZm9yIG1pc3NpbmcgdHlwZWRlZnMg
aW4KICBtdXNsCiAKLVVwc3RyZWFtLVN0YXR1czogUGVuZGluZworVXBzdHJlYW0tU3RhdHVz
OiBJbmFwcHJvcHJpYXRlIFttdXNsIHNwZWNpZmljXQogCiBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFq
LmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIFNpZ25l
ZC1vZmYtYnk6IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVy
LmNvbSZndDs8L2E+CkBAIC0xMywxMCArMTMsMTAgQEAgU2lnbmVkLW9mZi1ieTogQ2hlbiBR
aSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hl
bkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9zcmMvdGVz
dC90ZXN0LXNpemVvZi5jIGIvc3JjL3Rlc3QvdGVzdC1zaXplb2YuYwotaW5kZXggYWVkNmRi
ODQyLi4wZGU2ZmE2M2MgMTAwNjQ0CitpbmRleCA3YTFlNDk2ZWQuLjM4NmIzMTRkNSAxMDA2
NDQKIC0tLSBhL3NyYy90ZXN0L3Rlc3Qtc2l6ZW9mLmMKICsrKyBiL3NyYy90ZXN0L3Rlc3Qt
c2l6ZW9mLmMKLUBAIC01MCw4ICs1MCwxMCBAQCBpbnQgbWFpbih2b2lkKSB7CitAQCAtNDAs
OCArNDAsMTAgQEAgaW50IG1haW4odm9pZCkgewogICAgICAgICAgaW5mbyh1bnNpZ25lZCk7
CiAgICAgICAgICBpbmZvKGxvbmcgdW5zaWduZWQpOwogICAgICAgICAgaW5mbyhsb25nIGxv
bmcgdW5zaWduZWQpOwpAQCAtMjcsNyArMjcsNyBAQCBpbmRleCBhZWQ2ZGI4NDIuLjBkZTZm
YTYzYyAxMDA2NDQKICAKICAgICAgICAgIGluZm8oZmxvYXQpOwogICAgICAgICAgaW5mbyhk
b3VibGUpOwotQEAgLTYxLDcgKzYzLDkgQEAgaW50IG1haW4odm9pZCkgeworQEAgLTU5LDcg
KzYxLDkgQEAgaW50IG1haW4odm9pZCkgewogICAgICAgICAgaW5mbyhzc2l6ZV90KTsKICAg
ICAgICAgIGluZm8odGltZV90KTsKICAgICAgICAgIGluZm8odXNlY190KTsKQEAgLTM4LDUg
KzM4LDUgQEAgaW5kZXggYWVkNmRiODQyLi4wZGU2ZmE2M2MgMTAwNjQ0CiAgICAgICAgICBp
bmZvKHVpZF90KTsKICAgICAgICAgIGluZm8oZ2lkX3QpOwogLS0gCi0yLjEzLjAKKzIuMTEu
MAogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAy
My1kb24tdC1wYXNzLUFUX1NZTUxJTktfTk9GT0xMT1ctZmxhZy10by1mYWNjZXNzYXQucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAxNy1kb24tdC1wYXNz
LUFUX1NZTUxJTktfTk9GT0xMT1ctZmxhZy10by1mYWNjZXNzYXQucGF0Y2gKc2ltaWxhcml0
eSBpbmRleCA4OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0
ZW1kLzAwMjMtZG9uLXQtcGFzcy1BVF9TWU1MSU5LX05PRk9MTE9XLWZsYWctdG8tZmFjY2Vz
c2F0LnBhdGNoCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQv
MDAxNy1kb24tdC1wYXNzLUFUX1NZTUxJTktfTk9GT0xMT1ctZmxhZy10by1mYWNjZXNzYXQu
cGF0Y2gKaW5kZXggMDljMmI1Yy4uOGU0N2M2ZjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDIzLWRvbi10LXBhc3MtQVRfU1lNTElOS19OT0ZP
TExPVy1mbGFnLXRvLWZhY2Nlc3NhdC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQvMDAxNy1kb24tdC1wYXNzLUFUX1NZTUxJTktfTk9GT0xMT1ctZmxh
Zy10by1mYWNjZXNzYXQucGF0Y2gKQEAgLTEsNyArMSw3IEBACi1Gcm9tIDdiODAyYWRhMTIw
N2VkMDBlZDM4NjdiOTgwNGRkMGYzMTY2NDFiOWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDkxYmI0ZjVjOWMxMTQ2NDQ2OGU4ZDNmYTQ3NDZkOThkNTk5OTcyNjQgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbmRyZSBNY0N1cmR5IDxhIGNsYXNzPSJtb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzphcm1jY3VyZHlAZ21haWwuY29tIj4m
bHQ7YXJtY2N1cmR5QGdtYWlsLmNvbSZndDs8L2E+CiBEYXRlOiBUdWUsIDEwIE9jdCAyMDE3
IDE0OjMzOjMwIC0wNzAwCi1TdWJqZWN0OiBbUEFUQ0ggMjMvMzFdIGRvbid0IHBhc3MgQVRf
U1lNTElOS19OT0ZPTExPVyBmbGFnIHRvIGZhY2Nlc3NhdCgpCitTdWJqZWN0OiBbUEFUQ0gg
MTcvMTldIGRvbid0IHBhc3MgQVRfU1lNTElOS19OT0ZPTExPVyBmbGFnIHRvIGZhY2Nlc3Nh
dCgpCiAKIEF2b2lkIHVzaW5nIEFUX1NZTUxJTktfTk9GT0xMT1cgZmxhZy4gSXQgZG9lc24n
dCBzZWVtIGxpa2UgdGhlIHJpZ2h0CiB0aGluZyB0byBkbyBhbmQgaXQncyBub3QgcG9ydGFi
bGUgKG5vdCBzdXBwb3J0ZWQgYnkgbXVzbCkuIFNlZToKQEAgLTIyLDcgKzIyLDcgQEAgVGhl
IGxhY2Nlc3MoKSBtYWNyb3Mgd2FzIGFkZGVkIHRvIHN5c3RlbWQgc29tZSB0aW1lIGFnbyBh
bmQgaXQncyBub3QKIGNsZWFyIGlmIG9yIHdoeSBpdCBuZWVkcyB0byByZXR1cm4gc3VjY2Vz
cyBmb3IgYnJva2VuIHN5bWxpbmtzLiBNYXliZQoganVzdCBoaXN0b3JpY2FsIGFuZCBub3Qg
YWN0dWFsbHkgbmVjZXNzYXJ5IG9yIGRlc2lyZWQgYmVoYXZpb3VyPwogCi1VcHN0cmVhbS1T
dGF0dXM6IFBlbmRpbmcKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbbXVzbCBz
cGVjaWZpY10KIAogU2lnbmVkLW9mZi1ieTogQW5kcmUgTWNDdXJkeSA8YSBjbGFzcz0ibW96
LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YXJtY2N1cmR5QGdtYWlsLmNvbSI+
Jmx0O2FybWNjdXJkeUBnbWFpbC5jb20mZ3Q7PC9hPgogLS0tCkBAIC0zMSwxMCArMzEsMTAg
QEAgU2lnbmVkLW9mZi1ieTogQW5kcmUgTWNDdXJkeSA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86YXJtY2N1cmR5QGdtYWlsLmNvbSI+Jmx0O2FybWNj
dXJkeUBnbWFpbC5jb20mZ3Q7PC9hPgogIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3NyYy9iYXNpYy9mcy11dGls
LmggYi9zcmMvYmFzaWMvZnMtdXRpbC5oCi1pbmRleCA0ZGJhMWVhNTYuLjljNGIwMmVjYyAx
MDA2NDQKK2luZGV4IDI4NTY2NzczYy4uMTRiODY0Y2M1IDEwMDY0NAogLS0tIGEvc3JjL2Jh
c2ljL2ZzLXV0aWwuaAogKysrIGIvc3JjL2Jhc2ljL2ZzLXV0aWwuaAotQEAgLTUwLDcgKzUw
LDI3IEBAIGludCBmY2htb2RfdW1hc2soaW50IGZkLCBtb2RlX3QgbW9kZSk7CitAQCAtMzIs
NyArMzIsMjcgQEAgaW50IGZjaG1vZF9vcGF0aChpbnQgZmQsIG1vZGVfdCBtKTsKICAKICBp
bnQgZmRfd2Fybl9wZXJtaXNzaW9ucyhjb25zdCBjaGFyICpwYXRoLCBpbnQgZmQpOwogIApA
QCAtNjQsMTAgKzY0LDEwIEBAIGluZGV4IDRkYmExZWE1Ni4uOWM0YjAyZWNjIDEwMDY0NAog
IGludCB0b3VjaF9maWxlKGNvbnN0IGNoYXIgKnBhdGgsIGJvb2wgcGFyZW50cywgdXNlY190
IHN0YW1wLCB1aWRfdCB1aWQsIGdpZF90IGdpZCwgbW9kZV90IG1vZGUpOwogIGludCB0b3Vj
aChjb25zdCBjaGFyICpwYXRoKTsKIGRpZmYgLS1naXQgYS9zcmMvc2hhcmVkL2Jhc2UtZmls
ZXN5c3RlbS5jIGIvc3JjL3NoYXJlZC9iYXNlLWZpbGVzeXN0ZW0uYwotaW5kZXggM2MyNWFh
NTM0Li41NzRjYTcxYzcgMTAwNjQ0CitpbmRleCA4OWQ3YTdkNTkuLjM0YjRhZDUzYSAxMDA2
NDQKIC0tLSBhL3NyYy9zaGFyZWQvYmFzZS1maWxlc3lzdGVtLmMKICsrKyBiL3NyYy9zaGFy
ZWQvYmFzZS1maWxlc3lzdGVtLmMKLUBAIC03MSw3ICs3MSw3IEBAIGludCBiYXNlX2ZpbGVz
eXN0ZW1fY3JlYXRlKGNvbnN0IGNoYXIgKnJvb3QsIHVpZF90IHVpZCwgZ2lkX3QgZ2lkKSB7
CitAQCAtNTMsNyArNTMsNyBAQCBpbnQgYmFzZV9maWxlc3lzdGVtX2NyZWF0ZShjb25zdCBj
aGFyICpyb290LCB1aWRfdCB1aWQsIGdpZF90IGdpZCkgewogICAgICAgICAgICAgICAgICBy
ZXR1cm4gbG9nX2Vycm9yX2Vycm5vKGVycm5vLCAiRmFpbGVkIHRvIG9wZW4gcm9vdCBmaWxl
IHN5c3RlbTogJW0iKTsKICAKICAgICAgICAgIGZvciAoaSA9IDA7IGkgJmx0OyBFTEVNRU5U
U09GKHRhYmxlKTsgaSArKykgewpAQCAtNzYsNyArNzYsNyBAQCBpbmRleCAzYzI1YWE1MzQu
LjU3NGNhNzFjNyAxMDA2NDQKICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
ICAKICAgICAgICAgICAgICAgICAgaWYgKHRhYmxlW2ldLnRhcmdldCkgewotQEAgLTc5LDcg
Kzc5LDcgQEAgaW50IGJhc2VfZmlsZXN5c3RlbV9jcmVhdGUoY29uc3QgY2hhciAqcm9vdCwg
dWlkX3QgdWlkLCBnaWRfdCBnaWQpIHsKK0BAIC02MSw3ICs2MSw3IEBAIGludCBiYXNlX2Zp
bGVzeXN0ZW1fY3JlYXRlKGNvbnN0IGNoYXIgKnJvb3QsIHVpZF90IHVpZCwgZ2lkX3QgZ2lk
KSB7CiAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogY2hlY2sgaWYgb25lIG9mIHRo
ZSB0YXJnZXRzIGV4aXN0cyAqLwogICAgICAgICAgICAgICAgICAgICAgICAgIE5VTFNUUl9G
T1JFQUNIKHMsIHRhYmxlW2ldLnRhcmdldCkgewpAQCAtODUsNyArODUsNyBAQCBpbmRleCAz
YzI1YWE1MzQuLjU3NGNhNzFjNyAxMDA2NDQKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7CiAgCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKiBjaGVjayBpZiBhIHNwZWNpZmljIGZpbGUgZXhpc3RzIGF0IHRoZSB0YXJn
ZXQgcGF0aCAqLwotQEAgLTkwLDcgKzkwLDcgQEAgaW50IGJhc2VfZmlsZXN5c3RlbV9jcmVh
dGUoY29uc3QgY2hhciAqcm9vdCwgdWlkX3QgdWlkLCBnaWRfdCBnaWQpIHsKK0BAIC03Miw3
ICs3Miw3IEBAIGludCBiYXNlX2ZpbGVzeXN0ZW1fY3JlYXRlKGNvbnN0IGNoYXIgKnJvb3Qs
IHVpZF90IHVpZCwgZ2lkX3QgZ2lkKSB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghcCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gbG9nX29vbSgpOwogIApAQCAtOTUsNSArOTUsNSBA
QCBpbmRleCAzYzI1YWE1MzQuLjU3NGNhNzFjNyAxMDA2NDQKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIH0KICAKIC0tIAotMi4xMy4wCisyLjExLjAKIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzUtRGVmaW5lLWdsaWJj
LWNvbXBhdGlibGUtYmFzZW5hbWUtZm9yLW5vbi1nbGliYy1zeXN0ZS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE4LURlZmluZS1nbGliYy1jb21wYXRp
YmxlLWJhc2VuYW1lLWZvci1ub24tZ2xpYmMtc3lzdGUucGF0Y2gKc2ltaWxhcml0eSBpbmRl
eCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAw
MzUtRGVmaW5lLWdsaWJjLWNvbXBhdGlibGUtYmFzZW5hbWUtZm9yLW5vbi1nbGliYy1zeXN0
ZS5wYXRjaApyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAw
MTgtRGVmaW5lLWdsaWJjLWNvbXBhdGlibGUtYmFzZW5hbWUtZm9yLW5vbi1nbGliYy1zeXN0
ZS5wYXRjaAppbmRleCA3MzZkNTI1Li4xYmQwZDYwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAzNS1EZWZpbmUtZ2xpYmMtY29tcGF0aWJsZS1i
YXNlbmFtZS1mb3Itbm9uLWdsaWJjLXN5c3RlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE4LURlZmluZS1nbGliYy1jb21wYXRpYmxlLWJhc2Vu
YW1lLWZvci1ub24tZ2xpYmMtc3lzdGUucGF0Y2gKQEAgLTEsNyArMSw4IEBACi1Gcm9tIDVm
MWYwNjRjODFlYTMwYWNmOTNjZmEwZmI0NjZiMzhmMDk0ZjQ4OGMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCitGcm9tIDk3ZmVkMDcxMzI1MzNhMWIyYmNlOWM2MGUzMDVhNWQwOWFlZTJl
OWIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29t
Ij4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KIERhdGU6IFN1biwgMjcgTWF5IDIw
MTggMDg6MzY6NDQgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIGdsaWJjIGNvbXBh
dGlibGUgYmFzZW5hbWUoKSBmb3Igbm9uLWdsaWJjIHN5c3RlbXMKK1N1YmplY3Q6IFtQQVRD
SCAxOC8xOV0gRGVmaW5lIGdsaWJjIGNvbXBhdGlibGUgYmFzZW5hbWUoKSBmb3Igbm9uLWds
aWJjCisgc3lzdGVtcwogCiBGaXhlcyBidWlsZHMgd2l0aCBtdXNsLCBldmVuIHRob3VnaCBz
eXN0ZW1kIGlzIGFkYW1hbnQgYWJvdXQKIHVzaW5nIG5vbi1wb3NpeCBiYXNlbmFtZSBpbXBs
ZW1lbnRhdGlvbiwgd2UgaGF2ZSBhIHdheSBvdXQKQEAgLTE0LDEwICsxNSwxMCBAQCBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29t
Jmd0OzwvYT4KICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1n
aXQgYS9zcmMvbWFjaGluZS9tYWNoaW5lLWRidXMuYyBiL3NyYy9tYWNoaW5lL21hY2hpbmUt
ZGJ1cy5jCi1pbmRleCAyZDc4MDY0OTFiLi45YTNiZGIxZDc2IDEwMDY0NAoraW5kZXggN2Y0
MTQ2NWNjLi5jZWU4YTVkNDMgMTAwNjQ0CiAtLS0gYS9zcmMvbWFjaGluZS9tYWNoaW5lLWRi
dXMuYwogKysrIGIvc3JjL21hY2hpbmUvbWFjaGluZS1kYnVzLmMKLUBAIC0yOSw2ICsyOSwx
MCBAQAorQEAgLTExLDYgKzExLDEwIEBACiAgI2luY2x1ZGUgJmx0O2xpYmdlbi5oJmd0Owog
ICN1bmRlZiBiYXNlbmFtZQogIApAQCAtMjksNSArMzAsNSBAQCBpbmRleCAyZDc4MDY0OTFi
Li45YTNiZGIxZDc2IDEwMDY0NAogICNpbmNsdWRlICJidXMtY29tbW9uLWVycm9ycy5oIgog
ICNpbmNsdWRlICJidXMtaW50ZXJuYWwuaCIKIC0tIAotMi4xNy4wCisyLjExLjAKIApkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMTgtY2hlY2st
Zm9yLW1pc3NpbmctY2Fub25pY2FsaXplX2ZpbGVfbmFtZS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE4LWNoZWNrLWZvci1taXNzaW5nLWNhbm9uaWNh
bGl6ZV9maWxlX25hbWUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGFi
N2VkZjUuLjAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1k
LzAwMTgtY2hlY2stZm9yLW1pc3NpbmctY2Fub25pY2FsaXplX2ZpbGVfbmFtZS5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAKLUZyb20gNjkwZWVlZjk1OTBjN2VmMWQ5
ZDJjMzFkOGMxZDVkODA3MWRhOGM0YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRv
OlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVyLmNvbSZndDs8
L2E+Ci1EYXRlOiBNb24sIDI2IEZlYiAyMDE4IDE3OjIxOjExICswODAwCi1TdWJqZWN0OiBb
UEFUQ0ggMTgvMzFdIGNoZWNrIGZvciBtaXNzaW5nIGNhbm9uaWNhbGl6ZV9maWxlX25hbWUK
LQotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCi0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFq
IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpyYWoua2hl
bUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5jb20mZ3Q7PC9hPgotU2lnbmVkLW9m
Zi1ieTogQ2hlbiBRaSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86UWkuQ2hlbkB3aW5kcml2ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29t
Jmd0OzwvYT4KLS0tLQotIG1lc29uLmJ1aWxkICAgICAgICAgICAgICAgICB8IDIgKysKLSBz
cmMvYmFzaWMvbWlzc2luZ19zeXNjYWxsLmggfCA2ICsrKysrKwotIDIgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29u
LmJ1aWxkCi1pbmRleCAxMjgxMWIzZjMuLmY2NTE1ZTk3YyAxMDA2NDQKLS0tLSBhL21lc29u
LmJ1aWxkCi0rKysgYi9tZXNvbi5idWlsZAotQEAgLTUyMCw2ICs1MjAsOCBAQCBmb3JlYWNo
IGlkZW50IDogWwotICAgICAgICAgWydrY21wJywgICAgICAgICAgICAgICcnJyNpbmNsdWRl
ICZsdDtsaW51eC9rY21wLmgmZ3Q7JycnXSwKLSAgICAgICAgIFsna2V5Y3RsJywgICAgICAg
ICAgICAnJycjaW5jbHVkZSAmbHQ7c3lzL3R5cGVzLmgmZ3Q7Ci0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgI2luY2x1ZGUgJmx0O2tleXV0aWxzLmgmZ3Q7JycnXSwKLSsg
ICAgICAgIFsnY2Fub25pY2FsaXplX2ZpbGVfbmFtZScsICcnJyNkZWZpbmUgX0dOVV9TT1VS
Q0UKLSsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNpbmNsdWRlICZs
dDtzdGRsaWIuaCZndDsnJyddLAotICAgICAgICAgWydjb3B5X2ZpbGVfcmFuZ2UnLCAgICcn
JyNpbmNsdWRlICZsdDtzeXMvc3lzY2FsbC5oJmd0OwotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICNpbmNsdWRlICZsdDt1bmlzdGQuaCZndDsnJyddLAotICAgICAgICAg
WydicGYnLCAgICAgICAgICAgICAgICcnJyNpbmNsdWRlICZsdDtzeXMvc3lzY2FsbC5oJmd0
OwotZGlmZiAtLWdpdCBhL3NyYy9iYXNpYy9taXNzaW5nX3N5c2NhbGwuaCBiL3NyYy9iYXNp
Yy9taXNzaW5nX3N5c2NhbGwuaAotaW5kZXggYzkzOGQwZDk3Li4zMDhiOTQ3MmIgMTAwNjQ0
Ci0tLS0gYS9zcmMvYmFzaWMvbWlzc2luZ19zeXNjYWxsLmgKLSsrKyBiL3NyYy9iYXNpYy9t
aXNzaW5nX3N5c2NhbGwuaAotQEAgLTMxLDYgKzMxLDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50
IHBpdm90X3Jvb3QoY29uc3QgY2hhciAqbmV3X3Jvb3QsIGNvbnN0IGNoYXIgKnB1dF9vbGQp
IHsKLSB9Ci0gI2VuZGlmCi0gCi0rI2lmICFIQVZFX0NBTk9OSUNBTElaRV9GSUxFX05BTUUK
LStzdGF0aWMgaW5saW5lIGNoYXIgKmNhbm9uaWNhbGl6ZV9maWxlX25hbWUoY29uc3QgY2hh
ciAqcGF0aCkgewotKyAgICAgICAgcmV0dXJuIHJlYWxwYXRoKHBhdGgsIE5VTEwpOwotK30K
LSsjZW5kaWYKLSsKLSAvKiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSAqLwotIAotICNpZiAhSEFWRV9N
RU1GRF9DUkVBVEUKLS0tIAotMi4xMy4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZC8wMDE5LURvLW5vdC1kaXNhYmxlLWJ1ZmZlcmluZy13aGVu
LXdyaXRpbmctdG8tb29tX3Njb3JlX2EucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAxOS1Eby1ub3QtZGlzYWJsZS1idWZmZXJpbmctd2hlbi13cml0aW5n
LXRvLW9vbV9zY29yZV9hLnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAuLjk0MmY0YzAKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWQvMDAxOS1Eby1ub3QtZGlzYWJsZS1idWZmZXJpbmctd2hlbi13cml0aW5n
LXRvLW9vbV9zY29yZV9hLnBhdGNoCkBAIC0wLDAgKzEsMzkgQEAKK0Zyb20gODQ0MDM0OGJj
YWMzNDI0OWNkZjZhYzJkY2FlOWFjNjZkM2M3MjdkYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IENoZW4gUWkgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJl
Zj0ibWFpbHRvOlFpLkNoZW5Ad2luZHJpdmVyLmNvbSI+Jmx0O1FpLkNoZW5Ad2luZHJpdmVy
LmNvbSZndDs8L2E+CitEYXRlOiBXZWQsIDQgSnVsIDIwMTggMTU6MDA6NDQgKzA4MDAKK1N1
YmplY3Q6IFtQQVRDSCAxOS8xOV0gRG8gbm90IGRpc2FibGUgYnVmZmVyaW5nIHdoZW4gd3Jp
dGluZyB0byBvb21fc2NvcmVfYWRqCisKK09uIG11c2wsIGRpc2FibGluZyBidWZmZXJpbmcg
d2hlbiB3cml0aW5nIHRvIG9vbV9zY29yZV9hZGogd2lsbAorY2F1c2UgdGhlIGZvbGxvd2lu
ZyBlcnJvci4KKworICBGYWlsZWQgdG8gYWRqdXN0IE9PTSBzZXR0aW5nOiBJbnZhbGlkIGFy
Z3VtZW50CisKK1RoaXMgZXJyb3IgYXBwZWFycyBmb3Igc3lzdGVtZC11ZGV2ZC5zZXJ2aWNl
IGFuZCBkYnVzLnNlcnZpY2UuCitUaGlzIGlzIGJlY2F1c2Uga2VybmVsIHJlY2VpdmVzICct
JyBpbnN0ZWFkIG9mIHRoZSB3aG9sZSAnLTkwMCcKK2lmIGJ1ZmZlcmluZyBpcyBkaXNhYmxl
ZC4KKworVGhpcyBpcyBsaWJjIGltcGxlbWVudGF0aW9uIHNwZWNpZmljLCBhcyBnbGliYyBk
b2VzIG5vdCBoYXZlIHRoaXMgaXNzdWUuCisKK1Vwc3RyZWFtLVN0YXR1czogSW5hcHByb3By
aWF0ZSBbbXVzbCBzcGVjaWZpY10KKworU2lnbmVkLW9mZi1ieTogQ2hlbiBRaSA8YSBjbGFz
cz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86UWkuQ2hlbkB3aW5kcml2
ZXIuY29tIj4mbHQ7UWkuQ2hlbkB3aW5kcml2ZXIuY29tJmd0OzwvYT4KKy0tLQorIHNyYy9i
YXNpYy9wcm9jZXNzLXV0aWwuYyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL3NyYy9iYXNpYy9wcm9jZXNz
LXV0aWwuYyBiL3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwuYworaW5kZXggMzU0M2JjMDQ1Li5k
MDU3MmUwMzQgMTAwNjQ0CistLS0gYS9zcmMvYmFzaWMvcHJvY2Vzcy11dGlsLmMKKysrKyBi
L3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwuYworQEAgLTE0NzMsNyArMTQ3Myw3IEBAIGludCBz
ZXRfb29tX3Njb3JlX2FkanVzdChpbnQgdmFsdWUpIHsKKyAgICAgICAgIHNwcmludGYodCwg
IiVpIiwgdmFsdWUpOworIAorICAgICAgICAgcmV0dXJuIHdyaXRlX3N0cmluZ19maWxlKCIv
cHJvYy9zZWxmL29vbV9zY29yZV9hZGoiLCB0LAorLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFdSSVRFX1NUUklOR19GSUxFX1ZFUklGWV9PTl9GQUlMVVJFfFdSSVRFX1NU
UklOR19GSUxFX0RJU0FCTEVfQlVGRkVSKTsKKysgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBXUklURV9TVFJJTkdfRklMRV9WRVJJRllfT05fRkFJTFVSRSk7CisgfQorIAor
IHN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBpb3ByaW9fY2xhc3NfdGFibGVbXSA9IHsKKy0t
IAorMi4xMS4wCisKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lz
dGVtZC8wMDI1LURlZmluZS1fUEFUSF9XVE1QWC1hbmQtX1BBVEhfVVRNUFgtaWYtbm90LWRl
ZmluZWQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAyNS1E
ZWZpbmUtX1BBVEhfV1RNUFgtYW5kLV9QQVRIX1VUTVBYLWlmLW5vdC1kZWZpbmVkLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5Mzc2YThmLi4wMDAwMDAwCi0tLSBh
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDI1LURlZmluZS1fUEFUSF9X
VE1QWC1hbmQtX1BBVEhfVVRNUFgtaWYtbm90LWRlZmluZWQucGF0Y2gKKysrIC9kZXYvbnVs
bApAQCAtMSw0MyArMCwwIEBACi1Gcm9tIGEwYjE0OTYzMjJmNGQ3Y2U4M2Y0ZmJmZDJhOTBi
OTFkMDcyMWY2NDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBLaGVtIFJhaiA8
YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1A
Z21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KLURhdGU6IFR1ZSwg
MjQgT2N0IDIwMTcgMjM6MDg6MjQgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSCAyNS8zMV0gRGVm
aW5lIF9QQVRIX1dUTVBYIGFuZCBfUEFUSF9VVE1QWCBpZiBub3QgZGVmaW5lZAotCi1NdXNs
IG5lZWRzIHRoZXNlIGRlZmluZXMKLQotVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCi0KLVNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUi
IGhyZWY9Im1haWx0bzpyYWoua2hlbUBnbWFpbC5jb20iPiZsdDtyYWoua2hlbUBnbWFpbC5j
b20mZ3Q7PC9hPgotLS0tCi0gc3JjL3NoYXJlZC91dG1wLXd0bXAuYyB8IDggKysrKysrKysK
LSAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9zcmMv
c2hhcmVkL3V0bXAtd3RtcC5jIGIvc3JjL3NoYXJlZC91dG1wLXd0bXAuYwotaW5kZXggY2Fi
MWNkNmEyLi5mNWVlZGFjMTggMTAwNjQ0Ci0tLS0gYS9zcmMvc2hhcmVkL3V0bXAtd3RtcC5j
Ci0rKysgYi9zcmMvc2hhcmVkL3V0bXAtd3RtcC5jCi1AQCAtMjgsNiArMjgsNyBAQAotICNp
bmNsdWRlICZsdDtzeXMvdGltZS5oJmd0OwotICNpbmNsdWRlICZsdDtzeXMvdXRzbmFtZS5o
Jmd0OwotICNpbmNsdWRlICZsdDt1bmlzdGQuaCZndDsKLSsjaW5jbHVkZSAmbHQ7dXRtcC5o
Jmd0OwotICNpbmNsdWRlICZsdDt1dG1weC5oJmd0OwotIAotICNpbmNsdWRlICJhbGxvYy11
dGlsLmgiCi1AQCAtNDIsNiArNDMsMTMgQEAKLSAjaW5jbHVkZSAidXRpbC5oIgotICNpbmNs
dWRlICJ1dG1wLXd0bXAuaCIKLSAKLSsjaWYgZGVmaW5lZCBfUEFUSF9VVE1QICZhbXA7JmFt
cDsgIWRlZmluZWQgX1BBVEhfVVRNUFgKLSsjIGRlZmluZSBfUEFUSF9VVE1QWCBfUEFUSF9V
VE1QCi0rI2VuZGlmCi0rI2lmIGRlZmluZWQgX1BBVEhfV1RNUCAmYW1wOyZhbXA7ICFkZWZp
bmVkIF9QQVRIX1dUTVBYCi0rIyBkZWZpbmUgX1BBVEhfV1RNUFggX1BBVEhfV1RNUAotKyNl
bmRpZgotKwotIGludCB1dG1wX2dldF9ydW5sZXZlbChpbnQgKnJ1bmxldmVsLCBpbnQgKnBy
ZXZpb3VzKSB7Ci0gICAgICAgICBzdHJ1Y3QgdXRtcHggKmZvdW5kLCBsb29rdXAgPSB7IC51
dF90eXBlID0gUlVOX0xWTCB9OwotICAgICAgICAgaW50IHI7Ci0tLSAKLTIuMTMuMAotCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAzMi1tZW1m
ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDMyLW1lbWZk
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBmN2NmZDYwLi4wMDAwMDAw
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDMyLW1lbWZkLnBh
dGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjcyICswLDAgQEAKLW1pc3Npbmdfc3lzY2FsbDog
d2hlbiBhZGRpbmcgc3lzY2FsbCByZXBsYWNlbWVudHMsIHVzZSBkaWZmZXJlbnQgbmFtZXMg
KAotCi0jODIyOSkKLQotSW4gbWVzb24uYnVpbGQgd2UgY2hlY2sgdGhhdCBmdW5jdGlvbnMg
YXJlIGF2YWlsYWJsZSB1c2luZzoKLSAgICBtZXNvbi5nZXRfY29tcGlsZXIoJ2MnKS5oYXNf
ZnVuY3Rpb24oJ2ZvbycpCi13aGljaCBjaGVja3MgdGhlIGZvbGxvd2luZzoKLS0gaWYgX19z
dHViX2ZvbyBvciBfX3N0dWJfX19mb28gYXJlIGRlZmluZWQsIHJldHVybiBmYWxzZQotLSBp
ZiBmb28gaXMgZGVjbGFyZWQgKGEgcG9pbnRlciB0byB0aGUgZnVuY3Rpb24gY2FuIGJlIHRh
a2VuKSwgcmV0dXJuIHRydWUKLS0gb3RoZXJ3aXNlIGNoZWNrIGZvciBfX2J1aWx0aW5fbWVt
ZmRfY3JlYXRlCi0KLV9zdHViIGlzIGRvY3VtZW50ZWQgYnkgZ2xpYmMgYXMKLSAgIEl0IGRl
ZmluZXMgYSBzeW1ib2wgJ19fc3R1Yl9GVU5DVElPTicgZm9yIGVhY2ggZnVuY3Rpb24KLSAg
IGluIHRoZSBDIGxpYnJhcnkgd2hpY2ggaXMgYSBzdHViLCBtZWFuaW5nIGl0IHdpbGwgZmFp
bAotICAgZXZlcnkgdGltZSBjYWxsZWQsIHVzdWFsbHkgc2V0dGluZyBlcnJubyB0byBFTk9T
WVMuCi0KLVNvIGlmIF9fc3R1YiBpcyBkZWZpbmVkLCB3ZSBrbm93IHdlIGRvbid0IHdhbnQg
dG8gdXNlIHRoZSBnbGliYyB2ZXJzaW9uLCBidXQKLXRoaXMgZG9lc24ndCB0ZWxsIHVzIGlm
IHRoZSBuYW1lIGl0c2VsZiBpcyBkZWZpbmVkIG9yIG5vdC4gSWYgaXQgX2lzXyBkZWZpbmVk
LAotYW5kIHdlIGRlZmluZSBvdXIgcmVwbGFjZW1lbnQgYXMgYW4gaW5saW5lIHN0YXRpYyBm
dW5jdGlvbiwgd2UgZ2V0IGFuIGVycm9yOgotCi1JbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4v
c3JjL2Jhc2ljL21pc3NpbmcuaDoxMzU4OjAsCi0gICAgICAgICAgICAgICAgIGZyb20gLi4v
c3JjL2Jhc2ljL3V0aWwuaDo0NywKLSAgICAgICAgICAgICAgICAgZnJvbSAuLi9zcmMvYmFz
aWMvY2FsZW5kYXJzcGVjLmg6MjksCi0gICAgICAgICAgICAgICAgIGZyb20gLi4vc3JjL2Jh
c2ljL2NhbGVuZGFyc3BlYy5jOjM0OgotLi4vc3JjL2Jhc2ljL21pc3Npbmdfc3lzY2FsbC5o
OjY1OjE5OiBlcnJvcjogc3RhdGljIGRlY2xhcmF0aW9uIG9mICdtZW1mZF9jcmVhdGUnIGZv
bGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJhdGlvbgotIHN0YXRpYyBpbmxpbmUgaW50IG1lbWZk
X2NyZWF0ZShjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQgZmxhZ3MpIHsKLSAgICAg
ICAgICAgICAgICAgICBefn5+fn5+fn5+fn4KLS4uLi91c3IvaW5jbHVkZS9iaXRzL21tYW4t
c2hhcmVkLmg6NDY6NTogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2YgJ21lbWZkX2Ny
ZWF0ZScgd2FzIGhlcmUKLSBpbnQgbWVtZmRfY3JlYXRlIChjb25zdCBjaGFyICpfX25hbWUs
IHVuc2lnbmVkIGludCBfX2ZsYWdzKSBfX1RIUk9XOwotICAgICBefn5+fn5+fn5+fn4KLQot
VG8gYXZvaWQgdGhpcyBwcm9ibGVtLCBjYWxsIG91ciBpbmxpbmUgZnVuY3Rpb25zIGRpZmZl
cmVudCB0aGFuIGdsaWJjLAotYW5kIHVzZSBhICNkZWZpbmUgdG8gbWFwIHRoZSBvZmZpY2lh
bCBuYW1lIHRvIG91ciByZXBsYWNlbWVudC4KLQotRml4ZXMgIzgwOTkuCi0KLXYyOgotLSB1
c2UgIm1pc3NpbmdfIiBhcyB0aGUgcHJlZml4IGluc3RlYWQgb2YgIl8iCi0KLXYzOgotLSBy
ZWJhc2UgYW5kIHVwZGF0ZSBmb3Igc3RhdHgoKQotCi0gIFVuZm9ydHVuYXRlbHkgInN0YXR4
IiBpcyBhbHNvIHByZXNlbnQgaW4gInN0cnVjdCBzdGF0eCIsIHNvIHRoZSBkZWZpbmUKLSAg
Y2F1c2VzIGlzc3Vlcy4gV29yayBhcm91bmQgdGhpcyBieSB1c2luZyBhIHR5cGVkZWYuCi0K
LUkgY2hlY2tlZCB0aGF0IHN5c3RlbWQgY29tcGlsZXMgd2l0aCBjdXJyZW50IGdsaWJjCi0o
Z2xpYmMtZGV2ZWwtMi4yNi0yNC5mYzI3Lng4Nl82NCkgaWYgSEFWRV9NRU1GRF9DUkVBVEUs
IEhBVkVfR0VUVElELAotSEFWRV9QSVZPVF9ST09ULCBIQVZFX1NFVE5TLCBIQVZFX1JFTkFN
RUFUMiwgSEFWRV9LQ01QLCBIQVZFX0tFWUNUTCwKLUhBVkVfQ09QWV9GSUxFX1JBTkdFLCBI
QVZFX0JQRiwgSEFWRV9TVEFUWCBhcmUgZm9yY2VkIHRvIDAuCi0KLVNldHRpbmcgSEFWRV9O
QU1FX1RPX0hBTkRMRV9BVCB0byAwIGNhdXNlcyBhbiBpc3N1ZSwgYnV0IGl0J3Mgbm90IGJl
Y2F1c2Ugb2YKLXRoZSBkZWZpbmUsIGJ1dCBiZWNhdXNlIG9mIHN0cnVjdCBmaWxlX2hhbmRs
ZS4KLQotCi1iYWNrcG9ydCA8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC81MTg3ZGQyYzQw
M2NhZjkyZDA5ZjM0OTFlNDFmMWNlYjNmMTA0OTFmIj5odHRwczovL2dpdGh1Yi5jb20vc3lz
dGVtZC9zeXN0ZW1kL2NvbW1pdC81MTg3ZGQyYzQwM2NhZjkyZDA5ZjM0OTFlNDFmMWNlYjNm
MTA0OTFmPC9hPgotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7
cmFqLmtoZW1AZ21haWwuY29tJmd0OzwvYT4KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQg
WzxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0aHVi
LmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzgwOTkiPmh0dHBzOi8vZ2l0aHViLmNvbS9z
eXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzgwOTk8L2E+XQotSW5kZXg6IGdpdC9zcmMvYmFzaWMv
bWlzc2luZ19zeXNjYWxsLmgKLT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tLSBnaXQub3JpZy9zcmMvYmFz
aWMvbWlzc2luZ19zeXNjYWxsLmgKLSsrKyBnaXQvc3JjL2Jhc2ljL21pc3Npbmdfc3lzY2Fs
bC5oCi1AQCAtMjYsOSArMjYsMTEgQEAKLSAjaW5jbHVkZSAmbHQ7c3lzL3R5cGVzLmgmZ3Q7
Ci0gCi0gI2lmICFIQVZFX1BJVk9UX1JPT1QKLS1zdGF0aWMgaW5saW5lIGludCBwaXZvdF9y
b290KGNvbnN0IGNoYXIgKm5ld19yb290LCBjb25zdCBjaGFyICpwdXRfb2xkKSB7Ci0rc3Rh
dGljIGlubGluZSBpbnQgbWlzc2luZ19waXZvdF9yb290KGNvbnN0IGNoYXIgKm5ld19yb290
LCBjb25zdCBjaGFyICpwdXRfb2xkKSB7Ci0gICAgICAgICByZXR1cm4gc3lzY2FsbChTWVNf
cGl2b3Rfcm9vdCwgbmV3X3Jvb3QsIHB1dF9vbGQpOwotIH0KLSsKLSsjICBkZWZpbmUgcGl2
b3Rfcm9vdCBtaXNzaW5nX3Bpdm90X3Jvb3QKLSAjZW5kaWYKLSAKLSAjaWYgIUhBVkVfQ0FO
T05JQ0FMSVpFX0ZJTEVfTkFNRQotQEAgLTY4LDcgKzcwLDcgQEAgc3RhdGljIGlubGluZSBj
aGFyICpjYW5vbmljYWxpemVfZmlsZV9uYQotICMgICAgZW5kaWYKLSAjICBlbmRpZgotIAot
LXN0YXRpYyBpbmxpbmUgaW50IG1lbWZkX2NyZWF0ZShjb25zdCBjaGFyICpuYW1lLCB1bnNp
Z25lZCBpbnQgZmxhZ3MpIHsKLStzdGF0aWMgaW5saW5lIGludCBtaXNzaW5nX21lbWZkX2Ny
ZWF0ZShjb25zdCBjaGFyICpuYW1lLCB1bnNpZ25lZCBpbnQgZmxhZ3MpIHsKLSAjICBpZmRl
ZiBfX05SX21lbWZkX2NyZWF0ZQotICAgICAgICAgcmV0dXJuIHN5c2NhbGwoX19OUl9tZW1m
ZF9jcmVhdGUsIG5hbWUsIGZsYWdzKTsKLSAjICBlbHNlCi1AQCAtNzYsNiArNzgsOCBAQCBz
dGF0aWMgaW5saW5lIGludCBtZW1mZF9jcmVhdGUoY29uc3QgY2hhCi0gICAgICAgICByZXR1
cm4gLTE7Ci0gIyAgZW5kaWYKLSB9Ci0rCi0rIyAgZGVmaW5lIG1lbWZkX2NyZWF0ZSBtaXNz
aW5nX21lbWZkX2NyZWF0ZQotICNlbmRpZgotIAotIC8qID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ICov
Ci1AQCAtMTE1LDcgKzExOSw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IG1lbWZkX2NyZWF0ZShj
b25zdCBjaGEKLSAjICAgIGVuZGlmCi0gIyAgZW5kaWYKLSAKLS1zdGF0aWMgaW5saW5lIGlu
dCBnZXRyYW5kb20odm9pZCAqYnVmZmVyLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIGZsYWdz
KSB7Ci0rc3RhdGljIGlubGluZSBpbnQgbWlzc2luZ19nZXRyYW5kb20odm9pZCAqYnVmZmVy
LCBzaXplX3QgY291bnQsIHVuc2lnbmVkIGZsYWdzKSB7Ci0gIyAgaWZkZWYgX19OUl9nZXRy
YW5kb20KLSAgICAgICAgIHJldHVybiBzeXNjYWxsKF9fTlJfZ2V0cmFuZG9tLCBidWZmZXIs
IGNvdW50LCBmbGFncyk7Ci0gIyAgZWxzZQotQEAgLTEyMywxNCArMTI3LDE4IEBAIHN0YXRp
YyBpbmxpbmUgaW50IGdldHJhbmRvbSh2b2lkICpidWZmZXIKLSAgICAgICAgIHJldHVybiAt
MTsKLSAjICBlbmRpZgotIH0KLSsKLSsjICBkZWZpbmUgZ2V0cmFuZG9tIG1pc3NpbmdfZ2V0
cmFuZG9tCi0gI2VuZGlmCi0gCi0gLyogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0gKi8KLSAKLSAjaWYg
IUhBVkVfR0VUVElECi0tc3RhdGljIGlubGluZSBwaWRfdCBnZXR0aWQodm9pZCkgewotK3N0
YXRpYyBpbmxpbmUgcGlkX3QgbWlzc2luZ19nZXR0aWQodm9pZCkgewotICAgICAgICAgcmV0
dXJuIChwaWRfdCkgc3lzY2FsbChTWVNfZ2V0dGlkKTsKLSB9Ci0rCi0rIyAgZGVmaW5lIGdl
dHRpZCBtaXNzaW5nX2dldHRpZAotICNlbmRpZgotIAotIC8qID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
ICovCi1AQCAtMTU4LDcgKzE2Niw3IEBAIHN0cnVjdCBmaWxlX2hhbmRsZSB7Ci0gICAgICAg
ICB1bnNpZ25lZCBjaGFyIGZfaGFuZGxlWzBdOwotIH07Ci0gCi0tc3RhdGljIGlubGluZSBp
bnQgbmFtZV90b19oYW5kbGVfYXQoaW50IGZkLCBjb25zdCBjaGFyICpuYW1lLCBzdHJ1Y3Qg
ZmlsZV9oYW5kbGUgKmhhbmRsZSwgaW50ICptbnRfaWQsIGludCBmbGFncykgewotK3N0YXRp
YyBpbmxpbmUgaW50IG1pc3NpbmdfbmFtZV90b19oYW5kbGVfYXQoaW50IGZkLCBjb25zdCBj
aGFyICpuYW1lLCBzdHJ1Y3QgZmlsZV9oYW5kbGUgKmhhbmRsZSwgaW50ICptbnRfaWQsIGlu
dCBmbGFncykgewotICMgIGlmZGVmIF9fTlJfbmFtZV90b19oYW5kbGVfYXQKLSAgICAgICAg
IHJldHVybiBzeXNjYWxsKF9fTlJfbmFtZV90b19oYW5kbGVfYXQsIGZkLCBuYW1lLCBoYW5k
bGUsIG1udF9pZCwgZmxhZ3MpOwotICMgIGVsc2UKLUBAIC0xNjYsNiArMTc0LDggQEAgc3Rh
dGljIGlubGluZSBpbnQgbmFtZV90b19oYW5kbGVfYXQoaW50Ci0gICAgICAgICByZXR1cm4g
LTE7Ci0gIyAgZW5kaWYKLSB9Ci0rCi0rIyAgZGVmaW5lIG5hbWVfdG9faGFuZGxlX2F0IG1p
c3NpbmdfbmFtZV90b19oYW5kbGVfYXQKLSAjZW5kaWYKLSAKLSAvKiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PSAqLwotQEAgLTE4Myw3ICsxOTMsNyBAQCBzdGF0aWMgaW5saW5lIGludCBuYW1lX3Rv
X2hhbmRsZV9hdChpbnQKLSAjICAgIGVuZGlmCi0gIyAgZW5kaWYKLSAKLS1zdGF0aWMgaW5s
aW5lIGludCBzZXRucyhpbnQgZmQsIGludCBuc3R5cGUpIHsKLStzdGF0aWMgaW5saW5lIGlu
dCBtaXNzaW5nX3NldG5zKGludCBmZCwgaW50IG5zdHlwZSkgewotICMgIGlmZGVmIF9fTlJf
c2V0bnMKLSAgICAgICAgIHJldHVybiBzeXNjYWxsKF9fTlJfc2V0bnMsIGZkLCBuc3R5cGUp
OwotICMgIGVsc2UKLUBAIC0xOTEsNiArMjAxLDggQEAgc3RhdGljIGlubGluZSBpbnQgc2V0
bnMoaW50IGZkLCBpbnQgbnN0eQotICAgICAgICAgcmV0dXJuIC0xOwotICMgIGVuZGlmCi0g
fQotKwotKyMgIGRlZmluZSBzZXRucyBtaXNzaW5nX3NldG5zCi0gI2VuZGlmCi0gCi0gLyog
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0gKi8KLUBAIC0yMzYsNyArMjQ4LDcgQEAgc3RhdGljIGlubGlu
ZSBwaWRfdCByYXdfZ2V0cGlkKHZvaWQpIHsKLSAjICAgIGVuZGlmCi0gIyAgZW5kaWYKLSAK
LS1zdGF0aWMgaW5saW5lIGludCByZW5hbWVhdDIoaW50IG9sZGZkLCBjb25zdCBjaGFyICpv
bGRuYW1lLCBpbnQgbmV3ZmQsIGNvbnN0IGNoYXIgKm5ld25hbWUsIHVuc2lnbmVkIGZsYWdz
KSB7Ci0rc3RhdGljIGlubGluZSBpbnQgbWlzc2luZ19yZW5hbWVhdDIoaW50IG9sZGZkLCBj
b25zdCBjaGFyICpvbGRuYW1lLCBpbnQgbmV3ZmQsIGNvbnN0IGNoYXIgKm5ld25hbWUsIHVu
c2lnbmVkIGZsYWdzKSB7Ci0gIyAgaWZkZWYgX19OUl9yZW5hbWVhdDIKLSAgICAgICAgIHJl
dHVybiBzeXNjYWxsKF9fTlJfcmVuYW1lYXQyLCBvbGRmZCwgb2xkbmFtZSwgbmV3ZmQsIG5l
d25hbWUsIGZsYWdzKTsKLSAjICBlbHNlCi1AQCAtMjQ0LDEyICsyNTYsMTQgQEAgc3RhdGlj
IGlubGluZSBpbnQgcmVuYW1lYXQyKGludCBvbGRmZCwgYwotICAgICAgICAgcmV0dXJuIC0x
OwotICMgIGVuZGlmCi0gfQotKwotKyMgIGRlZmluZSByZW5hbWVhdDIgbWlzc2luZ19yZW5h
bWVhdDIKLSAjZW5kaWYKLSAKLSAvKiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSAqLwotIAotICNpZiAh
SEFWRV9LQ01QCi0tc3RhdGljIGlubGluZSBpbnQga2NtcChwaWRfdCBwaWQxLCBwaWRfdCBw
aWQyLCBpbnQgdHlwZSwgdW5zaWduZWQgbG9uZyBpZHgxLCB1bnNpZ25lZCBsb25nIGlkeDIp
IHsKLStzdGF0aWMgaW5saW5lIGludCBtaXNzaW5nX2tjbXAocGlkX3QgcGlkMSwgcGlkX3Qg
cGlkMiwgaW50IHR5cGUsIHVuc2lnbmVkIGxvbmcgaWR4MSwgdW5zaWduZWQgbG9uZyBpZHgy
KSB7Ci0gIyAgaWZkZWYgX19OUl9rY21wCi0gICAgICAgICByZXR1cm4gc3lzY2FsbChfX05S
X2tjbXAsIHBpZDEsIHBpZDIsIHR5cGUsIGlkeDEsIGlkeDIpOwotICMgIGVsc2UKLUBAIC0y
NTcsMzYgKzI3MSw0NCBAQCBzdGF0aWMgaW5saW5lIGludCBrY21wKHBpZF90IHBpZDEsIHBp
ZF90Ci0gICAgICAgICByZXR1cm4gLTE7Ci0gIyAgZW5kaWYKLSB9Ci0rCi0rIyAgZGVmaW5l
IGtjbXAgbWlzc2luZ19rY21wCi0gI2VuZGlmCi0gCi0gLyogPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0g
Ki8KLSAKLSAjaWYgIUhBVkVfS0VZQ1RMCi0tc3RhdGljIGlubGluZSBsb25nIGtleWN0bChp
bnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywgdW5zaWdu
ZWQgbG9uZyBhcmc0LHVuc2lnbmVkIGxvbmcgYXJnNSkgewotK3N0YXRpYyBpbmxpbmUgbG9u
ZyBtaXNzaW5nX2tleWN0bChpbnQgY21kLCB1bnNpZ25lZCBsb25nIGFyZzIsIHVuc2lnbmVk
IGxvbmcgYXJnMywgdW5zaWduZWQgbG9uZyBhcmc0LHVuc2lnbmVkIGxvbmcgYXJnNSkgewot
ICMgIGlmZGVmIF9fTlJfa2V5Y3RsCi0gICAgICAgICByZXR1cm4gc3lzY2FsbChfX05SX2tl
eWN0bCwgY21kLCBhcmcyLCBhcmczLCBhcmc0LCBhcmc1KTsKLSAjICBlbHNlCi0gICAgICAg
ICBlcnJubyA9IEVOT1NZUzsKLSAgICAgICAgIHJldHVybiAtMTsKLSAjICBlbmRpZgotKwot
KyMgIGRlZmluZSBrZXljdGwgbWlzc2luZ19rZXljdGwKLSB9Ci0gCi0tc3RhdGljIGlubGlu
ZSBrZXlfc2VyaWFsX3QgYWRkX2tleShjb25zdCBjaGFyICp0eXBlLCBjb25zdCBjaGFyICpk
ZXNjcmlwdGlvbiwgY29uc3Qgdm9pZCAqcGF5bG9hZCwgc2l6ZV90IHBsZW4sIGtleV9zZXJp
YWxfdCByaW5naWQpIHsKLStzdGF0aWMgaW5saW5lIGtleV9zZXJpYWxfdCBtaXNzaW5nX2Fk
ZF9rZXkoY29uc3QgY2hhciAqdHlwZSwgY29uc3QgY2hhciAqZGVzY3JpcHRpb24sIGNvbnN0
IHZvaWQgKnBheWxvYWQsIHNpemVfdCBwbGVuLCBrZXlfc2VyaWFsX3QgcmluZ2lkKSB7Ci0g
IyAgaWZkZWYgX19OUl9hZGRfa2V5Ci0gICAgICAgICByZXR1cm4gc3lzY2FsbChfX05SX2Fk
ZF9rZXksIHR5cGUsIGRlc2NyaXB0aW9uLCBwYXlsb2FkLCBwbGVuLCByaW5naWQpOwotICMg
IGVsc2UKLSAgICAgICAgIGVycm5vID0gRU5PU1lTOwotICAgICAgICAgcmV0dXJuIC0xOwot
ICMgIGVuZGlmCi0rCi0rIyAgZGVmaW5lIGFkZF9rZXkgbWlzc2luZ19hZGRfa2V5Ci0gfQot
IAotLXN0YXRpYyBpbmxpbmUga2V5X3NlcmlhbF90IHJlcXVlc3Rfa2V5KGNvbnN0IGNoYXIg
KnR5cGUsIGNvbnN0IGNoYXIgKmRlc2NyaXB0aW9uLCBjb25zdCBjaGFyICogY2FsbG91dF9p
bmZvLCBrZXlfc2VyaWFsX3QgZGVzdHJpbmdpZCkgewotK3N0YXRpYyBpbmxpbmUga2V5X3Nl
cmlhbF90IG1pc3NpbmdfcmVxdWVzdF9rZXkoY29uc3QgY2hhciAqdHlwZSwgY29uc3QgY2hh
ciAqZGVzY3JpcHRpb24sIGNvbnN0IGNoYXIgKiBjYWxsb3V0X2luZm8sIGtleV9zZXJpYWxf
dCBkZXN0cmluZ2lkKSB7Ci0gIyAgaWZkZWYgX19OUl9yZXF1ZXN0X2tleQotICAgICAgICAg
cmV0dXJuIHN5c2NhbGwoX19OUl9yZXF1ZXN0X2tleSwgdHlwZSwgZGVzY3JpcHRpb24sIGNh
bGxvdXRfaW5mbywgZGVzdHJpbmdpZCk7Ci0gIyAgZWxzZQotICAgICAgICAgZXJybm8gPSBF
Tk9TWVM7Ci0gICAgICAgICByZXR1cm4gLTE7Ci0gIyAgZW5kaWYKLSsKLSsjICBkZWZpbmUg
cmVxdWVzdF9rZXkgbWlzc2luZ19yZXF1ZXN0X2tleQotIH0KLSAjZW5kaWYKLSAKLUBAIC0z
MTMsMTAgKzMzNSwxMCBAQCBzdGF0aWMgaW5saW5lIGtleV9zZXJpYWxfdCByZXF1ZXN0X2tl
eShjCi0gIyAgICBlbmRpZgotICMgIGVuZGlmCi0gCi0tc3RhdGljIGlubGluZSBzc2l6ZV90
IGNvcHlfZmlsZV9yYW5nZShpbnQgZmRfaW4sIGxvZmZfdCAqb2ZmX2luLAotLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGZkX291dCwgbG9mZl90ICpvZmZf
b3V0LAotLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IGxl
biwKLS0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBmbGFncykgewotK3N0YXRpYyBpbmxpbmUgc3NpemVfdCBtaXNzaW5nX2NvcHlfZmlsZV9y
YW5nZShpbnQgZmRfaW4sIGxvZmZfdCAqb2ZmX2luLAotKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgZmRfb3V0LCBsb2ZmX3QgKm9mZl9vdXQs
Ci0rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVf
dCBsZW4sCi0rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBmbGFncykgewotICMgIGlmZGVmIF9fTlJfY29weV9maWxlX3Jhbmdl
Ci0gICAgICAgICByZXR1cm4gc3lzY2FsbChfX05SX2NvcHlfZmlsZV9yYW5nZSwgZmRfaW4s
IG9mZl9pbiwgZmRfb3V0LCBvZmZfb3V0LCBsZW4sIGZsYWdzKTsKLSAjICBlbHNlCi1AQCAt
MzI0LDYgKzM0Niw4IEBAIHN0YXRpYyBpbmxpbmUgc3NpemVfdCBjb3B5X2ZpbGVfcmFuZ2Uo
aW4KLSAgICAgICAgIHJldHVybiAtMTsKLSAjICBlbmRpZgotIH0KLSsKLSsjICBkZWZpbmUg
Y29weV9maWxlX3JhbmdlIG1pc3NpbmdfY29weV9maWxlX3JhbmdlCi0gI2VuZGlmCi0gCi0g
LyogPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT0gKi8KLUBAIC0zNTEsNyArMzc1LDcgQEAgc3RhdGljIGlu
bGluZSBzc2l6ZV90IGNvcHlfZmlsZV9yYW5nZShpbgotIAotIHVuaW9uIGJwZl9hdHRyOwot
IAotLXN0YXRpYyBpbmxpbmUgaW50IGJwZihpbnQgY21kLCB1bmlvbiBicGZfYXR0ciAqYXR0
ciwgc2l6ZV90IHNpemUpIHsKLStzdGF0aWMgaW5saW5lIGludCBtaXNzaW5nX2JwZihpbnQg
Y21kLCB1bmlvbiBicGZfYXR0ciAqYXR0ciwgc2l6ZV90IHNpemUpIHsKLSAjaWZkZWYgX19O
Ul9icGYKLSAgICAgICAgIHJldHVybiAoaW50KSBzeXNjYWxsKF9fTlJfYnBmLCBjbWQsIGF0
dHIsIHNpemUpOwotICNlbHNlCi1AQCAtMzYwLDYgKzM4NCw3IEBAIHN0YXRpYyBpbmxpbmUg
aW50IGJwZihpbnQgY21kLCB1bmlvbiBicGYKLSAjZW5kaWYKLSB9Ci0gCi0rIyAgZGVmaW5l
IGJwZiBtaXNzaW5nX2JwZgotICNlbmRpZgotIAotIC8qID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09ICov
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAzMy1i
YXNpYy1tYWNyb3MtcmVuYW1lLW5vcmV0dXJuLWludG8tX25vcmV0dXJuXy04NDU2LnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzMtYmFzaWMtbWFjcm9z
LXJlbmFtZS1ub3JldHVybi1pbnRvLV9ub3JldHVybl8tODQ1Ni5wYXRjaApkZWxldGVkIGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggNTk2NDdiMi4uMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lw
ZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvMDAzMy1iYXNpYy1tYWNyb3MtcmVuYW1lLW5vcmV0
dXJuLWludG8tX25vcmV0dXJuXy04NDU2LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjAz
ICswLDAgQEAKLUZyb20gODQ4ZTg2M2FjYzUxZWNmYjBmMzk1NWM0OTg4NzQ1ODgyMDFkOTEz
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEZyYW5jayBCdWkgPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmZidWlAc3VzZS5jb20iPiZs
dDtmYnVpQHN1c2UuY29tJmd0OzwvYT4KLURhdGU6IFRodSwgMTUgTWFyIDIwMTggMDY6MjM6
NDYgKzAxMDAKLVN1YmplY3Q6IFtQQVRDSF0gYmFzaWMvbWFjcm9zOiByZW5hbWUgbm9yZXR1
cm4gaW50byBfbm9yZXR1cm5fICgjODQ1NikKLU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50
LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKLUNvbnRlbnQtVHJhbnNmZXItRW5j
b2Rpbmc6IDhiaXQKLQotIm5vcmV0dXJuIiBpcyByZXNlcnZlZCBhbmQgY2FuIGJlIHVzZWQg
aW4gb3RoZXIgaGVhZGVyIGZpbGVzIHdlIGluY2x1ZGU6Ci0KLSAgWyAgIDE2c10gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIC91c3IvaW5jbHVkZS9nY3J5cHQuaDozMDowLAotICBbICAgMTZz
XSAgICAgICAgICAgICAgICAgIGZyb20gLi4vc3JjL2pvdXJuYWwvam91cm5hbC1maWxlLmg6
MjYsCi0gIFsgICAxNnNdICAgICAgICAgICAgICAgICAgZnJvbSAuLi9zcmMvam91cm5hbC9q
b3VybmFsLXZhY3V1bS5jOjMxOgotICBbICAgMTZzXSAvdXNyL2luY2x1ZGUvZ3BnLWVycm9y
Lmg6MTU0NDo0NjogZXJyb3I6IGV4cGVjdGVkIOKAmCzigJkgb3Ig4oCYO+KAmSBiZWZvcmUg
4oCYKeKAmSB0b2tlbgotICBbICAgMTZzXSAgdm9pZCBncGdydF9sb2dfYnVnIChjb25zdCBj
aGFyICpmbXQsIC4uLikgICAgR1BHUlRfQVRUUl9OUl9QUklOVEYoMSwyKTsKLQotSGVyZSB3
ZSBpbmNsdWRlIGdyY3J5cHQuaCAod2hpY2ggaW4gdHVybnMgaW5jbHVkZSBncGctZXJyb3Iu
aCkgKmFmdGVyKiB3ZQotIm5vcmV0dXJuIiB3YXMgZGVmaW5lZCBpbiBtYWNyby5oLgotLS0t
Ci0gc3JjL2Jhc2ljL2xvZy5jICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQot
IHNyYy9iYXNpYy9sb2cuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KLSBz
cmMvYmFzaWMvbWFjcm8uaCAgICAgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKysrKyst
LS0tLS0tLS0tCi0gc3JjL2Jhc2ljL3Byb2Nlc3MtdXRpbC5jICAgICAgICAgICAgICAgIHwg
IDIgKy0KLSBzcmMvYmFzaWMvcHJvY2Vzcy11dGlsLmggICAgICAgICAgICAgICAgfCAgMiAr
LQotIHNyYy9jb3JlL21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0K
LSBzcmMvam91cm5hbC90ZXN0LWpvdXJuYWwtaW50ZXJsZWF2aW5nLmMgfCAgMiArLQotIHNy
Yy9zaGFyZWQvcGFnZXIuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCi0gc3JjL3Vk
ZXYvY29sbGVjdC9jb2xsZWN0LmMgICAgICAgICAgICAgIHwgIDIgKy0KLSA5IGZpbGVzIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQotCi1VcHN0cmVhbS1T
dGF0dXM6IEJhY2twb3J0IFs8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL3B1bGwvODQ1NiI+aHR0cHM6
Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzg0NTY8L2E+XQotCi1kaWZmIC0t
Z2l0IGEvc3JjL2Jhc2ljL2xvZy5jIGIvc3JjL2Jhc2ljL2xvZy5jCi1pbmRleCA3YTdmMmNi
ZWMuLjE2YTI0MzFjNSAxMDA2NDQKLS0tLSBhL3NyYy9iYXNpYy9sb2cuYwotKysrIGIvc3Jj
L2Jhc2ljL2xvZy5jCi1AQCAtODE0LDcgKzgxNCw3IEBAIHN0YXRpYyB2b2lkIGxvZ19hc3Nl
cnQoCi0gICAgICAgICBsb2dfZGlzcGF0Y2hfaW50ZXJuYWwobGV2ZWwsIDAsIGZpbGUsIGxp
bmUsIGZ1bmMsIE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwsIGJ1ZmZlcik7Ci0gfQotIAotLW5v
cmV0dXJuIHZvaWQgbG9nX2Fzc2VydF9mYWlsZWRfcmVhbG0oCi0rX25vcmV0dXJuXyB2b2lk
IGxvZ19hc3NlcnRfZmFpbGVkX3JlYWxtKAotICAgICAgICAgICAgICAgICBMb2dSZWFsbSBy
ZWFsbSwKLSAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqdGV4dCwKLSAgICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqZmlsZSwKLUBAIC04MjYsNyArODI2LDcgQEAgbm9yZXR1cm4g
dm9pZCBsb2dfYXNzZXJ0X2ZhaWxlZF9yZWFsbSgKLSAgICAgICAgIGFib3J0KCk7Ci0gfQot
IAotLW5vcmV0dXJuIHZvaWQgbG9nX2Fzc2VydF9mYWlsZWRfdW5yZWFjaGFibGVfcmVhbG0o
Ci0rX25vcmV0dXJuXyB2b2lkIGxvZ19hc3NlcnRfZmFpbGVkX3VucmVhY2hhYmxlX3JlYWxt
KAotICAgICAgICAgICAgICAgICBMb2dSZWFsbSByZWFsbSwKLSAgICAgICAgICAgICAgICAg
Y29uc3QgY2hhciAqdGV4dCwKLSAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqZmlsZSwK
LWRpZmYgLS1naXQgYS9zcmMvYmFzaWMvbG9nLmggYi9zcmMvYmFzaWMvbG9nLmgKLWluZGV4
IGVmY2YwZjFiZi4uMzE0YmUxMjhhIDEwMDY0NAotLS0tIGEvc3JjL2Jhc2ljL2xvZy5oCi0r
KysgYi9zcmMvYmFzaWMvbG9nLmgKLUBAIC0xODYsNyArMTg2LDcgQEAgaW50IGxvZ19kdW1w
X2ludGVybmFsKAotICAgICAgICAgICAgICAgICBjaGFyICpidWZmZXIpOwotIAotIC8qIExv
Z2dpbmcgZm9yIHZhcmlvdXMgYXNzZXJ0aW9ucyAqLwotLW5vcmV0dXJuIHZvaWQgbG9nX2Fz
c2VydF9mYWlsZWRfcmVhbG0oCi0rX25vcmV0dXJuXyB2b2lkIGxvZ19hc3NlcnRfZmFpbGVk
X3JlYWxtKAotICAgICAgICAgICAgICAgICBMb2dSZWFsbSByZWFsbSwKLSAgICAgICAgICAg
ICAgICAgY29uc3QgY2hhciAqdGV4dCwKLSAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
ZmlsZSwKLUBAIC0xOTUsNyArMTk1LDcgQEAgbm9yZXR1cm4gdm9pZCBsb2dfYXNzZXJ0X2Zh
aWxlZF9yZWFsbSgKLSAjZGVmaW5lIGxvZ19hc3NlcnRfZmFpbGVkKHRleHQsIC4uLikgXAot
ICAgICAgICAgbG9nX2Fzc2VydF9mYWlsZWRfcmVhbG0oTE9HX1JFQUxNLCAodGV4dCksIF9f
VkFfQVJHU19fKQotIAotLW5vcmV0dXJuIHZvaWQgbG9nX2Fzc2VydF9mYWlsZWRfdW5yZWFj
aGFibGVfcmVhbG0oCi0rX25vcmV0dXJuXyB2b2lkIGxvZ19hc3NlcnRfZmFpbGVkX3VucmVh
Y2hhYmxlX3JlYWxtKAotICAgICAgICAgICAgICAgICBMb2dSZWFsbSByZWFsbSwKLSAgICAg
ICAgICAgICAgICAgY29uc3QgY2hhciAqdGV4dCwKLSAgICAgICAgICAgICAgICAgY29uc3Qg
Y2hhciAqZmlsZSwKLWRpZmYgLS1naXQgYS9zcmMvYmFzaWMvbWFjcm8uaCBiL3NyYy9iYXNp
Yy9tYWNyby5oCi1pbmRleCA5NWJlNjNhMjAuLjg5MTFlZGZjNCAxMDA2NDQKLS0tLSBhL3Ny
Yy9iYXNpYy9tYWNyby5oCi0rKysgYi9zcmMvYmFzaWMvbWFjcm8uaAotQEAgLTUzLDYgKzUz
LDE1IEBACi0gI2Vsc2UKLSAjZGVmaW5lIF9mYWxsdGhyb3VnaF8KLSAjZW5kaWYKLSsvKiBE
ZWZpbmUgQzExIG5vcmV0dXJuIHdpdGhvdXQgJmx0O3N0ZG5vcmV0dXJuLmgmZ3Q7IGFuZCBl
dmVuIG9uIG9sZGVyIGdjYwotKyAqIGNvbXBpbGVyIHZlcnNpb25zICovCi0rI2lmbmRlZiBf
bm9yZXR1cm5fCi0rI2lmIF9fU1REQ19WRVJTSU9OX18gJmd0Oz0gMjAxMTEyTAotKyNkZWZp
bmUgX25vcmV0dXJuXyBfTm9yZXR1cm4KLSsjZWxzZQotKyNkZWZpbmUgX25vcmV0dXJuXyBf
X2F0dHJpYnV0ZV9fKChub3JldHVybikpCi0rI2VuZGlmCi0rI2VuZGlmCi0gCi0gLyogVGVt
cG9yYXJpbHkgZGlzYWJsZSBzb21lIHdhcm5pbmdzICovCi0gI2RlZmluZSBESVNBQkxFX1dB
Uk5JTkdfREVDTEFSQVRJT05fQUZURVJfU1RBVEVNRU5UICAgICAgICAgICAgICAgICAgICAg
XAotQEAgLTQxNCwxNiArNDIzLDYgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIEFM
SUdOX1BPV0VSMih1bnNpZ25lZCBsb25nIHUpIHsKLSAjZW5kaWYKLSAjZW5kaWYKLSAKLS0v
KiBEZWZpbmUgQzExIG5vcmV0dXJuIHdpdGhvdXQgJmx0O3N0ZG5vcmV0dXJuLmgmZ3Q7IGFu
ZCBldmVuIG9uIG9sZGVyIGdjYwotLSAqIGNvbXBpbGVyIHZlcnNpb25zICovCi0tI2lmbmRl
ZiBub3JldHVybgotLSNpZiBfX1NURENfVkVSU0lPTl9fICZndDs9IDIwMTExMkwKLS0jZGVm
aW5lIG5vcmV0dXJuIF9Ob3JldHVybgotLSNlbHNlCi0tI2RlZmluZSBub3JldHVybiBfX2F0
dHJpYnV0ZV9fKChub3JldHVybikpCi0tI2VuZGlmCi0tI2VuZGlmCi0tCi0gI2RlZmluZSBE
RUZJTkVfVFJJVklBTF9DTEVBTlVQX0ZVTkModHlwZSwgZnVuYykgICAgICAgICAgICAgICAg
IFwKLSAgICAgICAgIHN0YXRpYyBpbmxpbmUgdm9pZCBmdW5jIyNwKHR5cGUgKnApIHsgICAg
ICAgICAgICAgICAgICAgXAotICAgICAgICAgICAgICAgICBpZiAoKnApICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCi1kaWZmIC0tZ2l0IGEvc3JjL2Jhc2lj
L3Byb2Nlc3MtdXRpbC5jIGIvc3JjL2Jhc2ljL3Byb2Nlc3MtdXRpbC5jCi1pbmRleCBhYTk4
NDZkYjUuLmU2MTIwYWY1YiAxMDA2NDQKLS0tLSBhL3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwu
YwotKysrIGIvc3JjL2Jhc2ljL3Byb2Nlc3MtdXRpbC5jCi1AQCAtOTg3LDcgKzk4Nyw3IEBA
IGJvb2wgaXNfbWFpbl90aHJlYWQodm9pZCkgewotICAgICAgICAgcmV0dXJuIGNhY2hlZCAm
Z3Q7IDA7Ci0gfQotIAotLW5vcmV0dXJuIHZvaWQgZnJlZXplKHZvaWQpIHsKLStfbm9yZXR1
cm5fIHZvaWQgZnJlZXplKHZvaWQpIHsKLSAKLSAgICAgICAgIGxvZ19jbG9zZSgpOwotIAot
ZGlmZiAtLWdpdCBhL3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwuaCBiL3NyYy9iYXNpYy9wcm9j
ZXNzLXV0aWwuaAotaW5kZXggOTMwMjllMzZlLi41MTcwYWRlYzcgMTAwNjQ0Ci0tLS0gYS9z
cmMvYmFzaWMvcHJvY2Vzcy11dGlsLmgKLSsrKyBiL3NyYy9iYXNpYy9wcm9jZXNzLXV0aWwu
aAotQEAgLTkxLDcgKzkxLDcgQEAgaW50IHBpZF9mcm9tX3NhbWVfcm9vdF9mcyhwaWRfdCBw
aWQpOwotIAotIGJvb2wgaXNfbWFpbl90aHJlYWQodm9pZCk7Ci0gCi0tbm9yZXR1cm4gdm9p
ZCBmcmVlemUodm9pZCk7Ci0rX25vcmV0dXJuXyB2b2lkIGZyZWV6ZSh2b2lkKTsKLSAKLSBi
b29sIG9vbV9zY29yZV9hZGp1c3RfaXNfdmFsaWQoaW50IG9hKTsKLSAKLWRpZmYgLS1naXQg
YS9zcmMvY29yZS9tYWluLmMgYi9zcmMvY29yZS9tYWluLmMKLWluZGV4IDA3Njg0NmE0MS4u
NGIyZDE0OTIzIDEwMDY0NAotLS0tIGEvc3JjL2NvcmUvbWFpbi5jCi0rKysgYi9zcmMvY29y
ZS9tYWluLmMKLUBAIC0xNDEsNyArMTQxLDcgQEAgc3RhdGljIHVpbnQ2NF90IGFyZ19kZWZh
dWx0X3Rhc2tzX21heCA9IFVJTlQ2NF9NQVg7Ci0gc3RhdGljIHNkX2lkMTI4X3QgYXJnX21h
Y2hpbmVfaWQgPSB7fTsKLSBzdGF0aWMgRW1lcmdlbmN5QWN0aW9uIGFyZ19jYWRfYnVyc3Rf
YWN0aW9uID0gRU1FUkdFTkNZX0FDVElPTl9SRUJPT1RfRk9SQ0U7Ci0gCi0tbm9yZXR1cm4g
c3RhdGljIHZvaWQgZnJlZXplX29yX3JlYm9vdCh2b2lkKSB7Ci0rX25vcmV0dXJuXyBzdGF0
aWMgdm9pZCBmcmVlemVfb3JfcmVib290KHZvaWQpIHsKLSAKLSAgICAgICAgIGlmIChhcmdf
Y3Jhc2hfcmVib290KSB7Ci0gICAgICAgICAgICAgICAgIGxvZ19ub3RpY2UoIlJlYm9vdGlu
ZyBpbiAxMHMuLi48YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWls
dG86KTstQEAtMTU2LDcrMTU2LDdAQG5vcmV0dXJuc3RhdGljdm9pZGZyZWV6ZV9vcl9yZWJv
b3Qodm9pZCl7LWZyZWV6ZSgpOy19LS0tbm9yZXR1cm5zdGF0aWN2b2lkY3Jhc2goaW50c2ln
KXstK19ub3JldHVybl9zdGF0aWN2b2lkY3Jhc2goaW50c2lnKXstc3RydWN0c2lnYWN0aW9u
c2E7LXBpZF90cGlkOy0tZGlmZi0tZ2l0YS9zcmMvam91cm5hbC90ZXN0LWpvdXJuYWwtaW50
ZXJsZWF2aW5nLmNiL3NyYy9qb3VybmFsL3Rlc3Qtam91cm5hbC1pbnRlcmxlYXZpbmcuYy1p
bmRleDVhODhiMjc3NC4uZDg3YmRiZGQzMTAwNjQ0LS0tLWEvc3JjL2pvdXJuYWwvdGVzdC1q
b3VybmFsLWludGVybGVhdmluZy5jLSsrK2Ivc3JjL2pvdXJuYWwvdGVzdC1qb3VybmFsLWlu
dGVybGVhdmluZy5jLUBALTM3LDcrMzcsN0BALS1zdGF0aWNib29sYXJnX2tlZXA9ZmFsc2U7
LS0tbm9yZXR1cm5zdGF0aWN2b2lkbG9nX2Fzc2VydF9lcnJubyhjb25zdGNoYXIqdGV4dCxp
bnRlcnJvcixjb25zdGNoYXIqZmlsZSxpbnRsaW5lLGNvbnN0Y2hhcipmdW5jKXstK19ub3Jl
dHVybl9zdGF0aWN2b2lkbG9nX2Fzc2VydF9lcnJubyhjb25zdGNoYXIqdGV4dCxpbnRlcnJv
cixjb25zdGNoYXIqZmlsZSxpbnRsaW5lLGNvbnN0Y2hhcipmdW5jKXstbG9nX2ludGVybmFs
KExPR19DUklULGVycm9yLGZpbGUsbGluZSxmdW5jLC0iPiIpOwotQEAgLTE1Niw3ICsxNTYs
NyBAQCBub3JldHVybiBzdGF0aWMgdm9pZCBmcmVlemVfb3JfcmVib290KHZvaWQpIHsKLSAg
ICAgICAgIGZyZWV6ZSgpOwotIH0KLSAKLS1ub3JldHVybiBzdGF0aWMgdm9pZCBjcmFzaChp
bnQgc2lnKSB7Ci0rX25vcmV0dXJuXyBzdGF0aWMgdm9pZCBjcmFzaChpbnQgc2lnKSB7Ci0g
ICAgICAgICBzdHJ1Y3Qgc2lnYWN0aW9uIHNhOwotICAgICAgICAgcGlkX3QgcGlkOwotIAot
ZGlmZiAtLWdpdCBhL3NyYy9qb3VybmFsL3Rlc3Qtam91cm5hbC1pbnRlcmxlYXZpbmcuYyBi
L3NyYy9qb3VybmFsL3Rlc3Qtam91cm5hbC1pbnRlcmxlYXZpbmcuYwotaW5kZXggNWE4OGIy
Nzc0Li5kODdiZGJkZDMgMTAwNjQ0Ci0tLS0gYS9zcmMvam91cm5hbC90ZXN0LWpvdXJuYWwt
aW50ZXJsZWF2aW5nLmMKLSsrKyBiL3NyYy9qb3VybmFsL3Rlc3Qtam91cm5hbC1pbnRlcmxl
YXZpbmcuYwotQEAgLTM3LDcgKzM3LDcgQEAKLSAKLSBzdGF0aWMgYm9vbCBhcmdfa2VlcCA9
IGZhbHNlOwotIAotLW5vcmV0dXJuIHN0YXRpYyB2b2lkIGxvZ19hc3NlcnRfZXJybm8oY29u
c3QgY2hhciAqdGV4dCwgaW50IGVycm9yLCBjb25zdCBjaGFyICpmaWxlLCBpbnQgbGluZSwg
Y29uc3QgY2hhciAqZnVuYykgewotK19ub3JldHVybl8gc3RhdGljIHZvaWQgbG9nX2Fzc2Vy
dF9lcnJubyhjb25zdCBjaGFyICp0ZXh0LCBpbnQgZXJyb3IsIGNvbnN0IGNoYXIgKmZpbGUs
IGludCBsaW5lLCBjb25zdCBjaGFyICpmdW5jKSB7Ci0gICAgICAgICBsb2dfaW50ZXJuYWwo
TE9HX0NSSVQsIGVycm9yLCBmaWxlLCBsaW5lLCBmdW5jLAotICAgICAgICAgICAgICAgICAg
ICAgICI8L2E+JyVzJyBmYWlsZWQgYXQgJXM6JXUgKCVzKTogJW0iLCB0ZXh0LCBmaWxlLCBs
aW5lLCBmdW5jKTsKLSAgICAgICAgIGFib3J0KCk7Ci1kaWZmIC0tZ2l0IGEvc3JjL3NoYXJl
ZC9wYWdlci5jIGIvc3JjL3NoYXJlZC9wYWdlci5jCi1pbmRleCA3NWRiM2M5ODUuLjY4MWFm
OWM0MCAxMDA2NDQKLS0tLSBhL3NyYy9zaGFyZWQvcGFnZXIuYwotKysrIGIvc3JjL3NoYXJl
ZC9wYWdlci5jCi1AQCAtNDcsNyArNDcsNyBAQCBzdGF0aWMgaW50IHN0b3JlZF9zdGRlcnIg
PSAtMTsKLSBzdGF0aWMgYm9vbCBzdGRvdXRfcmVkaXJlY3RlZCA9IGZhbHNlOwotIHN0YXRp
YyBib29sIHN0ZGVycl9yZWRpcmVjdGVkID0gZmFsc2U7Ci0gCi0tbm9yZXR1cm4gc3RhdGlj
IHZvaWQgcGFnZXJfZmFsbGJhY2sodm9pZCkgewotK19ub3JldHVybl8gc3RhdGljIHZvaWQg
cGFnZXJfZmFsbGJhY2sodm9pZCkgewotICAgICAgICAgaW50IHI7Ci0gCi0gICAgICAgICBy
ID0gY29weV9ieXRlcyhTVERJTl9GSUxFTk8sIFNURE9VVF9GSUxFTk8sICh1aW50NjRfdCkg
LTEsIDApOwotZGlmZiAtLWdpdCBhL3NyYy91ZGV2L2NvbGxlY3QvY29sbGVjdC5jIGIvc3Jj
L3VkZXYvY29sbGVjdC9jb2xsZWN0LmMKLWluZGV4IDI4MjE2NDBlOS4uYzhmYTQ3YjNkIDEw
MDY0NAotLS0tIGEvc3JjL3VkZXYvY29sbGVjdC9jb2xsZWN0LmMKLSsrKyBiL3NyYy91ZGV2
L2NvbGxlY3QvY29sbGVjdC5jCi1AQCAtNTgsNyArNTgsNyBAQCBzdGF0aWMgaW5saW5lIHN0
cnVjdCBfbWF0ZSAqbm9kZV90b19tYXRlKHN0cnVjdCB1ZGV2X2xpc3Rfbm9kZSAqbm9kZSkK
LSAgICAgICAgIHJldHVybiBjb250YWluZXJfb2Yobm9kZSwgc3RydWN0IF9tYXRlLCBub2Rl
KTsKLSB9Ci0gCi0tbm9yZXR1cm4gc3RhdGljIHZvaWQgc2lnX2Fscm0oaW50IHNpZ25vKQot
K19ub3JldHVybl8gc3RhdGljIHZvaWQgc2lnX2Fscm0oaW50IHNpZ25vKQotIHsKLSAgICAg
ICAgIGV4aXQoNCk7Ci0gfQotLS0gCi0yLjE3LjAKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzQtRml4LWZvcm1hdC10cnVuY2F0aW9uLWNv
bXBpbGUtZmFpbHVyZS1ieS10eXBlY2FzdGluZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3Jl
L3N5c3RlbWQvc3lzdGVtZC8wMDM0LUZpeC1mb3JtYXQtdHJ1bmNhdGlvbi1jb21waWxlLWZh
aWx1cmUtYnktdHlwZWNhc3RpbmcucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IGU1NjA2MWYuLjAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9z
eXN0ZW1kLzAwMzQtRml4LWZvcm1hdC10cnVuY2F0aW9uLWNvbXBpbGUtZmFpbHVyZS1ieS10
eXBlY2FzdGluZy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDE3MyArMCwwIEBACi1Gcm9t
IGMyYjNlYmUxMTJlYmZkOWY5ZTgyZmIxNTMxZWUyMjVjMzE1MmNhODMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBQYXRyaWNrIFVpdGVyd2lqayA8YSBjbGFzcz0ibW96LXR4
dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cGF0cmlja0BwdWl0ZXJ3aWprLm9yZyI+
Jmx0O3BhdHJpY2tAcHVpdGVyd2lqay5vcmcmZ3Q7PC9hPgotRGF0ZTogVGh1LCAyMiBGZWIg
MjAxOCAxOTo0MTozMCArMDEwMAotU3ViamVjdDogW1BBVENIXSBGaXggZm9ybWF0LXRydW5j
YXRpb24gY29tcGlsZSBmYWlsdXJlIGJ5IHR5cGVjYXN0aW5nIFVTQiBJRHMKLSAoIzgyNTAp
Ci0KLVRoaXMgcGF0Y2ggYWRkcyBzYWZlX2F0b3V4MTYgZm9yIHBhcnNpbmcgYW4gdW5zaWdu
ZWQgaGV4YWRlY2ltYWwgMTZiaXQgaW50LCBhbmQKLXVzZXMgdGhhdCBmb3IgcGFyc2luZyBV
U0IgZGV2aWNlIGFuZCB2ZW5kb3IgSURzLgotCi1UaGlzIGZpeGVzIGEgY29tcGlsZSBlcnJv
ciB3aXRoIGdjYy04IGJlY2F1c2Ugd2hpbGUgd2Uga25vdyB0aGF0IFVTQiBJRHMgYXJlIDIg
Ynl0ZXMsCi10aGUgY29tcGlsZXIgZG9lcyBub3Qga25vdyB0aGF0LgotCi0uLi9zcmMvdWRl
di91ZGV2LWJ1aWx0aW4taHdkYi5jOjgwOjM4OiBlcnJvcjogJyUwNFgnIGRpcmVjdGl2ZSBv
dXRwdXQgbWF5IGJlCi10cnVuY2F0ZWQgd3JpdGluZyBiZXR3ZWVuIDQgYW5kIDggYnl0ZXMg
aW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4gMiBhbmQgNgotWy1XZXJyb3I9Zm9ybWF0
LXRydW5jYXRpb249XQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFs8YSBjbGFzcz0i
bW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vc3lzdGVt
ZC9zeXN0ZW1kL2NvbW1pdC81NTQ3YzEyNTAzYTY4MzI5MGVhZWQ0Nzk1NGZmY2ZiMmQxYmMw
M2NkIj5odHRwczovL2dpdGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC81NTQ3YzEy
NTAzYTY4MzI5MGVhZWQ0Nzk1NGZmY2ZiMmQxYmMwM2NkPC9hPl0KLQotU2lnbmVkLW9mZi1i
eTogQWRhbSBXaWxsaWFtc29uIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhy
ZWY9Im1haWx0bzphd2lsbGlhbUByZWRoYXQuY29tIj4mbHQ7YXdpbGxpYW1AcmVkaGF0LmNv
bSZndDs8L2E+Ci1TaWduZWQtb2ZmLWJ5OiBQYXRyaWNrIFVpdGVyd2lqayA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cHVpdGVyd2lqa0ByZWRoYXQu
Y29tIj4mbHQ7cHVpdGVyd2lqa0ByZWRoYXQuY29tJmd0OzwvYT4KLS0tLQotIHNyYy9iYXNp
Yy9wYXJzZS11dGlsLmMgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrCi0gc3Jj
L2Jhc2ljL3BhcnNlLXV0aWwuaCAgICAgICB8ICAyICsrCi0gc3JjL3Rlc3QvdGVzdC1wYXJz
ZS11dGlsLmMgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwot
IHNyYy91ZGV2L3VkZXYtYnVpbHRpbi1od2RiLmMgfCAxMyArKysrKystLS0tLS0KLSA0IGZp
bGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCi0KLWRpZmYg
LS1naXQgYS9zcmMvYmFzaWMvcGFyc2UtdXRpbC5jIGIvc3JjL2Jhc2ljL3BhcnNlLXV0aWwu
YwotaW5kZXggOTc1MzM3MjFkLi5mZjNmYzI5OGEgMTAwNjQ0Ci0tLS0gYS9zcmMvYmFzaWMv
cGFyc2UtdXRpbC5jCi0rKysgYi9zcmMvYmFzaWMvcGFyc2UtdXRpbC5jCi1AQCAtNTMyLDYg
KzUzMiwzMCBAQCBpbnQgc2FmZV9hdG9pMTYoY29uc3QgY2hhciAqcywgaW50MTZfdCAqcmV0
KSB7Ci0gICAgICAgICByZXR1cm4gMDsKLSB9Ci0gCi0raW50IHNhZmVfYXRvdXgxNihjb25z
dCBjaGFyICpzLCB1aW50MTZfdCAqcmV0KSB7Ci0rICAgICAgICBjaGFyICp4ID0gTlVMTDsK
LSsgICAgICAgIHVuc2lnbmVkIGxvbmcgbDsKLSsKLSsgICAgICAgIGFzc2VydChzKTsKLSsg
ICAgICAgIGFzc2VydChyZXQpOwotKwotKyAgICAgICAgcyArPSBzdHJzcG4ocywgV0hJVEVT
UEFDRSk7Ci0rCi0rICAgICAgICBlcnJubyA9IDA7Ci0rICAgICAgICBsID0gc3RydG91bChz
LCAmYW1wO3gsIDE2KTsKLSsgICAgICAgIGlmIChlcnJubyAmZ3Q7IDApCi0rICAgICAgICAg
ICAgICAgIHJldHVybiAtZXJybm87Ci0rICAgICAgICBpZiAoIXggfHwgeCA9PSBzIHx8ICp4
ICE9IDApCi0rICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwotKyAgICAgICAgaWYg
KHNbMF0gPT0gJy0nKQotKyAgICAgICAgICAgICAgICByZXR1cm4gLUVSQU5HRTsKLSsgICAg
ICAgIGlmICgodW5zaWduZWQgbG9uZykgKHVpbnQxNl90KSBsICE9IGwpCi0rICAgICAgICAg
ICAgICAgIHJldHVybiAtRVJBTkdFOwotKwotKyAgICAgICAgKnJldCA9ICh1aW50MTZfdCkg
bDsKLSsgICAgICAgIHJldHVybiAwOwotK30KLSsKLSBpbnQgc2FmZV9hdG9kKGNvbnN0IGNo
YXIgKnMsIGRvdWJsZSAqcmV0X2QpIHsKLSAgICAgICAgIF9jbGVhbnVwXyhmcmVlbG9jYWxl
cCkgbG9jYWxlX3QgbG9jID0gKGxvY2FsZV90KSAwOwotICAgICAgICAgY2hhciAqeCA9IE5V
TEw7Ci1kaWZmIC0tZ2l0IGEvc3JjL2Jhc2ljL3BhcnNlLXV0aWwuaCBiL3NyYy9iYXNpYy9w
YXJzZS11dGlsLmgKLWluZGV4IDFlZGExZDdmOS4uNzI3NDIyMDU2IDEwMDY0NAotLS0tIGEv
c3JjL2Jhc2ljL3BhcnNlLXV0aWwuaAotKysrIGIvc3JjL2Jhc2ljL3BhcnNlLXV0aWwuaAot
QEAgLTU0LDYgKzU0LDggQEAgaW50IHNhZmVfYXRvdTgoY29uc3QgY2hhciAqcywgdWludDhf
dCAqcmV0KTsKLSBpbnQgc2FmZV9hdG91MTYoY29uc3QgY2hhciAqcywgdWludDE2X3QgKnJl
dCk7Ci0gaW50IHNhZmVfYXRvaTE2KGNvbnN0IGNoYXIgKnMsIGludDE2X3QgKnJldCk7Ci0g
Ci0raW50IHNhZmVfYXRvdXgxNihjb25zdCBjaGFyICpzLCB1aW50MTZfdCAqcmV0KTsKLSsK
LSBzdGF0aWMgaW5saW5lIGludCBzYWZlX2F0b3UzMihjb25zdCBjaGFyICpzLCB1aW50MzJf
dCAqcmV0X3UpIHsKLSAgICAgICAgIGFzc2VydF9jYyhzaXplb2YodWludDMyX3QpID09IHNp
emVvZih1bnNpZ25lZCkpOwotICAgICAgICAgcmV0dXJuIHNhZmVfYXRvdShzLCAodW5zaWdu
ZWQqKSByZXRfdSk7Ci1kaWZmIC0tZ2l0IGEvc3JjL3Rlc3QvdGVzdC1wYXJzZS11dGlsLmMg
Yi9zcmMvdGVzdC90ZXN0LXBhcnNlLXV0aWwuYwotaW5kZXggOTM3NTAwMjEzLi5hOTljZWE1
YTEgMTAwNjQ0Ci0tLS0gYS9zcmMvdGVzdC90ZXN0LXBhcnNlLXV0aWwuYwotKysrIGIvc3Jj
L3Rlc3QvdGVzdC1wYXJzZS11dGlsLmMKLUBAIC00NjgsNiArNDY4LDQ0IEBAIHN0YXRpYyB2
b2lkIHRlc3Rfc2FmZV9hdG9pMTYodm9pZCkgewotICAgICAgICAgYXNzZXJ0X3NlKHIgPT0g
LUVJTlZBTCk7Ci0gfQotIAotK3N0YXRpYyB2b2lkIHRlc3Rfc2FmZV9hdG91eDE2KHZvaWQp
IHsKLSsgICAgICAgIGludCByOwotKyAgICAgICAgdWludDE2X3QgbDsKLSsKLSsgICAgICAg
IHIgPSBzYWZlX2F0b3V4MTYoIjEyMzQiLCAmYW1wO2wpOwotKyAgICAgICAgYXNzZXJ0X3Nl
KHIgPT0gMCk7Ci0rICAgICAgICBhc3NlcnRfc2UobCA9PSAweDEyMzQpOwotKwotKyAgICAg
ICAgciA9IHNhZmVfYXRvdXgxNigiYWJjZCIsICZhbXA7bCk7Ci0rICAgICAgICBhc3NlcnRf
c2UociA9PSAwKTsKLSsgICAgICAgIGFzc2VydF9zZShsID09IDB4YWJjZCk7Ci0rCi0rICAg
ICAgICByID0gc2FmZV9hdG91eDE2KCIgIDEyMzQiLCAmYW1wO2wpOwotKyAgICAgICAgYXNz
ZXJ0X3NlKHIgPT0gMCk7Ci0rICAgICAgICBhc3NlcnRfc2UobCA9PSAweDEyMzQpOwotKwot
KyAgICAgICAgciA9IHNhZmVfYXRvdXgxNigiMTIzNDUiLCAmYW1wO2wpOwotKyAgICAgICAg
YXNzZXJ0X3NlKHIgPT0gLUVSQU5HRSk7Ci0rCi0rICAgICAgICByID0gc2FmZV9hdG91eDE2
KCItMSIsICZhbXA7bCk7Ci0rICAgICAgICBhc3NlcnRfc2UociA9PSAtRVJBTkdFKTsKLSsK
LSsgICAgICAgIHIgPSBzYWZlX2F0b3V4MTYoIiAgLTEiLCAmYW1wO2wpOwotKyAgICAgICAg
YXNzZXJ0X3NlKHIgPT0gLUVSQU5HRSk7Ci0rCi0rICAgICAgICByID0gc2FmZV9hdG91eDE2
KCJqdW5rIiwgJmFtcDtsKTsKLSsgICAgICAgIGFzc2VydF9zZShyID09IC1FSU5WQUwpOwot
KwotKyAgICAgICAgciA9IHNhZmVfYXRvdXgxNigiMTIzeCIsICZhbXA7bCk7Ci0rICAgICAg
ICBhc3NlcnRfc2UociA9PSAtRUlOVkFMKTsKLSsKLSsgICAgICAgIHIgPSBzYWZlX2F0b3V4
MTYoIjEyLjMiLCAmYW1wO2wpOwotKyAgICAgICAgYXNzZXJ0X3NlKHIgPT0gLUVJTlZBTCk7
Ci0rCi0rICAgICAgICByID0gc2FmZV9hdG91eDE2KCIiLCAmYW1wO2wpOwotKyAgICAgICAg
YXNzZXJ0X3NlKHIgPT0gLUVJTlZBTCk7Ci0rfQotKwotIHN0YXRpYyB2b2lkIHRlc3Rfc2Fm
ZV9hdG91NjQodm9pZCkgewotICAgICAgICAgaW50IHI7Ci0gICAgICAgICB1aW50NjRfdCBs
OwotQEAgLTc0NSw2ICs3ODMsNyBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqYXJndltd
KSB7Ci0gICAgICAgICB0ZXN0X3NhZmVfYXRvbGxpKCk7Ci0gICAgICAgICB0ZXN0X3NhZmVf
YXRvdTE2KCk7Ci0gICAgICAgICB0ZXN0X3NhZmVfYXRvaTE2KCk7Ci0rICAgICAgICB0ZXN0
X3NhZmVfYXRvdXgxNigpOwotICAgICAgICAgdGVzdF9zYWZlX2F0b3U2NCgpOwotICAgICAg
ICAgdGVzdF9zYWZlX2F0b2k2NCgpOwotICAgICAgICAgdGVzdF9zYWZlX2F0b2QoKTsKLWRp
ZmYgLS1naXQgYS9zcmMvdWRldi91ZGV2LWJ1aWx0aW4taHdkYi5jIGIvc3JjL3VkZXYvdWRl
di1idWlsdGluLWh3ZGIuYwotaW5kZXggY2E3ZjdjMjMwLi5kYmZlMDI0MjkgMTAwNjQ0Ci0t
LS0gYS9zcmMvdWRldi91ZGV2LWJ1aWx0aW4taHdkYi5jCi0rKysgYi9zcmMvdWRldi91ZGV2
LWJ1aWx0aW4taHdkYi5jCi1AQCAtMjcsNiArMjcsNyBAQAotIAotICNpbmNsdWRlICJhbGxv
Yy11dGlsLmgiCi0gI2luY2x1ZGUgImh3ZGItdXRpbC5oIgotKyNpbmNsdWRlICJwYXJzZS11
dGlsLmgiCi0gI2luY2x1ZGUgInN0cmluZy11dGlsLmgiCi0gI2luY2x1ZGUgInVkZXYtdXRp
bC5oIgotICNpbmNsdWRlICJ1ZGV2LmgiCi1AQCAtNjMsNyArNjQsNyBAQCBpbnQgdWRldl9i
dWlsdGluX2h3ZGJfbG9va3VwKHN0cnVjdCB1ZGV2X2RldmljZSAqZGV2LAotIAotIHN0YXRp
YyBjb25zdCBjaGFyICptb2RhbGlhc191c2Ioc3RydWN0IHVkZXZfZGV2aWNlICpkZXYsIGNo
YXIgKnMsIHNpemVfdCBzaXplKSB7Ci0gICAgICAgICBjb25zdCBjaGFyICp2LCAqcDsKLS0g
ICAgICAgIGludCB2biwgcG47Ci0rICAgICAgICB1aW50MTZfdCB2biwgcG47Ci0gCi0gICAg
ICAgICB2ID0gdWRldl9kZXZpY2VfZ2V0X3N5c2F0dHJfdmFsdWUoZGV2LCAiaWRWZW5kb3Ii
KTsKLSAgICAgICAgIGlmICghdikKLUBAIC03MSwxMiArNzIsMTAgQEAgc3RhdGljIGNvbnN0
IGNoYXIgKm1vZGFsaWFzX3VzYihzdHJ1Y3QgdWRldl9kZXZpY2UgKmRldiwgY2hhciAqcywg
c2l6ZV90IHNpemUpIHsKLSAgICAgICAgIHAgPSB1ZGV2X2RldmljZV9nZXRfc3lzYXR0cl92
YWx1ZShkZXYsICJpZFByb2R1Y3QiKTsKLSAgICAgICAgIGlmICghcCkKLSAgICAgICAgICAg
ICAgICAgcmV0dXJuIE5VTEw7Ci0tICAgICAgICB2biA9IHN0cnRvbCh2LCBOVUxMLCAxNik7
Ci0tICAgICAgICBpZiAodm4gJmx0Oz0gMCkKLS0gICAgICAgICAgICAgICAgcmV0dXJuIE5V
TEw7Ci0tICAgICAgICBwbiA9IHN0cnRvbChwLCBOVUxMLCAxNik7Ci0tICAgICAgICBpZiAo
cG4gJmx0Oz0gMCkKLS0gICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Ci0rICAgICAgICBp
ZiAoc2FmZV9hdG91eDE2KHYsICZhbXA7dm4pICZsdDsgMCkKLSsJCXJldHVybiBOVUxMOwot
KyAgICAgICAgaWYgKHNhZmVfYXRvdXgxNihwLCAmYW1wO3BuKSAmbHQ7IDApCi0rCQlyZXR1
cm4gTlVMTDsKLSAgICAgICAgIHNucHJpbnRmKHMsIHNpemUsICJ1c2I6diUwNFhwJTA0WCoi
LCB2biwgcG4pOwotICAgICAgICAgcmV0dXJuIHM7Ci0gfQotLS0gCi0yLjE3LjAKLQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzYtdGltZS11
dGlsLWZpeC1idWlsZC13aXRoLWdjYzgtV2Vycm9yLWZvcm1hdC10cnVuY2F0aS5wYXRjaCBi
L21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC8wMDM2LXRpbWUtdXRpbC1maXgt
YnVpbGQtd2l0aC1nY2M4LVdlcnJvci1mb3JtYXQtdHJ1bmNhdGkucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IGZjYzdjNTAuLjAwMDAwMDAKLS0tIGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLzAwMzYtdGltZS11dGlsLWZpeC1idWlsZC13aXRo
LWdjYzgtV2Vycm9yLWZvcm1hdC10cnVuY2F0aS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0x
LDUzICswLDAgQEAKLUZyb20gZjlmZDQ1NDZjMjVhMTU2Mjk1NDRiYzQ2NDJhNzRkNzkwOWNj
MDg0MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hcnRpbiBKYW5zYSA8YSBj
bGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86TWFydGluLkphbnNh
QGdtYWlsLmNvbSI+Jmx0O01hcnRpbi5KYW5zYUBnbWFpbC5jb20mZ3Q7PC9hPgotRGF0ZTog
RnJpLCAxIEp1biAyMDE4IDE1OjIyOjI4ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIHRpbWUt
dXRpbDogZml4IGJ1aWxkIHdpdGggZ2NjOCAtV2Vycm9yPWZvcm1hdC10cnVuY2F0aW9uPQot
Ci0qIGl0IGZhaWxzIHdpdGggZ2NjOCB3aGVuIC1PMSBvciAtT3MgaXMgdXNlZCAoYW5kIC1m
dHJlZS12cnAgd2hpY2ggaXMgYWRkZWQgYnkgLU8yIGFuZCBoaWdoZXIgaXNuJ3QgdXNlZCkK
LQotLi4vZ2l0L3NyYy9iYXNpYy90aW1lLXV0aWwuYzogSW4gZnVuY3Rpb24gJ2Zvcm1hdF90
aW1lc3Bhbic6Ci0uLi9naXQvc3JjL2Jhc2ljL3RpbWUtdXRpbC5jOjUwODo0NjogZXJyb3I6
ICclMCpsbHUnIGRpcmVjdGl2ZSBvdXRwdXQgYmV0d2VlbiAxIGFuZCAyMTQ3NDgzNjQ3IGJ5
dGVzIG1heSBjYXVzZSByZXN1bHQgdG8gZXhjZWVkICdJTlRfTUFYJyBbLVdlcnJvcj1mb3Jt
YXQtdHJ1bmNhdGlvbj1dCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIiVzIlVTRUNfRk1UIi4lMCoiUFJJX1VTRUMiJXMiLAotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn4KLS4uL2dpdC9zcmMvYmFz
aWMvdGltZS11dGlsLmM6NTA4OjYwOiBub3RlOiBmb3JtYXQgc3RyaW5nIGlzIGRlZmluZWQg
aGVyZQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIl
cyJVU0VDX0ZNVCIuJTAqIlBSSV9VU0VDIiVzIiwKLS4uL2dpdC9zcmMvYmFzaWMvdGltZS11
dGlsLmM6NTA4OjQ2OiBub3RlOiBkaXJlY3RpdmUgYXJndW1lbnQgaW4gdGhlIHJhbmdlIFsw
LCAxODQ0Njc0NDA3MzcwOTU1MTYxNF0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAiJXMiVVNFQ19GTVQiLiUwKiJQUklfVVNFQyIlcyIsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fgotLi4vZ2l0
L3NyYy9iYXNpYy90aW1lLXV0aWwuYzo1MDc6Mzc6IG5vdGU6ICdzbnByaW50Zicgb3V0cHV0
IDQgb3IgbW9yZSBieXRlcyAoYXNzdW1pbmcgMjE0NzQ4MzY1MSkgaW50byBhIGRlc3RpbmF0
aW9uIG9mIHNpemUgNDI5NDk2NzI5NQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgayA9IHNucHJpbnRmKHAsIGwsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fn4KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiJXMiVVNFQ19GTVQiLiUwKiJQUklfVVNFQyIlcyIsCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fgotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHAgJmd0OyBidWYgPyAiICIgOiAiIiwKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+Ci0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYSwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fgotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGosCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfn4KLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBiLAotICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIH5+Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdGFibGVbaV0uc3VmZml4KTsKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+Ci1jYzE6IHNvbWUg
d2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKLQotVXBzdHJlYW0tU3RhdHVzOiBT
dWJtaXR0ZWQgPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6
Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzkxNTYiPmh0dHBzOi8vZ2l0aHVi
LmNvbS9zeXN0ZW1kL3N5c3RlbWQvcHVsbC85MTU2PC9hPgotCi1TaWduZWQtb2ZmLWJ5OiBN
YXJ0aW4gSmFuc2EgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFp
bHRvOk1hcnRpbi5KYW5zYUBnbWFpbC5jb20iPiZsdDtNYXJ0aW4uSmFuc2FAZ21haWwuY29t
Jmd0OzwvYT4KLS0tLQotIHNyYy9iYXNpYy90aW1lLXV0aWwuYyB8IDIgKy0KLSAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBh
L3NyYy9iYXNpYy90aW1lLXV0aWwuYyBiL3NyYy9iYXNpYy90aW1lLXV0aWwuYwotaW5kZXgg
MDYwMWQ0ZmE5Li5kYjVhOWNkNzggMTAwNjQ0Ci0tLS0gYS9zcmMvYmFzaWMvdGltZS11dGls
LmMKLSsrKyBiL3NyYy9iYXNpYy90aW1lLXV0aWwuYwotQEAgLTQ4NCw3ICs0ODQsNyBAQCBj
aGFyICpmb3JtYXRfdGltZXNwYW4oY2hhciAqYnVmLCBzaXplX3QgbCwgdXNlY190IHQsIHVz
ZWNfdCBhY2N1cmFjeSkgewotICAgICAgICAgICAgICAgICAvKiBMZXQncyBzZWUgaWYgd2Ug
c2hvdWxkIHNob3dzIHRoaXMgaW4gZG90IG5vdGF0aW9uICovCi0gICAgICAgICAgICAgICAg
IGlmICh0ICZsdDsgVVNFQ19QRVJfTUlOVVRFICZhbXA7JmFtcDsgYiAmZ3Q7IDApIHsKLSAg
ICAgICAgICAgICAgICAgICAgICAgICB1c2VjX3QgY2M7Ci0tICAgICAgICAgICAgICAgICAg
ICAgICAgaW50IGo7Ci0rICAgICAgICAgICAgICAgICAgICAgICAgc2lnbmVkIGNoYXIgajsK
LSAKLSAgICAgICAgICAgICAgICAgICAgICAgICBqID0gMDsKLSAgICAgICAgICAgICAgICAg
ICAgICAgICBmb3IgKGNjID0gdGFibGVbaV0udXNlYzsgY2MgJmd0OyAxOyBjYyAvPSAxMCkK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC9saWJtb3Vu
dC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC9saWJtb3VudC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjU5ZDViNy4uMDAwMDAwMAot
LS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQvbGlibW91bnQucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw3NSArMCwwIEBACi1VcHN0cmVhbS1TdGF0dXM6IEJhY2tw
b3J0Ci1TaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJtYWlsdG86cm9zcy5idXJ0b25AaW50ZWwuY29tIj4mbHQ7cm9z
cy5idXJ0b25AaW50ZWwuY29tJmd0OzwvYT4KLQotRnJvbSAyMjdiOGE3NjJmZWExNDU4NTQ3
YmUyY2RmMGU2ZTRhYWMwMDc5NzMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTog
TWljaGFlbCBPbGJyaWNoIDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzptLm9sYnJpY2hAcGVuZ3V0cm9uaXguZGUiPiZsdDttLm9sYnJpY2hAcGVuZ3V0
cm9uaXguZGUmZ3Q7PC9hPgotRGF0ZTogTW9uLCAyNiBNYXIgMjAxOCAxNzozNDo1MyArMDIw
MAotU3ViamVjdDogW1BBVENIXSBjb3JlOiBkb24ndCBpbmNsdWRlIGxpYm1vdW50LmggaW4g
YSBoZWFkZXIgZmlsZSAoIzg1ODApCi0KLWxpbnV4L2ZzLmggc3lzL21vdW50LmgsIGxpYm1v
dW50LmggYW5kIG1pc3NpbmcuaCBhbGwgaW5jbHVkZSBNU18qCi1kZWZpbml0aW9ucy4KLQot
VG8gYXZvaWQgcHJvYmxlbXMsIG9ubHkgb25lIG9mIGxpbnV4L2ZzLmgsIHN5cy9tb3VudC5o
IGFuZCBsaWJtb3VudC5oCi1zaG91bGQgYmUgaW5jbHVkZWQuIEFuZCBtaXNzaW5nLmggbXVz
dCBiZSBpbmNsdWRlZCBsYXN0LgotCi1XaXRob3V0IHRoaXMsIGJ1aWxkaW5nIHN5c3RlbWQg
bWF5IGZhaWwgd2l0aDoKLQotSW4gZmlsZSBpbmNsdWRlZCBmcm9tIFsuLi5dL2xpYm1vdW50
L2xpYm1vdW50Lmg6MzE6MCwKLSAgICAgICAgICAgICAgICAgZnJvbSAuLi9zeXN0ZW1kLTIz
OC9zcmMvY29yZS9tYW5hZ2VyLmg6MjMsCi0gICAgICAgICAgICAgICAgIGZyb20gLi4vc3lz
dGVtZC0yMzgvc3JjL2NvcmUvZW1lcmdlbmN5LWFjdGlvbi5oOjM3LAotICAgICAgICAgICAg
ICAgICBmcm9tIC4uL3N5c3RlbWQtMjM4L3NyYy9jb3JlL3VuaXQuaDozNCwKLSAgICAgICAg
ICAgICAgICAgZnJvbSAuLi9zeXN0ZW1kLTIzOC9zcmMvY29yZS9kYnVzLXRpbWVyLmg6MjUs
Ci0gICAgICAgICAgICAgICAgIGZyb20gLi4vc3lzdGVtZC0yMzgvc3JjL2NvcmUvdGltZXIu
YzoyNjoKLVsuLi5dL3N5cy9tb3VudC5oOjU3OjI6IGVycm9yOiBleHBlY3RlZCBpZGVudGlm
aWVyIGJlZm9yZSBudW1lcmljIGNvbnN0YW50Ci0tLS0KLSBzcmMvY29yZS9kYnVzLWV4ZWN1
dGUuYyB8IDEgKwotIHNyYy9jb3JlL21hbmFnZXIuaCAgICAgIHwgMyArKy0KLSBzcmMvY29y
ZS9tb3VudC5jICAgICAgICB8IDIgKysKLSAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL2NvcmUvZGJ1cy1leGVj
dXRlLmMgYi9zcmMvY29yZS9kYnVzLWV4ZWN1dGUuYwotaW5kZXggNzM0NDYyM2ViZjYuLmMz
NDIwOTNiY2E0IDEwMDY0NAotLS0tIGEvc3JjL2NvcmUvZGJ1cy1leGVjdXRlLmMKLSsrKyBi
L3NyYy9jb3JlL2RidXMtZXhlY3V0ZS5jCi1AQCAtMTgsNiArMTgsNyBAQAotICAgYWxvbmcg
d2l0aCBzeXN0ZW1kOyBJZiBub3QsIHNlZSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvIj4mbHQ7aHR0cDovL3d3
dy5nbnUub3JnL2xpY2Vuc2VzLyZndDs8L2E+LgotICoqKi8KLSAKLSsjaW5jbHVkZSAmbHQ7
c3lzL21vdW50LmgmZ3Q7Ci0gI2luY2x1ZGUgJmx0O3N5cy9wcmN0bC5oJmd0OwotICNpbmNs
dWRlICZsdDtzdGRpb19leHQuaCZndDsKLSAKLWRpZmYgLS1naXQgYS9zcmMvY29yZS9tYW5h
Z2VyLmggYi9zcmMvY29yZS9tYW5hZ2VyLmgKLWluZGV4IDI4YzVkYTIyNWIxLi5lMDllMGNk
ZjVlOSAxMDA2NDQKLS0tLSBhL3NyYy9jb3JlL21hbmFnZXIuaAotKysrIGIvc3JjL2NvcmUv
bWFuYWdlci5oCi1AQCAtMjAsNyArMjAsNiBAQAotICAgYWxvbmcgd2l0aCBzeXN0ZW1kOyBJ
ZiBub3QsIHNlZSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvIj4mbHQ7aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzLyZndDs8L2E+LgotICoqKi8KLSAKLS0jaW5jbHVkZSAmbHQ7bGlibW91bnQuaCZndDsK
LSAjaW5jbHVkZSAmbHQ7c3RkYm9vbC5oJmd0OwotICNpbmNsdWRlICZsdDtzdGRpby5oJmd0
OwotIAotQEAgLTM0LDYgKzMzLDggQEAKLSAjaW5jbHVkZSAibGlzdC5oIgotICNpbmNsdWRl
ICJyYXRlbGltaXQuaCIKLSAKLStzdHJ1Y3QgbGlibW50X21vbml0b3I7Ci0rCi0gLyogRW5m
b3JjZSB1cHBlciBsaW1pdCBob3cgbWFueSBuYW1lcyB3ZSBhbGxvdyAqLwotICNkZWZpbmUg
TUFOQUdFUl9NQVhfTkFNRVMgMTMxMDcyIC8qIDEyOEsgKi8KLSAKLWRpZmYgLS1naXQgYS9z
cmMvY29yZS9tb3VudC5jIGIvc3JjL2NvcmUvbW91bnQuYwotaW5kZXggMGU3NTVkYTVjMDIu
LjAxNTRlYmRhNWQ2IDEwMDY0NAotLS0tIGEvc3JjL2NvcmUvbW91bnQuYwotKysrIGIvc3Jj
L2NvcmUvbW91bnQuYwotQEAgLTIzLDYgKzIzLDggQEAKLSAjaW5jbHVkZSAmbHQ7c3RkaW8u
aCZndDsKLSAjaW5jbHVkZSAmbHQ7c3lzL2Vwb2xsLmgmZ3Q7Ci0gCi0rI2luY2x1ZGUgJmx0
O2xpYm1vdW50LmgmZ3Q7Ci0rCi0gI2luY2x1ZGUgInNkLW1lc3NhZ2VzLmgiCi0gCi0gI2lu
Y2x1ZGUgImFsbG9jLXV0aWwuaCIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3N5
c3RlbWQvc3lzdGVtZF8yMzcuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3Rl
bWRfMjM5LmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1jb3JlL3N5c3RlbWQvc3lzdGVtZF8yMzcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZF8yMzkuYmIKaW5kZXggM2VmY2EzMy4uNGNmYjNiZSAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzIzNy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjM5LmJiCkBAIC00LDcgKzQs
NyBAQCBQUk9WSURFUyA9ICJ1ZGV2IgogCiBQRSA9ICIxIgogCi1ERVBFTkRTID0gImttb2Qg
aW50bHRvb2wtbmF0aXZlIGdwZXJmLW5hdGl2ZSBhY2wgcmVhZGxpbmUgbGliY2FwIGxpYmNn
cm91cCB1dGlsLWxpbnV4IgorREVQRU5EUyA9ICJpbnRsdG9vbC1uYXRpdmUgZ3BlcmYtbmF0
aXZlIGxpYmNhcCB1dGlsLWxpbnV4IgogCiBTRUNUSU9OID0gImJhc2Uvc2hlbGwiCiAKQEAg
LTE3LDQ3ICsxNyw0MSBAQCBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAic3lzdGVtZCIK
IFNSQ19VUkkgKz0gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0iZmls
ZTovL3RvdWNoc2NyZWVuLnJ1bGVzXGZpbGU6Ly8wMC1jcmVhdGUtdm9sYXRpbGUuY29uZlxm
aWxlOi8vaW5pdFwtZmlsZTovLzAwMDEtSGlkZS1fX3N0YXJ0X0JVU19FUlJPUl9NQVAtYW5k
LV9fc3RvcF9CVVNfRVJST1JfTUFQLnBhdGNoXC1maWxlOi8vMDAwMS1Vc2UtZ2V0ZW52LXdo
ZW4tc2VjdXJlLXZlcnNpb25zLWFyZS1ub3QtYXZhaWxhYmxlLnBhdGNoXC1maWxlOi8vMDAw
Mi1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWluc3RhbGwtdGlt
LnBhdGNoXC1maWxlOi8vMDAwMy11c2UtbG5yLXdyYXBwZXItaW5zdGVhZC1vZi1sb29raW5n
LWZvci1yZWxhdGl2ZS1vcHRpLnBhdGNoXC1maWxlOi8vMDAwNC1pbXBsbWVudC1zeXN0ZW1k
LXN5c3YtaW5zdGFsbC1mb3ItT0UucGF0Y2hcLWZpbGU6Ly8wMDA1LXJ1bGVzLXdoaXRlbGlz
dC1oZC1kZXZpY2VzLnBhdGNoXC1maWxlOi8vMDAwNi1NYWtlLXJvb3Qtcy1ob21lLWRpcmVj
dG9yeS1jb25maWd1cmFibGUucGF0Y2hcLWZpbGU6Ly8wMDA3LVJldmVydC1ydWxlcy1yZW1v
dmUtZmlybXdhcmUtbG9hZGluZy1ydWxlcy5wYXRjaFwtZmlsZTovLzAwMDgtUmV2ZXJ0LXVk
ZXYtcmVtb3ZlLXVzZXJzcGFjZS1maXJtd2FyZS1sb2FkaW5nLXN1cHBvci5wYXRjaFwtZmls
ZTovLzAwMDktcmVtb3ZlLWR1cGxpY2F0ZS1pbmNsdWRlLXVjaGFyLmgucGF0Y2hcLWZpbGU6
Ly8wMDEwLWNoZWNrLWZvci11Y2hhci5oLWluLW1lc29uLmJ1aWxkLnBhdGNoXC1maWxlOi8v
MDAxMS1zb2NrZXQtdXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBwb3J0LUlE
Ti5wYXRjaFwtZmlsZTovLzAwMTItcnVsZXMtd2F0Y2gtbWV0YWRhdGEtY2hhbmdlcy1pbi1p
ZGUtZGV2aWNlcy5wYXRjaFwtZmlsZTovLzAwMTMtYWRkLWZhbGxiYWNrLXBhcnNlX3ByaW50
Zl9mb3JtYXQtaW1wbGVtZW50YXRpb24ucGF0Y2hcLWZpbGU6Ly8wMDE0LXNyYy1iYXNpYy1t
aXNzaW5nLmgtY2hlY2stZm9yLW1pc3Npbmctc3RybmR1cGEucGF0Y2hcLWZpbGU6Ly8wMDE1
LWRvbi10LWZhaWwtaWYtR0xPQl9CUkFDRS1hbmQtR0xPQl9BTFRESVJGVU5DLWlzLW5vdC0u
cGF0Y2hcLWZpbGU6Ly8wMDE2LXNyYy1iYXNpYy1taXNzaW5nLmgtY2hlY2stZm9yLW1pc3Np
bmctX19jb21wYXJfZm5fdC0ucGF0Y2hcLWZpbGU6Ly8wMDE3LUluY2x1ZGUtbmV0aW5ldC1p
Zl9ldGhlci5oLnBhdGNoXC1maWxlOi8vMDAxOC1jaGVjay1mb3ItbWlzc2luZy1jYW5vbmlj
YWxpemVfZmlsZV9uYW1lLnBhdGNoXC1maWxlOi8vMDAxOS1Eby1ub3QtZW5hYmxlLW5zcy10
ZXN0cy1pZi1uc3Mtc3lzdGVtZC1pcy1ub3QtZW5hYmxlLnBhdGNoXC1maWxlOi8vMDAyMC10
ZXN0LWhleGRlY29jdC5jLUluY2x1ZGUtbWlzc2luZy5oLWZvci1zdHJuZHVwYS5wYXRjaFwt
ZmlsZTovLzAwMjEtdGVzdC1zaXplb2YuYy1EaXNhYmxlLXRlc3RzLWZvci1taXNzaW5nLXR5
cGVkZWZzLWluLS5wYXRjaFwtZmlsZTovLzAwMjItZG9uLXQtdXNlLWdsaWJjLXNwZWNpZmlj
LXFzb3J0X3IucGF0Y2hcLWZpbGU6Ly8wMDIzLWRvbi10LXBhc3MtQVRfU1lNTElOS19OT0ZP
TExPVy1mbGFnLXRvLWZhY2Nlc3NhdC5wYXRjaFwtZmlsZTovLzAwMjQtY29tcGFyaXNvbl9m
bl90LWlzLWdsaWJjLXNwZWNpZmljLXVzZS1yYXctc2lnbmF0dXJlLS5wYXRjaFwtZmlsZTov
LzAwMjUtRGVmaW5lLV9QQVRIX1dUTVBYLWFuZC1fUEFUSF9VVE1QWC1pZi1ub3QtZGVmaW5l
ZC5wYXRjaFwtZmlsZTovLzAwMjYtVXNlLXVpbnRtYXhfdC1mb3ItaGFuZGxpbmctcmxpbV90
LnBhdGNoXC1maWxlOi8vMDAyNy1yZW1vdmUtbm9ib2R5LXVzZXItZ3JvdXAtY2hlY2tpbmcu
cGF0Y2hcLWZpbGU6Ly8wMDI4LWFkZC1taXNzaW5nLUZUV18tbWFjcm9zLWZvci1tdXNsLnBh
dGNoXC1maWxlOi8vMDAyOS1uc3MtbXltYWNoaW5lcy1CdWlsZC1jb25kaXRpb25hbGx5LXdo
ZW4tRU5BQkxFX01ZSE9TLnBhdGNoXC1maWxlOi8vMDAzMC1maXgtbWlzc2luZy1vZi1fX3Jl
Z2lzdGVyX2F0Zm9yay1mb3Itbm9uLWdsaWJjLWJ1aWxkLnBhdGNoXC1maWxlOi8vMDAzMS1m
aXgtbWlzc2luZy1VTE9OR19MT05HX01BWC1kZWZpbml0aW9uLWluLWNhc2Utb2YtbXVzLnBh
dGNoXC1maWxlOi8vMDAzMi1tZW1mZC5wYXRjaFwtZmlsZTovLzAwMzMtYmFzaWMtbWFjcm9z
LXJlbmFtZS1ub3JldHVybi1pbnRvLV9ub3JldHVybl8tODQ1Ni5wYXRjaFwtZmlsZTovL2xp
Ym1vdW50LnBhdGNoXC1maWxlOi8vMDAzNC1GaXgtZm9ybWF0LXRydW5jYXRpb24tY29tcGls
ZS1mYWlsdXJlLWJ5LXR5cGVjYXN0aW5nLnBhdGNoXC1maWxlOi8vMDAzNS1EZWZpbmUtZ2xp
YmMtY29tcGF0aWJsZS1iYXNlbmFtZS1mb3Itbm9uLWdsaWJjLXN5c3RlLnBhdGNoXC1maWxl
Oi8vMDAzNi10aW1lLXV0aWwtZml4LWJ1aWxkLXdpdGgtZ2NjOC1XZXJyb3ItZm9ybWF0LXRy
dW5jYXRpLnBhdGNoXCtmaWxlOi8vMDAwMS1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRl
bmN5LWxpbmtzLWF0LWluc3RhbGwtdGltLnBhdGNoXCtmaWxlOi8vMDAwMi11c2UtbG5yLXdy
YXBwZXItaW5zdGVhZC1vZi1sb29raW5nLWZvci1yZWxhdGl2ZS1vcHRpLnBhdGNoXCtmaWxl
Oi8vMDAwMy1pbXBsbWVudC1zeXN0ZW1kLXN5c3YtaW5zdGFsbC1mb3ItT0UucGF0Y2hcK2Zp
bGU6Ly8wMDA0LXJ1bGVzLXdoaXRlbGlzdC1oZC1kZXZpY2VzLnBhdGNoXCtmaWxlOi8vMDAw
NS1NYWtlLXJvb3Qtcy1ob21lLWRpcmVjdG9yeS1jb25maWd1cmFibGUucGF0Y2hcK2ZpbGU6
Ly8wMDA2LXJlbW92ZS1ub2JvZHktdXNlci1ncm91cC1jaGVja2luZy5wYXRjaFwrZmlsZTov
LzAwMDctcnVsZXMtd2F0Y2gtbWV0YWRhdGEtY2hhbmdlcy1pbi1pZGUtZGV2aWNlcy5wYXRj
aFwrZmlsZTovLzAwMDgtRG8tbm90LWVuYWJsZS1uc3MtdGVzdHMtaWYtbnNzLXN5c3RlbWQt
aXMtbm90LWVuYWJsZS5wYXRjaFwrZmlsZTovLzAwMDktbnNzLW15bWFjaGluZXMtQnVpbGQt
Y29uZGl0aW9uYWxseS13aGVuLUVOQUJMRV9NWUhPUy5wYXRjaFwiPiJmaWxlOi8vdG91Y2hz
Y3JlZW4ucnVsZXMgXAogICAgICAgICAgICBmaWxlOi8vMDAtY3JlYXRlLXZvbGF0aWxlLmNv
bmYgXAogICAgICAgICAgICBmaWxlOi8vaW5pdCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAx
LUhpZGUtX19zdGFydF9CVVNfRVJST1JfTUFQLWFuZC1fX3N0b3BfQlVTX0VSUk9SX01BUC5w
YXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLVVzZS1nZXRlbnYtd2hlbi1zZWN1cmUt
dmVyc2lvbnMtYXJlLW5vdC1hdmFpbGFibGUucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
MDAwMi1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWluc3RhbGwt
dGltLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDMtdXNlLWxuci13cmFwcGVyLWlu
c3RlYWQtb2YtbG9va2luZy1mb3ItcmVsYXRpdmUtb3B0aS5wYXRjaCBcCi0gICAgICAgICAg
IGZpbGU6Ly8wMDA0LWltcGxtZW50LXN5c3RlbWQtc3lzdi1pbnN0YWxsLWZvci1PRS5wYXRj
aCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDA1LXJ1bGVzLXdoaXRlbGlzdC1oZC1kZXZpY2Vz
LnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDYtTWFrZS1yb290LXMtaG9tZS1kaXJl
Y3RvcnktY29uZmlndXJhYmxlLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDctUmV2
ZXJ0LXJ1bGVzLXJlbW92ZS1maXJtd2FyZS1sb2FkaW5nLXJ1bGVzLnBhdGNoIFwKLSAgICAg
ICAgICAgZmlsZTovLzAwMDgtUmV2ZXJ0LXVkZXYtcmVtb3ZlLXVzZXJzcGFjZS1maXJtd2Fy
ZS1sb2FkaW5nLXN1cHBvci5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDA5LXJlbW92
ZS1kdXBsaWNhdGUtaW5jbHVkZS11Y2hhci5oLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTov
LzAwMTAtY2hlY2stZm9yLXVjaGFyLmgtaW4tbWVzb24uYnVpbGQucGF0Y2ggXAotICAgICAg
ICAgICBmaWxlOi8vMDAxMS1zb2NrZXQtdXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24t
dC1zdXBwb3J0LUlETi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDEyLXJ1bGVzLXdh
dGNoLW1ldGFkYXRhLWNoYW5nZXMtaW4taWRlLWRldmljZXMucGF0Y2ggXAotICAgICAgICAg
ICBmaWxlOi8vMDAxMy1hZGQtZmFsbGJhY2stcGFyc2VfcHJpbnRmX2Zvcm1hdC1pbXBsZW1l
bnRhdGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDE0LXNyYy1iYXNpYy1taXNz
aW5nLmgtY2hlY2stZm9yLW1pc3Npbmctc3RybmR1cGEucGF0Y2ggXAotICAgICAgICAgICBm
aWxlOi8vMDAxNS1kb24tdC1mYWlsLWlmLUdMT0JfQlJBQ0UtYW5kLUdMT0JfQUxURElSRlVO
Qy1pcy1ub3QtLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMTYtc3JjLWJhc2ljLW1p
c3NpbmcuaC1jaGVjay1mb3ItbWlzc2luZy1fX2NvbXBhcl9mbl90LS5wYXRjaCBcCi0gICAg
ICAgICAgIGZpbGU6Ly8wMDE3LUluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMTgtY2hlY2stZm9yLW1pc3NpbmctY2Fub25pY2FsaXpl
X2ZpbGVfbmFtZS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDE5LURvLW5vdC1lbmFi
bGUtbnNzLXRlc3RzLWlmLW5zcy1zeXN0ZW1kLWlzLW5vdC1lbmFibGUucGF0Y2ggXAotICAg
ICAgICAgICBmaWxlOi8vMDAyMC10ZXN0LWhleGRlY29jdC5jLUluY2x1ZGUtbWlzc2luZy5o
LWZvci1zdHJuZHVwYS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDIxLXRlc3Qtc2l6
ZW9mLmMtRGlzYWJsZS10ZXN0cy1mb3ItbWlzc2luZy10eXBlZGVmcy1pbi0ucGF0Y2ggXAot
ICAgICAgICAgICBmaWxlOi8vMDAyMi1kb24tdC11c2UtZ2xpYmMtc3BlY2lmaWMtcXNvcnRf
ci5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDIzLWRvbi10LXBhc3MtQVRfU1lNTElO
S19OT0ZPTExPVy1mbGFnLXRvLWZhY2Nlc3NhdC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6
Ly8wMDI0LWNvbXBhcmlzb25fZm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3LXNpZ25h
dHVyZS0ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAyNS1EZWZpbmUtX1BBVEhfV1RN
UFgtYW5kLV9QQVRIX1VUTVBYLWlmLW5vdC1kZWZpbmVkLnBhdGNoIFwKLSAgICAgICAgICAg
ZmlsZTovLzAwMjYtVXNlLXVpbnRtYXhfdC1mb3ItaGFuZGxpbmctcmxpbV90LnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMjctcmVtb3ZlLW5vYm9keS11c2VyLWdyb3VwLWNoZWNr
aW5nLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMjgtYWRkLW1pc3NpbmctRlRXXy1t
YWNyb3MtZm9yLW11c2wucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAyOS1uc3MtbXlt
YWNoaW5lcy1CdWlsZC1jb25kaXRpb25hbGx5LXdoZW4tRU5BQkxFX01ZSE9TLnBhdGNoIFwK
LSAgICAgICAgICAgZmlsZTovLzAwMzAtZml4LW1pc3Npbmctb2YtX19yZWdpc3Rlcl9hdGZv
cmstZm9yLW5vbi1nbGliYy1idWlsZC5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDMx
LWZpeC1taXNzaW5nLVVMT05HX0xPTkdfTUFYLWRlZmluaXRpb24taW4tY2FzZS1vZi1tdXMu
cGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAzMi1tZW1mZC5wYXRjaCBcCi0gICAgICAg
ICAgIGZpbGU6Ly8wMDMzLWJhc2ljLW1hY3Jvcy1yZW5hbWUtbm9yZXR1cm4taW50by1fbm9y
ZXR1cm5fLTg0NTYucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vbGlibW91bnQucGF0Y2gg
XAotICAgICAgICAgICBmaWxlOi8vMDAzNC1GaXgtZm9ybWF0LXRydW5jYXRpb24tY29tcGls
ZS1mYWlsdXJlLWJ5LXR5cGVjYXN0aW5nLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAw
MzUtRGVmaW5lLWdsaWJjLWNvbXBhdGlibGUtYmFzZW5hbWUtZm9yLW5vbi1nbGliYy1zeXN0
ZS5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDM2LXRpbWUtdXRpbC1maXgtYnVpbGQt
d2l0aC1nY2M4LVdlcnJvci1mb3JtYXQtdHJ1bmNhdGkucGF0Y2ggXAorICAgICAgICAgICBm
aWxlOi8vMDAwMS1iaW5mbXQtRG9uLXQtaW5zdGFsbC1kZXBlbmRlbmN5LWxpbmtzLWF0LWlu
c3RhbGwtdGltLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDItdXNlLWxuci13cmFw
cGVyLWluc3RlYWQtb2YtbG9va2luZy1mb3ItcmVsYXRpdmUtb3B0aS5wYXRjaCBcCisgICAg
ICAgICAgIGZpbGU6Ly8wMDAzLWltcGxtZW50LXN5c3RlbWQtc3lzdi1pbnN0YWxsLWZvci1P
RS5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA0LXJ1bGVzLXdoaXRlbGlzdC1oZC1k
ZXZpY2VzLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDUtTWFrZS1yb290LXMtaG9t
ZS1kaXJlY3RvcnktY29uZmlndXJhYmxlLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAw
MDYtcmVtb3ZlLW5vYm9keS11c2VyLWdyb3VwLWNoZWNraW5nLnBhdGNoIFwKKyAgICAgICAg
ICAgZmlsZTovLzAwMDctcnVsZXMtd2F0Y2gtbWV0YWRhdGEtY2hhbmdlcy1pbi1pZGUtZGV2
aWNlcy5wYXRjaCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDA4LURvLW5vdC1lbmFibGUtbnNz
LXRlc3RzLWlmLW5zcy1zeXN0ZW1kLWlzLW5vdC1lbmFibGUucGF0Y2ggXAorICAgICAgICAg
ICBmaWxlOi8vMDAwOS1uc3MtbXltYWNoaW5lcy1CdWlsZC1jb25kaXRpb25hbGx5LXdoZW4t
RU5BQkxFX01ZSE9TLnBhdGNoIFwKICAgICAgICAgICAgIjwvYT4KIFNSQ19VUklfYXBwZW5k
X3FlbXVhbGwgPSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJmaWxl
Oi8vMDAwMS1jb3JlLWRldmljZS5jLUNoYW5nZS10aGUtZGVmYXVsdC1kZXZpY2UtdGltZW91
dC10by0yLnBhdGNoIj4iIGZpbGU6Ly8wMDAxLWNvcmUtZGV2aWNlLmMtQ2hhbmdlLXRoZS1k
ZWZhdWx0LWRldmljZS10aW1lb3V0LXRvLTIucGF0Y2giPC9hPgogCisjIHBhdGNoZXMgbWFk
ZSBmb3IgbXVzbCBhcmUgb25seSBhcHBsaWVkIG9uIFRDTElCQyBpcyBtdXNsCitTUkNfVVJJ
ICs9IDxhIGNsYXNzPSJtb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzoke0Bk
LmdldFZhcignU1JDX1VSSV9NVVNMJylpZmQuZ2V0VmFyKCdUQ0xJQkMnKT09J211c2wnZWxz
ZScnfSI+IiR7QGQuZ2V0VmFyKCdTUkNfVVJJX01VU0wnKSBpZiBkLmdldFZhcignVENMSUJD
JykgPT0gJ211c2wnIGVsc2UgJyd9IjwvYT4KK1NSQ19VUklfTVVTTCA9IDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9ImZpbGU6Ly8wMDAxLVVzZS1nZXRlbnYtd2hl
bi1zZWN1cmUtdmVyc2lvbnMtYXJlLW5vdC1hdmFpbGFibGUucGF0Y2hcK2ZpbGU6Ly8wMDAy
LWRvbi10LXVzZS1nbGliYy1zcGVjaWZpYy1xc29ydF9yLnBhdGNoXCtmaWxlOi8vMDAwMy1j
b21wYXJpc29uX2ZuX3QtaXMtZ2xpYmMtc3BlY2lmaWMtdXNlLXJhdy1zaWduYXR1cmUtLnBh
dGNoXCtmaWxlOi8vMDAwNC1hZGQtZmFsbGJhY2stcGFyc2VfcHJpbnRmX2Zvcm1hdC1pbXBs
ZW1lbnRhdGlvbi5wYXRjaFwrZmlsZTovLzAwMDUtaW5jbHVkZS1nc2hhZG93LW9ubHktaWYt
RU5BQkxFX0dTSEFET1ctaXMtMS5wYXRjaFwrZmlsZTovLzAwMDYtc3JjLWJhc2ljLW1pc3Np
bmcuaC1jaGVjay1mb3ItbWlzc2luZy1zdHJuZHVwYS5wYXRjaFwrZmlsZTovLzAwMDctSW5j
bHVkZS1uZXRpbmV0LWlmX2V0aGVyLmgucGF0Y2hcK2ZpbGU6Ly8wMDA4LWRvbi10LWZhaWwt
aWYtR0xPQl9CUkFDRS1hbmQtR0xPQl9BTFRESVJGVU5DLWlzLW5vdC0ucGF0Y2hcK2ZpbGU6
Ly8wMDA5LWFkZC1taXNzaW5nLUZUV18tbWFjcm9zLWZvci1tdXNsLnBhdGNoXCtmaWxlOi8v
MDAxMC1zb2NrZXQtdXRpbC1kb24tdC1mYWlsLWlmLWxpYmMtZG9lc24tdC1zdXBwb3J0LUlE
Ti5wYXRjaFwrZmlsZTovLzAwMTEtc3JjLWJhc2ljLW1pc3NpbmcuaC1jaGVjay1mb3ItbWlz
c2luZy1fX2NvbXBhcl9mbl90LS5wYXRjaFwrZmlsZTovLzAwMTItZml4LW1pc3Npbmctb2Yt
X19yZWdpc3Rlcl9hdGZvcmstZm9yLW5vbi1nbGliYy1idWlsZC5wYXRjaFwrZmlsZTovLzAw
MTMtVXNlLXVpbnRtYXhfdC1mb3ItaGFuZGxpbmctcmxpbV90LnBhdGNoXCtmaWxlOi8vMDAx
NC1maXgtbWlzc2luZy1VTE9OR19MT05HX01BWC1kZWZpbml0aW9uLWluLWNhc2Utb2YtbXVz
LnBhdGNoXCtmaWxlOi8vMDAxNS10ZXN0LWhleGRlY29jdC5jLUluY2x1ZGUtbWlzc2luZy5o
LWZvci1zdHJuZHVwYS5wYXRjaFwrZmlsZTovLzAwMTYtdGVzdC1zaXplb2YuYy1EaXNhYmxl
LXRlc3RzLWZvci1taXNzaW5nLXR5cGVkZWZzLWluLS5wYXRjaFwrZmlsZTovLzAwMTctZG9u
LXQtcGFzcy1BVF9TWU1MSU5LX05PRk9MTE9XLWZsYWctdG8tZmFjY2Vzc2F0LnBhdGNoXCtm
aWxlOi8vMDAxOC1EZWZpbmUtZ2xpYmMtY29tcGF0aWJsZS1iYXNlbmFtZS1mb3Itbm9uLWds
aWJjLXN5c3RlLnBhdGNoXCtmaWxlOi8vMDAxOS1Eby1ub3QtZGlzYWJsZS1idWZmZXJpbmct
d2hlbi13cml0aW5nLXRvLW9vbV9zY29yZV9hLnBhdGNoXCsiPiJmaWxlOi8vMDAwMS1Vc2Ut
Z2V0ZW52LXdoZW4tc2VjdXJlLXZlcnNpb25zLWFyZS1ub3QtYXZhaWxhYmxlLnBhdGNoIFwK
KyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDAyLWRvbi10LXVzZS1nbGliYy1zcGVjaWZpYy1x
c29ydF9yLnBhdGNoIFwKKyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDAzLWNvbXBhcmlzb25f
Zm5fdC1pcy1nbGliYy1zcGVjaWZpYy11c2UtcmF3LXNpZ25hdHVyZS0ucGF0Y2ggXAorICAg
ICAgICAgICAgICAgZmlsZTovLzAwMDQtYWRkLWZhbGxiYWNrLXBhcnNlX3ByaW50Zl9mb3Jt
YXQtaW1wbGVtZW50YXRpb24ucGF0Y2ggXAorICAgICAgICAgICAgICAgZmlsZTovLzAwMDUt
aW5jbHVkZS1nc2hhZG93LW9ubHktaWYtRU5BQkxFX0dTSEFET1ctaXMtMS5wYXRjaCBcCisg
ICAgICAgICAgICAgICBmaWxlOi8vMDAwNi1zcmMtYmFzaWMtbWlzc2luZy5oLWNoZWNrLWZv
ci1taXNzaW5nLXN0cm5kdXBhLnBhdGNoIFwKKyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDA3
LUluY2x1ZGUtbmV0aW5ldC1pZl9ldGhlci5oLnBhdGNoIFwKKyAgICAgICAgICAgICAgIGZp
bGU6Ly8wMDA4LWRvbi10LWZhaWwtaWYtR0xPQl9CUkFDRS1hbmQtR0xPQl9BTFRESVJGVU5D
LWlzLW5vdC0ucGF0Y2ggXAorICAgICAgICAgICAgICAgZmlsZTovLzAwMDktYWRkLW1pc3Np
bmctRlRXXy1tYWNyb3MtZm9yLW11c2wucGF0Y2ggXAorICAgICAgICAgICAgICAgZmlsZTov
LzAwMTAtc29ja2V0LXV0aWwtZG9uLXQtZmFpbC1pZi1saWJjLWRvZXNuLXQtc3VwcG9ydC1J
RE4ucGF0Y2ggXAorICAgICAgICAgICAgICAgZmlsZTovLzAwMTEtc3JjLWJhc2ljLW1pc3Np
bmcuaC1jaGVjay1mb3ItbWlzc2luZy1fX2NvbXBhcl9mbl90LS5wYXRjaCBcCisgICAgICAg
ICAgICAgICBmaWxlOi8vMDAxMi1maXgtbWlzc2luZy1vZi1fX3JlZ2lzdGVyX2F0Zm9yay1m
b3Itbm9uLWdsaWJjLWJ1aWxkLnBhdGNoIFwKKyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDEz
LVVzZS11aW50bWF4X3QtZm9yLWhhbmRsaW5nLXJsaW1fdC5wYXRjaCBcCisgICAgICAgICAg
ICAgICBmaWxlOi8vMDAxNC1maXgtbWlzc2luZy1VTE9OR19MT05HX01BWC1kZWZpbml0aW9u
LWluLWNhc2Utb2YtbXVzLnBhdGNoIFwKKyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDE1LXRl
c3QtaGV4ZGVjb2N0LmMtSW5jbHVkZS1taXNzaW5nLmgtZm9yLXN0cm5kdXBhLnBhdGNoIFwK
KyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDE2LXRlc3Qtc2l6ZW9mLmMtRGlzYWJsZS10ZXN0
cy1mb3ItbWlzc2luZy10eXBlZGVmcy1pbi0ucGF0Y2ggXAorICAgICAgICAgICAgICAgZmls
ZTovLzAwMTctZG9uLXQtcGFzcy1BVF9TWU1MSU5LX05PRk9MTE9XLWZsYWctdG8tZmFjY2Vz
c2F0LnBhdGNoIFwKKyAgICAgICAgICAgICAgIGZpbGU6Ly8wMDE4LURlZmluZS1nbGliYy1j
b21wYXRpYmxlLWJhc2VuYW1lLWZvci1ub24tZ2xpYmMtc3lzdGUucGF0Y2ggXAorICAgICAg
ICAgICAgICAgZmlsZTovLzAwMTktRG8tbm90LWRpc2FibGUtYnVmZmVyaW5nLXdoZW4td3Jp
dGluZy10by1vb21fc2NvcmVfYS5wYXRjaCBcCisgICAgICAgICAgICAgICAiPC9hPgorCiAj
IFdvcmthcm91bmQgdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19zdGFja19jaGtfZmFpbF9s
b2NhbCcgb24gcWVtdXg4NiBhbmQgcWVtdXBwYyBmb3IgbXVzbAogU1JDX1VSSV9hcHBlbmRf
bGliYy1tdXNsX3FlbXV4ODYgPSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJmaWxlOi8vMDAwMS1SZW1vdmUtZnN0YWNrLXByb3RlY3Rvci1mbGFncy10by13b3Jr
YXJvdW5kLW11c2wtYnVpLnBhdGNoIj4iIGZpbGU6Ly8wMDAxLVJlbW92ZS1mc3RhY2stcHJv
dGVjdG9yLWZsYWdzLXRvLXdvcmthcm91bmQtbXVzbC1idWkucGF0Y2giPC9hPgogU1JDX1VS
SV9hcHBlbmRfbGliYy1tdXNsX3FlbXVwcGMgPSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJmaWxlOi8vMDAwMS1SZW1vdmUtZnN0YWNrLXByb3RlY3Rvci1mbGFn
cy10by13b3JrYXJvdW5kLW11c2wtYnVpLnBhdGNoIj4iIGZpbGU6Ly8wMDAxLVJlbW92ZS1m
c3RhY2stcHJvdGVjdG9yLWZsYWdzLXRvLXdvcmthcm91bmQtbXVzbC1idWkucGF0Y2giPC9h
PgpAQCAtNzIsMTIgKzY2LDE1IEBAIFBBQ0tBR0VDT05GSUcgPz89ICIgXAogICAgICR7QGJi
LnV0aWxzLmZpbHRlcignRElTVFJPX0ZFQVRVUkVTJywgJ2VmaSBsZGNvbmZpZyBwYW0gc2Vs
aW51eCB1c3JtZXJnZScsIGQpfSBcCiAgICAgJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RS
T19GRUFUVVJFUycsICd3aWZpJywgJ3Jma2lsbCcsICcnLCBkKX0gXAogICAgICR7QGJiLnV0
aWxzLmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAneDExJywgJ3hrYmNvbW1vbicsICcn
LCBkKX0gXAorICAgIGFjbCBcCiAgICAgYmFja2xpZ2h0IFwKICAgICBiaW5mbXQgXAogICAg
IGZpcnN0Ym9vdCBcCisgICAgZ3NoYWRvdyBcCiAgICAgaGliZXJuYXRlIFwKICAgICBob3N0
bmFtZWQgXAogICAgIGltYSBcCisgICAga21vZCBcCiAgICAgbG9jYWxlZCBcCiAgICAgbG9n
aW5kIFwKICAgICBtYWNoaW5lZCBcCkBAIC05OCw2ICs5NSw3IEBAIFBBQ0tBR0VDT05GSUcg
Pz89ICIgXAogIgogCiBQQUNLQUdFQ09ORklHX3JlbW92ZV9saWJjLW11c2wgPSAiIFwKKyAg
ICBnc2hhZG93IFwKICAgICBsb2NhbGVkIFwKICAgICBteWhvc3RuYW1lIFwKICAgICBuc3Mg
XApAQCAtMTEzLDYgKzExMSw3IEBAIFBBQ0tBR0VDT05GSUdfcmVtb3ZlX2xpYmMtbXVzbCA9
ICIgXAogIyBzeXN0ZW1kLXNlcmlhbGdldHR5LmJiIC0gbm90IGVuYWJsZWQgYnkgZGVmYXVs
dC4KIFBBQ0tBR0VDT05GSUdbc2VyaWFsLWdldHR5LWdlbmVyYXRvcl0gPSAiIgogCitQQUNL
QUdFQ09ORklHW2FjbF0gPSAiLURhY2w9dHJ1ZSwtRGFjbD1mYWxzZSxhY2wiCiBQQUNLQUdF
Q09ORklHW2F1ZGl0XSA9ICItRGF1ZGl0PXRydWUsLURhdWRpdD1mYWxzZSxhdWRpdCIKIFBB
Q0tBR0VDT05GSUdbYmFja2xpZ2h0XSA9ICItRGJhY2tsaWdodD10cnVlLC1EYmFja2xpZ2h0
PWZhbHNlIgogUEFDS0FHRUNPTkZJR1tiaW5mbXRdID0gIi1EYmluZm10PXRydWUsLURiaW5m
bXQ9ZmFsc2UiCkBAIC0xMjUsNiArMTI0LDcgQEAgUEFDS0FHRUNPTkZJR1tlbGZ1dGlsc10g
PSAiLURlbGZ1dGlscz10cnVlLC1EZWxmdXRpbHM9ZmFsc2UsZWxmdXRpbHMiCiBQQUNLQUdF
Q09ORklHW2ZpcnN0Ym9vdF0gPSAiLURmaXJzdGJvb3Q9dHJ1ZSwtRGZpcnN0Ym9vdD1mYWxz
ZSIKICMgU2lnbiB0aGUgam91cm5hbCBmb3IgYW50aS10YW1wZXJpbmcKIFBBQ0tBR0VDT05G
SUdbZ2NyeXB0XSA9ICItRGdjcnlwdD10cnVlLC1EZ2NyeXB0PWZhbHNlLGxpYmdjcnlwdCIK
K1BBQ0tBR0VDT05GSUdbZ3NoYWRvd10gPSAiLURnc2hhZG93PXRydWUsLURnc2hhZG93PWZh
bHNlIgogUEFDS0FHRUNPTkZJR1toaWJlcm5hdGVdID0gIi1EaGliZXJuYXRlPXRydWUsLURo
aWJlcm5hdGU9ZmFsc2UiCiBQQUNLQUdFQ09ORklHW2hvc3RuYW1lZF0gPSAiLURob3N0bmFt
ZWQ9dHJ1ZSwtRGhvc3RuYW1lZD1mYWxzZSIKIFBBQ0tBR0VDT05GSUdbaW1hXSA9ICItRGlt
YT10cnVlLC1EaW1hPWZhbHNlIgpAQCAtMTMzLDYgKzEzMyw3IEBAIFBBQ0tBR0VDT05GSUdb
aW1wb3J0ZF0gPSAiLURpbXBvcnRkPXRydWUsLURpbXBvcnRkPWZhbHNlIgogIyBVcGRhdGUg
TkFUIGZpcmV3YWxsIHJ1bGVzCiBQQUNLQUdFQ09ORklHW2lwdGNdID0gIi1EbGliaXB0Yz10
cnVlLC1EbGliaXB0Yz1mYWxzZSxpcHRhYmxlcyIKIFBBQ0tBR0VDT05GSUdbam91cm5hbC11
cGxvYWRdID0gIi1EbGliY3VybD10cnVlLC1EbGliY3VybD1mYWxzZSxjdXJsIgorUEFDS0FH
RUNPTkZJR1trbW9kXSA9ICItRGttb2Q9dHJ1ZSwtRGttb2Q9ZmFsc2Usa21vZCIKIFBBQ0tB
R0VDT05GSUdbbGRjb25maWddID0gIi1EbGRjb25maWc9dHJ1ZSwtRGxkY29uZmlnPWZhbHNl
IgogUEFDS0FHRUNPTkZJR1tsaWJpZG5dID0gIi1EbGliaWRuPXRydWUsLURsaWJpZG49ZmFs
c2UsbGliaWRuIgogUEFDS0FHRUNPTkZJR1tsb2NhbGVkXSA9ICItRGxvY2FsZWQ9dHJ1ZSwt
RGxvY2FsZWQ9ZmFsc2UiCkBAIC0xNDYsNiArMTQ3LDcgQEAgUEFDS0FHRUNPTkZJR1tuZXR3
b3JrZF0gPSAiLURuZXR3b3JrZD10cnVlLC1EbmV0d29ya2Q9ZmFsc2UiCiBQQUNLQUdFQ09O
RklHW25zc10gPSAiLURuc3Mtc3lzdGVtZD10cnVlLC1EbnNzLXN5c3RlbWQ9ZmFsc2UiCiBQ
QUNLQUdFQ09ORklHW3BhbV0gPSAiLURwYW09dHJ1ZSwtRHBhbT1mYWxzZSxsaWJwYW0sJHtQ
QU1fUExVR0lOU30iCiBQQUNLQUdFQ09ORklHW3BvbGtpdF0gPSAiLURwb2xraXQ9dHJ1ZSwt
RHBvbGtpdD1mYWxzZSIKK1BBQ0tBR0VDT05GSUdbcG9ydGFibGVkXSA9ICItRHBvcnRhYmxl
ZD10cnVlLC1EcG9ydGFibGVkPWZhbHNlIgogUEFDS0FHRUNPTkZJR1txcmVuY29kZV0gPSAi
LURxcmVuY29kZT10cnVlLC1EcXJlbmNvZGU9ZmFsc2UscXJlbmNvZGUiCiBQQUNLQUdFQ09O
RklHW3F1b3RhY2hlY2tdID0gIi1EcXVvdGFjaGVjaz10cnVlLC1EcXVvdGFjaGVjaz1mYWxz
ZSIKIFBBQ0tBR0VDT05GSUdbcmFuZG9tc2VlZF0gPSAiLURyYW5kb21zZWVkPXRydWUsLURy
YW5kb21zZWVkPWZhbHNlIgpAQCAtMTgxLDcgKzE4Myw3IEBAIEVYVFJBX09FTUVTT04gKz0g
Ii1EbGluay11ZGV2LXNoYXJlZD1mYWxzZSIKIAogRVhUUkFfT0VNRVNPTiArPSAiLURub2Jv
ZHktdXNlcj1ub2JvZHkgXAogICAgICAgICAgICAgICAgICAgLURub2JvZHktZ3JvdXA9bm9i
b2R5IFwKLSAgICAgICAgICAgICAgICAgIC1Ecm9vdGhvbWVkaXI9JHtST09USE9NRX0gXAor
ICAgICAgICAgICAgICAgICAgLURyb290aG9tZWRpcj0ke1JPT1RfSE9NRX0gXAogICAgICAg
ICAgICAgICAgICAgLURyb290bGliZGlyPSR7cm9vdGxpYmRpcn0gXAogICAgICAgICAgICAg
ICAgICAgLURyb290cHJlZml4PSR7cm9vdHByZWZpeH0gXAogICAgICAgICAgICAgICAgICAg
LURzeXN2cmNuZC1wYXRoPSR7c3lzY29uZmRpcn0gXApAQCAtMzE0LDcgKzMxNiw3IEBAIFVT
RVJBRERfUEFSQU1fJHtQTn0gKz0gPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIg
aHJlZj0ibWFpbHRvOiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywnbmV0
d29ya2QnLCctLXN5c1VTRVJBRERfUEFSQU1fJHtQTn0rPSI+IiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCdQQUNLQUdFQ09ORklHJywgJ25ldHdvcmtkJywgJy0tc3lzCiBVU0VSQUREX1BBUkFN
XyR7UE59ICs9ICI8L2E8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJt
YWlsdG86JHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCdjb3JlZHVtcCcs
Jy0tc3lzdGVtLWQvLU0tLXNoZWxsL2Jpbi9ub2xvZ2luc3lzdGVtZC1jb3JlZHVtcDsnLCcn
LGQpfSI+IiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklHJywgJ2NvcmVkdW1w
JywgJy0tc3lzdGVtIC1kIC8gLU0gLS1zaGVsbCAvYmluL25vbG9naW4gc3lzdGVtZC1jb3Jl
ZHVtcDsnLCAnJywgZCl9IjwvYT4KIFVTRVJBRERfUEFSQU1fJHtQTn0gKz0gPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCdQQUNLQUdFQ09ORklHJywncmVzb2x2ZWQnLCctLXN5c3RlbS1kLy1NLS1zaGVsbC9i
aW4vbm9sb2dpbnN5c3RlbWQtcmVzb2x2ZTsnLCcnLGQpfSI+IiR7QGJiLnV0aWxzLmNvbnRh
aW5zKCdQQUNLQUdFQ09ORklHJywgJ3Jlc29sdmVkJywgJy0tc3lzdGVtIC1kIC8gLU0gLS1z
aGVsbCAvYmluL25vbG9naW4gc3lzdGVtZC1yZXNvbHZlOycsICcnLCBkKX0iPC9hPgogVVNF
UkFERF9QQVJBTV8ke1BOfSArPSA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIzOTZFIiBo
cmVmPSJtYWlsdG86JHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCdwb2xr
aXQnLCctLXN5c3RlbS0tbm8tY3JlYXRlLWhvbWUtLXVzZXItZ3JvdXAtLWhvbWUtZGlyJHtz
eXNjb25mZGlyfS9wb2xraXQtMXBvbGtpdGQ7JywnJyxkKX0iPiIke0BiYi51dGlscy5jb250
YWlucygnUEFDS0FHRUNPTkZJRycsICdwb2xraXQnLCAnLS1zeXN0ZW0gLS1uby1jcmVhdGUt
aG9tZSAtLXVzZXItZ3JvdXAgLS1ob21lLWRpciAke3N5c2NvbmZkaXJ9L3BvbGtpdC0xIHBv
bGtpdGQ7JywgJycsIGQpfSI8L2E+Ci1HUk9VUEFERF9QQVJBTV8ke1BOfSA9ICItciBzeXN0
ZW1kLWpvdXJuYWwiCitHUk9VUEFERF9QQVJBTV8ke1BOfSA9ICItciBsb2NrOyAtciBzeXN0
ZW1kLWpvdXJuYWwiCiBVU0VSQUREX1BBUkFNXyR7UE59LWV4dHJhLXV0aWxzICs9ICItLXN5
c3RlbSAtZCAvIC1NIC0tc2hlbGwgL2Jpbi9ub2xvZ2luIHN5c3RlbWQtYnVzLXByb3h5OyIK
IAogRklMRVNfJHtQTn0tYW5hbHl6ZSA9ICIke2JpbmRpcn0vc3lzdGVtZC1hbmFseXplIgpA
QCAtNDMyLDYgKzQzNCwxNCBAQCBDT05GRklMRVNfJHtQTn0gPSAiJHtzeXNjb25mZGlyfS9t
YWNoaW5lLWlkIFwKICAgICAgICAgICAgICAgICAke3N5c2NvbmZkaXJ9L3N5c3RlbWQvdXNl
ci5jb25mIgogCiBGSUxFU18ke1BOfSA9ICIgJHtiYXNlX2JpbmRpcn0vKiBcCisgICAgICAg
ICAgICAgICAgJHtiYXNlX3NiaW5kaXJ9L3NodXRkb3duIFwKKyAgICAgICAgICAgICAgICAk
e2Jhc2Vfc2JpbmRpcn0vaGFsdCBcCisgICAgICAgICAgICAgICAgJHtiYXNlX3NiaW5kaXJ9
L3Bvd2Vyb2ZmIFwKKyAgICAgICAgICAgICAgICAke2Jhc2Vfc2JpbmRpcn0vcnVubGV2ZWwg
XAorICAgICAgICAgICAgICAgICR7YmFzZV9zYmluZGlyfS90ZWxpbml0IFwKKyAgICAgICAg
ICAgICAgICAke2Jhc2Vfc2JpbmRpcn0vcmVzb2x2Y29uZiBcCisgICAgICAgICAgICAgICAg
JHtiYXNlX3NiaW5kaXJ9L3JlYm9vdCBcCisgICAgICAgICAgICAgICAgJHtiYXNlX3NiaW5k
aXJ9L2luaXQgXAogICAgICAgICAgICAgICAgICR7ZGF0YWRpcn0vZGJ1cy0xL3NlcnZpY2Vz
IFwKICAgICAgICAgICAgICAgICAke2RhdGFkaXJ9L2RidXMtMS9zeXN0ZW0tc2VydmljZXMg
XAogICAgICAgICAgICAgICAgICR7ZGF0YWRpcn0vcG9sa2l0LTEgXApAQCAtNDU2LDYgKzQ2
Niw3IEBAIEZJTEVTXyR7UE59ID0gIiAke2Jhc2VfYmluZGlyfS8qIFwKICAgICAgICAgICAg
ICAgICAke2JpbmRpcn0vY29yZWR1bXBjdGwgXAogICAgICAgICAgICAgICAgICR7YmluZGly
fS9sb2NhbGVjdGwgXAogICAgICAgICAgICAgICAgICR7YmluZGlyfS9ob3N0bmFtZWN0bCBc
CisgICAgICAgICAgICAgICAgJHtiaW5kaXJ9L3Jlc29sdmVjdGwgXAogICAgICAgICAgICAg
ICAgICR7YmluZGlyfS90aW1lZGF0ZWN0bCBcCiAgICAgICAgICAgICAgICAgJHtiaW5kaXJ9
L2Jvb3RjdGwgXAogICAgICAgICAgICAgICAgICR7YmluZGlyfS9rZXJuZWwtaW5zdGFsbCBc
CkBAIC00NzgsNiArNDg5LDggQEAgRklMRVNfJHtQTn0gPSAiICR7YmFzZV9iaW5kaXJ9Lyog
XAogICAgICAgICAgICAgICAgICR7ZGF0YWRpcn0vZGJ1cy0xL3N5c3RlbS5kL29yZy5mcmVl
ZGVza3RvcC5zeXN0ZW1kMS5jb25mIFwKICAgICAgICAgICAgICAgICAke2RhdGFkaXJ9L2Ri
dXMtMS9zeXN0ZW0uZC9vcmcuZnJlZWRlc2t0b3AuaG9zdG5hbWUxLmNvbmYgXAogICAgICAg
ICAgICAgICAgICR7ZGF0YWRpcn0vZGJ1cy0xL3N5c3RlbS5kL29yZy5mcmVlZGVza3RvcC5s
b2dpbjEuY29uZiBcCisgICAgICAgICAgICAgICAgJHtkYXRhZGlyfS9kYnVzLTEvc3lzdGVt
LmQvb3JnLmZyZWVkZXNrdG9wLnRpbWVzeW5jMS5jb25mIFwKKyAgICAgICAgICAgICAgICAk
e2RhdGFkaXJ9L2RidXMtMS9zeXN0ZW0uZC9vcmcuZnJlZWRlc2t0b3AucG9ydGFibGUxLmNv
bmYgXAogICAgICAgICAgICAgICAgIgogCiBGSUxFU18ke1BOfS1kZXYgKz0gIiR7YmFzZV9s
aWJkaXJ9L3NlY3VyaXR5LyoubGEgJHtkYXRhZGlyfS9kYnVzLTEvaW50ZXJmYWNlcy8gJHtz
eXNjb25mZGlyfS9ycG0vbWFjcm9zLnN5c3RlbWQ8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJm
YzIzOTZFIiBocmVmPSJtYWlsdG86QEAtNTM2LDM0KzU0OSw3QEBweXRob25fX2Fub255bW91
cygpe2Quc2V0VmFyKCI+IgpAQCAtNTM2LDM0ICs1NDksNyBAQCBweXRob24gX19hbm9ueW1v
dXMoKSB7CiAgICAgICAgIGQuc2V0VmFyKCI8L2E+SU5ISUJJVF9VUERBVEVSQ0RfQkJDTEFT
UyIsICIxIikKIH0KIAotIyBUT0RPOgotIyB1LWEgZm9yIHJ1bmxldmVsIGFuZCB0ZWxpbml0
Ci0KLUFMVEVSTkFUSVZFXyR7UE59ID0gImluaXQgaGFsdCByZWJvb3Qgc2h1dGRvd24gcG93
ZXJvZmYgcnVubGV2ZWwgcmVzb2x2LWNvbmYiCi0KLUFMVEVSTkFUSVZFX1RBUkdFVFtpbml0
XSA9ICIke3Jvb3RsaWJleGVjZGlyfS9zeXN0ZW1kL3N5c3RlbWQiCi1BTFRFUk5BVElWRV9M
SU5LX05BTUVbaW5pdF0gPSAiJHtiYXNlX3NiaW5kaXJ9L2luaXQiCi1BTFRFUk5BVElWRV9Q
UklPUklUWVtpbml0XSA/PSAiMzAwIgotCi1BTFRFUk5BVElWRV9UQVJHRVRbaGFsdF0gPSAi
JHtiYXNlX2JpbmRpcn0vc3lzdGVtY3RsIgotQUxURVJOQVRJVkVfTElOS19OQU1FW2hhbHRd
ID0gIiR7YmFzZV9zYmluZGlyfS9oYWx0IgotQUxURVJOQVRJVkVfUFJJT1JJVFlbaGFsdF0g
Pz0gIjMwMCIKLQotQUxURVJOQVRJVkVfVEFSR0VUW3JlYm9vdF0gPSAiJHtiYXNlX2JpbmRp
cn0vc3lzdGVtY3RsIgotQUxURVJOQVRJVkVfTElOS19OQU1FW3JlYm9vdF0gPSAiJHtiYXNl
X3NiaW5kaXJ9L3JlYm9vdCIKLUFMVEVSTkFUSVZFX1BSSU9SSVRZW3JlYm9vdF0gPz0gIjMw
MCIKLQotQUxURVJOQVRJVkVfVEFSR0VUW3NodXRkb3duXSA9ICIke2Jhc2VfYmluZGlyfS9z
eXN0ZW1jdGwiCi1BTFRFUk5BVElWRV9MSU5LX05BTUVbc2h1dGRvd25dID0gIiR7YmFzZV9z
YmluZGlyfS9zaHV0ZG93biIKLUFMVEVSTkFUSVZFX1BSSU9SSVRZW3NodXRkb3duXSA/PSAi
MzAwIgotCi1BTFRFUk5BVElWRV9UQVJHRVRbcG93ZXJvZmZdID0gIiR7YmFzZV9iaW5kaXJ9
L3N5c3RlbWN0bCIKLUFMVEVSTkFUSVZFX0xJTktfTkFNRVtwb3dlcm9mZl0gPSAiJHtiYXNl
X3NiaW5kaXJ9L3Bvd2Vyb2ZmIgotQUxURVJOQVRJVkVfUFJJT1JJVFlbcG93ZXJvZmZdID89
ICIzMDAiCi0KLUFMVEVSTkFUSVZFX1RBUkdFVFtydW5sZXZlbF0gPSAiJHtiYXNlX2JpbmRp
cn0vc3lzdGVtY3RsIgotQUxURVJOQVRJVkVfTElOS19OQU1FW3J1bmxldmVsXSA9ICIke2Jh
c2Vfc2JpbmRpcn0vcnVubGV2ZWwiCi1BTFRFUk5BVElWRV9QUklPUklUWVtydW5sZXZlbF0g
Pz0gIjMwMCIKK0FMVEVSTkFUSVZFXyR7UE59ID0gInJlc29sdi1jb25mIgogCiBBTFRFUk5B
VElWRV9UQVJHRVRbcmVzb2x2LWNvbmZdID0gIiR7c3lzY29uZmRpcn0vcmVzb2x2LWNvbmYu
c3lzdGVtZCIKIEFMVEVSTkFUSVZFX0xJTktfTkFNRVtyZXNvbHYtY29uZl0gPSAiJHtzeXNj
b25mZGlyfS9yZXNvbHYuY29uZiIKCjwvcHJlPgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAg
IDxwcmUgd3JhcD0iIj4KCjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPHA+PGJyPgog
ICAgPC9wPgogIDwvYm9keT4KPC9odG1sPgo=

--------------15266F481D0F0AF7B96DF0DC--
