Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59331C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 08:26:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web08.4019.1651652784558599046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mkiw6ltY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1570AC000B;
	Wed,  4 May 2022 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651652782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lnTkykOLlaF+XM5Az4O3aOU2vqAYae7hejUvVXk107A=;
	b=mkiw6ltYMxEr0evdIMEld5KajKrxkOY00FNnbCydMcBedzEdFbKpg1HTGUc3cBBSDU4hHX
	T8uzjHXtNeCJYKQ9zzsTRg8SP4b8ODfZrSX33ARO7zuBvJnmIvf6csjZkVRY1uKIOoKMjf
	R0qswkjnNrONTFnGXvkhLyVZ2yPMzaVqTKXnV5x3qXqBegdJOPp2vXK6VGo5CtwfGKzSL4
	XpN7uzocfmW7945+F9HEM+ExfwnB94SftoYdcGbj9/Mt+78oEPfU4D98iGh13PEXzWgo4m
	utANmuwqZXF/sPw/87o8c8I8fKOIoBAuYDZ5dNqFrzGoIi9p/IqzATGAxMrUYw==
Date: Wed, 4 May 2022 10:26:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Davide Gardenal" <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Davide Gardenal
 <davide.gardenal@huawei.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH v2] rootfs-postcommands:
 fix symlinks where link and output path are equal
Message-ID: <20220504102620.0ded9ccf@melee>
In-Reply-To: <20220503095627.12752-1-davide.gardenal@huawei.com>
References: <20220503095627.12752-1-davide.gardenal@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 08:26:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165213

Hi Davide,

Il giorno Tue,  3 May 2022 11:56:27 +0200
"Davide Gardenal" <davidegarde2000@gmail.com> ha scritto:

> When creating the manifest and the testdata.json links, if the link
> name is equal to the output name the link is not created, otherwise
> it is. This prevents a link-to-self in the first case.
> 
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
> Updates:
>     - v2: change tabs into spaces
> ---
>  meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass index
> 7b92df69c5..2fa388ba95 100644 ---
> a/meta/classes/rootfs-postcommands.bbclass +++
> b/meta/classes/rootfs-postcommands.bbclass @@ -267,9 +267,10 @@
> python write_image_manifest () { 
>      if os.path.exists(manifest_name) and link_name:
>          manifest_link = deploy_dir + "/" + link_name + ".manifest"
> -        if os.path.lexists(manifest_link):
> -            os.remove(manifest_link)
> -        os.symlink(os.path.basename(manifest_name), manifest_link)
> +        if manifest_link != manifest_name

A missing ':' here causes parsing failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3616/steps/13/logs/stdio

At least some testing should be done on any patch before being sent. It
looks like either this didn't happen or the patch got mangled before it
was sent. Did you use 'git send-email' to send it?

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

