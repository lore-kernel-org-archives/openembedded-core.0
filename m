Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Swwco-0002Y5-S2
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:43:42 +0200
Received: by ghbz2 with SMTP id z2so7909414ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=wH6G7acy65IloT8Bm7b4NJjMTmhWoxFJUCmvs8+lDjM=;
	b=BPZarhicmm6NIU95jx0CHXH7PIADXfkPEtk9pBfg36DdT12RAyNxK2UcREVyY2cp+M
	cxOyUTe4oino15JUIyMirth3qNmcPmOnyPlEX3DhOruLkOq+5HKxOl0UZXXId0WRaalm
	LrFFoJ/te2m3VNQ5nyM+p4or2sbjn4piVlELeM6Mn7RcJA5uimtW+FwaD1OqjgMosAVT
	mCt0xfBpZvKc8LbzvonRZXdPRfoteIMMEBNypp0z2qYuYdia8siAmciSnyaqxWGjV/Dx
	UFpK/GFaCMlVSLd/yedwLPprtxDx5P7vVT/BLYSWRH9FFodssgOuUOLNMTAIh4Ow7syc
	LwLA==
Received: by 10.60.24.4 with SMTP id q4mr16067530oef.50.1343917922783;
	Thu, 02 Aug 2012 07:32:02 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id
	kc5sm5924987obb.21.2012.08.02.07.32.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 07:32:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1343909390-23651-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 2 Aug 2012 07:32:02 -0700
Message-Id: <C0E6E020-9EA8-4B90-B6FA-A6B99121857C@gmail.com>
References: <20120802115012.GO16306@jama.jama.net>
	<1343909390-23651-1-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
Subject: Re: [PATCH] u-boot.inc: fix regexp used when ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 14:43:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 2, 2012, at 5:09 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> * with old regexp it wasn't reentrant, causing stuff like this:
>  -LD     =3D $(CROSS_COMPILE)ld
>  +LD     =3D $(CROSS_COMPILE)ld.bfd.bfd
>  -LDR    =3D $(CROSS_COMPILE)ldr
>  +LDR    =3D $(CROSS_COMPILE)ld.bfd.bfdr
>  when do_compile was reexecuted, also breaking LDR variable and
>  =
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-bsp/u-boot/=
u-boot/0001-config-Always-use-GNU-ld.patch
>  when it was used together with u-boot.inc from oe-core (meta-ti is =
using own u-boot.inc)
>=20
> * This patch is also better solution to ld-is-gold problem then regexp =
in metadata.

It would be rather beneficial to import the u-boot patch to accommodate =
gold from meta-ti
this helps in creating a uniform solution to same problem. u-boot patch =
should be upstreamed too.

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> meta/recipes-bsp/u-boot/u-boot.inc |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc =
b/meta/recipes-bsp/u-boot/u-boot.inc
> index 42bdde9..a8642f0 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -34,7 +34,7 @@ SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
>=20
> do_compile () {
> 	if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', =
'ld-is-gold', '', d)}" =3D "ld-is-gold" ] ; then
> -		sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' =
config.mk
> +		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' =
config.mk
> 	fi
>=20
> 	unset LDFLAGS
> --=20
> 1.7.8.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



