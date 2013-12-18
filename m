Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4388660D03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 07:53:55 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id l9so2876869eaj.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 23:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=oeNsMmAvYbTHW/Ls9B2zdKkTssIrqMXU4uAEJAC8YuA=;
	b=L/y56YgiefHTrSjd01Z9VgnmuGiXkwrDiYFXvYf7eneT+l+De2CmRm7sguTF+xIYM6
	fiOa8L4S60Yzuiq5v1imylJa9wXU/X4X2SPjQ3FPomWExS3daEh3vZVWFfz4Q4tAwCR/
	MFi6AWTb40yJyWGGQwGO2LbWV/B+i+qMjSHu8ZOECP5RRZytM3OVRlWudI9EEKco+4FU
	07O3IXskEsQP7xA0Wb5dn+8zKlkGop9eIlKT8Q2ShIRMzN+jxEIBtsWvEwJR0EDAXBhW
	pOIzLJZcCj6QiaRsUtbYFVuiSWad5U/XhqddfnETbSWpeZo2BNnnYZGGQgEPUcdcD/ER
	nejA==
X-Gm-Message-State: ALoCoQncpu4LcgkHSF61dOj6YkXlj7+r5+VAXu7y4fNGOnZwDxhl2o9AZKP834csyaeCpJ4qgrtl
X-Received: by 10.14.29.66 with SMTP id h42mr27417732eea.4.1387353235397;
	Tue, 17 Dec 2013 23:53:55 -0800 (PST)
Received: from [172.20.0.138] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id o1sm60020648eea.10.2013.12.17.23.53.53
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Dec 2013 23:53:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1d839acafb980cad80c7f6b7179d965c095d8c15.1387352773.git.Qi.Chen@windriver.com>
Date: Wed, 18 Dec 2013 08:53:50 +0100
Message-Id: <1E5A9F5D-5734-46B9-A331-B4FC852A58B3@dominion.thruhere.net>
References: <cover.1387352773.git.Qi.Chen@windriver.com>
	<1d839acafb980cad80c7f6b7179d965c095d8c15.1387352773.git.Qi.Chen@windriver.com>
To: Qi.Chen@windriver.com
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] image.bbclass: add ability to set systemd default target
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
X-List-Received-Date: Wed, 18 Dec 2013 07:53:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 dec. 2013, om 08:49 heeft Qi.Chen@windriver.com het volgende =
geschreven:

> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add ability to set the default target for systemd images.
>=20
> The default value for the target is derived from checking whether
> IMAGE_FEATRUES

typo

> contains 'x11-base' or not. Each image could override
> this value in its own recipe. For now, we don't need to do any change,
> because all images that support graphical environment has 'x11-base'
> in its IMAGE_FEATRUES.

typo

And you're missing the actual SYSTEMD_DEFAULT_TARGET in the description. =
If it only works on images, please to something like =
IMAGE_SYSTEMD_DEFAULT_TARGET

>=20
> [YOCTO #3816]
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> meta/classes/image.bbclass |   10 ++++++++++
> 1 file changed, 10 insertions(+)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index c595721..4c63bc2 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -186,6 +186,9 @@ IMAGE_MANIFEST =3D =
"${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
> ROOTFS_POSTPROCESS_COMMAND =3D+ "write_image_manifest ; "
> # Set default postinst log file
> POSTINST_LOGFILE ?=3D "${localstatedir}/log/postinstall.log"
> +# Set default target for systemd images
> +SYSTEMD_DEFAULT_TARGET ?=3D '${@base_contains("IMAGE_FEATURES", =
"x11-base", "graphical.target", "multi-user.target", d)}'
> +ROOTFS_POSTPROCESS_COMMAND +=3D '${@base_contains("DISTRO_FEATURES", =
"systemd", "set_systemd_default_target; ", "", d)}'
>=20
> # some default locales
> IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> @@ -596,6 +599,13 @@ postinst_enable_logging () {
> 	echo "LOGFILE=3D${POSTINST_LOGFILE}" >> =
${IMAGE_ROOTFS}${sysconfdir}/default/postinst
> }
>=20
> +# Modify systemd default target
> +set_systemd_default_target () {
> +	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/systemd/system -a -e =
${IMAGE_ROOTFS}${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ]; =
then
> +		ln -sf =
${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} =
${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
> +	fi
> +}
> +
> # Turn any symbolic /sbin/init link into a file
> remove_init_link () {
> 	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


