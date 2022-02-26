Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED7AC433EF
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 08:22:48 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.4263.1645863766873221620
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 00:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h27HhIXu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r10so7720295wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 00:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3cb7BLI0uhk4vEmk/p77dzeEiipJpTBo5vcto+R4/oI=;
        b=h27HhIXuIw86WiOYfThzTq20UlD+B01SJHPr4MA8Wb/TXI2OQSeg74TNszZmKkPrsA
         tqcAXBHBsrbxgGHDv7NsxLR1oUBTC3MNK7ETTTYMTs+wTWw6aI/g9ZO2ImYTEy4u6RMC
         EkkHWDHA3IVu9MdqjQkfAFc0Z7onCrx4gZiTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3cb7BLI0uhk4vEmk/p77dzeEiipJpTBo5vcto+R4/oI=;
        b=4T6HcY6gzBzaTdealu4EQdNPMFvPSVfPMGQv6jOUkoZSTMk4CwyMytAvhaT1YyVQrR
         eID1LibbXwve6kUI+v39f2wG7p21ppI/LbAJczq0BTU2cNA+A/aJGJW/c2BpE7mcAc89
         pTbsGTX9PEyyqgA0tXI3StZ4rgQ959KZNHIZgykiChCxJfpUaJDZfUl1uVgbVd8+pI55
         oc2Br0OtYvjtYqSMhHHOmGTxuGTCkn+T8V0wtfkwPaEEUDayGK14q9dSTq6dQaMK5CMy
         Q253hg6VKWYTqSCqYq/tnzbPTTxLogjBFr0j//X4jFTkNNFZUbNjHr5lCZSQD/HRu3e1
         PYCg==
X-Gm-Message-State: AOAM532Uymlo+I3HpFWP1rHfL44IerOPHX/bVk0S2L8n6d7uUEC9jZZ7
	jSEFJL98/FvqOWHkdydQxTn/NAHiSVvpWGtH
X-Google-Smtp-Source: 
 ABdhPJykAlAywNLAVmKTCbsq+CEqKPsqO/CJtSJPtWtiRVTRCIHGGPgkbxQ1EAhkQkCIjs4hhssdQg==
X-Received: by 2002:a5d:47cb:0:b0:1ef:7360:7939 with SMTP id
 o11-20020a5d47cb000000b001ef73607939mr4498717wrc.573.1645863765394;
        Sat, 26 Feb 2022 00:22:45 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3901:1ac2:e293:e734?
 ([2001:8b0:aba:5f3c:3901:1ac2:e293:e734])
        by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c479300b00380e461a4d2sm10450690wmo.0.2022.02.26.00.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 00:22:44 -0800 (PST)
Message-ID: 
 <95f493218224c4543921f643de6e07a9f2e8ddbd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/2] pip_install_wheel: improved wheel
 filename guess
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Tim Orling
 <ticotimo@gmail.com>,  openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Date: Sat, 26 Feb 2022 08:22:43 +0000
In-Reply-To: 
 <AM9PR09MB4642BA292AF82C2512FB07C0A83F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20220225040329.813595-1-tim.orling@konsulko.com>
	 <20220225040329.813595-2-tim.orling@konsulko.com>
	 <AM9PR09MB4642BA292AF82C2512FB07C0A83F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 08:22:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162424

On Sat, 2022-02-26 at 08:56 +0100, Konrad Weihmann wrote:
> 
> On 25.02.22 05:03, Tim Orling wrote:
> > From: Tim Orling <ticotimo@gmail.com>
> > 
> > Rather than only use PYPI_PACKAGE as a guess, fall back on PN for cases
> > where a recipe does not inherit pypi.
> > 
> > Wheels can only have alphanumeric characters in the 'distribution'
> > name [1]. Any other characters are replaced with an underscore. Provide a
> > function to replace dash with underscore.
> > 
> > [1] https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode
> > 
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > Changes in v2:
> >     address review comments
> > 
> >   meta/classes/pip_install_wheel.bbclass | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> > index 8a848c0ebab..9f9feda6ee0 100644
> > --- a/meta/classes/pip_install_wheel.bbclass
> > +++ b/meta/classes/pip_install_wheel.bbclass
> > @@ -1,6 +1,10 @@
> >   DEPENDS:append = " python3-pip-native"
> >   
> > -PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
> > +def guess_pip_install_package_name(d):
> > +    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
> > +    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')
> 
> In my opinion this needs to be BPN not PN - as if you will build 
> python3-foo-native (for native only recipes) it will result in 
> foo_native-1.2.3-*.whl, that just doesn't exit.

Agreed, fix sent.

> What disappoints me the most is that none of this comes with unit tests 
> - it broke for a bunch of stuff I maintain this morning, making my 
> morning coffee taste bitter :-(

I'd love more tests!

Cheers,

Richard



