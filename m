Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED56C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 23:11:54 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.946.1664579509308236683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 16:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PpeQN19i;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F38D7100002;
	Fri, 30 Sep 2022 23:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664579507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mLQpdczGgC/Bkp6pI5DFDEmvAzMvbuum42+yHK96iSQ=;
	b=PpeQN19i+vX3/k4lqwvjYyKLE7FFRuzTCJB5dJtzW+euCL8C+puN0Ms/MxTSJs8Cipj67Z
	ZbH6TqO3rkLzykpi6s94hII0Qb3S5SiByB8vslVSUQgM09I4eBU806oazZI7COlVenLdKn
	WwNONrWigrfcMy/W1efUW4w5hLUPmRkRIrjVZblkG75bXa865V8QtcBvj590ft44ro/CSz
	ERSLmfd3Ioo7UrrMb/5zgb0/ga3sSBglsGnl+SaTbPEKn+mu3PsVv6k78lkx7lhXjYilLE
	pJi1zwUJz0gLkPiPKZQOhwIS/bPVzjeyT+V5NPQ7TACINenVUPfF+1zKZco0qQ==
Date: Sat, 1 Oct 2022 01:11:46 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv2] wic-imager-direct.py: use fstab update also
 for root device
Message-ID: <Yzd3sgaUonex6igX@mail.local>
References: <20220930041807.2509199-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930041807.2509199-1-f_l_k@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 23:11:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171246

Hello Markus,

This causes the following failure:
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4140/steps/14/logs/stdio

On 30/09/2022 06:18:07+0200, Markus Volk wrote:
> wic imager is able to add entries for the partitions to fstab. This patch also
> creates an entry for the root device, which was previously ignored. The root
> device entry can now optionally be uuid or label based.
> 
> The stock fstab file provided by base-files.bb already contains an entry for the
> root device. The result looks something like this:
> 
> /dev/root / auto defaults 1 1
> proc /proc proc defaults 0 0
> devpts /dev/pts devpts mode=0620,ptmxmode=0666,gid=5 0 0
> tmpfs /run tmpfs mode=0755,nodev,nosuid,strictatime 0 0
> tmpfs /var/volatile tmpfs defaults 0 0
> 
> UUID=055A-69B5 /boot vfat defaults 0 0
> UUID=0eb2df23-3638-4bbf-b045-9a425cb45954 / ext4 defaults 0 0
> 
> To avoid duplicate root device entries in fstab for wic images, the "/dev/root"
> line is removed during the update.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index da483daed5..fd86a094d9 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -117,7 +117,7 @@ class DirectPlugin(ImagerPlugin):
>          updated = False
>          for part in self.parts:
>              if not part.realnum or not part.mountpoint \
> -               or part.mountpoint == "/" or not part.mountpoint.startswith('/'):
> +               or not part.mountpoint.startswith('/'):
>                  continue
>  
>              if part.use_uuid:
> @@ -145,6 +145,11 @@ class DirectPlugin(ImagerPlugin):
>              fstab_lines.append(line)
>              updated = True
>  
> +        for line in fstab_lines:
> +            if '/dev/root' in line:
> +                fstab_lines.remove(line)
> +                updated = True
> +
>          if updated:
>              self.updated_fstab_path = os.path.join(self.workdir, "fstab")
>              with open(self.updated_fstab_path, "w") as f:
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171205): https://lists.openembedded.org/g/openembedded-core/message/171205
> Mute This Topic: https://lists.openembedded.org/mt/94010270/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

