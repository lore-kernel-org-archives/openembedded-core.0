Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A75C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:03:15 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.21195.1741093391239617211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 05:03:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QCXHtf1j;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: festevam@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1099412e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 05:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741093389; x=1741698189; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rlo7h3SNXQuwS/11PmaJuPjfUG6ZM15BXCm7QuOBB18=;
        b=QCXHtf1j0RHajSB8fp8TSro5zyZrPdMFmB2FO/8hRWeq9EiZ3T/jM/rZLQNHssCSSs
         ZyOSkIWMX0EiYNUtWsJ6FWp26PhGPsjU0KoiLAlGxb6K1oSEJxTVqIzY+tPmBDh3KwzR
         +n7Da5xQCSoF9zB7cFdwhSXDoHrxzXQ0pC8DYXc2clpE0iLO9nR5cFnEEg9fU+l7C9d9
         pGD6diUyBULYSrI3F/LlnerO9q9fqf/iP9sxHZvXFfCwsVRcZKb2JAkW1akPmEgdwyDQ
         B1KClFi0LOFo7kEpdAAuRribGsFxeZ/z1oJAW+/SF0UWlpqGhECJHpnkKM713hn9/+hE
         zQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741093389; x=1741698189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rlo7h3SNXQuwS/11PmaJuPjfUG6ZM15BXCm7QuOBB18=;
        b=oyHzqTRBCZsnumoCXTxKFJN5OwaltqhmiAPx6HZSYAB75K9C5MVSnBUER7V+KfT3Oi
         irZxDSWF7Xph7+2u/qAWMhdMIQqNqjjdpv4EbDxcGLjheFCm/NAttMVAXi1v1Xvp+Ccu
         IhtChV1U7MHZjZm7TAV3g15h8fkAHt2Om3tMRvxWZJOeXF5XSjIfJEw0KZQFlfFTN1hB
         8kAtnaijDLXC8NEkG6xyOF2LbsR7kUSWF3cD6qNCoijhKRLZcTdeUXImY0gZqdQEbvwg
         +Gc4mmP+cIM3nEHTHGRG2WlPQag9nJRm9kNyG3JJk8mcgAJQHzlx3HfvIFrwg18Ezt+Q
         V3aA==
X-Gm-Message-State: AOJu0YwIippxPfqY5W9G0FFF4sfk22CSpTLfS0iUGOOjH/r5QCiOoiSO
	isX7uQx0pMzyIV98nkrW/GlFWo/q9EkIzcuVTy3oRbvR+zV+41kL6EsvVIr89CB5XxWrS5c8jK9
	tBU3Km35ING16TJTz2MzBVb6vF5w=
X-Gm-Gg: ASbGncsw8IZ+O0YA50ZMbNFb5S2UhkXmPQGjM0AVDXlC0TZpOLsbW2mRoGTDHA/yvIv
	aTvD4HqQnRZeXdKYbUCxs3lU6SheFsYBpw6y5F07frjr6bNjYzB5jvzX7qyVFXuBanr3rUxQv0S
	ncL47zprnz00Xo7gcf4L8z9XlSViuqLmZTAotZNphypMP2spo46dci7UdsNg==
X-Google-Smtp-Source: AGHT+IGxdr5A661TnCt6i5KsBTpGG/bzYrAILjDl71lDvjesP0FAntaqhREpQ0zgRibE2lCde+GkUzOOar/tgtlwTuc=
X-Received: by 2002:a05:6512:158a:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-5494c10c924mr5663917e87.10.1741093388884; Tue, 04 Mar 2025
 05:03:08 -0800 (PST)
MIME-Version: 1.0
References: <20250219185119.2168718-1-festevam@gmail.com> <20250219185119.2168718-2-festevam@gmail.com>
 <706DB201-D621-4A78-B3E5-B0F775ED5EC5@arm.com> <BCF1E7C3-2378-4D65-8166-9F9A50069418@arm.com>
In-Reply-To: <BCF1E7C3-2378-4D65-8166-9F9A50069418@arm.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 4 Mar 2025 10:02:57 -0300
X-Gm-Features: AQ5f1Jozc7tQVDxu5hR0his6umw7q7yueJ6Bg0TaaaMIqIh05bzxrxo_Bjnqa-8
Message-ID: <CAOMZO5A3SV9SUYrQScS21hTymvm75Xp2qDX-7hUCZigR=uy+iA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"raj.khem@gmail.com" <raj.khem@gmail.com>, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 13:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212281

Hi Ross,

On Mon, Mar 3, 2025 at 2:22=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> wr=
ote:

> Update: the patch I posted is https://lore.kernel.org/linux-mtd/202502261=
82400.1723418-1-ross.burton@arm.com/ and it=E2=80=99s been getting positive=
 feedback, so hopefully it will be merged soon.

I like your solution too and will submit a v4 shortly.

Thanks!

