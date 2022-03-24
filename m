Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2AAC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 12:15:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.9922.1648124146910338312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 05:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=O1pc/ejH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id d7so6355657wrb.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Mar 2022 05:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Ew3oyYhLg08r6DKVTtueD87M2eYs4kGasQoKsvFd5O8=;
        b=O1pc/ejHkRMNNnrIIfVgjWMttw8urpiQ20KyE+k+hBosjzXl7TIPPi0nuc8hmtD4bM
         tMkje+o9wvZoHYfzwayqBVDuZ+pS2JAOQ2rZ6reHOMWU646xTJHfNxMCx4aPLTQ58kkL
         k2hIIg7aXraR8CH2Qdzv9AHflCOGYiUegxaKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ew3oyYhLg08r6DKVTtueD87M2eYs4kGasQoKsvFd5O8=;
        b=vnKnZIznTr4XMHZLHQIX0vgq1A+qCK/G5bN7Ps2HZ0/l5j1NEFsvxvWR9U3x2LcSjE
         5d8Gvl+2A1BBgf7t7XW8ey6aCtew10TCfTPyBQgf0gnWWOaB9u54zQm+eL6RQTLaqedN
         vtOkNJyIoZTJhBdxg9dr8Uj5BNXY4xPJiXl1k3lleyuPXH2zRls+O1d+kfapSm6k5pT9
         I5otmfJEcHQctTVDhavQ7HFEbZSUmwu/3UfO4twWBvs1HNebW0+DoZAm3o/VYve5YDHq
         ukBQUHLw1n7mTjnrGfbXK6U/AHiKOnZTS/3mzGlfeytNvRHmicG67owq23AKk7mOBp5+
         cOWQ==
X-Gm-Message-State: AOAM5334ZE9bdUFscW2l8FUdfMvMMXJ74Kx4WxCLQZJnYKKgo58BlJ0o
	EdTx7XYA6yOON4Ch4g9uPxnsVw==
X-Google-Smtp-Source: 
 ABdhPJxBfmOuTCVpd0VOXzZ2JqbZcd1BPD/w5vC4HPetL/2jYp1FvgSwhyiiuqRrhhjUDCv5hdkGvA==
X-Received: by 2002:a05:6000:15ce:b0:204:1113:b053 with SMTP id
 y14-20020a05600015ce00b002041113b053mr4356007wry.701.1648124145193;
        Thu, 24 Mar 2022 05:15:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:468a:3ed0:d59:9804?
 ([2001:8b0:aba:5f3c:468a:3ed0:d59:9804])
        by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm2045200wma.2.2022.03.24.05.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 05:15:44 -0700 (PDT)
Message-ID: 
 <b0b7f6149c9396e6d961735369ab18eab2cf1237.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] packagegroup: Properly track the enabling of
 complementary packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alban.bedel@aerq.com, OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Mar 2022 12:15:43 +0000
In-Reply-To: <20220324114114.1665034-1-alban.bedel@aerq.com>
References: <20220324114114.1665034-1-alban.bedel@aerq.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Mar 2022 12:15:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163608

On Thu, 2022-03-24 at 12:41 +0100, Alban Bedel via lists.openembedded.org wrote:
> The set of packages included in a packagegroup depend on the
> PACKAGEGROUP_DISABLE_COMPLEMENTARY variable and, if that variable is
> not set to '1', on DISTRO_FEATURES. As this magic happen in a python
> function it can't be detected by the dependency system. We have to add
> these variables to the PACKAGEVARS list to have them added to the
> do_package vardeps list.
> 
> Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
> ---
>  meta/classes/packagegroup.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
> index 557b1b6382ba..cffdaadbde0e 100644
> --- a/meta/classes/packagegroup.bbclass
> +++ b/meta/classes/packagegroup.bbclass
> @@ -31,9 +31,11 @@ python () {
>          packages = [pkg + suffix for pkg in packages
>                      for suffix in types]
>          d.setVar('PACKAGES', ' '.join(packages))
> +        d.appendVar('PACKAGEVARS', ' DISTRO_FEATURES')
>      for pkg in packages:
>          d.setVar('ALLOW_EMPTY:%s' % pkg, '1')
>  }
> +PACKAGEVARS += 'PACKAGEGROUP_DISABLE_COMPLEMENTARY'
>  

That is a hugely heavy hammer to apply to the problem. We go to quite some
lengths to try and ensure changing DISTRO_FEATURES doesn't cause things to
rebuild unless they need to (e.g. by using contains()).

PACKAGEVARS is also the wrong thing for use here as it is for variables which
have per package versions (like ALLOW_EMPTY). Put another way,
PACKAGEGROUP_DISABLE_COMPLEMENTARY:${PN}-dbg makes no sense.

PACKAGES[vardeps] += "PACKAGEGROUP_DISABLE_COMPLEMENTARY"

would be the correct way to handle the first part of this. For the distro
features piece, something like this:

PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '', '', d)}"

might cause the dependencies to work correctly.

Cheers,

Richard








