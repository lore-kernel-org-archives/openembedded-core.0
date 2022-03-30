Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFE6C433EF
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 11:51:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.6296.1648641089715582741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 04:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U9SmMSEr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id a1so28879236wrh.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 04:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=/dhG4q/1VMotEMkfRJcoAy5MnXakN/NU/1aSsgtz1jE=;
        b=U9SmMSErpEDYZCYq3d2RzQ/bZCrYk0IOltuXKVA80Pw5zJ+KTlC8/rvdpoKzWm2ek+
         tVNVtiKsBLkKJoQ9myZpxa+oJlWbvXeGuGDX8wmlYVE2QZ94MrCJuejEs+NqPNi8jEVy
         nyxLbK4NWVNRAc5mQxAGBz0v5Z7V2+U6Z82vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/dhG4q/1VMotEMkfRJcoAy5MnXakN/NU/1aSsgtz1jE=;
        b=MAVsueWWULIa5RHKCGAyHtUasSefZf4WZLYegLgPKaHThriIJw8IOobSYLyRO9QAUh
         RyaR45Q4RlqwPGdzFesqDQq8UCVHw5aKGkEYiufWTBjWZ7D1/Zo4HLpQ1Q3LHP8zS1st
         FpXr5Hg23d5XH/LieGrYQI1mZnca84PRj1hqacRbJgMNjqP8gKIluTyW65tgGNoYeCOp
         z+CFP0p3tyfHbfk5bMYKzXHCq+FqZWfbJWQ4Qg5Jo5++Qr9epzGJKbEPQshzuCjasIWG
         nVtDWJ3R2ImVuycXeTDAFmaJ5beYoa73UeZ9VNOueb8Jx62F74oEAX04vauf59GtLdth
         KcUA==
X-Gm-Message-State: AOAM5302veoQ3IHMiawY3SNBGmmJRnlXUgpsdfBeWmSgVDQAfATJSNlf
	hqQ4i1xg2EemwsQJ63ij52q0jg==
X-Google-Smtp-Source: 
 ABdhPJzA96ZFFKTqjYOs3lixMCaaKAe6QAFHZajhUsNWS4v/fHJv0pvSl4feYwUACT97dlAyL+6ugQ==
X-Received: by 2002:a05:6000:156e:b0:203:d6e6:c475 with SMTP id
 14-20020a056000156e00b00203d6e6c475mr36378459wrz.326.1648641088003;
        Wed, 30 Mar 2022 04:51:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:367f:29cd:9517:5c4?
 ([2001:8b0:aba:5f3c:367f:29cd:9517:5c4])
        by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0038c949ef0d5sm5073089wmq.8.2022.03.30.04.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 04:51:27 -0700 (PDT)
Message-ID: 
 <d9889a46e5523848d3b770302623bc95e75c37d5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] bitbake.conf: Add base package version
 (BPV) variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 30 Mar 2022 12:51:26 +0100
In-Reply-To: 
 <20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20220330081614.12772-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 11:51:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163784

On Wed, 2022-03-30 at 10:16 +0200, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Add a base package version (BPV) variable and use it as default for the
> package version (PV) variable. The BPV variable contains the base
> package version of the recipe read from the recipe filename.
> 
> The base package version variable supports an expansion of the version
> from the recipe filename without the need of an immediate variable
> expansion:
>     PV = "${BPV}+git${SRCPV}"
> 
> It allows the inclusion of include files inside a recipe file with the
> same version in the recipe and include filename even if the package
> version is different to the base package version in the filename:
>     require linux-yocto-${BPV}.inc
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> ---
> 
>  meta/conf/bitbake.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7705415a4f..d56cf811ba 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -232,7 +232,8 @@ ASSUME_PROVIDED = "\
>  ##################################################################
>  
>  PN = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[0] or 'defaultpkgname'}"
> -PV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> +BPV = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[1] or '1.0'}"
> +PV = "${BPV}"
>  PR = "${@bb.parse.vars_from_file(d.getVar('FILE', False),d)[2] or 'r0'}"
>  PE = ""
>  PF = "${PN}-${EXTENDPE}${PV}-${PR}"

I'm not really seeing a compelling use case for what is a fairly core change,
you've not really said why we need changes and what the big win is for users.

I'm also quite worried that this behaves quite differently to BPN. "base" in the
case of PN means strip off prefixes and suffixes yet here, BPV doesn't actually
strip anything off PV, you're just expected to set it differently yourself as
the user. The different usage semantics will likely confuse people and that
confusion isn't worth it IMO.

Cheers,

Richard




