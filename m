Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liang.Li@windriver.com>) id 1SwwWK-00025y-Cy
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:37:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q72EPJ8A029341
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 07:25:19 -0700 (PDT)
Received: from localhost (128.224.163.138) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 2 Aug 2012 07:25:19 -0700
Date: Thu, 2 Aug 2012 22:25:18 +0800
From: Liang Li <liang.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20120802142510.GA6025@localhost>
References: <CALbNGRR1j33mDcTD-q2FD+g2uL1VNZNdDwRX7_MNeUTKtN=ozQ@mail.gmail.com>
	<20120620185551.GU3178@jama.jama.net>
	<CAMKF1soNF3pdCnn41Ob0zWb8JaR0J4eL8tcc8MK3FKXeXnihVg@mail.gmail.com>
	<CALbNGRSbs7D5kiPjuR1uh=ra-j08HbJRszx+cLv5NJtRtxj_RA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSbs7D5kiPjuR1uh=ra-j08HbJRszx+cLv5NJtRtxj_RA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q72EPJ8A029341
Subject: Re: latest updates make kernel menuconfig unusable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Liang Li <liang.li@windriver.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 02 Aug 2012 14:37:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2012-08-02 19:07, Andreas M=EF=BF=BDller <schnitzeltony@googlemail.com=
> wrote:
> On Thu, Jun 21, 2012 at 2:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Jun 20, 2012 at 11:55 AM, Martin Jansa <martin.jansa@gmail.co=
m> wrote:
> >> On Wed, Jun 20, 2012 at 04:20:03PM +0200, Andreas M=E9=BB=AEler wrot=
e:
> >>> Hi,
> >>>
> >>> since
> >>>
> >>> commit fe417e8a4d625c6933de72163d2fee52ac47f571
> >>> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>> Date:   Thu May 31 13:22:34 2012 +0000
> >>>
> >>>     cmd1.bbclass: Ensure ncurses is built and used for menuconfig t=
asks
> >>>
> >>>     Currently, the task just exits if something goes wrong. This ad=
ds the
> >>>     ncurses-native dependency. It also adds a small delay before cl=
osing the
> >>>     window so any messages displayed there can be seen.
> >>>
> >>>     Trying to get the kernel build system to correctly find and lin=
k with
> >>>     our copy of ncurses is some kind of nightmare. I ended up havin=
g to add
> >>>     it to HOST_LOADLIBES globally for this task which is rather nas=
ty but I
> >>>     couldn't find any other way.
> >>>
> >>>     [YOCTO #2513]
> >>>
> >>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o=
rg>
> >>>
> >>> my menuconfig is unusable (see screenshot attached). I reverted it =
and
> >>> can work as before.
> >>>
> >>> I am working on Fedora 15 and set in my local.conf
> >>>
> >>> TERMCMD =3D "${GNOME_TERMCMD}"
> >>> TERMCMDRUN =3D "${GNOME_TERMCMDRUN}"
> >>
> >> I can confirm the same look&feel with
> >> TERMCMD =3D "${SCREEN_TERMCMD}"
> >> TERMCMDRUN =3D "${SCREEN_TERMCMDRUN}"
> >>
> >
> > seems like a locale issue.
> >
> FYI
>=20
> Still have this behaviour and can work around it by commenting out
>=20
> OE_TERMINAL_EXPORTS +=3D "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES"
>=20
> in cml1.bbclass.
>=20

I have same issue on fedora 17, make it works for my host with
below temporary tweak:

diff --git meta/classes/cml1.bbclass meta/classes/cml1.bbclass
index bd25311..948cfad 100644
--- meta/classes/cml1.bbclass
+++ meta/classes/cml1.bbclass
@@ -15,6 +15,7 @@ HOSTLDFLAGS =3D "${BUILD_LDFLAGS}"
 HOST_LOADLIBES =3D "-lncurses"
=20
 python do_menuconfig() {
+        d.setVar("HOSTLDFLAGS", "")
         oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for
         5 seconds'; sleep 5\"", '${PN} Configuration', d)
 }
 do_menuconfig[depends] +=3D "ncurses-native:do_populate_sysroot"

---

FYI.

Regards,
		Liang Li

> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


