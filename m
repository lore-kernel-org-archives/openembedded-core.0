Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331A7C88E53
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:03:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35343.1789117405382979258
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 02:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2JqLo8nT;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-485850cf499so504921f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 02:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789117403; x=1789722203; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lqZmByISVRkDx09SbOm7sGOk/j/4gplKDEm+Vd3ExDY=;
        b=2JqLo8nTTy22m8Mouwq9sUM8gGMrPmSfKq94DA2Z+Tz7XSi5OUz79IDoMhr/rf+OvZ
         nbDyg8abTB7Vb3uJqxX7ImpLXWAZd6kUNXO0Toxt6PX5BVUB8B5cg1iMTJA2SNQFQ9Cq
         rIhJazjEcorNWihxv24juVnCaLvTLjlqpkzj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117403; x=1789722203;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lqZmByISVRkDx09SbOm7sGOk/j/4gplKDEm+Vd3ExDY=;
        b=KBoiyNZv0ZGwOinGlCUwJydrkxAdRPOW5uhsuUf0KBSvePZVIr09pVzFhBNwtOrSrP
         cCissA9U+Rom3MrJ1jbl67gh7URD/cc+n1HHQxtJc49j18cq6VDBVggal7G83fnKzsed
         WqCPpsmeMgx2JxOIbkvyNuYVdO3fT0+HpM9By9dzMlQ1F/EIj1abIwx01y06oQ7j+/ZA
         AJlnSP9MwIHHiqvNyQQR4u81EwSXNWZbqG1/SKvOxhgy1LPQ5XY51pk8ROdaStHqfAlm
         7XyZRMnA0s670+1DwRKliVJzPvrfdlvuHr5Yej9M4rEf/r1v7ijJL9uDpEJpwmVOP3rD
         ufMg==
X-Forwarded-Encrypted: i=1; AKwUvBxByEqbm8pweE02r40WzQ8pcy9/BCRyMmV2w9tLQTMB0P+3VANC+2x/yDaHc1QYf+3B9Af2WAlmufzOPE2dWnKKsw==@lists.openembedded.org
X-Gm-Message-State: AFuF++nAyNsQ0w0Rg7H1ckOmBqXI/si8wwLZrWvFnVL7xsFzTlhIN0IJ
	K+WAC8HRO4QHOAqLnvnRph0IuGquesz4Dd2ke/HKO68RsAhFw384KA4ha3nDsJoLVpQ=
X-Gm-Gg: AYBFou2Fb1CD+ZqxkYSOrqfDAk00+fdGzTipVqFJDYL3cwho8woKMHTqhQf0Tp2QQUa
	01/eOikAcRS7A54fiZGT90xH6k3ZwoiRXtvRw4VaylBPmok05BPmgzz9dJYENPszenYNnrgQ0kB
	3JzoZmyBAquzGdBQJlj2SqhwTCqwoAMdurwbgrlBDfBBqkbfFUOoKBdQ4L7MJYIJjX/nD8t06Fg
	hkMYzL3E2JwZ1++UEzlsMsyNgqHpOh8eZEWnZos/XT/nd9RRqe1RoB0YCnq1KvnYAUeOer4kqrY
	ap7s9H3zQDtlzfVX6Akl3MydPYcOvMg4Q42ooL/+84u/cslDPXRZrTddOwhtenHvMBxSjYa4S4x
	vC++4mq5QyCbHHxjUjAiIw4uhtzF7hvO1fYMUS1cNxp/MCD672B8inoiI11XuuTQZBLLv6SRZ5J
	lbIRLOXV2BlH1LlPlXH+EeSkUdUgUmcCgjzGpHPTpDs3NEhvt+YIKfJreIR9Hkz8aLUyGlUQQy+
	gp+9rdbSj/XaSrBaKDVbO0UOZQGsJNbDiPqUDeCCdUUp+HiGu3+kVD54f1XJ6dZ6ggrRhEpIQ==
X-Received: by 2002:a05:600c:c48f:b0:49c:fc6c:be00 with SMTP id 5b1f17b1804b1-49e619efb6cmr36221815e9.23.1789117403529;
        Fri, 11 Sep 2026 02:03:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f1f7sm4440366f8f.24.2026.09.11.02.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 02:03:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 11:03:22 +0200
Message-Id: <DLCD6S1OFYVG.1UJ6XDWKX8OJ6@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] python3-ply: set status for
 CVE-2025-56005
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260903051903.3667481-1-hthakar@cisco.com>
In-Reply-To: <20260903051903.3667481-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 09:03:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245625

On Thu Sep 3, 2026 at 7:19 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> PLY 3.11 contains the picklefile parameter described by
> CVE-2025-56005, but exploitation requires an application to
> explicitly pass an attacker-controlled pickle file to yacc().
>
> No OE-Core consumer uses this parameter. Ubuntu ignores the issue for
> the same reason [1], and NVD records the CVE as disputed [2].
>
> [1] https://ubuntu.com/security/CVE-2025-56005
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-56005
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-devtools/python/python3-ply_3.11.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/reci=
pes-devtools/python/python3-ply_3.11.bb
> index 0855c871cf..5bed977158 100644
> --- a/meta/recipes-devtools/python/python3-ply_3.11.bb
> +++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
> @@ -16,5 +16,6 @@ RDEPENDS:${PN}:class-target +=3D "\
>  "
> =20
>  CVE_PRODUCT =3D "dabeaz:ply"
> +CVE_STATUS[CVE-2025-56005] =3D "disputed: Exploitation requires applicat=
ion-specific use of PLY's picklefile parameter with attacker-controlled pic=
kle data"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"

Hello,

As fas as I can tell, this patch is also needed on wrynose.
I can't merge here until this is fixed there.

Can you send a patch to fix this on this branch and then, ping back
here?

Thanks!
--=20
Yoann Congal
Smile ECS


