Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94744C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 08:04:47 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.46204.1748333085314127309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 01:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=W8SFIMSC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27618685e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748333083; x=1748937883; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v6Wutj9bRmSyVXMvkf1Djlb60+RMeO36w2a9eKJxmXw=;
        b=W8SFIMSC0OJG9eyPsXLSRZPbjL3o5muvA1uQoTRr6J7r/cPMLhSSFJXCc699NgV9Jl
         dOcne3Xd7bC7FPPahfQ37Jsvx4/bPfUJj/fluyKljG8l0CLWmX0/xq1H+9OoTR2NRFHa
         S14OX2v1RDPbi5WQ5PUFbav+HsJBiyI4f2Gr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748333083; x=1748937883;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6Wutj9bRmSyVXMvkf1Djlb60+RMeO36w2a9eKJxmXw=;
        b=I/NYhsFK5hzqhlBkTElx3LIoyt2MOI++tNHLQlpqLUM9pr16P/QwnS8to++Pu6VmEP
         /7OeX3xfLsbjgexkOJi8yFDs/1ZrdDYczzNBlFjUtZ1Jw0DfTq70k0rDiIpjW0wWW5oH
         gTJ6j1qJu58kc3CHLjYVTVImntBqxEpeaYyGKKu/IYrpiF+Teri5vuHPCM1f7prbi43D
         PGpZdAu5frH/yNhFPKcPfLZ2DOsxW95mGoYD77zWi5L+AVxD295jQ4Ycg6ZJCiPVmPCX
         ytZ+ng4t45fTZojCxp7C+3SSANf7frhl1lTxn1z79jFnrMjkW5OVY+rToDdxc8SUurfy
         7FlA==
X-Forwarded-Encrypted: i=1; AJvYcCUfNQWhrJkWYtx9B3Z1CA6jK0IEf7OCRX+jnw493fJiYNh418mwRL1X2hz8vJOgQb8EdE0/WK9h93c9vLqhX5unJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzY7bESwz9Var0c4SuHWLIAIs29or3WIZH6NKh7f5ULqNUnaAG4
	04DqCVdHQWK54t3OuE0LtSpv+0FkAHs4sgZU5LnwqJ5wH3bT96Z62d9T5Ur9IcRYVrk=
X-Gm-Gg: ASbGncvVptBIAr/S4DizlhPQdassmVjq53iNGW5x43j7bjSQip4hAzYZ373FsEJ0FXV
	uSALV2hTDGSibRqcU4q4uOZZf9J5gtGpYNx9BY8TZcHFtXuyQ7iaQa8lHrk5ytp17vFZlfwOL2I
	dvTd5zWBk20c6uq8EKEpOi8FGyhr3hycr53LGYk9VUhwom35vMyx/63VlJ4nJAHb7uERW0sWkEz
	QnbZf8kvcXP3k768FDe1jRIZ1sHrOoDAl1Zm7jKE0qIDyArR6rwxzwskoyinV2QVTom782TnIz0
	HEzY8HJYaJ6tXJTUsL3507WRqL5G0FE0T5B9Vi6m/GleERHey6RfZ5m01tYqvuTw6j6qVPghRKV
	EnAe5wokRNA+JCm8vkkxL1rJHhPVMz5k81MFVgCTw
X-Google-Smtp-Source: AGHT+IFzVl4whWXMpK5/W3fHBu0kfO+09kz5T0pFgPoWdfyEf8xQnKei9UjrzyzUN210nFftcy6pVg==
X-Received: by 2002:a05:600c:4618:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-44d5bb9360fmr53321025e9.29.1748333083460;
        Tue, 27 May 2025 01:04:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6923:f643:8186:933b? ([2001:8b0:aba:5f3c:6923:f643:8186:933b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d67795eesm6237113f8f.86.2025.05.27.01.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:04:42 -0700 (PDT)
Message-ID: <be0202a16d696f29ac3c583ad764813a98e96b68.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal Limon <anibal@limonsoftware.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Date: Tue, 27 May 2025 09:04:41 +0100
In-Reply-To: <CAOU5ZMtUY=pP_U+nhdyNDkKS-cGctG1ymEAXqQ6iMe4bFdEBCw@mail.gmail.com>
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
	 <20240323195304.2909926-2-anibal@limonsoftware.com>
	 <20240325101809ec807440@mail.local>
	 <17C008DA5E69D9E5.27941@lists.openembedded.org>
	 <183C6D415DE5406F.22941@lists.openembedded.org>
	 <CAOU5ZMu4ysbugdvOJ4Q1YqVK4nD8frX_wAeo-mSJXRCG3tTQFA@mail.gmail.com>
	 <fa7b5f9f72d23b279f8d933a7ccf4d40c629e381.camel@linuxfoundation.org>
	 <CAOU5ZMtUY=pP_U+nhdyNDkKS-cGctG1ymEAXqQ6iMe4bFdEBCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 08:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217286

Hi Anibal,

On Mon, 2025-05-26 at 10:30 -0600, Anibal Limon wrote:
> Yeah, I=C2=A0understand, let me know any further breakage I can fix.

I have patches for oe-core and meta-yocto to fix the issues there.
meta-virtualization fails, I believe you have fixes for that. meta-arm
and meta-intel also showed issues:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1599

https://autobuilder.yoctoproject.org/valkyrie/#/builders/41/builds/1561
https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/1574

I think the missing pieces to get this merged are:

* A note for the migration guide explaining what changed and how to fix
it

* A tweak to wic to warn about "-" characters in the plugin name. This
might be able to translate "-" to "_" with a warning to allow some kind
of slightly easier migration? At the very least we should give users a
better error with a hint about how to fix it.

Cheers,

Richard

