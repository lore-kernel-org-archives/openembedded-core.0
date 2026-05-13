Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7378ACD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 17:20:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.991.1778688889743237508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 09:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d/oMSYX4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b150559bso54726425e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778688888; x=1779293688; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=49/slmyAxj604Whg0DAxqZ1ZLicMIsI8pxC2yoyKaSE=;
        b=d/oMSYX4RQHetxUvwLLJBAwY2w06HCNvHVFWU9f4DneboG/Y1VrQpPtu51aDEpZ0zP
         9ta8RSX5yUCtqfJvaNT/VdtEI6LlgxhrDxmo1TNak85g42kOTnBXNVI778eFaZdAKVTg
         knoMib3RDsbL7IUOBSioI6xNBeLs36TM3zdEWpzcBa10mE/84xalb4RO5LFsEYrfrcFg
         GQNRSVrXIxBMFUhm+VWDy0NMtvq9fTa2674RB85Z6/kG1XHLpZEi/hfJa8ii8gVSz93o
         dFLoMRj7RrLC97B9vTkS689fnYNOcCkJ4Hx/OMhmiOydY1fZjITL5iK491XRRCRPnG4Z
         v1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688888; x=1779293688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49/slmyAxj604Whg0DAxqZ1ZLicMIsI8pxC2yoyKaSE=;
        b=afyUEeYRGsNquCk5c5HCoTbIrRom3bD/sc6oAeVgrEAzNQRhWoiSTn5/cdyQF733bz
         QTPWA3a9YBRPE79qE+iatD3MOx4X3Mxh+tfyilqFIxp36JLNw3z9jFUJokCcd1mqT0tf
         0tZkRVQ9QVRhuXBOiS5gvvPkMziaq3QgTxdAlGn4pMZEvXZBB61ISAk8m6JBGv1zxEoH
         66Jgkhsul4Dy3mRqwAimjxqwo4jMx4IEo4LP2zLYjCoGpI8QQk3KOmLOvhSmTjbyof9Z
         +MI/uuWklB1bTfFzrhfq91W8VUy80aWQAyAtWrEdBRkZHFh/sDb7ExBFcLHPUDYR33yB
         Bwwg==
X-Forwarded-Encrypted: i=1; AFNElJ/A15Hn25+VStmsritX0wGFXD0CQIKrlGdNUlDmNVbJrZPU1HRYFy1wW0r3F/vTHGXrGu7lyPeq6d9OjTQzRrkA1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrAEnLdiAmR7xvQAFI0WfG++DVvGikc3/iN/lC1AgQnFZ6Hbwm
	ASBqxqqx7EG1TtrFHVDUvcShh1/yoHeoxDPx3pqozM0Sp8cmYj9bd6Tn
X-Gm-Gg: Acq92OH0mTp1Mp64aeomSY3fCdfOx3OiSIJBKLYRViSaA+7/Z/MVdLg8jq6aB2Yum54
	FRctGcn4UHMSHZ1pzSo0XbjXNaEurEFSl5L8Te0gHHdLCS2WA4GTQ2dAKUa8xgVEitN0iUy2T3p
	9Jf3OGfWGch9emWZ6fUsz7eR20VyYzsTBnjLHsudO+waekkk8CdNFOpcFPeDMiDqpxLpo7MWzZK
	1mvazmzVaIvGt6UopiyPT61uJErB0am/ZDIuD+lQm8gaTRrDj/z6h/n9DeArkNYx9yPi3fXAnpi
	XnasKeQC+t5K4N+I06R9aBC1d8sGbi2jOHrYZ8WkOltlvAK9ScMSfUsRWe0S4zJDO3XJtEbvhJ0
	pc84F0EIy59LBVzJeJFcUYQXC/+UZdKEgYbv9JFE3GDSwpb5IcBoXWvm+XyFldM0lJKbvy2whHn
	gEEp9RqXJBtjLmRod8jVnRHOgVGdXiWbvL0nRkBig3XDzIkeTsVLN59ohatGE3bnQC5987nYkS/
	tG/MM/nJM3GXPAF1IKUR+5QA1g=
X-Received: by 2002:a05:600c:47c5:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fd1b8a099mr24508855e9.7.1778688887849;
        Wed, 13 May 2026 09:14:47 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fd62df594sm1432485e9.5.2026.05.13.09.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:14:47 -0700 (PDT)
Date: Wed, 13 May 2026 18:14:46 +0200
From: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, Peter Marko <peter.marko@siemens.com>, 
	Zeming LIU <zeming.liu@windriver.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [meta-oe][PATCH] jsoncpp: Fix C++11 ABI breakage when compiled with C++17
Message-ID: <honhrzxdm7dpgi423fzttwimq5ilp6um2xe7f76ouslrc3dh76@mk2dgdlrueog>
References: <20260501160902.1164934-1-ernestvanhoecke@gmail.com>
 <4cuhef6vftli2pf6xqtz36dbtw7y23ok2pkbi6xyjl6tkj2e34@nyrw6ab3wf63>
 <DIHOD2ZIV19B.1KE7P0P23E9GK@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <DIHOD2ZIV19B.1KE7P0P23E9GK@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 17:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236996

On Wed, May 13, 2026 at 06:04:13PM +0200, Mathieu Dubois-Briand wrote:
> On Wed May 13, 2026 at 10:03 AM CEST, Ernest Van Hoecke via lists.openembedded.org wrote:
> > On Fri, May 01, 2026 at 06:08:59PM +0200, Ernest Van Hoecke wrote:
> >> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >> 
> >> When jsoncpp is built with C++17, 1.9.7 drops several legacy overloads
> >> that C++11 consumers can still link against.
> >> 
> >> Backport the upstream fix to restore compatibility.
> >> 
> >> Fixes errors such as:
> >> |  undefined reference to `Json::Value::operator[](char const*)'
> >> 
> >> Patch can be dropped when we move to 1.9.8.
> >> 
> >
> > Hi all,
> >
> > Any updates on the state of this patch? I believe it's still relevant.
> >
> > Thanks!
> >
> > Kind regards,
> > Ernest
> >  
> 
> Hi Ernest,
> 
> This looks like a patch for meta-openembedded, it should be sent to
> openembedded-devel@lists.openembedded.org.
> 
> https://git.openembedded.org/meta-openembedded/tree/meta-oe/README.md#n19
> 
> Thanks,
> Mathieu
> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

Hi Mathieu,

Of course, thanks for letting me know, I didn't notice my mistake.
I'll send it there shortly.

Kind regards,
Ernest
 

