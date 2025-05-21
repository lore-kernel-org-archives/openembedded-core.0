Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DC6C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 15:59:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.2773.1747843135892857588
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 08:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ojGeuEYx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A007443B6C;
	Wed, 21 May 2025 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747843133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpZbwLRQ/LWCtt7gdr+do0/VeOBodoylQwrSbDaZCFs=;
	b=ojGeuEYxRDG6/iR1E88vfXvvYhNPsireX7tJnuGK7TSgwOn+FpQDyRC7ihOJaw8mcvsuVW
	8bBzfWqG825EIceRaXyOMT5XyalgChvOrXmjPvbprm7WYKr+bg6vyQZO9MelN1lxbeQVIB
	zTB18AeOAw8Rg53VyzGwlI1nW+rUCtM1/KQr2Xozym9YeBlFCWMo5ADw6ts9Sq/Rld+gId
	8StPUhIDtHoJ8jACzdiSb+EkZG1H/Qw+MQcg4uFNj2wrVBCzmIy8YGHSKErV4tiVuTcBMR
	+n6AF/vGjv4AF24TXNFDIjJOH7yEzLJO57t1fTdRojoTA63gRiBb3Sb1epEEzw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 May 2025 17:58:52 +0200
Message-Id: <DA1YOI4L8TYX.ALF8S230UTO1@bootlin.com>
Subject: Re: [oe-core][PATCHv6 0/5] Display manager proposal for x11 and
 wayland
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250520233935.740242-1-rs@ti.com>
In-Reply-To: <20250520233935.740242-1-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefhedtucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffgveevteeuteefffefhedtkedvieffffdujedvffehueekuedtkedugeekfedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhssehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhru
 ghivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdprhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 15:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217046

On Wed May 21, 2025 at 1:39 AM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> We've recently run into some issues with weston-init attempting to start =
Weston
> prior to all drm devices being registered. There's not really a good, scr=
iptable
> mechanism to listen in to device registration events that works with the
> existing weston-init package. Well, at least one that doesn't involve pol=
ling
> files or introducing more dependency on the init system being used.
>
> I also see there is also a lot of scripting around starting X11,
> xserver-nodm-init, that (from my limited review) should experience the sa=
me
> issue.
>
> I'd like to introduce the following display manager for oe-core, emptty [=
1].
> This display manager is, as described upstream, a "Dead simple CLI Displa=
y
> Manager on TTY". It supports both x11 and wayland sessions, with togglabl=
e build
> parameters to completely remove x11 and pam dependencies. It's licensed M=
IT,
> which shouldn't be an issue for any users. (It is written in Go, if you h=
ave
> opinions about that.)
>
> With this, both weston-init and the xserver-nodm-init packages can be re-=
tuned
> to leverage this display manager and simply add a user and emptty config =
for an
> autologin session. This can resolve the current behavior across init syst=
ems
> without additional scripting, and move some development out of this layer=
.
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
> v3:
> 	- Reset AUTOLOGIN_MAX_RETRY to the default value of 2. When running
> 	  under QEMU the first auth attempt almost always fails.
> v4:
> 	- Add a tmpfile entry for the x11 domain socket directory.
> 	- Remove some scripts associated with weston-init that were being
> 	  shipped with weston
> v5:
> 	- Move tmpfile data to individual files
> 	- Add explicit entries for these in the FILES variable
> v6:
> 	- Do not attempt to ship a tmpfiles.d entry in libx11
>

Hi Randolph,

Thanks for the version, but again a previously seen error. Sorry for
the bad news :(

RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.31s)
...
AssertionError: 1 !=3D 0 : Xorg does not appear to be running   PID USER   =
    VSZ STAT COMMAND

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1637
https://autobuilder.yoctoproject.org/valkyrie/#/builders/95/builds/1638
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1649

I will drop the patch on my side, but I will keep the a-full build
running, we might see some other failures in the coming hours:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1630


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


