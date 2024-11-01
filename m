Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC983E6B248
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 11:53:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.35701.1730461990443408777
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 04:53:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NqBhhdUZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a007743e7so2139061e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 04:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730461988; x=1731066788; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACsX9Un3a7JvKSy/RZTfiHbvhLo3dJ7ImtezM45atLk=;
        b=NqBhhdUZ4P6Cb/lsUtzrIbXs9obB+GGl6X3uA9i9V/bIkjCdi4SRe3b6J9TY/N/LRE
         pLh7J6bDVxHuh23Uf3KVkbXNpPjA0PhR0g0WBCfDyLE7tfUPNhLJqNzouyPsO/8t2AIx
         4AGyLaCl78nw6xkI+3tKgdPfJtNB+GoOEC9gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730461988; x=1731066788;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ACsX9Un3a7JvKSy/RZTfiHbvhLo3dJ7ImtezM45atLk=;
        b=dWas6kDytmtjP8p2cWlgzolJmmwNWJXwku+c7DrbzSeHTBsyDdz4St3jvGHyZGV6mO
         pPHTgOL6bEsJ9wiLISipdea9/GN9/gYVk3ZBR3d3j/kfEpUaWsCQ/690KpNz0jv3nVY2
         C3C+MlEJrGux6M9OWbVjFm0DqzvV+3+J0JCIJp4ZgOeVAIwAt2Y+cgpCe9rk4KqhITv6
         PCUXgacKpQP94S1jRDznR80kZDfBhZutnv1K+qSc8VAjvolys5+3PS0OHBMGyaq8pu+8
         5Z2wnNr3BUFMIe0PV12g77u8iWo40iqqtLG/YsO7brstzPjNYw0/5LNRC4KwUBs+zU5u
         zRDg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Q6fDkDzK/8bBEdoFGBBtmn3YTqbIxYJAMMaPJIYANpdUIktW7UNAHq3GUcejHb70yqjgt+/AWEiHVx9Bturxtg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKqxqjBOoEVhd/y11+mWsGOujWnoG2wPXBp+Qt1DdKiHWepOZD
	nqR4hF+rGdADCMKUgPIe342PnB7t+PbVykncUZByo70SbgdYSB5YKwsK2R9L/h4geUd+mTKOvWD
	C0Qk=
X-Google-Smtp-Source: AGHT+IE5XNufj/tKjX9tMT3etPg7fILbLBt2wwZ0m1wViPlDm2DiEgVpfWuQwys5vkSts0+UvfgGvA==
X-Received: by 2002:a05:6512:33c8:b0:53a:7e:bcc6 with SMTP id 2adb3069b0e04-53c79ea3a0emr3487683e87.53.1730461988185;
        Fri, 01 Nov 2024 04:53:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:19be:469e:bfe3:503? ([2001:8b0:aba:5f3c:19be:469e:bfe3:503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7b80sm4915564f8f.10.2024.11.01.04.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 04:53:07 -0700 (PDT)
Message-ID: <8df0c30d89b34b9e0a01dd68450b401b42cd0c1a.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 2/2] glib-2.0: fix glib-2.0 ptest failure when
 upgrading tzdata2024b
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jinfeng.Wang.CN@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 01 Nov 2024 11:53:07 +0000
In-Reply-To: <b039e834-4deb-49b9-80f1-267174c7d942@windriver.com>
References: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
	 <18028F3A690769AE.20159@lists.openembedded.org>
	 <b039e834-4deb-49b9-80f1-267174c7d942@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 11:53:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206616

On Fri, 2024-11-01 at 10:03 +0800, Wang, Jinfeng (CN) via
lists.openembedded.org wrote:
> Please ignore this patch. I will send a V3 later.

Could you perhaps mention why? The v2 did pass in testing so I'm
wondering what the v3 is going to change. I will hold off merging.

Cheers,

Richard

