Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDA3CCA473
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 14:14:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.28571.1658758446917935192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 07:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IuspdnDi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id n185so6901455wmn.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 07:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=hH2AVWB4eDjdeqwAv/nmae1kNtCNA3fO7RIGSf7FGoE=;
        b=IuspdnDiPbtIMEM+wfNaL/fG31UT1X4Ve8ryUiyDWtaWKNjCazy6kyzByPtQzh8JRw
         +B/0LJhgBvGHRBMBFofjjQNYOfrYMgUn6rnS1bUNvRsxRVQe+LJcY0UDL2nuhcD95zsU
         aubJJ7MhcwImIyv2YnWHjYqbxMgRUzdkuyuqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=hH2AVWB4eDjdeqwAv/nmae1kNtCNA3fO7RIGSf7FGoE=;
        b=3/YmPcty7XwASNfNW1IG+e7FdZWY8i/E63dXDChdCrCch6tg9mIoEwcpBCKifc6fAq
         BYicNL4GXWrMSgZ+ZFH1qmRdayct+KSAr9F0dHyyt7cOR1OtOKxIJIM2FrUgWUyFv29D
         xE3XIk+H4cQRXAkafZS481n0DTCX0Duoi1iT2hmhRHR7fVW0GgSfDeJ+NgC/23rmkNAV
         8lUFJNnJ4CuvED7gDKtBcPAxdwS7lZQQHVje6kR/cJecA5kwoL9NKlDe1pfuTQxIRhhW
         Lp+phQbs2DrTWMPqlsVoxwV7QQ0WF3iEBhU7g/0RcwPEdu/vVyH6rgE1Qld1UoZ+psL4
         GAlQ==
X-Gm-Message-State: AJIora+wBNOCQL6YNl/NI31gDmsyPmc7DnevPSRM8dYwkuSGjlf+TadS
	N134/d84mw+HBF7cefunP8IQWQ==
X-Google-Smtp-Source: 
 AGRyM1tcrsGQGlqKhGR7M/gwL7CGBt62ABqxB/qHGkusbMUhnSMS2ZNhUJEV6yQp6Ri4Os/6Ix6YOA==
X-Received: by 2002:a05:600c:3586:b0:3a3:2c03:1088 with SMTP id
 p6-20020a05600c358600b003a32c031088mr9116938wmq.64.1658758442551;
        Mon, 25 Jul 2022 07:14:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7074:bed7:25c5:279b?
 ([2001:8b0:aba:5f3c:7074:bed7:25c5:279b])
        by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b0021e4edba1e5sm12258856wrp.111.2022.07.25.07.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 07:14:01 -0700 (PDT)
Message-ID: 
 <aeb51c52626a5a32be9f4b05ea1a449e618132ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/selftest/context: set branch name when
 creating temporary git repo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Date: Mon, 25 Jul 2022 15:14:00 +0100
In-Reply-To: <7E39EDD4-F620-4CEB-BB00-E2880B2EBC96@arm.com>
References: <20220722111534.2144462-1-ross.burton@arm.com>
	 <e6176b990acf909a305fe40b4fdd91c196c9a60f.camel@linuxfoundation.org>
	 <7E39EDD4-F620-4CEB-BB00-E2880B2EBC96@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 14:14:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168486

On Mon, 2022-07-25 at 13:59 +0000, Ross Burton wrote:
> On 24 Jul 2022, at 17:20, Richard Purdie <richard.purdie@linuxfoundation.=
org> wrote:
> > Doesn't work I'm afraid:
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1220
>=20
> I checked older git releases but didn=E2=80=99t think that ubuntu 1804 wa=
s so
> old.  Oh well, we=E2=80=99ll just have to shelve this until all supported
> distros have a modern git.

Is it worth a version check to quieten the logs?

Cheers,

Richard

