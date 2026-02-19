Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3BEC531E7
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 22:28:37 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26435.1771540115136835653
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 14:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TAFhgWcE;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso11310165e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 14:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771540113; x=1772144913; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOXFaDbuSuSkUcE+fI7mbwcktwcK3EWa2bK68+u4bpM=;
        b=TAFhgWcEC2FknVmJFYUJzqaGAyADrMTk9wJeNVl7rQOxLYCagNSfkGyqDMyXVUtN0j
         ypPrBGuPRG1jln5HyGduMCDL3NzeGyV559LePOxptKY4Q8I+rSnnXdUz9M7DFQGiaWCB
         1KS96P0IpurMY/XzyS3fRUWysmj67W7IjGjG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771540113; x=1772144913;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOXFaDbuSuSkUcE+fI7mbwcktwcK3EWa2bK68+u4bpM=;
        b=I6QhXpf/N4o+pNxiomeYTu92tGGFG3WEinOCtsZFcpgodXsL7gnnu3YKk4rpQBr2i8
         eI1/vD/8g89/nFZjUtbmGOtsXKCWzWCsRVGSz8+9jB+k5lVSUSiK7Ifze58d4K7qCw5M
         uKRSDAvK3edCOv/CGIaGCJFgjZAVkh3udQ1z0Hk/FdrqryVW3Rov/F1xhrgH3AM2Uy5I
         MoubIBkszba6OJ7hw/sKUZRBGj9dxIGhAQ21FuUn2EiqtBWDvyShnwU5nqz+f15rA8Nd
         FEKsGqXEX+bZSROv1lpei3NP9CynQKee+qLAPOfguwPEh91u3Rq+HmSq6fMvLn4npqrF
         RaLg==
X-Forwarded-Encrypted: i=1; AJvYcCX3jJ8ITCw+T75JZG4N5JSbi8nkxGP4q4sztevfYRi4aomVchcRHtBAul4O1JnIG1jxLp8RBYbe7a1d3i3Lim1FHg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxvO8hDqE41sk75POl6He6D5nOIIQO14EaroU1saVZyi+8Bij58
	N0s/pYRVwnj29OxNCyAWVH1A1hXs3yxG7V9eEde/vE2A/V7rbb4Y2QVCAcPl8fQAQpw=
X-Gm-Gg: AZuq6aJ/SEzou5EEk66Rydtgr1IrIcgPcXQuknBkGs6ABLqtqp+9ngA7VofKUMdSKdB
	T3UBUjcavI3zdbP6Lbn9r5Rs9IHHOTpgfYWQQ9p44DnfCALNPRYkPMCasyzqBt76jejd3oQ8Vco
	vf+/2E9EtMHi4BemMpLyuQUJ0DrMzmnYFwG5357+/TS6pC2Ykt9Zs3RmF0NsaIFwdpD7NFUr2M+
	oYIjVqk49H3puhgRBFPXa6KYJvEMffpWNpHWUANNlhLZeVwP7lxbO9SdK0iJ25VHLhyUcR5/I/F
	t/JWwqJplbdZgoJxyLlg+r3klTY/c/Y9710WsTSbc+ZKTYqO5P9NE3D3ZPt2CpQej+DfNhq5N0q
	ykJR2OJUx1pR55l07EYIzyYHhNReo+XRpRoi/LpjZoEV5cORY4KezgGLYnCrq/d4eASgAiMJ5a8
	cRo4dXVQ5Iqewd6liuEIpT2eZSIPz6KR4LUSU6ij8fyZNWi+GIuiO8VXUTySHlRwP+bJJCD7+y9
	Mlo8boFaXMw1RpaRW2EQKhwKQ==
X-Received: by 2002:a05:600c:35cd:b0:479:3a86:dc1c with SMTP id 5b1f17b1804b1-48398aefd55mr109547875e9.36.1771540113345;
        Thu, 19 Feb 2026 14:28:33 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4424106sm4172435e9.0.2026.02.19.14.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 14:28:32 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 23:28:32 +0100
Message-Id: <DGJAK4JLFA5M.1ZGI0FMRE5T79@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260217130823.393314-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260217130823.393314-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 22:28:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231445

On Tue Feb 17, 2026 at 2:08 PM CET, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Hello,

If I'm not mistaken, I'm still waiting for a v3 for whinlatter (v2 did
not apply)

Thanks!

> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_24.0.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..a30475319c
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From 2a89ce91220e50c1b667bd9d5075e1fd10c1fed2 Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH v3] Merge pull request #13777 from sethmlarson/commonpat=
h
> +
> +Use os.path.commonpath() instead of commonprefix()
> +
> +CVE: CVE-2026-1703
> +
> +Upstream-Status: Backport [https://github.com/pypa/pip/commit/8e227a9be4=
faa9594e05d02ca05a413a2a4e7735]
> +
> +Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> +---
> + news/+1ee322a1.bugfix.rst            | 1 +
> + src/pip/_internal/utils/unpacking.py | 2 +-
> + tests/unit/test_utils_unpacking.py   | 2 ++
> + 3 files changed, 4 insertions(+), 1 deletion(-)
> + create mode 100644 news/+1ee322a1.bugfix.rst
> +
> +diff --git a/news/+1ee322a1.bugfix.rst b/news/+1ee322a1.bugfix.rst
> +new file mode 100644
> +index 000000000..edb1b320c
> +--- /dev/null
> ++++ b/news/+1ee322a1.bugfix.rst
> +@@ -0,0 +1 @@
> ++Use a path-segment prefix comparison, not char-by-char.
> +diff --git a/src/pip/_internal/utils/unpacking.py b/src/pip/_internal/ut=
ils/unpacking.py
> +index 78b5c13ce..0b26525fb 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -81,7 +81,7 @@ def is_within_directory(directory: str, target: str) -=
> bool:
> +     abs_directory =3D os.path.abspath(directory)
> +     abs_target =3D os.path.abspath(target)
> +=20
> +-    prefix =3D os.path.commonprefix([abs_directory, abs_target])
> ++    prefix =3D os.path.commonpath([abs_directory, abs_target])
> +     return prefix =3D=3D abs_directory
> +=20
> +=20
> +diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
> +index 1f0b59dbd..724ca0be8 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -202,6 +202,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: Tuple[str, str], expected: bool) -> =
None:
> +--=20
> +2.44.4
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/reci=
pes-devtools/python/python3-pip_24.0.bb
> index be4a29500a..35428260c3 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
> =20
>  inherit pypi python_setuptools_build_meta
> =20
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \
> +            "
> =20
>  SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b30=
1b718fe6f593aba2"
> =20


--=20
Yoann Congal
Smile ECS


