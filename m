Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id B05C87162E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 08:35:20 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id u10so1323595lbd.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 00:35:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=a07mHzIa7yWw7Mr1LvbRx0rdLEHwftI3grOWBOu1Zg8=;
	b=a1o/7NH/dJHW9dgQ69iWi01oSNzYw6ChZ3AtIyalZrEARORZT/v/5S8Q/EVBIN+/Mh
	7zIfsOiC2VX4SGEm1P8Fru/2Q6qDWjUoJyicIjF/tFylndw0H1Nx4EKsaKaayxs0Iz6t
	cR6ZLaz1joD9TsH4DeVw8rB/ErQONKDrA8bLlJZlsiDpI4i6luluPzdL90sRjTQ9baSJ
	QJw6KzJg1puggeG2Yrqp6R23S4Z1bBhFX1O00XrcHoBjpFpH2RLMv3BKc/gWJsYb2KQe
	aj/C7pg0RMJhQJRRQPkrzlfGgbAG3JvZmQ97I3HvupLkaNxtGTFvWY2ZrDcSGzceb+yM
	6YRA==
X-Gm-Message-State: ALoCoQl0Q+FUHQumjCGG4ZQ2VGwLgfeJhG2K+9Z2PQLbA0YDtC1ACR8qUqrwV+WXSsMLXBXM9WtP
X-Received: by 10.112.130.34 with SMTP id ob2mr41367821lbb.78.1421138119564;
	Tue, 13 Jan 2015 00:35:19 -0800 (PST)
Received: from ad.chargestorm.se (c-83-233-221-90.cust.bredband2.com.
	[83.233.221.90])
	by mx.google.com with ESMTPSA id de5sm654210lac.33.2015.01.13.00.35.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jan 2015 00:35:19 -0800 (PST)
Date: Tue, 13 Jan 2015 09:35:17 +0100
From: Anders Darander <anders@chargestorm.se>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20150113083517.GA9496@ad.chargestorm.se>
Mail-Followup-To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1421110587-23245-1-git-send-email-armccurdy@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1421110587-23245-1-git-send-email-armccurdy@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] logrotate: fix missing acl and libselinux dependencies
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
X-List-Received-Date: Tue, 13 Jan 2015 08:35:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Andre McCurdy <armccurdy@gmail.com> [150113 01:57]:
> +# TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
> +# TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?

It might well be worth adding autotools support right now.

>  DEPENDS="coreutils popt"

>  LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
> @@ -21,6 +24,9 @@ PACKAGECONFIG ?= "\
>      ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>  "

> +PACKAGECONFIG[acl] = ",,acl"
> +PACKAGECONFIG[selinux] = ",,libselinux"

The problem with these two lines, are that you're not explicitly
enabling and disabling those two features; thus our builds won't be
deterministic.

Depending on how the actual tests are performed in the logrotate
sources, it might happen that you're enabling the features just by
making sure that they're going to be built prior to logrotate. Though,
there's no guarantee that this will work (without looking at the source
code). 

However, if that enabling works, then we have the problem that the
features will always be activated regardless of whether we add acl and
selinux to PACKAGECONFIG, if these exists in the sysroot. Thus, the
build is undeterministic.

Could you please look at enabling / disabling those features explicitly?

Cheers,
Anders
-- 
Anders Darander
ChargeStorm AB / eStorm AB

