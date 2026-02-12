Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED8AEDF053
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 07:51:22 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41111.1770882673092175802
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 23:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cbc83anz;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so30839305e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 23:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770882671; x=1771487471; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cPxZRq0n8TJJ/UuchdmnnnTlLEVfbUf+fmHcXqm4WM=;
        b=Cbc83anzmTAggrFi4GPHNLphE1lElcIMTV0eC0qa3YeQjLtcy+WWXBp9bgd/p7Rvxc
         +qibcJT35CukrOHhBHr4PwEicA2lPEzHPaMDFDaA4HBdf+tUrIELe5BnMcC0T40vKY+y
         SIlOXPed8Tc/o301cfe+Z1A/jRw9LVxCAtdr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770882671; x=1771487471;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5cPxZRq0n8TJJ/UuchdmnnnTlLEVfbUf+fmHcXqm4WM=;
        b=ZI/VYx7yNxprhOqA0UQGKncUPH5VBzxgtSyZDgagGEIPfsppLzYqwbeRjZAcSNYeK2
         kKZWsf0FdT94fSGfvd+raqgc986jBijBQyi0w/F4nnquRBDtk8LFXxoFESx0beeEwuWX
         RTLGwZ4CT4X1WyNuIOxK8AHhhqniEp7+tZjZLlhMY7HTVl0VjHcsO5fbGHF6G1ez7TGs
         TITHF3owr0Z7EtOBIaMS5wZAeANMhnFknqLMEjMuqLltiGw6Tp6mN/CJ5d9ClzejnZbE
         ksLYWPph9Ssxf/Tt52bTsf6VMqvHFCRauDR2mWOMhwklT0q3YN/NxrWNzVqER0JvjzxR
         oCtg==
X-Forwarded-Encrypted: i=1; AJvYcCVAeEbPBRWzkUCz4/3LJ7s7xGcJQgrpuvUuaFhAadfbzr0VM0J5pkpKV8AqcchChUdkkSDEf6AgkRMARIm3g5qFsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwvxrI97PvDRH77Op/CJcnrjhdCRKp/E8O8LwXmwgP9QjQFwjxq
	yjMMNbiVobuepqbfeKBAd+5jPolKSIrkg8A/3P1EoOiO7Y2Ah2sTL04EnO+ShuHBhOg=
X-Gm-Gg: AZuq6aIZA6WagBTt+CTJKOBl7RWaD0npXu8BRiQ1KoXQ8OSL2KHrACFw0OaT548RD+p
	qiGOz3gvQOHq1ysT05CHssQfU/CARfRbS7/Dvki+wq8njinuscHg+nQ1E8HXDTyr120QZ2eRNba
	fmRxnIXRXiM8kuMvLMxF6n99aOEbeXCozaPacNB1/4u99icAqk4RsH63njhiMgDJXXI9Juge2jY
	MW40AZK3mhInfo42l1Rx6jH+Osi93M2lIdRcovE+/FwKodqcljC+nVYqP7lXJmRpyA1DYONgntZ
	Kam2JIfYJx1kvE44Hz+eVSgMkg9cWQj3zjq9Leoh53PsCyuujU1RMZ4CN9hcC4ZHchvH8q2YKmk
	XPFvdRFitrY2FtEnzJ3QTd7RlnOTeTkOgx8i7jao6Va8PYbKKp8hpzqyz+h+URt2aGjQB0URcOr
	py19ymcMHp55iDpjpxkl8ZtqVzxbO9Q+klMUmMWTAKmbOZntrjSA2sNg+s/OW1SVNjD3Ssc9MSh
	Xwdr/6apLnL3l8=
X-Received: by 2002:a05:600c:138b:b0:479:3a89:121d with SMTP id 5b1f17b1804b1-48365723e48mr21755615e9.36.1770882671248;
        Wed, 11 Feb 2026 23:51:11 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dfb4bd4sm104220675e9.7.2026.02.11.23.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 23:51:10 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 08:51:10 +0100
Message-Id: <DGCTIJNYV7BO.29VLLGCR1AJ4D@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH v2] python3-pip: Backport fix
 CVE-2026-1703
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260210163328.91807-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260210163328.91807-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 07:51:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231016

On Tue Feb 10, 2026 at 5:33 PM CET, Adarsh Jagadish Kamini via lists.openem=
bedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_24.0.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch

Hello,

That patch does not apply cleanly on whinlatter:
  ERROR: python3-pip-native-25.2-r0 do_patch: Applying patch 'CVE-2026-1703=
.patch' on target directory '/srv/pokybuild/yocto-worker/beaglebone/build/b=
uild/tmp/work/x86_64-linux/python3-pip-native/25.2/sources/pip-25.2'
  CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/beaglebone/build/bu=
ild/tmp/work/x86_64-linux/python3-pip-native/25.2/recipe-sysroot-native/etc=
/quiltrc push', 0, "stdout: Applying patch CVE-2026-1703.patch
  patching file news/+1ee322a1.bugfix.rst
  patching file src/pip/_internal/utils/unpacking.py
  Hunk #1 succeeded at 83 (offset 2 lines).
  can't find file to patch at input line 44
  Perhaps you used the wrong -p or --strip option?
  The text leading up to this was:
  --------------------------
  |diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
  |index 1f0b59dbd..724ca0be8 100644
  |--- a/tests/unit/test_utils_unpacking.py
  |+++ b/tests/unit/test_utils_unpacking.py
  --------------------------
  No file to patch.  Skipping patch.
  1 out of 1 hunk ignored
  Patch CVE-2026-1703.patch does not apply (enforce with -f)
  stderr: ")

Can you get it merged on master before making a new request for a
backport on whinlatter?=20

Thanks!

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


