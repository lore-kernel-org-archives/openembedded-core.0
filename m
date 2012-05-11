Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SSpP7-0005RB-Vd
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 14:57:06 +0200
Received: by wgbdr1 with SMTP id dr1so2290322wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 05:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Gq/m3SgrGbLhRWPGZ+OARGl+RF1qbepYijhmupjz6BI=;
	b=aHRxW8rvL7tcShvvrQur8mH9fXegke5lkEiMmM6e7riBW8NBuvBjtWwI5kD5gL452i
	7/Mrt5O2DAjL7I++6z/lzoRiYRJ3LrzhI+AM7j/mWifJMZT6Tz+KqlflJxYHlLJ/2ukE
	9wvoRtSJounZfCkRW9ff4DuauMwoZIAOF8rTs7bqr0J0clF/92KAzJswm9oJniYcb/LK
	JVRjvY6wPL93vDkVJPQddGOCFniLcU/tWJNdU74V5eDDI++Fyb/9WeHQdqE63LodZjj/
	K4PuJCTOs5Dp0W9rZX7dFRWiaxVGc/VceSbAU2Tvd7uzQbLpcP2CLRphoC8TI21KuWN7
	RWKg==
Received: by 10.180.99.195 with SMTP id es3mr7468535wib.12.1336740430754;
	Fri, 11 May 2012 05:47:10 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff2sm16812231wib.9.2012.05.11.05.47.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 May 2012 05:47:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9f0168b7a33fbfe7920ee449f4cc34d4ba09ea17.1336517492.git.raj.khem@gmail.com>
Date: Fri, 11 May 2012 14:47:08 +0200
Message-Id: <38B85660-128A-4ECB-9707-6D0E5F17A903@dominion.thruhere.net>
References: <a74c229046eacab9ea8b8189ddc763e18fcc05e9.1336517492.git.raj.khem@gmail.com>
	<9f0168b7a33fbfe7920ee449f4cc34d4ba09ea17.1336517492.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkUO0x1RvoHiUk8euywFcmT0pxBjqn5AVhJUxbxByJ7takxk7prdreco2bZ7Ru/nK+3pMZr
Subject: Re: [PATCH 3/3] kmod: Use base_libdir for installing libkmod
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 May 2012 12:57:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 00:53 heeft Khem Raj het volgende geschreven:

> This also helps avoid QA errors about binaries
> accessing contents from /usr/lib
>=20
> Also fixes emptry libkmod problem since now
> the files are installed in expected place
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-kernel/kmod/kmod_git.bb |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb =
b/meta/recipes-kernel/kmod/kmod_git.bb
> index 4c860f0..fed068f 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -16,7 +16,7 @@ RCONFLICTS_libkmod2 +=3D =
"module-init-tools-insmod-static module-init-tools-depmod
> # autotools set prefix to /usr, however we want them in /bin and /sbin
> bindir =3D "${base_bindir}"
> sbindir =3D "${base_sbindir}"
> -# libdir =3D "${base_libdir}"
> +libdir =3D "${base_libdir}"

That breaks udev because the .pc is in the wrong place:

[koen@revo Angstrom]$ tar ztvf =
build/sstate-cache/sstate-kmod-armv7a-angstrom-linux-gnueabi-8-r0.1-armv7a=
-2-183860d867b80d514ca2f42ac90501a4_populate-sysroot.tgz
[..]
-rw-r--r-- koen/koen       205 2012-05-10 23:31 lib/pkgconfig/libkmod.pc




