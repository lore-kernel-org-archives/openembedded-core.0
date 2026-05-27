Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBADCD4F54
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 06:55:43 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14343.1779864937394183148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 23:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=076sWYqq;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490426d72f7so46421385e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779864936; x=1780469736; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb/oI/etwnnpiZSUfFP1OGAG2TcgwTjN0Bso9Ary5BM=;
        b=076sWYqqEsFuXzSoKHQiyxJFYneW+YgDlo42P5aKF6Ly5K7j+LJ395ptUC+osldlcU
         4wH+T8lQA6EbFSSuiZKY74lt9u8bumV9/exEwLiOOzPY+RLddd5d1/1BpkaZ33OVnfA0
         eCYY2BMGhzdBcY9UR4Uh6/V6BFMonUG+EpOE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779864936; x=1780469736;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zb/oI/etwnnpiZSUfFP1OGAG2TcgwTjN0Bso9Ary5BM=;
        b=Qy6dEO+rV4acVS/pTkj37wcoHK4gvvwLBbFuInFUuXqpuBI0oHbI1lO5sLIkdJV0xy
         XNrzlcHlicUTTIf/tLBrdhbVKYchQeY0+Spvs3lGFNbnl4YRzhPYEziPcRshNjGF6vCX
         zz05F/X4RKnBN5Z+Jb8pxWVLi/mlZR3vJ1zIbt73F148/Y0TT9U8E28DAgh0MwIZT9Re
         W6jhe7OhUJJUupn0m3ezH6HmGbhaCtFqV10ondrSLXja1mCfkwV6Mk+KilqAkCzi4wbU
         1JGVuroBGQF3BYCfNT2yBgQ1/+nJ8rwFuFGnjTebg64ICt5TfCTy6/rPfEFMFlGvD85o
         FhNw==
X-Forwarded-Encrypted: i=1; AFNElJ/I5dKlsywgEuGezREtGrs8FXPTPhyuu+V0TqlvEBVhNiLmBfAeh1qC8odGao1EMkvwDv9R6VWpCEZVNMB35+IHEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIcc1r+oc84N+eFlQ3shqrVmAaBVJPEkmrf92ZMaOOtd+fkxUc
	DQU1hPHIz7OETCzONK5Q7yA1VvuJCbzyVXjY3xjQOY3JIgNXCmce/9JVaJiUIH+VItA=
X-Gm-Gg: Acq92OFWHJ79dJ+j8u7JSc9iH2lKESePs0FqWDT0M4uMs73JSQi2N9kwfQXIiyKP3l9
	Yxxnoq6CkQwVERFX40r/n7SSI/BjJhoyBk625VthbIcpu9z3gXUNv3zzFIIRA09/8jdyXqopn2c
	g7lGJVhCbkpeaUpn5+xR3YljNRYCxaZMF+7EdcrrDvAiVelT/M+4qZNLmB1WikzzPc9wwtjXRQ3
	Q31TvqlUQmnIzePpwShp4oTzfs4cnfqsKyb63r9dIZCb/wWyqySj0qc3Jrr3t1VzZLrRQnj3UsC
	5XVIQXe3h9eWcDXd3/YvFstJrarT6+P++ikb2STWZogFIFBsbdHX3IzLnpt7hiihlmoyIPnRkfV
	XgBAZR25lCguKCJwL/BLil71jNIKLJ5j0HbXNOXiQLj3xrtz5ayjye8TIAAnQ+KsqhkX2ZaRp8n
	1xG+pp0jZkpaI/oQgLnAknB/4f5Z0K9m8UQz6ZgO99xZZroCZK+z35I40jkKC/L1g1h6b0q0CfT
	D5AAepXgIU=
X-Received: by 2002:a05:600c:8485:b0:490:5074:651e with SMTP id 5b1f17b1804b1-4905074659bmr275670805e9.25.1779864935608;
        Tue, 26 May 2026 23:55:35 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b82sm398410915e9.9.2026.05.26.23.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 23:55:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 08:55:35 +0200
Message-Id: <DIT9GN91CQ6G.1Y0O1OUB5MXZU@smile.fr>
To: <sureshannaiah.mailbox@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][kirkstone][PATCH v4] systemd: backport patch
 to fix journal-file issue
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260525192246.2813508-1-sureshannaiah.mailbox@gmail.com>
In-Reply-To: <20260525192246.2813508-1-sureshannaiah.mailbox@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 06:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237630

On Mon May 25, 2026 at 9:22 PM CEST, Suresh H A via lists.openembedded.org =
wrote:
> Backport patch to fix systemd journal-file assertion on removed or corrup=
ted files.
>
> Extracted from systemd MR:
> https://github.com/systemd/systemd/pull/40378
>
> Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>

Hello,

Kirkstone is EOL so I can't accept this patch, sorry.

You might try to send it to meta-lts-collab[0] but, since this is a
bugfix and not a security fix, this patch might be out-of-scope.

[0]: https://git.yoctoproject.org/meta-lts-collab/about/?h=3Dkirkstone

Regards,

> ---
>  ...not-trigger-assertion-on-removed-or-.patch | 67 +++++++++++++++++++
>  meta/recipes-core/systemd/systemd_250.14.bb   |  1 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0029-journal-file-d=
o-not-trigger-assertion-on-removed-or-.patch
>
> diff --git a/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-t=
rigger-assertion-on-removed-or-.patch b/meta/recipes-core/systemd/systemd/0=
029-journal-file-do-not-trigger-assertion-on-removed-or-.patch
> new file mode 100644
> index 0000000000..ade8cc3b62
> --- /dev/null
> +++ b/meta/recipes-core/systemd/systemd/0029-journal-file-do-not-trigger-=
assertion-on-removed-or-.patch
> @@ -0,0 +1,67 @@
> +From e89f166158b72a6ad022c9c795983bfe0a20cc36 Mon Sep 17 00:00:00 2001
> +From: Suresh H A <sureshannaiah.mailbox@gmail.com>
> +Date: Mon, 25 May 2026 22:58:17 +0530
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
> +Upstream-Status: Backport
> +[https://github.com/systemd/systemd/commit/112cbc37906fb97afe0ad04164262=
cf62d0af5e9]
> +
> +Comment: Patch is refreshed as per the codebase of v250
> +
> +Signed-off-by: Suresh H A <sureshannaiah.mailbox@gmail.com>
> +---
> + src/libsystemd/sd-journal/journal-file.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libsystemd/sd-journal/journal-file.c b/src/libsystemd/s=
d-journal/journal-file.c
> +index bac258ca42..7b6b7eea2e 100644
> +--- a/src/libsystemd/sd-journal/journal-file.c
> ++++ b/src/libsystemd/sd-journal/journal-file.c
> +@@ -2602,7 +2602,9 @@ found:
> +=20
> + _pure_ static int test_object_offset(JournalFile *f, uint64_t p, uint64=
_t needle) {
> +         assert(f);
> +-        assert(p > 0);
> ++
> ++        if (p <=3D 0)
> ++                return -EBADMSG;
> +=20
> +         if (p =3D=3D needle)
> +                 return TEST_FOUND;
> +@@ -2618,7 +2620,6 @@ static int test_object_seqnum(JournalFile *f, uint=
64_t p, uint64_t needle) {
> +         int r;
> +=20
> +         assert(f);
> +-        assert(p > 0);
> +=20
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -2658,7 +2659,6 @@ static int test_object_realtime(JournalFile *f, ui=
nt64_t p, uint64_t needle) {
> +         int r;
> +=20
> +         assert(f);
> +-        assert(p > 0);
> +=20
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +@@ -2698,7 +2698,6 @@ static int test_object_monotonic(JournalFile *f, u=
int64_t p, uint64_t needle) {
> +         int r;
> +=20
> +         assert(f);
> +-        assert(p > 0);
> +=20
> +         r =3D journal_file_move_to_object(f, OBJECT_ENTRY, p, &o);
> +         if (r < 0)
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/systemd/systemd_250.14.bb b/meta/recipes-c=
ore/systemd/systemd_250.14.bb
> index 087c0035eb..b85363ad81 100644
> --- a/meta/recipes-core/systemd/systemd_250.14.bb
> +++ b/meta/recipes-core/systemd/systemd_250.14.bb
> @@ -35,6 +35,7 @@ SRC_URI +=3D "file://touchscreen.rules \
>             file://CVE-2025-4598-0002.patch \
>             file://CVE-2025-4598-0003.patch \
>             file://CVE-2025-4598-0004.patch \
> +           file://0029-journal-file-do-not-trigger-assertion-on-removed-=
or-.patch \
>             "
> =20
>  # patches needed by musl


--=20
Yoann Congal
Smile ECS


