Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57341E81BDC
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 15:53:50 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50585.1770652420903269147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 07:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tiPurI46;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43767807da6so1128174f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 07:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770652419; x=1771257219; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDm851M4RVTexvZjt4wJSZa8H7j3xxSnQWduRPc+MgA=;
        b=tiPurI46jxiEoxq2k6OyqnU5YzyqFr3uSW11UReSrpHcSrMC3qgVAUycWiRGSuEJs8
         2j5y9iI792Lx6gMhqTxYVQ7wru9BW8Vd0vKqqOWpELReIMpw58sj5kBxRv7ZZhGsOQyX
         iNOMIiVlgIrI9RdTwVMxBv32Hl+n4lv/eNgoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770652419; x=1771257219;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDm851M4RVTexvZjt4wJSZa8H7j3xxSnQWduRPc+MgA=;
        b=U+UlognmWR94TdXBRIehez38Yagb0DQX5x8mVBQQJ2IHwZcJ0pKAaqDIwrjCeM3rez
         N+y9JHALXHYKvxt9e7mATHOFsgLZ4IQameNhvsZpkdxQ6uQ22FZssxGZqfLan1+0ZXMD
         WSbEVxkoP7U6Kw/2jX0bBWpcMdMsTyrppT2JGl4iXe3h2RzpDP+fkAGG0u2gmDq320qF
         Q9k+1oVqw+JKxMWLrmIgNKbSRBUh1nO1nCZToyBb2bPKWKa6rSdtvPcrL8YDLdDO9IOC
         h4D5gG9MMNkJmHYtbZgTdz7/X0BkU7lhAOUUR/xJxkyZyU+sKTi/OuxOu8Jb5n+lkRj3
         QFxA==
X-Forwarded-Encrypted: i=1; AJvYcCWK0hHIiyFRrMshgskydgtFdgahsIOvtjq3aIUfgX7jQZVzHooMqYSa3IbP1IIYi2FPbC3vrg8Qj344pbqYT9BE/Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZud6U2xQyfp9dLJb4GPPUS2OXfBjjUNRrUd/p4ACuiipnA1fC
	7ThknZiCoaLgRCjbtuJGfAGTyvioRzTylGZz+CEO1ud1j5VWpSOZtykkTgNBYeyQL8w=
X-Gm-Gg: AZuq6aI3YHeFowVnVArlZhi3+ETEWZqHye7kmoIaxouy6XTb1qqoG06/lg7ZmVklAqq
	5qO6Ei4YQlTtwnvaSieMWGoebYSJ5CYnDu2hpZVak+6gx4ZzPS8EBIAOLXun2IW7feJEI2nUVlI
	PJmPOl8IaefM8juFTjVJQZ0cd+++VbV1+XJYEoBMk6z7aOEIpFwH88KALWA16rxClcZLkeozZH0
	QkclhAd0YaRkxtRKSM47Y4TKNcWRY0FF7tdRaM5TvB8jlUrFwZjvsM4eLE2pDJB9NCmi3tbqNw4
	G6TUdpwK9tyePFyppijAmxWbrFcDaxPcFQFdM18vi2mQuVs63J3v8pKwAolq+Shc/7Vqko8pSPP
	cyQCq+9bi0y2T3QhAM6Hyx4/66ggmpsbhAhYVpc2ADabiaTZaYGSEO+SNBnm+eQdj3TEOlcXOmF
	nM8Jz6HUQX6xDMskqBcLZE3mE37Kb3AiXwTbpGgGs4ThgUODNOq+l/lHCHpNBPpo4FQC2xvgsWu
	zI=
X-Received: by 2002:a05:6000:3101:b0:437:6c07:998f with SMTP id ffacd0b85a97d-4376c079f9dmr7055757f8f.45.1770652419130;
        Mon, 09 Feb 2026 07:53:39 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2110sm27905816f8f.3.2026.02.09.07.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 07:53:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 16:53:38 +0100
Message-Id: <DGAJWBIW4I84.35YIU2HK85XSO@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-pip: patch CVE-2026-1703
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260209140108.33848-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260209140108.33848-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 15:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230809

On Mon Feb 9, 2026 at 3:01 PM CET, Adarsh Jagadish Kamini via lists.openemb=
edded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_24.0.bb                |  3 +-
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch

Hello,

As fas as I can tell, this patch was merged in pip v26.0, but master and
kirkstone are on v25.x. So, this patch is also needed there and I can't
merge on scarthgap until this is fixed on master&whinlatter.

Can you send a patch to fix CVE-2026-1703 on these branches (either a
backport or an upgrade) ?

Thanks!

>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..8d34d2acb4
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From ed41e052ebe78fcf043c43ea05bf16f73dfbb581 Mon Sep 17 00:00:00 2001
> +From: Damian Shaw <damian.peter.shaw@gmail.com>
> +Date: Fri, 30 Jan 2026 16:27:57 -0500
> +Subject: [PATCH] Merge pull request #13777 from sethmlarson/commonpath
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
> +2.44.0
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_24.0.bb b/meta/reci=
pes-devtools/python/python3-pip_24.0.bb
> index be4a29500a..83f8d869ac 100644
> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
> =20
>  inherit pypi python_setuptools_build_meta
> =20
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \"
> =20
>  SRC_URI[sha256sum] =3D "ea9bd1a847e8c5774a5777bb398c19e80bcd4e2aa16a4b30=
1b718fe6f593aba2"
> =20


--=20
Yoann Congal
Smile ECS


