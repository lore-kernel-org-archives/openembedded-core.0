Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAD5C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 13:31:18 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11764.1738762272280448258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 05:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PZHJfgGT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436249df846so46685135e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 05:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738762270; x=1739367070; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Es05AcNsufVHDMXJF+ChGsdGfVm3SvaQ7Y16Lcfagdc=;
        b=PZHJfgGTkzfcfyvq2r/Le8c7Ff1t0XnvB8i5NSuE8qAdBwGGsomtiIUBj2ge5+qPp1
         BrDRc/MXf7Si34OoCrxcIdcRKQk0Ua+HTc8f2RVEP1WdAb/XmKnNZUEPk4WfrNKRPn+/
         nBRahLKCLXRQZBCt/wNCX0LFvIL1FoAPjvGSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762270; x=1739367070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Es05AcNsufVHDMXJF+ChGsdGfVm3SvaQ7Y16Lcfagdc=;
        b=w0eUOw2uQkhxufoIQt3hp0kH3Mu35k3qQ0OznBc4qumqfV/st1uZ6uAlaeSjLH0S3t
         g7YSBWVdTzDpnXHgMXG6GjS4yxFFRvi4OXvHT041QbW8LX0H5spqY6sLwlL8TOBB6ZBF
         TMZjBlRgdzql+y6/7MyjoL2amblHkrD1p+/CUILdWTobCqdUNrDRc+zoXOZXUrNYK1XS
         xRwTECGdgjdpbqUMtdnbZGpVKkGatw7LDa5Y7WbPeyn/H9B/8wRmI0bJc1wljEW4/mQs
         UBp6n9zyc/PN/5he+oATDhQECZJuhivTEbm+tXnaY74xCkEU4p4G7rPsgbYloCqg0AOI
         nbWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7JHs7FmwViJ9tzd9l9QrwovKT0Qub0tPr4DNaGCdE/ZKyDBVjSmAhW+n1zKvY/YAlRFLcxomNaZyXU3DwQMkJWw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzgsg9QOwfGp3mDr4yIeS6jqXh1XSJGr8JiOB5UsCu5X1V/acqk
	BFeyVLNOKO6X4OBajF88z+khPUTs9QKsaA/+ewbR9RY5KUbVX6aU2zyN9oMUIMQ=
X-Gm-Gg: ASbGncsQG8DyD3C6fysaUzMWXVX/9FqYHk0E8V9+SwTDe3cpU0y6Ald03Xy7eX/Tt4Z
	v1P1mgsWDiNfxfXRaC3stBL3I6EQvZiRx5f2WzCf3H9ZTDnLp6jhJYoOsr7SZid9Ea+M7RIo0NR
	iaRpbkQ2aYDelRvjhcAbjL4uvJHewhk2EDC+4LhBqZmrpnAJf8vs6myaDXQqOPcU5n/4IaS2i3R
	HbU83OwcAfWM2UQhGvFme+qWyCLSi1H5okRxpPL+3qt4ZZujFzIcm6uFcTmcuqu0EJlcE8pvhxc
	WMrxyvb+JpN1W5c6+xyBp6PzOApIqySnW62MsV0xWDheTcWOxV6wqIQcFMjzrThXvWlgLQnatNO
	3xxVv
X-Google-Smtp-Source: AGHT+IGVB9XXpm1ZaGG47lrdvf68jz/QpZPsrndkJZ/Wvh9pXkNHhm1uzWkNcbNXIS+KkE7lNbQYCA==
X-Received: by 2002:a05:600c:310e:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-4390d43448amr21558135e9.10.1738762270515;
        Wed, 05 Feb 2025 05:31:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:be8c:5293:84c1:352a? ([2001:8b0:aba:5f3c:be8c:5293:84c1:352a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d753sm21296575e9.11.2025.02.05.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:31:09 -0800 (PST)
Message-ID: <c46230cb866a9512e2495e5650ccd0377242e735.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/2] add basic b4 config file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quentin.schulz@cherry.de, Quentin Schulz <foss+yocto@0leil.net>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Feb 2025 13:31:08 +0000
In-Reply-To: <5691d776-ffd7-4dbf-b801-f6b66c022dd6@cherry.de>
References: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
	 <20250203-b4-support-v2-1-848008ad29ea@cherry.de>
	 <5691d776-ffd7-4dbf-b801-f6b66c022dd6@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 13:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210848

On Wed, 2025-02-05 at 14:09 +0100, Quentin Schulz via lists.openembedded.or=
g wrote:
> Hi all,
>=20
> On 2/3/25 4:17 PM, Quentin Schulz wrote:
> > From: Quentin Schulz <quentin.schulz@cherry.de>
> >=20
> > b4[1] is a very nice tool for mail-based contribution. A config[2] file
> > exists to set up a few defaults. We can use it to set the Cc recipients
> > to always add, in our case the mailing list.
> >=20
> > Because we do not have anything to check for now, disable needs-checkin=
g
> > so patches can be sent without running b4 prep --check. The
> > mid-term/long-term plan is to use patchtest locally.
> >=20
> > Because we do not have any auto-to-cc support (and the implicit one
> > using scripts/get_maintainer.pl cannot work for us), also disable
> > needs-auto-to-cc so patches can be sent without running b4 prep
> > --auto-to-cc.
> >=20
> > [1] https://pypi.org/project/b4/
> > [2] https://b4.docs.kernel.org/en/latest/config.html
> >=20
> > Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> > ---
> > =C2=A0 .b4-config | 3 +++
> > =C2=A0 1 file changed, 3 insertions(+)
> >=20
> > diff --git a/.b4-config b/.b4-config
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..8ec5ddd91e1da05f27a53ff=
6f3d7351317461859
> > --- /dev/null
> > +++ b/.b4-config
> > @@ -0,0 +1,3 @@
> > +[b4]
> > +=C2=A0 send-series-cc =3D openembedded-core@lists.openembedded.org
>=20
> Messed up here and should be send-series-to instead according to our=20
> README.md. Same remark applies to all other b4 patches sent to YP/OE.
> I'll leave a few more days for feedback and send a new version to tackle=
=20
> that oversight.

I merged the script and was about to look at the config files (which
need a little more work by tweaking combo-layer) but I'll hold off
given the issue. I think we're ready to merge them...

Cheers,

Richard

