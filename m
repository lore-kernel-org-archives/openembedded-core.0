Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C161C54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:14:50 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.975.1785564884406838251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hOC07h2A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4954f5e8020so1852035e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785564883; x=1786169683; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1CBdMNYRsIujZ2yzeYA7dbqlYfHmTtcU7YApfO+erx8=;
        b=hOC07h2A1+ECGHysrW9sJ5jxiX1ZyMCtGI7wCX7L+bQMGBhF02lu46mgNCFdacEzmN
         i76X+QyKPFA7soxwWIpweyWwp/e/nbJufRZuOMd/teFLsBiWU+STGSxijxJGAQBCbZrm
         kkk/Hu/XfLD9g+WfDgM6tidbAHcN1d61451E8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785564883; x=1786169683;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CBdMNYRsIujZ2yzeYA7dbqlYfHmTtcU7YApfO+erx8=;
        b=pcbBZ7w6yqNmgqvI0LT6NxBdCuAaASbA0te72zl6kttfW/+fJu2M4wRFV3b7nnTNj9
         pxS3jVpAqpzxN/ko4h6p5EtmCO5YdZYGSiNVJpZnen/aKQuD8L7EbaCk4i86sQqloeau
         l29r1uijItTTheNf+IxAs+McK203iGXZsFp130yrZ4aVxDhJ8Rnl2kFB8JnI7j4Hcb4k
         XbAf6nT4EqybiTjTK6xC/wwjzNsW5GMgzLH4kpA4eveEGJb/dbVse8+UjRWuJUiFvy5z
         8AlpJ3ZS2Hvjv/qzMBAD3R6gV0e0RQQi5m77dzBH6XOEaj/xgWQIFP9foEEYB7RQapI1
         km6A==
X-Gm-Message-State: AOJu0YyAPloDLAcA2c1qwnq18UTZgUNRX7TLLVLMOVofJv+ZRICbKOa4
	6Z0yznDDHLsGdl+oGsm8+yBahQ/cAKFuTaaA9qg8ROOM3+kmupeZRIowaekPSbCNyAo=
X-Gm-Gg: AR+sD11CSp45E1n8UduORQ84VgWg3VhvotdiNRmeQSMZYZXxY4XuG6DhfKLyh880c3Y
	NHhpoCTM3xZDsDZaKseRZasxzjGDg69NrXDRN5pK/w/9NI1NSiaStt+lNgUS7PvWn8W4vxtF9SS
	dxZ5sEMDTQcwjTmrnn6sapCltM3v3uwYTEThxjCHbYtnw/M60dWeu32vy0Im2kAs2wr91zt4qcE
	rMu0KKicrSQ+UipQuhyJ2dkN84D6RlaTc3KjUaMXcozQDU1AS3cjzXgHvw2zKhzRYs8E16Lkx6i
	MfZS0zgDSSTVvDbsDWg/puOG+yTVnXwiouTuqMUgNBo2hcPbOQI3UwwpS/JTgk9x/t+j3h0pc3I
	dq4xNKzzANv68QHzg9+tlksolUd7D4ppLw2E5tSOoUW0D3FNiIPruY7UXXMkRWUT+CZ7j7KrFN5
	cMIqOu6gJquJnkvzOD+Zf2zGzvH/APeGVLClt90pO3Y5S09tCRd6a9UO7nVfTJRfnlHS/LQpuru
	h2uLzaegY3I0ayNUxTB42Pk6S0EtWgi/Up5PdXQqUcwa+VljXWUL/Q3goAj2JiK
X-Received: by 2002:a05:600d:8492:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-4980c64b873mr12412625e9.5.1785564882565;
        Fri, 31 Jul 2026 23:14:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585? ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2cf1sm12382792f8f.10.2026.07.31.23.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:14:41 -0700 (PDT)
Message-ID: <040de8e5eb3f8b57f00cfa691c8d5889103b7e50.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] python3-websockets: upgrading to 17.0 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 01 Aug 2026 07:14:40 +0100
In-Reply-To: <0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com>
References: 
	<0101019fb18e1918-6e60db78-fa07-43d5-8bb5-0f1a3bf1758a-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242469

On Thu, 2026-07-30 at 05:45 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3-websockets* =
to *17.0* has Succeeded.
>=20
> Next steps:
> =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-python3-websockets-upgr=
ade-16.1.1-17.0.patch
> =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and summarize =
them in the commit message,
> =C2=A0=C2=A0=C2=A0 - compile an image that contains the package
> =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
> =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git commit -s --res=
et-author --amend
> =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
>=20
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>=20
> Regards,
> The Upgrade Helper

This creates ptest failures. I note a new point release in AUH today too.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2047

Cheers,

Richard

