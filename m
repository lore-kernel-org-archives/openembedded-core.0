Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A01C77D9E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 10:59:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n25so3328717wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=fiBe3mTmc4deR5T+cOYbmcYgSwU9B44RbeP6AtSOSIo=;
	b=al1YJMb4wLAAkohMWuUDLTza3T2U0Ecbm5l4/4H18s8fAstj/8msmIRbmR5e99I/s5
	DVr58s+hMMLNZixYTwf/QUMKqda6VesQFBMqzYREVQr4m73xd2emJxFeU+nHNbex4Rx8
	Qhn+2OE92YXH5Ctc93lm7Ip91+Jekc0rtq+VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fiBe3mTmc4deR5T+cOYbmcYgSwU9B44RbeP6AtSOSIo=;
	b=noEHTnBgrHLGl6hUfa7sgyBdBvtIrsp2VL0DknF5arjFKG2eLyyCftAYfcmJEgsrWZ
	gcaUtdx2pz6CMIzNSSBX1XxLEnYO8MEjAmpcgUANd6tKCQdSTPcLpWyun0oajndBATHw
	A3edoHBjQ05v0tDj1rGcBWHfSH4euoJ3CouDoRFx3D7yQec10B6mD4W0FM2kRSNus87O
	oYoV0c0DY1ZVMzg/uQAtbuQOBZDPoue80g5GhNMXRcidTr3yPnwU4oBci1ATY/pn77Sb
	TevDdcMBSGpRPdNbFjgH+I5YL4tT7hlJCwyuPAPWMylG9NeohzJT+TU1ty+uMdBChOZL
	230g==
X-Gm-Message-State: APjAAAWXfshidZl5iUzqEMZ0193S4C4CvkrNAQij2K+oyT+Hdb3K1d8A
	l76DjspvuwGrEMNv0zoIqBAZOJyL/6E=
X-Google-Smtp-Source: APXvYqwFW2pAr6CeaBnhNhZORtmA/ekoIEHnGLNK8pFK0JXrN0tTvMMhYLmaE9GwxmMVBTNzswGeIQ==
X-Received: by 2002:a1c:7e8a:: with SMTP id z132mr2728435wmc.92.1556621993400; 
	Tue, 30 Apr 2019 03:59:53 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s3sm34521062wre.97.2019.04.30.03.59.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Apr 2019 03:59:52 -0700 (PDT)
Message-ID: <546ea9e32e2fb9ffa97aae5fbd328f653a1949b5.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alex Kiernan <alex.kiernan@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 11:59:51 +0100
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v5 0/6] Fix systemd service enables/move towards "stateless" configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Apr 2019 10:59:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-04-29 at 15:43 +0100, Alex Kiernan wrote:
> This is largely Jonas Bonn <jonas@norrbonn.se> patchset to move
> towards a
> "stateless" configuration:
> 
>   These patches make some modifications to systemd with the long-term 
> goal
>   of being able to run OE in systemd's "stateless" configuration.
>   "Stateless" boils down to building an image with empty /etc and
> /var
>   directories so that volatile (tmpfs) filesystems can be mounted
> there;
>   this requires that the system subsequently be able to populate
> these
>   directories dynamically, which systemd mostly takes care of if
> things are
>   done right.
> 
>   In these patches:
>   i)   Don't include machine-id in writable images so that systemd
> can run
>        its first-boot machinery
>   ii)  Move systemd configuration files out of /etc
>   iii) Allow systemd to dynamically enable services and populate
>        /etc/systemd/system via the presets mechanism
> 
>   There's a long way to go to get to a working "stateless"
> configuration.
>   Getting to a "volatile" system (just empty /var) should be easier
> and I'll
>   post patches moving things in that direction shortly.
> 
> As a result of the systemd 242 upgrade, which includes 01d2041e41f4
> ("meson: stop creating enablement symlinks in /etc during
> installation"), services such as systemd-networkd are no longer
> enabled
> in images.
> 
> This patch set fixes this problem in addition to satisfying the goal
> of
> moving towards "stateless" configurations.
> 
> The issue with respect to image testing during CI was caused by
> systemd-time-wait-sync.service being enabled due to the lack of a
> default preset policy:
> 
> https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
> 
> We include a default policy of "enable nothing" which matches that
> used
> by (at least) Arch and Fedora.
> 
> Changes in v5:
> - rebased for systemd 242
> - install default preset distribution policy of "enable nothing"
> 
> Changes in v4:
> - add patch to make systemd-firstboot a non-default option to systemd
> to
>   prevent unexpected prompts at runtime
> 
> Changes in v3:
> - parameterize preset-file installation location (as suggested in
> patch
>   review)
> 
> Changes in v2:
> - address patchtest warnings:
>   - include sign-offs on patches
>   - include License-Update tag on patch that makes licensing change
> - dropped patch implementing brute-force removal of unit files
> installed
>   by systemd into /etc
> - reworked the systemd-conf patch to restore the installation of the
>   base systemd configuration files
> 
> Jonas Bonn (6):
>   systemd: don't build firstboot by default
>   systemd: do not create machine-id
>   systemd-conf: simplify creation of machine-specific configuration
>   systemd: create preset files instead of installing in image
>   systemd-systemctl-native: simplify and support preset-all
>   rootfs-postcommands: call preset-all for read-only-rootfs

I think this is close but in one of our test configurations it appears
the ssh server isn't starting:

https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/548

(the stdio log shows the configuration its building for step 6 and
step6c shows it failing to ssh into the image)

I reran it and the same error happened twice so it is consistent.

Cheers,

Richard


