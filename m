Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id B10E660C02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:33:05 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id oy12so2383815veb.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=3U1KgJg6NFtH83IFB8EWiXMZtg3Y9a6Q2/XZ7y1zZkQ=;
	b=HqKlJVeJUHUZ9qaxPeaUDQPUxCF0XEVNBS6ANz19jbxZHw9BF4C5WY1Cjh4ptjqYZy
	jIjBZn3lCWTgY/3n+Ti5pQhnRyufVvN0cxQ8jqXWzGYoaJcb4OEHP/+ddqDZGeo1N3te
	qr/ZMGSasBDZc4371by/jiBBiP9lKA7PILToBZFBAeh5z73k8nOyRDbqrm86dJOWXVx9
	H5qjC90kqOuXHDmw9Q+WaJrCHwXiNKnEKArut1zUsbh7Ky4ytyMrUdV/7TR+15LVrFIl
	AdvZoU/DpgRvpYf9gwLqF/Sgf5msaiCUMae/7TzdHyKitau1N/sxCnqqDVWtC/UR++lO
	MRWw==
X-Gm-Message-State: ALoCoQmSyKsmGIsKleNPEaTer0BP75T1vz/rEWQ7ZCgvVDRxZLBX+61MGGgMYaxy1W5glHiuD8Rt
X-Received: by 10.52.119.197 with SMTP id kw5mr51671396vdb.5.1395844386056;
	Wed, 26 Mar 2014 07:33:06 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id v20sm38608283vdj.0.2014.03.26.07.33.04
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Mar 2014 07:33:05 -0700 (PDT)
Message-ID: <5332E520.5050005@linaro.org>
Date: Wed, 26 Mar 2014 10:33:04 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1395676843.24890.7.camel@ted> <5330C9A8.904@linaro.org>
	<20140325055028.GA3710@jama>
In-Reply-To: <20140325055028.GA3710@jama>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Wed, 26 Mar 2014 14:33:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/25/14 01:50, Martin Jansa wrote:
> Can you show some example of config you need to have wor wayland and
> cannot have for core-image-minimal? 

Okay, good point. I should have thought harder to come up with a better
example :-) It's funny, actually, that you're the one pressing me on
this, I first encountered this issue and started thinking about it while
trying to reproduce your "State of bitbake world" tests :-)

Let's say you're a board maintainer; some people want to run gstreamer,
some people want to try out systemd, some want to run wayland. Each of
these requires tweaks to a conf/local.conf, no? I'm constantly changing
my set of IMAGE_INSTALL_append's, fiddling with preferred versions, and
distro features.

If I'm just doing a one-off build then sure, adjust conf/local.conf
manually. But if I'm perpetually rotating between a bunch of tests as
repositories are modified, it would be easier to just specify which
configuration I want from the bitbake cmdline.

As I mentioned, maybe I'm doing things wrong? Maybe others have separate
build locations, or maybe others define their own images which
incorporate these adjustments? But I'd be quite surprised to find I'm
the only one having to edit conf/local.conf to comment/un-comment blocks
before every build.

As a concrete example, currently I'm flipping between dora and master
builds. For some reason I can't seem to reuse the same TMPDIR between
them. So every time I "repo init -b <newbranch>" I then also have to
edit conf/local.conf before bitbaking.

