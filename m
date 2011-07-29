Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmohC-0004Tm-AC
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 17:09:50 +0200
Received: by wwi18 with SMTP id 18so3129046wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2011 08:05:33 -0700 (PDT)
Received: by 10.213.108.81 with SMTP id e17mr705869ebp.10.1311951933233;
	Fri, 29 Jul 2011 08:05:33 -0700 (PDT)
Received: from [172.20.1.19] (ip5451781a.direct-adsl.nl [84.81.120.26])
	by mx.google.com with ESMTPS id s48sm909751ees.9.2011.07.29.08.05.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 08:05:32 -0700 (PDT)
References: <1311946098.30326.489.camel@phil-desktop>
In-Reply-To: <1311946098.30326.489.camel@phil-desktop>
Mime-Version: 1.0 (iPhone Mail 8L1)
Message-Id: <7393B9A9-4E6C-4565-94FB-5A1F87159926@dominion.thruhere.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8L1)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 29 Jul 2011 17:05:25 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: arm tune files status summary
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
X-List-Received-Date: Fri, 29 Jul 2011 15:09:50 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 29 jul. 2011 om 15:28 heeft Phil Blundell <philb@gnu.org> het volgende ge=
schreven:

> There are quite a lot of different sub-threads going on at the moment
> regarding the various breakages associated with the recent arm tuning
> file patch.  Here's a summary of what I think are all the current issues
> and their status.
>=20
> 1. bogus PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} in bitbake.conf causing
> rootfs construction to fail.
>=20
> Paul and Koen both posted (essentially identical) patches for this and
> it looks as though Paul's has been applied.  So, the original breakage
> should be resolved but it isn't entirely clear what this line in
> bitbake.conf was trying to accomplish in the first place.  I think
> someone still needs to conduct an audit to establish whether there are
> any circumstances where PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE} does
> need setting to ${TARGET_ARCH} and, if so, make that happen.
>=20
> 2. endianness confusion in armv5/armv6 tune files.
>=20
> I posted a patch for this.  It doesn't look like it's been applied yet
> but it's in the archives for anybody who wants it.  Only big-endian
> configs would be affected anyway and I think those are something of a
> fringe pursuit.
>=20
> 3. eglibc unbuildable on qemuarm
>=20
> This is happening because qemuarm selects arm926ejs tuning, which in
> turn selects armv5te, and the current arrangement of tune files forces
> Thumb-state on if you ask to tune for a T-variant architecture.  The old
> "ARM_INSTRUCTION_SET" variable which used to override the ISA selection
> seems not to be respected anymore.  This is unfortunate because there is
> assembler code in eglibc which isn't Thumb-1 aware and hence can't be
> built under -mthumb.
>=20
> A short-term workaround would be to hack tune-arm926ejs.inc to select
> the TUNE_FEATURES for armv5e rather than armv5te.  But this is clearly
> not a good solution in general and, other than changing the underlying
> policy of inferring ISA choice from architecture name, it's not obvious
> what the right way of solving it is.
>=20
> This particular issue causes sufficiently gross breakage that I would
> have expected it to show up on the Yocto autobuilder run before the
> patch was merged.  I'm not quite sure why it apparently didn't fail
> there but maybe the autobuilder doesn't actually test qemuarm at
> present.
>=20
> 4. can't build ARM-state code for ARMv4T architecture.
>=20
> This is another facet of the above; there is currently no way to say
> that you want to select -march=3Darmv4t without also enabling -mthumb.
> This makes it impossible to build interworking-capable ARM-state code
> for v4T.
>=20
> 5. cortex tuning not working
>=20
> Various of the cortex files had a spelling mistake which would cause the
> TUNE_FEATURES never to actually match anything.  This is a trivial fix
> and I sent a patch for it yesterday.  I don't think it's been merged
> yet.
>=20
> 6. distros no longer able to select ARM vs Thumb state either globally
> or per package
>=20
> This is really another manifestation of the issue in #3.  But the point
> here isn't so much that builds are failing, rather that we seem to have
> lost the ability to have a single switch that the DISTRO can flip to
> build the entire world (or individual packages) as Thumb rather than
> ARM.  For Thumb-1 in particular the tradeoffs are sufficiently
> complicated that I don't think there is ever going to be a globally
> "right" answer.
>=20
> I think that's all I know of.

This matches my observations, thanks for summarizing all this!



>=20
> p.
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


