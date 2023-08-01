Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A81DEB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 09:38:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.8843.1690882711127566348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 02:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dJ9LWFEq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so60235745e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690882709; x=1691487509;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uMitS+K33jusq4P8WcqB3m2wIeSnpEB20Icg9pKRkwc=;
        b=dJ9LWFEqJ37CRDh4VUn+7WrtA6zOP5FIozF7LVv52B1OvRjihf/tFww1696QHDduQY
         PanDRwFoPkrwyk2POJkyIDSPT9Rsy8iizQLba8wNTZKIC9XYZr2+LKFV6Cx3OawtH6lR
         BQ89n+irt2xESltmC1sJhJC4OS4Gzdp9JhLQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690882709; x=1691487509;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMitS+K33jusq4P8WcqB3m2wIeSnpEB20Icg9pKRkwc=;
        b=H6g5hfAGfAEuIk2mGqp0QY8oIVBJY+paaTHvXx05taNiI19fzJd8gb99mbiVpIJgEo
         3etRxTHDw5xjQR2QSIRyX+NZoSKgfN5P4ssEHBa7wiYhWFG4iVz+V2sFDCpJxHclrrOH
         rwItukHV+q00BDgFn8UEzfiYutDR+PUPohgJc+0eHGfAcrv7bEY/yjeWtZWzEkqp2hXF
         L8oK82kx6Pa+8g1ClAu5RDoe/kAAT/MhYYdwE6mDJbTXSRCRGArK4GEmygybA7AENes9
         XVYH/ektleMifRGP8IY3/9odXTTGc0IonuxCBPsU4gf30ok+UeehLHiBskl497eQCRAY
         ilyA==
X-Gm-Message-State: ABy/qLZ1sME025ugmCVHGKnm8exu9CypUwtg+X6PYJR6BWFYQ3MJcUo1
	p/YmKhPOaPixG4TRb01spZTNgw==
X-Google-Smtp-Source: APBJJlGri8ZRu9uNbv800Cpq/5U+/8C6vztRilkkWn/X11EIgNoKjctw93/ZOUlu009lrJ0gv+DqXQ==
X-Received: by 2002:a05:600c:44a:b0:3fb:e254:b81e with SMTP id s10-20020a05600c044a00b003fbe254b81emr2171122wmb.12.1690882709549;
        Tue, 01 Aug 2023 02:38:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id f18-20020a7bcd12000000b003fe2696ccfcsm2449414wmj.23.2023.08.01.02.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 02:38:29 -0700 (PDT)
Message-ID: <1f72dc4842eaadc8fa49eef29f2f0af4179131c9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] cargo.bbclass: Offer a way to use
 --offline instead of --frozen
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric?= Martinsons <frederic.martinsons@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Date: Tue, 01 Aug 2023 10:38:28 +0100
In-Reply-To: <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
References: <cover.1690795930.git.frederic.martinsons@gmail.com>
	 <7a3e6d5250d6d0cc526dbede582815007a3b3e56.1690795930.git.frederic.martinsons@gmail.com>
	 <205e20dd658f80e5215b6330f387cb4f95c30d4f.camel@linuxfoundation.org>
	 <CA+cAkeoSMuuZoY+u7bAXq=9CAtrjyQew5MwCLMXRo7O9KRH4PQ@mail.gmail.com>
	 <8ee20428cdc9a71f33bed57893ed6683f05e620b.camel@linuxfoundation.org>
	 <CA+cAkepixZXe=6SP8eKwkg7+h3p0CcK+s8s3Uyg0vYmACtH=xA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185222

On Tue, 2023-08-01 at 11:20 +0200, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Ok but this raises other questions then, this recipe is part of
> packagegroup-core-tools-tesapps

Just drop that.

> and is part of a=C2=A0test case So what to do with those ? Suppress them
> too or adapt them with another recipe (zvariant ?)

I think the other test cases supersede this one so that can be dropped
too?

Cheers,

Richard

