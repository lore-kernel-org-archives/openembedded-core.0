Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8FEC52D71
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 15:55:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.37090.1723046140199611263
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 08:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gpDM6Mqn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F48B20005;
	Wed,  7 Aug 2024 15:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723046138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FWl6/X+3LWn9b1xB4Zd2L/DsB9aU8iQLbmGcOof7B9o=;
	b=gpDM6Mqn5SO8ljIaAxXnmEb4EqAEf6fTEmBQJ/ufABLmwSLCp0HMWUZEnriZn4MtvIlk+o
	nZIfzy86YE8gm61PEOM8k1qz8Qy7K6PyVLzN4Rg2m2M6Rb/UGxJFtk6LcdoVX76Tg6FSfq
	OYA/BLtisTc8p/ojzaowzP1C0IHrz7PQ3X++ea3vMCsD2c/BAeBe/yD8KS8lQHkzsX4fSg
	m+3HE2f7304aIzepjFY+deCsWVGVGu+9kKhPPy3ORj89m9Rv7kiAD1z1xcwcUEwaHb+aPD
	ry5EsQkBXQlpd1+j8XJakoOkThtoKsHJgyL6UyWgQIClof4CLUbCo6eIMUZEUA==
Date: Wed, 7 Aug 2024 17:55:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: pedro.silva.ferreira@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Message-ID: <2024080715553757b6284c@mail.local>
References: <20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 15:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203089

Hello,

Because of DMARC, you really need to add your From: here

Also, the patch is still mangled and doesn't apply.

On 06/08/2024 13:59:54+0100, Pedro Ferreira via lists.openembedded.org wrote:
> This fix garantees that output package folder exists on
> buildhistory folder to avoid missing files-in-package.txt
> creation during task `package` execution.
> 
> This issue happens because the output folder is being
> created on task `packagedata` before generating `latest` file.
> 
> Also it ensures that in case of `find` fails we leave with
> a hard error instead of hidding the error on the for loop.
> 
> Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
> ---
> v2 changes:
> 
> Fixed Signed-off-by to the correct email
> ---
>  meta/classes/buildhistory.bbclass | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
> index c3d049aea3..ad151092c9 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -599,15 +599,13 @@ buildhistory_list_files_no_owners() {
> 
>  buildhistory_list_pkg_files() {
>         # Create individual files-in-package for each recipe's package
> -       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
> +       pkgdirlist=$(find ${PKGDEST}/* -maxdepth 0 -type d)
> +       for pkgdir in $pkgdirlist; do
>                 pkgname=$(basename $pkgdir)
>                 outfolder="${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
>                 outfile="$outfolder/files-in-package.txt"
>                 # Make sure the output folder exists so we can create the file
> -               if [ ! -d $outfolder ] ; then
> -                       bbdebug 2 "Folder $outfolder does not exist, file $outfile not created"
> -                       continue
> -               fi
> +               mkdir -p $outfolder
>                 buildhistory_list_files $pkgdir $outfile fakeroot
>         done
>  }
> --
> 2.34.1
> 
> The information in this communication may contain confidential or legally privileged information. It is intended solely for the use of the individual or entity it addresses and others authorized to receive it. If you are not an intended recipient, you are hereby notified that any disclosure, copying, distribution or action in reliance on the contents of this information is strictly prohibited and may be unlawful. If you have received this communication by error, please notify us immediately by responding to this e-mail and then delete it from your system. Critical TechWorks is not liable for the proper and complete transmission of the information in this communication nor for any delay in its receipt
> 
> This e-mail is environmentally friendly, just like Critical TechWorks, which lives in a paper-free atmosphere. Therefore, please consider the environment before printing it!

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203019): https://lists.openembedded.org/g/openembedded-core/message/203019
> Mute This Topic: https://lists.openembedded.org/mt/107750091/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

