Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9DDC4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 15:23:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.425.1784301802611227199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 08:23:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HQ6ZesHN;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4720d22c94aso5121256f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784301801; x=1784906601; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZglh1xHJPcHt3k/RsmeMTPy0kecnYPMfYx3l3kggjw=;
        b=HQ6ZesHNK9LUW/pfc2ftuMNfI5UKh63Qhpod/HLouvKo7LxPxo9AkNDnTcOWazSJN+
         t0+6QvroXCIBaU0dJ0zOyNSKZCUBtGW1BFhe6qPZKo42lVPMEewcdHHKUl1z+ol48Rb/
         v3DmyuFPNm+ujHzP2TPXRRxMaXyYAe7oC711I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301801; x=1784906601;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uZglh1xHJPcHt3k/RsmeMTPy0kecnYPMfYx3l3kggjw=;
        b=EP8yTky9+qz9GZEweQpxy9ik5jio5Lr0m6c/JAi3RzTENtaG0GSlCnwW35rF+jBZiX
         F1+m327doPpM+XkUMBRJeDcYAJ6iBW1IBWTND8BkyYx5EJH8XzpF4vAnkhpKQk94Mc0t
         YFuXfeKlqhp4hGw+CSF//JrVFbrvcg+jK/EBbb7YzT+wE9LS2tZgRckPY2U3cNaCWaqZ
         3K8h1n4NkuHAlGuXB5Ot2jrGCzsW/CzeShUvAMh3lvJc1BCUbylTYYw64xxCpAhZ8aKU
         szYZfrFBzyijkl7dzdyFjAzPfsmT9XU+4p+4IpX6EpH6HNnGwuq/acPqdKb7epRYzfHc
         pmkg==
X-Forwarded-Encrypted: i=1; AHgh+RrCT4oIHb5p9oIrrXvgVJP0KlonIDJECVR9Oo79jHHmDwZv/gjkccEGri7Au/xHxna+a2CYxwi5TLBU7jDdLRzO8w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxD4pZ+7ySil/kUYStbCC2OMh8MKP8nc3CPjqq0jWQ4+UxNe3vh
	CKnR3jZm2r3URyvNfJb9T2J2My55WKrvfoojcH57YLW9DScOymmHIF5HBWz4HlTBajg=
X-Gm-Gg: AfdE7ckVJKIX71pN3Kssia/6wwoiD8ItisxBTcdwZvp+U5jekfgTuwSth/Y1KnJl+3Z
	k3WLK2T4Pj893+CMdklxMAvHzwj1JU5LmR2sZkUMuT+HC12kN0M3ZHhX4dP1XX38nqSgy6oKSN+
	Dd73ESo2I5aJzgc3tUonS9LF7MEF+zcllbeyrLtIz4SZtsQGULKjTco3GVuo4QSsyyCuxaRsQpv
	vyaeAM555btQll87e9jTjhYph6A8A/ozGkIzX1oo7ZgCyX1vuNA3EoSvmXutQxOLIsDOoqvcmah
	R4k/dOA0Q6cdcvG+qo+9por+MaWWcqGzsjGRPeZ+/dZ6e5hYImvchBP3ADWK0WBGF1UX8fj67rK
	XcliTHTj99EL4K7p5kOjIj/J5QqaDdLec8T8LEHLd2ieMkgv5XO0WMSbgFdme72JbGm+DVJZAiD
	j7YI2IgokDO63h54Ucp5N4bGdi+UDCeDOd6ZoIbtcUZZPRyGjz7JKbrZMDMJ+pr09dG5EAMUlny
	/J45A==
X-Received: by 2002:a05:6000:2f85:b0:47e:693d:6cca with SMTP id ffacd0b85a97d-47f623225a6mr4105418f8f.42.1784301800546;
        Fri, 17 Jul 2026 08:23:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa0093f4151e9fe9f4b8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:93f4:151e:9fe9:f4b8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ed1911sm4674371f8f.22.2026.07.17.08.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 08:23:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jul 2026 17:23:19 +0200
Message-Id: <DK0Y76VFY9IE.2KH0G9SO8XT0U@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 01/10] expat: fix CVE-2026-56403
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260710130809.2817559-1-deeratho@cisco.com>
In-Reply-To: <20260710130809.2817559-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 15:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241205

On Fri Jul 10, 2026 at 3:08 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> These patches apply the upstream fixes shown in [1] and [2], as
> referenced by [3].
>
> [1] https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d856=
5f6bf1cf245f648
> [2] https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c0983=
70a8362aed47b15
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-56403
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
>
> [...]
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch b/meta=
/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> new file mode 100644
> index 0000000000..a17e3a8b3a
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
> @@ -0,0 +1,52 @@
> +From e8100827a4f68c70d8cadf446bb82bec7cbebbac Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Fri, 22 May 2026 00:43:52 +0200
> +Subject: [PATCH] xmlwf: Protect function `xcsdup` from signed integer ov=
erflow
> +
> +CVE: CVE-2026-56403
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
47c8f36d6277d5c6011c098370a8362aed47b15]
> +
> +Backport Changes:
> +- Include stdint.h explicitly because Expat 2.7.5 does not expose SIZE_M=
AX
> +  to xmlwf.c.
> +
> +(cherry picked from commit 147c8f36d6277d5c6011c098370a8362aed47b15)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + expat/xmlwf/xmlwf.c | 8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
> +index 2d0c4f8e..934473ce 100644
> +--- a/expat/xmlwf/xmlwf.c
> ++++ b/expat/xmlwf/xmlwf.c
> +@@ -46,6 +46,7 @@
> +=20
> + #include <assert.h>
> + #include <stdio.h>
> ++#include <stdint.h>

Hello,

I *think* you don't need this backport change anymore since:
https://git.openembedded.org/openembedded-core/commit/?h=3Dwrynose&id=3D210=
42df15008ce90b76958d74200298d09d71254
(added stdint.h into expat.h)

This may also apply to
meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch in a later patch
of this series.

Can you check and send a v2 of the whole fixed series?

Thanks!
--=20
Yoann Congal
Smile ECS


