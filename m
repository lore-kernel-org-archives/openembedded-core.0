Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TnxKq-000639-BI; Wed, 26 Dec 2012 21:12:29 +0100
Received: by mail-ee0-f54.google.com with SMTP id c13so4497243eek.41
	for <multiple recipients>; Wed, 26 Dec 2012 11:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sTNc2QC3Z6PG3fKptbKGtQnttr7l3KFJdizihBSpd6A=;
	b=W04pQieGa6jssKB1TgrzZ1NT9R4T/dGzA2780edlXCqUlWsCS8txdGKAhsz1DFzyZ8
	6PFZx6m/sT6Qgq7RUMVLlfX+udE54rmn/jkaBrKzJ/VBdJExL7r1c33QLTFdJVS/H8j5
	0DKZcThqL832KcW7EooV3tI6b13ehMCzsKLVP2M1nx2fiDXDPqc7dSecPstHcBEtCS3e
	ywLe2AJjozNdROkHNmvfniJBBs0OvH1IxoY+uPLhFyEP1EnWmD6Fp5bSMgDCHQ9cPc2F
	ttgKDP6HXd68JOIY0ey2nSAR0gIVMze2ycVOZwlfrMfVR07lUOdLGP7y9p7AM4D8LXvL
	3LhA==
X-Received: by 10.14.0.71 with SMTP id 47mr71368898eea.19.1356551843064;
	Wed, 26 Dec 2012 11:57:23 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id v46sm55258206eep.1.2012.12.26.11.57.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Dec 2012 11:57:22 -0800 (PST)
Date: Wed, 26 Dec 2012 20:57:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20121226195721.GA3777@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121224091242.GS8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 26 Dec 2012 20:12:31 -0000
X-Groupsio-MsgNum: 33101
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6c2NcOVqGQ03X4Wi"
Content-Disposition: inline

--6c2NcOVqGQ03X4Wi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2012 at 10:12:42AM +0100, Martin Jansa wrote:
> Few more are failing when it's built without DISTRO setting (and also wit=
hout gold)
> http://jenkins.nas-admin.org/job/shr-core-branches_world_qemuarm/28/conso=
leFull
>   meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb, do_=
package_write_ipk
>=20
> Systemd issues seems the same as Eric reported from denzil:
> 09:51:56 < JaMa|Off> this is with latest master and I've reported it too =
while ago.. looks like some conflict in bitbake
>                      cache or something like that
> 09:52:44 < JaMa|Off> ERROR: Error executing a python function in=20
> /home/jenkins/shr/shr-core-branches/shr-core/meta-openembedded/meta-syste=
md/recipes-core/systemd/systemd_git.bb:
> 09:52:45 < JaMa|Off> OSError: [Errno 2] No such file or directory:=20
> '/home/jenkins/shr/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-=
linux-gnueabi/udev/182-r3/packages-split/udev-systemd'
> 09:53:09 < ericben> JaMa|Off: I also have this one yes during build.=20
> 09:53:09 < JaMa|Off> python task from systemd recipe is trying to use wor=
kdir from udev recipe

I've reproduced this issue with 3 very simple recipes and filled it
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D3645

--6c2NcOVqGQ03X4Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDbVqEACgkQN1Ujt2V2gByyywCeOc8rDOOWU6zsJ09QVe8r5Yx4
AIEAoLheTygJFX51tClUlmaT2c8rT2kn
=Luix
-----END PGP SIGNATURE-----

--6c2NcOVqGQ03X4Wi--
