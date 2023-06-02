Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE6AC7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 21:10:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.6946.1685740240171241286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 14:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=g2YXIKN2;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30ad8f33f1aso2552965f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685740238; x=1688332238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PfAuk956jKxzUsxrsjnnY4yZmcxLus1+1rkhLIBJ41s=;
        b=g2YXIKN2w/Y+O8v35EJraLfuq92V/YnwuH/NCh/SX9P8C5Vhf+/VsNqNnZNUUXTCQ7
         UC3IFrckpvM4p/y7bDCTECIgty79arc46w5m+rX5waWvrEntXBRVM5x4JMGXR85F7gEW
         qCjdMXe3He0G5ODZ7CvExwrpDvfa4ak+aXaZK0HKOBf2+BhbSO8OotaNigZZjWitKbIE
         GcJfE4FB/f1TkgEcVHuCjjCnzXiKH33q1e26HbPHL8SJIXuOKdAACkNTGJDhJAHyRMvp
         W7koF3Ghr6DoWGTlK2xpx0zSI+Ku2ZWi/TlkqYLQu5Jxb36F1HLhRQOpHknuUPfFciQV
         8+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685740238; x=1688332238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfAuk956jKxzUsxrsjnnY4yZmcxLus1+1rkhLIBJ41s=;
        b=iIko8i6LcXQMMgsa9gFT1tt74n/5CkcvI/8H36a8HSGS66wDMu6hroStwMwVK2Qt1f
         NnLRUUW6wWaXMC/1jPoxiJVKziepEr5Si9ajlpokRSI95wgd2I8mLAjTWYq8u2szVyn8
         dLWfaR3u7pUAqZUftQThwLeWzO9xV4e+3Ghabv2kAaCHKXKF6YphyiN2T+cEZ5xh9WPm
         cPRSowir2WVaf6by5BbZygopDuan+SKdQGjcaOLLZh1naulCx/YcY8/LBxzhvbUljRoP
         b7dWedLfOPlFu+gAbCb2IXXZYcKSXBiooXiYzvO+7iZ8xCGeT7yUhYEmY1anlsOg6t7P
         kd/w==
X-Gm-Message-State: AC+VfDw/TkXlEWxq4WeCQyPbrPAS0BMVbABPOPYdgRL44YovOsoYOLLa
	Fn8ruzSmgypgsl/FMroq9lo=
X-Google-Smtp-Source: ACHHUZ6n+ZQOTXHZZXYPL/YhPov+fMuTiuCTjmTdRyP+k0cT4s0GBbdRK59hKj2puFqYE6vJQWZENA==
X-Received: by 2002:a5d:6182:0:b0:309:3c0c:b2c1 with SMTP id j2-20020a5d6182000000b003093c0cb2c1mr818806wru.23.1685740238333;
        Fri, 02 Jun 2023 14:10:38 -0700 (PDT)
Received: from nbadrian1.lan.ffah.ch ([2a02:169:59a6:0:4a42:edcd:e65c:4e9b])
        by smtp.gmail.com with ESMTPSA id r1-20020a5d52c1000000b0030ae69920c9sm2617371wrv.53.2023.06.02.14.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:10:37 -0700 (PDT)
Message-ID: <820f56354ef339f1b2cc10e379d6c7a3988d889e.camel@gmail.com>
Subject: Re: [OE-core][PATCH v3 1/3] cve-check: add option to add additional
 patched CVEs
From: adrian.freihofer@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Valek, Andrej"
	 <andrej.valek@siemens.com>
Cc: "rybczynska@gmail.com" <rybczynska@gmail.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>, "mikko.rapeli@linaro.org"
	 <mikko.rapeli@linaro.org>, "Marko, Peter" <Peter.Marko@siemens.com>, 
	schitrod@cisco.com
Date: Fri, 02 Jun 2023 23:10:36 +0200
In-Reply-To: <7ec035c989c9655738e01c9dca041594c5aa8678.camel@linuxfoundation.org>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
	 <20230519062420.37015-1-andrej.valek@siemens.com>
	 <CAApg2=QtoHacGg6sXs+dsVZ6jg6VnyuepkSVTWhCNY5YrmMv=g@mail.gmail.com>
	 <ZGsghWIXfholEAdA@nuoska>
	 <19c1472f11e4f1eef2c8dbe52926510830408d4b.camel@siemens.com>
	 <863cf26da9230367daab70ff37b8196dbef7b8a7.camel@siemens.com>
	 <7ec035c989c9655738e01c9dca041594c5aa8678.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 21:10:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182340

Hi

I like the VEX proposal from Sanjay.

- It is a standard that can be supported by many tools and requested by
customers. One use case I see is where a vendor sells a product with an
SBOM. The customer can then match the open vulnerabilities to the
current state of the NIST database using a standard tool based on SBOM.
Aligning the categories to a standard would be helpful for this.
(Yocto's CVE check is great for Yocto, but cannot be used independently
of Yocto.)
- A minimum number of categories is defined. All details can be added
to the REASON variable.

Regards,
Adrian


