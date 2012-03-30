Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDdeH-0006TL-H8 for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 17:21:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UFCrsC014123
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 16:12:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13284-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 16:12:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UFCiHr014117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 16:12:45 +0100
Message-ID: <1333120364.18082.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 16:12:44 +0100
In-Reply-To: <20120330105006.00955b5d@eb-e6520>
References: <20120329225332.0e8cc2f4@eb-e6520>
	<1333058593.18082.40.camel@ted> <20120330105006.00955b5d@eb-e6520>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2UFCrsC014123
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 15:21:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-30 at 10:50 +0200, Eric B=C3=A9nard wrote:
> Le Thu, 29 Mar 2012 23:03:13 +0100,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =C3=A9crit :
>=20
> > On Thu, 2012-03-29 at 22:53 +0200, Eric B=C3=A9nard wrote:
> > > I noticed in from scratch builds for qemuarm that the longest time =
is
> > > taken in fetching sources, especially those fetched using git
> > > (linux-yocto for example) & svn (gcc, eglibc & co).
> >=20
> > Are you timing these as fetches from the source control systems or fr=
om
> > the mirror tarballs of the repositories. The tarballs should be
> > faster...
> >=20
> the default configuration seems to fetch from source control systems
> as I always see very long time to fetch gcc/eglibc/linux-yocto
> (despite having a 2.2 MBytes/s downlink DSL line).

If you're hitting the SCMs I can understand the frustration.

> I don't think that's a size problem but that fetching through svn or
> git is far less efficient than http or ftp especially from gnu's svn
> which may be overloaded.

Agreed.

> Morover in a pure OE context we have no interest of all the source
> history provided by svn or git and that makes a very big volume to
> download.

The fetcher will deal with this well in the svn case. In the git case,
we made a decision to include history since its not that more expensive.
Both these assumptions are based on a working up to date mirror.

> . ./openembedded-core/oe-init-build-env=20
> edit local.conf to select qemuarm & BBTHREAD to 8
> bitbake core-image-minimal -c fetchall
>=20
> and then I see bitbake stops at around 209 or 214 tasks waiting and
> I see that in ps :
> /home/ebenard/OE-CORE/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/gi=
t.real
> clone --bare --mirror
> git://git.yoctoproject.org/linux-yocto-3.2 /home/ebenard/OE-CORE/build/=
downloads/git2/git.yoctoproject.org.linux-yocto-3.2
> and
> svn co -r 184847
> http://gcc.gnu.org/svn/gcc/branches/gcc-4_6-branch@184847
>=20
> ... and both are actually fetching at only around 200 KiB/s which last
> for quite a long time as (from an other downloads dir) the final
> tree size are huge :
> du -s git.yoctoproject.org.linux-yocto-3.2/
> 610824	git.yoctoproject.org.linux-yocto-3.2/
> du -s gcc.gnu.org/
> 1602496	gcc.gnu.org/
> du -s www.eglibc.org/
> 625048	www.eglibc.org
> If I launch at the same time :
> wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.6.3/gcc-4.6.3.tar.bz2
> I get a download speed close to 1MB/s and the file to download is only
> 64MB which would save bandwidth.

Try adding this to your configuration:

PREMIRRORS =3D "\
git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n"

and see if that helps the performance. It might be we consider making
this the default for OE-Core although some people are nervous about
doing this...

Cheers,

Richard



