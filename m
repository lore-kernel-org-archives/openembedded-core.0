Received: from mail-bk0-f50.google.com ([209.85.214.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UNSEE-0002jF-R5
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:16:10 +0200
Received: by mail-bk0-f50.google.com with SMTP id jg1so987006bkc.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 10:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=3xix1ObVf29FgMpTw17P29MBnu7+OFvRDhHNRsPceek=;
	b=lz2aVJ5eZMUTVIDRcV7Tv5DapgoZv7YNiO2T5sBv9TL2pt0zdZEoRSc2oUbpdXWtQ/
	iOsiLFDIS4SKmOjqDt/8oU1o4eqkwH2/vQnYzP3ECB5lNKrLtAi6Mf91AYuEELPLu4Eh
	EXoV1gwswXn6jg4KYrpAlNMAbzh47DPn83CKF6Xs2qRvs5oSBo66Cf2Utcehx1/sybHS
	yGJ1wearAleVBE3tjyYb4WV/omXwjsMlCYFcYWiare40/PkKfG8JF9BX1LCR655pUHp8
	M/2WdDD0Gc3D73bIXrhmnGyf0pDcjYDEayiLX5ZZItRdnZyn4zzfVX5stvMaCg0UQf16
	NL+A==
X-Received: by 10.204.237.201 with SMTP id kp9mr2002675bkb.42.1365011939055;
	Wed, 03 Apr 2013 10:58:59 -0700 (PDT)
Received: from ?IPv6:2001:610:612::5c87:177:991a:e764?
	([2001:610:612:0:5c87:177:991a:e764])
	by mx.google.com with ESMTPS id x10sm3605827bkv.13.2013.04.03.10.58.56
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Apr 2013 10:58:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365006329-20964-3-git-send-email-radu.moisan@intel.com>
Date: Wed, 3 Apr 2013 19:58:58 +0200
Message-Id: <825B3AFA-0F5B-45F2-B4DE-D359A1E4414B@dominion.thruhere.net>
References: <1365006329-20964-1-git-send-email-radu.moisan@intel.com>
	<1365006329-20964-3-git-send-email-radu.moisan@intel.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQkFwtJakcY4C4yqx7sry4M8Ls+m+yE4CrkUva+rqzcGnhDAhMWj9D6VOIdSMaZ9/JkUvOBC
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] udev: enable multilib support
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
X-List-Received-Date: Wed, 03 Apr 2013 18:16:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 apr. 2013, om 18:25 heeft Radu Moisan <radu.moisan@intel.com> het =
volgende geschreven:

> Use base_libdir in place of hardcoded /lib
> Fixes [YOCTO #4096]
>=20
> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
> meta/recipes-core/udev/udev.inc |    1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
> index e358d2d..6fd0240 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -76,6 +76,7 @@ FILES_udev-utils =3D "${bindir}/udevadm"
>=20
> do_install_append () {
> 	install -d ${D}${sysconfdir}/init.d
> +	sed -i 's@/lib/udev@${base_libdir}/udev@g' ${WORKDIR}/init
> 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
> 	install -m 0755 ${WORKDIR}/udev-cache =
${D}${sysconfdir}/init.d/udev-cache

NACK! The udev maintainers have been clear that it is always /lib/udev, =
even on 64 bit systems, so you're not fixing a problem, you're creating =
an extra one.=


