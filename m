Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C77CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 21:28:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6611.1778189295517655798
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 14:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ASrtI2Fi;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so16234745e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 14:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778189294; x=1778794094; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKcugPMyw74D4YsKdN0gdGAjxXi+1zAuPnSthKNPKmk=;
        b=ASrtI2Fi/pVsV01vt2YzeK23lGrbkde9F0SnAGKNXExRbTqVEviJxkvjMHjiN9DhXy
         y4IR+0pUUj8PcfUG3mdQGmoDAmnMaK1OrXJQeEkZq7BTm4X9Z4VCBogOQr2ydsyQboeP
         oYNxOjdga0CaNGfRFSomkeXCXVG66m2z/0kDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778189294; x=1778794094;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cKcugPMyw74D4YsKdN0gdGAjxXi+1zAuPnSthKNPKmk=;
        b=DwnhrHajwofT2EN28TlitW5EbyHj4vdUsgH7n7Ur3mfwqLNWAiaB3X8SPZsCTyUwiq
         AiRX3O82pjH77AKAdOGMDSBQPiWJUG+/e/6YlucyShcCXsKzlTGEjH7cCKOGFFqcEoYs
         kAQoqenR2tiBaVgYntdKD79lTlfq0cfesoR2h0rG6EqoKD3YtbT1CPM7vlj1n/9vERQk
         VMOnFbbCgxUeJsTxfAFw/7iCtXqNaLYk/XdHq+Uq+JpZPg5eeAc9A01ZcM1gPlGbMs7Q
         VmYKCOI5Gzh3odNMi22sPfQY3tht7kg3CPUwtjZ+6oDIrcFkknZYk2Z6zGcDC5EioZMD
         nx0w==
X-Forwarded-Encrypted: i=1; AFNElJ8MeDCGPt+mTqjlhI+o2q9L2ZYbbtksWN7LgBIYfmfI7PKZ3PKGpE6qZK8/4HFXPlZ0EVW+DaP8MN9om5QWqmk6Rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjHCsJA2CoglrX+xAHE32QmwkdrBibICi/6gf211zGF96t2CO5
	OFF2wDYp4St7n8K7u4kBZCHDuxXWbV9zz7MR20yP+iRfeb4hJ+Q6Oohh0I8ptYrETnZk4egpfLQ
	8Y+1/a8A=
X-Gm-Gg: AeBDievfAZNDpuD9aMQGkO5Up7hkMkp9QVS9a2gCIx6AIqpU0tAh/JmG0E7m35CFf3j
	q9tP3a3d1essoAeXnhcCIWgKocIYh1nyyL0JTsE0GtReR00csDHfhhkQJAlRZhumCoKBmiW9Cs8
	s5EXVQbHV2vLQ4vOrFTdE5Q3lTwDEjmFrpO+uWYmrAb/CjVPFgphUdeoqHyPa5oIIHJVWXQrWGS
	xJWXcX0R/f9syZ44Q3RkKQQLpGIlaWrZHmy1qPzaqnx0B9VsH3P9MRMfSjBWDtHJlTJVXbA9se3
	w1dc/rSZOyTBouq/sjgiT/EfXC/sHnJofzJ0Rmq+HsIxJx8BK+8fZcJ5YFi9ZIUS0xGnfbqdmKg
	dUx7fTmLM860Gd4aTrtcHLPwetHX/zslnYl0boy/JCIGgbHIBq/bQxuSyjtCImpP4ouYqUl6v7P
	jSwb8LjQKxRvFyhkLImZNXj5ZmV8lV2yHykyeMtQJmyH7ZR3oy2OJNimPOp1tfggvqKabDylBax
	ISm/O4g5AtYeXzPOrfQQI7U8Q==
X-Received: by 2002:a05:600c:c096:b0:485:40db:d40c with SMTP id 5b1f17b1804b1-48e51e08fedmr113622235e9.3.1778189293811;
        Thu, 07 May 2026 14:28:13 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53895effsm147760835e9.3.2026.05.07.14.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 14:28:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 07 May 2026 23:28:13 +0200
Message-Id: <DICRHW0X7VHE.3G2EKQILR56WQ@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] python3: fix CVE-2026-6100
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260429122902.304581-1-hprajapati@mvista.com>
In-Reply-To: <20260429122902.304581-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 21:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236623

On Wed Apr 29, 2026 at 2:29 PM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1] also mentioned at NVD report in [2]
>
> [1] https://github.com/python/cpython/commit/c3cf71c3366fe49acb776a639405=
c0eea6169c20
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-6100
> [3] https://security-tracker.debian.org/tracker/CVE-2026-6100
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>

Hello,

As fas as I can tell, this patch is also needed on master and wrynose.
I can't merge here until this is fixed on those branches.

Can you send a patch to fix this on these branches and then, ping back here=
?

Thanks!
> ---
>  .../python/python3/CVE-2026-6100.patch        | 75 +++++++++++++++++++
>  .../python/python3_3.12.13.bb                 |  1 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6100.pa=
tch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-6100.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-6100.patch
> new file mode 100644
> index 0000000000..9084101434
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-6100.patch
> @@ -0,0 +1,75 @@
> +From c3cf71c3366fe49acb776a639405c0eea6169c20 Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 13 Apr 2026 03:35:24 +0200
> +Subject: [PATCH] [3.13] gh-148395: Fix a possible UAF in
> + `{LZMA,BZ2,_Zlib}Decompressor` (GH-148396) (#148479)
> +
> +gh-148395: Fix a possible UAF in `{LZMA,BZ2,_Zlib}Decompressor` (GH-1483=
96)
> +
> +Fix dangling input pointer after `MemoryError` in _lzma/_bz2/_ZlibDecomp=
ressor.decompress
> +(cherry picked from commit 8fc66aef6d7b3ae58f43f5c66f9366cc8cbbfcd2)
> +
> +Co-authored-by: Stan Ulbrych <stan@python.org>
> +
> +CVE: CVE-2026-6100
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/c3cf=
71c3366fe49acb776a639405c0eea6169c20]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + .../Security/2026-04-10-16-28-21.gh-issue-148395.kfzm0G.rst  | 5 +++++
> + Modules/_bz2module.c                                         | 1 +
> + Modules/_lzmamodule.c                                        | 1 +
> + Modules/zlibmodule.c                                         | 1 +
> + 4 files changed, 8 insertions(+)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-iss=
ue-148395.kfzm0G.rst
> +
> +diff --git a/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-1483=
95.kfzm0G.rst b/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-1483=
95.kfzm0G.rst
> +new file mode 100644
> +index 0000000..9502189
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-04-10-16-28-21.gh-issue-148395.kfzm=
0G.rst
> +@@ -0,0 +1,5 @@
> ++Fix a dangling input pointer in :class:`lzma.LZMADecompressor`,
> ++:class:`bz2.BZ2Decompressor`, and internal :class:`!zlib._ZlibDecompres=
sor`
> ++when memory allocation fails with :exc:`MemoryError`, which could let a
> ++subsequent :meth:`!decompress` call read or write through a stale point=
er to
> ++the already-released caller buffer.
> +diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
> +index 97bd44b..a732e89 100644
> +--- a/Modules/_bz2module.c
> ++++ b/Modules/_bz2module.c
> +@@ -587,6 +587,7 @@ decompress(BZ2Decompressor *d, char *data, size_t le=
n, Py_ssize_t max_length)
> +     return result;
> +=20
> + error:
> ++    bzs->next_in =3D NULL;
> +     Py_XDECREF(result);
> +     return NULL;
> + }
> +diff --git a/Modules/_lzmamodule.c b/Modules/_lzmamodule.c
> +index 7bbd656..103a6ef 100644
> +--- a/Modules/_lzmamodule.c
> ++++ b/Modules/_lzmamodule.c
> +@@ -1114,6 +1114,7 @@ decompress(Decompressor *d, uint8_t *data, size_t =
len, Py_ssize_t max_length)
> +     return result;
> +=20
> + error:
> ++    lzs->next_in =3D NULL;
> +     Py_XDECREF(result);
> +     return NULL;
> + }
> +diff --git a/Modules/zlibmodule.c b/Modules/zlibmodule.c
> +index f94c57e..9759593 100644
> +--- a/Modules/zlibmodule.c
> ++++ b/Modules/zlibmodule.c
> +@@ -1645,6 +1645,7 @@ decompress(ZlibDecompressor *self, uint8_t *data,
> +     return result;
> +=20
> + error:
> ++    self->zst.next_in =3D NULL;
> +     Py_XDECREF(result);
> +     return NULL;
> + }
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recip=
es-devtools/python/python3_3.12.13.bb
> index da7e3c604e..4865178572 100644
> --- a/meta/recipes-devtools/python/python3_3.12.13.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.13.bb
> @@ -35,6 +35,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>  	   file://0001-test_active_children-skip-problematic-test.patch \
>             file://0001-test_readline-skip-limited-history-test.patch \
>             file://CVE-2026-1502.patch \
> +           file://CVE-2026-6100.patch \
>             "
> =20
>  SRC_URI:append:class-native =3D " \


--=20
Yoann Congal
Smile ECS


