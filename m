Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C975C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 10:51:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.31653.1744282290063757451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 03:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cZZ1RvcE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-399737f4fa4so301506f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 03:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744282288; x=1744887088; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XmnsBH16fAo+biqtbxxA9/j3GmC0N3xoRekgSwkAxPY=;
        b=cZZ1RvcE08/xKdP9a//yql0q4h7styjH7JWae44KJIwDHiafxVMSJmIIcha3j0yprM
         WQziD23CEuR5Uwp0HyfcLqKZpoihNVYol0B9rCkGLAc+UaDqJcEszB3h4OQGSBi62IQv
         BChxkkrSu1nodHR8jdEU9pBbi7iXmxjkfBqRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744282288; x=1744887088;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XmnsBH16fAo+biqtbxxA9/j3GmC0N3xoRekgSwkAxPY=;
        b=NPbZphUyRwlCuciPhSwSwR2gNXtJw8hTuylkXyF1mSRGDr5zztV3+R9F193o+20/tb
         uGy1kkCFq4PmDejwlVdbuRZaPPUuEYKxi+gAabhSj2CP5Yfq27ZO6p5VDkMowhTYHjZs
         OthkmErq6zyWxYIXZe56q5yUftG8opmr3VdCT5zF97tW7GEjqSncUxmVgKVAOzb3Wh51
         vxvkxtOyndlzM25kXWpLqeBpjXbF6ww4RzvwXIeXorVLhoIWlz/vcsXQ+hGjR1XV3/+L
         xsipiHQqEzAECDenwb/RKfCjUjDcJJhEhupGoJ7txyV/IyO8i9/JCNmiF4vULexuBj/c
         q24g==
X-Gm-Message-State: AOJu0YxFZy57TzQ61nXuwyChZwtr6lsFvvONq1fmHpz3Ps7TYE1XQvQO
	BfpRQF7dFPPNd2mSMJzeL1jVhw4dna+5zFO2iGLeBDXLxDHINYMqlyGA9WtZ8vI=
X-Gm-Gg: ASbGncs/AdPXOatH3RUrmcr0yRer/9xds0NIgWV/Vh5g9p2s+Pw7CXUwyjFTvZZyCzR
	16iyBQAyMnBVPRpJMBKTy2v9sDnn3DRtqToJ7xrLDW7SMZuLn7n4/RcNWKo+ym3muOrKHMiqoFh
	psGENnCbM9JYvgcrcp1gxO0oSju4AMCACZEiC+hs6ExP2GlUoIvGG+QFeUPTxq6JAeJ9a0wsRso
	KSkwjvOUXpNdBDuHBOSyAQikCBxggpEbzaVJ/WG30qbUJ4F3TMjac4Sc4YriOJpMyswsLWcVRYr
	MHbZaCKHHqbSEwOTtcIg16JJy3cl4Sjbtacuah8sezvbdZUcRB1R06KiMX4+MboDhqnU+zzSvOJ
	F0Bdoq3KbZ5f2OVLF7iTXDG2TREFK/A==
X-Google-Smtp-Source: AGHT+IGTbP5KKZS161HRJayNIY4PagHAeiuAgnOcV6GsaFbvsbDvp9v7FZPOM83+MSQaZPZveCN0dw==
X-Received: by 2002:a05:6000:4383:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39d8fda7511mr1810636f8f.53.1744282288231;
        Thu, 10 Apr 2025 03:51:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2066d0fcsm50619985e9.19.2025.04.10.03.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:51:27 -0700 (PDT)
Message-ID: <94d6ad67f316255e5433cc35cdd65c99ae9d58ee.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-update-nvd2-native: add workaround for
 json5 style list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, Mark Hatle	
 <mark.hatle@kernel.crashing.org>, Marta Rybczynska <rybczynska@gmail.com>, 
 Steve Sakoman <steve@sakoman.com>, Ross Burton <ross.burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Apr 2025 11:51:26 +0100
In-Reply-To: <AS1PR10MB56975DE1234794F5DCDC4FC5FDB72@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250407093557.50424-1-peter.marko@siemens.com>
	 <AS1PR10MB5697B414A3E675C3F69476A5FDAA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <e0b73eab-4ae3-4873-92b6-8ecb55836c62@kernel.crashing.org>
	 <AS1PR10MB56975DE1234794F5DCDC4FC5FDB72@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 10:51:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214643

On Thu, 2025-04-10 at 10:43 +0000, Marko, Peter wrote:
> The patch was just merged to master.
> I'll send patches for LTS (kirkstone/scarthgap) in the evening, but
> maybe Steve can just pick them from master quicker as they should
> apply cleanly.
>=20
> As I mention in the patch itself, it's hard to design a stable
> solution if we don't know the reasons for broken jsons.
> For now I'm plugging the holes as they arise (monitored by nightly
> pipeline).
> I'd give it a month or two to see stability of FKIE/NVD1 feeds and
> then we should revisit backports of these to LTS.

FWIW this seems like the best plan to me. Things are very much in flux
and seem likely to change. I'll merge it to walnascar in the meantime.

Cheers,

Richard

