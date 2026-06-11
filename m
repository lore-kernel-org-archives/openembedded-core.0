Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35374CD98D2
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 10:21:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42265.1781173257272137010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 03:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ENHDBLgb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-bec49f7e35eso1117347966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 03:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781173256; x=1781778056; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u/Ll4Nfh5HpA04fDFvtrJefDfPXe9acWxM1pnUv3dfQ=;
        b=ENHDBLgb60bjOUT7cY6+p7mt1NStTKiWw9BnTJTHO48QsJnMrJK5kedmeHpDM5c7dV
         i8USloO7Fa6Pa4W0dZYav1JB0yN9kLuEm+SRob+/RJYsr7BhIBhDUjUJ+/xwtWSGU5Ow
         TESf/RJYnxPMPupFTdTl53wJnk22QEoHw6Xvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781173256; x=1781778056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/Ll4Nfh5HpA04fDFvtrJefDfPXe9acWxM1pnUv3dfQ=;
        b=lBvlC9QEWda6dtR41MzU7iunI/2jGk/TdpGX3Zp5WmVTwISbxwyy8JZubOmcwPtTP6
         Rf3ToLIxi4hER84JG//AdRas3KJGO/XC1bGlzdg/mPJvCopGxzgFHkt1zMN8vtsKjyFT
         4Cu9YayR0TgTlymqBHRw1Q7Be1c2/WB7dD5V7opFo36X5lkiV0XR+XMQTO090XvEa6eT
         KQu+miHWITTPwoLRVj5+05RJIXXC2+w9gl1BVvT6eLRvugehxAxLgVGZq5kjqaa0UrkA
         UXCZSxNP06qU6Qf/VublS36B9ZdOYCRIjrXXuTEI0IZQ9n1Idey0Nv+r3taa/Nmk2t99
         tJFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xbrQUcELtcGvEGaVhpMeEDIXexn9dTIuQPRKpV06r1EEZkqUzBOhr9DuldJEQWF83lizcdnn37fAzgTDJWm/VXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxbT4z7pP2nFeTkGfIYBBEycD8CTWEy/r11lXEAZciYWxgxwsCL
	GThSwkUBK0nYn4gy2XxBFMYLxLbjHIX0EIYTEFVE7uQHbCkgkVkJVaRhjZJQUy7ZN/k=
X-Gm-Gg: Acq92OH9gKli2Th05MmMO3iJ3VMP4P0z0WsC89bBVniSX49EumG/xo33mkbofUX6kVb
	YZDZ3CtTQWQ9dP2Gq8EAt2KTKZ6aLPzC/Z4gn84EFKpU+qBSlHtm8cELJBqX3X62wn/0/YIQ66N
	ws1p8hjRh3MdyQ4lHDOSrok5/Y+uJn+VP+d4OBqkSPZDiy/VbWc4hM/C/SM5exCIBrZRc0Xm2hO
	a1o7eE6UWIkWiY+7iP91aNdR9SG3H2QhKvHluhcvEq2/cpdZVtOaFyxvlPTjsVkQ01mt40Hwxd7
	2Y6fE0CATqDHLPg+XN+n9lFUH+7vpiBTpcorug5KfswRx4ccD4Y8PGtqeTTQGn3F+YDvdHqovpa
	QLQ7gIBE929+5z8lCFdcSDGlLjtcqysALVrBbA0UyW1O9Esgnu7txvxqumvYvkHDH4CphVnjTCZ
	iTHZlZI6th12PrveiUEHlzLfPi/b9SO0ADoD5ZlLD3Xvaoxgick6v6xFuEP63vqSgi1MJXsOMNx
	Em+9R3gaMhunN85COvlIU/ONKY=
X-Received: by 2002:a17:907:7606:b0:bfb:bca0:5a04 with SMTP id a640c23a62f3a-bfc874f940amr62244266b.29.1781173255543;
        Thu, 11 Jun 2026 03:20:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e596:3a72:77cb:f054? ([2001:8b0:aba:5f3c:e596:3a72:77cb:f054])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb6785ee3sm45980266b.58.2026.06.11.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:20:55 -0700 (PDT)
Message-ID: <34ad0e7a295bbf8b51017e679febd462ada1e6f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][oe][meta] runqemu: introduce unique instance
 ID
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valekova Spitalova, Zuzana" <zuzana.valekova-spitalova@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	 <alex.kanavin@gmail.com>
Cc: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Date: Thu, 11 Jun 2026 11:20:53 +0100
In-Reply-To: <4121e322999e882600f5470c767b9fd0259c7a8a.camel@siemens.com>
References: <20260607174013.36552-1-zuzana.valekova-spitalova@siemens.com>
		 <87166f2237c2327bfaf7b3d8aefe7ebb11de3246.camel@linuxfoundation.org>
		 <89157e4191c5694f1bd13b821c172b1a691db7e2.camel@siemens.com>
	 <4121e322999e882600f5470c767b9fd0259c7a8a.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 10:21:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238436

On Thu, 2026-06-11 at 09:04 +0000, Valekova Spitalova, Zuzana wrote:
> After some more re-thinking I would say I found a "solution". As it's
> not designed for running multiple devices out of the box and some
> qemuboot modifications are needed anyway (rootfs, MACs,... ), it
> doesn't make any sense to introduce such a variable. I have to modify
> the cfg anyway, so I will do it there.
>=20
> Anyway thanks for the feedback, I appreciate it :).

Thanks for the reply. I suspect you've reached the conclusion which a
few of us suspected but couldn't easily articulate!

Cheers,

Richard

