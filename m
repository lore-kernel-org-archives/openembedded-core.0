Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455CBC3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 06:15:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.70046.1747116934429384329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 23:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bRt0NOvP;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98B3D43297;
	Tue, 13 May 2025 06:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747116931;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3EggoVbz4MocyrHwbo4xomJd8AdMX2ehM1IRr/3oVo=;
	b=bRt0NOvPfPh+LgBdtKfeLg8MsNX9c3djfu178Y5NXJtBqyLYxWXkqd8Fwb/ETT1DSWQiHF
	gQb4Lhc/QL6ArxvIR10IBYa9U40AHUly7OAYoAorPOwoZqihR8WQczKYd1kG/3Zo3Q3mqW
	jAznkHYvxaHgA7/KOd/WZ6DyFo21Pc4Way3cgSisWEKnwod7Yem0e49QSXGtjdk9Qrgfto
	PssO9jqtdHIlp1fv8v5HpprQj3Tu6T4MSc8iS3KuP0dxOef4amGO35M/+5DyXo6HMhwXOO
	ozpE1sH860S2whIJiaHPnk1G5kF4qALhhes6psUyRLa+p10/n5Rpd0+Ryoj11g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 May 2025 08:15:28 +0200
Message-Id: <D9UT9GNAPNJ1.29E1A3PUIW2PR@bootlin.com>
Subject: Re: [oe-core][PATCHv2 0/3] Display manager proposal for x11 and
 wayland
Cc: <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
 <ross.burton@arm.com>, <alex@linutronix.de>, <otavio@ossystems.com.br>,
 <kexin.hao@windriver.com>, <afd@ti.com>, <detheridge@ti.com>,
 <denis@denix.org>, <reatmon@ti.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250505224801.3181046-1-rs@ti.com>
In-Reply-To: <20250505224801.3181046-1-rs@ti.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeffeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffgveevteeuteefffefhedtkedvieffffdujedvffehueekuedtkedugeekfedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhssehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfo
 hhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtoheprghlvgigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepohhtrghvihhosehoshhshihsthgvmhhsrdgtohhmrdgsrhdprhgtphhtthhopehkvgigihhnrdhhrghoseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprghfugesthhirdgtohhmpdhrtghpthhtohepuggvthhhvghrihgughgvsehtihdrtghomh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 06:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216395

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

Ok, so I tried again to merge this patch, and I believe I've got new
errors:

RESULTS - xorg.XorgTest.test_xorg_running: FAILED (1.43s)
...
AssertionError: 1 !=3D 0 : Xorg does not appear to be running

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/1579
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/1567
https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/1620
https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/1661
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/1582
https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1589


Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/weston.py", line 63, in test_wayland_info
    self.assertEqual(status, 0, msg=3D'wayland-info error: %s' % output)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 255 !=3D 0 : wayland-info error: failed to create display: =
Connection refused

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/weston.py", line 67, in test_weston_can_initialize_new_wayla=
nd_compositor
    existing_wl_processes =3D self.get_processes_of('weston-desktop-shell',=
 'existing')
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/weston.py", line 32, in get_processes_of
    self.assertEqual(status, 0, msg=3D'Retrieve %s (%s) processes error: %s=
' % (target, error_msg, output))
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 1 !=3D 0 : Retrieve weston-desktop-shell (existing) process=
es error:


Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/weston.py", line 28, in test_weston_running
    self.assertEqual(status, 0, msg=3Dmsg)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
AssertionError: 1 !=3D 0 : Weston does not appear to be running   PID USER =
      VSZ STAT COMMAND

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/runtime/cases/weston.py", line 89, in test_weston_supports_xwayland
    self.assertEqual(status, 0, msg=3Dmsg)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^
AssertionError: 1 !=3D 0 : xwayland does not appear to be running
...
RESULTS - weston.WestonTest.test_wayland_info: FAILED (0.51s)
RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_composit=
or: FAILED (0.30s)
RESULTS - weston.WestonTest.test_weston_running: FAILED (0.78s)
RESULTS - weston.WestonTest.test_weston_supports_xwayland: FAILED (0.49s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1661
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1514


Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/core/decorat=
or/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/no-x11/build/meta/lib/oeqa/runtime/case=
s/weston.py", line 63, in test_wayland_info
    self.assertEqual(status, 0, msg=3D'wayland-info error: %s' % output)
AssertionError: 255 !=3D 0 : wayland-info error: failed to create display: =
No such file or directory
...
RESULTS - weston.WestonTest.test_wayland_info: FAILED (0.52s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/1596
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1545
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2356168/raw_inlin=
e


2025-05-12 21:09:25,962 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'weston-init' (but /srv/pokybuild/yocto-worker/reproducible/build/meta/r=
ecipes-graphics/wayland/weston_14.0.1.bb, /srv/pokybuild/yocto-worker/repro=
ducible/build/meta/recipes-graphics/packagegroups/packagegroup-core-weston.=
bb RDEPENDS on or otherwise requires it)
2025-05-12 21:09:25,962 - oe-selftest - INFO -       weston-init was skippe=
d: Recipe weston-init, package weston-init: system groupname "nopasswdlogin=
" does not have a static ID defined. Add nopasswdlogin to one of these file=
s: /srv/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/fi=
les/static-group
...
2025-05-12 21:09:25,963 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'weston-dev' (but /srv/pokybuild/yocto-worker/reproducible/build/meta/re=
cipes-graphics/wayland/weston_14.0.1.bb RDEPENDS on or otherwise requires i=
t)
...
2025-05-12 21:09:25,963 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'weston' (but /srv/pokybuild/yocto-worker/reproducible/build/meta/recipe=
s-graphics/wayland/weston_14.0.1.bb, /srv/pokybuild/yocto-worker/reproducib=
le/build/meta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RD=
EPENDS on or otherwise requires it)
...
2025-05-12 21:09:25,963 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'weston-examples' (but /srv/pokybuild/yocto-worker/reproducible/build/me=
ta/recipes-graphics/packagegroups/packagegroup-core-weston.bb RDEPENDS on o=
r otherwise requires it)
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1642


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


