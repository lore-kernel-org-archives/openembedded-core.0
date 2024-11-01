Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE8CE6F069
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 15:27:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.40820.1730474838550342621
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 08:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F17F64126D;
	Fri,  1 Nov 2024 15:27:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2JRPDdiqY3G; Fri,  1 Nov 2024 15:27:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D26AB4126A;
	Fri,  1 Nov 2024 15:27:14 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 22AB21640BD; Fri,  1 Nov 2024 11:27:14 -0400 (EDT)
Date: Fri, 1 Nov 2024 11:27:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [oe-core] [PATCH] weston: backport patch to allow neatvnc <
 v0.9.0
Message-ID: <20241101152714.GH20070@denix.org>
References: <20241101141354.44546-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101141354.44546-1-hiagofranco@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 15:27:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206623

On Fri, Nov 01, 2024 at 11:13:54AM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> Currently weston 13.0.3 with neatvnc 0.8.1 does not compile when using
> VNC:
> 
> | Dependency neatvnc found: NO found 0.8.1 but need: '< 0.8.0' ;
> matched: '>= 0.7.0'
> 
> However weston upstream already increased the allowed version to 0.9.0,
> since neatvnc 0.8.0 does not introduce any changes that breaks API used
> by the VNC backend. Therefore, backport this patch.

LGTM. Thanks!


> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
>  ...1-vnc-Allow-neatvnc-in-version-0.8.0.patch | 27 +++++++++++++++++++
>  .../recipes-graphics/wayland/weston_13.0.3.bb |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
> 
> diff --git a/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
> new file mode 100644
> index 000000000000..4ac1c075fdce
> --- /dev/null
> +++ b/meta/recipes-graphics/wayland/weston/0001-vnc-Allow-neatvnc-in-version-0.8.0.patch
> @@ -0,0 +1,27 @@
> +From 534cfa08ea0a0c2646b4aec20b16bf95f6d0aae6 Mon Sep 17 00:00:00 2001
> +From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> +Date: Mon, 3 Jun 2024 13:39:27 +0200
> +Subject: [PATCH] vnc: Allow neatvnc in version 0.8.0
> +
> +Neat VNC 0.8.0 does not introduce any changes that breaks API used
> +by VNC backend, so it is safe to extend compatibility.
> +
> +Upstream-Status: Backport [05e5405651054c580b248c4ab2791ed8d66369e3]
> +Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
> +---
> + libweston/backend-vnc/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/libweston/backend-vnc/meson.build b/libweston/backend-vnc/meson.build
> +index b7b6916..39b15cf 100644
> +--- a/libweston/backend-vnc/meson.build
> ++++ b/libweston/backend-vnc/meson.build
> +@@ -3,7 +3,7 @@ if not get_option('backend-vnc')
> + endif
> + 
> + config_h.set('BUILD_VNC_COMPOSITOR', '1')
> +-dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.8.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
> ++dep_neatvnc = dependency('neatvnc', version: ['>= 0.7.0', '< 0.9.0'], required: false, fallback: ['neatvnc', 'neatvnc_dep'])
> + if not dep_neatvnc.found()
> + 	error('VNC backend requires neatvnc which was not found. Or, you can use \'-Dbackend-vnc=false\'.')
> + endif
> diff --git a/meta/recipes-graphics/wayland/weston_13.0.3.bb b/meta/recipes-graphics/wayland/weston_13.0.3.bb
> index dd5b2e2b2700..471dc52bb361 100644
> --- a/meta/recipes-graphics/wayland/weston_13.0.3.bb
> +++ b/meta/recipes-graphics/wayland/weston_13.0.3.bb
> @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d79ee9e66bb0f95d3386a7acae780b70 \
>  
>  SRC_URI = "https://gitlab.freedesktop.org/wayland/weston/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
>             file://0001-libweston-tools-Include-libgen.h-for-basename-signat.patch \
> +           file://0001-vnc-Allow-neatvnc-in-version-0.8.0.patch \
>             file://weston.png \
>             file://weston.desktop \
>             file://xwayland.weston-start \
> 

