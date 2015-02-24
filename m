Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id DFC5671633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 20:48:29 +0000 (UTC)
Received: by pabkq14 with SMTP id kq14so38840766pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=/CAD6YKNDUof97hnbkJ/55QKlloUkHRrt9PbxCqVBHw=;
	b=SKRLg+uNYkSi9ra4Mr4JYZ9kjwd+gLlQqgsf2Ehy87Fi/btNR5Y4X/51MSyO6B3FlS
	QO48sT/CH9wpk6i6fBQ+yIfHGiYZwM0+dWsEgpWi7htW8vJcYXM12FeKq5AMLCz2ydwO
	a03MWlbBWNSDJU/xUZOo0pmdg6soBoi9HC3KJ8/bX7PIH2HQG2HuPU0pUDQZBZlbZQiB
	/7gNx5+8UF//Ur1J79Rkt3wlQ/5f8kLBMao0uTN8aU6gF3NPGmH6n1MXlUhvQfwL1/EJ
	cUIOAmECVlrq88eot4CwzYiCOZBXAiIigQgjoBepgpF3zgJ6OGSMuKCUT3CZHIMfJyFq
	R4VQ==
X-Received: by 10.70.92.109 with SMTP id cl13mr31811190pdb.124.1424810911368; 
	Tue, 24 Feb 2015 12:48:31 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:dce0:85c5:10b5:32ac?
	([2601:9:3580:84c:dce0:85c5:10b5:32ac])
	by mx.google.com with ESMTPSA id
	v14sm39076963pbs.11.2015.02.24.12.48.30
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Feb 2015 12:48:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
Date: Tue, 24 Feb 2015 12:48:29 -0800
Message-Id: <1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
References: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Tue, 24 Feb 2015 20:48:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Feb 24, 2015, at 10:07 AM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20
> systemd has a build-dependency on util-linux for libmount, and =
util-linux has an
> optional build dependency on systemd.
>=20
> The features in util-linux that enabling systemd gives you are:
> * lslogins can show recent journal entries from the user
> * uuidd can use socket activation and has a service file
> * fstrim has a service file
> * logger can write journal entries
>=20
> These are not worth the overhead of maintaining two util-linux recipes =
to
> bootstrap the cycle, so disable systemd support in util-linux.

I feel we are going out of way here since now on systemd based systemd =
you have to undo this change
partly via re-introducing service files in some fashion
how about just building and packaging uuidd and fstrim separately ?

atleast it should be reported to util-linux maintainers.

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-core/util-linux/util-linux.inc |    5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux.inc =
b/meta/recipes-core/util-linux/util-linux.inc
> index b4f51e9..3d8a4d0 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -48,8 +48,7 @@ SHARED_EXTRA_OECONF =3D "--disable-use-tty-group \
>=20
> EXTRA_OECONF =3D "${SHARED_EXTRA_OECONF} --libdir=3D${base_libdir}"
>=20
> -PACKAGECONFIG_class-target ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
> -                                =
${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} "
> +PACKAGECONFIG_class-target ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
> PACKAGECONFIG[pam] =3D "--enable-su --enable-runuser,--disable-su =
--disable-runuser, libpam,"
>=20
> # Respect the systemd feature for uuidd
> @@ -117,7 +116,7 @@ RDEPENDS_${PN}_class-nativesdk =3D ""
>=20
> RPROVIDES_${PN}-dev =3D "util-linux-libblkid-dev =
util-linux-libmount-dev util-linux-libuuid-dev"
>=20
> -SYSTEMD_PACKAGES =3D "${PN}-uuidd ${PN}-fstrim"
> +#SYSTEMD_PACKAGES =3D "${PN}-uuidd ${PN}-fstrim"
> SYSTEMD_SERVICE_${PN}-uuidd =3D "uuidd.socket uuidd.service"
> SYSTEMD_AUTO_ENABLE_${PN}-uuidd =3D "disable"
> SYSTEMD_SERVICE_${PN}-fstrim =3D "fstrim.timer fstrim.service"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


