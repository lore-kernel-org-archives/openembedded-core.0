Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8099C3ABBF
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 11:39:42 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.6617.1746617980732234542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 04:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gPdbDYvL;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499d2134e8so8058462e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746617979; x=1747222779; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O3+2lq3w8iNZOOWMm8NuJbeVhpkLSuC3MmmGmwu1z60=;
        b=gPdbDYvL19gysapfd/9W1kNcz4UHbkU9DpFF7ia/UrZdU7vszNy11X2JMvYtfFGGjy
         10QoaLqJzyqIc7oc+Pjq1t7iQbObJ9E/KR+LrG6OjgdmunacJCH5ASSHGcXXkMhym6dL
         vACGy+cdnaL5aJuiyqyQzYUbJ7WBg6l12NPQZxtyTcQ4XvM+mu6JxetX6xLWd4uSI66B
         3KL4v9/Wry4ILsZmJDs4zRsAa8xXoSQtFoHEMxHL5UJZaP/jALcbkeElsjUB0fPp9s/v
         uh+s9Nr02QDCpjcI5nvnACS75xxxNdgyyxZyDOhCPbLu7N3Arxx1Er/znvEqF9BdxG80
         zDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746617979; x=1747222779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3+2lq3w8iNZOOWMm8NuJbeVhpkLSuC3MmmGmwu1z60=;
        b=PAUUaVuctPdrePnuds0ldvAmLvEZL44gu8Y8BBGPVdKCjCT7rM64EqAm9XBajJl06a
         mlM57sckslQp6VqQ+Mm9gZQzfqJPJ6yPvthB4DP+o9Kwket6rP5SbMnYFkAz6E0QuSUo
         8gZxDLH/Nj1nsfNd35Il67XLJKEeLil0rudTw3PgwSF7GxzOkNNiHJYVTVLsEekUw5kP
         8noYsW4TgYW2vsNnIQxfP4HOHmJLKE3OEVmNbwP9/99MEzPjspZkoLE221eEuAXsK1A0
         iIjUmSbSQ2gC8z4/LoxnlVtYk0e0cmT1FDK2/kd12Vj5NZ441I293YlXgGvKB+YPDBB7
         zblw==
X-Forwarded-Encrypted: i=1; AJvYcCXXwqL024XjwiaDKu6ERJufiLu/YI6VC9JM+Dof1opCA5woo3mMjTfGC0BdPKLoJPQZ3xcHjsdmRaPqUvGWcvSo+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvCnjrG3CVb5W3a5/tKtK/HB3CGKKY5uZqb6P0YwOc/4S3hOv1
	7ucBVWDqZtLJ6g8jJX1v7XQbzuF+U/dLhP9p07U2yKJckLZPy/hU4DxqQVIETKk=
X-Gm-Gg: ASbGncteFia3VVo3CqOO58+qp2//poZAuXdunLlpQ0KFzufX31MJkGr6h6AryQw1C/M
	yPCHO26w9zuMeL3pdUtX8hD/mdw6+BkhLBEamKqxfJgbXp0vgdI5n7CZc/JRRP1o2FqFfXM9j51
	XOy0hjS7QRS6tRS2pib4gzuwGLEzLdX06hh/AfaQjlXIAHUh5yVoLh33zo/t/ahgwX4i6JpJPcB
	W5nSRrOpQrJFIQVpzdmw1jjYfw5GqCUzb9IuDoXYpHiYX9wbAKKMW4gNa+50A4CNykLsdDwrgjw
	7RK1w9jtJnFd8l1SPz867u92I1QjwFPjJO1J/tBiO0p/6kEuGAgQ7qmooU1SlfZJ7blIJNsR2Q=
	=
X-Google-Smtp-Source: AGHT+IFJxOM/3BGUoHAzprPqAeZfjXuFxJWiYa5HA5WCxOndMH5ewaZeuQ3Dyn8NNgaicaCZhsWoXQ==
X-Received: by 2002:ac2:4c48:0:b0:54d:68b7:86da with SMTP id 2adb3069b0e04-54fb93afc81mr1121662e87.42.1746617978791;
        Wed, 07 May 2025 04:39:38 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b1680sm2350116e87.23.2025.05.07.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 04:39:38 -0700 (PDT)
Date: Wed, 7 May 2025 14:39:36 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: richard.purdie@linuxfoundation.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/6] kernel-yocto: consolidated pull request
Message-ID: <aBtGeJH-y1Je42G0@nuoska>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
 <D9PRCP2WLN68.1VIO3IX3SQ7IH@bootlin.com>
 <183D2FC291E34522.16348@lists.openembedded.org>
 <161efc5b043277d6ca648087f9e6fcab9f72981d.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <161efc5b043277d6ca648087f9e6fcab9f72981d.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 11:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216107

Hi,

On Wed, May 07, 2025 at 12:18:03PM +0100, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2025-05-07 at 08:58 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2025-05-07 at 09:42 +0200, Mathieu Dubois-Briand wrote:
> > > On Tue May 6, 2025 at 6:32 PM CEST, Bruce Ashfield via
> > > lists.openembedded.org wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > 
> > > > Hi Richard,
> > > > 
> > > > Now that I'm back at my desk, here are the queued -stable,
> > > > configuration
> > > > and feature changes that I have queued.
> > > > 
> > > > I'll be sending -stable updates to the LTS branches as well.
> > > > 
> > > > Note: once patch #1 is in the tree and doesn't need any more
> > > > tweaks, I'll
> > > > send a documenation update. This is the patch that we need to
> > > > enable the
> > > > modular initrd work in kernel-yocto references.
> > > 
> > > I took this series in my branch and everything seems to be fine so
> > > far,
> > > except for a warning:
> > > 
> > > WARNING: linux-yocto-tiny-6.12.27+git-r0 do_kernel_configcheck:
> > > [kernel config]: specified values did not make it into the kernel's
> > > final configuration:
> > > 
> > > ��� [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config
> > > val (n) do not match
> > > ��� [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
> > > 
> > > https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1565
> > 
> > There are a few, it likely depends which build built a component
> > first.
> > I think there are three groups of failures, I've listed them all for
> > completeness:
> > 
> > Another qemuarm poky-tiny:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/50/builds/1564
> > qemuarm:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/16/builds/1563
> > qemuarm-alt:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/74/builds/1532
> > qemuarm nodistro:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/40/builds/1531
> > 
> > 
> > lttng-tools ptest failure:
> > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/1445
> 
> The ptest failure didn't appear on a second run so it is an
> intermittent AB issue rather than anything specific to this patch
> series.

So it looks like missing CRYPTO_LIB_CHACHA_INTERNAL=m with
CRYPTO_CHACHA20_NEON=m is the only problem on qemuarm
and genericarm64

I can send a patch if Bruce doesn't already have this.
I wonder where this came from since I did not see this before.
Maybe in the point release updates?

Cheers,

-Mikko

