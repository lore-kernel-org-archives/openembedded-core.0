Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7132710BA434
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 23:36:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1690.1774654588203972447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 16:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QJcpj5qz;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so33101695e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774654586; x=1775259386; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpvE7ApcPl1AHAb2MKIgpvrbfiUzRKGsFWd+Mcbe6ro=;
        b=QJcpj5qzOsZEFdnoDRkQ+C2oQZHku1jIcFx+MA+Cjv60ah2B79wP7CkovwHpSixYNh
         YuWx6RHopIEtD9/LgJHBYEm3lGB3I7fwGZZFwUa99ScVCv1YF9wIvwmWU1GOlYb8LLZq
         KuLURvq1a3LxNJiiwhDl4YyPyP02KMYy6fjQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774654586; x=1775259386;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpvE7ApcPl1AHAb2MKIgpvrbfiUzRKGsFWd+Mcbe6ro=;
        b=VIrSFIuHiXoVT+kva/dG9J+JuCA2UyR1KX8ELRS3SaGjPBa43Z+DT4ta84ojb5aYvL
         a7xRKYfgXDMZXiUYnc34NGm8TvZtYIqc55lcZp5F39C4pBZyEcTyL16WujlT3HA6XB1K
         rFz5OeQr1Ffzgkss2M2OUvAeblbs62YZwRnV/ygaFgLDiGa9j6FZ5Ih1MRtUHs5CF+F6
         WqrfySQ6llSPQYoVzSF6lVudu4Cu/EYejwbeBdxITpaQ8s9s2TuFqYqUWlNcBiBh7cOU
         a3T9lzrt7wNsrEEkZmVgTmOtWa3SYeVcNcvH9+fUMBosqxNuYXkLDY+bCNzbfklhqZEB
         jJvg==
X-Forwarded-Encrypted: i=1; AJvYcCXi8ABXkSgpzQiB3pt+1qz8nUnPw3+RnO4txJqs4EAYic+TWRnP0wAr1Q0eq5CQ/bO7qUdEH38s6EZQi/sUSyMz5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzr64LUXNH7QF50PqfHMhjSZBM2yupVLfMtoF8CEcop1C55EjtF
	zyBE45RtL7JiOOlEY9RjwjcLzfceeva59q/96paAbs0LE5Ov87+2Pr27vyJYZZQwguA=
X-Gm-Gg: ATEYQzxxo8Zc0nOdTeO3eXJecWGjfV2shWay85XjSr3qc6HIlgrVlu6F2UZk4oQvSeD
	+RFTYFaECRPR271eZMTDsVS8ZtbuSFUhoxaDsfbcAWQiHrIWB5++KX0H9KPr2KWfLBBH7Qv4jA3
	0cmqTVzeH5kmqGtL8Nkc1n4wzKx2YEu/grod+rdIXZ0wh9615lzxmWz10PdD+JoBd35vYX50wbv
	8mtN42MUXbJE2fDuVTx4dllpG3f9RxJZYRXSnhVS9PE06i29xTWnmQmO6RCjhWWX9bGz7VOuUBN
	jamJC7g6hYG9Sp5q8xjMtCoUacs7jVVPIdVYm5QvMobSgRiwH82MPQ4R8XKTQOoyo980z0Aanz0
	ig2s9XObHSPUgBKLCn+sQyoQPvx+mHiTZDcdHtZnQcxzic0ws+4d/dwp6M8LL2vwsA1c0c6JN+J
	3Tpyp7E45m8b6Da30m/4qrx2z9/0FOhyo+D+KQs6ph9o/4YGwJzNkZRGVq/3okyDMpkMSue0oH2
	jFJPmvl0jma20s=
X-Received: by 2002:a05:600c:1f13:b0:487:169:9f64 with SMTP id 5b1f17b1804b1-48727d73709mr70816285e9.12.1774654586522;
        Fri, 27 Mar 2026 16:36:26 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873061f44csm13910475e9.1.2026.03.27.16.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 16:36:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 00:36:25 +0100
Message-Id: <DHDYJPLHXWYQ.3J88UZRXHD7MN@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] systemd: backport patch to fix
 journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "sureshha" <suresh.ha@bti.bmwgroup.com>, "sureshha"
 <suresh.ha@bmwtechworks.in>
To: <git-patches@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260326073855.2075702-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260326073855.2075702-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 23:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234112

On Thu Mar 26, 2026 at 8:38 AM CET, Suresh H A via lists.openembedded.org w=
rote:
> From: sureshha <suresh.ha@bti.bmwgroup.com>
>
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files
>
> Extracted from systemd MR:
> https://github.com/systemd/systemd/pull/40378
>
> Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> ---

Hello,

Thanks for the patch. It looks like this is also needed in whinlatter
and master. You need to send this fix there first, before I can take
this on scarthgap.

>  ...not-trigger-assertion-on-removed-or-.patch | 65 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-t=
rigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0=
023-journal-file-do-not-trigger-assertion-on-removed-or-.patch
> new file mode 100644
> index 0000000000..5f5551870a
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0023-journal-file-do-not-trigger-=
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
> +Upstream-Status: Backport [https://github.com/systemd/systemd/commit/218=
5c30de333b09f46ef28b743b123f45e774738]
That URL point to an unmerged commit.
I think you want this one: https://github.com/systemd/systemd/commit/112cbc=
37906fb97afe0ad04164262cf62d0af5e9

Thanks!

> +
> +Comment: Patch is refreshed as per codebase of v255
> +
> +Signed-off-by: sureshha <suresh.ha@bmwtechworks.in>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/s=
d-journal/journal-file.c
> +index 08f3b82..633de5b 100644
> +--- a/src/libsystemd/sd-journal/journal-file.c
> ++++ b/src/libsystemd/sd-journal/journal-file.c
> +@@ -3305,7 +3305,9 @@ use_extra:
> +
> + static int test_object_offset(JournalFile *f, uint64_t p, uint64_t need=
le) {
> +         assert(f);
> +-        assert(p > 0);
> ++
> ++        if (p <=3D 0)
> ++                return -EBADMSG;
> +
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
> +2.34.1
> diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-c=
ore/systemd/systemd_255.21.bb
> index 87e186bbfa..504d6cbef6 100644
> --- a/meta/recipes-core/systemd/systemd_255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -29,6 +29,7 @@ SRC_URI +=3D " \
>             file://0002-binfmt-Don-t-install-dependency-links-at-install-=
tim.patch \
>             file://0003-timedated-Respond-on-org.freedesktop.timedate1.Se=
tNT.patch \
>             file://0008-implment-systemd-sysv-install-for-OE.patch \
> +           file://0023-journal-file-do-not-trigger-assertion-on-removed-=
or-.patch \
>             "
> =20
>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


