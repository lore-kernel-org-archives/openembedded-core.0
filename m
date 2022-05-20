Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E34EC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 22:00:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.3363.1653084041073529290
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 15:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IyUKIkg3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id u27so12323493wru.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Mia300GwxKx+myiFVzZXmWbLpl9JPa1EoIJPwJFRwM8=;
        b=IyUKIkg38v/vr7aG+OhO78k89bibvYxw7G9LSHPsPlsx/dDzYiOnk2OqPk9EWV5uNk
         U65KyEABHf09mEZanfMbY4rpqGaiEoSljioaDg8cR6n5e4MaoymH1B+rUybPqMOOhhHA
         oSd1x0CzBFFCvVPfbDcvKyRc7Y30dY0+tE6Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Mia300GwxKx+myiFVzZXmWbLpl9JPa1EoIJPwJFRwM8=;
        b=nut29Ogv4aj8qTXbisI2TKnqbANyT+xFwIKUdIV/uSOsIM6sVDU+UimvSYV9qfeRWC
         ybBgaTgCG2jcG7cm/Dp/amNLnGGqwOGzr1LAsl/auw7ZEwISiJX5OM6OYa7G2JZdOIuM
         tq36rOseE507CLKDTcd5AJHt+Bb5EMviFZU+nhgB8LjzUb7S9JEitsIldO5pLuAu9g8T
         P9t3gcicwtuye90egwMy3n/qtVIthzwzkbVTd3S/ppqHWq3GYwIW66Gb2I9KfpQXeZz8
         I83q1spcvzC70PecI1uQ1/+ZyssbPjDRloaoiKX9HUBdoIVFk8ClJvaK2aVCDXbxwyYb
         QvrQ==
X-Gm-Message-State: AOAM533lji6km2t9QCcXrPjqOwKlRx+3jYao82LFGprtGYXFZ+pBliiy
	as6FsWUdqdZBcldgSAeZPuS0iA==
X-Google-Smtp-Source: 
 ABdhPJwTI/CfWwfQUa52WGoKTQnZEz0Gca62EZGkLVoF4Rw0XUC50jWpWp+ztKSUnANNAVyO9sAIhg==
X-Received: by 2002:adf:f7ce:0:b0:20d:c03:56d4 with SMTP id
 a14-20020adff7ce000000b0020d0c0356d4mr9942946wrq.671.1653084039399;
        Fri, 20 May 2022 15:00:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d812:46de:9e00:ca1c?
 ([2001:8b0:aba:5f3c:d812:46de:9e00:ca1c])
        by smtp.gmail.com with ESMTPSA id
 i1-20020adfaac1000000b0020c5253d8dasm3545024wrc.38.2022.05.20.15.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 15:00:38 -0700 (PDT)
Message-ID: 
 <99bd4a84701c5fb1a6772f64c9f0d31e1a8963cc.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] webkitgtk: limit the number of compilation
 threads
From: richard.purdie@linuxfoundation.org
To: thomas.perrot@bootlin.com, Alexander Kanavin <alex.kanavin@gmail.com>,
	Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2022 23:00:37 +0100
In-Reply-To: <ce55c3f2351362441f335689b030bb22efa7cef6.camel@bootlin.com>
References: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
	 <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
	 <CANNYZj-V-+YiX4vOEBrEBmaqN6Qdacwwu8soz47WcCQLcpZHeg@mail.gmail.com>
	 <ce55c3f2351362441f335689b030bb22efa7cef6.camel@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.0-1ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 22:00:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165953

On Fri, 2022-05-20 at 14:35 +0200, Thomas Perrot via
lists.openembedded.org wrote:
> Hi Alexander,
>=20
> On Fri, 2022-05-20 at 14:27 +0200, Alexander Kanavin wrote:
> > The correct way to address this is to restrict the amount of webkit
> > make jobs in site.conf, specific to the build host. Or add RAM.
> >=20
>=20
> I heard you

I do agree with Alex and Jacob here. Whilst this may not work on your
system, the same could be said for other recipes too. If you're going
to run builds on resource constrained systems, you will need to
configure the parallelism options accordingly and setting limits on
webkit isn't unusual. We do set load based limits on paralellism on the
autobuilder for example.

Cheers,

Richard

