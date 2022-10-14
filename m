Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE281C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 06:41:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.4428.1665729706771696969
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 23:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U+udlpKw;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 043AF60002;
	Fri, 14 Oct 2022 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665729704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afNEmdpYbs+LmnQAAueL7ZF/MCJFWSyXqfCb2XgMWiE=;
	b=U+udlpKwcyYXJDsZnNkesieVFUEgpd6ICd7/+6rQWYfFg9vGAMrDrP7whX85XnmMCXTEdF
	Bw4oBaRmOn/keR4d57FONNa/ZCrjtzS3rQWi8PYClj8rttKhCHaKMr5bE3DaFxyzJCfQAm
	wDR+Ro3Gmx+t5IbHc0GteKaQqs/oIXmkMSWUcNGdlZuiYa9zqll81LjZ3sREYYnRfuCYT7
	u4GzpCC8LduMaO3FKgzX71WKnM5EFqGbKQD+3tE2sImYSv62Qh+tFIB2G/TDNCKI8SEjxS
	/kfGmxheGE0r/PB6KxXv1aOJ0WuhJBUm3tXM4Sv2P5yx4/hW0MJlWadpl52VpQ==
Date: Fri, 14 Oct 2022 08:41:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] wic: honor the SOURCE_DATE_EPOCH in case of
 updated fstab
Message-ID: <Y0kEpyPCOGh/t0pl@mail.local>
References: <20221013164020.4125847-1-s.zhmylev@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013164020.4125847-1-s.zhmylev@yadro.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Oct 2022 06:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171724

Hi,

This caused:

https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/6305/steps/13/logs/stdio

On 13/10/2022 19:40:20+0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
> 
> In case user requested to build a binary repeatable package,
> it's required to honor the SOURCE_DATE_EPOCH environment
> variable. So forcefully set mtime inside all the routines
> which modify fstab in case it is updated.
> 
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  scripts/lib/wic/partition.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index e50871b8d7..cac1bab4dd 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -291,6 +291,9 @@ class Partition():
>          if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
>              debugfs_script_path = os.path.join(cr_workdir, "debugfs_script")
>              with open(debugfs_script_path, "w") as f:
> +                if os.getenv('SOURCE_DATE_EPOCH'):
> +                    fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
> +                    f.write("set_current_time %s\n" % (fstab_time))
>                  f.write("cd etc\n")
>                  f.write("rm fstab\n")
>                  f.write("write %s fstab\n" % (self.updated_fstab_path))
> @@ -353,7 +356,7 @@ class Partition():
>          exec_native_cmd(mcopy_cmd, native_sysroot)
>  
>          if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
> -            mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
> +            mcopy_cmd = "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
>              exec_native_cmd(mcopy_cmd, native_sysroot)
>  
>          chmod_cmd = "chmod 644 %s" % rootfs
> -- 
> 2.37.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171718): https://lists.openembedded.org/g/openembedded-core/message/171718
> Mute This Topic: https://lists.openembedded.org/mt/94308156/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

