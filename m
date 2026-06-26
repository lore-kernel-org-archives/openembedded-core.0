Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6428C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 23:06:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45958.1782515195513957532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 16:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g4xr5cCw;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-46fe472da0dso447335f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782515193; x=1783119993; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99pyHlo2YCgKoB2CCHaEDLLIOJ2EMzu9HzuD/6pRpcE=;
        b=g4xr5cCwxiyC5zq/tLPd6z9x6iDpfVTRmAPjtg2ZaO3/HgmCZTnFiSqTazq89F3Jgv
         GRHKnOS3WnhvBtiELlXZICcc54ea9RvjlylGsqg59JIQeq7rlX3Z6lk8s3HK5gKMe3eY
         My9eWodP6nayxnbqOyi6Px8X9UXMSozlDuH5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782515193; x=1783119993;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=99pyHlo2YCgKoB2CCHaEDLLIOJ2EMzu9HzuD/6pRpcE=;
        b=HqR6kqmiDsgQ1YhHM4bmbp3z8YcGzwlaewBFBH+2eQS5+hAfX+jIQA4WC+YSzydPkf
         yV5At+9ah/17cCsppczCzOjq9yiTM1olhvOp9eptA9wzKwyTUFJOPUcViU3HJm4AT4in
         4OdzZX7pUB4ugWzU7ji4f0zA8c+TXA80bNqVGD9aCbYvC4Qu6qFrbiPyrJpdzkpSMQsf
         0q4VXfnCfo8leX2un3F2c/YS8RQx0hEqp5Z9iUGVNa3081MRhYnQsQF1YrE1CYlKitKy
         X5qmnef1kCJGfS01ZTshKOGZNakH1bzlFLZbdHQ9JS0+6WBdTXsNZAXd0S6yHx6NmLE6
         Cg4g==
X-Forwarded-Encrypted: i=1; AHgh+RprUjB5vg3xQ3tw+q5QRpIpAw0E2itFHwyD/yZqB+NAmwc1WKMJyu0zJAxyXO1hzzw1z49o9rin7BYlEr+N/oR5Tw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeiPfGIE0JY71mLpm42FGEQsoc+JqUt8dcTIQpQ9/5yM/4sFu/
	n/nU38/iBDtggww9LydEFOTfVk6DJNsXLNGXW6GsiWuL8SkA5Fy1mFyMwNDE59bFybc=
X-Gm-Gg: AfdE7clwqwAE0Autsw/gMN7EhmcjJvoAlx1ePQhcA0IwHBKFiKFH/PzMgUXOZXHy80C
	aEt+iN5vxAIvA/tP0119gMfoQ80EgeVHUjsgmqasTgGMjLRHs1HCv1YyFNeLIS4l75N7zQPrw9F
	2ewrVdMxHIzPJI9Z8TwtQ3pQ6Z8KS59dy4YTMXaNHIy8TzcfG8Fz8+0uDSplkfWpEz+intwoo5D
	qweneESrca4RK9Sj3kX07S5Igj9oBNxgmOQPt4wyQEVefMHlpfvMNf48HcB6fRnEw/4MY8OyfU4
	ZfEYeoQj+gKUQFsxhd9mi/Eq66YuBq3rnT2QMW3NAsPS5VxT3E4syIMBKM2X5akM5W/nyF1O1Ti
	xBl3UMRddVgU5sPQmygLq36+7GEekweTjApr+qWOSdVZOpircTFb5WPd+ta1HqqjImMasvkhO3n
	JtqWjqxTfPoDnC0NokcgcnLAxEQ+OvrTBkjKD72eyt546HNdrpOlVCfvKhiDtEz5f8Fo+S98WNi
	Qh6sQ==
X-Received: by 2002:adf:e012:0:10b0:46d:cc92:e00e with SMTP id ffacd0b85a97d-46dcc92e148mr9949154f8f.35.1782515193564;
        Fri, 26 Jun 2026 16:06:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46e3d6ba143sm15913291f8f.33.2026.06.26.16.06.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 16:06:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 01:06:32 +0200
Message-Id: <DJJCWETHYRIH.1MYP9M9XYIZAS@smile.fr>
Subject: Re: [OE-core] [scarthgap] [patch] libssh2: fix CVE-2026-55200
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <anders.heimer@est.tech>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260622093400.2735723-1-daniel.turull@ericsson.com>
In-Reply-To: <20260622093400.2735723-1-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 23:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239669

On Mon Jun 22, 2026 at 11:33 AM CEST, Daniel Turull via lists.openembedded.=
org wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Backport patch to fix CVE-2026-55200.
> https://nvd.nist.gov/vuln/detail/CVE-2026-55200
>
> Upstream fix:
>   https://github.com/libssh2/libssh2/commit/97acf3dfda80c91c3a8c9f2372546=
301d4a1a7a8
>
> Tested with ptest:
> Before: PASSED: 3, FAILED: 0, SKIPPED: 0
> After: PASSED: 3, FAILED: 0, SKIPPED: 0
>
> Reviewed-by: Anders Heimer <anders.heimer@est.tech
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  .../libssh2/libssh2/CVE-2026-55200.patch      | 51 +++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.11.1.bb |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.p=
atch
>
> diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> new file mode 100644
> index 00000000000..f5ab9b9f204
> --- /dev/null
> +++ b/meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
> @@ -0,0 +1,51 @@
> +From df0b03ee5ef12f3a46fccc0fc688ebfb91702972 Mon Sep 17 00:00:00 2001
> +From: Will Cosgrove <will@panic.com>
> +Date: Fri, 12 Jun 2026 15:57:44 -0700
> +Subject: [PATCH] transport.c: Additional boundary checks for packet leng=
th
> + (#2052)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Backport Resolution: Add additional bounds checking on packet length to
> +prevent OOB write =E2=80=94 checks that packet_length is not below 1 and=
 not
> +above LIBSSH2_PACKET_MAXPAYLOAD before proceeding.
> +
> +Conflicts Resolved:
> +
> +src/transport.c (1 conflict):
> +- Upstream uses renamed API ssh2_ntohu32(); stable branch uses
> +  _libssh2_ntohu32(). Kept stable function name while applying the
> +  new upper-bound check (LIBSSH2_PACKET_MAXPAYLOAD) unchanged.
> +
> +Assisted-by: kiro:claude-sonnet-4.6
> +
> +Changes from upstream commit 97acf3dfda80:
> +  - src/transport.c: adapted from upstream

While resolving the conflict, your AI completely rewrote the patch
message and notably removed the Credit: line.

Please keep the original patch message and put the backporting
information below the "Upstream-Status:" line. While you changing this,
the conflict resolution is trivial, no need to be so verbose (a line
referencing ssh2_ntohu32 should be enough).

Thanks!

> +
> +CVE: CVE-2026-55200
> +Upstream-Status: Backport [https://github.com/libssh2/libssh2/commit/97a=
cf3dfda80c91c3a8c9f2372546301d4a1a7a8]
> +
> +Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> +---
> + src/transport.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/transport.c b/src/transport.c
> +index e1120656..d147505b 100644
> +--- a/src/transport.c
> ++++ b/src/transport.c
> +@@ -639,8 +639,12 @@ int _libssh2_transport_read(LIBSSH2_SESSION * sessi=
on)
> +                 total_num =3D 4;
> +=20
> +                 p->packet_length =3D _libssh2_ntohu32(block);
> +-                if(p->packet_length < 1)
> ++                if(p->packet_length < 1) {
> +                     return LIBSSH2_ERROR_DECRYPT;
> ++                }
> ++                else if(p->packet_length > LIBSSH2_PACKET_MAXPAYLOAD) {
> ++                    return LIBSSH2_ERROR_OUT_OF_BOUNDARY;
> ++                }
> +=20
> +                 /* total_num may include size field, however due to exi=
sting
> +                  * logic it needs to be removed after the entire packet=
 is read
> diff --git a/meta/recipes-support/libssh2/libssh2_1.11.1.bb b/meta/recipe=
s-support/libssh2/libssh2_1.11.1.bb
> index 2284d054b10..d6ee97f7ed0 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.11.1.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.=
gz \
>             file://run-ptest \
>             file://0001-Return-error-if-user-KEX-methods-are-invalid.patc=
h \
>             file://CVE-2026-7598.patch \
> +           file://CVE-2026-55200.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a5=
6b0f109cabf658f7"


--=20
Yoann Congal
Smile ECS


