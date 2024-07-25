Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6651AC3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 13:38:27 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.36545.1721914706575075078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 06:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QDj5ZOn/;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e08a538bf7bso1661003276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 06:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721914705; x=1722519505; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=058VEc/2N59wmkmNSC9RQHz4QHMvoEww7zvWPWtFJSs=;
        b=QDj5ZOn/NT1S/kqCXlBuTTWBUSKB2JqUkXQJcebpC99NIuVM062LZlFSZYFeTzFra6
         ju+fy2RIpA6iBN/WScbcIX2CfrFvRnJFj7GzSW02Gxl8MEyvaegl3aZOu2Nac91fnXhA
         K8IxUHGQb5fuHcOl+xS3U7Aakc166hqZJWZB+4lPOAAvZjDa84E3CIgUSlS35t/NR4a5
         CoRRD1Z+IcA3Bwgx39qQHdyZuy1Ph4ZoJ6GunqxT/IeSQE+IW0zyaaM0ijawoi0jP5+H
         gv/LOCKTv8qnlmQvqnOGHf+T5etSjKyhHhBkEGaqKUFq6++aV44UBQBdrd0UNAZzFptu
         BLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914705; x=1722519505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=058VEc/2N59wmkmNSC9RQHz4QHMvoEww7zvWPWtFJSs=;
        b=Wmr2Q2z3YctHjFs3vUc6ycEKPSMdI9ywLlAVng0JFBF4Qj9eDlryr4nop4qHoy1wbl
         HAH/GfHao4N5PQ11gQlTSx8sBri3X52O2TGKIC/7JfgVCCAK6F51qAFls4u3dUMmZrxR
         aTX0AmZrDmhgao5sA/uu67uOcb0WSKFJb5/JGHclRdCX6Sh03/Pq8Qbg6yNGia1H0Yw/
         WB7YapOxjZmbfObMrnT/zE5mwG63bCIgqN5/gq79CvO2feDxmma+PlqamkFu7o3YTk61
         DMN7R0QR7OKWXlyhFFA/4Wz9WuTh64yZWso/zR/fvmGmddlltosoRYmEqmFtqy0GDkGZ
         b6RQ==
X-Gm-Message-State: AOJu0YzCDmWOCy+n3JRzdiS+cFke5ABxhQMq6pO3AQF6mnNv61pc6vJM
	6U2kt1tbIG8T6lKN9tQFVeGgNc2qREjV7L2gyE/r0QK+tLy8Ym6G7zLCMjFEvLq9YE3c3Skqnga
	n2EF9kRo0qeYEtrQuCW0iSq+Ea4RY9j0B58ntlw==
X-Google-Smtp-Source: AGHT+IFjN2C0Ddg2WMpVvRLJbwhMPfAaUTD26l/jeXr8/gt1j93s/XUtMJ0vOdAfcGEt35006OdIMuiJIDIaRw6D0oY=
X-Received: by 2002:a81:6ec5:0:b0:64a:445c:6 with SMTP id 00721157ae682-674e5f4d457mr21568947b3.17.1721914705623;
 Thu, 25 Jul 2024 06:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240724191126.29999-1-asharma@mvista.com>
In-Reply-To: <20240724191126.29999-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 25 Jul 2024 06:38:14 -0700
Message-ID: <CAOSpxdZNpczmpuV2BH7xP_ys0p0v0XXKCOTg_Dvmy7tgVdtUhg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] libarchive: backport fix for CVE-2024-26256
To: asharma@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 13:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202503

I'm getting the following error at build time:

ERROR: libarchive-native-3.7.4-r0 do_patch: Applying patch
'CVE-2024-26256.patch' on target directory
'/home/steve/builds/poky-contrib-scarthgap/build/tmp/work/x86_64-linux/liba=
rchive-native/3.7.4/libarchive-3.7.4'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-scarthgap/build/tmp/work/x86_64-linux/libar=
chive-native/3.7.4/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2024-26256.patch
patching file libarchive/archive_read_support_format_rar.c
Hunk #1 FAILED at 3615.
1 out of 1 hunk FAILED -- rejects in file
libarchive/archive_read_support_format_rar.c
Patch CVE-2024-26256.patch can be reverse-applied

Steve

On Wed, Jul 24, 2024 at 12:13=E2=80=AFPM Ashish Sharma via
lists.openembedded.org <asharma=3Dmvista.com@lists.openembedded.org>
wrote:
>
> This patch fixes an out-of-bound error in rar e8 filter.
>
> Upstream-Status: Backport [https://github.com/libarchive/libarchive/commi=
t/eb7939b24a681a04648a59cdebd386b1e9dc9237]
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../libarchive/CVE-2024-26256.patch           | 27 +++++++++++++++++++
>  .../libarchive/libarchive_3.7.4.bb            |  4 ++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-=
26256.patch
>
> diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.p=
atch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
> new file mode 100644
> index 00000000000..f9be4fe255d
> --- /dev/null
> +++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
> @@ -0,0 +1,27 @@
> +From eb7939b24a681a04648a59cdebd386b1e9dc9237 Mon Sep 17 00:00:00 2001
> +From: Wei-Cheng Pan <legnaleurc@gmail.com>
> +Date: Mon, 22 Apr 2024 01:55:41 +0900
> +Subject: [PATCH] fix: OOB in rar e8 filter (#2135)
> +
> +This patch fixes an out-of-bound error in rar e8 filter.
> +
> +Upstream-Status: Backport [https://github.com/libarchive/libarchive/comm=
it/eb7939b24a681a04648a59cdebd386b1e9dc9237]
> +CVE: CVE-2024-26256
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + libarchive/archive_read_support_format_rar.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/a=
rchive_read_support_format_rar.c
> +index 99a11d1700..266d0ee995 100644
> +--- a/libarchive/archive_read_support_format_rar.c
> ++++ b/libarchive/archive_read_support_format_rar.c
> +@@ -3615,7 +3615,7 @@ execute_filter_e8(struct rar_filter *filter, struc=
t rar_virtual_machine *vm, siz
> +   uint32_t filesize =3D 0x1000000;
> +   uint32_t i;
> +
> +-  if (length > PROGRAM_WORK_SIZE || length < 4)
> ++  if (length > PROGRAM_WORK_SIZE || length <=3D 4)
> +     return 0;
> +
> +   for (i =3D 0; i <=3D length - 5; i++)
> diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/=
recipes-extended/libarchive/libarchive_3.7.4.bb
> index da857641168..22e398f5989 100644
> --- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
> +++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
> @@ -30,7 +30,9 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zst=
d,"
>  EXTRA_OECONF +=3D "--enable-largefile --without-iconv"
>
>  SRC_URI =3D "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
> -SRC_URI +=3D "file://configurehack.patch"
> +SRC_URI +=3D "file://configurehack.patch \
> +            file://CVE-2024-26256.patch \
> +"
>  UPSTREAM_CHECK_URI =3D "http://libarchive.org/"
>
>  SRC_URI[sha256sum] =3D "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd=
96bfe7abb971d5e8"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202479): https://lists.openembedded.org/g/openembedde=
d-core/message/202479
> Mute This Topic: https://lists.openembedded.org/mt/107529739/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

