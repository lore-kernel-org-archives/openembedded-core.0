Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F26EA4E1D
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:07:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.162525.1772464063570888699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 07:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MyHlFIRt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483770e0b25so39951025e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 07:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1772464062; x=1773068862; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=35WZuJEEwjtHk+xL9J02Cc5/yB6v0g0WCT/GUOvswAs=;
        b=MyHlFIRtSHY2j9ubkRSBfYsLJkZyyA0fM42Z5kQY7n8oq9sLliHRqR1GfIRiQTO0+P
         /FQZrYLyzVB7e5phYPHo6h++/PMy4dWJ/4/lrI3iMu9SrfdAH/aiQX5f88UYkWv00dNm
         U2a34LdbG4adPS65M+k+HcZtcu4BDhmIHrvDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464062; x=1773068862;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35WZuJEEwjtHk+xL9J02Cc5/yB6v0g0WCT/GUOvswAs=;
        b=W0e7NflmbcYIoY/rn2FPbCRSodL+0sMxIDcp4dcR848a//s5UmB5H0fB7ArzF9i/xr
         SX8Q1eOumdMedjPDzs24Nzp17/fRGd9/gZ95WA4zTZKzuhGooWMeZpI0ervseVHRKLIB
         w1kj3w7PCEmBPinWmM2LA4m26TZmDjeXL+VeEb6S0Nv9JW9LXJ373Yapm3fgyuJM8V/w
         oOKmmwh4JGOXOcgqfbeBRwCBvFW57ESnbzoXEEU0tgzwRv9YKrn+BPFhK5mlFJy/+NEo
         3+AbkA6oFSPIZb6Ua7UUtbMmBAHXH3g2KjW+Nv96QVFol0jwcY0r/zpYLVMNeTK6C6rS
         P/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXFFGx5WtgTqt1dZxOPU3/BDN2bwprgM/SZEuA9GvsMm2g5nnSDghB1Qb+kYMgcjpKvUIPyQSitsVYWLB4aM4vUvg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcP2gqCPD7/Krbu07hV0tM7Va3Uy6llZJUuKcx3Vup7yO5QQgh
	jjY/u8N7Xg4pDutgE6qn30vX/7QnfR5rOd2x8tbIpCE60LNui8D4mBdjOsgPXKjOGJQ=
X-Gm-Gg: ATEYQzzHO8T6nltS89E94wqSY+B9HtEoakzUyYH78GkxgaXqmM99hLD63i8Tupfw5kk
	OwgNvRhsOagAHAGkrCQQ4BR/4/8piZb8mc/keCq1bKpAoplY9fTHl2l4TPR9emhtLrl6H23k1uA
	rihULxkNkS4U+DiYH6wuPzd5pFKXeYFf/sv2hGTX/PX4YNolEnYVjhbGTEZXCp6xAxXGEZfzAth
	Tl2l3YtN/7cX7Mltvj6GhWYY7GwFNL93npou1UHU6RSBbmgXPBZiwk2ocKjZIqRROs3+vyNIlWc
	b0xYRTeE0FHaWIH68rxR8wBR9UhpvCraA5rr1NdoHU1qFKFLSVbCZIJmWFSn6Z7dUIqIJuI5Ps+
	Y5tEaG6/sxbmb+6vy3vYzD54ybGgy8F8z9ybA2lk7Uel6ssUozDWVJq767obTPVC8qaK1Q3sTIX
	utIAFfJttp4Wq1IXvjcEuYQutORusVQ5+QlgmUfr7HuN6SODAdp7ZafLFDXA78x89CSq3FMaSzg
	mZq+R5MwrOx2hDRwP7r/u+85Q==
X-Received: by 2002:a05:600c:548a:b0:483:c12b:fe46 with SMTP id 5b1f17b1804b1-483c9bdb2edmr215388925e9.10.1772464061567;
        Mon, 02 Mar 2026 07:07:41 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dd78:7aff:8be3:3eb6? ([2001:8b0:aba:5f3c:dd78:7aff:8be3:3eb6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b841absm327810865e9.13.2026.03.02.07.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:07:40 -0800 (PST)
Message-ID: <b29f349d58b2f2286e404c258d1c865e10ba5e5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ruby: upgrade from 3.4.7 to 4.0.1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 02 Mar 2026 15:07:40 +0000
In-Reply-To: <20260224015117.3338374-1-changqing.li@windriver.com>
References: <20260224015117.3338374-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 15:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232207

On Tue, 2026-02-24 at 09:51 +0800, Changqing Li via lists.openembedded.org =
wrote:
> License-Update: Add license BSL-1.0 and Apache-2.0
>=20
> COPYING - Add Cross-links between Japanese and English pages
> LEGAL - Update LEGAL for JSON vendored sources
>=20
> Refer:
> [1] https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de0827349b=
f03f16d
> [2] https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad976c=
69bea73
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0...doc-build-reproducible-documentation.patch | 30 ++++++-----
> =C2=A0.../0006-Make-gemspecs-reproducible.patch=C2=A0=C2=A0=C2=A0=C2=A0 |=
 52 +++++++++++--------
> =C2=A0.../ruby/{ruby_3.4.7.bb =3D> ruby_4.0.1.bb}=C2=A0=C2=A0=C2=A0=C2=A0=
 | 11 ++--
> =C2=A03 files changed, 51 insertions(+), 42 deletions(-)
> =C2=A0rename meta/recipes-devtools/ruby/{ruby_3.4.7.bb =3D> ruby_4.0.1.bb=
} (93%)
>=20
> diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible=
-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-repr=
oducible-documentation.patch
> index 90b2aee7ea..f0be3e4af6 100644
> --- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docume=
ntation.patch
> +++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-docume=
ntation.patch
> @@ -1,4 +1,4 @@
> -From 2e140fea6c275f3258893d2da2480027b16efb92 Mon Sep 17 00:00:00 2001
> +From 278d02b08f513b288f31648bc5ec5c47ecb61686 Mon Sep 17 00:00:00 2001
> =C2=A0From: Christian Hofstaedtler <zeha@debian.org>
> =C2=A0Date: Tue, 10 Oct 2017 15:04:34 -0300
> =C2=A0Subject: [PATCH] rdoc: build reproducible documentation
> @@ -9,29 +9,33 @@ Upstream-Status: Backport [debian]
> =C2=A0
> =C2=A0Signed-off-by: Antonio Terceiro <terceiro@debian.org>
> =C2=A0Signed-off-by: Christian Hofstaedtler <zeha@debian.org>
> +
> +rebase to version 4.0.1
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> =C2=A0---
> - lib/rdoc/generator/json_index.rb | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> + .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 2 ++
> + 1 file changed, 2 insertions(+)
> =C2=A0
> -diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_=
index.rb
> -index 065caa4..cfa1f33 100644
> ---- a/lib/rdoc/generator/json_index.rb
> -+++ b/lib/rdoc/generator/json_index.rb
> -@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
> -=C2=A0=C2=A0=C2=A0=C2=A0 debug_msg "Writing gzipped search index to %s" =
% outfile
> +diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/=
.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
> +index 065caa4..a76c202 100644
> +--- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
> ++++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
> +@@ -177,6 +177,7 @@ class RDoc::Generator::JsonIndex
> =C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Zlib::GzipWriter.open(outfile) do |gz|
> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.mtime =3D File.mtime(search_index_fil=
e)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.mtime =3D File.mtime(search_inde=
x_file)
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.mtime =3D -1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.orig_name =3D search_index_=
file.basename.to_s
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.write search_index
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.close
> -@@ -194,7 +194,7 @@ class RDoc::Generator::JsonIndex
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debug_msg "Writing gzip=
ped file to %s" % outfile
> +@@ -195,6 +196,7 @@ class RDoc::Generator::JsonIndex
> =C2=A0=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Zlib::GzipWriter.o=
pen(outfile) do |gz|
> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.mtime =3D Fil=
e.mtime(dest)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.mtime =
=3D File.mtime(dest)
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.mtime =
=3D -1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.ori=
g_name =3D dest.basename.to_s
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.wri=
te data
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gz.clo=
se


This does not look like it is updating the patch correctly.

gz.mtime =3D File.mtime(search_index_file)

should be replaced with:

gz.mtime =3D -1

but both lines are left after this change.

That will probably 'work' but isn't a correct update. Please can you
send a fix for this.

The reproducibility issue also recurred in master:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3490
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260302-t9zp1mo6/=
packages/diff-html/

so this makes it more urgent we get the other changes in v2 (I note
that v1 was merged by mistake). Thanks!

Cheers,

Richard


