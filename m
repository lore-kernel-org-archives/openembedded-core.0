Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896ADC636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 21:35:40 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web11.28492.1676324129642696380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 13:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=DCBwSV0P;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0HZeU2f+1p1Aa2YCWJ7hHBZEShm2UnD+FITQBFUlZ0M=; b=DCBwSV0PwCArPiWcdunf+BzZmZ
	OcsllZVjBHgvRYWnDXcJ+IWZOXbZWVyxuLpDNjdKEwZj9xcOOkWUGqMwKCeWc6BpVxLA5M2fF3ALt
	vUSZSq9srR75ApI0Yw8WR8vRDKyVaPzZ93QWcsep8wg2nPEeednxx8htQxCQq8oFgUxXFmESkkgCx
	RC1PEd5BskQTtUihiotqMjnrOFqVOAQwFAydRmSy2yWPxn5ykf/lmvncsjJQzR/o0Wztxgq2fk0bG
	ONlWH369TsB3ecWVQY5wyzT99sBuFn+qK9IkeTcb3mrbbRkfYMRz2zZtU2wFjTTe0leGTEXRtun0+
	HFfIYJzg==;
Received: from bl9-126-48.dsl.telepac.pt ([85.242.126.48] helo=[192.168.1.78])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1pRgTu-0015x3-0y; Mon, 13 Feb 2023 22:35:26 +0100
Message-ID: <3eda5762-842f-62a8-d4c3-ee0b3d4ef32e@igalia.com>
Date: Mon, 13 Feb 2023 22:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [oe-core][PATCHv5] graphene: add a PACKAGECONFIG for arm_neon
Content-Language: en-GB
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
References: <20230213180351.2695806-1-f_l_k@t-online.de>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Organization: Igalia S.L.
Mail-Followup-To: Markus Volk <f_l_k@t-online.de>,
 openembedded-core@lists.openembedded.org
In-Reply-To: <20230213180351.2695806-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 21:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177115

On 13/02/2023 19:03, Markus Volk wrote:
> Not all arm platforms support neon and runtime detection for this feature is
> currently not reliable.
> Disable neon support by default on ARM-32 platforms because of the
> following upstream bug: https://github.com/ebassi/graphene/issues/215
> 
> Enable neon for aarch64 by default
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-graphics/graphene/graphene_1.10.8.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> index 813ff74adf..199c460feb 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -10,8 +10,10 @@ inherit gnomebase gobject-introspection gtk-doc
>  SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
>  
>  # gtk4 & mutter 41.0 requires graphene build with introspection
> -PACKAGECONFIG ?= "introspection"
> +PACKAGECONFIG ?= "introspection ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"
> +
>  PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
> +PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
>  
>  GTKDOC_MESON_OPTION = "gtk_doc"
>  
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177106): https://lists.openembedded.org/g/openembedded-core/message/177106
> Mute This Topic: https://lists.openembedded.org/mt/96941870/2167112
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [clopez@igalia.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

I think the comment with the link to the upstream bug and the reason for
disabling Neon support should be on the .bb file itself (and not only
the git log).

