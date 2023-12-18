Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07179C46CA2
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 17:58:57 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.50083.1702922332144479700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 09:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bsBPcCau;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c39ef63d9so38597325e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702922330; x=1703527130; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tkLidtjjRGa7TDbzqwnPDV7SPVX/axI/WYjIlpoRzUc=;
        b=bsBPcCauu2vTv4qXXGJzGZAEsOKBmnAwxYimDKfiuGqhTZQloXrS1wcLQGEzqDP/Vj
         MPwN3R8VJVc2nonbq6j+/AFXdOlQFzIgopdynxhS478kkYZOpdaCzIPk7xByI+FxbdDn
         8NDNY8V2ZCEA6i3XCEhpkb7yNEJl2JrfHruOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702922330; x=1703527130;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkLidtjjRGa7TDbzqwnPDV7SPVX/axI/WYjIlpoRzUc=;
        b=dbotkhgg8XlO9uHgt/HfqgFL4NWlmH1INVgL9ppPP/YwO10Dn1SewrFA7YelwNit6W
         hceDwLDcMtPoPFwpkvOXRF02aFSB4py+Ep1Eto5gPdhg6BomGRTQxEvbsc7AjTjnoKo+
         Ni+C+Cgy8LrQhNogQ1nYFB2wUXJ3ze5Rbr+OBPiTCCdvBlDa2EexnDCLHnAzS3ECcu4e
         9lJy6jfNWuNCL+XNk3jZ6Wne3FwCyPDvjvEsyYSK0E4tpcpv6CP+DIhnF6oxOD149tsL
         EF9m9NW0/Z3L4m76MrhyFmaQEb4Ds1+KlEtCYOuVWbAG+YnW1Va1OGgbFBBwloMyn44C
         fU3g==
X-Gm-Message-State: AOJu0YwP2u8OTFKrj6ZvA84R57A9BnXsT7ckMWlC2Y7Ja5KTZOfr2kId
	Y6vAUvt03zFobC0+nGhca1g2rA==
X-Google-Smtp-Source: AGHT+IFh6CM6JneKFcMGWyzPig+D14ov+6J/cqxmHWswTQM7ct5yAYbYZ9HViHNU6bK9noY3SuIslA==
X-Received: by 2002:a05:600c:2946:b0:40c:296e:7bfe with SMTP id n6-20020a05600c294600b0040c296e7bfemr8818316wmd.140.1702922330469;
        Mon, 18 Dec 2023 09:58:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a720:6e27:acc4:d591? ([2001:8b0:aba:5f3c:a720:6e27:acc4:d591])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b0040b45282f88sm44966272wmq.36.2023.12.18.09.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 09:58:50 -0800 (PST)
Message-ID: <09096b377fb5ac72d118926a861c9d70265b0f6d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] qemurunner: Impove stdout logging handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 18 Dec 2023 17:58:49 +0000
In-Reply-To: <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
References: <20231218152951.3398964-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1sqkizk++vW++TsyiOBSsHhM7euMNWGs8KHBJq_2yB=dFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 17:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192674

On Mon, 2023-12-18 at 09:45 -0800, Khem Raj wrote:
> I tried the two patches in this series. It did improve the situation
> but I am still getting SSH timeouts. But this time its 13 tests
> earlier it used to be 40+
> btw. my images are using systemd. So it might be good to see if we see
> this with poky-altcfg as well or not.

Do you have the log.do_testimage and the ${WORKDIR}/testimage/ files?

Did you still see rcu stalls in the logs?

Cheers,

Richard

