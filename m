Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SYAeT-0007go-LL
	for openembedded-core@lists.openembedded.org;
	Sat, 26 May 2012 08:39:02 +0200
Received: by wibhn14 with SMTP id hn14so133107wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2012 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5zbKo7UY5+oLm1Jf2t3IHcqvqCyp3z6N1YeIotqTOQ8=;
	b=kPDmBNa3UgAOy3trQoQgS77ouaa2wJFEHYkI58r0dG25vcojl3U5ULp58D8sjvvgYp
	7q9EjB9FaQ/yJnyuP6TMQ0N+I2uHLyt0QcZ2PmGLW9VTF/e3P+C18wFIos/aDozVhleH
	6KqqKKf9E+OUZKJzgmGf+Fn9hlUCb4fR7vzsMH7uMQJJDN3bGPp83EtPnW81bw+l2ODr
	zn7JvGdotS7Epub3QktuFFFm1YQkCOTvKRPXmVnmnQaV4EumyEx115tkhzOrYM9xitlM
	yOKS+gLZiep2jloxpx+tRVOkSnVx51Pey8BbeauhCGY3ZB0tL2WEEdXypjDPrcV4fsIR
	baiw==
Received: by 10.216.208.89 with SMTP id p67mr759835weo.155.1338013723439;
	Fri, 25 May 2012 23:28:43 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k8sm3853292wia.6.2012.05.25.23.28.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 23:28:42 -0700 (PDT)
Date: Sat, 26 May 2012 08:28:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20120526062847.GF3138@jama.jama.net>
References: <cover.1337933617.git.liezhi.yang@windriver.com>
	<fad645aa59e8cc5634500b35bc607e0b61dc997f.1337933617.git.liezhi.yang@windriver.com>
	<6CC0CB11-A526-457C-AC54-2D7C67E38DE2@dominion.thruhere.net>
	<20120525113057.GD3138@jama.jama.net>
	<4FC04443.1090708@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4FC04443.1090708@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Sat, 26 May 2012 06:39:02 -0000
X-Groupsio-MsgNum: 22834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1Ow488MNN9B9o/ov"
Content-Disposition: inline

--1Ow488MNN9B9o/ov
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 26, 2012 at 10:47:31AM +0800, Robert Yang wrote:
>=20
>=20
> On 05/25/2012 07:30 PM, Martin Jansa wrote:
> > On Fri, May 25, 2012 at 01:19:55PM +0200, Koen Kooi wrote:
> >>
> >> Op 25 mei 2012, om 12:02 heeft Robert Yang het volgende geschreven:
> >>
> >>> There is a bug if we:
> >>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
> >>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
> >>>
> >>> Then several pkgs in deploy/ipk/i586 would be installed to crownbay's
> >>> image even if there is one in deploy/ipk/core2 and we have set the
> >>> core2's priority higher than i586, when the version in deploy/ipk/i58=
6 is
> >>> higher. This doesn't work for us, for example, what the crownbay need=
 is
> >>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
> >>>
> >>> This is caused by opkg's selecting mechanism, if there are more than =
one
> >>> candidates which have the same pkg name in the candidate list, for
> >>> example, the same pkg with different versions, then it will use the l=
ast
> >>> one which is the highest version in the list, this doesn't work for u=
s,
> >>> it should respect to the arch priorities in such a case.
> >>
> >> This is a serious break with the current opkg behaviour and I don't th=
ink it's an improvement. Needing different versions for non machine specifi=
c packages indicates a more serious bug elsewhere.
> >
> > It's not the same use-case as those 2 above, but what I don't like on
>=20
> Hi Martin,
>=20
> They are the same cases:-), I think that this patch has also fixed your p=
roblem,

No, at least not completely the same.

I would prefer to upgrade foo-1.0-r1_armv4t temporary until
foo-1.0-r1_armv7a gets available in feed and that won't happen with your
patch AFAIK.

with your patch:
If you have bar-1.0 which has to be MACHINE_ARCH and in 2.0 bar
developers find way to detect and use all machine capabilities in
runtime, recipe maintainer will switch to TUNE_ARCH, then=20
foo-1.0_nokia900.ipk won't be ever upgraded to foo-2.0_armv7a.ipk=20
and that's bad.

Cheers,

> the foo-1.0_armv7a will be kept now.
>=20
> // Robert
>=20
> > current opkg behaviour is that it doesn't "reinstall" the package with
> > the same version when it gets available in arch with higher priority.
> >
> > e.g. I have armv7a device which has feed urls for armv4t and armv7a
> > (armv7a of course with higher priority).
> >
> > foo-1.0 in both feeds armv4t armv7a
> >
> > opkg update&&  opkg install foo ->  foo-1.0_armv7a
> >
> > distro builder publish foo-1.0-r1 sofar only in armv4t feed
> >
> > opkg update&&  opkg upgrade ->  foo-1.0_armv7a is upgraded to foo-1.0-r=
1_armv4t)
> >
> > distro builder publish foo-1.0-r1 also to armv7a feed
> >
> > opkg update&&  opkg upgrade ->  nothing, but "upgrading" to foo-1.0-r1_=
armv7a) would be better
> >
> >
> > On my distro builder I'm trying to prevent this scenario by rsyncing
> > feeds only after build for *all* supported machines is completed, but
> > that's still not really atomic operation. (And later I've also started
> > to filter feeds which gets available on target image).
> >
> > Cheers,
> >
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1Ow488MNN9B9o/ov
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/AeB8ACgkQN1Ujt2V2gBxNsgCgljKYvVEdZAuy10yXzYgQScD9
EIcAn2eh/SXqyTZEZXah+bU9y4XFZyAh
=NiZD
-----END PGP SIGNATURE-----

--1Ow488MNN9B9o/ov--
