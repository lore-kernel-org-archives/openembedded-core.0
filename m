Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tld4v-0004qc-SZ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 11:10:14 +0100
Received: by mail-ea0-f169.google.com with SMTP id a12so1226933eaa.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 01:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=XzSudVnyyHbtWokdYGwXIK4/BpbS+1SE3D6vDR7nOGM=;
	b=FhAGHZdQiRBAXcRkmdZNykLIGNyROx3iFoQTT09mILpgXzHdrr4N6MqEK8HCd2hfpF
	CiQh1S7h7TO2SBfRiPbSvhA2Ls0LbxYxuVVNmBWfLsXEHzfsyk2mqp16qed3wfRiHl1i
	FNALZye3V71W4vI9CliTuyH48QY6ieEiFk0cyISPafvvtcbTZM2/N3p0z7TDdv6v14ZH
	hc0GhyV+CfLMMDS29uvA4mjVtuAE72CYObuTrhzYN58jOY6rkLKg2HtT+CqqyPK35At6
	0gr3GEPnPu+Zvhu2NCuejkjKKhzcjQRiyqpx0YjFEFSBEwc/26UUNMqPutz7LQqB6pll
	NC9Q==
X-Received: by 10.14.215.6 with SMTP id d6mr21975854eep.40.1355997329616;
	Thu, 20 Dec 2012 01:55:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q44sm14411848eep.5.2012.12.20.01.55.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 01:55:28 -0800 (PST)
Date: Thu, 20 Dec 2012 10:55:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20121220095529.GF14543@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: PRserv issues?
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
X-List-Received-Date: Thu, 20 Dec 2012 10:10:14 -0000
X-Groupsio-MsgNum: 32918
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VuQYccsttdhdIfIP"
Content-Disposition: inline

--VuQYccsttdhdIfIP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm trying to use PRserv, according to
https://wiki.yoctoproject.org/wiki/PR_Service
I've used:
PRSERV_HOST =3D "localhost"
PRSERV_PORT =3D "10001"
USE_PR_SERV =3D "1"
"Bitbake itself will take care of starting and stopping the server."

Expecting that PRSERV_PORT is just TCP port and 10001 will work the same
as 0 from wiki. It should be written on wiki that localhost:0 has special m=
eaning.

lib/prserv/serv.py:
def is_local_special(host, port):
    if host.strip().upper() =3D=3D 'localhost'.upper() and (not port):

With 10001 it failed later with:
ERROR: Can NOT get PRAUTO, exception [Errno 111] Connection refused
ERROR: Function failed: package_get_auto_pr
ERROR: Logfile of failure stored in: /OE/oe-core/tmp-eglibc/work/armv5te-oe=
-linux-gnueabi/qtbase/5.0.0-r0.0/temp/log.do_package.11135
ERROR: Task 10 (/OE/oe-core/meta-qt5/recipes-qt/qt5/qtbase_5.0.0.bb, do_pac=
kage) failed with exit code '1'

So I've tried to disable PRserv completely, again assuming that
USE_PR_SERV controls whole PRserv use, setting USE_PR_SERV =3D "0"
to finally build qtbase and new error:
ERROR: PRservice localhost:10001 not available

I know it's my fault I haven't read the source first, but maybe wiki
should be more updated a bit.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VuQYccsttdhdIfIP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDS4JEACgkQN1Ujt2V2gBxJMwCgpBGk5LoxYyyv563kZX96pNyO
yM0AniLfGXtqLsAv7ueG6CuxoBbdpZcz
=wA7n
-----END PGP SIGNATURE-----

--VuQYccsttdhdIfIP--
