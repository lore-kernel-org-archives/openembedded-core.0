Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEAD0C369B2
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:44:08 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.5125.1744663442359913042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 13:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KWHLLnHt;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4766cb762b6so46439951cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 13:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744663441; x=1745268241; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHllxwvgtPTgsMC7m1Eo86+Teja81t4cUFjAWe1iTkE=;
        b=KWHLLnHt0BVtNNceaGcEtkvBkmbgSiUqO0R9TBEqE2C/McP91MkNRnvbH9pBxiJtDY
         hYH/h7S/URGBYa11ONWRT0r3ddjC9BqS0VD9CnfZjWFaHu/6F/h/CWKHMNme4A5/6kSA
         exYImoKBZXrzVKfqGvXJcMW+rEvMM2NAUcY3l34ahTIO5nZLKan3liULemMaYrTUJgKm
         MiwBtuXCtd+9BVzgo1QnwU9ApX2k5qq/XwcbMgi6Ga4U8JgfWwNOiGgqyxGy0p8wbN9g
         3iAqT3jvyc70bxwYGfj/0hllNYHaJceAeaN6n/UWUSJULLz70zSS/mK81oRqRmZgbSn0
         nN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744663441; x=1745268241;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHllxwvgtPTgsMC7m1Eo86+Teja81t4cUFjAWe1iTkE=;
        b=TnyLJW+IPqFzFCjgFsgYKCPnQtZKOXYcRXlmubKNYEwc69+Hp3scx4z6RZ71ueAG9x
         AApoaW9Ex40gHu22sEPMNa/s0UciwTb2PIdcIaAg0afdQupOr6vgRViasfJ/Mk9g0+r9
         KRqz3sda9X1OUbzK8iX6n3Ce4QjUWWw08CK2dbBrGAMJN4TnU2rncVKwIB9G0p7CU1Gg
         gIGTwAXrq5Kybv1CbUFCxmX5I918E3SNarEKiQDWFsnvqtzvfQITbPGI8F46o/nUVDFr
         8kF4Ify2Ya58MTIy0dtzaGQ6TaGL6oOiVOFhGPZNHhpHB+Nd/Cvbsg8n+GyyhncKcfSR
         pGxw==
X-Gm-Message-State: AOJu0YyXocew4MEo1v5mexFpbrcK7iEIbko5yaVGsEEStfjAJnWZBCOG
	u+mUKNfjQQkVTSnrRjj4G3dvNZS6gMdC9fW1emRXP3Xf/miKKCw4SduQSKz0
X-Gm-Gg: ASbGncvi12/c+pMchVU0pOvUpqnopHfKyYUuuxOng4D9rXcyyumES+KOWB8xN1xQWSx
	2wLzwgpFGCx3+xjB0/VL7wxrWk0IDxdgQCYgJ2uhlZEF1U5XYZ5yxl58C8Vq8G9V1r5/HboMeJ+
	R/CsatAG/pAf6jS69b5Y68Il3juQYIEowb4xXdHjSTPJ56tpAJYxhJRcndJREHNnJqoMjIOrcOo
	eAMivYLShj30sm/hHpwLpZQfcclHpNCGcqcgwUFoLrVzjlJ4NAnjn+KrJxx4MIYH7XIqvnCafzU
	0rgkr5u6og6JMjpEr8nKmL4NUMLUoDiy40gUsVaWjFRUlg2qFr+RWS7Aditoz2lsQYZN
X-Google-Smtp-Source: AGHT+IEHfybFhFLHg72LJjXAECuZqT/8mJ6e5KzTHVxp3XiFNrLatdQWLKs5v703H117SeoncZjUmA==
X-Received: by 2002:a05:622a:1907:b0:477:84cd:a0c9 with SMTP id d75a77b69052e-479f6860297mr13722381cf.0.1744663441285;
        Mon, 14 Apr 2025 13:44:01 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc4a07sm79959981cf.66.2025.04.14.13.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:44:00 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:43:58 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 09/11] image_types_wic.bbclass: capture
 verbose wic output by default
Message-ID: <20250414204357.GA9290@localhost>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-10-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404162932.447699-10-mikko.rapeli@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214810

On Fri 2025-04-04 @ 07:29:30 PM, Mikko Rapeli via lists.openembedded.org wrote:
> Call wic with --debug to capture logs from wic internals
> so that it's clear which partitions get created and which
> files get copied where. wic plugins contain for example
> race conditions which don't install files at all and thus
> images fail to boot and it's not possible to debug these without
> something in wic task logs.
> 
> For example core-image-initramfs-boot do_image_wic
> log is now 576 lines which is not excessive but very
> important when debugging problems, especially race
> conditions which are only hit in some builds in CI.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/image_types_wic.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> index 1b422b6280..10888bc12b 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
>  	if [ -z "$wks" ]; then
>  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
>  	fi
> -	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
>  
>  	# look to see if the user specifies a custom imager
>  	IMAGER=direct

When I need to debug a wic issue, I add "--debug" to WIC_CREATE_EXTRA_ARGS in
my conf/local.conf, debug the issue, then submit the patch which modifies the
layer without any debugging remnants left behind. I can then either leave wic
debugging turned on, or turn it off for my builds as I see fit. Turning on
debugging by default for everyone using wic is not what we should be doing.
It will slow down builds, and will inflate log files... by miniscule amounts,
sure, but not the direction we should be taking.

If you feel there are messages that should be logged on every wic invocation
(on which I doubt there will be consensus) then they should be moved out from
behind a --debug flag. The whole point of a debug flag is to identify messages
that do not need to be logged on every build, but only under special
circumstances. Lots of software projects have debug flags; I can't think of any
that turn their debug flags on by default.

