Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BCDC3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 15:27:07 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.39363.1721921225199486365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 08:27:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SziqC1zi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266ea6a412so7839895e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721921223; x=1722526023; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MXVFxW4cFuoYJdWBZgh0nyDm7zn4+dq30hOiO3Jy0ZA=;
        b=SziqC1zijxKYxeqDwOMqMf30KeBZE6aOmPXL8j1Rh1eHngcmNSyEBdIVnC9l4Zb1Pz
         CYs3ckU2+ITGSIYPRIwZQqRimkTRM9kaIHwbBXCKY1vJBTfljcdx50cpvwSVUvE4Z7e+
         nVpIodZWZ7HvmcxUUfKsQoi/9tvixyEO673Q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721921223; x=1722526023;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXVFxW4cFuoYJdWBZgh0nyDm7zn4+dq30hOiO3Jy0ZA=;
        b=fyr7BsXKZ1818My2Eho4L4MlO2yvX2RD/tmlVUitN8d/TrVgNtiod/9JzOIpA3tNdT
         EwBID8fXjmGvMxsmFczZY/cJYJg50Scu+mrzPV2dRuqbkIJylosCwlaZFlWJU5UOUZaR
         ewZRrcHXw3NjHxFRXQl7hmRqutIB8++kJFhVhvunF+D2COIke4H8pdsIgtZNoZ6z3SrA
         JaOPwCmDHbEDHhwICEBkJqMMQUm4jSkxe6hHmh/K9A+6A73J+sOkOBhC7oLisevl/akN
         W7MQwnRjV5wGTz3X0WQmFSOjT1zQrldz9bJVKDeLOO1WDa724WkDzYu/N4U71jE4Q8Th
         AeyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9pnxHPFyT6XHB/AIEGtjnUnxo0Pr7uK+CB4IvtakUaD7USbXq87Ji1reuKOTh2xRX+JvJ89QH8p77+WWQ7aSL+nQC7nk9e1VPm7cjA3JiEJuhpVYwrpwX
X-Gm-Message-State: AOJu0YwAy75CrxfRr3CxCLajCHfi7hIQ9Qig8VfRgrUdTqYeTQ35X7lJ
	6GudiEovd00xXQdcKZ/FSLowRrbszk6gzad8CwvV3RjHp6I9UFnVjiX6n5v9R/s=
X-Google-Smtp-Source: AGHT+IGrLARHkUGJq9Q2W6bxU89hKvCHrWcDSrPfTkKyT5dvnMwRtvWfnQoMGyRh3CTYLPmJmLivXA==
X-Received: by 2002:adf:ce09:0:b0:368:4b61:7197 with SMTP id ffacd0b85a97d-36b36442d82mr1673313f8f.24.1721921223537;
        Thu, 25 Jul 2024 08:27:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:267:c2d:5abd:7ee6? ([2001:8b0:aba:5f3c:267:c2d:5abd:7ee6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f94111c1sm84061705e9.40.2024.07.25.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 08:27:03 -0700 (PDT)
Message-ID: <297305874abd246270ce7084d22beee7486b3e70.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mrybczynska@syslinbit.com
Cc: rybczynska@gmail.com, openembedded-core@lists.openembedded.org, Marta
 Rybczynska <marta.rybczynska@syslinbit.com>, Samantha Jalabert
 <samantha.jalabert@syslinbit.com>
Date: Thu, 25 Jul 2024 16:27:02 +0100
In-Reply-To: <399979010dfd02323f49cbd25b95f606@syslinbit.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
	 <6cf212c600dc109e86e16cf3cf73adc9864deebf.camel@linuxfoundation.org>
	 <399979010dfd02323f49cbd25b95f606@syslinbit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 15:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202506

On Thu, 2024-07-25 at 16:48 +0200, mrybczynska@syslinbit.com wrote:
> On 25.07.2024 16:29, Richard Purdie wrote:
> > Hi Marta,
> >=20
> >=20
> > With the v3 series applied we did just see this on the autobuilder
> > unfortunately so I'm not sure that problem is addressed:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7004/=
steps/14/logs/stdio
> >=20
>=20
> Hello Richard,
> Thanks, this is unfortunate. Is it possible to have a copy of the=20
> corrupted database somewhere?

I think it is transient as we never clean it up and not all tasks fail.
That seems to imply it is a race of some kind.

Cheers,

Richard

