Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87F0EFB818
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:36:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16133.1771922203447954666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 00:36:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nun5r0Uc;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43770c94dfaso5136004f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 00:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771922202; x=1772527002; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCr4BW8jwf4qBLbbkAlFADuVKHv2VXV17s7nY1SyBug=;
        b=nun5r0UcBY2w7rf+9WorFUso6NWxfUyqendtTFPMPzpCVjzWk3RoPHBg7Rei+1Iyuo
         6uMreyxkPAV+ewJjdTaeOQl0SEr1rgVWXJrqrzRjBWNrUrWAGD4z1lonJI/xDj8XzDD5
         nngLfPCwSiskjwId3ClsSVeOzpFgqDixsHYyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771922202; x=1772527002;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iCr4BW8jwf4qBLbbkAlFADuVKHv2VXV17s7nY1SyBug=;
        b=X02zN40SYt0gqgiVVYtLH8+3NMQcXYb1ypwssz7rtxcf9mem4RsiA4K1a37Y4TSiTL
         HdsjDW741cbOL/Zhx6fzlxuRM0AdkGuwsPM4Z2NXxdd0LHrnHX8dOj0QwmEDwuLDjkUf
         C1wE8r96vQYxKq+Am9T/LfM4dCUBF5/vtsdyBk7jcMx2unMY939rSxih1jzT5+rTgVwX
         OJLU9HyH8XT4HiMA2lMH9+efjjrq5i7Mizp5xw3Vy/ldBHvhtS9ij3G66+H0A2LIu+5e
         Y62kp8coMOsiqaRG28NFQlUdwDXA48tcti3B0ALgFjGBvH1GAFJIJWJiAeb5KCwvBNN3
         66aw==
X-Forwarded-Encrypted: i=1; AJvYcCUBcOi5wKTCI65pzmajb6FlYzHA/vbENXSxpL2qBJ9i2u72A1loM5N5pCEqTTMg1rMvR8DVgGsPAinmWu9rFu5vdA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz2brZU/RleBcnGt9as112XQvu24bq+ur24saaB6QkaDdXsEsV0
	JnlQyuRKk0/FlGrj0j6jtC10jA64Zj4nXGuxo8F/cmZGwOKuUeT0QAlCGb8MhCNV7RM=
X-Gm-Gg: ATEYQzwShIJdOzMLigtZ0ZRjXoBepSsSGU+uLK64LxAcMuEEGOIDKZM+ga/YTkO6HZX
	WjEmCjXSQhgGpQotIW85MxJbIb7GE9eB6oLbNVl9eiB9g8vFMtjhxeTcyoW5CY2W5W7owsOsWnh
	JMbNShTc6v/CbTuwztV5YwNPZuaSKU0cN7Mw0KC/t5hm2TognQ19fqll/1GAsw4d65jfLr2BUYO
	aOCsHFixgL7REOVD/dtoBtZ0JtoQKkAVOX+LObHKuTSIEkKZgAfRJzBZHTbqDxvZOGfkE6txZTm
	Y5AY+jAWUlHT19uKKnmtqrKIvkEj+SSmvD9dCqJw6Zo2l7yWyhNGdzGwOFPDBgSVNJKxYjZ0Ldz
	Fuff7+lOdGaT+3jH6v41QsJ1Lj61O+q24BkSgT9cf73bi4BOwtrJzeUJYrgDdd/v6f++CxZGAbF
	Xz4HLNA9vzPlVF3gFcE6hUEd5Nn2dI3eBiRBqF199e/6IyWzm+XLuqXoKneePSAz3LUhI5edq25
	JJyajAt3/w=
X-Received: by 2002:a05:6000:2c0e:b0:436:da9:4371 with SMTP id ffacd0b85a97d-4396f154441mr20766769f8f.5.1771922201595;
        Tue, 24 Feb 2026 00:36:41 -0800 (PST)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00c18sm24545458f8f.14.2026.02.24.00.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 00:36:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 09:36:40 +0100
Message-Id: <DGN1ZXB3Z7EY.JKGGP9H2SP8G@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH v3] python3-pip: Backport fix
 CVE-2026-1703
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260221092411.802178-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260221092411.802178-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231748

On Sat Feb 21, 2026 at 10:23 AM CET, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  .../python/python3-pip/CVE-2026-1703.patch    | 55 +++++++++++++++++++
>  .../python/python3-pip_25.2.bb                |  4 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-170=
3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch=
 b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> new file mode 100644
> index 0000000000..68220f8294
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pip/CVE-2026-1703.patch
> @@ -0,0 +1,55 @@
> +From 34bdfa654f2d3f9d036fb2abb28c175182a3da5c Mon Sep 17 00:00:00 2001
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

Looks like this patch does not apply:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/68/builds/3312/st=
eps/13/logs/stdio
  ERROR: nativesdk-python3-pip-25.2-r0 do_patch: Applying patch 'CVE-2026-1=
703.patch' on target directory '/srv/pokybuild/yocto-worker/qemux86-64/buil=
d/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/25.2/=
sources/pip-25.2'
  CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/qemux86-64/build/bu=
ild/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-pip/25.2/reci=
pe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch CVE-2026-17=
03.patch
  patching file news/+1ee322a1.bugfix.rst
  patching file src/pip/_internal/utils/unpacking.py
  can't find file to patch at input line 44
  Perhaps you used the wrong -p or --strip option?
  The text leading up to this was:
  --------------------------
  |diff --git a/tests/unit/test_utils_unpacking.py b/tests/unit/test_utils_=
unpacking.py
  |index 6f373b1ac..a3abcfeb0 100644
  |--- a/tests/unit/test_utils_unpacking.py
  |+++ b/tests/unit/test_utils_unpacking.py
  --------------------------
  No file to patch.  Skipping patch.
  1 out of 1 hunk ignored
  Patch CVE-2026-1703.patch does not apply (enforce with -f)
  stderr: ")

Can you check please?

Thanks!

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
> +index 0ad3129ac..7cb3de3c4 100644
> +--- a/src/pip/_internal/utils/unpacking.py
> ++++ b/src/pip/_internal/utils/unpacking.py
> +@@ -83,7 +83,7 @@ def is_within_directory(directory: str, target: str) -=
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
> +index 6f373b1ac..a3abcfeb0 100644
> +--- a/tests/unit/test_utils_unpacking.py
> ++++ b/tests/unit/test_utils_unpacking.py
> +@@ -269,6 +269,8 @@ def test_unpack_tar_unicode(tmpdir: Path) -> None:
> +         (("parent/", "parent/sub"), True),
> +         # Test target outside parent
> +         (("parent/", "parent/../sub"), False),
> ++        # Test target sub-string of parent
> ++        (("parent/child", "parent/childfoo"), False),
> +     ],
> + )
> + def test_is_within_directory(args: tuple[str, str], expected: bool) -> =
None:
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-devtools/python/python3-pip_25.2.bb b/meta/reci=
pes-devtools/python/python3-pip_25.2.bb
> index 350092d9ad..496eff1f15 100644
> --- a/meta/recipes-devtools/python/python3-pip_25.2.bb
> +++ b/meta/recipes-devtools/python/python3-pip_25.2.bb
> @@ -24,7 +24,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
> =20
>  inherit pypi python_setuptools_build_meta
> =20
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \
> +            "
> =20
>  SRC_URI[sha256sum] =3D "578283f006390f85bb6282dffb876454593d637f5d1be494=
b5202ce4877e71f2"
> =20


--=20
Yoann Congal
Smile ECS


