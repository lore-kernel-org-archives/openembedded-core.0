Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B83C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 05:20:11 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.13340.1744694402808025479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 22:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dF12FQ9w;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so4767357e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 22:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744694401; x=1745299201; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pwGUzk0n/Sy0Q6pTycv0PpwO3EfhG4F1PPjVh9lPWA=;
        b=dF12FQ9wGzjEWN0JUq4nRfMrPwCmmeHsHLoLUjUmKBZBmkleAHuP1Vl+hWAXZoVRQc
         WsdfBi6vrUQTDehWEMXPafpfOQINGLFjtuBFbAEXHgo9SDGT3pzBHwXoU+QvL67BVPHP
         CO1FJ82hFPQCpnA4BJbC0OBDdBmGA0frA1LGnrZ1z6M+R2ZUGGPOzWXWBlFrAPi3P2aQ
         43FfJwQWLsmtYTKoNmpS6fHAAtbyIQaVBKiWtIy2SJPE9ELKaVjhFjbYnZY1hhEu20d5
         hYeIE+croL+SY2S2/aFSU/4GVF0+Yn2c/+YO3HSM267F6NFISaUoxqzGdF3IZh7isDSC
         x3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744694401; x=1745299201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pwGUzk0n/Sy0Q6pTycv0PpwO3EfhG4F1PPjVh9lPWA=;
        b=RkLsZu7MUw/tLgXGQMgZPDuN2vvMVW7AdWVLWimOtgyGfYQ3QAVmMVz78SBhLkV9fh
         veSfdKl+yCVNOvuNF3J1blaVtslpUYzZ8kIg5A5GArxAkxy9ubcEx1u+Sr9vpXQ/M05m
         7oZKa4cS/nTgML/BbWcQBBlBNYzPpS2DD4sRf20lJP1eXMUi9GtbdORjpGpJpKqr+BV7
         E3VNd8jiOlxeTm9di5rdFVk+c7zRoTn7YX2M3UxWWfKiFDWs2ml9kpk2YPZsV6lrwBeJ
         opU2fJ0/bag9LKLzdBO4FRu7alXzj4L7uh+9bFjzRODD8igXFHVQDxec7T8M6Dpd6dwq
         ETaA==
X-Gm-Message-State: AOJu0YylIR4qx7GomxFRn3K0gAoMnMlvXTlZeSDBXbzCHcVF1zvQf9Dx
	Nq7Yl7rvuWH9Lc773KI5pelHobqIckOwUTT/qCUXGNhNPW2fPi+GBRaG8Hj5C00=
X-Gm-Gg: ASbGncsDQGecBqrR906Uzdjx7G5H+0MxF/r5wF6xLnvxb1PPCUfKnxmI22OgmgTy2fc
	ulHiiFGCnA6B1ztVjx0hlMrHy6jJe/wCqJTyHpyMoKmTZ8sMc+yVxHmrsK9tGaq2Ku//30ukWzB
	YfLxnPDQDDWe6p8WSCxVJ6vzttN1rOA2DAzl8k4yeocVpRGYAKa0dvSj/7V2DyCujHC/cPNUxDT
	tvCErt+Q3Ah+n4p0mTl1nc2wmoMLsc9Uu9SNDThXq6hkiuXFrb4qi8EGODvudjQ4H5SXBo34vVa
	Gq6UGq5xsyVg7hNzoyPA2F+HZBYTElPASa2/emQubAesVbk7ApgvlwMoZzVDB7DJNBQve2roeg=
	=
X-Google-Smtp-Source: AGHT+IErRYOY6IUW74IFgVLOtYXJwNroO+7IZT4dJzwrhk1e5UP2VrkOcJi9SDueb1RqN1uVFLGMNA==
X-Received: by 2002:a05:6512:1256:b0:54b:1039:fe72 with SMTP id 2adb3069b0e04-54d45295860mr4534421e87.14.1744694400872;
        Mon, 14 Apr 2025 22:20:00 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5170a3sm1339214e87.210.2025.04.14.22.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:20:00 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:19:59 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 09/11] image_types_wic.bbclass: capture
 verbose wic output by default
Message-ID: <Z_3sf3l8VmiXjfi_@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-10-mikko.rapeli@linaro.org>
 <20250414204357.GA9290@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414204357.GA9290@localhost>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 05:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214822

Hi,

On Mon, Apr 14, 2025 at 04:43:58PM -0400, Trevor Woerner wrote:
> On Fri 2025-04-04 @ 07:29:30 PM, Mikko Rapeli via lists.openembedded.org wrote:
> > Call wic with --debug to capture logs from wic internals
> > so that it's clear which partitions get created and which
> > files get copied where. wic plugins contain for example
> > race conditions which don't install files at all and thus
> > images fail to boot and it's not possible to debug these without
> > something in wic task logs.
> > 
> > For example core-image-initramfs-boot do_image_wic
> > log is now 576 lines which is not excessive but very
> > important when debugging problems, especially race
> > conditions which are only hit in some builds in CI.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/classes-recipe/image_types_wic.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> > index 1b422b6280..10888bc12b 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -72,7 +72,7 @@ IMAGE_CMD:wic () {
> >  	if [ -z "$wks" ]; then
> >  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
> >  	fi
> > -	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> > +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> >  
> >  	# look to see if the user specifies a custom imager
> >  	IMAGER=direct
> 
> When I need to debug a wic issue, I add "--debug" to WIC_CREATE_EXTRA_ARGS in
> my conf/local.conf, debug the issue, then submit the patch which modifies the
> layer without any debugging remnants left behind. I can then either leave wic
> debugging turned on, or turn it off for my builds as I see fit. Turning on
> debugging by default for everyone using wic is not what we should be doing.
> It will slow down builds, and will inflate log files... by miniscule amounts,
> sure, but not the direction we should be taking.

I just disagree. Default logging should not be excessive but logs should
show at high level what the task and tools executed there are doing.
wic logs without --debug are completely useless in understanding what
happened when image was created. wic logs with --debug are not excessive
but show which partitions got created and which files copied where.
Full rootfs content is not shown so logging is not excessive.

> If you feel there are messages that should be logged on every wic invocation
> (on which I doubt there will be consensus) then they should be moved out from
> behind a --debug flag. The whole point of a debug flag is to identify messages
> that do not need to be logged on every build, but only under special
> circumstances. Lots of software projects have debug flags; I can't think of any
> that turn their debug flags on by default.

I want to see which files wic copies and where, e.g. ESP boot partition, and
which partitions it created. Without --debug wic does not log these.

Some people want all logs to be empty by default, I want them to be usable
when things go wrong in builds which I did not start or even fully control.

Cheers,

-Mikko

