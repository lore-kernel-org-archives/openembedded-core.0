Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73C4C07E8E
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 18:46:40 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.168708.1692211590587416805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 11:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LbaPguGg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B8AAE0004;
	Wed, 16 Aug 2023 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692211588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/DRbBNVwy2MDAP1q5oTNYsNAL2ePvVs56gda6BPpjE=;
	b=LbaPguGgQRMuFsxZBMDlQ88NkQuilb3E3ANVt2af7o6tE48J+i24aV2mMB0qFYlY2MlaCN
	0cQQes3gVRAW9ZKvKcqS3FrjGnDmrmBCFXidRAHK3WhdjD0Zwx2Lgg1NP5SbmeWytFTlLV
	DxmnP9ro00+4HW5/Y5GKuG5y3kTRaiPgRXThEUeBQlGAFzz9TUNzrxYtunc7PjqjhybQ3i
	CwhR6A7XodNVyvZOhegaeh/Wa+EIRABdhsfq56s8YGyJk3i9JknEmzFh//N+8AWlvSXRXp
	DCshLrvClVnU27W41JWz80JxjUYx2RI5GwfBMhQvjCctTgdMbjLhZ9A1BQlWZw==
Date: Wed, 16 Aug 2023 20:46:26 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH 5/9] meson: add back warning when default value
 for external properties are used
Message-ID: <2023081618462607e5a5c8@mail.local>
References: <20230810162451.1766532-1-ross.burton@arm.com>
 <20230810162451.1766532-5-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810162451.1766532-5-ross.burton@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 18:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186138

Hello,

This causes:

WARNING: glib-2.0-1_2.76.4-r0 do_configure: Meson cross property have_strlcpy used without explicit assignment, defaulting to False

On 10/08/2023 17:24:47+0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> This is adding back a warning that was removed in the upgrade to Meson
> 0.58 (cb2a7dcc) as source evolution meant the patch didn't apply.
> 
> Meson scripts which want to identify runtime behaviour often use
> external properties (meson.get_external_property(), set via the cross
> and native files) to define default behaviour if they can't run code at
> configure time.
> 
> These defaults may or may not be correct, so emit a warning that this is
> happening. The recipe should then provide a cross file fragment which
> sets the value appropriately.
> 
> In the long term I hope to be able to remove this patch as Meson evolves
> cc.run() to support fallback values directly, and Meson will log the use
> of defaults itself.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../meson/meson/default.patch                 | 24 +++++++++++++++++++
>  meta/recipes-devtools/meson/meson_1.1.1.bb    |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 meta/recipes-devtools/meson/meson/default.patch
> 
> diff --git a/meta/recipes-devtools/meson/meson/default.patch b/meta/recipes-devtools/meson/meson/default.patch
> new file mode 100644
> index 00000000000..60adfc8cf4d
> --- /dev/null
> +++ b/meta/recipes-devtools/meson/meson/default.patch
> @@ -0,0 +1,24 @@
> +Emit a warning if a cross property is used (via meson.get_external_property())
> +without an explicit value being set.
> +
> +All default values should be validated to be sure that they're correct, so if we
> +emit a warning in Meson then meson.bbclass can catch and expose it.
> +
> +This is inappropriate as upstream are thinking about improving how cc.run()
> +handles the cross case.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/mesonbuild/interpreter/mesonmain.py b/mesonbuild/interpreter/mesonmain.py
> +index 01d0029a7..936b03fbf 100644
> +--- a/mesonbuild/interpreter/mesonmain.py
> ++++ b/mesonbuild/interpreter/mesonmain.py
> +@@ -416,6 +416,7 @@ class MesonMain(MesonInterpreterObject):
> +             return self.interpreter.environment.properties[machine][propname]
> +         except KeyError:
> +             if fallback is not None:
> ++                mlog.warning(f"Cross property {propname} is using default value {fallback}")
> +                 return fallback
> +             raise InterpreterException(f'Unknown property for {machine.get_lower_case_name()} machine: {propname}')
> + 
> diff --git a/meta/recipes-devtools/meson/meson_1.1.1.bb b/meta/recipes-devtools/meson/meson_1.1.1.bb
> index 500e13775f4..d017d2dccd9 100644
> --- a/meta/recipes-devtools/meson/meson_1.1.1.bb
> +++ b/meta/recipes-devtools/meson/meson_1.1.1.bb
> @@ -14,6 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
>             file://0001-python-module-do-not-manipulate-the-environment-when.patch \
>             file://0001-Make-CPU-family-warnings-fatal.patch \
>             file://0002-Support-building-allarch-recipes-again.patch \
> +           file://default.patch \
>             "
>  SRC_URI[sha256sum] = "d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185806): https://lists.openembedded.org/g/openembedded-core/message/185806
> Mute This Topic: https://lists.openembedded.org/mt/100666859/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

