Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSiqE-0005m3-8s
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 07:56:38 +0200
Received: by werg55 with SMTP id g55so177905wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 22:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UK3RqIWHeYlU91+lQm2ClhbssEZCQ5ZLinIkYq4b0EA=;
	b=JEft+0yTzG7LJPZ1f9w52c9CzEOVXzvLJ/lVWO2eMRelO3U7S7dkVN9QLlQjWdofKV
	gYhjbE03fDC0lAtrUgNihyeLcLFTlQ3W9n2gucoaHTGOFd208Mn7FPBiR7Bkdq97tcQC
	N33ciHmhyB0LxY54hPK9RFQZFkET81w4tFAMuuiUL0cyC+ZRi3/DuA/tmZXJCk12QczA
	TeZlz4um6j2WvIb4z4b0jSQNpM3bczFq5gzFlgSgvEmIfsyEL4kFdVMxN+4DtZNIu6b5
	UaMpgMdIqa/rZT1sW5+nCplIpH1xMSNvyC63f5UNeRP8HjPV3F1pbkSC5hjx74/+OKER
	inAg==
Received: by 10.180.99.72 with SMTP id eo8mr4218703wib.10.1336715203445;
	Thu, 10 May 2012 22:46:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fo7sm8182005wib.9.2012.05.10.22.46.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 22:46:42 -0700 (PDT)
Date: Fri, 11 May 2012 07:46:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120511054640.GB3166@jama.jama.net>
References: <4FAC3F2F.9000006@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FAC3F2F.9000006@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: setscene and perl -- pathological case
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
X-List-Received-Date: Fri, 11 May 2012 05:56:38 -0000
X-Groupsio-MsgNum: 22048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 10, 2012 at 05:20:31PM -0500, Mark Hatle wrote:
> We've discovered that perl seems to be a pretty bad pathological case for=
 setscene.
>=20
> Easy way to see what I mean:
>=20
> bitbake perl
> bitbake -c clean perl
> time bitbake perl
>=20
> The system isn't doing anything but running the setscene elements to brin=
g perl=20
> from the sstate-cache into the sysroot and related directories.. but it t=
akes a=20
> very long time to do this:
>=20
> real    3m7.430s
> user    0m36.316s
> sys     2m46.742s
>=20
> That is on my 8 core w/ 12 GB of ram system..  (standard SATA disks)
>=20
> Digging into this, I found that the majority of the time is spent in=20
> meta/classes/sstate.bbclass: sstate_installpkg
>=20
> If you look for the three os.system("sed ...  calls, almost all of the 3 =
minutes=20
> is there.  Perl has so many text files with embedded paths that a signifi=
cant=20
> amount of time is spent preparing these files and fixing paths.
>=20
> I did a test and changed the three sed cases into a single sed operation:
>=20
> -            os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g %s" %=20
> (staging_target, sstateinst + file))
> -            os.system("sed -i -e s:FIXMESTAGINGDIRHOST:%s:g %s" %=20
> (staging_host, sstateinst + file))
> -            os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging,=
=20
> sstateinst + file))
> +            os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g -e=20
> s:FIXMESTAGINGDIRHOST:%s:g -e s:FIXMESTAGINGDIR:%s:g %s " % (staging_targ=
et,=20
> staging_host, staging, sstateinst + file))
>=20
> The result:
>=20
> real    1m20.979s
> user    0m19.400s
> sys     1m4.115s
>=20
> This is a very significant performance improvement.  I'm not sure if it's=
=20
> possible to speed this up even more, but it would be nice if we could get=
 things=20
> under a minute.
>=20
> Does anyone see a way we could do this quicker or in a better way to boos=
t=20
> performance?  (One possibility is figure out how to thread the file proce=
ssing=20
> and use available processors...)

I guess it does process for all files in fixmepath file, so try to run
sed on all of them (or chunks) together with xargs like in:
http://git.openembedded.org/openembedded-core/commit/meta/classes/sstate.bb=
class?id=3D94c52d68fc2ce258bcc5b0978ac73413480a1a93

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+sp8AACgkQN1Ujt2V2gBxv9ACgkCIkThQXmrTpYkVfpvMBK/Wt
TDQAn065LgO0MpdJjIPJ884w1nT84X/k
=QaDX
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
