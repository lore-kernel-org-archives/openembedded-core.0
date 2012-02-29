Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S2hAC-0002kl-EO
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 11:53:40 +0100
Received: by eaae1 with SMTP id e1so1174841eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 02:45:12 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.51.15 as permitted sender) client-ip=10.14.51.15; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.51.15 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.51.15])
	by 10.14.51.15 with SMTP id a15mr2455357eec.27.1330512312091 (num_hops
	= 1); Wed, 29 Feb 2012 02:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=qVXZUJryXDPCouIWW2A28xJ80paPrJobiCAeK1hJCT8=;
	b=B3gLZ0fXx7jMVCtsmp8EkQiiubr8R/TEqiRjEVyysrxKfiwW2u4mt7zvZuORMH7pgv
	mZ/RFqAQW8XaBLfLfsHrdOB7iOQlv3lx7+dPdFEAN5/wc374yx7foUZmCbTO/9gWamCm
	mITiiIQkTIUl7kE78X3rICRgRIxbxVzswrRyA=
Received: by 10.14.51.15 with SMTP id a15mr1999236eec.27.1330512311967;
	Wed, 29 Feb 2012 02:45:11 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm81428327eei.3.2012.02.29.02.45.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 02:45:10 -0800 (PST)
Date: Wed, 29 Feb 2012 11:45:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120229104508.GA3844@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: MACHINE overrides in meta/recipes-gnome/tasks/task-sdk-gmae.inc
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
X-List-Received-Date: Wed, 29 Feb 2012 10:53:40 -0000
X-Groupsio-MsgNum: 18198
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline

--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

task-sdk-gmae.inc has couple of MACHINE overrides
SDK-EXTRAS ?=3D ""
SDK-EXTRAS_qemux86 ?=3D " valgrind lttng-ust-dev"
SDK-EXTRAS_qemux86-64 ?=3D " lttng-ust-dev"
SDK-EXTRAS_qemuppc ?=3D " lttng-ust-dev"
SDK-EXTRAS_qemuarm ?=3D " lttng-ust-dev"

but
meta/recipes-gnome/tasks/task-core-standalone-gmae-sdk-target.bb
meta/recipes-gnome/tasks/task-core-sdk-gmae.bb

don't set PACKAGE_ARCH to MACHINE_ARCH, so those those SDK-EXTRAS
overrides should be changed to TARGET_ARCH overrides or add them for all
and exlude only arch which doesn't support valgrind || lttng-ust (seems
like only mips is missing from supported archs).

It also makes meta-toolchain-gmae-1.0-r6.do_populate_sdk.sigdata machine sp=
ecific:

OE qemux86-64copy@ ~/oe-core $ bitbake-diffsigs stamps.dir.qemux86-64/x86_6=
4-oe-linux/meta-toolchain-gmae-1.0-r6.do_populate_sdk.sigdata.fc96d8788ee32=
af391fbb4dc4dfa3928 stamps.dir.qemux86-64copy/x86_64-oe-linux/meta-toolchai=
n-gmae-1.0-r6.do_populate_sdk.sigdata.f84bb156663caf2f71645227179d424d
basehash changed from 8bf3e5df1a9bf2efd8c0c698d44f9e30 to 37f334758d4f818e8=
58387d110a1c7b7
Variable TOOLCHAIN_CONFIGSITE_SYSROOTCACHE value changed from /OE/oe-core/t=
mp-eglibc/sysroots/qemux86-64/usr/share/x86_64-oe-linux_config_site.d to /O=
E/oe-core/tmp-eglibc/sysroots/qemux86-64copy/usr/share/x86_64-oe-linux_conf=
ig_site.d
Variable TIME value changed from 084543 to 085638
Dependency on task linux-yocto_3.2.bb.do_package_write was added with hash =
15cf120732c6515987793e39c29cb7f2
Dependency on task bzip2_1.0.6.bb.do_package_write was added with hash 6329=
9b3c095759819803e3b60c1cd4bd
Dependency on task update-modules_1.0.bb.do_package_write was added with ha=
sh 266fe284dfd606af98605bcff02f06d8
Dependency on task elfutils_0.148.bb.do_package_write was added with hash 3=
1516d4ca2606a60f23b8a38de93d88d
Dependency on task binutils_2.22.bb.do_package_write was added with hash 91=
222ff473a45a15187bfcedff21288d
Dependency on task module-init-tools_3.16.bb.do_package_write was added wit=
h hash 3485d645a9458516601e0c91dfd130d5
Dependency on task lttng-ust_1.9.4.bb.do_package_write was added with hash =
cd40a9f559d53c8bf874d69bb62482cf
Dependency on task liburcu_0.6.7.bb.do_package_write was added with hash 22=
805959bb795b93fcfc87428f1164fe
Hash for dependent task gstreamer_0.10.35.bb.do_package_write changed from =
14dfff89952fba8f744946fc815931eb to 161c80d99567099d372247d584778df1
Hash for dependent task task-core-standalone-gmae-sdk-target.bb.do_package_=
write changed from e8ed16a445ff08d391380d4ed7f06ea5 to aa427a924b50e0a09ec1=
4124cfac02a6
Hash for dependent task meta-environment.bb.do_package_write changed from d=
78bee1dbc70cb372a6cf4f07b254391 to a3c3dd9dde1635a7e74a04c687387238
Hash for dependent task task-cross-canadian.bb.do_package_write changed fro=
m c245cbf31a79c3983198ac73a70988b2 to 425abc28049ab1e5653c680141db7d8e

I'll send patch excluding meta-environment.bb.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9OAbQACgkQN1Ujt2V2gByMoQCggzDgOplQ5NDEQZnz01VOey9K
BDwAn1CE5KNcWDQ1Kc1NXmM7MSuN0+o4
=ErBZ
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
