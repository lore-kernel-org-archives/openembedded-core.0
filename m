Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TeTq7-0008Rz-5q
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 17:53:23 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so310202bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 08:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Xp7hBszHJ8Sh8tZUqXyQlu0dRY094/mxprqvXZ8N7Vk=;
	b=bS4Ulrx4byModEsxa19loFemBGY+lrqI02a7U/Dz+AxVnnwjkgvi2fbcex8pPNrhqJ
	QD0S3ISI/0udAlaeCAopczZvafhj2fsIQWY1sNDbuhGqzSsi+RwxXEHzGaDXdXmU7PnW
	V0MYJD/NK2AwxQ5mSWizS5rAu/tKIwyFuZ0SCRrM500iMvaf9Tq/kJNBHiaDwMTCnl/7
	T/etXjNCXNavbcJv3584u1OgrMD01laN6O6dj11lQBX5LX8yaPzyNPtCai/rkZXU+gFm
	ifoqKRz2CtqJH2G1QKpTw1tY7o1+HiS74iA9SywFAhRuTHO86a9KVD5mHSoqZexDu9yc
	es9Q==
Received: by 10.204.12.202 with SMTP id y10mr593100bky.51.1354293545324;
	Fri, 30 Nov 2012 08:39:05 -0800 (PST)
Received: from [172.20.0.22] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id 18sm3950402bkv.0.2012.11.30.08.39.02
	(version=SSLv3 cipher=OTHER); Fri, 30 Nov 2012 08:39:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1353509074-16375-1-git-send-email-koen@dominion.thruhere.net>
Date: Fri, 30 Nov 2012 17:39:03 +0100
Message-Id: <4294A763-939F-4201-BF2A-DE11519DD740@dominion.thruhere.net>
References: <1353509074-16375-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQm4S+syejCB3dQdS69kwdsmP5E8aNsM6l5hMXeVvrrzEDQ+Tpu78iZwzwbyCVoD0+i0YX4T
Subject: Re: [PATCH] image classes: use PN for depends, not IMAGE_BASE_NAME
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
X-List-Received-Date: Fri, 30 Nov 2012 16:53:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 21 nov. 2012, om 15:44 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> Some images override IMAGE_BASE_NAME in the recipe causing targets =
using image-{live,vmdk} to fail.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/classes/image-live.bbclass |    2 +-
> meta/classes/image-vmdk.bbclass |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/image-live.bbclass =
b/meta/classes/image-live.bbclass
> index 2f3261e..bfb59f8 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -10,6 +10,6 @@ LABELS_append =3D " ${SYSLINUX_LABELS} "
> ROOTFS ?=3D "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>=20
> do_bootimg[depends] +=3D "${INITRD_IMAGE}:do_rootfs"
> -do_bootimg[depends] +=3D "${IMAGE_BASENAME}:do_rootfs"
> +do_bootimg[depends] +=3D "${PN}:do_rootfs"
>=20
> inherit bootimg
> diff --git a/meta/classes/image-vmdk.bbclass =
b/meta/classes/image-vmdk.bbclass
> index 736d1d7..6f7df3f 100644
> --- a/meta/classes/image-vmdk.bbclass
> +++ b/meta/classes/image-vmdk.bbclass
> @@ -8,7 +8,7 @@ SYSLINUX_LABELS =3D "boot"
> LABELS_append =3D " ${SYSLINUX_LABELS} "
>=20
> # need to define the dependency and the ROOTFS for directdisk
> -do_bootdirectdisk[depends] +=3D "${IMAGE_BASENAME}:do_rootfs"
> +do_bootdirectdisk[depends] +=3D "${PN}:do_rootfs"
> ROOTFS ?=3D "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>=20
> # creating VMDK relies on having a live hddimg so ensure we
> --=20
> 1.7.7.6
>=20



