Return-Path: <roman@khimov.ru>
Received: from roman.khimov.ru (roman.khimov.ru [82.146.54.17])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1F870057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 19:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khimov.ru;
	s=mail; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Reply-To:To:From;
	bh=B4YcuFUqHrWuJbrW+rtQyRzWCdks+ZAmKuvtZ2zHB28=; 
	b=WdoPMEGbCRs8TiCvh91VplI7aEpnj2AQu8DqiUqWjyV5QjDYhHUna2YTH1+/ExMU8pRNwFMjkNUJEha9Zuz1c5wHjbvhXJU9R+7Ky5D1OtSt/MmB3ozAONNFJ1TSSCiZTknMlk7P+l2bCn9L3p2n0q6sc92vZc/JscjbJ8dQ9UkeLkmG2WS9/STGx8us43GLT8wPnH4TyyuvlpePIQpfQysyexKyD1tuGnf0+aacCjNWvgrj1b+g20sz/nLjHvPlDjR7pq0ewwWAcx1EwpTnN9CmubTFbC0FHIn+051Y1QnYMlm0ez0MT1XPl05FOJVKE2kk8/08UIURMlv5ly2kJA==;
Received: from [93.100.16.104] (helo=masala.hex)
	by roman.khimov.ru with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.84) (envelope-from <roman@khimov.ru>) id 1a9I3m-0003EK-5m
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Dec 2015 22:48:30 +0300
From: Roman Khimov <roman@khimov.ru>
To: openembedded-core@lists.openembedded.org
Reply-To: roman@khimov.ru
Date: Wed, 16 Dec 2015 22:48:25 +0300
Message-ID: <2360766.U5DTSUWlGb@masala.hex>
User-Agent: KMail/4.14.10 (Linux/4.1.13-5-default; KDE/4.14.10; x86_64; ; )
In-Reply-To: <c69d29cd0ed3171613c5b30894a33e24ef29e20b.1450288828.git.mschiffer@universe-factory.net>
References: <cover.1450288828.git.mschiffer@universe-factory.net>
	<c69d29cd0ed3171613c5b30894a33e24ef29e20b.1450288828.git.mschiffer@universe-factory.net>
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] kernel: allow kernel module and firmware installation with ${base_libdir} != "/lib"
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
X-List-Received-Date: Wed, 16 Dec 2015 19:48:32 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

=D0=92 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=B5 =D0=BE=D1=82 16 =D0=B4=D0=B5=
=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2015 19:11:58 =D0=BF=D0=BE=D0=BB=D1=8C=D0=
=B7=D0=BE=D0=B2=D0=B0=D1=82=D0=B5=D0=BB=D1=8C Matthias Schiffer =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclas=
s
> index 4ce1611..8fc1d5d 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -242,6 +242,11 @@ kernel_do_install() {
>  =09=09rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>  =09=09# If the kernel/ directory is empty remove it to prevent QA is=
sues
>  =09=09rmdir --ignore-fail-on-non-empty
> "${D}/lib/modules/${KERNEL_VERSION}/kernel" +
> +=09=09if [ "${base_libdir}" !=3D "/lib" ]; then
> +=09=09=09install -d "${D}${base_libdir}"
> +=09=09=09mv "${D}/lib/modules" "${D}${base_libdir}"
> +=09=09fi
>  =09else
>  =09=09bbnote "no modules to install"
>  =09fi
> @@ -258,6 +263,12 @@ kernel_do_install() {
>  =09[ -e Module.symvers ] && install -m 0644 Module.symvers
> ${D}/boot/Module.symvers-${KERNEL_VERSION} install -d
> ${D}${sysconfdir}/modules-load.d
>  =09install -d ${D}${sysconfdir}/modprobe.d
> +
> +=09if [ "${base_libdir}" !=3D "/lib" ]; then
> +=09=09install -d "${D}${base_libdir}"
> +=09=09mv "${D}/lib/firmware" "${D}${base_libdir}"
> +=09=09rmdir --ignore-fail-on-non-empty "${D}/lib"
> +=09fi
>  }
>  do_install[prefuncs] +=3D "package_get_auto_pr"

I think this hunks are not needed if you're to fix fs-perms.txt.

--=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

