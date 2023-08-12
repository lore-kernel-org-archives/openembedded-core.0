Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ABBC0015E
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 13:04:00 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.64530.1691845437420653718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Aug 2023 06:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=WIsNgPKY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 384691BF204;
	Sat, 12 Aug 2023 13:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691845435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xsQHW6dECnt3fcvD9JwR2QUc87ta6Q+2ZxE5J2+rSmA=;
	b=WIsNgPKYYEa2gJAfFezU6Kgr8fC9Ou+fnFq3OOW/El92ygoXFDrccVDy9+bTurWIaeVWVD
	TWfeyXMd3/49QHYlDfqTh/m+2Q3zTGPIBvOEb6LCBmUKgnKTApSAb+NkQFzTjCszcPUCV+
	k5ptllWCbvIqxCvJFLQCrU2Cs7P+UrqDOO62DfSOdECwx2NuLOi693zyM6m92Li380++Gf
	Hpx1opvWBhSi3zS1+nhEbJ+d7TBaa6X24OJUIG+BfA8rUw59JPkWask2gmmNrH6Rin4+d7
	Vza7YMZr0JEpZpsppmlTCC4FMCGIw4ftHqr2RSGztDj7YHocJ10kM0RdEHkfdA==
Date: Sat, 12 Aug 2023 15:03:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Piotr =?utf-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH v12 1/7] path.py: add support for ACLs and all
 additional attributes
Message-ID: <202308121303547b05aa57@mail.local>
References: <20230804084315.55768-1-p.lobacz@welotec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804084315.55768-1-p.lobacz@welotec.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 13:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185855

Hello,

This went through the autobuilder fine until yesterday:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3349/steps/12/logs/stdio

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230811-vwiija9k/packages/diff-html/

On 04/08/2023 10:43:09+0200, Piotr Łobacz wrote:
> Extend `tar` command inside copytree() and copyhardlinktree() functions,
> with additional parameters, in order to support ACLs and xattr. The posix
> format doesn't need to be set in here, as GNU tar switches to it whenewer
> is uses --acls and/or --xattrs parameters.
> 
> Additionaly change preservation of additional attributes for `cp` command
> to all (meaning mode, ownership, timestamps etc.) not only xattrs, which
> were previously.
> 
> Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
> ---
>  meta/lib/oe/path.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
> index 0dc8f172d5..56e8e214ac 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -92,7 +92,7 @@ def copytree(src, dst):
>      # This way we also preserve hardlinks between files in the tree.
>  
>      bb.utils.mkdirhier(dst)
> -    cmd = "tar --xattrs --xattrs-include='*' -cf - -S -C %s -p . | tar --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
> +    cmd = "tar --acls --xattrs --xattrs-include='*' -cf - -S -C %s -p . | tar --acls --xattrs --xattrs-include='*' -xf - -C %s" % (src, dst)
>      subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>  
>  def copyhardlinktree(src, dst):
> @@ -119,7 +119,7 @@ def copyhardlinktree(src, dst):
>      if (canhard):
>          # Need to copy directories only with tar first since cp will error if two 
>          # writers try and create a directory at the same time
> -        cmd = "cd %s; find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
> +        cmd = "cd %s; find . -type d -print | tar --acls --xattrs --xattrs-include='*' -cf - -S -C %s -p --no-recursion --files-from - | tar --acls --xattrs --xattrs-include='*' -xhf - -C %s" % (src, src, dst)
>          subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
>          source = ''
>          if os.path.isdir(src):
> @@ -130,7 +130,7 @@ def copyhardlinktree(src, dst):
>          else:
>              source = src
>              s_dir = os.getcwd()
> -        cmd = 'cp -afl --preserve=xattr %s %s' % (source, os.path.realpath(dst))
> +        cmd = 'cp -afl --preserve=all %s %s' % (source, os.path.realpath(dst))
>          subprocess.check_output(cmd, shell=True, cwd=s_dir, stderr=subprocess.STDOUT)
>      else:
>          copytree(src, dst)
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185512): https://lists.openembedded.org/g/openembedded-core/message/185512
> Mute This Topic: https://lists.openembedded.org/mt/100542715/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

