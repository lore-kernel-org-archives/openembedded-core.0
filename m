Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4940C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 09:43:13 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.8997.1651570988026624417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 02:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=l38bSk0Y;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 53F53240009;
	Tue,  3 May 2022 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651570986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dyrQH4rN11cZFCM8Gn+uMuN5vBOiUPUAl6yZLewzbds=;
	b=l38bSk0YRWpYOPY7pCZZZKwjic2ACDDC6QOGF9DSWvt1CVpTOZF/G2NiZ5bIgA+rWV7LjC
	tpESI8r9Nqzd1GLhE+V8USTwS1tvM9tWFQn3MsowsWq/DGCwNStzf19eq86h5dD6Xt0q51
	3EdCmTa9tuDP1iWa3Sx+sNssgST6I7D18RVHIYoKf0cyk6lvhf591+DzWMHCt9xdILukSn
	g5Atn8fQvaw5kq/NqM8pwD3STHNBXQTBWApqJbrZL2Ka2GMWsOgatBLdwK9E0os7T2IEaY
	2u4BolsGfIjJ9LKTvRE83pw5o7ZiQINP/2WNGvcllbPTQrltvX9GcU5Rh/kcow==
Date: Tue, 3 May 2022 11:43:04 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Davide Gardenal" <davidegarde2000@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Davide Gardenal
 <davide.gardenal@huawei.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] rootfs-postcommands: fix
 symlinks where link and output path are equal
Message-ID: <20220503114304.6e43082b@melee>
In-Reply-To: <20220503080309.9511-1-davide.gardenal@huawei.com>
References: <20220503080309.9511-1-davide.gardenal@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 09:43:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165197

Hi Davide,

Il giorno Tue,  3 May 2022 10:03:09 +0200
"Davide Gardenal" <davidegarde2000@gmail.com> ha scritto:

> When creating the manifest and the testdata.json links, if the link
> name is equal to the output name the link is not created, otherwise
> it is. This prevents a link-to-self in the first case.
> 
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/rootfs-postcommands.bbclass
> b/meta/classes/rootfs-postcommands.bbclass index
> 7b92df69c5..c949115647 100644 ---
> a/meta/classes/rootfs-postcommands.bbclass +++
> b/meta/classes/rootfs-postcommands.bbclass @@ -267,9 +267,10 @@
> python write_image_manifest () { 
>      if os.path.exists(manifest_name) and link_name:
>          manifest_link = deploy_dir + "/" + link_name + ".manifest"
> -        if os.path.lexists(manifest_link):
> -            os.remove(manifest_link)
> -        os.symlink(os.path.basename(manifest_name), manifest_link)
> +		if manifest_link != manifest_name
> +			if os.path.lexists(manifest_link):
> +				os.remove(manifest_link)
> +			os.symlink(os.path.basename(manifest_name),

This change is mixing tabs and spaces.

>  # Can be used to create /etc/timestamp during image construction to
> give a reasonably @@ -339,9 +340,10 @@ python write_image_test_data()
> { 
>      if os.path.exists(testdata_name) and link_name:
>          testdata_link = os.path.join(deploy_dir, "%s.testdata.json"
> % link_name)
> -        if os.path.lexists(testdata_link):
> -            os.remove(testdata_link)
> -        os.symlink(os.path.basename(testdata_name), testdata_link)
> +		if testdata_link != testdata_name:
> +			if os.path.lexists(testdata_link):
> +				os.remove(testdata_link)
> +			os.symlink(os.path.basename(testdata_name),

And this as well.

Can you send v2 with spaces-only indentation?

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

