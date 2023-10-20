Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89583CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 07:59:36 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.49686.1697788766815952314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 00:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jXarxCKA;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c518a1d83fso8471401fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697788765; x=1698393565; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LRr4uuYp+oeRdUcuo418suSNy/Dp0z21Dd1C0CIVbFE=;
        b=jXarxCKA48NGeAYDptPRmBkFRPaxpFPvJIXxkp42QyjWQ/4qVq1tFIYh0Ir5rNuH3H
         P09vZNx6ouBvt+chzD+ZO/gowhfH0fpz67fD0e/Do0JFNSKhAZfeNjg5cRMu69QpU7pA
         /wn1C8IdyAFbgwMkD498oZ5UTnAeSX938CSi4dLe/5hgX+B+eMfrA8YPgwHx4IA4D+8P
         QNVrTEdSsYnlB+MsuEmM4xQio1H1qKQjcyZW4thEj2LVB247YhxOC+lQQGdMyW2N75eW
         wDpLM/BwNWofRBXv0jKIwQ7L/h8y+8/OI7qPkEYchzxI5P1QR2gX5uyCtbmyl0XnIfOr
         d8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697788765; x=1698393565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRr4uuYp+oeRdUcuo418suSNy/Dp0z21Dd1C0CIVbFE=;
        b=SIe2TW9XtNCsjLJYDYX6JBFVNWOvFWGqxW7oix6/OK7N+S9cP10DaDbiXbgt++P5MX
         hYTiThawNtqMJTNf27HAc28/khmy6XyHSYfmXC2Li6sbonZiOwSlN6pfgdbkGadwBBxq
         6Bei8pVkGCB43FPgp0H5y/qmK/nAMgpWW93P3ERhElMPekDCxptTN/CGtry8QcsmAF+9
         7Ma7ujxD+afnIRAYhB/JO1IS63nwdPzYSxcAEBxmy11fwVLeelwEATsUKchdMnDYCugF
         qZk10Yw5RKzl3Dm3QiLUfe323TFecwlIcaZjmbzURslDr+GhztB23niAfb4jkWGYVyjG
         pC2g==
X-Gm-Message-State: AOJu0YwV6J66yx9xQTbnD496OtBQwyQPRWt3zaAWyi87zbhN9fNw/15E
	VmdTQ3roXiuE40kX5gZJ7Fsvdg==
X-Google-Smtp-Source: AGHT+IE1pI4jAtSFb+BwBsfXATncfJf3fqir8E4fTHWjTlfp7KGcP6Qb5VPgkHQ5c+yHZarZoAS1TA==
X-Received: by 2002:a2e:869a:0:b0:2c5:582:fd8d with SMTP id l26-20020a2e869a000000b002c50582fd8dmr804328lji.30.1697788764848;
        Fri, 20 Oct 2023 00:59:24 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id i19-20020a2ea233000000b002b6cd89a3fcsm252926ljm.118.2023.10.20.00.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:59:24 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:59:22 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] cve-check.bbclass: support embedded SW
 components with different version number
Message-ID: <ZTIzWltUnl_Zm8Hg@nuoska>
References: <20231016070106.2772303-1-mikko.rapeli@linaro.org>
 <CAApg2=SGxxCJ1yuXoMD6=ySRsL-Z2=rENw6xxn-dpQZ-Ta+4rA@mail.gmail.com>
 <ZTDzOs9PFGJUmIRG@nuoska>
 <CANPvuRn1q0a63ZWyYer8LP0htmo7cBwyX6LTv_=ipZFcJq3j9Q@mail.gmail.com>
 <178F819D833CF586.20272@lists.openembedded.org>
 <ZTElA8Z1bwg4uRwm@nuoska>
 <CANPvuRk8DGf9Labu0bD+2=vPZcb_E3StzBZ9TcS_TusiXM7ZBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANPvuRk8DGf9Labu0bD+2=vPZcb_E3StzBZ9TcS_TusiXM7ZBA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 07:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189504

On Fri, Oct 20, 2023 at 08:56:43AM +0100, Jose Quaresma wrote:
> Mikko Rapeli <mikko.rapeli@linaro.org> escreveu no dia quinta, 19/10/2023
> �(s) 13:45:
> 
> > Hi,
> >
> > Could something like this work?
> >
> > --- a/meta/lib/oe/cve_check.py
> > +++ b/meta/lib/oe/cve_check.py
> > @@ -140,15 +140,14 @@ def get_patched_cves(d):
> >      return patched_cves
> >
> >
> > -def get_cpe_ids(cve_product, version):
> > +def get_cpe_ids(cve_product, cve_version):
> >      """
> >      Get list of CPE identifiers for the given product and version
> >      """
> >
> > -    version = version.split("+git")[0]
> > -
> >      cpe_ids = []
> >      for product in cve_product.split():
> > +        version = (d.getVar("CVE_VERSION_%s" % product) or
> > cve_version).split("+git")[0]
> >
> 
> Looks like your patch fixes the remaining issue
> but don't know if it will be better to get the CVE_VERSION_ after
> splitting  the vendor from the product

This is now in v2. For the CVE_VERSION_%s, it uses what ever product was defined
in CVE_PRODUCT space separated list so it is used before vendor and product split.

Cheers,

-Mikko

