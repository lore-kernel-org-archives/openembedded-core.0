Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625C0CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 11:28:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.77635.1781004510584901634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 04:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EbOQ63cr;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46015dc517aso4362512f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781004509; x=1781609309; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh0aPP1xQrM8WH/LLXMlPXpFrhTarFaKY8XYxy9ixzc=;
        b=EbOQ63crZmWM+WROH4+7F4tlL/FPkXMWnCGwIvrFQx4acK8ewYZ7syJ8pMobrbuD8E
         /zCBraBuE01mhj4/+Ch5xm2NWoh74swQvx0RuYJ94i5o0h8xm2z+KmpiA4gA5IVcD3xX
         QdzhpyqqTqQV6Vj/iNvODGOILZ3/QJbdY7ArQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781004509; x=1781609309;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nh0aPP1xQrM8WH/LLXMlPXpFrhTarFaKY8XYxy9ixzc=;
        b=gdKACPHImUZNxl3MRfHols+F0yw9qprIsqO4KXXCnYw7chSWj1X5hSN3QTv0msAYiq
         mG8aYL0K7T4Qv5SKf//1Pvs4lJ7DGehMlVshN9+OaPi9+A1KYkj2wIRsdn/WGp0HvqL+
         ch3+QTE0rL0gYE3Hfpey5KYVDXmY5t3246kTmFxb4g9100JX9IxfKNeUtwkVquhnhWd4
         fJDVc8dBoZzyoSPzWZ8ZtGv14ONUqTFbD6MoflxnGUWa1kk/kj9ZEtzkGuVHTwe2slr/
         vI5YESfDEedjSMoSveT28aWj3PPCR9L9io46M0a0blTzQDTfm67yUaAQEXT/280V6R4i
         +ifQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Wo2gYzd4OBejqSl0Q5P7vDiaoxSY39doB9kb7R6IeP04UlELJeWyvQyvCVSpSpsIk1kFARCbBzURxCTvKGHq6wg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx23fCBmPFwXpbK8Q7M9zsvbmkz0/sIAUrtSKtzCDh6viZIz21n
	AJk2VzxyNWoNPjaORwWZw/Lt5sCXF3VV+AU6hHRfQHPH/A1sirNcv7RFPAm9E0ddlw==
X-Gm-Gg: Acq92OGbQINuVEGttblxosVGinwubz13Sjp5MSDW6sig9lXaT1uTYAlzwUN5d3jAQls
	QLEdKlxdG+5DVkIlc+XaeMTTb1OtQrOwjP9TNaDxFiystW96KY3c3HEQ/Z5ivfoc+OFYtx6RyA2
	fZhHECkfdOiZaX1hoiOZhMehr4RtSW6TjbsIEjUaswhbzq801ZPaOtc8tPC82qfeNqhVSsJ5oje
	VjNfioQkhs7/dQCZgq3zHRSyfHwvz9Gff72ordkF8n8hDAoWDNLAkafXnllk7fIiKzdW5f83NGw
	J9OLU/g1iw0OP935a2riA5KqFmLfkIE4YCqL5Xmue7NDid/TUtggBfdlnCmbysia6RKN5bKQtEc
	dmWwAnTmp9nJqin82GqXSOoikmeWrn6kUEwHXs9u5yrUZAFfWyvkL4bIwqXJ/BLHTKf0VgHN4U0
	/vO6KvHhCZzF9ZHB5ttpk9t44g0WS5jsnIZH2t+MGYDyyDsmbV7ksUapqBaDZ9sS6g/OGI3x+d0
	24JewIFUBBO2nW7pxHF
X-Received: by 2002:adf:f88c:0:b0:45a:e3dd:586b with SMTP id ffacd0b85a97d-4603063a9e2mr23385892f8f.18.1781004508835;
        Tue, 09 Jun 2026 04:28:28 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcbe3sm57260507f8f.8.2026.06.09.04.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:28:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 13:28:27 +0200
Message-Id: <DJ4HENS1HI6E.CJ0J0A7TESHU@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>
Subject: Re: [OE-core] [scarthgap] [PATCH] apt: CVE-2011-3374
From: "Jeremy Rosen" <jeremy.rosen@smile.fr>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260601134048.45729-1-adongare@cisco.com>
In-Reply-To: <20260601134048.45729-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 11:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238289

Hello Anil

It seems this CVE is not fixed upstream, so the not-applicable tag must
also be applied to master and wrynose

please submit patches for those two branches and then ping here

thanks a lot
Jeremy

On Mon Jun 1, 2026 at 3:40 PM CEST, Anil Dongare -X (adongare - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Details: https://security-tracker.debian.org/tracker/CVE-2011-3374
>
> The vulnerability is a design-level flaw in the legacy apt-key utility re=
garding
> the global trust model of GPG keys.
>
> This is marked as not-applicable-config because apt-key net-update is
> disabled by default, and Debian vendor configuration does not define the
> archive keyring URI required to use that path. Ignore this CVE in this
> recipe due to this configuration.
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  meta/recipes-devtools/apt/apt_2.6.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtoo=
ls/apt/apt_2.6.1.bb
> index 12915660b0..8b48de3498 100644
> --- a/meta/recipes-devtools/apt/apt_2.6.1.bb
> +++ b/meta/recipes-devtools/apt/apt_2.6.1.bb
> @@ -38,6 +38,9 @@ UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
>  # to express 'divisible by 4 plus 2' in regex (that I know of), let's ha=
rdcode a few.
>  UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(=
3\.8)|(4\.2))(\.\d+)+)\.tar"
> =20
> +# Not applicable: Debian vendor configuration does not enable apt-key ne=
t-update.
> +CVE_STATUS[CVE-2011-3374] =3D "not-applicable-config: apt-key net-update=
 is disabled by default and Debian vendor configuration has no archive keyr=
ing URI"
> +
>  inherit cmake perlnative bash-completion useradd
> =20
>  # User is added to allow apt to drop privs, will runtime warn without


