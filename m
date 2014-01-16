Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 412CB6E3FF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 19:18:25 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id ex4so1131844wid.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 11:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=7tkxiY1SfYePLYL+nRccOXEcGxsU49El4f+o79NqDWE=;
	b=UApBd/wRJNq0jnjSlfxR4oeQMGnHqOpwU/acdfpmDdZ8Q/mSK4MfoHHMq/X871ghMa
	WpyV8Wy+T5pil1gcQYoHqo7RAN9gx786tPmmmJN/eaIUkrvg8EfHErIc2wncwmwgR+mi
	60NDgQ6XR6BmHIbDkw2BlYF9HJntZ9JI1wUmpj1vBCXoiBTmzKI10z/BWJq01osRJSSA
	xTMZumaupnMzBbOv8eTKjfBrp8rNkwW3wzxO+OWcUvfrXZvSVvOLkiGJBo6ePiAjfkQT
	/c+3gRns/qYfb6Hx2C32I7GE1Adz/kvMej9kOoQmUN7zeFBL0Z+y9NuYhBLjRiqmH4LZ
	Rd3A==
X-Gm-Message-State: ALoCoQloWQvE3cyh0HYFxW8VBhaLoyd03XNPX913s/v9PptElDUl5dc/Qe64Ha5M3H7366ZsIvMB
X-Received: by 10.180.90.37 with SMTP id bt5mr9668014wib.43.1389899905937;
	Thu, 16 Jan 2014 11:18:25 -0800 (PST)
Received: from ?IPv6:2001:610:612::1ce4:f687:f519:79c1?
	([2001:610:612:0:1ce4:f687:f519:79c1])
	by mx.google.com with ESMTPSA id v7sm35194951wix.5.2014.01.16.11.18.24
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 Jan 2014 11:18:25 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
Date: Thu, 16 Jan 2014 20:19:08 +0100
Message-Id: <0B0E8FB1-DD03-44BC-BD59-6DBBBF2D0935@dominion.thruhere.net>
References: <A612847CFE53224C91B23E3A5B48BAC7A5548F1DCE@xmail3.se.axis.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Mailer: Apple Mail (2.1827)
Cc: Phil Blundell <philb@gnu.org>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Maintain backwards compatibility or not for module-base.bbclass
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
X-List-Received-Date: Thu, 16 Jan 2014 19:18:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 jan. 2014, om 14:58 heeft Peter Kjellerstedt =
<peter.kjellerstedt@axis.com> het volgende geschreven:

> Background: Back in September, Richard made a commit to=20
> linux-libc-headers.inc describing why one should not fork the=20
> linux-libc-headers recipe:
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3Dbabbf7a46acaef=
d9b36031483cafce053f607e66
>=20
> As a result I created a local bbclass for our layer called=20
> kernel-headers, which provides a recipe with kernel headers=20
> that match the actually used version of the Linux kernel.
> This was needed for packages that need to access hardware=20
> specific features that are not present in the generic kernel=20
> headers provided by linux-libc-headers.
>=20
> My intention for this class was that it should be generic=20
> enough to be able to upstream it to OE Core.
>=20
> Now, the other day a colleague of mine had a build failure due=20
> to this class. It turned out that even though the class adds a=20
> dependency on virtual/kernel and then uses the files that are=20
> installed to ${STAGING_KERNEL_DIR} when running oe_runmake=20
> headers_install, the command could fail because the=20
> ${STAGING_KERNEL_DIR}/scripts was not populated. After asking=20
> Richard about this, I learned that this is due to problems=20
> with the sstate cache and not knowing whether a 32 bit host or=20
> a 64 bit host was used to generate the files. Thus I also=20
> learned that the scripts are actually built as a result of=20
> building modules.
>=20
> Since I did not want my class to depend on modules having been=20
> built, I looked into modules.bbclass and modules-base.bbclass.=20
> There I found the function do_make_scripts() which is=20
> responsible for building  the kernel scripts. However, the=20
> current setup doesn't lend itself very well to use the=20
> modules-base.bbclass for something other than modules.
>=20
> My idea then was to break this part out into a separate class,=20
> kernel-scripts, which I did. You can find both the=20
> kernel-scripts and kernel-headers classes here:=20
>=20
> =
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dpkj/kernel=
-headers
>=20
> When I showed this to Richard he noted that my change was not=20
> backwards compatible (as I no longer provide the=20
> do_make_scripts() function from the module-base.bbclass).=20
> However, there is nothing besides module.bbclass in OE Core=20
> and meta-oe that use the module-base.bbclass.

Can't do_make_script run as an sstate post function?=20

regards,

Koen=

