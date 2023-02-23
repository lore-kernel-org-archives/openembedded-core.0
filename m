Return-Path: <joel@jms.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A60CC636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 00:09:03 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.3710.1677110932866762970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 16:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@jms.id.au header.s=google header.b=dH0Nv6fK;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: joel.stan@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id i34so11937086eda.7
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 16:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0bt4rWKna3f+PjIIjzeDjdnaJvTB/oPW36CQXGnXuE=;
        b=dH0Nv6fKTGH14HK1LZx6rpEdQErMOY/PDVsO+urz/LWE+0kunlx795COl8Ebmfa0uM
         Z2QPfiE9GHp1mYuSuLCg4awjGW3yXsTlWnAfjpL5Tl/AXUNeCRUFXd9iGE0h18pyuUwn
         kUhFY88CuuLm0KMiGJ/o2JLoXrRtp6xvhmcus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T0bt4rWKna3f+PjIIjzeDjdnaJvTB/oPW36CQXGnXuE=;
        b=M9JijfE3c0Kq1NZimAVdbJZIdM7vizJNBdv1ab+CtOaM975FtYhdoJWvTCOoxRtGjV
         uqSA1XHBkjssZeNNla5gsRZE6nLN8t+r8hhPlrj6ElFAdmQ1N/dRhZ+8qpc/AGlv/wbn
         hjs+2vq6RBRO9+REYdUfMxvLQMW5we5AVd55oAZPwXSgxwMTuDiyNFrZPw6mXgUjT+K8
         bCOrbnqMPCpOD/1if3njyaAF+WGoglZY6WhO1AgtUIUXhhij4dj19pRkuhCX5wbX972Y
         tGzyA639MbqM35vhRi/gfd69ifUe3IsedaMs5n8ml+PBYxW2mOJtvsoxw6u+vgRak749
         02+Q==
X-Gm-Message-State: AO0yUKV8sWgRKyXbp45w1fXg0OegmkR468XixtoEqiWDySSSljIFlSl8
	VKpUNr8hygL95slPVIIjEugRoOaRm5kg8MPDdZ0=
X-Google-Smtp-Source: AK7set+j9HB6mGRB5p7oVkSqNvHcEttJ1HsXw1zeJthZFMtJYcx0bY5O0lnJ2e5I1irZtPQ++Huhe1XURD4GRo6pZZM=
X-Received: by 2002:a17:906:8144:b0:8e3:da0f:f9b7 with SMTP id
 z4-20020a170906814400b008e3da0ff9b7mr2818223ejw.4.1677110930907; Wed, 22 Feb
 2023 16:08:50 -0800 (PST)
MIME-Version: 1.0
References: <17462D99D28A7B3C.10470@lists.openembedded.org> <CA+chaQfpOv5J3OFjq2+OEdfth6Nmk34FEq+aPVAj+9wsaYc58g@mail.gmail.com>
In-Reply-To: <CA+chaQfpOv5J3OFjq2+OEdfth6Nmk34FEq+aPVAj+9wsaYc58g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Feb 2023 00:08:38 +0000
Message-ID: <CACPK8XeVKuBLLt=_T8akncOMH3UO+HFwmRMxiawuOuhj94w7BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] qemu: Fix building with latest glibc 2.36
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 00:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177592

On Wed, 22 Feb 2023 at 15:28, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Hi,
>
> I've seen this build issue on my gentoo builder today with qemu-native, s=
o I've removed the stray cross.patch and sent v2.
>
> Then RP had good question how to reproduce this failure and I've checked =
when I've updated glibc in gentoo for last time and it was a month ago (and=
 I've rebuilt qemu-native few time since then).
>
> So in the end it was linux-libc-headers upgrade to 6.2 from yesterday (sy=
s-kernel/linux-headers-6.2 in gentoo) which caused this for me (if I downgr=
ade to 6.1 I can build qemu-native again even without this patch).
>
> Joel: Should I send v3 with updated commit message or will you do it?

Thanks for picking this one up. Please continue the good work.

Cheers,

Joel

>
> Regards,
>
> On Wed, Feb 22, 2023 at 4:00 PM Martin Jansa via lists.openembedded.org <=
Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Joel Stanley <joel@jms.id.au>
>>
>> When building native qemu with glibc 2.36 (including latest changes from
>> the glibc stable branch), qemu fails to build:
>>
>>  In file included from /usr/include/linux/btrfs.h:29,
>>                   from ../qemu-7.2.0/linux-user/syscall.c:165:
>>  /usr/include/linux/fs.h:50:8: error: redefinition of =E2=80=98struct fi=
le_clone_range=E2=80=99
>>     50 | struct file_clone_range {
>>        |        ^~~~~~~~~~~~~~~~
>>  ../qemu-7.2.0/linux-user/syscall.c:129:8: note: originally defined here
>>    129 | struct file_clone_range {
>>        |        ^~~~~~~~~~~~~~~~
>>
>> Backport changes to linux-user that remove the local copy of struct
>> file_clone_range.
>>
>> Patches from https://lore.kernel.org/qemu-devel/20230110174901.2580297-1=
-berrange@redhat.com/
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu.inc           |  2 +
>>  ...er-add-more-compat-ioctl-definitions.patch | 69 ++++++++++++++++
>>  ...r-fix-compat-with-glibc-2.36-sys-mou.patch | 78 +++++++++++++++++++
>>  3 files changed, 149 insertions(+)
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Revert-linux-us=
er-add-more-compat-ioctl-definitions.patch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/0002-Revert-linux-us=
er-fix-compat-with-glibc-2.36-sys-mou.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools=
/qemu/qemu.inc
>> index 92828e8f2d..1e768b560d 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -30,6 +30,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
>>             file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lsee=
k.patch \
>>             file://0002-linux-user-Replace-use-of-lfs64-related-function=
s-an.patch \
>>             file://0001-configure-Fix-check-tcg-not-executing-any-tests.=
patch \
>> +           file://0001-Revert-linux-user-add-more-compat-ioctl-definiti=
ons.patch \
>> +           file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys=
-mou.patch \
>>             "
>>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-=
more-compat-ioctl-definitions.patch b/meta/recipes-devtools/qemu/qemu/0001-=
Revert-linux-user-add-more-compat-ioctl-definitions.patch
>> new file mode 100644
>> index 0000000000..cd8121fed1
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-co=
mpat-ioctl-definitions.patch
>> @@ -0,0 +1,69 @@
>> +From afa96c55f2c270405de8984e2466067bbb44c0e4 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange=
@redhat.com>
>> +Date: Tue, 10 Jan 2023 12:49:00 -0500
>> +Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
>> +
>> +glibc has fixed (in 2.36.9000-40-g774058d729) the problem
>> +that caused a clash when both sys/mount.h annd linux/mount.h
>> +are included, and backported this to the 2.36 stable release
>> +too:
>> +
>> +  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmo=
unt.h.3E_and_.3Csys.2Fmount.h.3E
>> +
>> +It is saner for QEMU to remove the workaround it applied for
>> +glibc 2.36 and expect distros to ship the 2.36 maint release
>> +with the fix. This avoids needing to add a further workaround
>> +to QEMU to deal with the fact that linux/brtfs.h now also pulls
>> +in linux/mount.h via linux/fs.h since Linux 6.1
>> +
>> +Upstream-Status: Backport from v8.0 (master)
>> +
>> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> +Link: https://lore.kernel.org/r/20230110174901.2580297-2-berrange@redha=
t.com
>> +Signed-off-by: Joel Stanley <joel@jms.id.au>
>> +---
>> + linux-user/syscall.c | 25 -------------------------
>> + 1 file changed, 25 deletions(-)
>> +
>> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> +index f95a6161e..510de8edc 100644
>> +--- a/linux-user/syscall.c
>> ++++ b/linux-user/syscall.c
>> +@@ -111,31 +111,6 @@
>> + #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
>> + #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
>> + #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
>> +-
>> +-#define BLKGETSIZE64 _IOR(0x12,114,size_t)
>> +-#define BLKDISCARD _IO(0x12,119)
>> +-#define BLKIOMIN _IO(0x12,120)
>> +-#define BLKIOOPT _IO(0x12,121)
>> +-#define BLKALIGNOFF _IO(0x12,122)
>> +-#define BLKPBSZGET _IO(0x12,123)
>> +-#define BLKDISCARDZEROES _IO(0x12,124)
>> +-#define BLKSECDISCARD _IO(0x12,125)
>> +-#define BLKROTATIONAL _IO(0x12,126)
>> +-#define BLKZEROOUT _IO(0x12,127)
>> +-
>> +-#define FIBMAP     _IO(0x00,1)
>> +-#define FIGETBSZ   _IO(0x00,2)
>> +-
>> +-struct file_clone_range {
>> +-        __s64 src_fd;
>> +-        __u64 src_offset;
>> +-        __u64 src_length;
>> +-        __u64 dest_offset;
>> +-};
>> +-
>> +-#define FICLONE         _IOW(0x94, 9, int)
>> +-#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
>> +-
>> + #else
>> + #include <linux/fs.h>
>> + #endif
>> diff --git a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-=
compat-with-glibc-2.36-sys-mou.patch b/meta/recipes-devtools/qemu/qemu/0002=
-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
>> new file mode 100644
>> index 0000000000..d754f21ad4
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-=
with-glibc-2.36-sys-mou.patch
>> @@ -0,0 +1,78 @@
>> +From e95c0a42940ca1cf763ca3374b36a9be030039d7 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange=
@redhat.com>
>> +Date: Tue, 10 Jan 2023 12:49:01 -0500
>> +Subject: [PATCH] Revert "linux-user: fix compat with glibc >=3D 2.36
>> + sys/mount.h"
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
>> +
>> +glibc has fixed (in 2.36.9000-40-g774058d729) the problem
>> +that caused a clash when both sys/mount.h annd linux/mount.h
>> +are included, and backported this to the 2.36 stable release
>> +too:
>> +
>> +  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmo=
unt.h.3E_and_.3Csys.2Fmount.h.3E
>> +
>> +It is saner for QEMU to remove the workaround it applied for
>> +glibc 2.36 and expect distros to ship the 2.36 maint release
>> +with the fix. This avoids needing to add a further workaround
>> +to QEMU to deal with the fact that linux/brtfs.h now also pulls
>> +in linux/mount.h via linux/fs.h since Linux 6.1
>> +
>> +Upstream-Status: Backport from v8.0 (master)
>> +
>> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> +Link: https://lore.kernel.org/r/20230110174901.2580297-3-berrange@redha=
t.com
>> +Signed-off-by: Joel Stanley <joel@jms.id.au>
>> +---
>> + linux-user/syscall.c | 18 ------------------
>> + meson.build          |  2 --
>> + 2 files changed, 20 deletions(-)
>> +
>> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> +index 510de8edc..13a67b84b 100644
>> +--- a/linux-user/syscall.c
>> ++++ b/linux-user/syscall.c
>> +@@ -95,25 +95,7 @@
>> + #include <linux/soundcard.h>
>> + #include <linux/kd.h>
>> + #include <linux/mtio.h>
>> +-
>> +-#ifdef HAVE_SYS_MOUNT_FSCONFIG
>> +-/*
>> +- * glibc >=3D 2.36 linux/mount.h conflicts with sys/mount.h,
>> +- * which in turn prevents use of linux/fs.h. So we have to
>> +- * define the constants ourselves for now.
>> +- */
>> +-#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
>> +-#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
>> +-#define FS_IOC_GETVERSION              _IOR('v', 1, long)
>> +-#define FS_IOC_SETVERSION              _IOW('v', 2, long)
>> +-#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
>> +-#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
>> +-#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
>> +-#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
>> +-#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
>> +-#else
>> + #include <linux/fs.h>
>> +-#endif
>> + #include <linux/fd.h>
>> + #if defined(CONFIG_FIEMAP)
>> + #include <linux/fiemap.h>
>> +diff --git a/meson.build b/meson.build
>> +index e44432370..f37ba4114 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
>> +                      cc.has_header_symbol('getopt.h', 'optreset'))
>> + config_host_data.set('HAVE_IPPROTO_MPTCP',
>> +                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPT=
CP'))
>> +-config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
>> +-                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET=
_FLAG'))
>> +
>> + # has_member
>> + config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
>> --
>> 2.39.2
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177573): https://lists.openembedded.org/g/openembedd=
ed-core/message/177573
>> Mute This Topic: https://lists.openembedded.org/mt/97161162/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [M=
artin.Jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

