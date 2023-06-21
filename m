Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A18EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 07:52:25 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.5817.1687333943116806650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 00:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Jjq44/0T;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so150253f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 00:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687333941; x=1689925941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zY+Nr1i9r7DiGRB25XDpAqBw+fT+53z1aF/wxN9aWwU=;
        b=Jjq44/0TwzernormqziJqMCva+K08pgQecXgc8qtvoQEMYP4ch0McgxKxMn+eQ5m1O
         s3n3h9PzrVEPV5TgUWPxt62ovSDw50kEbkCkPESfrfP6OmdaaZp9447dZdfuUk3tXYaI
         l3b/Tk6MtueaLpeakIWWd/wHr36TrdCynjbRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687333941; x=1689925941;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zY+Nr1i9r7DiGRB25XDpAqBw+fT+53z1aF/wxN9aWwU=;
        b=WGGi0IT3EznngMOsN6DqzfdB3HfmIJIH1N7ysI+AnM93YXC/7Kj2H/GG9hWb4u6htV
         wmmF3gcclWgVgX0OkEWXHS8jG8o1pB/z9/AtTP3P9uAKf5qJLgcaDTxUlTLG5bjRZ6ts
         PuYA/GT4DwWAY9uHEHESzq3wGG4P59fBkTi8F7VaJtYpqkYs0BGvJkbC7X72nzMgNzXW
         PuD/AfRoo6nKHE3/rg7VJEHjLOl7wZXwBZ7FcFKOryuHG1X6pP/qrFV7GODO6i2M59bV
         Hrq8xLVz1GOwVekZhec7DsQRDOAjzlBO22A3xPNSj8NTLOrY5tLkl0PfWMpeTXGNWEBh
         hd5Q==
X-Gm-Message-State: AC+VfDxwMbTEzIKpE3hPkKtCgho5GImXy4N0+vVMWyKufXYVvAF4xO5f
	0sdyR0lztsHJnZ6pDi4tfUDO/w==
X-Google-Smtp-Source: ACHHUZ7FxlOCbP7g0/JHpDgSrXL0qxxcnGm3MV9oJVkEvglu4rN08NH2KwzOs9d1rIt2r9k/SVB94Q==
X-Received: by 2002:a5d:4fcf:0:b0:30f:bfa0:3eab with SMTP id h15-20020a5d4fcf000000b0030fbfa03eabmr11443006wrw.21.1687333941273;
        Wed, 21 Jun 2023 00:52:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1417:9a5:3a38:428a? ([2001:8b0:aba:5f3c:1417:9a5:3a38:428a])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600011c800b00311339f5b06sm3730206wrx.57.2023.06.21.00.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 00:52:20 -0700 (PDT)
Message-ID: <3285797abb26a88352d0bc4f7b380bb08c888408.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sanjaykumar "kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
	Cisco)" <schitrod@cisco.com>, "adrian.freihofer@gmail.com"
 <adrian.freihofer@gmail.com>, "Valek, Andrej" <andrej.valek@siemens.com>
Cc: "rybczynska@gmail.com" <rybczynska@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	 <mikko.rapeli@linaro.org>, "Marko, Peter" <Peter.Marko@siemens.com>
Date: Wed, 21 Jun 2023 08:52:19 +0100
In-Reply-To: <SJ0PR11MB671721762A8D26389BDA8C61DC4CA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
	 <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
	 <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
	 <7ec035c989c9655738e01c9dca041594c5aa8678.camel@linuxfoundation.org>
	 <820f56354ef339f1b2cc10e379d6c7a3988d889e.camel@gmail.com>
	 <f3be9c663e6a141695cb71215b1f91ec1a3081a4.camel@linuxfoundation.org>
	 <SJ0PR11MB671721762A8D26389BDA8C61DC4CA@SJ0PR11MB6717.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 07:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183171

On Sun, 2023-06-04 at 09:59 +0000, Sanjaykumar kantibhai Chitroda -X
(schitrod - E-INFO CHIPS INC at Cisco) wrote:
> Hi Richard,
>=20
> Thank you for acknowledgement on my proposal.
> Please consider my additional input for VEX standard.
>=20
> There is total four main VEX standard status:
> - Fixed
> - Affected
> - Not Affected
> - Under Investigation
>=20
> Out for 4 standard we can adopt Fixed and Not affected status for CVE fix=
ing.
> As these two statuses will never get changed for specific package and CVE=
.
>=20
> Regarding the CVE status of community and VEX standard, we can map like f=
ollowing:
>=20
> Existing Status 	| VEX adoption
> -------------------------------------------
> Patched	 	| Fixed	 =09
> Ignore	 	| Not Affected
> Not required 	| Not Affected
>=20
> Remaining two statuses Affected and Under investigation would be changed =
with time as following:
> * Under Investigation:
> - When any new CVE is reported against any package then by default it wou=
ld go with "under investigation" status
> - Until we make the final status like fixed/not affected/affected status =
after our final investigation on specific CVE.
> * Affected:
> - Regarding affected status it would be temporary status until we find th=
e actual fix for the CVE.
> - Once we have a fix the CVE then status would be as fixed/not affected w=
hich we can input to our recipe.

Whilst I understand the desire to use VEX, I don't think we should
directly.=C2=A0It serves a very specific purpose and "loses" some
information by only having two states. Tying ourselves too closely to a
limiting standard like that can be problematic.

The v6 from Adrian can be mapped into this if that is what you need. I
think that is a good compromise as it doesn't lose the information
others may need.

Cheers,

Richard

