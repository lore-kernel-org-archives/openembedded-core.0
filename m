Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E863EC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 06:12:36 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.40099.1744006347502027668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 23:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rBjugzCh;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so35200471fa.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 23:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744006346; x=1744611146; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMsdGDCEjSGrHkUX8HeHJ9rH3LCjhImV2QWo2igupzc=;
        b=rBjugzChyBWgZFcsKmO9mPfHHh7AdveHGqCgjdIxyAF/tWR3LqplD2v9s7Ku7QQsuM
         WzT+aIodDLle09JrB/+lD1998v52AJjXgrYJSHi/13Zc4Et4EIg6VZnnKNWvJhZxpGqV
         ozQXzXqMWbUmvjsztNVjodnqkIcliqU+iZK7lltFwuzHkZQM0/tnQgjxnG/MhAK8OQ6T
         oK1yMlCVC/lxXmLdSYI/iDj9PMCKKqXGW/OJTxu4qn1izn0yXTPqMbThprUgz9evLO1W
         exANpAq10iRn2uZZM/3PM63nEWjuf53wxUcOqA2k1h+phjqhW3L9/0O9pj5Te+9+96Z4
         HYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744006346; x=1744611146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMsdGDCEjSGrHkUX8HeHJ9rH3LCjhImV2QWo2igupzc=;
        b=aWnQ8yzwNnwAe58q0nG0DahJS0ozQ5yIuDmuxsGOVwhDn1PkcA/eVvYxs8Xy5vnnym
         aSwx4HsnMadd6mMXJtibHEA3vH4e/9KfpYBKwjODYmpteCiNo08OiOLt9EiT/+QXGu9z
         IaPFywehaV0FKE80AMtpd/q8h6E0yF9zHr2d4544h3GtldVRlzg1KEUMUog/wbOCMLum
         St28hcufZ9jt1nKEikiskOzP/9cj2Lmyag6dJ7scdyRtRIZum6sJShNSS9kZsGOPVez4
         E95mZpcKEDQGLtx5DdGvG73TGwnAvYc5e9e7XaVG7haCtgjW/ipjJK38Ii8ZHgq8Og9r
         gtsA==
X-Gm-Message-State: AOJu0YyB2gprGDfREyPhDrZLXvMO0pIA2tAXdSEfnY4aPCHqt1Yra/Lv
	jfb1A2cvYHswM/Jr6wKw5DtJ+TMeokcFNu1LdTemX1FIFjt01sqjTzBHe59owqY=
X-Gm-Gg: ASbGnctDt4UUEvnXowf247JfV2VwglM6J36FQTHUh6LBQE30GqYy6WHhYx1UOK8wEW/
	55l40iABEUGVvsODRkolbuCJd+Om98wgm1bU3s4OZUz+XAPiXeQta8EYqPYlw4xz4440OgS+7UK
	CJ4IEg9Po2FZDzU1HFb5lIWNtz93XXfOeSYhnvAgOQZ+VbnaBsjop87sjANYxsDr8xBb0f9PvZw
	noxbkDwxe9BUcwrRC6iTDd9Cf86aE9t48UMjt6Gb/COCqPf4yhH/hPKk1pCiZNhcvyB+wsvVpRA
	nOeNh+mW48bBfwu5NvWe7ed/bzSKPcPoZ3YXkyPvzovmp5QWnjDnlX6mUlpS8jW9w/kcbK+QPZw
	Uvg==
X-Google-Smtp-Source: AGHT+IEV6mNCkxBlHAhXs12YdP+kXgLUFXBUKtkRK9nip8TscBxp3YRQdZoM3Mw6pfzJAKxi43SG7w==
X-Received: by 2002:a05:651c:3131:b0:30b:d17b:269a with SMTP id 38308e7fff4ca-30f0a0ee865mr32269111fa.7.1744006345529;
        Sun, 06 Apr 2025 23:12:25 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce8ecsm14507041fa.101.2025.04.06.23.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:12:25 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:12:23 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 04/11] core-image-initramfs-boot: add option
 to build systemd based initrd
Message-ID: <Z_Nsx9Qntl9ghZwK@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-5-mikko.rapeli@linaro.org>
 <0C447E0A-971B-4C9D-A8B4-9293962BF92F@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0C447E0A-971B-4C9D-A8B4-9293962BF92F@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 06:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214397

Hi,

On Mon, Apr 07, 2025 at 08:01:41AM +0200, Koen Kooi wrote:
> Op 4 apr 2025, om 18:29 heeft Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> het volgende geschreven:
> > 
> > If "systemd-initramfs" is in DISTRO_FEATURES then convert
> > core-image-initramfs-boot from shell scripts to systemd.
> > The resulting initramfs is much bigger than shell script one but
> > supports much more features like disk encryption and TPM devices.
> > Also includes udev which can load any drivers needed to mount
> > rootfs.
> 
> Are packaged based kernel updates finally working with this?

Sorry, I don't get this question. What is package based kernel updates?

Cheers,

-Mikko

> regards,
> 
> Koen
> 
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > .../images/core-image-initramfs-boot.bb       | 20 ++++++++++++++++---
> > 1 file changed, 17 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
> > index 7258944751..c66c28db76 100644
> > --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
> > +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
> > @@ -4,7 +4,23 @@ LICENSE = "MIT"
> > 
> > INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
> > 
> > -PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
> > +inherit image
> > +
> > +PACKAGE_INSTALL = " \
> > +    ${VIRTUAL-RUNTIME_base-utils} \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd-initramfs', ' \
> > +        base-files \
> > +        coreutils \
> > +        e2fsprogs-mke2fs \
> > +        os-release-initrd \
> > +        util-linux-blkid \
> > +        util-linux-mount \
> > +        util-linux-umount \
> > +        ${VIRTUAL-RUNTIME_init_manager} \
> > +        ${VIRTUAL-RUNTIME_dev_manager} \
> > +    ', '${INITRAMFS_SCRIPTS}', d)} \
> > +    base-passwd \
> > +"
> > 
> > # Ensure the initramfs only contains the bare minimum
> > IMAGE_FEATURES = ""
> > @@ -18,5 +34,3 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> > IMAGE_NAME_SUFFIX ?= ""
> > IMAGE_ROOTFS_SIZE = "8192"
> > IMAGE_ROOTFS_EXTRA_SPACE = "0"
> > -
> > -inherit image
> > -- 
> > 2.43.0
> > 
> > 
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#214355): https://lists.openembedded.org/g/openembedded-core/message/214355
> > Mute This Topic: https://lists.openembedded.org/mt/112087527/9418801
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [koen.kooi@oss.qualcomm.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> > 

