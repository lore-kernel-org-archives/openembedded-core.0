Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S21Gf-0002LV-R2
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 15:09:33 +0100
Received: by wibhq12 with SMTP id hq12so215362wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 06:01:07 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.95.34 as permitted sender)
	client-ip=10.180.95.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.95.34 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.95.34])
	by 10.180.95.34 with SMTP id dh2mr11551028wib.15.1330351267521
	(num_hops = 1); Mon, 27 Feb 2012 06:01:07 -0800 (PST)
Received: by 10.180.95.34 with SMTP id dh2mr9089690wib.15.1330351267435;
	Mon, 27 Feb 2012 06:01:07 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id p10sm22507330wic.0.2012.02.27.06.01.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 06:01:06 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1330346629.4593.20.camel@ted>
Date: Mon, 27 Feb 2012 15:01:05 +0100
Message-Id: <3980D06F-534C-41A8-8EB5-49F692FB9E66@dominion.thruhere.net>
References: <1330346629.4593.20.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk4Fz+QlKZETwFjoFL/dKTmERradZkl8nb1ZkHpa0eFSf8M7ww3GKWLmBQG9WSdYzimD/a2
Subject: Re: [PATCH] image_types: Refactor compression code into a generic compression solution
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
X-List-Received-Date: Mon, 27 Feb 2012 14:09:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 13:43 heeft Richard Purdie het volgende geschreven:

> The current approach of adding each different compressed image type =
doesn't
> scale. This patch changes the code so compressed images for each form =
are
> automatically available using the form <type>.<compression type> in
> IMAGE_FSTYPES. This doesn't change any existing externally visible =
behaviour
> and the image generation process becomes more efficient as a result =
too.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>=20
> +COMPRESSIONTYPES =3D "gz bz2 lzma xy"
> +COMPRESS_CMD_lzma =3D "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
> +COMPRESS_CMD_gz =3D "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > =
${IMAGE_NAME}.rootfs.${type}.gz"
> +COMPRESS_CMD_bz2 =3D "bzip2 -k ${IMAGE_NAME}.rootfs.${type}"
> +COMPRESS_CMD_xy =3D "xz -k -c ${XZ_COMPRESSION_LEVEL} =
--check=3D${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type}"
> +COMPRESS_DEPENDS_lzma =3D "xz-native"
> +COMPRESS_DEPENDS_gz =3D ""
> +COMPRESS_DEPENDS_bz2 =3D ""
> +COMPRESS_DEPENDS_xy =3D "xz-native"

s/xy/xz/g

regrds,

koen=


