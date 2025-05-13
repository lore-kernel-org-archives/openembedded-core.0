Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5703DC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:58:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.75786.1747141103593620050
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 05:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KjSFRJGw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-441c99459e9so37750125e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747141102; x=1747745902; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzPmsOOrkMYHRWb1eGZrsG4L7LtK3rpg6Wrw0DhuGDM=;
        b=KjSFRJGw5wU/P9lNEFis7mOk8CYenHFc1ViCuAQ686i9S1svB9us53G+zn6veDQTQx
         XonG3aphjMr7faVYO+/5Ud4gXF1Fidj2IY+58sVZcNsk8tndRL6B9ZIcqvol5g5yWBp9
         R/WAesKS9QS7BDPzK2ynDTWtgPcF6OKwBtGAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141102; x=1747745902;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VzPmsOOrkMYHRWb1eGZrsG4L7LtK3rpg6Wrw0DhuGDM=;
        b=Y85uGAX2BfQUSSTnG4BjgpeQtYW8KUvGIKHYHUqyViYcYeKrF/LeFGnBpn6kIi0yjj
         i5gaSz7P4B+0GbXi6ZzyzYg6p5HLuF++luWjs2Wys0P94+7HlGxwocS+0Ire+LK+8oCB
         arEwC5ZSB66V+wiA1OrWEwGLxfwCC0Ds+3J8J7WAanRVtC1UxZEcBS2e77UaWzLJab7q
         H4vhJcsgrbkqiF1kLKAbKxU+FOfBcHgeuITbzpwuJy+xjQ/SjJB4OSgq4SfAwa1KbZaM
         f4XkA2cH9TV8o0gkPDMGTjpdJ0USxl+h9u3ZNSeuej9cjBCM7+PJ5TZDTTgKEf6dVekb
         QHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV9FTCKoQv1fJOSmLWcIjUAzrwL07QE0XMcWiwlGDCl9stHOtXkjbSRP+uA71fWxeNl30l81Ul7Z6YiCo97RUHmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzdfOXVhjjxuBuadx97rTEUGgtkBlFLKs6KRI2BJVKJGRxRYF4k
	wCrP9f+7anltf/9YY451SaUk0E4xaH31Fy9/i9WYJx+iGRl/YGiGqTxxuA9rsCA=
X-Gm-Gg: ASbGncuFEUa935NEERHvH89X6YbAxukJN8z4WEdgzKcE3S3djTQq5EAPWYHGA3T95sq
	JrrMLOYUnGI7PhwXgnz8OKCa9JIj01eKRqRkLm+c/jP5E6S2HlJni4MmKZXrnJ09i6Bst1HWqI/
	JZyFBNRLd1D28N8Pov+aIdMhZjV1I/+srR36IZulnuNb4W0s5RboFescAcPsGd8sTTdKYb3Ub0G
	Mr3F4MMqI9BJotGbOyujQq9pVS2NAhfUOseFjLtZJYDBIBKxp+guR0rIcudwZ++VvOdUTUn/+za
	tnxra3ECqyNzNwmMc/ibQqDf/q7sHntZzlMsn1QUA5SienmgkxOXWxgKkFJoAW5C+8f585FD2/a
	WXE2sM0I2C9OxjesEAVJf/5wQz6muVX13AYu3+ERn21GBMMUD
X-Google-Smtp-Source: AGHT+IHb9wkTp1Frh3hvyyPLc3uLQFKPdsRcVRelfKzOtOg3+z+5bxt27e7qg5C8ehKUtibqEH/Cbg==
X-Received: by 2002:a5d:588b:0:b0:3a2:ffbe:52e3 with SMTP id ffacd0b85a97d-3a2ffbe52f2mr3255780f8f.21.1747141101863;
        Tue, 13 May 2025 05:58:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd? ([2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4bc06sm16026388f8f.87.2025.05.13.05.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:58:21 -0700 (PDT)
Message-ID: <9b721061ca405b5e9d9ed38bfca2b607f91dacc9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] libsoup-2.4: Drop recipe as obsolete
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Marko, Peter" <Peter.Marko@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 May 2025 13:58:20 +0100
In-Reply-To: <AS1PR10MB56977601A8481656CFBBD09BFD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250513124706.1312750-1-richard.purdie@linuxfoundation.org>
	 <20250513124706.1312750-2-richard.purdie@linuxfoundation.org>
	 <AS1PR10MB56977601A8481656CFBBD09BFD96A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216424

On Tue, 2025-05-13 at 12:55 +0000, Marko, Peter wrote:
> I see 15 users in meta-oe, so I guess it needs to be moved there for
> now.

Quite likely, yes. We've just realised core is now clear of this and we
can move the deprecation process forward and make this a bit
clearer/cleaner. It might be worth seeing if any of those other users
can switch to soup3 too.

Cheers,

Richard

