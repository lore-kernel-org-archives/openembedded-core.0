Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E76DC61DA3
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 02:25:26 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.3050.1677032725893064582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 18:25:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BPH6yVHq;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id u6so2716802ilk.12
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 18:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8mWPDfQS+mR2BlPUOmhfk37vOQIwdz9SIpfgjo11SE=;
        b=BPH6yVHqjRYnPTdkMU2P71mFuS8/7nFzLpw0aEXpuN9JABi3HyZ3lcMthHdUG8FFgW
         wLas/pJDc/sWIff9pqifQ2eSTWpBnqTEcy4kKTmg1IMb29ilEc+0H5AruFC5c102n0OA
         Pf7x7TeRIThb7bz5PCuq9CnLRoLm7Dd4fO6gAKSEh7Cynma8YsSrUZ4jtJVrXUG0vz/D
         Ww30BYCErrSSFD97SBpNcBbls7Fi/Ydp2i3FbdaUKviEj8biJTt7Wr3NaOGQ5/UdHqaY
         oVjfyt7q+9mNVLo4HIzaxhSsdLbYbfF1S/Czg7BGtd34EfezZnCRLxmhfGtvYMeRAdc2
         tbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8mWPDfQS+mR2BlPUOmhfk37vOQIwdz9SIpfgjo11SE=;
        b=QDcA689UcDlNXLPBmP4hJKm1oy3e+MqPA0RecUvO6O5WkqLRt+/16YA9zgSSG2/Pj9
         tyGVXfg6AAB6HiXRaevQLlyDTx/fkLEnNdzKmmIx92X+5SXWOO0aICW1giJXAbNrlGgc
         g4qd8UoaMWIlxtZFDvPDrPJcXP37BXTJ2Np7edKfYJwuMsdrNIlI5f8/Up3mX46YWnKj
         CNaSbTUJVDn4/uc6LJYQszuRBLlqisqP0wf1+V8kUYCQQdvu2cgzx/uVnTna7GPEngku
         9v3Ta0mwnDbpKCEqqOiE0NruythMa9KWBGo7ZSsS77P75QDUWHpo8MClg2VSBWcMEfBI
         PSog==
X-Gm-Message-State: AO0yUKWfiFHl/f8fmMrtvnwj7L+9pf0/BXXg6EH5+ZTfeA2vcc9fS/5y
	8MoKEkOQX/vbT6bn5rJAcTjb3mgkQyk=
X-Google-Smtp-Source: AK7set/fH9Gk8w2DNsHODHG36CBBtHes8ZHG2MIVvssUpCNXcerjq1jwVog/3TdObjSNXfByGpowFA==
X-Received: by 2002:a05:6e02:20c8:b0:313:f9df:2f4d with SMTP id 8-20020a056e0220c800b00313f9df2f4dmr8000095ilq.29.1677032724737;
        Tue, 21 Feb 2023 18:25:24 -0800 (PST)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id b15-20020a92db0f000000b00316ecbf5c30sm71241iln.45.2023.02.21.18.25.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 18:25:24 -0800 (PST)
Date: Tue, 21 Feb 2023 21:25:22 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 08/11] build-appliance-image: use a real /tmp
Message-ID: <20230222022522.GA26598@localhost>
References: <20230221204445.23931-1-twoerner@gmail.com>
 <1745F1D06F6A6D6B.17041@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1745F1D06F6A6D6B.17041@lists.openembedded.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 02:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177556

On Tue 2023-02-21 @ 03:44:42 PM, Trevor Woerner via lists.openembedded.org wrote:
> Make /tmp a real directory in the root filesystem and not a link to an
> in-memory tmpfs. Otherwise bitbake will run out of inodes on /tmp very quickly
> and stop any build.
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> index 3a84de0a2b43..1f7b96a9fcf4 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -113,6 +113,12 @@ fakeroot do_tweak_image () {
>  	# add a /lib64 symlink
>  	# this is needed for building rust-native on a 64-bit build appliance
>  	ln -rs ${IMAGE_ROOTFS}/lib ${IMAGE_ROOTFS}/lib64
> +
> +	# make /tmp a real directory and not a link to an in-memory tmpfs
> +	# otherwise /tmp will run out of inodes very quickly when bitbaking
> +	sed -i -e 's#l root root 1777 /tmp /var/tmp#d root root 1777 /tmp none#' ${IMAGE_ROOTFS}/etc/default/volatiles/00_core
> +	mkdir -p ${IMAGE_ROOTFS}/tmp
> +	chmod 1777 ${IMAGE_ROOTFS}/tmp
>  }

Richard, this feels rather "hacky" to me. I can't help wonder if it would be
better to implement a VOLATILE_TMP_DIR mechanism (along the same lines as
VOLATILE_LOG_DIR)?

https://docs.yoctoproject.org/dev/ref-manual/variables.html?highlight=volatile_log_dir#term-VOLATILE_LOG_DIR
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/initscripts/initscripts_1.0.bb#n107

