Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28042CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:34:07 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16308.1791192840262660354
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XloMJT+6;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so777338f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791192838; x=1791797638; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45Ps4vZreHWero4+SKPE2GNinb4kCqeRuat0LL1nB1s=;
        b=XloMJT+6Kwu6+x0bHie80oh8w/GPThQLAhZGSro8QIiaNsg2+WWY1EvSSRud3+bGXD
         ueJOygjWPTF7r6g67nqQu4FXneTflyM+8n6bkVsggbxiJxsQwPl7Mh4zJt9amvmktDgk
         4bECxX131sAdWsU5fZlMwLok4XNzAeTpynASQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192838; x=1791797638;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45Ps4vZreHWero4+SKPE2GNinb4kCqeRuat0LL1nB1s=;
        b=0jEoKr6Pi6Zn7mY0QQ+XPdAILDCyTf7YqvsmokU7u2B1DvVAfduKgwRoiMj00mg38j
         1trvvXs8rBbr2bEE4HrPNRxQgJl0inVWMWt8nXeaiSrLJVa+PlDdJZmirLnvzMPCo/dO
         SkeU4IPxOT5tFP8GWCqnmTDkPyEMdnyfyz7k5zTiMaxbaI6X1ZgBMccQQ2GwQ82k64+D
         ayt4AFeG6STfdJOGc5VJQgY4Sok7Yy8ty1hvGvDXDXQEtLHFg2fWOG191lkohGJEuMrn
         DBqjjVTbr0PiMvKu1ndJzC7F6bJoLPkrLHBLSMKA+4DCfBxcksjnXZ2QMj4e7qVQ/BWx
         5lKA==
X-Forwarded-Encrypted: i=1; AKwUvBxklwrA2N8M+ZopRLHxhRTAzRfnfu6XYghAETMyXqOP6TM9whxrYoNxMaf93Be4i8EHnM2p5o2sSsBD5VsVHfg5OQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLiqDs0qjZP4fUEhFdKHEjFfDzCldQIlIhIf+/obyikRgIeVAuK
	ezgV+6bqGass4BTHSpX5AlAutGzCGbfEkNcsw0agxUd9PO0a8u9245TY7hHfkQ58kaE=
X-Gm-Gg: AYBFou0vaGEUW1/fhYh2oFzc6pV/YFrZomDBpWkOzsVvICXOnfwId7adaBG0OoT/J20
	ae1yEoQZqapz/tVmx2byKQ0MlGX6CgNaE4yCwKR8r3mFMsAZ8LyaxyYrtxFenPvn1gzx2SjCIrl
	kusZwO0hLvSZlenqfDAAYmgaUXFQWddAX7S/mDn+zp0Fn7cWY0oJmHicoDq8oioOJ/7CKGbur3h
	vgJMglKFICf6mQzemhRWSkfNq7yDv+OG3gPQTRgndAxDDpNWXoPXi8kYb8P1+rdOhGAwCbLzVUE
	77hqnlSXUMolEz48aq/D85uXk7NVG6qFNIDWouE6b3JTCdI4BSd/aAyD3rkDWFTq8eMENOEe/Pb
	ozyEuChtjEpAI+l7mVI/G01nmBN2OvLLxgJiiLmwhrvp86pVURzrBeF6nvCJAHhBKgwqkjWar2C
	wmuZwDj6/4km7Hg8LwobRh83xdEWxZKA8dmdnEO/j7klJ6sJSbmnUXiaamIE7kzAwsRRmOqWR9Z
	CtWxUvbSAsp0tjjgleqorTLzrna6yloYiyrVLqGWo0/T2uo/bZBCY2sZCY=
X-Received: by 2002:adf:f584:0:b0:488:8352:cbfd with SMTP id ffacd0b85a97d-48b1275c0bamr11330328f8f.46.1791192838468;
        Mon, 05 Oct 2026 02:33:58 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c642b42d6sm1338841f8f.9.2026.10.05.02.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:33:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 11:33:57 +0200
Message-Id: <DLWSV9S5HI2N.1GZN40XKWDUCT@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] perlcross: Upgrade 1.6.4 -> 1.6.5
X-Mailer: aerc 0.20.0
References: <20260929062603.67218-1-jaipaul.cheernam@est.tech>
 <20260929062603.67218-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260929062603.67218-2-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247234

On Tue Sep 29, 2026 at 8:26 AM CEST, Jaipaul Cheernam via lists.openembedde=
d.org wrote:
> CompareLog: https://github.com/arsv/perl-cross/compare/1.6.4...1.6.5
>
> - Drop below patches which are part of release now (more details in compa=
reLog)
>   0001-patches-for-perl-5.44.0.patch
>   0002-Add-configure-checks-for-perl-5.44.0.patch
>   0003-Fix-checkfield-for-C23-compatibility.patch
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...ile-check-the-file-if-patched-or-not.patch |   2 +-
>  .../files/0001-patches-for-perl-5.44.0.patch  | 110 ------------------
>  ...oss-add-LDFLAGS-when-linking-libperl.patch |   2 +-
>  ...Add-configure-checks-for-perl-5.44.0.patch |  47 --------
>  ...Fix-checkfield-for-C23-compatibility.patch |  35 ------
>  .../perl-cross/files/determinism.patch        |   4 +-
>  ...{perlcross_1.6.4.bb =3D> perlcross_1.6.5.bb} |   5 +-
>  7 files changed, 5 insertions(+), 200 deletions(-)
>  delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-patches-f=
or-perl-5.44.0.patch
>  delete mode 100644 meta/recipes-devtools/perl-cross/files/0002-Add-confi=
gure-checks-for-perl-5.44.0.patch
>  delete mode 100644 meta/recipes-devtools/perl-cross/files/0003-Fix-check=
field-for-C23-compatibility.patch
>  rename meta/recipes-devtools/perl-cross/{perlcross_1.6.4.bb =3D> perlcro=
ss_1.6.5.bb} (80%)

Hello Jaipaul,

Do you think we should backport this to blacksail?
Changelogs mention perl 5.44 compatiblity that we do have on blacksail.

Any ideas?

Thanks!
--=20
Yoann Congal
Smile ECS


