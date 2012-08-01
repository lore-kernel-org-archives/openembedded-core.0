Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwSwV-0002RW-5i
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 09:02:03 +0200
Received: by wibhm11 with SMTP id hm11so3201425wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2012 23:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=LUf5CArhsLJ2KhmwLxjvBL7rmGYz2rLUYkTFE3o90CA=;
	b=l+q1ZWHwkQlDY+I5tKB8ATLCeJimqBdMQFIeplEDaAJqt0muQDJgBUPn2rGD2fJUqz
	r2SeMOHPZSyBJIX2RlFJUn98GmM8afiFVbwwhtHTRNAtLy/goGKRCfJzEamOayv6sRoT
	lAEZnZZXmfvv++r9HNXP1PkSmNtMREUTdARUdJuz85kyqr3AZFot05RoPZFNiC7GHVpU
	9gpwrHuQ9YeJGArB1gv+IhCiIckjVoqGZXXgecEnimzJPPVyYSHNeAbG3LTgxKrOiJPF
	gR5/z5ObhahuLTZXUUJX9s7flE/AhRfRK/ISybRwZq9NYgn2R0oofRff/dK1WeR7T6R+
	MH6g==
Received: by 10.180.100.37 with SMTP id ev5mr13910674wib.5.1343803825286;
	Tue, 31 Jul 2012 23:50:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm10786792wiz.4.2012.07.31.23.50.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jul 2012 23:50:24 -0700 (PDT)
Date: Wed, 1 Aug 2012 08:50:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801065021.GC15199@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Wed, 01 Aug 2012 07:02:03 -0000
X-Groupsio-MsgNum: 26600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Content-Disposition: inline

--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

this commit:

reexecuting do_compile in u-boot causes .bfd being appended multiple=20
times and resulting in errors like:
/bin/bash: arm-oe-linux-gnueabi-ld.bfd.bfd.bfd: command not found

Regex should be updated or patch like this:
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dblob;f=3Dmeta-n=
okia/recipes-bsp/u-boot/u-boot/0001-config-Always-use-GNU-ld.patch;h=3D2564=
d1d456d46651778aec9113cb2515f035ba90;hb=3DHEAD
applied instead of sed, especially if someone sends it upstream=20
(maybe it's already resolved there - I haven't checked)

commit 2e79fcd673dadeab6358fe22d47c8534c14de03e
Author: Otavio Salvador <otavio@ossystems.com.br>
Date:   Sun Apr 22 15:01:32 2012 -0300

    u-boot.inc: fix compilation when using 'gold' as linker

    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index 0445c34..a13eddc 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -36,6 +36,10 @@ SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
 SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"

 do_compile () {
+       if [ "${@base_contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold=
', '', d)}" =3D "ld-is-gold" ] ; then
+               sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' conf=
ig.mk
+       fi


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAY0a0ACgkQN1Ujt2V2gByIjACeJPmW8dIj/TkoCaXgABs0Ayov
tMwAn23XvCgkrgAYaN2SXZCk2pctWPli
=WyL+
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
