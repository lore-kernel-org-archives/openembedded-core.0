Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8C8C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 07:29:33 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.34696.1738826972517606714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 23:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gfgXUfDB;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so692825e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 23:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738826970; x=1739431770; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qblKWcMQVr/wsHpFjOgDKIry5U8Ak7cHzsiAFre+Amc=;
        b=gfgXUfDBB9IzFGBukUSXeZIykBAYdRh4PlWIUe+1A1q6tVJsULnc1ox1rCYpowlbuC
         scbHV9ZSS+pPBizq320tFvWiDvr7MkT+qmG8PY4TAbrWUtFivzaYlNFqsh9asQJoeJhM
         nywkO3/9I2WPx8greCVYHjhLXuQGGf0xIbJkh1WlaM/kTpxpNXVskav05QiJtqMYtnmg
         HshchB+3/uaZ5gJyA/ZAZNNxDp5DLArU2RYPoaioN3QxHvm5Vu69qJ9N6GnNDA8rG9w2
         OcPc/7MuJsKoEL9mSZDDW8t/QjlhndplzysK0EnW31zJDErM3GSIhQc4k1cXkIgeRsJ6
         +D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826970; x=1739431770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qblKWcMQVr/wsHpFjOgDKIry5U8Ak7cHzsiAFre+Amc=;
        b=DHvwZMw+xUkixtxpSTvWUXwexRcUQu0lwPFNZ8/P3xtVkbQQenP8deouvaJMIHfi4I
         /AobtA2IxFbUFc50m5ooPUYGWHu0AXHmRNB0UM7/ktxsx9Kdlh7gDHZdN+gBfPAVcoop
         8ay5cfdGxl2/aQxR0x8sV73oWuE/zxx9kAJS7GNK58Fp+rYPg+/swnBS2t/S3iLSb4Js
         g7SP3pDfu0gwjKWkFW3+2kCng0N4j4KuulNbFvHF2ZLslQWIM7F2dhFdZxVVgKjYvVrR
         545i6Rc7QSBZaUPayiSBAdeTS/xa7/zC2xYdoPubKNzDsh4BjxDG+YE5ZY5azL48xhIe
         cQFg==
X-Gm-Message-State: AOJu0YyfQcSDic/VsrlZ8Nx7pYrv5CWwDNQ/cmylT91h5NcozIuMPfex
	F2ffYUUmu8SSNJCH277JoLGE09y+nS4uAhTqSaVfTUy57jF5taqptDv5kjBikWk=
X-Gm-Gg: ASbGncvCqzzXPsxYPLqsUEZgvc+l4+s66oHlvJufoPnaXFEH4/oym3/Tg/OyEK/LUDZ
	ITOkz+9PL2NBafN/u9xotdmrbiYuNPx9JetvDZxxlnEFdC+eIBBIqwH90YTpkmR4gAphD5fPl3V
	ee9XSGNG3tVFTAuS0ckwv+RWdhy4NZyGCDEvLt6o247Py1vruNkJ/z+EW3kyqhSNYaM3B7wycqf
	igShrume78qQDd+AQDJkP5plTmeY0N6ELAF/DiV2NJDejjAQZdtXzCOfIVuBHG5LoJBaypiDBQu
	NuRptJNbGUP9oMpop9diaGxTfyskFcKCn2PO3Rbl
X-Google-Smtp-Source: AGHT+IEr6bdSQuqVwLNofgWPsEdrQse0+aH5EprbL189jES3fBdFHaa6Rqvvhb9zidRv9h/MzURMRQ==
X-Received: by 2002:a05:6512:32c7:b0:53f:231e:6f92 with SMTP id 2adb3069b0e04-54405a45714mr2325043e87.34.1738826970296;
        Wed, 05 Feb 2025 23:29:30 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f2f74sm60747e87.189.2025.02.05.23.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:29:28 -0800 (PST)
Date: Thu, 6 Feb 2025 09:29:25 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/3] systemd-boot-native: undelete but
 disable configure and compile tasks
Message-ID: <Z6Rk1eGcE4w-ptrj@nuoska>
References: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
 <80da1f00553f9379ddbcd9af8c46bb5fb156f05f.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80da1f00553f9379ddbcd9af8c46bb5fb156f05f.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 07:29:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210903

Hi,

On Wed, Feb 05, 2025 at 12:58:17PM +0000, Richard Purdie wrote:
> On Tue, 2025-02-04 at 16:17 +0200, Mikko Rapeli via
> lists.openembedded.org wrote:
> > The tasks were deleted and do_patch() was run after do_install()
> > which means that patches applied in SRC_URI were not in the
> > ukify.py binary installed. Mark the tasks as noexec since
> > they don't need to do anything.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 5 ++---
> > �1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> > b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> > index 58db408dcf..5b4b63c294 100644
> > --- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> > +++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
> > @@ -2,13 +2,12 @@ require systemd.inc
> > �
> > �inherit native
> > �
> > -deltask do_configure
> > -deltask do_compile
> > +do_configure[noexec] = "1"
> > +do_compile[noexec] = "1"
> > �
> > �do_install () {
> > ������� install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
> > �}
> > -addtask install after do_unpack
> 
> I'm a little torn on this, we could fix it by changing do_unpack to
> do_patch.
> 
> Using deltask is slightly more efficient in that it completely removes
> a a node on the task graph rather than having it present and running
> all the way up to just short of execution.

Ok, sending this in v4.

Cheers,

-Mikko

