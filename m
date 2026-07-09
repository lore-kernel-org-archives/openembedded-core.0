Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC766C43458
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 18:00:20 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2908.1783620019960436916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 11:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u5h5pLsD;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso841155e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 11:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783620018; x=1784224818; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xk/Em908ZZKZRzfwKC7ttDov332YmeYCPXvSQ3peQVU=;
        b=u5h5pLsDeDqrJaFV30i1Tp5dMsTzSTIuqOPvmluQnJpFXOaCxc5Dp1RWJrYVjBhPD8
         xF+HhUM+UW+qofn7d9TyU32q3bav1I4dazZdiN734XttteLwYyGplX2ijmdahstvt29w
         IdrttdGFvclLAoGPvLUG5l0nl8Du39t0QdpEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783620018; x=1784224818;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xk/Em908ZZKZRzfwKC7ttDov332YmeYCPXvSQ3peQVU=;
        b=JDk7hk/0/pS5mcmp9SqfObMSGZ+sSCG//A/UQvvnOft9yfG2CNQ9CIKwMxGKbWsTRo
         D0nkFGsg5weB4EZqhs7HzUohfCSw1Ky5CAzlpRBjkNDf8zT7J9MDUAmjo9I+h4YpuH1i
         whAQhNguX2faj9dHYZHycJRnMy1TXjIh4OeciBKiRSLJUqXQ6PqpyDZK9Z8G7iNcS6oG
         JjKPzQHfgSMEBGfKSk2s0W36kM1Y/BsOQbm8OrrRcWSIBROZEGdzhMLyfNi/NGP5RqR3
         FEOjhGOyrBor4AwHlE6QpFUnubk82tbcv3Bw4PJ1rVh8JR3ysEQnq5ptGioB/+Ej0Htc
         uNEA==
X-Forwarded-Encrypted: i=1; AHgh+RpuhrP32GNu49BnBIqYHofDe13NsETQcNEeZ7o3WHBGYZSA0aX6psuZ88/+3jcnjHoslp2vW9kDG0nRLsSdNbiBRQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyjZMEI6HI1qh7fZQj59Xhc/JRU/EysS/cttkSkeZN4bf988X3T
	KTJQQl/G9zqnAfSFkNx3cT73dCFyb2d2/FnbPqECBk4iJDN1RYOrbNkuNN2eAc9M2G8=
X-Gm-Gg: AfdE7cn/RpJs5IkDnmGh6zfnS2Q1fq7Nsfw5wlpsmsNuUvLNlIKv+Ut+O2mKZuM07uE
	ujKbq8NX+xyKSEjgUaXcpWFS95mxL2qlzkPi+cvVc5UHGkMdWSloTa5DC0E3s5KXjilNKJOCdHz
	fmP2CYjyucz0Ypz8OpmkdZSQ4ONSzdXDdK/5oFxhNuEcGlK2u+GX30C+Y8gDTO3oNFIU9uycTtt
	UMbaHjidF1mqz+qq2mtgu9rnJwXocBU93n8SJNCyzmq0BjnSMm2DvO4gNO4hWVQN9C3B/xg2hqh
	g82AuObSD9px/3w4qYQBa9mIYXVBvo+mh5MPtK+7LJpOaujYkrGnVAwfo2CMWnYeFdMfLQi1wF+
	FK86wB0+x3Re2rQENbw70R7OaG20kD3Qe88eQql8W+1bjlnJe8ttXgMjCNfZWAOjJKj03HXC0yF
	OlnVOTBQTKKLlQrt4daVk33OpVNU3ec/9zjroB2sPSdiuETEp4nHVnZ2ZDB7waEjOUTGtAXuMyp
	65uBg==
X-Received: by 2002:a05:600c:608e:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-493e68bef22mr75357595e9.22.1783620017933;
        Thu, 09 Jul 2026 11:00:17 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm57265934f8f.9.2026.07.09.11.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 11:00:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 20:00:17 +0200
Message-Id: <DJU8J04DONY4.1RYTJPW8YHL7X@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] [wrynose] expat: fix CVE-2026-41080
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260709140651.48230-1-amaury.couderc@est.tech>
In-Reply-To: <20260709140651.48230-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240589

On Thu Jul 9, 2026 at 4:06 PM CEST, Amaury Couderc via lists.openembedded.o=
rg wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> The existing hash flooding protection (based on SipHash) only used 4 to 8
> bytes of entropy for a salt, when 16 bytes of salt are supported by the
> implementation of SipHash used by Expat. Now full 16 bytes of entropy are
> used to improve protection against hash flooding attacks.
>
> Introduces new API function XML_SetHashSalt16Bytes and deprecates the
> legacy XML_SetHashSalt which is limited to 4-8 bytes.
>
> The fix is split into 2 patches for reviewability:
>   1. Main CVE fix: migrates hash salt to 128-bit struct sipkey, extracts
>      16 bytes of entropy, removes dead get_hash_secret_salt function
>      (copy_salt_to_sipkey accesses the struct directly), adds
>      XML_SetHashSalt16Bytes API, deprecates XML_SetHashSalt, adds symbol
>      export, backport feature macro, tests, and documentation.
>   2. Windows/cmake: adds the missing .def export for the new symbol.
>
> Note: the prerequisite commits that Peter Marko needed for scarthgap
> (clang-tidy misc-no-recursion fix and WASI getpid removal) are already
> present in expat 2.7.5, so they are not needed here.
>
> Backport patch to fix CVE-2026-41080
> https://nvd.nist.gov/vuln/detail/CVE-2026-41080
>
> Upstream fix:
> https://github.com/libexpat/libexpat/pull/1183
>
> CVE: CVE-2026-41080
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../expat/expat/CVE-2026-41080-1.patch        | 517 ++++++++++++++++++
>  .../expat/expat/CVE-2026-41080-2.patch        |  33 ++
>  meta/recipes-core/expat/expat_2.7.5.bb        |   2 +
>  3 files changed, 552 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-1.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
>
> [...]
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch b/meta/=
recipes-core/expat/expat/CVE-2026-41080-2.patch
> new file mode 100644
> index 0000000000..0410f8b070
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-41080-2.patch
> @@ -0,0 +1,33 @@
> +From 3cdd1df2644388aff25dd0ed7128c7bb1de1a7d8 Mon Sep 17 00:00:00 2001
> +From: Christoph Reiter <reiter.christoph@gmail.com>
> +Date: Wed, 10 Jun 2026 21:27:51 +0200
> +Subject: [PATCH 2/2] cmake|windows: add missing export for new
> + XML_SetHashSalt16Bytes
> +
> +A new XML_SetHashSalt16Bytes symbol was added in #1183, but it
> +wasn't added to the def file, so the export is missing when building
> +libexpat on Windows with cmake.
> +
> +Add the new symbol to the .def template.
> +
> +CVE: CVE-2026-41080
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3=
cdd1df2644388aff25dd0ed7128c7bb1de1a7d8]
> +
> +Signed-off-by: Christoph Reiter <reiter.christoph@gmail.com>
> +Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> +---
> + lib/libexpat.def.cmake | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
> +index 9b9e22cb..948135a5 100644
> +--- a/lib/libexpat.def.cmake
> ++++ b/lib/libexpat.def.cmake
> +@@ -83,3 +83,5 @@ EXPORTS
> + ; added with version 2.7.2
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerMaximumAmplification @72
> + @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetAllocTrackerActivationThreshold @73
> ++; added with version 2.7.6
> ++  XML_SetHashSalt16Bytes @74

Hello,

CVE-2026-41080-2.patch patch message and linked discussion only mention
build on Windows. Are you sure we need this patch?
Does this fix a build failure you saw?
I'd rather not backport a patch we don't need...

Regards,
--=20
Yoann Congal
Smile ECS


