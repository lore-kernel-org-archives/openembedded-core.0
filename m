Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1DBCD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:15:28 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.35470.1725272114827214951
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dT4zQNgn;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5334c4cc17fso5625374e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725272113; x=1725876913; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TubOCxR4GojcamQR/dwFyiXtJUByhLug+pMMb7RcSr0=;
        b=dT4zQNgnAjLj/B1G8v2Jij1UNX7dWhwpIurYRRtSytXZ/GR46t28HYnVYA4stLyKx5
         oBwKpAUPwEC9Ec1RaC8A/pSqB4hk/kxLEpv/Xf+dZ5wZsg4xL/Vl/WooSe/QjwHFRHjm
         KNndC6efpl0Zdnwi9qGp1T6LfoXpLz8PNdZtuzS1K3CimAXP+k1CfSm5BLnGOcttqLrm
         dIoRcX8onM8aM1tJnayqukf1UYPgoM8WSzw6ApvIAxKifN+7JEobSzO1b/lcgPCt9rJo
         IDNHms8bNt0KoK3OsffK9vZmVt2O4Hv80IHkY/vPtPZ7Evh5ZO12RlowSGYtC6lKGMKq
         8PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272113; x=1725876913;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TubOCxR4GojcamQR/dwFyiXtJUByhLug+pMMb7RcSr0=;
        b=eUuaZ8zujSTnlsAYrK17YWWd+p44ySwIs9WGClK9nGRDg7xrj+ab7g+wfGX6w/mVd2
         WOGzbZsUx4X86QUNxatFiOVme3F9+AduGHJZVXUbuwZkvePnEuK1+hejZxJ63pGtr4Gv
         jPNdhV80IAwcRg+tQAClnANdbnKJt2hTt/riHwhqK5lEaUFqlaHvAOzbXSGRpd2ySWe0
         Sc5SPda6QseExUgMyr9PTrsceW3bKOK7DZHvYUcmyZEmOerQFyrlYz8Y2Dhx7GBbX6W/
         S96c5dpA5KQhJI5kGRFZnTUGaD8FzymhSTwELAN7FeJUSSTZQ9NXAVW6oc8DZmiuJyXj
         ducA==
X-Gm-Message-State: AOJu0Yw3Fo6ICw07HrMsr02+vhjZxam3H5BAV3UWtGNIycGW7WBCTOo/
	Jvxh90leSSSreuKiaf3Y1DMiWdz8Saw5t8R5Qp1GHvs1Mv1updoTrhe0j8HCXis=
X-Google-Smtp-Source: AGHT+IFBR8j9qIj14QiIqzVxU92rXVZbQm7iDgS/NHx/A12PYH0vZ73AjJNJ1xQodCidIxuLsEu6Qg==
X-Received: by 2002:a05:6512:3b23:b0:534:375f:97de with SMTP id 2adb3069b0e04-53546bb8494mr7192837e87.58.1725272112299;
        Mon, 02 Sep 2024 03:15:12 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535408277a1sm1536764e87.129.2024.09.02.03.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:15:11 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:15:10 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
Message-ID: <ZtWQLgv_auRqnmPR@nuoska>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-3-mikko.rapeli@linaro.org>
 <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB5PR02MB1021356397EAB4F11F18E3EE0EF922@DB5PR02MB10213.eurprd02.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204071

Hi,

On Mon, Sep 02, 2024 at 10:09:54AM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Mikko Rapeli
> > Sent: den 2 september 2024 11:41
> > To: openembedded-core@lists.openembedded.org
> > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > Subject: [OE-core] [PATCH 2/3] bitbake.conf: add getopt to HOSTTOOLS
> 
> You are adding getent, not getopt.

Thanks, can't even blame autocorrect...

Cheers,

-Mikko

> > Needed by systemd-tools-native
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index d8252c5b82..a8c630e7f8 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -511,7 +511,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
> >  HOSTTOOLS += " \
> >      [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> >      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
> > -    fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> > +    fgrep file find flock g++ gawk getent gcc getconf getopt git grep gunzip gzip \
> 
> Keep the commands sorted.
> 
> >      head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
> >      mktemp mv nm objcopy objdump od patch perl pr printf pwd \
> >      python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
> > --
> > 2.34.1
> 
> //Peter
> 

