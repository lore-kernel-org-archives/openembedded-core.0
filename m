Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA79C47074
	for <webhook@archiver.kernel.org>; Sun,  7 Jan 2024 19:49:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.22985.1704656974881322834
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jan 2024 11:49:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ESjrQnGD;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A394E60003;
	Sun,  7 Jan 2024 19:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704656973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=se/+J9B0xFpLMlZyOl2zovGDvD10iFGiI9WquqFajnw=;
	b=ESjrQnGDqWV6iNoOxRoYyZV+sf+VkczoNga8/8y+7gCHSHcuWqcFkWalP22eZ4DrQLXpeU
	X+Pzd85J3DLQ7Isq1lXZx86QcO3kpxV7g5LRxNmZpFxL8Y2h9ZCAL1Y+YczLKxMTDwCyeF
	3xMjhJ4GZfoyyelqIVWWUcpQ+V2/2lAIDUqJEC7P7csElVqO/netbRpcPvEpJ0KzGq4O9Q
	b2tZL2nALBcYzGiLwa0ass5F7SK5Lt9Pj/pzxScNGpg0aNd4WBPFrY78digBOp5JXTpRLV
	7V5OS8cW0BMDGsOY7LIQ3nUCxjpfa6kkMvI0VFKtzWIr75STfE9tzmLV7QN8HQ==
Date: Sun, 7 Jan 2024 20:49:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/3] python3-pyaaml: make compatible with
 cython 3.x
Message-ID: <2024010719493289a2a15c@mail.local>
References: <20240105133543.3017997-1-alex@linutronix.de>
 <20240105133543.3017997-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105133543.3017997-2-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Jan 2024 19:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193389

Hello,

You have a typo in the subject.

On 05/01/2024 14:35:42+0100, Alexander Kanavin wrote:
> This has been rejected by upstream in favour of requiring obsolete cython
> until there's 'proper' 3.x support. Months later, there's still no progress
> so let's just take the rejected fix, as it does work (as reported by others as well),
> and allows moving forward with cython.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../0001-Fix-builds-with-Cython-3.patch       | 54 +++++++++++++++++++
>  .../python/python3-pyyaml_6.0.1.bb            |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
> 
> diff --git a/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
> new file mode 100644
> index 00000000000..a87d588b6a1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-pyyaml/0001-Fix-builds-with-Cython-3.patch
> @@ -0,0 +1,54 @@
> +From 9cc23db56add79357b8f8257fe6fc0d6879d4579 Mon Sep 17 00:00:00 2001
> +From: "Andrew J. Hesford" <ajh@sideband.org>
> +Date: Fri, 21 Jul 2023 09:50:00 -0400
> +Subject: [PATCH] Fix builds with Cython 3
> +
> +This is a *de minimis* fix for building with Cython 3. Recent Cython<3
> +releases provided `Cython.Distutils.build_ext` as an alias to
> +`Cython.Distutils.old_build_ext.old_build_ext`; Cython 3 drops this
> +alias and instead uses a wholly new `Cython.Distutils.build_ext` that
> +does not provide the `cython_sources` function used in `setup.py`.
> +
> +Explicitly importing `old_build_ext` preserves the existing behavior for
> +recent Cython<3 and uses the correct behavior for Cython 3. Should the
> +import fail (*e.g.*, because the version of Cython available predates
> +the availability of `old_build_ext`), the import falls back to just
> +`Cython.Distutils.build_ext`.
> +
> +Signed-off-by: Andrew J. Hesford <ajh@sideband.org>
> +Upstream-Status: Denied [https://github.com/yaml/pyyaml/pull/731]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + pyproject.toml | 2 +-
> + setup.py       | 6 +++++-
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/pyproject.toml b/pyproject.toml
> +index 4bc04c0..2bf5ec8 100644
> +--- a/pyproject.toml
> ++++ b/pyproject.toml
> +@@ -1,3 +1,3 @@
> + [build-system]
> +-requires = ["setuptools", "wheel", "Cython<3.0"]
> ++requires = ["setuptools", "wheel", "Cython"]
> + build-backend = "setuptools.build_meta"
> +diff --git a/setup.py b/setup.py
> +index 65b0ea0..4461580 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -82,7 +82,11 @@ if 'sdist' in sys.argv or os.environ.get('PYYAML_FORCE_CYTHON') == '1':
> +     with_cython = True
> + try:
> +     from Cython.Distutils.extension import Extension as _Extension
> +-    from Cython.Distutils import build_ext as _build_ext
> ++    try:
> ++        from Cython.Distutils.old_build_ext import old_build_ext as _build_ext
> ++    except ImportError:
> ++        from Cython.Distutils import build_ext as _build_ext
> ++
> +     with_cython = True
> + except ImportError:
> +     if with_cython:
> +-- 
> +2.39.2
> +
> diff --git a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
> index 4ab8f038f42..61f7cbc6b36 100644
> --- a/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-pyyaml_6.0.1.bb
> @@ -9,6 +9,7 @@ PYPI_PACKAGE = "PyYAML"
>  
>  inherit pypi python_setuptools_build_meta
>  
> +SRC_URI += "file://0001-Fix-builds-with-Cython-3.patch"
>  SRC_URI[sha256sum] = "bfdf460b1736c775f2ba9f6a92bca30bc2095067b8a9d77876d1fad6cc3b4a43"
>  
>  RDEPENDS:${PN} += "\
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193356): https://lists.openembedded.org/g/openembedded-core/message/193356
> Mute This Topic: https://lists.openembedded.org/mt/103542145/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

