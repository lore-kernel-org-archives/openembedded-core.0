Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9AAC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 07:56:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38276.1785743806930871691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 00:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VtuhMVux;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1878604f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 00:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785743805; x=1786348605; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fVL+Yy49wTIvLhaQRMvhLpCg+yTA+nQ/xy7+4blPzYs=;
        b=VtuhMVuxgVUz03bnzGcG1s53rpaGeklc6lcsmTOJk5HklyOBYPqChVBte4owaD4ua+
         XakNlIf4uhAPn3lnklLiu4zhLfIVUJEltiCvI2dwRDkI197TIzD6CPJBcqUIKGv6maZP
         QdLX4DhnXQS9bnU3158d+Wj4pahO/nQBllC7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743805; x=1786348605;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVL+Yy49wTIvLhaQRMvhLpCg+yTA+nQ/xy7+4blPzYs=;
        b=SrtXlsy6NOJAnfsQEiMc+eWVisAR43lfY6ugm/YMsNaTxWePOr1/levPYoj8Cyi1s8
         DxdspcJ8E0WgC9cIJYTbagunn7IKUrS7VVAHBmtlGcTTGzmnQ4c9+xT6555lVQ7Uia0K
         qUE6rvwqduQYJHB3YcaWFzldIUEV7XjSUwhziqnk+FH03Tq6AgEX/wOQ/pePsPvS15pO
         EGRoHllu9ZTzHC33PzJijnOf3Z2uS3YKmcbynkgGVPtwUlZye7eg+vSodPmVmPPUjIHP
         kbeo5WduQyVvjgvXXApnRBmU3IbUHc2Hec2YqA5edn9EzzD5FPqfAaA5KID5WyVGE0nP
         Klvw==
X-Forwarded-Encrypted: i=1; AHgh+RoBd5IYBh3l/V4odPJx/ClA+cwzs5T1qqccGdzZP9JdQtJ5E857kyJnTJgci2X3tNH4Kn0pp4B4/G4N86iSM8PNNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzoOho+C9DbjqKCZIPynXrJi5GddWv0SZjIRJSNWbN89UNEuv7t
	IwGH7H3AZC3A5CrULV0NhNC7tdH7ZMzmhIMkP4o9bQldrZUXYhhlmZwbYTmTf/VTuOU=
X-Gm-Gg: AR+sD12XL1HCSx6YUmtdGMP0VaMOFKOHRSq6wuOtV0xBCRFp2SQETjDFJBgCPqd+Bwr
	EkHKK0LbUPSaeUMWHNjW0PMechlYUuO3Zmuu5HOdCDkF+R2huacg50VZbqEg/JcGDcMWDraBn70
	1sun1gYSmQKrAFUmU8s8LmQfGDDfOVSljAuvPo37Dybbaw0nUORJMuryKFIDsV17UeJaVrqNzse
	Uc4nuqyDUEKHDv93PCJN513qNcJcj0c3q4DEqWOmTautF96xl3zFaVySlSN582EYbaf98iRHG/+
	F4R+dVvO33rTflVl+KmJ/TkMBFTXQdFqC7UO3KkJLpz9M5yxdfMLDSNdTMkgE1YlPCAtjujXzKg
	dlMWlEqciH7eM4oPpUDJkGIE8n+0/BnZx350deXpw2tL6K8GYUWtO+Y9gM0OV6f0t2bYpgbeATc
	aOpQJO8RMVvQglgnpGpR+BC95AU2NBxuwbUrSHKbs0MuekIfKiO+AJqFwe6d37aH7lqq+I8YfSK
	uNiw1yDXftnxXDK4VxLH1Cg4Sy74vljp1iB2gRaVLMCRtguBvR5kQ==
X-Received: by 2002:a05:6000:26d3:b0:47f:8fc8:a8b1 with SMTP id ffacd0b85a97d-47fd72d3112mr22047615f8f.14.1785743805054;
        Mon, 03 Aug 2026 00:56:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6b5c:9c24:b513:8797? ([2001:8b0:aba:5f3c:6b5c:9c24:b513:8797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm29427362f8f.34.2026.08.03.00.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:56:44 -0700 (PDT)
Message-ID: <d204c0394793abbf3ee4142ea1976054d1af611e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] audit: Move 4.1.4 from meta-openembedded
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org, 
	antonin.godard@bootlin.com
Date: Mon, 03 Aug 2026 08:56:43 +0100
In-Reply-To: <ade2bf144146d1174890a073a88cb314da65d5fb.1785739505.git.joerg.sommer@navimatix.de>
References: 
	<ade2bf144146d1174890a073a88cb314da65d5fb.1785739505.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 07:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242612

On Mon, 2026-08-03 at 08:45 +0200, J=C3=B6rg Sommer via lists.openembedded.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> With the new established distro feature *audit* in oe-core the tools for
> this should be available too. Therefore, include the recipe from
> 8f3df8b447aa8a27ce15ccdcfa9d3eb253c08dc2 in meta-openembedded.
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

I don't know what the right thing to do here is.

We (as in the review meeting) agreed we should take the other patches
and standardise the controls as doing that adhoc would be a pain for
anyone wanting to use this.

Here, we're using that to argue that it is now an officially supported
features and the recipe should be in core. That wasn't the intent of
the decision to merge the other patches. The next argument would be
that we need tests and should add it to CI too.

I'm torn on all this. I think I'd want a better understanding of who is
using it before we commit to maintaining recipes and potentially extra
testing.

Cheers,

Richrd

