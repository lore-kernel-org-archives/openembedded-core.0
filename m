Return-Path: <bst@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F336C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 16:14:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web11.18768.1676304860329390485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 08:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: bst@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <bst@pengutronix.de>)
	id 1pRbT7-0002IA-JX; Mon, 13 Feb 2023 17:14:17 +0100
Message-ID: <4fedc2d9-6eba-a4ff-b5cb-0496caca9eda@pengutronix.de>
Date: Mon, 13 Feb 2023 17:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [oe-core][PATCHv4] graphene: add a PACKAGECONFIG for arm_neon
Content-Language: en-US
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
References: <20230213120407.1092455-1-f_l_k@t-online.de>
From: Bastian Krause <bst@pengutronix.de>
In-Reply-To: <20230213120407.1092455-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: bst@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 16:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177104


On 2/13/23 13:04, Markus Volk wrote:
> Not all arm platforms support neon and runtime detection for this feature is
> currently not reliable. Add a PACKAGECONFIG that disables neon support for arm
> but can be manually enabled.
> 
> Enable neon for aarch64 by default
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   meta/recipes-graphics/graphene/graphene_1.10.8.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

0e0849cd1 ("graphene: disable neon support on arm 32bits") from meta-oe
needs to be reverted to make this patch work, right?

Regards,
Bastian

> 
> diff --git a/meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> index 813ff74adf..199c460feb 100644
> --- a/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> +++ b/meta/recipes-graphics/graphene/graphene_1.10.8.bb
> @@ -10,8 +10,10 @@ inherit gnomebase gobject-introspection gtk-doc
>   SRC_URI[archive.sha256sum] = "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da31dfde2928f279a"
>   
>   # gtk4 & mutter 41.0 requires graphene build with introspection
> -PACKAGECONFIG ?= "introspection"
> +PACKAGECONFIG ?= "introspection ${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'neon', '', d)}"
> +
>   PACKAGECONFIG[introspection] = "-Dintrospection=enabled,-Dintrospection=disabled,"
> +PACKAGECONFIG[neon] = "-Darm_neon=true,-Darm_neon=false,"
>   
>   GTKDOC_MESON_OPTION = "gtk_doc"

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


