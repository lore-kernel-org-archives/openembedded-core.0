Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB3BC3DA49
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 22:47:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6702.1721342840027809821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 15:47:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21C2F40C67;
	Thu, 18 Jul 2024 22:47:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxY4e2hJlWA3; Thu, 18 Jul 2024 22:47:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A203C407DA;
	Thu, 18 Jul 2024 22:47:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A4FD7164001; Thu, 18 Jul 2024 18:47:15 -0400 (EDT)
Date: Thu, 18 Jul 2024 18:47:15 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
Message-ID: <20240718224715.GM17572@denix.org>
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 22:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202240

Should this be done via update-alternatives, like many other Linux distros do?


On Wed, Jul 17, 2024 at 10:32:01AM +0800, Song, Jiaying (CN) via lists.openembedded.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
> 
> The /usr/bin/python cannot find the correct Python interpreter, so a symbolic
> link is added to point it to the Python3 interpreter.
> 
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>  meta/recipes-devtools/python/python3/python3-manifest.json | 1 +
>  meta/recipes-devtools/python/python3_3.12.4.bb             | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 46092d4004..f9259e1450 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -220,6 +220,7 @@
>          "files": [
>              "${bindir}/python${PYTHON_MAJMIN}",
>              "${bindir}/python${PYTHON_MAJMIN}.real",
> +            "${bindir}/python",
>              "${bindir}/python3",
>              "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h",
>              "${libdir}/python${PYTHON_MAJMIN}/UserDict.py",
> diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
> index 743ba0b1f1..94535e7678 100644
> --- a/meta/recipes-devtools/python/python3_3.12.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.12.4.bb
> @@ -165,6 +165,7 @@ do_install:prepend() {
>  
>  do_install:append:class-target() {
>          oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
> +        ln -sf ${bindir}/python3 ${D}${bindir}/python
>  }
>  
>  do_install:append:class-native() {
> -- 
> 2.44.0

