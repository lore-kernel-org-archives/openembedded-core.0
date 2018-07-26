Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECFCE789D5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 05:46:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6Q5kjYc001228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2018 22:46:45 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 25 Jul 2018 22:46:44 -0700
To: Ricardo Salveti <rsalveti@rsalveti.net>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
	<CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
Date: Thu, 26 Jul 2018 13:50:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 26 Jul 2018 05:46:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
> On Mon, Jul 16, 2018 at 11:05 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
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
>>      This patch is dropped because the problem has been fixed by
>>      binutils upstream. And this workaround could be dropped.
>>      https://sourceware.org/bugzilla/show_bug.cgi?id=18548
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
>>      Also remove non-exist firmware-path option
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
>>    0018-check-for-missing-canonicalize_file_name.patch
>>      The above patch is dropped because current systemd does not need
>>      canonicalize_file_name.
>>
>>    0025-Define-_PATH_WTMPX-and-_PATH_UTMPX-if-not-defined.patch
>>      The above patch is dropped because utmp makes no sense in musl.
>>      Check code below from musl.
>>      include/utmp.h:#define _PATH_UTMP "/dev/null/utmp"
>>      And utmp PACKAGECONFIG has been explicitly disabled for musl.
>>      So we don't need this patch.
>>
>>    0032-memfd.patch
>>    0033-basic-macros-rename-noreturn-into-_noreturn_-8456.patch
>>    libmount.patch
>>    0034-Fix-format-truncation-compile-failure-by-typecasting.patch
>>      The above patches are dropped because they are backported patches.
>>      And current systemd has contained these patches.
>>
>>    0036-time-util-fix-build-with-gcc8-Werror-format-truncati.patch
>>      The above patch is dropped because it has been merged and is now
>>      in new version.
>>
>> * Newly Added Patch
>>    0005-include-gshadow-only-if-ENABLE_GSHADOW-is-1.patch
>>      This patch is added to fix build for musl.
>>
>>    0019-Do-not-disable-buffering-when-writing-to-oom_score_a.patch
>>      This patch is added to fix the following error which caused system
>>      unable to boot up.
>>        systemd-udevd.service: Failed to adjust OOM setting: Invalid argument
>>        dbus.service: Failed to adjust OOM setting: Invalid argument
>>
>>    0020-distinguish-XSI-compliant-strerror_r-from-GNU-specif.patch
>>      This patch is added to fix segment fault error on musl systems.
>>
>>    0001-login-use-parse_uid-when-unmounting-user-runtime-dir.patch
>>      This patch is backported to solve a race condition between
>>      user-runtime-dir@xxx.service stop and user deletion.
>>
>> 2. PACKAGECONFIG and Dependency Changes
>> * Add a new PACKAGECONFIG item 'gshadow'. Enable it by default for glibc
>>    but disable it by default for musl. This is because musl does not provide
>>    gshadow.h.
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
> I noticed that reboot stopped working locally as I had busybox
> installed together with systemd, and the busybox version ended up
> being used as it was provided via update-alternatives.
>
> Looking for possible similar broken links, I found that
> update-alternatives ended up pointing reboot, halt and poweroff to the
> busybox binary instead of systemctl. Should we revert the changes and
> bring back update-alternatives for them?
>
> Thanks,

I think the correct direction to fix this problem is to make busybox 
only provide init utilities (reboot, halt, etc) when init manager is set 
to busybox.

We current have in busybox recipe's SRC_URI:
            ${@["", 
"file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 
'busybox')]} \

I think the init utilities should be moved to init.cfg.

Please check my logic to see if you can agree with it.
We have two facts here.
1. Init utilities (reboot, halt, etc.) are tightly bond to the specific 
implementation of PID 1.
2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
So we can conclude from the above two facts that it does not make much 
sense to have multiple providers of init utilities while we only allow 
one PID 1 provider on image.

After all, we are using update-*alternatives*, things that this 
mechanism manages are supposed to generally serve as alternatives to 
each other.

Best Regards,
Chen Qi

