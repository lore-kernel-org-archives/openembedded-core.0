Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 29E6C6AC08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 06:09:47 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x13so345214wgg.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 23:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=7D1byAdzRmzTinji9dEWtsUq7CYAAIeXsFA3Kv2BuMI=;
	b=QK3rquqBJZc2M2SzLFJDugxzpbHKVfnqHZEYKnc+0HHFNFuk76i+RD6+QVcreNEndi
	qlxiduBXtYv3IsZujblgicnsWPuv2hlQoGGAweREze1IRfvsdxXb+LGUX5JfaAGaTq5D
	K3MsJT8qxO80S/J5v4lDIu2JbNineZIE/0Q97l43n5EoXOQeJ8a3niD1mVwbNvWltMiS
	l9ZqpTbZJpI/GnIXPcm9SymJp67SR33vSz9RRUp2E+Xd1rOC78Tb1Vh6ooAowC8y6xHb
	mEfSrl4QHTJoy+h354UpvA11a9epKcukxqtCMajaXVB9Ddo6Ns3h/weBVIXK/4Edme3G
	msIw==
X-Gm-Message-State: ALoCoQkpU3+DnWYwegaAA346vcFHJk5Voi9c6txKyvvHy3TNNbjgg+IIy4VjaTmTfhp2DgvB6RPq
X-Received: by 10.180.207.6 with SMTP id ls6mr1886247wic.28.1414130987747;
	Thu, 23 Oct 2014 23:09:47 -0700 (PDT)
Received: from ?IPv6:2001:610:612::3140:1c82:99ad:ccec?
	([2001:610:612:0:3140:1c82:99ad:ccec])
	by mx.google.com with ESMTPSA id ic4sm811993wid.19.2014.10.23.23.09.46
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 Oct 2014 23:09:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <22cefd15362d8fdc8e8e06324412f606f5feca86.1414121198.git.Qi.Chen@windriver.com>
Date: Fri, 24 Oct 2014 08:09:45 +0200
Message-Id: <E0AE8D91-A863-456F-9F59-BEBE56BCF062@dominion.thruhere.net>
References: <cover.1414121198.git.Qi.Chen@windriver.com>
	<22cefd15362d8fdc8e8e06324412f606f5feca86.1414121198.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: fix systemd-udev-hwdb-update service
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
X-List-Received-Date: Fri, 24 Oct 2014 06:09:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 24 okt. 2014, om 07:58 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>=20
> The new version of systemd has implemented the following feature.
> Opointer.de/blog/projects/stateless.html
>=20
> As a result, the systemd-udev-hwdb-update.service would always run
> at first boot. This will cause failure if the target device doesn't
> have enough storage space. Besides, as we run `udevadm hwdb --update' =
as
> a postinst of udev-hwdb at rootfs time, there's no need to run this
> again at system start-up.
>=20
> The purpose of this patch is as follows.
> If `udev hwdb --update' fails at rootfs time, =
systemd-udev-hwdb-update.service
> is executed at first boot; otherwise, the service is not executed.
>=20
> This patch achieves the above goal by setting CondistonNeedsUpdate to
> "/etc/udev" in the service file, and creating /etc/udev/.updated file =
if the
> postinst succeeds.

Ehm, /etc/udev can be created by other packages, why not test for the =
file you create?

regards,

Koen


>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> meta/recipes-core/systemd/systemd_216.bb | 18 +++++++++++++++---
> 1 file changed, 15 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_216.bb =
b/meta/recipes-core/systemd/systemd_216.bb
> index ebf9395..cd81818 100644
> --- a/meta/recipes-core/systemd/systemd_216.bb
> +++ b/meta/recipes-core/systemd/systemd_216.bb
> @@ -149,6 +149,10 @@ do_install() {
>=20
> 	# Enable journal to forward message to syslog daemon
> 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=3Dyes/' =
${D}${sysconfdir}/systemd/journald.conf
> +
> +	# Make systemd-udev-hwdb-update to check /etc/udev
> +	cp =
${D}${systemd_unitdir}/system/systemd-udev-hwdb-update.service =
${D}${sysconfdir}/systemd/system
> +	sed -i -e =
's#ConditionNeedsUpdate=3D/etc#ConditionNeedsUpdate=3D/etc/udev#g' =
${D}${sysconfdir}/systemd/system/systemd-udev-hwdb-update.service
> }
>=20
> do_install_ptest () {
> @@ -355,10 +359,18 @@ ALTERNATIVE_PRIORITY[runlevel] ?=3D "300"
>=20
> pkg_postinst_udev-hwdb () {
> 	if test -n "$D"; then
> -		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} =
hwdb --update \
> -			--root $D
> +		if ${@qemu_run_binary(d, '$D', =
'${base_bindir}/udevadm')} hwdb --update \
> +			--root $D; then
> +			touch $D/etc/udev/.updated
> +		else
> +			exit 1
> +		fi
> 	else
> -		udevadm hwdb --update
> +		if udevadm hwdb --update; then
> +			touch $D/etc/udev/.updated
> +		else
> +			exit 1
> +		fi
> 	fi
> }
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


