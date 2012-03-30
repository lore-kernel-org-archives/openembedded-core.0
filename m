Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDXft-0007f1-QI
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 10:59:14 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9A3044B00FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 10:50:07 +0200 (CEST)
Date: Fri, 30 Mar 2012 10:50:06 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330105006.00955b5d@eb-e6520>
In-Reply-To: <1333058593.18082.40.camel@ted>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 30 Mar 2012 08:59:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Thu, 29 Mar 2012 23:03:13 +0100,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :

> On Thu, 2012-03-29 at 22:53 +0200, Eric B=E9nard wrote:
> > I noticed in from scratch builds for qemuarm that the longest time is
> > taken in fetching sources, especially those fetched using git
> > (linux-yocto for example) & svn (gcc, eglibc & co).
>=20
> Are you timing these as fetches from the source control systems or from
> the mirror tarballs of the repositories. The tarballs should be
> faster...
>=20
the default configuration seems to fetch from source control systems
as I always see very long time to fetch gcc/eglibc/linux-yocto
(despite having a 2.2 MBytes/s downlink DSL line).

> > To reduce the fetch time would that make sense to=20
> > - fetch gcc/glibc & co from the archive of a stable version and then
> >   apply patches on top of it (maybe patches stored in an archive
> >   fetched from oe's website and applied in bulk or patches stored in OE)
>=20
> Unfortunately the patches tend to get unwieldy. The tarballs of the svn
> repos on the mirror should be about equal in size to the upstream
> archive in this case.=20
>=20
I don't think that's a size problem but that fetching through svn or
git is far less efficient than http or ftp especially from gnu's svn
which may be overloaded.
Morover in a pure OE context we have no interest of all the source
history provided by svn or git and that makes a very big volume to
download.

> > - do the same thing for the linux-yocto kernel or add a --reference
> >   option to the git fetcher so that we can provide a local tree as a
> >   reference ?
>=20
> This is effectively how the repositories in DL_DIR are used. If you
> place a tree in the right place there, it should reuse references...
>=20
> > Do you have other ideas (appart from using a local mirror) to optimize
> > the fetch time ?
>=20
> I'd be interested firstly to understand if you're using the SCM directly
> or using the mirror tarballs as that should make a big difference. In
> the standard configuration it should be using mirror tarballs...
>=20
that doesn't seems to be the case :
from a clean oe-core + bitbake clone :

. ./openembedded-core/oe-init-build-env=20
edit local.conf to select qemuarm & BBTHREAD to 8
bitbake core-image-minimal -c fetchall

and then I see bitbake stops at around 209 or 214 tasks waiting and
I see that in ps :
/home/ebenard/OE-CORE/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/git.re=
al
clone --bare --mirror
git://git.yoctoproject.org/linux-yocto-3.2 /home/ebenard/OE-CORE/build/down=
loads/git2/git.yoctoproject.org.linux-yocto-3.2
and
svn co -r 184847
http://gcc.gnu.org/svn/gcc/branches/gcc-4_6-branch@184847

... and both are actually fetching at only around 200 KiB/s which last
for quite a long time as (from an other downloads dir) the final
tree size are huge :
du -s git.yoctoproject.org.linux-yocto-3.2/
610824	git.yoctoproject.org.linux-yocto-3.2/
du -s gcc.gnu.org/
1602496	gcc.gnu.org/
du -s www.eglibc.org/
625048	www.eglibc.org
If I launch at the same time :
wget ftp://ftp.gnu.org/gnu/gcc/gcc-4.6.3/gcc-4.6.3.tar.bz2
I get a download speed close to 1MB/s and the file to download is only
64MB which would save bandwidth.

Eric


