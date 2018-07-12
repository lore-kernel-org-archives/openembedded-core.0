Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE4675465
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 06:01:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6C61AOF011230
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Jul 2018 23:01:10 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 11 Jul 2018 23:01:09 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1530775716.git.Qi.Chen@windriver.com>
	<64ff479e5f6380bdf8d9521f2ea727b4e89f2b36.1530775716.git.Qi.Chen@windriver.com>
	<50455583-91e1-8ecf-b737-27b773a7fd82@gmail.com>
	<2fb407de-6278-c40a-a416-133eaf349ca1@windriver.com>
	<CAMKF1sprLwR3Apk2CO0FFgOgwcVOGV4PeHE5B0FuQhFxaMCKQw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <1845548f-790d-b762-976a-55c076f767c0@windriver.com>
Date: Thu, 12 Jul 2018 14:04:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sprLwR3Apk2CO0FFgOgwcVOGV4PeHE5B0FuQhFxaMCKQw@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 12 Jul 2018 06:01:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

As per your suggestion, I'll send out V3, which includes a follow-up 
patch to change SRC_URI back to include musl patches unconditionally.

Best Regards,
Chen Qi

On 07/12/2018 04:06 AM, Khem Raj wrote:
> On Wed, Jul 11, 2018 at 2:01 AM ChenQi <Qi.Chen@windriver.com> wrote:
>> Hi Khem,
>>
>> Thanks for your review.
>>
>> I've gone through your feedback one by one. Please see comments in line.
>>
>> I'll send out V2 with a few other fixes.
>>
>>
>> On 07/06/2018 12:37 AM, Khem Raj wrote:
>>
>> On 7/5/18 12:31 AM, Chen Qi wrote:
>>
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
>>
>> IIRC it happend with gold linker see
>> https://github.com/systemd/systemd/issues/234
>>
>> If we need to drop it then please validate it ld-is-gold distro feature
>> the relevant linker bug seems to be fixed but we need to ensure
>>
>>
>> The problem has been fixed by binutils upstream.
>> I'll update the reason about why dropping this patch in commit message in V2.
>>
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
>> I think there were/are OE users who still use kernel < 3.7, if no one
>> chimes in, I am ok to drop them.
>>
>>
>>    0009-remove-duplicate-include-uchar.h.patch
>>    0010-check-for-uchar.h-in-meson.build.patch
>>      These two patches are dropped because musl has implemented
>>      uchar.h. See commit below from musl repo.
>>      """
>>      ab9672ae73248f51e30f4553c4b8878525e46383
>>      implement uchar.h (C11 UTF-16/32 conversion) interfaces
>>      """
>>
>> This is fine.
>>
>>    0018-check-for-missing-canonicalize_file_name.patch
>>      The above patch is dropped because current systemd does not need
>>      canonicalize_file_name.
>>
>> OK
>>
>>    0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>>      The above patch is dropped because utmp makes no sense in musl.
>>      Check code below from musl.
>>      include/utmp.h:#define _PATH_UTMP "/dev/null/utmp"
>>      And utmp PACKAGECONFIG has been explicitly disabled for musl.
>>      So we don't need this patch.
>>
>> while utmp is disabled for musl, I think the above patch is in direction
>> to enable it fully for musl. I would suggest that we first try to enable
>> utmp for musl along with this patch, I remember there were some kinks
>> and if the build still fails probably its fine to drop it.
>>
>>
>> In glibc, we have
>> sysdeps/unix/sysv/linux/paths.h:#define    _PATH_WTMP    "/var/log/wtmp"
>>
>> In musl, we have:
>> include/utmp.h:#define _PATH_WTMP "/dev/null/wtmp"
>>
>> Please see the following commit in musl repo:
>> """
>> commit 1e2281b8356d1935a129ddb199d71677f19a1619
>> Author: Rich Felker <dalias@aerifal.cx>
>> Date:   Thu Jun 27 20:00:29 2013 -0400
>>
>>      minor compatibility fixes in utmp.h and fixing mismatch with paths.h
>>
>>      the pathnames prefixed with /dev/null/ are guaranteed never to be
>>      valid. the previous use of /dev/null alone was mildly dangerous in
>>      that bad software might attempt to unlink the name when it found a
>>      non-regular file there and create a new file.
>>
>> """
>>
>> So enabling utmp does not have any real effect for musl.
>> That's why I dropped this patch.
>>
>>    0032-memfd.patch
>>    0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>>    libmount.patch
>>    0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>>      The above patches are dropped because they are backported patches.
>>      And current systemd has contained these patches.
>>
>> OK
>>
>>    0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>>      The above patch is dropped because it has been merged and is now
>>      in new version.
>>
>> OK
>>
>> * Newly Added Patch
>>    0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>>      This patch is added to fix build for musl.
>>
>> OK
>>
>>    0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>>      This patch is added to fix the following error which caused system
>>      unable to boot up.
>>        systemd-udevd.service: Failed to adjust OOM setting: Invalid argument
>>        dbus.service: Failed to adjust OOM setting: Invalid argument
>>
>> I wonder if a patch should be cooked in line of this one
>> https://github.com/floppym/systemd/commit/19ef148a26ef11afad1baad1211c825bc4d31ba7
>>
>>
>> It's similar but it's not the same.
>> The commit you mentioned is more about avoiding losing correct value of errno.
>> My patch is to ensure we feed '-900' to /proc/PID/oom_score_adj instead of just a '-'.
>>
>> Please check the following commit in systemd.
>> """
>> commit 9f8168eb233d00b10e7d8ae25d9fb4c9688b4bc6
>> Author: Lennart Poettering <lennart@poettering.net>
>> Date:   Mon May 7 20:44:41 2018 +0200
>>
>>      process-util: add new helper call for adjusting the OOM score
>>
>>      And let's make use of it in execute.c
>> """
>>
>> Before this commit, it's using
>> write_string_file("/proc/self/oom_score_adj", t, 0);
>>
>> After this commit, it's using
>> write_string_file("/proc/self/oom_score_adj", t,                                WRITE_STRING_FILE_VERIFY_ON_FAILURE|WRITE_STRING_FILE_DISABLE_BUFFER);
>>
>> I think just removing WRITE_STRING_FILE_DISABLE_BUFFER is enough.
>>
> OK.
>
>> The problem occurred on musl but not glibc. I guess it's some implementation details in musl and glibc that make this difference. As I don't see any runtime problem without this patch for glibc, this patch is marked as 'musl specific'.
>>
>> 2. PACKAGECONFIG and Dependency Changes
>> * Add a new PACKAGECONFIG item 'gshadow'. Enable it by default for glibc
>>    but disable it by default for musl. This is because musl does not provide
>>    gshadow.h.
>>
>> OK
>>
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
>> Specifiying them under a separate variable is good however applying them
>> conditionally is going to cause maintenance issues. It also makes it
>> hard to keep the argument going with systemd devs since we do no longer
>> test them with glibc. So lets drop the conditional applying of these
>> patches.
>>
>>
>> I've done some serious thinking on this issue. I finally come to a very different view here.
>>
>> The current status is that systemd community is not going to accept non-glibc fixes.
>> IMHO, I don't think some arguments are enough to make systemd community change its mind.
>> So as far as I can see, this status will last for a long time.
>>
>> If we do unconditional apply of these musl patches, we are giving glibc systemd images patches that 1) fix no error and 2) are not likely to be accepted by systemd upstream.
>> I don't think this should be the default behavior.
>>
>> For you concern, these musl patches could work with glibc. I've done build and runtime testing to confirm it.
>>
>> Having said that, it's more important for me to push things forward instead of insisting on some default value.
>>
>> So if other people also require unconditional apply of these musl patches, let's do it.
>>
> This has been intentionally the case. We should be making generic
> patches so we can upstream then regardless
> of the environment they were found to fix.
>
>> But for now, I'd suggest we don't apply musl patches in case of glibc.
>>
> This is a long term hassle to maintain these, especially the number of
> patches is not small
> and component is supported out of upstream accepting it. We stand a
> chance of cooking workarounds
> that can go no where and pile upon in OE.
>
>> Best Regards,
>> Chen Qi
>>
>>
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
>> @@ -34,17 +35,17



