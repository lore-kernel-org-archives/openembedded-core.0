Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781F4C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 21:46:04 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18756.1785102356007358977
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 14:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3B4BWcNP;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49553515a8bso24674635e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785102354; x=1785707154; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzIcp5ERXSu4SO44+2gFNrS30uPYaV83MQlmaDVJ/DY=;
        b=3B4BWcNPPT+JF9QjCC51ly6Q7KioCWaN1vXmWPiLPZ3JP7mXqb6Uw9+8mCyADFrc03
         xjdc9KmWaeBWUX5aq/Ut9Nc8kEKzU5Y7QiXAefKyW2E8yo5Dw6LOD7jAqAL3uvG+QXj9
         Jl2Y8X36ihII77Ehuw3+iCSWpXjGzOy5Ifhl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785102354; x=1785707154;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qzIcp5ERXSu4SO44+2gFNrS30uPYaV83MQlmaDVJ/DY=;
        b=GocE2v2UmBGIvMGWFHFEClcDkgfAi4Vbadc3xA+/DPu0GpANVXqS6MA15RvTTtOxKq
         oqs1ECYT6JorCibnfrstPKtXmq80gYbMpSVP45wcA2pGFzjsZkeQ84lhR+j8rInEge2J
         MiSDdbhtUxh+Qlsh6uqoGF9o8OuK5LTsinTjVfs7KDv59uFdGeLxqv8vwEQ1GiRPuANi
         OLQ0kNuWmksXerDdyWr5dCKZq+6BZ0BoauMlU5vojZnuebhHDtxc3MwGKapIxznlwjsC
         b6QNkOvn6b3cmMlsrRtnAvnrKOdxSnWq+pwOwgJQhhFuZKZCamom3VcXFz41nNCvD3+q
         5clw==
X-Forwarded-Encrypted: i=1; AHgh+RrDh7It2Txs1ivep4KaJgV5p2y1yt5MlbACad5aJnvuIBNSBlEINIqD1NeZb4Lj/PpP13CY5sgckbhOyfarU80ufQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzGlkWEN76OOHztTIXbziRMJFBi1JR7rHCEt8qg/b4xuEcbGJu1
	jrK1YS03XX5k0qWJzZsCFNW67gKe8d6U5siUITXQlntituoTnoIaJzfV78I33TDAJHMzfy+QKbp
	7miZF/Hk=
X-Gm-Gg: AR+sD10/rYloqSkHI6t4MzkQ9SLY8JrcTJhoa1/qhpdfBqWKfWoRvIw/YluU4lyhSa5
	p7txRcDM6HszmVVSjBn7aVtmYvzUF5p4azBOO473Byhsn91V/kkLCsCYWUm/Dypb6PE4of/zAuj
	iuMvD4vI6srkA9MRPuPoBw0A+tpgdkZT6h187TOz+zqUIyI4oqKCzqO9XbRej+391Swg05BYLje
	v+F8nz/6JOODssxsO1xm3t4/e0fppDDzOjmdZdppdJ+m5cADDYwlwCAxraoKZwfIFqo8tmEy9hS
	5oI0fb0mbK5dT0iXhRC5k2SrtrM0KM9owlwT9Pvy6SE4nitoEX6xSCfw+PIBxKFdGbHn0EkDCZi
	WnkpBs5qgQX81lF0ANsnIXXuRbcuL5bpedjQRpPApxzvFPDs6TAXDQpop5mlm+OfD7/mM56/h6M
	iuRNEs48U+kJoMgnCrPgQshF2cNOqGe3g1h5Wr99/ImQc+ShSH4xWakB6bC+HrN0u/fQ==
X-Received: by 2002:a05:600c:870c:b0:493:f7c8:eae2 with SMTP id 5b1f17b1804b1-496b56f9749mr73661895e9.15.1785102353967;
        Sun, 26 Jul 2026 14:45:53 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a60asm45520198f8f.3.2026.07.26.14.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 14:45:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 23:45:52 +0200
Message-Id: <DK8TYZJNXWIL.3F6IJ1ESPWC1W@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][patch 03/10] vim: Fix CVE-2026-57453
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260722123336.587556-1-vanusuri@mvista.com>
 <20260722123336.587556-3-vanusuri@mvista.com>
In-Reply-To: <20260722123336.587556-3-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 21:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242023

On Wed Jul 22, 2026 at 2:33 PM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch per [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-57453
> [2] https://github.com/vim/vim/security/advisories/GHSA-x5fg-h5w9-9frf
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../vim/files/CVE-2026-57453.patch            | 248 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 249 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-57453.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-57453.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-57453.patch
> new file mode 100644
> index 0000000000..d1ad6d6f54
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-57453.patch
> @@ -0,0 +1,248 @@
> +From b2cc9be119d51212bf0d3f2a994c7e517c73f4a9 Mon Sep 17 00:00:00 2001
> +From: Christian Brabandt <cb@256bit.org>
> +Date: Sat, 20 Jun 2026 15:35:58 +0000
> +Subject: [PATCH] patch 9.2.0678: [security]: potential powershell code
> + execution in zip.vim
> +
> +Problem:  [security]: potential powershell code execution in zip.vim
> +          (DDugs)
> +Solution: Cleanup zip.vim, introduce PSEscape() to escape() potential po=
wershell code,
> +          use consistent s:Escape() in the various PowerShell functions
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-x5fg-h5w9-9frf
> +
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/b2cc9be119d=
51212bf0d3f2a994c7e517c73f4a9]
> +CVE: CVE-2026-57453
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + runtime/autoload/zip.vim | 78 +++++++++++++++++++---------------------
> + runtime/doc/pi_zip.txt   | 10 ------
> + 2 files changed, 36 insertions(+), 52 deletions(-)
> +
> +diff --git a/runtime/autoload/zip.vim b/runtime/autoload/zip.vim
> +index f4482fd7fc..752503a626 100644
> +--- a/runtime/autoload/zip.vim
> ++++ b/runtime/autoload/zip.vim
> [...]
> +@@ -339,9 +331,9 @@ fun! zip#Read(fname,mode)
> +   let temp =3D tempname()
> +   let fn   =3D expand('%:p')
> +=20
> +-  let gnu_cmd =3D g:zip_unzipcmd . ' -p -- ' . s:Escape(zipfile, 0) . '=
 ' . s:Escape(fname, 0) . ' > ' . s:Escape(temp, 0)
> +-  let gnu_cmd =3D 'call system(''' . substitute(gnu_cmd, "'", "''", 'g'=
) . ''')'
> +-  let ps_cmd =3D 'sil !' . s:ZipReadPS(zipfile, fname, temp)
> ++  let gnu_cmd =3D g:zip_unzipcmd . ' -p -- ' . s:Escape(zipfile) . ' ' =
. s:Escape(fname) . ' > ' . s:Escape(temp)
> ++  let gnu_cmd =3D 'call system(' . string(gnu_cmd) . ')'
> ++  let ps_cmd =3D $"call system({string(s:ZipDeleteFilePS(zipfile, fname=
))})"
The above line changed from the upstream commit? Can you explain why?

The change is:
-+  let ps_cmd =3D 'call system(' . string(s:ZipReadPS(zipfile, fname, temp=
)) . ')'
++  let ps_cmd =3D $"call system({string(s:ZipDeleteFilePS(zipfile, fname))=
})"

In the meantime, I'll hold this patch but continue to review the
reminder of the series (hoping those CVE fixes are independant enought
to avoid a conflict).
--=20
Yoann Congal
Smile ECS


