Return-Path: <clopez@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB541C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 15:32:08 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.web10.17226.1676302317763259350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 07:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=CAvzeJee;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: clopez@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=7uU9roxaFGEWK3zgHSgl9iofeM3cpKOHN9rbUWSIsTw=; b=CAvzeJeeuixh9VvC/gB31d6w48
	HJQNHeQUa47zjsEdyldaaaj24NnPVpyNyFkCsE6oVIF2RaCwUPfDaUZVxAcGT2/wLQV0V5A0zWROk
	NxFv6Xy2s5gB3NY1Z2wYviu7wmBbC6IVS5pOYhvmvX8oK12TVv5Us0bBNMlflopEIKlWRqKcBHvN1
	cqrHKLDgv+UDHdARIMzGgn/SuF15k37bKsQDWys/Fy7NAXV2c9fH493nnfRIxVSHaLVIndPactvVK
	fXgHTtgsCHB5h+Qe5RFnMC0qOTOENYvn6zSWhCuDLY4cFrD1WcHzyYln8qVJse8MgWE8YrY34kcsb
	FgXUHUdg==;
Received: from bl9-126-48.dsl.telepac.pt ([85.242.126.48] helo=[192.168.1.78])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1pRao5-000qBI-PJ; Mon, 13 Feb 2023 16:31:53 +0100
Message-ID: <e2096747-5447-3cb0-c3b4-7f55d2a9b568@igalia.com>
Date: Mon, 13 Feb 2023 16:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [oe-core][PATCHv4] graphene: add a PACKAGECONFIG for arm_neon
Content-Language: en-GB
To: openembedded-core@lists.openembedded.org
References: <20230213120407.1092455-1-f_l_k@t-online.de>
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
Cc: f_l_k@t-online.de
Organization: Igalia S.L.
Mail-Followup-To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de
In-Reply-To: <20230213120407.1092455-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177103


On 13/02/2023 13:04, Markus Volk wrote:
> Not all arm platforms support neon and runtime detection for this feature is
> currently not reliable. Add a PACKAGECONFIG that disables neon support for arm
> but can be manually enabled.
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

Can you please add a comment in the .bb file with a note saying that
Neon support gets disabled by default on ARM-32 platforms because of the
following upstream bug: https://github.com/ebassi/graphene/issues/215

?

That way anyone can known in the future why that was disabled for ARM-32
and check if the upstream issue got fixed in order to enable it back by
default.

There is a related discussion at:
https://github.com/Igalia/meta-webkit/pull/448

