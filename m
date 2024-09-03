Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED948CD342A
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 07:38:27 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.17747.1725349099321383994
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 00:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dhstjC0n;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f025b94e07so49402161fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 00:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725349097; x=1725953897; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mndN1xgYS9b8PX+hLmV9wkpHrGuXV9p1ytawUjN2ZnI=;
        b=dhstjC0nc34eBKhNR2m1RXql42+6ibBAV9EZRCC/vGS76Ki5ujTWrdUCQZMQcKnKWJ
         v0kvYsoyPCrhBVIzozwfKXWGaj3pd2UumoMfSLs2Fg4hHLGtSgThqojhXGz8mNeT40a2
         FkJy9ofjSb7yINmr8DeAS28J7kbcXrW6wDSuc3yFgDGJ8XmQBcXT1ALxdW958RNDQLDY
         8PU8cXyrfAjAwRN8n34rNBoJxaEb2St+HyUTREaoJDieW+fbpVkKtnRD+jkzYunQhzpF
         fQkL/biqAcYv2LNHEEOhTIudyzcrBP1q6itHQQG1CRt+yiXYcC0ZuedcliNZYbKUvF2s
         e2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725349097; x=1725953897;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mndN1xgYS9b8PX+hLmV9wkpHrGuXV9p1ytawUjN2ZnI=;
        b=kk7vqMWb3EcKyOAA0i8+f+nWtKJnZjsEnBrUl5rnhhCHFFrQGlvPOpsI0vHh/SVZh1
         YNoF6n8QZL/WQIChkJrhEcnV0qCvdR5ptTp1f0WZFqBdYX26TV6wKkRZc717imzXms1O
         wz4/XROYwpVgfxTR9mr1kSBYgCqm2LJPm6AzSVzH0Rj+NZJyxW5YXbQN0rk/13hmEZ6v
         52e0X6Q/OGStiAZfaxbclCQIfL8EJGy59BI3T1YsBlegfa2KcwGL/1MR/Es84jq1/fgs
         AMfrJ7Z6Se2IIb0f7yNLPf/bcoMREofTOgNcxgOGG9enPWoapOIl9KnyYbTKOd9+Po23
         Km2A==
X-Gm-Message-State: AOJu0YyuNvGhipXLq3ARA8bDpmiQEX30tsACN/v/lBV55G5xEyl28T5M
	j1xu1B71raaXATpfkYfwP9ghSOnpv6RUKliIYPnFF9u2pL7A2wEfyTB9x6DUFPE=
X-Google-Smtp-Source: AGHT+IFPTZqyhWlownS7q84L+dM+JfYazHPs5xw32ViNiWiqJIF7bhf5ZMauWDrzMM2+dp2chLmCiQ==
X-Received: by 2002:a05:6512:33cb:b0:52c:f3fa:86c with SMTP id 2adb3069b0e04-53546b25743mr9004706e87.18.1725349096677;
        Tue, 03 Sep 2024 00:38:16 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079c192sm1907874e87.53.2024.09.03.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 00:38:16 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:38:14 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH v3] kernel-fitimage: make signing failure fatal
Message-ID: <Zta85v2-7HN2rYS9@nuoska>
References: <20240902161307.1222507-1-alexander.sverdlin@siemens.com>
 <ZtamyY45LZ_6pYw1@nuoska>
 <00d698a7928a1ed68b00343aa627181c0ce4797a.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00d698a7928a1ed68b00343aa627181c0ce4797a.camel@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 07:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204123

Hi,

On Tue, Sep 03, 2024 at 07:24:31AM +0000, Sverdlin, Alexander wrote:
> Hi Mikko!
> 
> On Tue, 2024-09-03 at 09:03 +0300, Mikko Rapeli wrote:
> > > mkimage doesn't fail if it is not able to sign FIT nodes.
> > > This may lead to unbootable images in secure boot configurations.
> > > Make signing failures fatal by parsing the mkimage output.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > > ---
> > > Changes in v3:
> > > - bbfatag_log -> bberror + bbfatal_log with relevant mkimage output snippets
> > > Changes in v2:
> > > - bbfatal -> bbfatal_log
> > > 
> > > � meta/classes-recipe/kernel-fitimage.bbclass | 9 +++++++--
> > > � 1 file changed, 7 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
> > > index 67c98adb232..ccf848e643f 100644
> > > --- a/meta/classes-recipe/kernel-fitimage.bbclass
> > > +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> > > @@ -753,11 +753,16 @@ fitimage_assemble() {
> > > ��	# Step 8: Sign the image
> > > ��	#
> > > ��	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
> > > -		${UBOOT_MKIMAGE_SIGN} \
> > > +		output=$(${UBOOT_MKIMAGE_SIGN} \
> > 
> > Will this subshell return errors as before or is "set -e" propagated there?
> 
> Good point, I need to test if I'm not masking real errors here...
> 
> > > ��			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> > > ��			-F -k "${UBOOT_SIGN_KEYDIR}" \
> > > ��			-r ${KERNEL_OUTPUT_DIR}/$2 \
> > > -			${UBOOT_MKIMAGE_SIGN_ARGS}
> > > +			${UBOOT_MKIMAGE_SIGN_ARGS})
> > > +		echo "$output"
> > > +		if err=$(echo "$output" | grep -C9 -E "Sign value:\s*unavailable"); then
> > > +			bberror "${UBOOT_MKIMAGE_SIGN} failed to provide signatures for these images:"
> > > +			bbfatal_log "\n$err"
> > 
> > Is the problem really in mkimage since it does not return errors when signing fails?
> 
> I'd say yes, but it's explicitly implemented as best effort approach:
> https://github.com/u-boot/u-boot/commit/56518e71041f#diff-b0d9a26d538f8dc3aff2e1b518534e9e2026713b1f4204e2680d8a84244e3408R234
> 
> But how many years would it take to propagate new mkimage in practice?..

I think this should be challenged with u-boot upstream. If the tool is explicitly
used to sign images then failure to do so should be captured and error value
returned. Patching this in should be straight forward. Working
around the issue by grep'ing logs is not good in the long run.
What other failure modes may exist?

Cheers,

-Mikko

