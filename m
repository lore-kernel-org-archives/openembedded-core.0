Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1077C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:09:30 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.34143.1744290566192924488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Jvx7znKs;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499614d3d2so913038e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744290564; x=1744895364; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jcqzMBYssXxxLLVKzYuQCqdX9hjXCY0oLsVZ/arF0VE=;
        b=Jvx7znKs8n9hskf6TECezbkc+bY5WkUCQ2xGcH2RZTAZoZnJfAb0c+pjIuxWwjgygk
         qZF3P+g+dNiC92D6A8Cd74jMCgH4tYrkm8837qlRYD1bfk13422ytdOTvzDj+gLFkROt
         SE3p9ewJB+0QELWT4O/PgcReFsEpTAuaWoYZvlnn8H1Vi5cNBA/uqUzjIVVmBuO4rXw0
         IJ1crrsBHHH7w+KLqljAM2afVgITmr+axEu5vXdFZTKSj36VBcaM8kPlI2Z7Gte3zpqh
         bQv5XL+WO/xHpoJKht2gOdtwVAGrJkU8+snGmhy1oQUtK7mEGrrUnPU38jOyu/Uevqk6
         oeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290564; x=1744895364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jcqzMBYssXxxLLVKzYuQCqdX9hjXCY0oLsVZ/arF0VE=;
        b=hj5RIemMWi3DaG/ENhcm6KEph+QbUAXH0Ni4Zh0NSm+XYFHXjHrMkZR2WwcLzBkHmA
         qIGcQwNp90hes+pvgbE7VUvys/hVl88//Y0LPeR8IOYTtEd7bZO35he0m7FzaeRQSYZB
         Rn/2qtjRYbS1y8zQy+Gp5FB6CwMlU8yx/tLbNhYKWERxKi43hWSq7Nf4X+X748edVstm
         42o7t9Xu8DEDWK+DCwiJklld/4K19EBBUeUN0tIqymCIg74qjtmnOPj1JqFH47N57CmV
         h4jjRuS3oWCpjkWA+8sIHSaWroIjVnDrbI5I8BKptLd4fxWP303LZp9kp+eryKjcnWT4
         yuAQ==
X-Gm-Message-State: AOJu0Yz6pAZ37/3RtnTDTgYJJIWWUKYgoyaoNzzqnoV/48dLK9Disrwo
	ry5miMyAWk1DU0ZsY7AAWeTrNq4kv31nVTJbXwK+C/VC/V+9sVAAyBqWx6NpHQ2vnq6Anm+Qehm
	vwRw=
X-Gm-Gg: ASbGnctb37RFXSutlaHT+iyiwy47dC9JsAm3o2dkifTMb5Vts1T+w9dmqaB0KwJsoth
	YKwI8Hzu0l5U2zXR2cP9P67UHRltdfp9Ex6M+lx2qKkPpuHSlVXWqyUe3EA/1IXDAzjajDL/6ZI
	P7CBF3wOwlxLm9/yQ3kWNqkOP268YBDakgog+1GOSrrYwDjDXVh+l4Y8fpUwvIIcADYd4A5j1gv
	ubiprBrVrNE4sS5XgHO5DcdDlRaiPxYEPQ175fLJjmlxLpTAcGHhwyDGS2vvny0ozwPYrS4RBe9
	T3pAT1szwjfVUtfXwuvKqvIGtVbqxvMpeGZUQTAi4JZJZKBpjyBbGZVyxTi3uV5J13xj4/hPqw=
	=
X-Google-Smtp-Source: AGHT+IGFuuukx+iQ47m+GWFmRLggYU14HZiw0JG9o5iB5whHShlYBTsea5/K5YDC8b99XeEG93HvaA==
X-Received: by 2002:a05:6512:3f05:b0:549:b13a:5d7f with SMTP id 2adb3069b0e04-54d3c62a587mr1107495e87.41.1744290564191;
        Thu, 10 Apr 2025 06:09:24 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5028c6sm149666e87.118.2025.04.10.06.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:09:23 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:09:22 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 05/11] core-image-initramfs-boot: don't
 install RRECOMMENDS to reduce size
Message-ID: <Z_fDAtumKM7ooxIe@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-6-mikko.rapeli@linaro.org>
 <09bcaac6d79659b91e88e93b712145503a926f5a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09bcaac6d79659b91e88e93b712145503a926f5a.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:09:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214667

Hi,

On Thu, Apr 10, 2025 at 01:47:27PM +0100, Richard Purdie wrote:
> On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > Disables recommends to only install important packages.
> > Disable machine specific additions which are meant for
> > full rootfs boot. For example on genericarm64, full
> > set of kernel modules and WiFi related firmware is
> > in the machine recommends and those are not needed when
> > booting to rootfs from an initrd. These reduce systemd
> > initrd size from 200Mb to 54Mb.
> > 
> > Since recommends are not automatically installed anymore,
> > explicitly add initramfs-module-rootfs, busybox-udhcpc and libkmod
> > to shell script based initrd. initramfs-module-rootfs is needed to
> > mount the rootfs. Installing busybox-udhcpc and libkmod
> > for backwards compatibility.
> > 
> > Not installing openssl-conf, openssl-ossl-module-legacy or
> > ldconfig packages since they don't seem essential in initrd
> > to mount the rootfs.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/recipes-core/images/core-image-initramfs-boot.bb | 11
> > ++++++++++-
> > �1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb
> > b/meta/recipes-core/images/core-image-initramfs-boot.bb
> > index c66c28db76..99388476ac 100644
> > --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
> > +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
> > @@ -2,7 +2,7 @@ SUMMARY = "Basic initramfs to boot a fully-featured
> > rootfs"
> > �DESCRIPTION = "Small initramfs that contains just udev and init, to
> > find the real rootfs."
> > �LICENSE = "MIT"
> > �
> > -INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-
> > udev"
> > +INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev
> > initramfs-module-rootfs"
> > �
> > �inherit image
> > �
> > @@ -20,8 +20,17 @@ PACKAGE_INSTALL = " \
> > �������� ${VIRTUAL-RUNTIME_dev_manager} \
> > ���� ', '${INITRAMFS_SCRIPTS}', d)} \
> > ���� base-passwd \
> > +��� busybox-udhcpc \
> > +��� libkmod \
> > �"
> > �
> > +# reduce size
> > +NO_RECOMMENDATIONS = "1"
> > +
> > +# don't install automatically, pick manually instead
> > +MACHINE_EXTRA_RDEPENDS = ""
> 
> I'd probably accept that removing the rrecommends below is probably ok
> for the initramfs but I'm not convinced removing rdepends is a good
> move. If that works, are the things in question really rdepends for the
> machine?

If MACHINE_EXTRA_RDEPENDS is for:

"A list of machine-specific packages to install as part of the image
being built that are __not essential for the machine to boot__. However,
the build process for more fully-featured images depends on the packages
being present."

Then I would think they are not needed for initramfs usecases.

Cheers,

-Mikko

