Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9D1C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 07:47:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.70882.1746517670881186092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 00:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jxBSP0m3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E81DE43A5C;
	Tue,  6 May 2025 07:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746517668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6AyfquA6qz2Zrv25GveuuSnGMX74V8OnFAqvU7tcuNA=;
	b=jxBSP0m3JDApWmkxZQZJz97GllLGTtO/QlRyBa3yW8exGU3eakeJSbHGxb7tRmixKJ3IBJ
	o11oGLuYSWTN63ztwIa1AVXOSHdVf8jTTxmM10tr0skuHR/1nspjovAhPKZ3lWWdC7woh3
	eFRd2uZlSKp7rl06b5lD6Cu4Kcr9WkwsCi3YYI4IaAPu70ekCfpokZsJOZFdKDKg7imvEt
	zxGjLD7Yoe9o9PEsGXl6ldMIRZ/2C9s/9SZphOe59WJ+ZVZgxzgNjPRE1zCgEZ50YqKQts
	kT5cAKmo5NNISqVDMld/85bjfJCJyGjKSvBqgS3/CgBiJAgFsiZ29blZYp88PQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2025 09:47:46 +0200
Message-Id: <D9OWUBHID8JT.3FJEJAXYPMT2W@bootlin.com>
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
Subject: Re: [oe-core][PATCHv2 0/3] Display manager proposal for x11 and
 wayland
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250505224801.3181046-1-rs@ti.com>
In-Reply-To: <20250505224801.3181046-1-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkfevhffvuffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfejfedviefhjeeuveeigeeijeduhfegudeutddtteegfeeikeettefhledvudeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhssehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhug
 ihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdprhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 07:47:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216033

On Tue May 6, 2025 at 12:47 AM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> We've recently run into some issues with weston-init attempting to start
> Weston prior to all drm devices being registered. There's not really a
> good, scriptable mechanism to listen in to device registration events
> that works with the existing weston-init package. Well, at least one
> that doesn't involve polling files or introducing more dependency on the
> init system being used.
>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the
> same issue.
>
> I'd like to introduce the following display manager for oe-core, emptty
> [1]. This display manager is, as described upstream, a "Dead simple CLI
> Display Manager on TTY". It supports both x11 and wayland sessions, with
> togglable build parameters to completely remove x11 and pam
> dependencies. It's licensed MIT, which shouldn't be an issue for any
> users. (It is written in Go, if you have opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be
> re-tuned to leverage this display manager and simply add a user and
> emptty config for an autologin session. This can resolve the current
> behavior across init systems without additional scripting, and move some
> development out of this layer.
>
> This lists myself as a maintainer of emptty as well as xserver-nodm-init =
and
> xuser-account since these are currently unassigned and I've reworked them
> significantly here.
>
> Sorry for the delay on this series. I found a few bugs in emptty that I w=
anted
> to address before submitting this officially.
>
> [1] https://github.com/tvrzna/emptty
>
> v2:
> 	- Address spelling issues in commit messages
> 	- Attempt to resolve some test related issues with weston
> 	- Add additional logs to X11 related tests

Hi Randolph,

Thanks for the v2.

However, it looks like we still have an error with the emptty
dependency:

ERROR: Nothing RPROVIDES 'emptty' (but /srv/pokybuild/yocto-worker/qemux86-=
64-x32/build/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb RDEP=
ENDS on or otherwise requires it)
emptty was skipped: incompatible with host x86_64-poky-linux-gnux32 (not in=
 COMPATIBLE_HOST)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/1512

Can you have a look at the issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


