Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA4F1C52D6F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 11:06:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4839.1722942413182452365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 04:06:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ElgNXm39;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 225CAE0004;
	Tue,  6 Aug 2024 11:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722942411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J4eQuCpLxK5t7bByipaYKPTtMEapYg+pH3Yx/pCQFec=;
	b=ElgNXm39OAoyu40Ec2IjYoBy5xiTOu6xZaygEROArpkGEmoCyD6fwLSgvEKpRuo7buyXA9
	W6OSqurmI/S2e9wif8emvAoCWdJgatY/J0LG0vd5HRlcWjvtPZ+eHt7t1lBkHyhi+NApDr
	SN4jQ2ep0f8wWN3yiTLC6+FoAPUnczywE2VWWBl+CmoTYbRhXnIZ4Fwc91nkEeTigXqY7O
	7x9v8n94DUH4AHzX3y51v0sjvhJ76M12rXQdsArxCrpCtZi6lAE5CDocnbuK6cAvG/Q10O
	YYEflRHrnavKbIFs5K5UKPx3hB9ZRL+8SkobDbNW20gHmRsrSUo4386ua1ZIAw==
Date: Tue, 6 Aug 2024 13:06:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: pedro.silva.ferreira@criticaltechworks.com
Cc: openembedded-core@lists.openembedded.org,
	Pedro Ferreira <pmi183@gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
Message-ID: <202408061106506616febb@mail.local>
References: <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203015

Hello,

This patch is missing your From:

https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity


On 02/08/2024 15:00:07+0100, Pedro Ferreira via lists.openembedded.org wrote:
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
> Signed-off-by: Pedro Ferreira <pmi183@gmail.com>
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

Also, the patch doesn't apply because tabs have been changed to spaces
here.

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
> View/Reply Online (#202911): https://lists.openembedded.org/g/openembedded-core/message/202911
> Mute This Topic: https://lists.openembedded.org/mt/107685168/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

