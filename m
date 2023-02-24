Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C4CC61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 12:29:09 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.16379.1677241741424541240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 04:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EjoKBCqV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 887BEFF808;
	Fri, 24 Feb 2023 12:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677241739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OfcQJXjDCmScvDMfr8c7F1LdgaJKAwUyCfTGaHuf+Lk=;
	b=EjoKBCqV8QTREakc0L+4C1yA9nDSA64LWM7kGXX4/PdUJqtxxm3VggVIqM13wPYMzmukY+
	qfx687Tnz4ACdQYGrqjDIaWrD0+ZwuR6nrk1xOTjWD4RdglPfiBpAC+Z8WMHYIvrp8ic7p
	H8aNtbm4jE1SLK1mJBnNsQ9i0bWt3HiP+hXSa/RMIj6Obvvy6iKnb0J5CZCNUzjhWYYid1
	/BnzohXbj7z7E8b0wyyoj8nLn9lBDYAHS7GlpKmxXcGOAKO1SO7iR6G5zOEYnUW2hMc2iM
	Sz9JkneUXpsQSlmcFxEpyG0/tac4gZhIId6TII0cRep8CnTio5SSclxo8e73WA==
Date: Fri, 24 Feb 2023 13:28:57 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/4] mesa: Rename PACKAGECONFIG "opencl" to
 "clover"
Message-ID: <Y/itiY4MKeIn1JNd@mail.local>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230224093850.3393567-3-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224093850.3393567-3-zboszor@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 12:29:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177681

On 24/02/2023 10:38:49+0100, Zoltan Boszormenyi wrote:
> There is another OpenCL frontend called "rusticl" now.
> 
> Signed-off-by: Zolt�n B�sz�rm�nyi <zboszor@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 70f9b6fc17..9ec10c49ca 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -115,9 +115,9 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
>  # "egl" requires "opengl"
>  PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
>  
> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
> +# "clover" requires libclc from meta-clang and spirv-tools from OE-Core
>  OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
> -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
> +PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"

Are we allowed to do that? It will break anyone using "opencl" in there
PACKAGECONFIG

>  
>  PACKAGECONFIG[broadcom] = ""
>  PACKAGECONFIG[etnaviv] = ""
> @@ -196,7 +196,7 @@ DEV_PKG_DEPENDENCY = ""
>  # development package of libgles3.
>  RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
>  
> -RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
> +RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
>  
>  PACKAGES =+ "libegl-mesa libegl-mesa-dev \
>               libosmesa libosmesa-dev \
> @@ -242,7 +242,7 @@ python __anonymous() {
>                ("gles", "libgles1", "libglesv1-cm1"),
>                ("gles", "libgles2", "libglesv2-2"),
>                ("gles", "libgles3",),
> -              ("opencl", "libopencl",)):
> +              ("clover", "libopencl",)):
>          if not p[0] in pkgconfig:
>              continue
>          mlprefix = d.getVar("MLPREFIX")
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177666): https://lists.openembedded.org/g/openembedded-core/message/177666
> Mute This Topic: https://lists.openembedded.org/mt/97202945/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

