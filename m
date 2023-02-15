Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B797C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 10:33:46 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.12110.1676457220679341630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 02:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PupuIIps;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 05C9E10000F;
	Wed, 15 Feb 2023 10:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676457218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZebMYoQ6U+WAV5FeGqEz0bhHr8edkXr0ULyVvobCJQ=;
	b=PupuIIps2ONw6Z6SOmO0dZs01mYrL4bd/7frf3w8iR0n5tGta5BEwQaFJVemwHl+Za/zzD
	9mZgkQ3IaPkX03Q0J84nQNkPnF75RQ09N11PXqsHTJFRxD84mrydE5aeeXw0rOTblbqGyf
	fof35npcHLsjaBdU+90uOJg3ZmSkuika6FEfLllVVJJMzhY+V0wisoIciEVcQtpioexpGZ
	9ou60t5SPJbhtb82GdRkxH2ykVYfySDj7FsNUrhVnnLTkOyqdlkmv9nsqfGmVFHu1D1aLx
	qwfyvYTVUexT2njXs+voiklC0m0ps6NI1KYHvXIpUzGesHXaz0Pcq0YcVJLwMA==
Date: Wed, 15 Feb 2023 11:33:37 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Saul Wold <Saul.Wold@windriver.com>
Cc: openembedded-core@lists.openembedded.org, JPEWhacker@gmail.com
Subject: Re: [OE-core] [PATCH v2 1/1] create-spdx-2.2: Add support for custom
 Annotations
Message-ID: <Y+y1AZZqDIkVf4yd@mail.local>
References: <20230214172156.3799436-1-saul.wold@windriver.com>
 <20230214172156.3799436-2-saul.wold@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214172156.3799436-2-saul.wold@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 10:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177183

V1 got merged, can you rebase ? :)

On 14/02/2023 09:21:56-0800, Saul Wold wrote:
> This change adds a new variable to track which recipe variables
> are added as SPDX Annotations.
> 
> Usage: add SPDX_CUSTOM_ANNOTATION_VARS = <some recipe variable>
> 
> The recipe spdx json will contain an annotation stanza that looks
> something like this:
> 
>      "annotations": [
>         {
>           "annotationDate": "2023-02-13T19:44:20Z",
>           "annotationType": "OTHER",
>           "annotator": "Tool: oe-spdx-creator - 1.0",
>           "comment": "CUSTOM_VARIABLE=some value or string"
>         },
> 
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index f0513af083b..bdc2e2c91e7 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -30,6 +30,8 @@ SPDX_PRETTY ??= "0"
>  
>  SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
>  
> +SPDX_CUSTOM_ANNOTATION_VARS ??= ""
> +
>  SPDX_ORG ??= "OpenEmbedded ()"
>  SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
>  SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
> @@ -402,7 +404,6 @@ def collect_dep_sources(d, dep_recipes):
>  
>      return sources
>  
> -
>  python do_create_spdx() {
>      from datetime import datetime, timezone
>      import oe.sbom
> @@ -479,6 +480,11 @@ python do_create_spdx() {
>      if description:
>          recipe.description = description
>  
> +    if d.getVar("SPDX_CUSTOM_ANNOTATION_VARS"):
> +        for var in d.getVar("SPDX_CUSTOM_ANNOTATION_VARS").split():
> +            if d.getVar(var):
> +                recipe.annotations.append(create_annotation(d, var + "=" + d.getVar(var)))
> +
>      # Some CVEs may be patched during the build process without incrementing the version number,
>      # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
>      # save the CVEs fixed by patches to source information field in the SPDX.
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177167): https://lists.openembedded.org/g/openembedded-core/message/177167
> Mute This Topic: https://lists.openembedded.org/mt/96964900/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

