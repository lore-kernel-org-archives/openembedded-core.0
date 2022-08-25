Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46E5C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:55:28 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.22595.1661424926744947981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hPz4Q/Gv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so2456566wme.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=EqIFEvLqXpq4ZDMJdWXQ5vUgQUb1Uki2G7IFG46ePdI=;
        b=hPz4Q/GvfA75x9f8yuoarvwnen7mrXBoBcpzC22/Hz7FcxWSwTfDgG34stGel4/2HO
         SXM0ghVbycit0YlPFZkY44WA6eIJxtKJpFTxc/hsf5JksGyVfvrzJJ7hzOR1PL636FGp
         OLLySgWG8sLPOA8OmzbmkMRiDIPGg9VTO9Dqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=EqIFEvLqXpq4ZDMJdWXQ5vUgQUb1Uki2G7IFG46ePdI=;
        b=BvJB6ymJf7sUTNzgxoA4zHFT/2vF4Fo4+FdEua+fT4A+F4zLiZRT72WCIH/Z2ulmBe
         vhlIg6IPw0Zbu94uEilcTVWzPYgVAZfoeCgEwnwJeoQfjL7p25b0OXbL6gogHyyOVKHb
         uYQGwAkLUUJ8sV6tm++x2MmrupOgKXUNx4hEufS59ifDe1eptYCFDXnwYD0LiBHOGw5V
         zuglHUIlLHfwIEyVwV9ehPaT2IxeDEqNNJR9ae0ET9i28E7D9u7jbMB1ztMp8pLinXsl
         CCMYviNWoeeg6H4XB/oYfF1zlbnbVR7wC14HKW0y1OCmUmxYSAijTEzQM0m34qz6p/X+
         0AkQ==
X-Gm-Message-State: ACgBeo1O3hFC5ONoBa7QBa3G2mqzrEeb6C3bedIVXeUile5phFbUEU8g
	4uQ9VcAQ+Wu3di1LJABbR2rk9Q==
X-Google-Smtp-Source: 
 AA6agR7ay3snPubN60zJPU/SJpyxn60cV+2/tgS929ZwJm7AYbUGteVvuct/6o5VkTWQda1gxOH8Sw==
X-Received: by 2002:a05:600c:206:b0:3a5:41f1:aa23 with SMTP id
 6-20020a05600c020600b003a541f1aa23mr1999982wmi.31.1661424925126;
        Thu, 25 Aug 2022 03:55:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8059:8737:891c:87d?
 ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c1d8700b003a5bd5ea215sm5130173wms.37.2022.08.25.03.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:55:24 -0700 (PDT)
Message-ID: 
 <ae0c3ac5fa833c11ffd8d99d983afefec33a8ab7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2022 11:55:24 +0100
In-Reply-To: 
 <CANNYZj8NSK=Mko4hN24nTWaJ_45wahT6XJByQxCOqq2OgwNvMw@mail.gmail.com>
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
	 <CANNYZj8NSK=Mko4hN24nTWaJ_45wahT6XJByQxCOqq2OgwNvMw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:55:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169849

On Thu, 2022-08-25 at 12:53 +0200, Alexander Kanavin wrote:
> What would be much preferred is an explicit switch to disable atomics
> on the platforms where we know they don't work.

There is a list of such platforms in no_atomics.rs. This patch means we
don't have to add the switch for every platform by fixing the detection
code.

Cheers,

Richard





