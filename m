Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779CCC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 10:01:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.18693.1705658475811393976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 02:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ab+eG0ay;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3281BC0010;
	Fri, 19 Jan 2024 10:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1705658474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=idHl4rl2N90J6r4glDQJ/dIdCzC1g2P4PYWoid3NLJE=;
	b=Ab+eG0ay4YK63hen4UBNWuOQ33PE/Kg7eiuNFF8Ms6icF4PRhn6gfvXq3BaM49yWgkjluY
	XmtP7PGkL3/F1sZesqD70tTtk4ri3Te/VZJtuVoFo83NQW/zA4VIMvbO1e6hs0HvNZXH7P
	vTLOjD10/r9ymY3fs4U0pzmpcJOaTiSDJuwQPl0sp8gVFXSrgpc8EFH/ZFlQuY5PE6S0Fb
	EnP6qN0V4NSmUh+LXMRcMY+7ILEWlMP1C8RDtn0KBKMPeW86ZF3ObQzjk3WVFsBRy/rWUM
	wB2lCRgOFkOba4AAknd12V9PLq/XRBoUxMC1B3LSHuULe4saOhi9n3dv0PwUww==
Date: Fri, 19 Jan 2024 11:01:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/4] classes/package_rpm: write file
 permissions and ownership explicitly into .spec
Message-ID: <20240119100112471dc4d2@mail.local>
References: <20240118102409.2680941-1-alex@linutronix.de>
 <20240118102409.2680941-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118102409.2680941-2-alex@linutronix.de>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 10:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194023

I got this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/8493/steps/23/logs/stdio

On 18/01/2024 11:24:07+0100, Alexander Kanavin wrote:
> Per https://github.com/rpm-software-management/rpm/commit/77d3529c31ca090a40b8d3959a0bcdd721a556d6
> rpm 4.19.1+ will not consider actual filesystem permissions and ownership, and will quietly default
> to root if not expictly set otherwise in .spec file.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/package_rpm.bbclass | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
> index 2fc18fe98c1..09cc7d62681 100644
> --- a/meta/classes-global/package_rpm.bbclass
> +++ b/meta/classes-global/package_rpm.bbclass
> @@ -103,6 +103,7 @@ def write_rpm_perfiledata(srcname, d):
>  
>  python write_specfile () {
>      import oe.packagedata
> +    import os,pwd,grp,stat
>  
>      # append information for logs and patches to %prep
>      def add_prep(d, spec_files_bottom):
> @@ -198,6 +199,13 @@ python write_specfile () {
>          # of the walk, the isdir() test would then fail and the walk code would assume its a file
>          # hence we check for the names in files too.
>          for rootpath, dirs, files in os.walk(walkpath):
> +            def get_attr(path):
> +                stat_f = os.stat(rootpath + "/" + path, follow_symlinks=False)
> +                mode = stat.S_IMODE(stat_f.st_mode)
> +                owner = pwd.getpwuid(stat_f.st_uid).pw_name
> +                group = grp.getgrgid(stat_f.st_gid).gr_name
> +                return "%attr({:o},{},{}) ".format(mode, owner, group)
> +
>              path = rootpath.replace(walkpath, "")
>              if path.endswith("DEBIAN") or path.endswith("CONTROL"):
>                  continue
> @@ -221,24 +229,28 @@ python write_specfile () {
>                      if dir == "CONTROL" or dir == "DEBIAN":
>                          continue
>                      dir = dir.replace("%", "%%%%%%%%")
> +                    p = path + '/' + dir
>                      # All packages own the directories their files are in...
> -                    target.append('%dir "' + path + '/' + dir + '"')
> +                    target.append(get_attr(dir) + '%dir "' + p + '"')
>              else:
>                  # packages own only empty directories or explict directory.
>                  # This will prevent the overlapping of security permission.
> +                attr = get_attr(path)
>                  if path and not files and not dirs:
> -                    target.append('%dir "' + path + '"')
> +                    target.append(attr + '%dir "' + path + '"')
>                  elif path and path in dirfiles:
> -                    target.append('%dir "' + path + '"')
> +                    target.append(attr + '%dir "' + path + '"')
>  
>              for file in files:
>                  if file == "CONTROL" or file == "DEBIAN":
>                      continue
>                  file = file.replace("%", "%%%%%%%%")
> -                if conffiles.count(path + '/' + file):
> -                    target.append('%config "' + path + '/' + file + '"')
> +                attr = get_attr(file)
> +                p = path + '/' + file
> +                if conffiles.count(p):
> +                    target.append(attr + '%config "' + p + '"')
>                  else:
> -                    target.append('"' + path + '/' + file + '"')
> +                    target.append(attr + '"' + p + '"')
>  
>      # Prevent the prerm/postrm scripts from being run during an upgrade
>      def wrap_uninstall(scriptvar):
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193970): https://lists.openembedded.org/g/openembedded-core/message/193970
> Mute This Topic: https://lists.openembedded.org/mt/103805482/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

