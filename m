Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UeUIu-0006yY-GF
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 19:55:25 +0200
Received: by mail-pd0-f174.google.com with SMTP id 14so1226378pdj.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=V0b/I0xI7B0yAtkKlXZ9BmT3KJM3IzAFmUr4LICAbBQ=;
	b=EGcZcyWhoOOk/LUdQQ6WjyNmR0oxcSVVbjhQTT2QN7S39qZQ1nP9pz5BxLOhpceg7O
	wJ/8Nweay1HaXh7L44IxLoWMueutjs2jJa1FSiFSJZmSLu73pBY1YQZC1DxBp3farRJo
	ELqV/8/cZLvE3D7Wwglqv4H/26DKwRh238LFBQu1bbmL6CZJxxP4guyITSYB4FaAfdr5
	0ksQe/vK+Lh0DGQLzilX0fnnQXMNorSCasBV9394pxm4folvFMZjJ3YU5oJ4dYJJ1oqJ
	bf148bp1Q7md2tnp2jhy/tvagG5EFBa6eaZq2DejDGgx91SizGE3C1JiheQhTNWBiYBE
	NLjA==
X-Received: by 10.68.244.134 with SMTP id xg6mr55810210pbc.188.1369071423329; 
	Mon, 20 May 2013 10:37:03 -0700 (PDT)
Received: from sa-nc-common3-43.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	qi1sm26647047pac.21.2013.05.20.10.37.01 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 May 2013 10:37:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1369052565-26170-1-git-send-email-mac@mcrowe.com>
Date: Mon, 20 May 2013 10:37:08 -0700
Message-Id: <B646CCF4-2E7C-4135-AD1D-D72E0827C779@gmail.com>
References: <1369052565-26170-1-git-send-email-mac@mcrowe.com>
To: Mike Crowe <mac@mcrowe.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Add dependency on binutils
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
X-List-Received-Date: Mon, 20 May 2013 17:55:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 20, 2013, at 5:22 AM, Mike Crowe <mac@mcrowe.com> wrote:

> Compiling the Linux kernel requires binutils; kernel.bbclass uses
> INHIBIT_DEFAULT_DEPS so it had better depend on binutils explicitly.
>=20
> (The lack of this dependency isn't always a problem because binutils
> is required to build gcc-cross but if gcc-cross is reconstructed from
> the sstate cache then gcc-cross's dependency on binutils-cross is
> ignored due to being in the safe dependency list in
> setscene_depvalid.)

what good is cross-gcc without cross-binutils. Could it be fixed in gcc =
recipes instead so
it pulls binutils-cross=20

>=20
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Acked-by: Phil Blundell <philb@gnu.org>
> ---
> meta/classes/kernel.bbclass |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ffb0b11..38973db 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
> inherit linux-kernel-base module_strip kernel-module-split
>=20
> PROVIDES +=3D "virtual/kernel"
> -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native =
depmodwrapper-cross"
> +DEPENDS +=3D "virtual/${TARGET_PREFIX}binutils =
virtual/${TARGET_PREFIX}gcc kmod-native depmodwrapper-cross"
>=20
> # we include gcc above, we dont need virtual/libc
> INHIBIT_DEFAULT_DEPS =3D "1"
> --=20
> 1.7.10.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



