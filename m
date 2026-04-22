Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1172F9B5F5
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:15:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76584.1776849334780733062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V+cZQi/1;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so3233074f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776849333; x=1777454133; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+cc19+8rsZQdM8sNPzJwGHvpRHYUv2cM7eYWltBeXA=;
        b=V+cZQi/1lvgdHYvdzmi+KueqCeGAGcY8R+q343DwmbnwMbotWUuT5b/GCwPMQdiHT/
         f8QeOHefmRD7ELxJWwzJbkJD2EFr+RKo3ZLpioqK6zPfNjqOWU2d1dRBakxt3vi9qzkM
         xKbd5qaWOXHlh7BWquy4AIoO8xShdsxo7vOpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849333; x=1777454133;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+cc19+8rsZQdM8sNPzJwGHvpRHYUv2cM7eYWltBeXA=;
        b=caq0CuEXkdeqIWoS4Rli6osVzrn8bVN57vAvtrCF6GZJ7+VbXf2OefjxWk9tAKrxMX
         g4gI/0Q8Hb0FuD3/gGdlSepvpNkvA/216SptdGWR3gpuW3BVsO400K+V9UqjIiFShGqU
         yAKOLb8pQT+7zBZ1a1YsOi9B+FudZ8m8BrY0ghyOS1hppOIyZ5CQlnYF3i/xhJ/IiDy1
         kkdc1jyuKsVfKG3q8xq5mRwnh8YbdAwbz24MA1wWk+akeQ4EpiK278utspEhQA9cUYQ8
         I/jNbjKIrghfD/PJuQjcMz2WhHaH/Ia7UXkNohcVSw/pOQ2RwSV7L1qhm7isemECGMne
         3mRw==
X-Forwarded-Encrypted: i=1; AFNElJ+RNT08oiiSJn7nlOrQ3lzzffCeJf9F0d0d4SwrHaMY8wDHU10B2hRuw50RjBDz4/c/OTV8xGBq6rvVNoSPorafBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz/9cztSTu/LZS2h4Iw5agQ2Et4DqEkFP4uBOa45GhH8wQp1Yid
	Y4Rql4ak3Zt5XlzrCZyFk+Vt8wfHT1SLnwyiOaqKdH92AZXT4kFkswyfD+1t1Jcx4uw=
X-Gm-Gg: AeBDieuuYcCEh9VwWoupgpld8aqUzAbWsB7cOC28bDLeWxSkvJAaERJCp5A8h7WMFPx
	O1XD8Gqg1kinSMKJT6wq1E4fFGoFBw2AMNyd7n0XMI4acTE5OD+2fu6mjEJaSGwiR6BZvN+DmT5
	m1dVTHXkT73g0Ipwt3DVNdwsF+RYfuzdK138NIInwf0AEKQN8K2gw8G3iDyJYDPZmWYitllnSPY
	kztH6tyi3F75JbZH7N1db6TtJAybPry3Rr2KTOI1n3Rbodk/r6b2gV/BfMNJuJsINi395Pg9mXu
	A+n7vm3lwWSjS/MYeIYd+QaNjFBJNUZcNjJwcgVbx4D6rRz8Z7p0ny0sFxQTrO553Nu2EsC7FQj
	/DjnUkE1VXrMMbb9gk8zOaPEVuGMRb40Izb2uVaSdtKDOW4aURdaVWiyKbA7y311LRbImCD5b41
	SjguDm70LdR1LsnFCPFDDpjbPx+YqsdG4FoHJAIpO4DURJDXGX6Y+jHet9pPk3A/gC7Q21l8QU9
	TWCilbbn0zcBmmJvcSKoQ==
X-Received: by 2002:a05:6000:40dc:b0:43d:7b7b:ab77 with SMTP id ffacd0b85a97d-43fe3dcbbeamr31768178f8f.11.1776849333074;
        Wed, 22 Apr 2026 02:15:33 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4ffa8sm45183483f8f.35.2026.04.22.02.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:15:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 11:15:32 +0200
Message-Id: <DHZKIQHF6ZKC.18K6QJ6J7WXH3@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH] expat: mark CVE-2025-66382 as
 vulnerable-investigating
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260422090017.322293-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260422090017.322293-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235703

On Wed Apr 22, 2026 at 11:00 AM CEST, Adarsh Jagadish Kamini via lists.open=
embedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> No fix is available yet for CVE-2025-66382 [1].
>
> CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availabl=
e yet"
>
> [1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---
>  meta/recipes-core/expat/expat_2.6.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/e=
xpat/expat_2.6.4.bb
> index 048093f010..81dbb6a687 100644
> --- a/meta/recipes-core/expat/expat_2.6.4.bb
> +++ b/meta/recipes-core/expat/expat_2.6.4.bb
> @@ -67,3 +67,4 @@ do_install_ptest:class-target() {
>  BBCLASSEXTEND +=3D "native nativesdk"
> =20
>  CVE_PRODUCT =3D "expat libexpat"

Hello,

> +CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availab=
le yet"

We don't usually add "vulnerable-investigating" CVE_STATUS. So I have
some questions:
* What is the point of this change?
* Wouldn't that apply to most of other applicable CVEs?
* What does that change in the CVE reports?

Thanks,
--=20
Yoann Congal
Smile ECS


