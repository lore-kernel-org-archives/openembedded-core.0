Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SAjDS-00026Q-Pi
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:42:14 +0100
Received: by wera1 with SMTP id a1so1870940wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 07:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VeLsANmCBTTIokQeALaglQ2DG2HP0jIZzWhnYXeqbOw=;
	b=KbRf/C891xwUYDFpx8JUMOt+2gMFffxPoQLpEqmZeA2PC3z+o420/OS0ovw4blC/Z+
	KRG70O5Q8uFXRfhJj2xzkGsEI0R/1184/bllleQN/YUTyxMquVjZhN6UGjtLyH04lV9w
	/bKPhEOjOSLOGn0wr32OzIU/cTOuWY2rgjbpW7auT53DMDl4hEYhLS8fU1YUgeIA6Q+c
	b8WuFxUQMb1wfA73NJKMxt+KJRHmRfspfXWPSNz1wVG7Kpuzx7W5WJ8xNnbyanL8kOli
	kaPx77lPkzJWe+2waj6XcuBo/vF2KS5SVOPVRFft1n5ANsh6NzzxMSfAH4CfsA7tNnCG
	CuPQ==
Received: by 10.180.97.41 with SMTP id dx9mr5618850wib.9.1332426799854;
	Thu, 22 Mar 2012 07:33:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm5684129wib.1.2012.03.22.07.33.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 07:33:18 -0700 (PDT)
Date: Thu, 22 Mar 2012 15:33:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120322143318.GJ4010@jama.jama.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
	<16657624.ejDoFzWrx1@helios>
	<0E615ACC-662B-408B-BDAE-032723A55D15@dominion.thruhere.net>
	<6449205.EIHV3lzBd1@helios>
MIME-Version: 1.0
In-Reply-To: <6449205.EIHV3lzBd1@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [RFC v2][PATCH 1/3] buildhistory: record all builds
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
X-List-Received-Date: Thu, 22 Mar 2012 14:42:14 -0000
X-Groupsio-MsgNum: 19429
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/qIPZgKzMPM+y5U5"
Content-Disposition: inline

--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 22, 2012 at 02:25:38PM +0000, Paul Eggleton wrote:
> On Thursday 22 March 2012 11:35:30 Koen Kooi wrote:
> > After a few more days of usage I'm going to create a follow-up patch th=
at
> > will do:
> >=20
> > 1) reinstate the global git status --porcelain and make a single, empty
> > commit if nothing changed instead of N empty commits. 2) either parse t=
he
> > output of git status or re-run it to see which top level entries need to
> > get committed and only run 'git add ; git commit' on those.
> >
> > That will keep tracking all builds, but will be less noisy. But it will=
 be
> > slightly slower when the OS doesn't cache the git status, but I decided
> > that I can personally live with that.
> >=20
> > So what do you think about that?=20
>=20
> Well, avoiding >1 empty commits sounds good. I'm happy to go with your=20
> assessment as you're more likely to be observing actual performance than =
me=20
> (I'm not really monitoring the performance of buildhistory on our autobui=
lder,=20
> only the output).

Koen please make it to reuse output..

git status --porcelain takes ages here and even more on my 2nd buildhost
so even with 2nd run just after 1st probably faster I hope it will be
worth reparsing.

OE @ ~/shr-core/tmp-eglibc/buildhistory $ du -sh .
520M    .
and after git gc..
OE @ ~/shr-core/tmp-eglibc/buildhistory $ du -sh .
378M    .

> FYI I didn't comment on the splitting into separate commits patch earlier=
=20
> because it doesn't really bother me either way. I do think people will fi=
nd it=20
> easier to use the buildhistory-diff tool rather than looking at the git l=
og=20
> directly (or the web-based equivalent when I finish that.); but I'm happy=
 to=20
> continue supporting those that prefer to read the log.

same here

> > If you like the idea, would you like it as follow up or as a respin of =
the
> > series?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9rOC4ACgkQN1Ujt2V2gByJBwCdEGL+HymCjneO0xEvTvhStEHO
bN8AoKusyr3jsOQJH21ULVEIj5/Q8kYF
=IPIP
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--
