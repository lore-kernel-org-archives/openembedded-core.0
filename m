Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2008110FCADC
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 21:25:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2570.1775078755305098046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 14:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=D28Z0/ZQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4888244e9f9so1385935e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775078753; x=1775683553; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Yr8eJekndeklbcWHmP0TCkRGKCtSRlU5EkKlhyhb8Q=;
        b=D28Z0/ZQXUfVVtd8obgXKFIsUOo9FvG8DmaPQqtGLxYdgVOKs6SzlcNig7djuYXYm7
         m/QoyPMvKDA3aZ9TocQ6JGbpYrwAdoExXh4umIdQikDjlhgkVARxVW4USBvfT4LnazWN
         Uv4+DfCuBWUIHATo5xQDnT1kGIMP0KVaePrjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078753; x=1775683553;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Yr8eJekndeklbcWHmP0TCkRGKCtSRlU5EkKlhyhb8Q=;
        b=hUeKwn/IpRD06m4x28wZ8wyel5mb84PCWk99crUKT0yAotlPI5pGYrWoloVv5Q9XiM
         OtYUJH5I1rY2scW0y4PCfiLdmqCOfDo1ZWy/gxgX/PlT1a8EX42Hl1X3avn0zURYkDvZ
         yuhX6SxWy8UW+Y8k1emGAb1fWVDnIqsxbyF0so83UUk30JU23TiPtRd5xMicZs1dTeBK
         Lkt5mVEbGCATRskHLUurJDik1vjLM7wORQpluj+X93TA9neLvDjb2/dGyE4q9LPPk26N
         nCqLuiYdpn5qgr98gfcqQDJwcWQjvnD+kX0dwtYpiA52lKoa6y88+j0ypJJoMjgJQBKR
         gIpg==
X-Forwarded-Encrypted: i=1; AJvYcCWqoWljfUJJxRFCwBbR594iubT8SutaBwZA7mgg4Zwhw9l+og4OI1cUq4j7vcoQ/AtrxSeJ4DsG0dauoZh39U+rrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXbpHQQL+b54mJwqH+igvzwwu6Az8FC/4M7hyWZaTXG/kvgFag
	+sKUvs6SaNl98bSJws8RCOiQNSOzXRCXBpQbHPxhL+YQN1eAeWotWTzKwFiL9mngcTA=
X-Gm-Gg: ATEYQzy8NsUJPsYBqAqNQ4MMQaMNm2IB1EnTxhXJ9EUwkGhNR5a207Uf2dzYsSfGSlf
	2F0kazJfXI9mTGX1Lt2izBP3zOv1PFMM5OQsZ23g+MFs4IUCsDO88vpfrZI1rBq3J+URw8R6YY7
	G5jeVYf3J4hpjgL2OtIz7xtPcUQ4TdhoQ40JNbo1uPJu2Is4a128y087n0l4zcLGoFLYPb+bheO
	sdLFT2OnjB79ZRUIHGdrjLVB8AWJIkuYsoG+/TDCbWxXNEZMwtaay+lF0+kzMjFwIufPtiL81oh
	M703ZyOi4dB9D1nFP26E92rmrdS52kj94X5h7qFIcKK8ebUggBhFsl2VAvO5AkT99rnKba8kElt
	GDIsWXymvuRNV96vKP6C+8h7+PsJrYKMvQA914v7DVHiCR9jZ8pqmAyvXphnttwdnBMN6yK+iH+
	9O/KybZY96wveMsqLff9kLKuput5iErDmMWiVddeHX7I5Ug5ikkFVXG2hlBXzrTGGXw33YEN88A
	8GbZlAlxkYKYjs=
X-Received: by 2002:a05:600c:c056:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-488835b75c4mr61535815e9.20.1775078753433;
        Wed, 01 Apr 2026 14:25:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a63esm189226415e9.3.2026.04.01.14.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 14:25:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 23:25:52 +0200
Message-Id: <DHI4WHEIR451.1281IT2B0BQL1@smile.fr>
To: <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH] systemd: backport patch to fix
 journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "sureshha" <suresh.ha@bmwtechworks.in>
X-Mailer: aerc 0.20.0
References: <20260330102154.991029-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260330102154.991029-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 21:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234463

On Mon Mar 30, 2026 at 12:21 PM CEST, Suresh H A via lists.openembedded.org=
 wrote:
> From: sureshha <suresh.ha@bmwtechworks.in>
>
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files
>
> Extracted from systemd MR:
> https://github.com/systemd/systemd/pull/40378
>
> Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> ---
>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_257.8.bb    |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0027-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0027-journal-file-do-not-t=
rigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0=
027-journal-file-do-not-trigger-assertion-on-removed-or-.patch
> new file mode 100644
> index 0000000000..e1bb556271
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0027-journal-file-do-not-trigger-=
assertion-on-removed-or-.patch
> @@ -0,0 +1,65 @@
> +From 1350f39db7e72116c3b2423db02da3ddc8e29082 Mon Sep 17 00:00:00 2001
> +From: Yu Watanabe <watanabe.yu+github@gmail.com>
> +Date: Sun, 18 Jan 2026 19:15:31 +0900
> +Subject: [PATCH] journal-file: do not trigger assertion on removed or
> + corrupted journal file
> +
> +When a journal file is removed or corrupted, then the value `p`, which i=
s
> +read from Object.data.entry_offset, may be zero.
> +
> +Note, journal_file_move_to_object() checks the passed offset and return
> +-EBADMSG if it is invalid.
> +
> +Fixes the issue reported at
> +https://github.com/systemd/systemd/pull/40372#issuecomment-3762907261.
> +
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/112=
cbc37906fb97afe0ad04164262cf62d0af5e9]
> +
> +Comment: Patch is refreshed as per codebase of v257
> +
> +Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +

Hello,

This patch has a weird format. Every spaces at end of line were removed,
but in the empty or white space only context lines, those should be
kept. Examples below:

> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/s=
d-journal/journal-file.c
> +index 08f3b82..633de5b 100644
> +--- a/src/libsystemd/sd-journal/journal-file.c
> ++++ b/src/libsystemd/sd-journal/journal-file.c
> +@@ -3305,7 +3305,9 @@ use_extra:
> +
   ^ Here should be a space.

> + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t need=
le) {
> +         assert(f);
> +-        assert(p > 0);
> ++
> ++        if (p <=3D 0)
> ++                return -EBADMSG;
> +
   ^ And here
> +         if (p =3D=3D needle)
> +                 return TEST_FOUND;
> +@@ -3341,7 +3343,6 @@ static int test_object_seqnum(JournalFile *f, uint=
64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3382,7 +3383,6 @@ static int test_object_realtime(JournalFile *f, ui=
nt64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -3423,7 +3423,6 @@ static int test_object_monotonic(JournalFile *f, u=
int64_t p, uint64_t needle) {
> +         int r;
> +
> +         assert(f);
> +-        assert(p > 0);
> +
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +--
     ^ here, the usual pattern to separate signature is "-- " (a space)
       not "--" (no space)

Can you check and fix please? (also check your other patches in other
branches)

Patch otherwise looks good.

> +2.34.1
> diff --git a/meta/recipes-core/systemd/systemd_257.8.bb b/meta/recipes-co=
re/systemd/systemd_257.8.bb
> index 549eb7fb29..a53959f816 100644
> --- a/meta/recipes-core/systemd/systemd_257.8.bb
> +++ b/meta/recipes-core/systemd/systemd_257.8.bb
> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>             file://0001-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0002-implment-systemd-sysv-install-for-OE.patch \
>             file://0001-Do-not-create-var-log-README.patch \
> +           file://0027-journal-file-do-not-trigger-assertion-on-removed-=
or-.patch \
>             "
> =20
>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


