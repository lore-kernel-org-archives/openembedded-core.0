Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A11C982DA
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:28:27 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7182.1789723706497666161
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=in1RtFew;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so3670685e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 02:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789723705; x=1790328505; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMgKg1eFqe+qtRldhSIt3SpeZH408nWNoAtu1vT/1aQ=;
        b=in1RtFewLO7ItP9HDYFJMlDouQXON6/Hik+9SHor6y1WahfrGTeF5ddzMRre0N1lpA
         iK7C7ZvWlTvCU+IFviISbghiElWGniFuIGeqbEIR3tF9g/p088kA4LW7m3IW2gO6uFsu
         zUgQJr4xoTk8VPz5pIjEWxMgCvzp7WKG1j+dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723705; x=1790328505;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMgKg1eFqe+qtRldhSIt3SpeZH408nWNoAtu1vT/1aQ=;
        b=ArjdKbpez7BiHi7ahEOEoQukQi2NK76dtgVYgQO5IXr8A4wm5J22EQkIcfUaMGCWCb
         +7iacjnMG7DBqzDtAZCS87HXnoup01LlrPW9+V5nZEJu2yq/+oAC/58b7mE4i59C3Iqg
         kTPaoR6pWCMMkNwykJJzUhXOe3TLPQnf4TKG9hWAOJzxcnRX59XtvZQ3w7+gUYnixfUJ
         m4IdR3SmTp7anrMFm2FSoRuTp9q/AKu3uUDBDaR/fQxpq20ra7+9l84RnzSpLYq0yYKO
         EJ0zUW90aX5nphGd5jEwznxciqKQ+CFjhWPyIV7vxGJEi/ZNkx5MAmenQ/UZmP+qInFM
         +JCA==
X-Forwarded-Encrypted: i=1; AKwUvBzmvAQ1l8VuKPvOHk98ldx6u5v7VqCduRxb67w6RgY4hDXc4u2/xNAjnEsE5OdgWc+ZoY7NCJCAcfRKyp1TpdWhlw==@lists.openembedded.org
X-Gm-Message-State: AFuF++lTdN/oh5C4zjw4R1TN3ElJUyclgZqP9Zd46jFuiv541WmzB6TX
	fBi23XgTQfWZ57+CGMFwUdc643y+cUXfwKhA7vzlFrLVfqXRjURsugHeusQPqCCyzxk=
X-Gm-Gg: AYBFou0PakBhSdyQUPugke2G+5PBwBaRB8I8zZVvDWyfOtI9/BJK+GjG17GEedv7hxs
	KyHrvTqSY9TohUXaNfLxOa2yrW8Z4dIYnaFmdPlXAcGFazGpu4d8faahSmhhj95y3rkrVS3hrPD
	/AQYUI7sZbjUNdoKgNqMU1h97faaNxyopRQXtnl20ZtPacCtSeq2Ox+PHUAeXJliY+8x7Jm/dtx
	iNwtv/9zfC+LFbjWTzRkKTVCryJ8Tk3WN+BTfWbRc3ZOn2SOTJ923ihTNIxWjo5aOw/nNxvUy3k
	FaBCYEmHRssCpcXwV/1pd6CacsIEO7zroKFD7eRbeAKcg0MhMQkhVaO9JD4pj6dYhw1F6RFMWAf
	Z/MsvlqVB0OaqNY1Bovekeh149Ou0YkEKFUjF+MDNi11dzmJujeFUhO513J/DaET/UZg5Smsx38
	9mgw5xQYkPJzUzLOJwsyPICHdpLEMzGsMR2g8zfqjQhFPRmzCKQlGbZJi3xky/hBjKoSCgl9zzT
	W8wKGHVjoq640gonMKtgA50LaRRB0SH1i+w3PrQNgTxeLFIbI/mGk2FX9FhjqE=
X-Received: by 2002:a05:600c:3f0b:b0:49b:d45:703e with SMTP id 5b1f17b1804b1-49fc56aa68amr20363045e9.8.1789723704682;
        Fri, 18 Sep 2026 02:28:24 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd232d5bsm144011175e9.12.2026.09.18.02.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:28:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 11:28:23 +0200
Message-Id: <DLIC3R56WHV2.221JF28TY0KH7@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-0864
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260826052322.716321-1-dkelaiya@cisco.com>
In-Reply-To: <20260826052322.716321-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246205

On Wed Aug 26, 2026 at 7:23 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/python/cpython/commit/db4a157c790479710a1a840d7937=
c5c815a6f8b6
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-0864
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python/python3/CVE-2026-0864.patch        | 72 +++++++++++++++++++
>  .../python/python3_3.12.13.bb                 |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-0864.pa=
tch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-0864.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-0864.patch
> new file mode 100644
> index 0000000000..e39177bdcb
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-0864.patch
> @@ -0,0 +1,72 @@
> +From 1426c0d9d57a1ed19f95de0d461903e7cd6f6f64 Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Tue, 4 Aug 2026 11:27:20 +0200
> +Subject: [PATCH] [3.12] gh-143927: Normalize all line endings (CR, CRLF,=
 and
> + LF) in configparser (GH-143929) (#152005)
> +
> +gh-143927: Normalize all line endings (CR, CRLF, and LF) in configparser=
 (GH-143929)
> +
> +CVE: CVE-2026-0864
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/db4a=
157c790479710a1a840d7937c5c815a6f8b6]
> +
> +(cherry picked from commit 5858e42c539dac8394636a6e9b30472b8994851f)
> +
> +Co-authored-by: Seth Larson <seth@python.org>
> +(cherry picked from commit db4a157c790479710a1a840d7937c5c815a6f8b6)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + Lib/configparser.py                                   |  4 +++-
> + Lib/test/test_configparser.py                         | 11 +++++++++++
> + .../2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst    |  2 ++
> + 3 files changed, 16 insertions(+), 1 deletion(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-iss=
ue-143927.aviFeG.rst

Hello,

That patch does not apply:

    ERROR: python3-3.12.14-r0 do_patch: Applying patch 'CVE-2026-0864.patch=
' on target directory 'bitbake-builds/scarthgap/tmp-glibc/work/core2-64-oe-=
linux/python3/3.12.14/Python-3.12.14'
    CmdError('quilt --quiltrc bitbake-builds/scarthgap/tmp-glibc/work/core2=
-64-oe-linux/python3/3.12.14/recipe-sysroot-native/etc/quiltrc push', 0, 's=
tdout: Applying patch CVE-2026-0864.patch
    patching file Lib/configparser.py
    Hunk #1 FAILED at 907.
    1 out of 1 hunk FAILED -- rejects in file Lib/configparser.py
    patching file Lib/test/test_configparser.py
    Hunk #1 succeeded at 538 with fuzz 2 (offset 11 lines).
    patching file Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-14=
3927.aviFeG.rst
    Patch CVE-2026-0864.patch does not apply (enforce with -f)

Can you check please?

Thanks,
--=20
Yoann Congal
Smile ECS


