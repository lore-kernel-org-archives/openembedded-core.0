Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699ABC433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 16:22:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.6317.1647102134219385959
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JMeVRy6i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id q20so6839804wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=fkR6CKI8iog4ZIYr6g1FYJ34Bv9+VRuRw/BC/w0YZlE=;
        b=JMeVRy6i7FWy8ZEInG99HPDjOYseoq+6Qe77L1x0adpZycRp5tLtnfysPLfT5bgYk6
         4d0v/h5Z8gKHXv6R8LsTE8QqcJoaQXZeHB4ovOv4Dsh0rht77jMdRW5/+q/8MZtM6k2X
         a+ZKWYqvN6WwsQCoyfEGjk7I7+hcAfg188K14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=fkR6CKI8iog4ZIYr6g1FYJ34Bv9+VRuRw/BC/w0YZlE=;
        b=ADvr8z2HNZJD1cnqT1RzSt8sYKdSGS2gM2u9/pS0Zx/zso6ySuv4dZe8CWqdNs4gG7
         rChrTb3d0gVO8kWYkVHGiE97LbT/0vFOLwftXi4E00wZcuoTTRQ7HpXA8o5Hx4xk1BNM
         MHceNQOsi2NTqRuEf6eeVreFTXmk4XPFmp1IzoCmahO9S5QoTuwav1vyPbpmqw4SeOSe
         BkbTJlaBxsxsfI/jKdsyHPFfAh9df3xt7zoPDEWdUgGwqviNwQoyGCp//NPAH9cEEFaT
         whhDa1X3jT8QCAmKxyrzf9IglZjvDEE1HKgwEktQb9BkpKjDxN4y3RFnqN988+/3Pblx
         R4tA==
X-Gm-Message-State: AOAM5316CmpDZlI8fXfs3YeBCkQ922gYpoRfr7oenSMe7cRwqM6D/3Ob
	8uC97HmS+xBc2kGpWKaRVOzhgg==
X-Google-Smtp-Source: 
 ABdhPJzw/jtK9r4M/zEszB/k0bcBaVj/lMw1EFGvExFCM84X3VC5OjTwkQcNFADnvAZZehPC2nrP2w==
X-Received: by 2002:a1c:e916:0:b0:37c:f44f:573 with SMTP id
 q22-20020a1ce916000000b0037cf44f0573mr19693362wmc.179.1647102132688;
        Sat, 12 Mar 2022 08:22:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7?
 ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 e1-20020a05600c108100b00389cdb3372csm9985666wmd.26.2022.03.12.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 08:22:12 -0800 (PST)
Message-ID: 
 <66d41d961474f4a71c3fc682a178eb81effa151f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] image.bbclass: make sure do_rootfs run from a
 clean workspace
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ming Liu <liu.ming50@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2022 16:22:09 +0000
In-Reply-To: <20220312115303.10434-1-liu.ming50@gmail.com>
References: <20220312115303.10434-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 16:22:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163094

On Sat, 2022-03-12 at 12:53 +0100, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Add ${IMAGE_ROOTFS} and ${IMGDEPLOYDIR} to do_rootfs[dirs] and
> do_rootfs[cleandirs], this ensures do_rootfs run from a clean
> workspace, with this change, we can now remove two bb.utils.mkdirhier
> lines from meta/lib/oe/rootfs.py.
> 
> Also drop ${S} from do_rootfs[cleandirs], nothing being installed into
> that directory.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/image.bbclass | 4 ++--
>  meta/lib/oe/rootfs.py      | 4 ----
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2b0ce4a988..98a0555040 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -252,8 +252,8 @@ fakeroot python do_rootfs () {
>  
>      progress_reporter.finish()
>  }
> -do_rootfs[dirs] = "${TOPDIR}"
> -do_rootfs[cleandirs] += "${S} ${IMGDEPLOYDIR}"
> +do_rootfs[dirs] = "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${TOPDIR}"
> +do_rootfs[cleandirs] += "${IMAGE_ROOTFS} ${IMGDEPLOYDIR}"
>  do_rootfs[file-checksums] += "${POSTINST_INTERCEPT_CHECKSUMS}"
>  addtask rootfs after do_prepare_recipe_sysroot

I think the removal of ${S} breaks things:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3279/steps/14/logs/stdio

Cheers,

Richard



