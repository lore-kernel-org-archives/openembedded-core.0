Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420D6C021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 12:23:21 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.6797.1740486195715818486
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 04:23:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hu+f546s;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5462a2b9dedso6611656e87.1
        for <Openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 04:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740486194; x=1741090994; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=37UvFa436ssvcTh9uWPC0mrqMctyWc0CXF1RRJP0WH4=;
        b=hu+f546syC0v20a5S02Ven+dakw/6HE56wo9UBgDN1KierlrorPz4Lytj9v/kQz8sJ
         7vTaNjYTHqDrqNKpSc+VbkpCXb6U0AIOg1Q4IJgMOovDvlfO28Tj/aSQr1p5ZliSjLj0
         zbT4RpPyfXKqEDzRl7IyPSnRIGDsLmMYnuDrPcJ76GsKHX8gmE1OALz6QaIIWGHtrwMx
         ikuHtD05uPx/2dlOvCEkzCccC2gDYJgcWIAssZ+sEzUX0He0y7Vdyh4anChE5uvh39Zs
         Wt0bL0bQejnXwfiAsFxsZ5KpQwNhBHBg0+E5uWKPgcUEAHx68jy1d9hSOVVJPKIxr7bF
         UL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740486194; x=1741090994;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37UvFa436ssvcTh9uWPC0mrqMctyWc0CXF1RRJP0WH4=;
        b=M78dbI7mAcW5e+7NUNARIaXYaZQMDZoMOig8O2d9RGzFMC4Enc5n/+cuLfDwHdnoI7
         lVE+o4mfR8X9iTI2h0vmVpXnKfZV/7YKbHANmRWoQqFdRiuDcQFh7PwZsslbG2PUkEoK
         0MXoOjKcnxA0VLoYiMgwK/XFy0/mIx06OzU2wJUXzFdHrfPA9XyFsQnAuLP67wFE4ZLL
         HpXzOxK7mwJe1muSjFIMa1r4vck+FkdDVKWaB3dMix/EU517Izys9aLdNYf8V5UrCfDO
         EW7Wqe6m75q74yOlyeKUqJdKttcOEcKSdvmXGfqtDMYPxeOCWzGebbFmdBPrmcZ6ItC/
         llSA==
X-Forwarded-Encrypted: i=1; AJvYcCV3VkBzE2ixxX4baNk9UVPIekaWqPIWKfoC+rqVkChKC1NyTYUJiG/bE5W7PyGMy75WnvNGR0aNcxDY+kV8nNDnAA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVgSD+it0xfHOJQ3xLwL0dgKhk8JnD5PcWeTmklvuiFF68ox45
	uF0wNO+vOTLGfc785r2dRSo7VZ+mgIOGhc1pNq4v1GXtovVlW1VuYuPQbHK4U/M=
X-Gm-Gg: ASbGncu+w1YP3TUvGlI3kOrRoHFbvDjC4VLKqdudp9M/30gm/sBgE6EFFHaqGIXCDfl
	AGsiAXUqlrvqRZoFbh2G8Sv6rmiZiEAGDmuDfrfw+AJ3yhNJWiPrZpeKdcw+9ZdhEsFsyHSirS5
	n/tLgC7uRIeBOUi5VDK8YZn1oPniiwhHzsDLDpQdMTltif+5QqBctOyiorEISbJXL3AuKOkU6sA
	qOniznwnhjxFUmLNudptWA2D9ym6Fs9vfwCAZFi9PkMCVakntgOl/1nO/i9yIzz6NmBshTkQKjA
	YZbM+D4DEO00phen02ckzX5G166CKxXrFCaOucVtIhEQWvNy4a4=
X-Google-Smtp-Source: AGHT+IGzmQLOKDOUQId31NG0SXKwyhRdx7NDnvJDIMrXAlsRK7DIfexWv/6FlsXSVRPs7Asb84cQjw==
X-Received: by 2002:ac2:4c2f:0:b0:549:2ae5:a499 with SMTP id 2adb3069b0e04-5492ae5a600mr286473e87.7.1740486193680;
        Tue, 25 Feb 2025 04:23:13 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f7d71sm157859e87.208.2025.02.25.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 04:23:13 -0800 (PST)
Date: Tue, 25 Feb 2025 14:23:11 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: richard.purdie@linuxfoundation.org
Cc: alex.kiernan@gmail.com, uvv.mail@gmail.com,
	Jon Mason <Jon.Mason@arm.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ross Burton <Ross.Burton@arm.com>,
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
Message-ID: <Z722L5ZlyawC1clp@nuoska>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org>
 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <73881478fdd87961e0b3252ac973327874aeba80.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73881478fdd87961e0b3252ac973327874aeba80.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 12:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211878

Hi,

On Tue, Feb 25, 2025 at 11:21:59AM +0000, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2025-02-20 at 16:03 +0000, Alex Kiernan via lists.openembedded.org wrote:
> > On Thu, Feb 20, 2025 at 3:52 PM Vyacheslav Yurkov via
> > lists.openembedded.org <uvv.mail=gmail.com@lists.openembedded.org>
> > wrote:
> > > 
> > > From meta/classes-recipe/rootfs-postcommands.bbclass:
> > > 
> > >      # 20:12 < mezcalero> koen: you have three options: a) run
> > > systemd-machine-id-setup at install time, b) have / read-only and an
> > > empty file there (for stateless) and c) boot with / writable
> > >          touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
> > >      fi
> > > 
> > > We could think of further improvements. One thing that comes to mind is
> > > changing systemd-systemctl-native to systemd-tools-native and enable the
> > > build of systemd-machine-id-setup.
> > > 
> > > Slava
> > > 
> > 
> > I do know that it was a horrible thing to get right when I rewrote the
> > shell script in python (which I'm very glad to see the back of):
> > 
> >     # If we populate the systemd links we also create /etc/machine-id, which
> >     # allows systemd to boot with the filesystem read-only before generating
> >     # a real value and then committing it back.
> >     #
> >     # For the stateless configuration, where /etc is generated at runtime
> >     # (for example on a tmpfs), this script shouldn't run at all and we
> >     # allow systemd to completely populate /etc.
> > 
> > It may be that this behaviour was wrong in some cases, but at the same
> > time, I remember spending a lot of time getting this right!
> 
> I just wanted to add that we've been seeing an odd failure on meta-arm on the autobuilder:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1032
> 
> and when I did into this, I see this in the logs:
> 
> [    3.700441] systemd[1]: Hostname set to <sbsa-ref>.
> [    3.704040] systemd[1]: System cannot boot: Missing /etc/machine-id and /etc is mounted read-only.
> [    3.704488] systemd[1]: Booting up is supported only when:
> [    3.705023] systemd[1]: 1) /etc/machine-id exists and is populated.
> [    3.705349] systemd[1]: 2) /etc/machine-id exists and is empty.
> [    3.705651] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.
> [   10.206513] systemd[1]: Populated /etc with preset unit settings.
> [   13.034155] systemd[1]: Queued start job for default target Graphical Interface.
> [   13.149568] systemd[1]: Created slice Slice /system/getty.
> 
> We therefore need to fix the issue with machine-id before we can merge
> this patch. I will drop it from master-next in the meantime due to this
> issue.

I think option 2) should be simple. IMO this could also be done by image/rootfs
classes or base-files when systemd is the init.

Where is build https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1032
adding "read-only-rootfs" to IMAGE_FEATURES?

The failures log from step 22, full log in
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1586278/raw_inline
only shows issues with sshd server, which IMO is not installed to any of the
built images. The builds are IMO missing IMAGE_FEATURES += "ssh-server-dropbear"
which in meta-arm kas builds is set with ci/testimage.yml.
Even the core-image-minimal tests are passing without any communication with
target qemu machine:

 * ping.PingTest.test_ping with slirp pings localhost, not target machine
 * parselogs.ParseLogsTest.test_get_context doesn't talk with booted qemu machine

How to get to the qemu boot log which shows the systemd errors above?

I don't see the connection between the systemd error and the build above.
I could propose patches to the issues if I can figure out where :/

Cheers,

-Mikko

