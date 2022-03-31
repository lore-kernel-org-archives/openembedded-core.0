Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69FBC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:47:26 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.951.1648752445645169667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aNVUi1sU;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id h11so1001703ljb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=347WbpP2n6L49jSNKz5uSXb++hUcI8HYSNEXj5Q0pJY=;
        b=aNVUi1sUDeaHQMdTLXfKUOYGVzOZgr7bfi3HmYWs/G6bdv3My8jfulzgfXclhV+nTB
         mpSYPYWPeK1WigTl1E3dibyA+fQA6Pz+N0SCyFN6oFIGhANXyemlf2yUfSorutKbbTsq
         n+cW6ahZzq5IuKiYCsTMSjCHzt/cVVP9F0Qx7WhsI/qOeuYKa2ca6tcsecQi0WKVtxKS
         q+urlZbw1f1rXMwEJDR9ZIK2V0z6C845EivyV4vdjWYTLZ37RIlgKxl6z7gJI3xEhEdu
         oQ90I5p4T0FhkTuqne9bUcI18X5PbVpF+/KDZUgFY3SSk5exEEcsNgClU26txY71vy8X
         kAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=347WbpP2n6L49jSNKz5uSXb++hUcI8HYSNEXj5Q0pJY=;
        b=F65RMJfczDKdHCFAusJh2aEVjyYULGaVvCMA56Nj5q9RYNhonTRKOdQioLtQyQDOLl
         M14i0CUR9ufyCNqtmXgKAB9UipLzUttgZlqn0Mut5Ltg8Fcl8JFzJcMB/oMQ5UqEC5dn
         eWdo3EXXU+hrg5G6DK4aEDqrjKLcLdii5ejUZ5zyzuEYUmVqrUAA58yFQanZbrCZwCow
         A7NP8G/9ARSq7QJDb4TQIlseu+G0C7qpam17tH+S+Fk3pEromcyNCG9znHgiMfwq3LcT
         ApFqLa5I2GijZCb3pERw+CIIZizQ8L3ySChYiKmXH8FfI7pIIhmYWBwXP5SuCRnJTXmz
         PGfA==
X-Gm-Message-State: AOAM530Pe5VKTbFG7DGIc/+U+uYnlgCULOmI/tDGscEeiVfKdeCg/bms
	8VET8OTEqOFkGuRx0VJYS6qs/PyC+m9a3/VYOw0=
X-Google-Smtp-Source: 
 ABdhPJzvmb6xaKbbfuekhdSMgGgur1JDEmuh9Bgtu2qOUmk7bv7zc210S8V2K6e2/bazQo4I8J5gBc0RuNEJlXGAK0M=
X-Received: by 2002:a2e:894f:0:b0:24a:c034:8cd0 with SMTP id
 b15-20020a2e894f000000b0024ac0348cd0mr11064216ljk.191.1648752443028; Thu, 31
 Mar 2022 11:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220331184230.27859-1-joe.slater@windriver.com>
In-Reply-To: <20220331184230.27859-1-joe.slater@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 31 Mar 2022 20:47:11 +0200
Message-ID: 
 <CANNYZj9pna_YZiKeJjTDEGCzNmwWm5puO8fECYBN+mbANMyrfA@mail.gmail.com>
Subject: Re: [oe-core][PATCH 1/1] unzip: fix CVE-2021-4217
To: Joe Slater <joe.slater@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:47:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163866

The origin of the patch needs to be better explained, right now it
seems like a random thing off the internet. Upstream-Status is
certainly not inappropriate, as it is a security fix.

Alex

On Thu, 31 Mar 2022 at 20:42, Joe Slater <joe.slater@windriver.com> wrote:
>
> Avoid a null pointer dereference.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../unzip/unzip/CVE-2021-4217.patch           | 65 +++++++++++++++++++
>  meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
>
> diff --git a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
> new file mode 100644
> index 0000000000..7262d14df4
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
> @@ -0,0 +1,65 @@
> +From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
> +From: Nils Bars <nils.bars@t-online.de>
> +Date: Mon, 17 Jan 2022 16:53:16 +0000
> +Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
> +
> +This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
> +to read as many bytes as indicated by the extra field length attribute.
> +Furthermore, this fixes a null pointer dereference if an archive contains an
> +`EF_UNIPATH` extra field but does not have a filename set.
> +---
> + fileio.c  | 5 ++++-
> + process.c | 6 +++++-
> + 2 files changed, 9 insertions(+), 2 deletions(-)
> +---
> +
> +https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
> +Regenerated to apply without offsets.
> +
> +CVE: CVE-2021-4217
> +
> +Upstream-Status: Inappropriate [not author]
> +
> +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> +
> +
> +diff --git a/fileio.c b/fileio.c
> +index 14460f3..1dc319e 100644
> +--- a/fileio.c
> ++++ b/fileio.c
> +@@ -2301,8 +2301,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
> +             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
> +                       (G.inptr-G.inbuf) + length);
> +         } else {
> +-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
> ++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
> ++            if (bytes_read == 0)
> +                 return PK_EOF;
> ++            if (bytes_read != length)
> ++                return PK_ERR;
> +             /* Looks like here is where extra fields are read */
> +             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
> +             {
> +diff --git a/process.c b/process.c
> +index 5f8f6c6..de843a5 100644
> +--- a/process.c
> ++++ b/process.c
> +@@ -2058,10 +2058,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
> +           G.unipath_checksum = makelong(offset + ef_buf);
> +           offset += 4;
> +
> ++          if (!G.filename_full) {
> ++            /* Check if we have a unicode extra section but no filename set */
> ++            return PK_ERR;
> ++          }
> ++
> +           /*
> +            * Compute 32-bit crc
> +            */
> +-
> +           chksum = crc32(chksum, (uch *)(G.filename_full),
> +                          strlen(G.filename_full));
> +
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
> index af94a39195..c222a684b4 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
>         file://CVE-2019-13232_p3.patch \
>         file://unzip_optimization.patch \
>          file://0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch \
> +        file://CVE-2021-4217.patch \
>  "
>  UPSTREAM_VERSION_UNKNOWN = "1"
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163865): https://lists.openembedded.org/g/openembedded-core/message/163865
> Mute This Topic: https://lists.openembedded.org/mt/90161682/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

