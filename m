Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79F9C44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 10:59:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9088.1768993159302570619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 02:59:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SYTV2Xkp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so38371845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768993158; x=1769597958; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Q/3YQpl6Og5KSVeu1d9arTMApODsSLQWwSPDYI9lO0=;
        b=SYTV2XkpSAf8U+2fNhwaI1880tCoTUMeOUchOzV9+umHcBp1UuB1tPmNUDqVRJOyIN
         gLVHyx25A8iu1kXC67ieJiyeNWEMw4kcQTpmlYOlS65QiZ1+4GmlsshtA7qDXpV0Rfc4
         EscBzho+DzQZoQdNAcX1ZtiIeUdXsZAr2hJXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768993158; x=1769597958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Q/3YQpl6Og5KSVeu1d9arTMApODsSLQWwSPDYI9lO0=;
        b=chBWWMO8KasUi9Ct7A2oDO1wnsB+OSfiSW2xcSNzmow0daZnGMeO3lg1NRLuGFhItM
         6itQpZPu6paR7/98BmWXjF3xsgUjqu93WkYpLTVbYuzRpuggya/5J6FYLU20zzRVuvK3
         pohm4L+rZO9SQev/8dQsi1lePwvsm7osgePSVVBTE+8DAXExJGBUR87MIItNrIqjSfBj
         AMC+DWCgQCP2A6o22QGkouyw8FrY2zbDbXBOWlM3JtvhPcT09HPkEWzgayx/DfjzM2+Z
         t8xkr8bGtPpkwV7O8l540NXm/xKIorFfjfP2zbJP+jYfz6UiqhWGT8/s/yoxd2gR5iUu
         12Kg==
X-Forwarded-Encrypted: i=1; AJvYcCV+yp/RiYCT8Tghaz5CSXQDkJjfLa9YvvEJnvSqhummiPZSNWfugS5yLvYzbgHj9hMsTUyrctK46v9A7zLSuUQUXA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzo2spbMEbKtvbnLZFhepLupA4ovab7/HVMYvhn+CBAQVPfy2c4
	gPMjGS7LTJ88fyFKvcg6hZt/8Ur0zCgx8tUCG9feLnrVNfsn8b8epYF+yW7I09w/Ypo=
X-Gm-Gg: AZuq6aJ8fGjnkhQrCOB1AEAhQOC2EuHY7GtI1E1DJ8E+cI/r3gjB1LoJTBBLhc3Hx1/
	e5Y9ugCdHe6Wq0CMWaP9SvW1XDXb+MKhhGt4EYA2LwXIIhheX9wnVo9Vq0E+YsU+0OTCChn8b64
	35+vI+AZ5JVJY8dI/HozDfgkAUe7cimDnX5LjIEqtPmyvrevmeA8860KVgMHH4fXBDj6URbUqzE
	QWOBQNG9wbusFvGbCJND0852v56QGIFsuBfo9FngYOOigbiO8FqBGLxqo+Az/t5G5Xb4O84PK8N
	xxRfNIi6cAIz2NwBHwvwT6JIGiyDon3507FTBGnyJVeooi90tujevh8XZI6vbNI3YikN10GBPT9
	JXfZupHAZDoogC1GuolY+5XdxCIjRoz76G+B0zhprwqicMj7U8NfMP5spMdAZYgXPqrrpgJX/bo
	ZxyaRwhwRNX0BaUoLGsXzTCov/8BIcAgt8Vi7et/We8CitE3m7fMSkhM2UyFKiEckQGDcCPiq4H
	uk=
X-Received: by 2002:a05:600c:8b75:b0:477:b734:8c22 with SMTP id 5b1f17b1804b1-4803e79b7famr76959725e9.8.1768993157672;
        Wed, 21 Jan 2026 02:59:17 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b41a:7081:80dc:66f5? ([2001:8b0:aba:5f3c:b41a:7081:80dc:66f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428b954esm360658135e9.7.2026.01.21.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 02:59:17 -0800 (PST)
Message-ID: <c6ab8919113f64c3891f0987246ce4d9a537ac00.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Drop
 oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, "deepesh.varatharajan@windriver.com"
	 <deepesh.varatharajan@windriver.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>, 
 "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
Date: Wed, 21 Jan 2026 10:59:16 +0000
In-Reply-To: <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260121075430.436353-1-Deepesh.Varatharajan@windriver.com>
	 <AS1PR10MB56975E18D333A47C8DA8AC39FD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 10:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229806

On Wed, 2026-01-21 at 09:14 +0000, Peter Marko via lists.openembedded.org w=
rote:
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org=C2=A0<openembedded-
> > core@lists.openembedded.org> On Behalf Of Varatharajan, Deepesh via
> > lists.openembedded.org
> > Sent: Wednesday, January 21, 2026 8:55
> > To: openembedded-core@lists.openembedded.org
> > Cc: Sundeep.Kokkonda@windriver.com; Deepesh.Varatharajan@windriver.com
> > Subject: [OE-core] [PATCH] rust: Drop oeqa-selftest-Increase-timeout-in=
-process-
> > sigpipe-ru.patch
> >=20
> > From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> >=20
> > This patch was originally added to address a rare failure on the PPC
> > target observed in AB. Currently, we are no longer testing the PPC
> > target in OE-Core. Therefore, we can remove this local patch. We have
> > also verified PPC testing locally several times without this patch,
> > and the issue has not reoccurred.
>=20
> Was this tested for 32-bit ppc on a build machine which was under some lo=
ad?
> I wouldn't like to play a remove/re-add game, flaky timing tests have ten=
dency to return.
> It's rather trivial patch which should not be causing any maintenance eff=
ort.
>=20
> Note that this architecture is not being tested on AB, so the commit mess=
age is bit misleading (as it was not observed on Yocto AB).
> Also not being tested in AB is not a good reason to remove something as u=
sers are still using it (as a tier-2 feature).
> Note that we're discussing some form of return of Yocto AB testing for 32=
-bit PPC.

There is a bugzilla ticket number in there:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15625

and that shows that it did happen on the yocto project autobuilder when
testing 32 bit PPC. The autobuilder would have been under load and this
happened in 2024 with this fix around a year ago.

I think Deepesh is right, we should see if upstream would be willing to
increase the timeout. Carrying patches like this with no hope of ever
removing them is something we have a natural pressure to try and avoid
it at all possible.

Cheers,

Richard


