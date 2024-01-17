Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E395DC47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 12:47:18 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.1057.1705495630816946488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 04:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U2nlP0Mo;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: dbaryshkov@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-554fe147ddeso12438228a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 04:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705495629; x=1706100429; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ekNhvpHf2EHWHTAMDKvtCoiMlsH1UMZyXeDh9TCmJOU=;
        b=U2nlP0MosvNNFeRhWp6MTJ2KMJX8Va9Irczwfq4ng7KoOPJJupOyhHDrXgQpGuXLWQ
         mAs7FJLQMZU7jIGOFH1l/SRjCCus2oU3H4h8Wlffzd+a+jecsud4hQ76hQrY9Q0AyDqO
         PaERuxa+4c+5cNWFlmpSrz3i68UKBmYjD9C/7QhYzl8nLYXh/vLz6SZSaI6G8kHQQ3Ca
         MHpnTgbFUW5txfuQuNuxMOqGfkLNdkWbrkIhCPCF2X4f9UEBqS0zYSbq97e0mYK4OQ2Z
         LWlasoBdJGcIUoN9NlY4N8E7w/nsSfZWBBZn1ZfamE6gp/Zq1E3/Dsb0c/IZG5G4yMiE
         aScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705495629; x=1706100429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ekNhvpHf2EHWHTAMDKvtCoiMlsH1UMZyXeDh9TCmJOU=;
        b=hLZA3U5h/BEQHr0yrKWxf0AEpnW8D41X310sBnuYi1NMh17XBcx+13zyrMZp/lfUWO
         DWSdSbrNgXJgYZM4da3DmG4tkRSkfUTTGZWE92g1WpD2h+0axnu5mINRaEMPBJG3QmyH
         gR+VikGoYqzHrPXXiQCaay34TvaZVaMwbaFz3caxs/so8C1K0os/eeRMyEIp08UCyDNs
         UGLDWLFobmA7G4bU1gyWs7GY6ww9wuowygEwyiOIEFcIUZgewnnUAO7NGHRM/f3KzQdt
         P8JTznULizTD6cUKbJK7Aoe8KMARelGN27S94QqkyW8EVf05dLhTOB4Z1rZudz7GRvZK
         /87g==
X-Gm-Message-State: AOJu0YzNOsD/oQAeVbfsMT726yDYwVqBPP93ET2pq416qVeX8ALlGogF
	2bX5O4BCBiU4cwu/Ldcm3FzmCY2NfdUT1wsBghs=
X-Google-Smtp-Source: AGHT+IHEBjJx4Gktr8YvY3CcI/dwhkPulwY0Hcq7jOayCGKXSrWBwVCjU721RXWBhNH6WTDpL8czHBXHy3VxvIVtYLI=
X-Received: by 2002:a17:907:1685:b0:a2e:9f1c:1b96 with SMTP id
 cx5-20020a170907168500b00a2e9f1c1b96mr612707ejd.80.1705495628893; Wed, 17 Jan
 2024 04:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20240111131521.2305172-1-alex@linutronix.de> <20240111131521.2305172-2-alex@linutronix.de>
In-Reply-To: <20240111131521.2305172-2-alex@linutronix.de>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 17 Jan 2024 14:46:57 +0200
Message-ID: <CALT56yMAYUiu8VLbH1HLLYGm=TkVZx31nZu_M5+bhDp=OnqMXg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] shadow: link executables statically for
 -native variant
To: Alexander Kanavin <alex.kanavin@gmail.com>, Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 12:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193907

On Thu, 11 Jan 2024 at 15:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> shadow 4.14.x adds a number of libraries it dynamically links with
> (md, bsd, attr). This causes troubles in setscene tasks where
> shadow executables are used (such as useradd), as pulling in
> the needed dynamic libraries needs unpleasant special-casing.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

It seems, this is causing issues with the TuxOE builds. We have been
observing issues with the TuxOE build environment with the image
creation choking on the home dirs. Reverting this patch seems to fix
the problem. The build environment is Ubuntu 20.04 running in a
container on Ubuntu 22.04.

ERROR: rpb-weston-image-1.0-r0 do_image_tar:
ExecutionError('/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075',
1, None, None)
ERROR: Logfile of failure stored in:
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/log.do_image_tar.160075
Log data follows:
| DEBUG: Executing python function set_image_size
| DEBUG: 1402908.000000 = 1079160 * 1.300000
| DEBUG: 1402908.000000 = max(1402908.000000, 65536)[1402908.000000] + 0
| DEBUG: 1402908.000000 = int(1402908.000000)
| DEBUG: 1404928 = aligned(1402908)
| DEBUG: returning 1404928
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_tar
| tar: ./home/linaro/.bashrc: Unknown file type; file ignored
| tar: ./home/linaro/.profile: Unknown file type; file ignored
| tar: Exiting with failure status due to previous errors
| WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075:146
exit 1 from '[ $? -eq 1 ]'
| WARNING: Backtrace (BB generated script):
| #1: do_image_tar,
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075,
line 146
| #2: main, /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_tar.160075,
line 152
NOTE: recipe rpb-weston-image-1.0-r0: task do_image_tar: Failed
ERROR: Task (/oe/build/conf/../../layers/meta-rpb/recipes-samples/images/rpb-weston-image.bb:do_image_tar)
failed with exit code '1'

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function set_image_size
| DEBUG: 1402908.000000 = 1079160 * 1.300000
| DEBUG: 1402908.000000 = max(1402908.000000, 65536)[1402908.000000] + 0
| DEBUG: 1402908.000000 = int(1402908.000000)
| DEBUG: 1404928 = aligned(1402908)
| DEBUG: returning 1404928
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_ext4
| DEBUG: Executing dd if=/dev/zero
of=/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/deploy-rpb-weston-image-image-complete/rpb-weston-image-qcom-armv8a.rootfs-20240117062023.ext4
seek=1404928 count=0 bs=1024
| 0+0 records in
| 0+0 records out
| 0 bytes copied, 9.0878e-05 s, 0.0 kB/s
| DEBUG: Actual Rootfs size:  1075376
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/rootfs
| DEBUG: Actual Partition size: 1438646272
| DEBUG: Executing mkfs.ext4 -F -b 4096
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/deploy-rpb-weston-image-image-complete/rpb-weston-image-qcom-armv8a.rootfs-20240117062023.ext4
-d /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/rootfs
| mke2fs 1.47.0 (5-Feb-2023)
| Discarding device blocks:      0/351232
             done
| Creating filesystem with 351232 4k blocks and 87824 inodes
| Filesystem UUID: 27cefb6f-e38e-44ed-ab0f-4b613d3594f2
| Superblock backups stored on blocks:
| 32768, 98304, 163840, 229376, 294912
|
| Allocating group tables:  0/11               done
| Writing inode tables:  0/11               done
| Creating journal (8192 blocks): done
| Copying files into the device: __populate_fs: ignoring entry ".bashrc"
| .bashrc: File not found by ext2_lookup while looking up ".bashrc"
| mkfs.ext4: File not found by ext2_lookup while populating file system
| WARNING: /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_ext4.160095:176
exit 1 from 'mkfs.$fstype -F $extra_imagecmd
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/deploy-rpb-weston-image-image-complete/rpb-weston-image-qcom-armv8a.rootfs-20240117062023.$fstype
-d /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/rootfs'
| WARNING: Backtrace (BB generated script):
| #1: oe_mkext234fs,
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_ext4.160095,
line 176
| #2: do_image_ext4,
/oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_ext4.160095,
line 146
| #3: main, /oe/build/tmp-rpb_wayland-glibc/work/qcom_armv8a-linaro-linux/rpb-weston-image/1.0/temp/run.do_image_ext4.160095,
line 213
NOTE: recipe rpb-weston-image-1.0-r0: task do_image_ext4: Failed



>
> ---
> v2: patch only Makefiles that produce executables and libshadow.a
> (that executables all statically link with), do not patch libsubid/Makefile,
> as patching in .a linking can clash with producing dynamic libraries.
> libsubid is used only in getsubids executable, which is not used in
> setscene user management (or anywhere else from what I can see).
>
> v3: add -no-pie to linker flags, as otherwise some host distros
> would refuse to link against libattr produced on other host distros
> and supplied via sstate (libattr made with gcc 13 and used on gcc 11/12
> hosts seems to be problematic)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/no-static-libs.inc |  5 +++++
>  meta/recipes-extended/shadow/shadow.inc     | 10 ++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
> index 75359928a14..8898d53d756 100644
> --- a/meta/conf/distro/include/no-static-libs.inc
> +++ b/meta/conf/distro/include/no-static-libs.inc
> @@ -21,6 +21,11 @@ DISABLE_STATIC:pn-libusb1-native = ""
>  # needed by rust
>  DISABLE_STATIC:pn-musl = ""
>
> +# needed by shadow-native to build static executables, particularly useradd
> +DISABLE_STATIC:pn-attr-native = ""
> +DISABLE_STATIC:pn-libbsd-native = ""
> +DISABLE_STATIC:pn-libmd-native = ""
> +
>  EXTRA_OECONF:append = "${DISABLE_STATIC}"
>
>  EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
> diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
> index c024746d4ff..43f456251a5 100644
> --- a/meta/recipes-extended/shadow/shadow.inc
> +++ b/meta/recipes-extended/shadow/shadow.inc
> @@ -47,6 +47,16 @@ EXTRA_OECONF += "--without-libcrack \
>
>  CFLAGS:append:libc-musl = " -DLIBBSD_OVERLAY"
>
> +# Force static linking of utilities so we can use from the sysroot/sstate for useradd
> +# without worrying about the dependency libraries being available
> +LDFLAGS:append:class-native = " -no-pie"
> +do_compile:prepend:class-native () {
> +       sed -i -e 's#\(LIBS.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
> +              -e 's#\(LIBBSD.*\)-lbsd#\1 ${STAGING_LIBDIR}/libbsd.a ${STAGING_LIBDIR}/libmd.a#g' \
> +              -e 's#\(LIBATTR.*\)-lattr#\1 ${STAGING_LIBDIR}/libattr.a#g' \
> +               ${B}/lib/Makefile ${B}/src/Makefile
> +}
> +
>  NSCDOPT = ""
>  NSCDOPT:class-native = "--without-nscd"
>  NSCDOPT:class-nativesdk = "--without-nscd"
> --
> 2.39.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193543): https://lists.openembedded.org/g/openembedded-core/message/193543
> Mute This Topic: https://lists.openembedded.org/mt/103661548/3618183
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [dbaryshkov@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
With best wishes
Dmitry

