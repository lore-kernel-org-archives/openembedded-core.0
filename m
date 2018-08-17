Return-Path: <lukma@denx.de>
X-Greylist: delayed 314 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Aug 2018 21:03:33 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id D094C7915E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 21:03:33 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 41sbC00wQPz1qvTn
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 22:58:20 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 41sbC005Tbz1qqkJ
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 22:58:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024) with ESMTP id 78uL0CyoN9RY
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 22:58:19 +0200 (CEST)
X-Auth-Info: XNQ/BGAQEvkB6JRzyvHh4AHPdB94bL/wn9wKgoAbnHA=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 22:58:19 +0200 (CEST)
Date: Fri, 17 Aug 2018 22:58:11 +0200
From: Lukasz Majewski <lukma@denx.de>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20180817225811.53b55f2d@jawa>
Organization: denx.de
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Question regarding docker and sumo
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
X-List-Received-Date: Fri, 17 Aug 2018 21:03:34 -0000
X-Groupsio-MsgNum: 114894
Content-Type: multipart/signed; micalg=pgp-sha256;
	boundary="Sig_/nFtio3LwbAfRx1K3Hx+sgIK";
	protocol="application/pgp-signature"

--Sig_/nFtio3LwbAfRx1K3Hx+sgIK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

I do port yocto/OE from 2.3 to 2.5.1

For packagegroups-foo-common I do see following error=20

cd <workdir>/packagegroup-foo-common/1.0-r0/sstate-build-package/=20

as expected, there are needed directories: package packages-split
pkgdata=20

The problem is in sstate_create_package () at
poky/meta/classes/sstate.bbclass

To be precise in:
tar: tar -czf temporary.tgz.XXXXXXX package packages-split pkgdata=20

tar (child): gzip: Cannot exec: Invalid argument=20
tar (child): Error is not recoverable: exiting now=20


Tar version tar (GNU tar) 1.28 (the same for both versions on host).
Also 'env' command shows 'unlimited' size for pipes.


ls -alh <install>/poky/build-lwn/tmp/hosttools and there is a link=20
tar -> /bin/tar=20

The sumo runs inside docker container (with recommended ubuntu). The
only change is from pyro to sumo.


To be even more strange - the sumo version of BSP builds correctly when
run natively on Debian 9=20


The problem seems to be with sumo and docker.

| rt_sigprocmask(SIG_SETMASK, [], NULL, 8) =3D
0 | write(4, "packages-split/packagegroup-lwn-"..., 10240) =3D -1 EPIPE
(Broken pipe) | --- SIGPIPE {si_signo=3DSIGPIPE, si_code=3DSI_USER,
si_pid=3D15063, si_uid=3D1000} --- | +++ killed by SIGPIPE
+++                                                                        =
  =20

Any idea on how to solve (or debug) this issue further? Apparently
something is closing the pipe between tar and gzip...

Thanks in advance for any hints :-)


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/nFtio3LwbAfRx1K3Hx+sgIK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlt3NuMACgkQAR8vZIA0
zr2/kQf/e1keNAYJG/4fVLbYDpy0jlTMzzfxalnHcBtrjiirJTcAoQv2mM6Y35hT
Utnq+R4t5gOqB7BDoOFeZfoHN2sCwLoZTuQi1izpbRpYdLo0gjmr4U6N+ntMD3ms
OctDmQNZI19PAV6FPBvQ6xE4vsTPnEQMzTevzvCLfdV7YIz+LsUULMCp5chAHsfX
hJlGvMQubUJuzz+ymYDbHHAGkpkewExqrTuN3Rcp+eeoz6okHhWUEfSYv74LDcVB
Tgh2+GwDdHT/ucoSzVGqkbeCwpONFR/OaNjqsKGKRbGN2eVRxD5Rz72zNT3BXRUZ
d0L51UfP8ZH99H/bqD4+RoyW/KdHgw==
=ClR2
-----END PGP SIGNATURE-----

--Sig_/nFtio3LwbAfRx1K3Hx+sgIK--
