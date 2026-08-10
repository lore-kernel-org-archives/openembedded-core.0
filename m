Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8E7C5B567
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 20:24:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39429.1786393477024201729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 13:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LZeE6s3L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f84023916so2030749f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 13:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786393475; x=1786998275; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JjYRf+bk7CW4xV2xpTrSyQZhuz18/8PdB//l9u4akMw=;
        b=LZeE6s3L8Z0tQa2mzXnNXcl8yFG1hDyMGKGjvROdtJxkco77R8cbxe6J/mJhGiJTzO
         KEPIBuP61jUBp6S18yWCoD8T5+4vSqy1NO3g51kOcOCNdnHUO5hIA1SkcCtEc77ldrPa
         a8YYUwRE9Ozp8wmRSLFVNU9F1U4xgTms95lRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786393475; x=1786998275;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JjYRf+bk7CW4xV2xpTrSyQZhuz18/8PdB//l9u4akMw=;
        b=omH9XDTj1zhxX0WFZ2CQ6cEuiQJkS/drZWw+k8za3GZnnsmMi+vi6S6l2FKeNhjgzS
         MNC7wwxugLu9EP9T0aSJWvgUglGjmb0uVXFM67ISnGBVlQxODTRa/wSAeWbj/8H402Ol
         tULZLv7Rr/DsWdo4NAZEVEOw6sgzRBEKbJIG99meaz3UKcD8jDOTjQLwvGERkkeEdQsa
         rcKDuUbBdMmIECU0s4dUO36f4pWTKYS8q1G/dkF0961hL1471nVIrniqGvDldB/o5ynh
         OtuL9bppy9FVnbL70BykJsKD0jLHXVZUmy2fizdLOLd2/D/ZbMzzgURC06ul4yr8Q8hY
         Bpqg==
X-Forwarded-Encrypted: i=1; AHgh+Rqtfy3VTUr1NH8qoYTcyz4mkH9+wqvSJs356UTigSIxhSuEJOg/g/Sn05/tIgVcltDh5R43aLV4qJH93HQjxG/KsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3pGKnbNUYAUJ4HCY7U54W8uNb3Bsdzhuoc5ieuP4bGB768sm7
	M1na2tSQDF3swWkRsJuXzp0rS20hiY2B7zZpjLcRtrZm9tCjFYD+LRDx4m6y9XxKs6IcmccW9Ka
	Xk/Bp9tE=
X-Gm-Gg: AR+sD11RhFscWmCjIaiqyN21Eavq/OtUY1m7HqaWW99g6MhIXfR02SjzvUocAFVWC7D
	qndrFeUl2VomIging0cpVQupuhrFtq6ZP9+N1qMqCI51RnnF7/SYh3W8JiK/ixUu6KhRqhc8v/C
	e9MKoeyllLmOu5hEASYZGCOI2hUPSVNRMSTOTpTD2ieSslCS/1UmQ79TF1wNyPK+9JkfsnE7dhj
	JPxvnKrSvfklr/1W+OK7AgofMMfTpGw+1tnVWny4CIBfssbD3cLXzPxJJ34L1zQ5VPwnxBQMRi2
	leYKLO3GJ6YGEGYaSjte/aiQVoR3nn8Ydq0Q7zuD2j8Nh9lCHdbRX/39+UCGUK3bgjI6D4JRxip
	RzO/335Qa14W+J+El8RFnjBziVGLq5DzMBLAvZEmKFSGMlyciG1Jr7GtA0CYutMM8ZlYl30h6cH
	3aXrjcvJB3kuxDqcQpg5MEDMMaie7OX2PNqmIMX88kVMtXUGaFZr1HIaBySNSb5X069lI1JWQ2p
	Yi6W1wZ4VN74sMohbS5JV64m5cfTyemf2LSh8UpaSCxSWbapK+6X4oXg5c=
X-Received: by 2002:a05:6000:2c0d:b0:47f:6f9e:1e82 with SMTP id ffacd0b85a97d-47fec4f11cbmr69344712f8f.9.1786393475031;
        Mon, 10 Aug 2026 13:24:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eeae:76a1:bebb:c786? ([2001:8b0:aba:5f3c:eeae:76a1:bebb:c786])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220ab04sm34408251f8f.37.2026.08.10.13.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:24:34 -0700 (PDT)
Message-ID: <771f5608ec2ae8629df1586583b17ef295a7efb0.camel@linuxfoundation.org>
Subject: Re: [OE-core] Patchtest results for [PATCH 1/2] boost: Use
 python3-native executable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rob.woolley@windriver.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2026 21:24:33 +0100
In-Reply-To: <DM8PR11MB5655753E6248ACA20E89EB95E1DE2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20260810-fix-boost-v1-1-4e838b3d43b4@windriver.com>
	 <0101019fecc87cde-ae7af74b-20a3-4087-a07c-1e32c67bc8e0-000000@us-west-2.amazonses.com>
	 <DM8PR11MB5655753E6248ACA20E89EB95E1DE2@DM8PR11MB5655.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 20:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243147

On Mon, 2026-08-10 at 18:16 +0000, Rob Woolley via lists.openembedded.org w=
rote:
>=20
> The original line is already 236 characters wide, so a larger change
> would be necessary to get it under 200.
>=20
> Is there a preferred way to deal with this?

Don't worry about this one. It is more a warning than a must fix IMO...

Cheers,

Richard

