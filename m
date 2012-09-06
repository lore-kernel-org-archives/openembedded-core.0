Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9cMx-0006E0-6g
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 15:43:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Sep 2012 06:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="197954898"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by orsmga002.jf.intel.com with ESMTP; 06 Sep 2012 06:30:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Liang Li <liang.li@windriver.com>,
	Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 06 Sep 2012 14:30:57 +0100
Message-ID: <1452592.pU2j6FHZEs@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <20120802142510.GA6025@localhost>
References: <CALbNGRR1j33mDcTD-q2FD+g2uL1VNZNdDwRX7_MNeUTKtN=ozQ@mail.gmail.com>
	<CALbNGRSbs7D5kiPjuR1uh=ra-j08HbJRszx+cLv5NJtRtxj_RA@mail.gmail.com>
	<20120802142510.GA6025@localhost>
MIME-Version: 1.0
Subject: Re: latest updates make kernel menuconfig unusable
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
X-List-Received-Date: Thu, 06 Sep 2012 13:43:43 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 02 August 2012 22:25:18 Liang Li wrote:
> On 2012-08-02 19:07, Andreas M=EF=BF=BDller <schnitzeltony@googlemail=
.com> wrote:
> > On Thu, Jun 21, 2012 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrot=
e:
> > > On Wed, Jun 20, 2012 at 11:55 AM, Martin Jansa <martin.jansa@gmai=
l.com>=20
wrote:
> > >> On Wed, Jun 20, 2012 at 04:20:03PM +0200, Andreas M=E9=BB=AEler =
wrote:
> > >>> Hi,
> > >>>=20
> > >>> since
> > >>>=20
> > >>> commit fe417e8a4d625c6933de72163d2fee52ac47f571
> > >>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >>> Date:   Thu May 31 13:22:34 2012 +0000
> > >>>=20
> > >>>     cmd1.bbclass: Ensure ncurses is built and used for menuconf=
ig
> > >>>     tasks
> > >>>    =20
> > >>>     Currently, the task just exits if something goes wrong. Thi=
s adds
> > >>>     the
> > >>>     ncurses-native dependency. It also adds a small delay befor=
e
> > >>>     closing the
> > >>>     window so any messages displayed there can be seen.
> > >>>    =20
> > >>>     Trying to get the kernel build system to correctly find and=
 link
> > >>>     with
> > >>>     our copy of ncurses is some kind of nightmare. I ended up h=
aving
> > >>>     to add
> > >>>     it to HOST_LOADLIBES globally for this task which is rather=
 nasty
> > >>>     but I
> > >>>     couldn't find any other way.
> > >>>    =20
> > >>>     [YOCTO #2513]
> > >>>    =20
> > >>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundati=
on.org>
> > >>>=20
> > >>> my menuconfig is unusable (see screenshot attached). I reverted=
 it and
> > >>> can work as before.
> > >>>=20
> > >>> I am working on Fedora 15 and set in my local.conf
> > >>>=20
> > >>> TERMCMD =3D "${GNOME_TERMCMD}"
> > >>> TERMCMDRUN =3D "${GNOME_TERMCMDRUN}"
> > >>=20
> > >> I can confirm the same look&feel with
> > >> TERMCMD =3D "${SCREEN_TERMCMD}"
> > >> TERMCMDRUN =3D "${SCREEN_TERMCMDRUN}"
> > >=20
> > > seems like a locale issue.
> >=20
> > FYI
> >=20
> > Still have this behaviour and can work around it by commenting out
> >=20
> > OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIB=
ES"
> >=20
> > in cml1.bbclass.
>=20
> I have same issue on fedora 17, make it works for my host with
> below temporary tweak:
>=20
> diff --git meta/classes/cml1.bbclass meta/classes/cml1.bbclass
> index bd25311..948cfad 100644
> --- meta/classes/cml1.bbclass
> +++ meta/classes/cml1.bbclass
> @@ -15,6 +15,7 @@ HOSTLDFLAGS =3D "${BUILD_LDFLAGS}"
>  HOST_LOADLIBES =3D "-lncurses"
>=20
>  python do_menuconfig() {
> +        d.setVar("HOSTLDFLAGS", "")
>          oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing fo=
r
>          5 seconds'; sleep 5\"", '${PN} Configuration', d)
>  }
>  do_menuconfig[depends] +=3D "ncurses-native:do_populate_sysroot"
>=20
> ---
>=20
> FYI.
>=20
> Regards,
> =09=09Liang Li
>=20

Is there a proper fix for this issue if clearing HOSTLDFLAGS isn't the =
right=20
one? I'm not quite sure how to reproduce the problem here.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


