Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D826EC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:52:54 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.13107.1747317167544230499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gWDkFQ8h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so808244f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747317166; x=1747921966; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4nkqywyOPivJw6X4IEZn2BwGuzs5oLXGdnLn1+FVEhQ=;
        b=gWDkFQ8h1qJ78xD3tIMgWonPCS4ZtvBfXfX5HXJQa6Bgjj+l/HPYbSWhujZoCRgMUo
         W6/Twipc0O9AEKJvrHAj6eVYf/BJvQQz/ooAAfkKpc5+rmXJAwEC7yupsGZCNpiepNZI
         QWZPWb7SaqgVapviqeJchy5k61yN4fQQuakyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747317166; x=1747921966;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4nkqywyOPivJw6X4IEZn2BwGuzs5oLXGdnLn1+FVEhQ=;
        b=E7m6NC2n8co/1IEPia1xYKOTW9d4vYFIt0AmnXIOMEew9KUoYUHfcwq/YVdJQIdRTC
         dKA20THk0qOcrHvGEyXs8sALhOhBq8kxXuZxL7lbmGWdF0YDQYxnmsoyP8dLC9YjhSw1
         cGm8jeFAnn75UopzeQhSITHDkegekTJezVcR3w4P3h99oJUCzS2IR3/XL/Bf1XteI9ZI
         c/uj7pBYP9WYk4GoyTJmbOMXZSov1ENXXCualeT8g0E27Sji9pbkw0Y16Ld4CoEZz+kr
         +ExrNWhO8e0pwEaiLRggsLErSn/eLpZqQp4XJCy26fjPyGP8zvn/q5xuB+ggNzpax9Fu
         X2gw==
X-Gm-Message-State: AOJu0YwbJ+88O/tmSZjWLYWlwzF7Tt5SU9GH54FUvXO8eYMSG2SiRXgy
	b9OaehQgg/XfWJAPXh2GjNhvpPbkZ41sOTfox0Tol4AS59lr/KaIRRKnjgzpggQ=
X-Gm-Gg: ASbGncu/0dnNfdZpIcn33IVxj8ADQ+RmF3zNZ+3h+nuFwREPxmzoXZjZ8UxEZ98nfTd
	ODFyYF4k6BcP+KtGyVehmD4+cK4tVAx+bYi3RD+9c+5dXDbvHwqMvvnRSDdiZKx3lV0gHsbkqCq
	+lpClUxod/zrVlkCfJfN1PjN68hPrrNEoSV1GDP+SL7vLSQMmFRYP+CSbAwYujycj2rEktSDMH/
	zz1NVLQySUAglUexXbSinis1uZC2O3HlAK+LECo55pEjauXBLY/bdBdG03zTFbjGldYp6Pr4i9w
	rehZDozo+UoRhSGjQP3rtUF8HHD+XSipUPj2YaSQyT+Gac3olq0j97mK5YvGcuSgp94DQ7wAeRH
	yls8lN8NlPPDRMUpxxxlg194cNwnFcPgaSpgN4w==
X-Google-Smtp-Source: AGHT+IH5jOH4Wtgf0hDugR8QO+jFl80z3KUpxu7nEJtF4SUuh/eeRCYUHt/Kwxnxb3pl5y6yq9HbBA==
X-Received: by 2002:a5d:6d45:0:b0:3a3:5568:b8c6 with SMTP id ffacd0b85a97d-3a35568ba1emr1361637f8f.12.1747317165869;
        Thu, 15 May 2025 06:52:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c21:701d:240:45b5? ([2001:8b0:aba:5f3c:7c21:701d:240:45b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e852fsm74376405e9.27.2025.05.15.06.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:52:45 -0700 (PDT)
Message-ID: <0b275c1e87e1409f56e9218d2bd43055070ed864.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] opensbi: Pass CROSS_COMPILE and
 REPRODUCIBLE flags
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 15 May 2025 14:52:44 +0100
In-Reply-To: <CAMKF1soMUYBET_2SaUEHVf+ThiTf97muhsNaH8J+K-8WF1S4sg@mail.gmail.com>
References: <20250515083422.113413-1-raj.khem@gmail.com>
	 <f5e409fb55000274ac0bcb5f6b56b29102b2135b.camel@linuxfoundation.org>
	 <CAMKF1soMUYBET_2SaUEHVf+ThiTf97muhsNaH8J+K-8WF1S4sg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216681

On Thu, 2025-05-15 at 06:35 -0700, Khem Raj wrote:
> Perhaps you did not use v2 ?=C2=A0

Perhaps I did?

I used the version which is still in master-next and looks like the v2.

Cheers,

Richard

