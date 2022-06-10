Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC048C43334
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 14:14:19 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web10.27582.1654870452757244344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 07:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KpL7b0N6;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 10370100004;
	Fri, 10 Jun 2022 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654870450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZCpjRzy2kihA8aoa0j9aBV5zejHBhmLYBZ1dsmQwcc=;
	b=KpL7b0N60vQxZkEv0jwL/EBCy45nkQRAUMQj7UddfFXnTuA6G5lPCQQJKlKBF9hIkyzi1u
	fWTWfhPIbKWrmetT9nyR/XIKoQtKnX8nIUyQbcKAW0RzNmlJoSSHFfeElYBQ9rqVipyHEj
	ZHpd5PpSRIJcmO8CqQmVxyX8+faGh3Jd0ffXaE/162qTGil2Pdvo7AH2kWmUUVSMjIC8nK
	pER//kVWKrYUWalY8g8lT/0YUjJZc1Vqv1iWlA1jtI6T/cBPA/4lztN2r6UOG+5zfWqmvo
	SvtHoSRZ/9mzR2oZ0nFynT6PWLCj1qqBtGP+7bbqJxOpGlBL5yxk5XmFOZU1+Q==
Date: Fri, 10 Jun 2022 16:14:08 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/5] classes/buildcfg: Move git/layer revision
 code into new OE module buildcfg
Message-ID: <20220610161408.34a3a6a4@booty>
In-Reply-To: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
References: <20220609113732.43566-1-richard.purdie@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 14:14:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166806

Hello Richard,

On Thu,  9 Jun 2022 12:37:28 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> There is a load of duplicated git/layer/revision code which makes
> most sesne as a python library, not bbclass code. Start to refactor as such.

s/sesne/sense/

> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass            |  9 +++---
>  meta/classes/buildhistory.bbclass    |  4 +--
>  meta/classes/image-buildinfo.bbclass |  4 +--
>  meta/classes/metadata_scm.bbclass    | 43 ++--------------------------
>  meta/lib/oe/buildcfg.py              | 40 ++++++++++++++++++++++++++
>  5 files changed, 51 insertions(+), 49 deletions(-)
>  create mode 100644 meta/lib/oe/buildcfg.py
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index bdb3ac33c67..f59e95fef06 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -7,12 +7,11 @@ inherit staging
>  inherit mirrors
>  inherit utils
>  inherit utility-tasks
> -inherit metadata_scm
>  inherit logging
>  
>  OE_EXTRA_IMPORTS ?= ""
>  
> -OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust ${OE_EXTRA_IMPORTS}"
> +OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath oe.license oe.qa oe.reproducible oe.rust oe.buildcfg ${OE_EXTRA_IMPORTS}"
>  OE_IMPORTS[type] = "list"
>  
>  PACKAGECONFIG_CONFARGS ??= ""
> @@ -35,6 +34,8 @@ def oe_import(d):
>  # We need the oe module name space early (before INHERITs get added)
>  OE_IMPORTED := "${@oe_import(d)}"
>  
> +inherit metadata_scm
> +
>  def lsb_distro_identifier(d):
>      adjust = d.getVar('LSB_DISTRO_ADJUST')
>      adjust_func = None
> @@ -219,8 +220,8 @@ def get_source_date_epoch_value(d):
>  def get_layers_branch_rev(d):
>      layers = (d.getVar("BBLAYERS") or "").split()
>      layers_branch_rev = ["%-20s = \"%s:%s\"" % (os.path.basename(i), \
> -        base_get_metadata_git_branch(i, None).strip(), \
> -        base_get_metadata_git_revision(i, None)) \
> +        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
> +        oe.buildcfg.get_metadata_git_revision(i, None)) \
>              for i in layers]
>      i = len(layers_branch_rev)-1
>      p1 = layers_branch_rev[i].find("=")
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index 4345ffc6939..f2493b3765a 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -761,8 +761,8 @@ def buildhistory_get_metadata_revs(d):
>      # We want an easily machine-readable format here, so get_layers_branch_rev isn't quite what we want
>      layers = (d.getVar("BBLAYERS") or "").split()
>      medadata_revs = ["%-17s = %s:%s%s" % (os.path.basename(i), \
> -        base_get_metadata_git_branch(i, None).strip(), \
> -        base_get_metadata_git_revision(i, None), \
> +        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
> +        oe.buildcfg.get_metadata_git_revision(i, None), \
>          buildhistory_get_modified(i)) \
>              for i in layers]
>      return '\n'.join(medadata_revs)
> diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
> index 94c585d4cd9..25ca8d8fe6b 100644
> --- a/meta/classes/image-buildinfo.bbclass
> +++ b/meta/classes/image-buildinfo.bbclass
> @@ -46,8 +46,8 @@ def get_layer_git_status(path):
>  def get_layer_revs(d):
>      layers = (d.getVar("BBLAYERS") or "").split()
>      medadata_revs = ["%-17s = %s:%s %s" % (os.path.basename(i), \
> -        base_get_metadata_git_branch(i, None).strip(), \
> -        base_get_metadata_git_revision(i, None), \
> +        oe.buildcfg.get_metadata_git_branch(i, None).strip(), \
> +        oe.buildcfg.get_metadata_git_revision(i, None), \
>          get_layer_git_status(i)) \
>              for i in layers]
>      return '\n'.join(medadata_revs)
> diff --git a/meta/classes/metadata_scm.bbclass b/meta/classes/metadata_scm.bbclass
> index 47cb969b8d8..f646b3159a4 100644
> --- a/meta/classes/metadata_scm.bbclass
> +++ b/meta/classes/metadata_scm.bbclass
> @@ -1,44 +1,5 @@
> -def base_detect_revision(d):
> -    path = base_get_scmbasepath(d)
> -    return base_get_metadata_git_revision(path, d)
>  
> -def base_detect_branch(d):
> -    path = base_get_scmbasepath(d)
> -    return base_get_metadata_git_branch(path, d)

This causes failures because there still a user of base_detect_branch()
in meta/classes/report-error.bbclass

NameError: name 'base_detect_branch' is not defined

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/2527/steps/13/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

