Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E145C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 10:14:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.13389.1746008049211603298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 03:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EoUUNU3y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso48572035e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746008047; x=1746612847; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3bUOV92bzGkh72H9ZyRbaIa7lQSI/7gj0RGSC9NADEk=;
        b=EoUUNU3yc12Guhkuc9ItnAYUQzcVAGSkNedjatq4peRMF6Ke1XIsoeULVHm+v4BDqG
         Hjuw6fDwS0JWC2v2GlTC2zh5nJUEF8gBHj6QfaertSpKuZOSvlPAMtp5rzeKvi/6c0QB
         /8g3i/OG1DehiCOgj/iRXaKzttsSlzqCiGvSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746008047; x=1746612847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3bUOV92bzGkh72H9ZyRbaIa7lQSI/7gj0RGSC9NADEk=;
        b=QqhGspc1KzXg3JPgrYNsSBbCGJnQSfvQFc/wkqaYBdF6QdTaitd+L+PXWCd8fvEHBY
         T6OTQBhC/5iBfoxm/fSbV32ELkiqbLLKGw3d93n1djmu7yhXJG1FV8NrenaYbWuE2Wll
         Qi7v9LxY+5VTQQ0fWIzwVKslar/OgDnshF7PSvv6oFF7T0CYTZIV77JlqOwqIc+3KYLH
         KkUvtKultl84fQJz8Ys2/tRzhOCg5Y5Iir484h9LvzGsUMlQNJLO5yMeKo4sH2x2hIaX
         P8sJYEeAGrTqq6m7usSlyHSI/vfqn+U9VOc19yzk0zQmllklwgS2vQYxfuQ5Zjp0/kXN
         rbig==
X-Forwarded-Encrypted: i=1; AJvYcCWuXjs219cJ94J0smw6zyJThoxh5n3/L3S3Hp4LNEBZedu44Q6hQFKBK/LHVpLRS2he8nalCHuhpDk49g04p5iQnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfhfAkTrB2F1nKaS+ys5nxYT+tfOFkG+meWaT7NwldfaxQFpH3
	3O1GfdRgE3wX/9w1w4cKTjRWZSZaTe1iyw3VfFyVg4aRBH1XRD37J2YlGKqWe84=
X-Gm-Gg: ASbGncuOf+vEJ5G5GEy4U5297uFS5gM6+jX79scS5k1DFLMau1YSnfWUIcnvx6wTQry
	QYhEd15QxCjwaTHfkxcTPmJpGG8myQuBYHa2iwzFVPblPS0hWU43kc+S21S2iZdgktqsPn+pFm8
	vDaTE8AUn2PPVXz7PrPB6SEEADJ1OBpMnRpOxyc/r4IGAKm5HPy3RXADMEFNg7MakwLRLfIKsQD
	JS1DqvDK4xIY4uSeUC4oz95Y7EEY+rr7g+QQ+FUInruchtTnKl4bZsDjyHT2drSbkGVTln15gVn
	vrIrjS6okbwnlRVcMdN8oD2kIciZExOcGFz0JVgT0d5oUe14D5fPKJrLFvQDn2wKw4dzgFwk8m/
	xHSV/zYU0KqZE0Ptx6KB1mK0DR4iwLw==
X-Google-Smtp-Source: AGHT+IF2+/YzpmBieg3ojlE/pg0b68blQHwUSpxezKcatl95zFKWqwhOcgeAfOnHgupnOFufoADdkw==
X-Received: by 2002:a5d:5f4e:0:b0:3a0:8c2c:4445 with SMTP id ffacd0b85a97d-3a08f79e73dmr2319320f8f.20.1746008047046;
        Wed, 30 Apr 2025 03:14:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:da55:d8b8:29ea:771c? ([2001:8b0:aba:5f3c:da55:d8b8:29ea:771c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46454sm16646807f8f.78.2025.04.30.03.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:14:06 -0700 (PDT)
Message-ID: <43b9e07da7d2fe6b8792d58d48f42cedb7ec8b65.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Daniel Turull <daniel.turull@ericsson.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "Peter.Marko@siemens.com" <Peter.Marko@siemens.com>
Date: Wed, 30 Apr 2025 11:14:05 +0100
In-Reply-To: <PR3PR07MB666632E36F8CC1E8EE14AF258A802@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
		 <20250429143904.634082-2-daniel.turull@ericsson.com>
	 <f15f7db2297bcd53287699582e960fb29b919fd8.camel@linuxfoundation.org>
	 <PR3PR07MB666632E36F8CC1E8EE14AF258A802@PR3PR07MB6666.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 10:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215738

On Tue, 2025-04-29 at 15:21 +0000, Daniel Turull wrote:
> Hi,
>=20
> On the original patch I had it as normal SRC_URI, but I changed to
> the variable not to interfere with the fetcher.
> Now I tested and I see that SRC_URI just works fine.=20
> I'll send a new patch with the change.
>=20
> After the comment from Peter, I decided to skip the git fetcher since
> we need to use the latest version and AUTOREV is not working with
> offline builds.
>=20
> The variable needs to be overridden in case we need to use a mirror.
> Or is it a way to use existing premirrors without the fetcher?

Sounds good thanks.

It is true that we don't want our default install fetching floating
revisions from git repos. I think we can do this by defaulting to a
revision we update periodically and then have the classes/conf files
set AUTOREV as/where needed so users opt into it.

I'd much rather do that and use the fetcher than trying to reinvent
AUTOREV, mirroring and other things. We can improve the fetcher if
needed too.

Cheers,

Richard


