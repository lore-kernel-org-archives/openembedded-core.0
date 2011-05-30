Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QR0y2-00043X-5c
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 13:49:06 +0200
Received: by wye20 with SMTP id 20so2955200wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 04:45:54 -0700 (PDT)
Received: by 10.227.198.197 with SMTP id ep5mr4941349wbb.33.1306755954406;
	Mon, 30 May 2011 04:45:54 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et5sm2984301wbb.33.2011.05.30.04.45.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 04:45:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1306581686-17625-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 30 May 2011 13:45:51 +0200
Message-Id: <CDCFAC7D-DE84-4829-87AE-3C500170F642@dominion.thruhere.net>
References: <1306581686-17625-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC][PATCH] sysvinit: make pidof usuable in a standalone setting
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
X-List-Received-Date: Mon, 30 May 2011 11:49:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 28 mei 2011, om 13:21 heeft Koen Kooi het volgende geschreven:

> Currently it's a symlink to killall5:
>=20
> $ dpkg-deb -c sysvinit-pidof_2.88dsf-r1_armv7a.ipk  | grep pidof
> lrwxrwxrwx root/root         0 2011-05-27 11:05 ./bin/pidof.sysvinit =
-> /sbin/killall5
>=20
> The point of the pidof subpackage was to have a pidof without needing =
sysvinit, this restores that behaviour. The trade-off is a 14KiB =
(armv7a, uncompressed) increase in size.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>=20
> The alternative is to just move 'killall5' into the pidof subpackage =
and to RDPEPENDS_${PN} +=3D "${PN}-pidof"
>=20
> The change in this patch was the least amounts of edits to the recipe, =
let me know which way you prefer.
>=20
> meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb =
b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index 7d5e936..f0e73bb 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -5,7 +5,7 @@ SECTION =3D "base"
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D751419260aa954499f7abaabaa882bbe \
>                     =
file://COPYRIGHT;endline=3D15;md5=3D349c872e0066155e1818b786938876a4"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE =
.conf.
> # Set PACKAGE_ARCH appropriately.
> @@ -100,7 +100,7 @@ EOF
> 		ln -s ../init.d/stop-bootlogd =
${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
> 	done
> 	mv                 ${D}${base_sbindir}/init               =
${D}${base_sbindir}/init.${PN}
> -	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${PN}
> +	cp ${D}${base_sbindir}/killall5 ${D}${base_bindir}/pidof.${PN}
> 	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
> 	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
> 	mv ${D}${base_sbindir}/shutdown =
${D}${base_sbindir}/shutdown.${PN}
> --=20
> 1.6.6.1
>=20



