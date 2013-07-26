Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 174766A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 07:01:11 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so1842168wgg.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 00:01:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=MkcoPIKWwrBy3R2czlA0FGHikoJeTfCrXgrwe1JwxJk=;
	b=Jt05llf98lh1QyE+IAM/UcmVmreZK9zvO3rRtl4nJWwihvBGNdjSASFMA29LrEIRn4
	PwQN05RNPDRhPpltaFYFGderDbVTQrbervBbl9O4IUwSHse+TWQNsFABP7NafAU5vFvY
	btzm+AMlCZgpjQsrzNWsB3kN96WSLLep/nTfW1hz+fjiTp8sq64f68vaa1+8BMCLpmqM
	rp/UCE5JgD2XTX/cQdlUINLoaChyvfYE73wM4AeZgy/dyAD9HdEeRWzEUXPvTRKaURWZ
	YDRR/0qdn672iom6nHD9JiRY37i+x54Mme6Ei3KYZU0HhJ/gGLF3yGAb3w1iZZTwNb20
	V9XA==
X-Received: by 10.180.83.163 with SMTP id r3mr4640316wiy.10.1374822071706;
	Fri, 26 Jul 2013 00:01:11 -0700 (PDT)
Received: from ?IPv6:2001:610:612::a847:9734:1a85:7bf5?
	([2001:610:612:0:a847:9734:1a85:7bf5])
	by mx.google.com with ESMTPSA id hb2sm2655588wib.0.2013.07.26.00.01.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Jul 2013 00:01:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 26 Jul 2013 09:01:10 +0200
Message-Id: <21EAF1A7-D7BE-4275-9998-C42694B18C43@dominion.thruhere.net>
References: <1374763888-7315-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1508)
X-Gm-Message-State: ALoCoQkrundp+KP+zrHk+uvbPwk3g25dsgq/EI3H37HXg8/u1P9gWZfJb0h7uIygiuh2Wp9O95L/
Subject: Re: [PATCH] util-linux: fix PACKAGECONFIG options
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
X-List-Received-Date: Fri, 26 Jul 2013 07:01:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 jul. 2013, om 16:51 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> The ??=3D operator is too weak and it's setting a non-existent =
PACKAGECONFIG option ('libpam' instead of 'pam').
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-core/util-linux/util-linux.inc | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc =
b/meta/recipes-core/util-linux/util-linux.inc
> index d373cec..3d1198a 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -47,9 +47,9 @@ EXTRA_OECONF =3D "--libdir=3D${base_libdir} =
--disable-use-tty-group \
>                 --enable-libuuid --enable-libblkid --enable-fsck =
--without-udev \
> 		usrsbin_execdir=3D'${sbindir}' \
> "
> -PACKAGECONFIG_class-target ??=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'libpam', '', d)} \
> +PACKAGECONFIG_class-target ?=3D "${@base_contains('DISTRO_FEATURES', =
'pam', 'pam', '', d)} \
>                                 ${@base_contains('DISTRO_FEATURES', =
'systemd', 'systemd', '', d)} "
> -PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, pam,"
> +PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, libpam,"
>=20
> # Respect the systemd feature for uuidd
> PACKAGECONFIG[systemd] =3D "--enable-socket-activation =
--with-systemdsystemunitdir=3D${systemd_unitdir}/system/, =
--disable-socket-activation --without-systemdsystemunitdir"

And of course this will trigger another bug:

|  * check_data_file_clashes: Package util-linux wants to install file =
/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/work/beaglebone-angstro=
m-linux-gnueabi/cloud9-image/1.0-r0/rootfs/usr/bin/su
|       But that file is already provided by package  * shadow

*sigh*=

