Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F331CD3439
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 20:46:22 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29103.1778100373479978286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2026 13:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G/cI6s69;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso939295e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778100372; x=1778705172; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoNkoXRRRbCRo0mSq9mdMrn0b4Cf/p/vUQO2DBND63w=;
        b=G/cI6s69SSzCCvmNIKh2EasvBZI5EmDfJWwPYQe10w0/Lfu+7d85cmQuumT5D1tmUL
         rk+R0QKkM+iR8rGm2dz1RgLFP2wkScs7rfMG1ovYtcBQy+iVTT+PhoMwZvFvDmyH5sdR
         WijWoA6Sd8ndjQosp5y/kcYzaqjgdi3oPz69k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778100372; x=1778705172;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoNkoXRRRbCRo0mSq9mdMrn0b4Cf/p/vUQO2DBND63w=;
        b=QHZnDic8/xUqbWKW8TM9L5baMM4rxuewPnFMB5WCQDlDzexad1f+e3iRQbdKi296nz
         UbMouRTBEYo3oSNpsAA1ptCdLCRQJdkXOMlHzwj1y7c/1hfXSz4gk9oI97gXDnsWHQl1
         sz9Az73SlnmNdpAGtBN8RCMs8dHI3JHY5u32m0I+9pQ60tMF1xohI3nvD8bmRXfYUVkE
         EbPoSzf+FuCPeXRuNJnE3HRVT2/fG6O8sQCo5xOMDrFDHFL6zulaeUjhlOYynMXjkqOl
         gK7TjvzJpDQuMEO1eqB0qqPk7G4mnUggJiy5KviM20R2I54QLms6zOcqv/ctAgRtRl2z
         F/Dw==
X-Forwarded-Encrypted: i=1; AFNElJ+vv9V6uoKfQC6cTx8tqz6jz11E4zkQYELkmKIxAiTa8PZNcK1yuw2uaQmBaxeftkBR4rfzJ8eNuJKnJek7lbV3ug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxW/aH6YoW3Emvs7mGyVsSTsqDdJ6a3jcGhY2su9TxSsrinsH+B
	FLASF6EjDBTZY/Lwl2OwVLrisnZXjr/dXP5lOIrcANjdQpjoX8/yZ5kOs9DwzqSdBkc=
X-Gm-Gg: AeBDieu5Ay4N6UpH5o92zC9r8bBZ4UHSl0mcC6sFJTIayZr9/AVjjBUQ2qo0Y6ByA3b
	u/tDLawJd7sDl3qUQQcjgu0uZFUK/TxgZk+bHL2aWTHqi2BteI3Un3itj8ORauemQkFTGCxDS4s
	q4StZFpJA83F8cGk7QKe+lRZ2Udq7lKS6D0Ea7RCokqjEdQXTYnoCepQfcGo91O6nppRE6/NJLT
	2htILbkmMS2i1sjphXkzjZYsMa6KTFrPKW8AZyOlytm8f5pdIulbhddbUuYnKQK/VV+oSzR3UHb
	ac6pJSGUXGftacYEf4mWy98kwa6NfzxCBoh8hsiDc1/0fl9+vMgzxtR4hSCoPvMk/J1bhzUoZdL
	cNI7PnzvsORFHL0mrcsvT7QpsPIRHeocYsIs+PMb8vvRBC7LBorggJDq2D5tCaz4PnicDb0Lw2P
	IaI+HtokoLaOrp4DyhpWKQXBlhtET5V30hxnem+4ZgzPQ9FsgN/Et3CbLTcIAeCZ0iDVrrC49GC
	O7YhFa3N8NdiVxU522KkfKHmw1nWPbVZQJg
X-Received: by 2002:a05:600c:c4a3:b0:48a:6fd4:d3d4 with SMTP id 5b1f17b1804b1-48e51f46e38mr84389595e9.29.1778100371559;
        Wed, 06 May 2026 13:46:11 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538a8159sm77695975e9.6.2026.05.06.13.46.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 13:46:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 22:46:10 +0200
Message-Id: <DIBVZ5KGY6VD.3JQ0DG3RR7SJG@smile.fr>
Subject: Re: [OE-core] [RFC PATCH] shadow: add libxcrypt-native dependency
 for native and nativesdk variants
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Richard Purdie" <richard.purdie@linuxfoundation.org>, "Alexander
 Kanavin" <alex@linutronix.de>, "Ricardo Salveti" <ricardo@foundries.io>
To: <igor.opaniuk@foundries.io>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260506194507.3786568-1-igor.opaniuk@foundries.io>
In-Reply-To: <20260506194507.3786568-1-igor.opaniuk@foundries.io>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 May 2026 20:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236552

On Wed May 6, 2026 at 9:45 PM CEST, Igor Opaniuk via lists.openembedded.org=
 wrote:
> Configure fails with "crypt() not found" when building shadow-native on
> hosts where libcrypt is no longer part of glibc and the libxcrypt
> development files are not installed (e.g. fresh Ubuntu 24.04+, where
> glibc 2.39 dropped libcrypt and libxcrypt-dev is not pulled in by
> default).
>
> virtual/crypt-native is in ASSUME_PROVIDED (meta/conf/bitbake.conf),
> which is why a plain DEPENDS =3D "virtual/crypt" does not pull
> libxcrypt-native into the native sysroot - the host is expected to
> provide libcrypt. That assumption no longer holds on current
> distributions.

Note that we added libcrypt-dev as a documented host dependency here:
https://git.yoctoproject.org/yocto-docs/commit/?id=3D2b41d175ea1924bf401a20=
3fb678261fefb228dc

> A previous attempt to fix this by adding libxcrypt-native to DEPENDS
> unconditionally (commit 65532fc751 "shadow: add libxcrypt-native
> dependency") was reverted in 54eccb76eb because it incorrectly pulled
> a -native recipe into the target build. Use class-specific overrides
> so the target build is unaffected and only shadow-native (and
> nativesdk-shadow) gain the explicit dependency on libxcrypt-native /
> nativesdk-libxcrypt.
>
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>


> ---
>  meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes=
-extended/shadow/shadow_4.19.4.bb
> index 94f155641c..cc69864a2a 100644
> --- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
> +++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc9a450b7be84ea=
c23e6353efecb60b5b \
>                      "
> =20
>  DEPENDS =3D "virtual/crypt"
> +DEPENDS:append:class-native =3D " libxcrypt-native"
> +DEPENDS:append:class-nativesdk =3D " nativesdk-libxcrypt"
> =20
>  GITHUB_BASE_URI =3D "https://github.com/shadow-maint/shadow/releases"
>  SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \


--=20
Yoann Congal
Smile ECS


