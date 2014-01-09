Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD6960071
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2014 23:19:18 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id c41so1607540eek.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2014 15:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EP00vbWYCfH9nyQIblVduYFQIs9bPnqkk0qLWyzvqIg=;
	b=y3HC27UsWdg67UPo1k3LcEENpEsNTZTv7tfliXPcsOLDOwpRJ47StMf/Y2MQB0q2Vi
	bDkk3XL5zACDHFXwPRFOojiCmndWp2t0T2N7eS23EQmA7q+W7St1bFiPgNjocrzVQ8a7
	FZLaxM3zC7FTfI2WPcw0dgUJMbR2wLvIh2NhmHU9OAVIBqh0yyDemZVhSq7meTSVxR1d
	14lulbIpLskNtqlPVQmu8cgf3cWT7Qs4p1274KyssCVx1NZc53lXRt74mcNrckD8EpbQ
	WgxXSIRlAgRITXXVMr6ifjPpw6HRONRosrqA2Gxgy3mQMzdcQ+K1LNJFOVt4W948YqyG
	yn9w==
X-Received: by 10.14.115.133 with SMTP id e5mr5656652eeh.91.1389309558988;
	Thu, 09 Jan 2014 15:19:18 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o13sm9726638eex.19.2014.01.09.15.19.17
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 15:19:18 -0800 (PST)
Date: Fri, 10 Jan 2014 00:19:30 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20140109231930.GJ3709@jama>
References: <cover.1386700055.git.mark.hatle@windriver.com>
	<52CEFD48.5070901@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52CEFD48.5070901@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] RFC: Implement deterministic uid/gid
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
X-List-Received-Date: Thu, 09 Jan 2014 23:19:19 -0000
X-Groupsio-MsgNum: 48790
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nF3lCw8ylmf6enK0"
Content-Disposition: inline

--nF3lCw8ylmf6enK0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 01:49:28PM -0600, Mark Hatle wrote:
> I have updated the git://git.yoctoproject.org/poky-contrib mhatle/uidgid =
to the=20
> latest oe-core master.
>=20
> I haven't seen any comments on this RFC yet.  Does anyone have any opinio=
n=20
> either way on the code referenced here?

I wanted to do more tests and find some smaller reproducer, but I'm
interested in this series.

What I'm seeing in our builds is that when you compare
files-in-image.txt report from independent (not reusing sstate-cache)
builds with exactly the same metadata, group owners aren't
deterministic.

Random files in image getting owned by "messagebus" group etc., these
issues went away when useradd class creating these ad-hoc groups had
parameter for fixed gid or when I've added these groups directly to
base-passwd group.master.

Is this the same problem you're addressing in this patchset?

> I'm confident patch 01/02 should be added to master.
>=20
> The patch 02/02 works properly in all of my testing and does implement su=
pport=20
> for 'deterministic uid/gid' with dynamic passwd/group file construction d=
uring=20
> package install.  The code is only activated if USERADD_REWRITE_PARAMS is=
 set to=20
> '1', so it's low risk -- but it does add a fairly large chunk of code to =
be=20
> maintained over time.
>=20
> --Mark
>=20
> On 12/10/13, 12:31 PM, Mark Hatle wrote:
> > The following series implements the deterministic uid/gid setting for a
> > distribution.  Currently when a filesystem is generated the uid/gid val=
ues
> > are generally set at install time, so the install order determines what
> > the actual uid/gid values become.  In order to create a deterministic u=
id/gid
> > set, that still dynamically constructs the passwd/group file, we add an
> > option to read a special passwd/group file to allow the system to deter=
mine
> > the values.
> >
> > It uses the existing parameters, and the values from the special passwd=
/group
> > files to reconstruct the parameter set to ensure these items are fully
> > defined with static values.
> >
> > The first patch (01/02) is generally applicable.  It fixes a real bug in
> > the way the user/group adds occur today within the system.
> >
> > Patch 02/02 implements the new functionality.
> >
> >
> > The following changes since commit 8505f0fa48cc79d51616b923c6e2c778c4b4=
6a44:
> >
> >    libmatchbox: use PACKAGECONFIG (2013-12-10 14:13:01 +0000)
> >
> > are available in the git repository at:
> >
> >    git://git.yoctoproject.org/poky-contrib mhatle/uidgid
> >    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/ui=
dgid
> >
> > Mark Hatle (2):
> >    useradd.bbclass: Fix build time install issues
> >    useradd.bbclass: Add ability to select a static uid/gid automatically
> >
> >   meta/classes/useradd.bbclass         | 247 ++++++++++++++++++++++++++=
++++++++-
> >   meta/conf/local.conf.sample.extended |  24 ++++
> >   2 files changed, 265 insertions(+), 6 deletions(-)
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nF3lCw8ylmf6enK0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLPLoIACgkQN1Ujt2V2gBycuQCghGGKLT3tMt0ORR19hhLg/iLz
mWEAoKdnzvyFJ4f2I4H5qDp/t5I+e5Uy
=95vq
-----END PGP SIGNATURE-----

--nF3lCw8ylmf6enK0--
