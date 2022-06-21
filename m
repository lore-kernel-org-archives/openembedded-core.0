Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91809C43334
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 09:51:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.40984.1655805086535962164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 02:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=katEj7jj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8C2F6FF80D;
	Tue, 21 Jun 2022 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655805083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y7Jcf3S70pVb3xWbX2+GsiILQDS3Uh29hcfNbvWq968=;
	b=katEj7jjTD8J5Pf9kivtDytTVgb535PsUduEepYJPCBgNfBDzifRDzuNuesQsezSX+idoi
	IFw5RxQlbEgsRq2yOwpDcdwb9nWEuYbtYPuH1ZGIoiEgNxF7tQEpgfUlnXxZyc0XyIt9ma
	5/tbCBnejoXtFAagdD1zUzVLQiigX4+d31s5XHYZFqtLTFsUe1IfnK508iHLi4Hl+FJ61i
	QzY+j+Trqyv8QSbgwNIFzgVBDes0D5aqjO4mKIrrhyegf/G/GRTI0DFDY25gXJpntiKFjp
	Bk+tnIwLdYqxP3tQ0ZYLP69ni1D8+yQoezfWSWS9zSiejshVhpb1GiRDEPslDA==
Date: Tue, 21 Jun 2022 11:51:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Ross Burton" <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH v2 2/4] Add python3-hatchling (from meta-oe)
Message-ID: <20220621115120.5c72e1b2@booty>
In-Reply-To: <20220620131458.4177628-2-ross.burton@arm.com>
References: <20220620131458.4177628-1-ross.burton@arm.com>
	<20220620131458.4177628-2-ross.burton@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 09:51:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167143

Hi Ross,

On Mon, 20 Jun 2022 14:14:56 +0100
"Ross Burton" <ross.burton@arm.com> wrote:

> Recipes in core are now needing to use the Hatch build system, so
> move the hatchling recipe and class from meta-oe to oe-core.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/python_hatchling.bbclass         |  5 +++++
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../python/python3-hatchling_1.3.0.bb         | 21 +++++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 meta/classes/python_hatchling.bbclass
>  create mode 100644 meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
> 
> diff --git a/meta/classes/python_hatchling.bbclass b/meta/classes/python_hatchling.bbclass
> new file mode 100644
> index 00000000000..b3cbe23601b
> --- /dev/null
> +++ b/meta/classes/python_hatchling.bbclass
> @@ -0,0 +1,5 @@
> +inherit python_pep517 python3native python3-dir setuptools3-base
> +
> +DEPENDS += "python3-hatchling-native"
> +
> +PEP517_BUILD_API = "hatchling.build"
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index abc100e44b2..085593b0e9e 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -611,6 +611,7 @@ RECIPE_MAINTAINER:pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr
>  RECIPE_MAINTAINER:pn-python3-flit-core = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER:pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
> +RECIPE_MAINTAINER:pn-python3-hatchling = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-python3-hypothesis = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-idna = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-imagesize = "Tim Orling <tim.orling@konsulko.com>"
> diff --git a/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb b/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
> new file mode 100644
> index 00000000000..6e7ccd743f5
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "The extensible, standards compliant build backend used by Hatch"
> +HOMEPAGE = "https://hatch.pypa.io/"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cbe2fd33fc9297692812fc94b7d27fd9"
> +
> +inherit pypi python_hatchling
> +
> +DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"

Another missing dependency:

  ERROR: Nothing PROVIDES 'python3-editables-native' (but
 /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb, virtual:native:/home/pokybuild/yocto-worker/reproducible/build/meta/recipes-devtools/python/python3-hatchling_1.3.0.bb DEPENDS on or otherwise requires it). Close matches:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1039/steps/12/logs/stdio


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

