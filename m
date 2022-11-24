Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D58AC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 13:47:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.23976.1669297653432815727
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Nov 2022 05:47:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fg3gPNnv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id q7so1670814wrr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 05:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nadSV7Jy5xvyLFOrYgvGcCaboRQaAHVwueTPj6+0erw=;
        b=fg3gPNnvxUJ9jJ7Hjn9Nc0D0sdcIMQRjevQtEpkIkj8wNmZCpCyxEw6gwbIbGp7VTZ
         KH32nQVZxT6ylTOBs00cy3ko30LjGxbFxbZESUowTnvBw+tRlqSrP6vLR4faAkcDT06N
         OKyCfCJkidHRCyta0vK0lC9slX2JrOKpJW6dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nadSV7Jy5xvyLFOrYgvGcCaboRQaAHVwueTPj6+0erw=;
        b=sjV6LQirQnXvnJsUARUcFNzuj53Tk89A/OF7T1OmpKCEqDyUPFhyz1bpKWsZwlh/LX
         K/FRFJGJIRio75z66HEEs9bzJbGffmE4nDFqvWqNoXjs0uqLqQhem6enfP/vuBr9dkrN
         lnmtar2VuQCasVj1pO6SFVY37vvT8owUrgpc9tU0vflts/KIyA6pDzi8gQSXI05NFl+p
         yu0xqAUA2gQE8UXWUxZwbR/nJxDJ/AAcJtWoI5rHi9RACdYrYh04+BSoi4vj92X37dEH
         kitRcfKcilZFmLKCCUfSdvnpDuyTstgasJ9US0tIj08nskm0NahwxyRZJ3GYopSRKX6K
         7STQ==
X-Gm-Message-State: ANoB5pn7dYmAIHRODi2DXhbVSmtrIdpkkPxfcpITk/FUUJxxmLAHnBNh
	G5WrCwneuGE05k8GRXf/e2xNaA==
X-Google-Smtp-Source: AA0mqf4JbRm/wTOeF2bZaReDavfMkEBbyHSn/w3PX0JRR1wDzM1kGCXsmB5dwJGlHeINGrc5PUnqFA==
X-Received: by 2002:adf:f406:0:b0:235:e6a9:b492 with SMTP id g6-20020adff406000000b00235e6a9b492mr8392451wro.212.1669297651796;
        Thu, 24 Nov 2022 05:47:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4038:3d32:5f00:5957? ([2001:8b0:aba:5f3c:4038:3d32:5f00:5957])
        by smtp.gmail.com with ESMTPSA id k2-20020a5d66c2000000b002362f6fcaf5sm1352939wrw.48.2022.11.24.05.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Nov 2022 05:47:29 -0800 (PST)
Message-ID: <e9cc745903744a94f830e1e897c9cbabb66cd373.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexandre.belloni@bootlin.com, Chen Qi <Qi.Chen@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2022 13:47:27 +0000
In-Reply-To: <Y39zIuEp2//QoOxc@mail.local>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
	 <Y39W7D6ps5v1cCyn@mail.local>
	 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <Y39rTVzD41m41oyP@mail.local>
	 <CO6PR11MB56029B5C9F7EA25EB2CE1F6AED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <Y39zIuEp2//QoOxc@mail.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Nov 2022 13:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173752

On Thu, 2022-11-24 at 14:35 +0100, Alexandre Belloni via
lists.openembedded.org wrote:
> On 24/11/2022 13:10:51+0000, Chen Qi wrote:
> > Hi Alexandre,
> >=20
> > The command line is: oe-selftest --skip-tests distrodata.Distrodata.tes=
t_checkpkg buildoptions.SourceMirroring.test_yocto_source_mirror reproducib=
le -T machine -T toolchain-user -T toolchain-system -j 15
> >=20
> > The '--skip-tests' option is the long format of '-R'.
> >=20
>=20
> Right, sorry about that :) I actually checked we didn't have any -R
> before sending the patch to the AB... I'll discuss that with RP.

The autobuilder is not running "all" tests though, it is running two
groups of tests, -T machine and -T toolchain-user. Adding -a here
doesn't really make sense.

Cheers,

Richard

