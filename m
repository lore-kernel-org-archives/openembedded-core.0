Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D2AD3E2C1
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 19:54:24 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.2306.1730145255898810537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Oct 2024 12:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YiOs+scB;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f2b95775so5499270e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730145254; x=1730750054; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dV4if0yYFB3naGvYB64XMLp5Lnd9xjWNNp3p4wDALpc=;
        b=YiOs+scBGR3NpIUGvfvha1JJZ1oLjkSRXVlGwUKswEDxVFz1Exo8ENueVobhhJH0L8
         NQHtXf6PGJ7wzvoay41D814FHFGjqBEovrJ2i+q3hIqfdBpPvbZUdSYkl08S9WiGIs6U
         EwtQUI3YdafMTsEK466kiLN/Ch3WLBWIXqO9lvG1BkKfJi5rWsuqnctWU87esN8A+463
         u+wk9j9JdAy0EskPQHvFatJD4oLs7xXNH1/f5RudEbjbisd31l/dvkKoDUphOb68oQvT
         bdnkFMkYTDw8mo7kdbrbRl+49B931U5k5Abo3VAflXJni8l4YCdSzLr8o2e1wlKksU/2
         y0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730145254; x=1730750054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dV4if0yYFB3naGvYB64XMLp5Lnd9xjWNNp3p4wDALpc=;
        b=s/+S6rSkzVPGw6/A3W4bdwDRtxTBrUPktuOcZKXHrtVjG+a5Iw3L4LX+w2T5PizbYR
         Aa1PkSuXX8KHR4bu0VWX8SQewsQB5wMcF3s7+xgXFRpmvxs4G0QCu+5FWrbdW4ZUDeJ0
         F0aoGf3VgBIVsZUpFusMetUaV9TH9jxbkFMKMZnSgTVYxp2DaUG2YlpL+XnzxW9lp6hb
         QisRGIc4+Y00sh4yol+PypDvOQqCOgLzM4BTuDD3H3p8t3m0cksJBJoFDGbsPIeYTMAG
         FY5rRqQx72WCza56/mKbZrtoD6DXMHKVN1J+ylyZQpUeX9aWC8XXnCE7Sv3q8Iy7c2l9
         xjAw==
X-Gm-Message-State: AOJu0YwL8yfh8s7mmTUFhmhCqy/Z7UDZttdmYFrCNRvxMGGm7hVL/WCC
	F8ciodzI6837EsXaFwtI3vC9cTbmSSc9Tah4XoURgEJIyq+cHaZO3ei5BeQ7LFiqU8HW0SEQLlw
	trPbDx7AgGicSWXZAcjn11JS+kAku4Q==
X-Google-Smtp-Source: AGHT+IEDOkO1YvG18+NvN2ZYVyW094aakjHuXRVGrcASfni3P8hOMW/TgkDP3UVLK/JskWvCjwUgUYy/1urX9SoAyfY=
X-Received: by 2002:a05:6512:3a96:b0:539:9720:99dc with SMTP id
 2adb3069b0e04-53b3491e09dmr5997902e87.46.1730145253725; Mon, 28 Oct 2024
 12:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241026032519.1968518-1-hongxu.jia@windriver.com> <20241026032519.1968518-5-hongxu.jia@windriver.com>
In-Reply-To: <20241026032519.1968518-5-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Oct 2024 13:54:01 -0600
Message-ID: <CAJdd5GZ7MrKo5vro76kpqEiMPDhUMyfmKPvsdJiL3JT0EOw4-A@mail.gmail.com>
Subject: Re: [oe-core][PATCH 4/6] meta/lib/oe/spdx30_tasks.py: improve debug
 log in add_package_files
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Oct 2024 19:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206462

On Fri, Oct 25, 2024 at 9:25=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> While SPDX_INCLUDE_SOURCES =3D "1" [1], there are mess of `Adding file'
> in debug log
> '''
> DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/sp=
dx/3.0.1/work/sources-unpack/COPYING to http://spdx.org/spdxdocs/gettext-mi=
nimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a818397af8b8ddb=
45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-native
> DEBUG: Adding file tmp/work/x86_64-linux/gettext-minimal-native/0.22.5/sp=
dx/3.0.1/work/gettext-0.22.5/.tarball-version to http://spdx.org/spdxdocs/g=
ettext-minimal-native-1fa0d5cb-2bb8-5631-9fab-cd219801733f/e2c2366654a81839=
7af8b8ddb45fda88c2c71aa2d71695861f82376a658d8e66/document/gettext-minimal-n=
ative
> '''
>
> Summary the total number other than print for each file.
> '''
> DEBUG: Start adding files to http://spdx.org/spdxdocs/gettext-minimal-nat=
ive-1fa0d5cb-2bb8-5631-9fab-cd219801733f/f5e0e04913ac4c595be791fc001d545a77=
519ed6ee8c743deef721ca0898bc94/document/gettext-minimal-native
> DEBUG: Added 7201 files to http://spdx.org/spdxdocs/gettext-minimal-nativ=
e-1fa0d5cb-2bb8-5631-9fab-cd219801733f/f5e0e04913ac4c595be791fc001d545a7751=
9ed6ee8c743deef721ca0898bc94/document/gettext-minimal-native
> '''
> Correct file_counter to start with 0
>
> [1] https://docs.yoctoproject.org/dev/ref-manual/variables.html#term-SPDX=
_INCLUDE_SOURCES
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index e0b656d81f..575b66ea5d 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -144,19 +144,19 @@ def add_package_files(
>
>      spdx_files =3D set()
>
> -    file_counter =3D 1
> +    bb.debug(1, "Start adding files to %s" % (objset.doc._id))

This probably has little value, so I'd just omit it?

> +    file_counter =3D 0
>      for subdir, dirs, files in os.walk(topdir):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
>              dirs[:] =3D [d for d in dirs if d not in ignore_top_level_di=
rs]
>
> +
>          for file in files:
>              filepath =3D Path(subdir) / file
>              if filepath.is_symlink() or not filepath.is_file():
>                  continue
>
> -            bb.debug(1, "Adding file %s to %s" % (filepath, objset.doc._=
id))
> -
>              filename =3D str(filepath.relative_to(topdir))
>              file_purposes =3D get_purposes(filepath)
>
> @@ -187,6 +187,8 @@ def add_package_files(
>
>              file_counter +=3D 1
>
> +    bb.debug(1, "Added %d files to %s" % (file_counter, objset.doc._id))

len(spdx_files) is more accurate than file_counter and means we don't
have to change it to start at 0

> +
>      return spdx_files
>
>
> --
> 2.25.1
>

