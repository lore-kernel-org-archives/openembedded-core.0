Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TAH5F-0002uM-O5
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 11:12:09 +0200
Received: by wgbdr1 with SMTP id dr1so250161wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Sep 2012 01:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yk9JFOVv370rFTmnewGz53e1owub91/wl+nGfzxyvp8=;
	b=pXxLOTmAdT3H+rkFUGmr+pTNRz9zyx1Tp5jEfn1lQwjHYlFrWjfh/ILhCSV8YQghNP
	MtTImtZJ3J16t+93utgcDL4VugxO2jYQbs9qYgxB1kGoz5R7seK+w8qlGfURZZO5Q5Gh
	lDQ1wFsgW9w+rsPI+fOCblk2aT4m7F6E+hRfpvblYT+JFul7JKu1Crg9Oc5j6LItVuAd
	Hf+GQNwTCVEL8XO1cZp+UQXrZH6ZI0P/xRdbL81N6ntdn6eRRS+RXfpsDkOySE3i6VeR
	glnHh4edcCrQbsf5dFPJLmZyIcfIvzJCXXTKVMqUdBILvkfUtw/RexhaChoFBYv4H9zM
	eRwA==
Received: by 10.180.74.33 with SMTP id q1mr3879189wiv.4.1347094782955;
	Sat, 08 Sep 2012 01:59:42 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id ef5sm5567195wib.3.2012.09.08.01.59.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 08 Sep 2012 01:59:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1347054694-21086-1-git-send-email-mark.hatle@windriver.com>
Date: Sat, 8 Sep 2012 10:59:44 +0200
Message-Id: <06A25D3A-DBBF-4127-9505-FD0BF5DD4E84@dominion.thruhere.net>
References: <1347054694-21086-1-git-send-email-mark.hatle@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQlZvAWG4LPxjTxxA/x7Wp0xd+bjTXW71B1JGU0u2l81sX6USC8AVeq0QLRrUzmGBlA34nDf
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3] base-files: provide a mechanism to skip creation of the hostname file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Sep 2012 09:12:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 sep. 2012, om 23:51 heeft Mark Hatle <mark.hatle@windriver.com> het =
volgende geschreven:

> From: Mark Asselstine <mark.asselstine@windriver.com>
>=20
> The existence of a /etc/hostname file causes any hostname provided on
> the kernel command line or via dhcp to be overwritten by the
> initscripts 'init.d/hostname.sh'. This change allows you to set a
> value of "" for 'hostname' which will skip the creation of the
> /etc/hostname file by the base-files package.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/recipes-core/base-files/base-files_3.0.14.bb |   12 +++++++-----
> 1 files changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb =
b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 6bab040..cda13f4 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -107,10 +107,12 @@ do_install () {
> }
>=20
> do_install_basefilesissue () {
> -	if [ -n "${MACHINE}" -a "${hostname}" =3D "openembedded" ]; then
> -		echo ${MACHINE} > ${D}${sysconfdir}/hostname
> -	else
> -		echo ${hostname} > ${D}${sysconfdir}/hostname
> +	if [ "${hostname}" !=3D "" ]; then
> +		if [ -n "${MACHINE}" -a "${hostname}" =3D "openembedded" =
]; then
> +			echo ${MACHINE} > ${D}${sysconfdir}/hostname
> +		else
> +			echo ${hostname} > ${D}${sysconfdir}/hostname
> +		fi
> 	fi
>=20
> 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir} =20
> @@ -144,5 +146,5 @@ FILES_${PN}-doc =3D "${docdir} =
${datadir}/common-licenses"
>=20
> PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -CONFFILES_${PN} =3D "${sysconfdir}/fstab ${sysconfdir}/hostname"
> +CONFFILES_${PN} =3D "${sysconfdir}/fstab ${@['', =
'${sysconfdir}/hostname'][(d.getVar('hostname', True) !=3D '')]}"

MIssing PR bump=


