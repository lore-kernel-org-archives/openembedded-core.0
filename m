Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD956C624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 13:01:37 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12295.1788354088669948976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 06:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vkfrW8XI;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so6793435e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788354087; x=1788958887; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vB4Dh8ZO7yzTQuFOhuKBwy7RN00i+orFcq14B8YF650=;
        b=vkfrW8XIndaALO7wVpD+LHx8Y1nTlykyQP3wVY7e50+mfd580UNpFXVeB2fxJqOgat
         rjccPp1wEvq10AeH/3tDK4YRG4QrToaIbAPVnYZ7RjYMP/ziUGeMs+bxc3UkmSlntNsj
         PIyUnOkC4KkIdC8GgdYtpoOgX5sfG/pTpD7h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354087; x=1788958887;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vB4Dh8ZO7yzTQuFOhuKBwy7RN00i+orFcq14B8YF650=;
        b=sDMRT7J82V4dthF5VpGfkcdKXPJ6N4u9vbeDKw+Ci9uG8LMZQtCXLUgEGTwPWrnMbt
         0fdce+jC/iCuyYh2lvgm+owdtNYBRPPzggwJRYpCR5/y9VO+oaqXYC4OsF3z/FR8peT5
         BjWM6x36FiyhSsYQIT4WBVKQM6vm2UNaqhFrUGjX45Z1UAXQfKX7J9zvi6X9ED+J3KBL
         9VSKzXYDEDMApGnEl7Vv4MeBaNBl+FP2G0/wkzjjt1ifr8GChWSQbWS54epU4IukKzTs
         c5iwUByRfnq7PEc8R9WktonMwFZWk9yn5yjj7mAgH1OhGhalD5U4aBt8mWcggQmdG7Kn
         PYVw==
X-Forwarded-Encrypted: i=1; AHgh+RqA7T0iTnoqUMljX5j4c/mwWyG0HVh1M4KgD2eqrYhASoGvk32Hpq/3Bh8oLH6vEocDWD1R1jtoMLlPvxs0XglEUA==@lists.openembedded.org
X-Gm-Message-State: AFuF++lMEaaGiE/5wilf1PNILNR/CZnSQeIlYNZSQDHuXXXtQYJctMTG
	Ep9A9/CG6ev0YaNtFH86q/R4EnH7TL6Z8s9A2EY9mIMGMA4M73xiWb/MyCFtPfFkCs0=
X-Gm-Gg: AR+sD13s0XGe76zjLT3Ea34R/zVdf7dZZvnF+zC82uyJ7nHyW8sEmL9ZNXSHGmUEj7h
	xjJIpof/gZ9EImSjgKt+8QytfcSPkmGUN1u+lRDCEdgKGcnwFlqc7Csc5r91HZP/np1MXtcz6nu
	NaGK8IPU3DcnnoseKN9TEMZ4TxrCcHIxvbJ2BIKBlAL4x2dfCdD+PPFzLcsCDk7sNTgr8XQgfU9
	aGLim10vOm1kIbzgKAreQbTOwlnH2nwYZYTluSNPHfASFOYnGI3NURwtUA06jzL3sNroSyz5Ltx
	NNzxWY7DfkYFpFcA9Wpz9HSwKVqKjQijBur+VXEZHAehsgtbrOM2c8LmAzqJylV/BFB1/h9vqIl
	TfBzCUfVBk7oYwh+FuHfpsmvIln14/5+zSNS71iQJDmaJh10gaSu01nj8/FH+LtIooxQSkRXOe0
	UtA/LN4A0QwECjjNR4A2tp9+3pfe5hcURGIypO6u2EGvOmXE7E7+ogs26rVTSQtXeL/zQ90Dr+l
	Ug2Rgh+zxufgRarr1OYAERYOqAnLmUrhVHZIcJse+JJmSehVRkVQoKAeIM=
X-Received: by 2002:a05:600c:8b86:b0:49c:d27e:8f7c with SMTP id 5b1f17b1804b1-49ce5843b42mr84834375e9.12.1788354086741;
        Wed, 02 Sep 2026 06:01:26 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm19225875e9.1.2026.09.02.06.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:01:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 15:01:24 +0200
Message-Id: <DL4UM4WBEOTF.2U2FRST6PNQFF@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/4] python3-git: fix CVE-2026-42215
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260819050808.3986732-1-dkelaiya@cisco.com>
 <20260819050808.3986732-2-dkelaiya@cisco.com>
In-Reply-To: <20260819050808.3986732-2-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 13:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244946

On Wed Aug 19, 2026 at 7:08 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix as referenced in [4], using all the
> backported commits shown in [1], [2], and [3].
>
> [1] https://github.com/gitpython-developers/GitPython/commit/142195888e71=
3542189533a52cdfc333f05c3af6
> [2] https://github.com/gitpython-developers/GitPython/commit/9aed7cf8c20f=
69effcfcf7ebef09f312f73ab826
> [3] https://github.com/gitpython-developers/GitPython/commit/43d92dec4683=
568d11495956dd556161f17c3ea8
> [4] https://github.com/gitpython-developers/GitPython/security/advisories=
/GHSA-rpm5-65cw-6hj4
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python3-git/CVE-2026-42215_p1.patch       | 60 +++++++++++++++++++
>  .../python3-git/CVE-2026-42215_p2.patch       | 29 +++++++++
>  .../python3-git/CVE-2026-42215_p3.patch       | 45 ++++++++++++++
>  .../python/python3-git_3.1.43.bb              |  3 +
>  4 files changed, 137 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-422=
15_p1.patch
>  create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-422=
15_p2.patch
>  create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-422=
15_p3.patch
>
> diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.p=
atch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
> new file mode 100644
> index 0000000000..0129250fdf
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p1.patch
> @@ -0,0 +1,60 @@
> +From dd5d1c4ddcc5d44faf4e71bcfa338f09db2022d6 Mon Sep 17 00:00:00 2001
> +From: w <w@mac.lan>
> +Date: Mon, 20 Apr 2026 23:29:50 -0400
> +Subject: [PATCH] Block unsafe underscored git kwargs / Fix for
> + GHSA-rpm5-65cw-6hj4
> +
> +CVE: CVE-2026-42215
> +Upstream-Status: Backport [https://github.com/gitpython-developers/GitPy=
thon/commit/142195888e713542189533a52cdfc333f05c3af6]
> +
> +Backport Changes:
> +- Omitted test/test_clone.py, test/test_git.py, and
> +  test/test_remote.py because the PyPI 3.1.43 source used by the
> +  recipe does not ship the upstream test tree.
> +
> +(cherry picked from commit 142195888e713542189533a52cdfc333f05c3af6)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + git/cmd.py | 21 +++++++++++++--------
> + 1 file changed, 13 insertions(+), 8 deletions(-)
> +
> [...]
> diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.p=
atch b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
> new file mode 100644
> index 0000000000..4326bede07
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42215_p2.patch
> @@ -0,0 +1,29 @@
> +From e77461e6953a67f17ecd1808c352e6613a17345b Mon Sep 17 00:00:00 2001
> +From: w <w@mac.lan>
> +Date: Mon, 20 Apr 2026 23:43:59 -0400
> +Subject: [PATCH] linter fix
> +
> +CVE: CVE-2026-42215
> +Upstream-Status: Backport [https://github.com/gitpython-developers/GitPy=
thon/commit/9aed7cf8c20f69effcfcf7ebef09f312f73ab826]
> +
> +(cherry picked from commit 9aed7cf8c20f69effcfcf7ebef09f312f73ab826)
> +Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> +---
> + git/cmd.py | 4 +---
> + 1 file changed, 1 insertion(+), 3 deletions(-)
> +
> +diff --git a/git/cmd.py b/git/cmd.py
> +index 2ecb8e66..372eac28 100644
> +--- a/git/cmd.py
> ++++ b/git/cmd.py
> +@@ -729,9 +729,7 @@ class Git(metaclass=3D_GitMeta):
> +         for option in options:
> +             unsafe_option =3D canonical_unsafe_options.get(cls._canonic=
alize_option_name(option))
> +             if unsafe_option is not None:
> +-                raise UnsafeOptionError(
> +-                    f"{unsafe_option} is not allowed, use `allow_unsafe=
_options=3DTrue` to allow it."
> +-                )
> ++                raise UnsafeOptionError(f"{unsafe_option} is not allowe=
d, use `allow_unsafe_options=3DTrue` to allow it.")
> +=20
> +     class AutoInterrupt:
> +         """Process wrapper that terminates the wrapped process on final=
ization.

Hello,

I don't think we need this "linter fix" _p2 patch. If that works, can you
send a v2 without it?

Same for the scarthgap patch.

Thanks!
--=20
Yoann Congal
Smile ECS


