Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXus7-00089I-99
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 16:52:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 02 May 2013 07:34:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,597,1363158000"; d="scan'208";a="327710796"
Received: from unknown (HELO helios.localnet) ([10.255.12.165])
	by fmsmga001.fm.intel.com with ESMTP; 02 May 2013 07:34:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 02 May 2013 15:34:34 +0100
Message-ID: <1556536.BsQG791ajX@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <51826BBB.2090307@windriver.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: useradd.bbclass question
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
X-List-Received-Date: Thu, 02 May 2013 14:52:36 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
> On 5/2/13 2:49 AM, Andreas M=FCller wrote:
> > on one of my build machines useradd.bbclass seem to use the UID/GID=
 of
> > build host. On other machines useradd works correct.
> >=20
> > I have the follwing in gdm:
> >=20
> > <snip>
> > do_install_append() {
> >=20
> >      ...
> >      chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
> >      chmod 0750 ${D}${localstatedir}/lib/gdm
> >=20
> > }
> >=20
> > ...
> >=20
> > USERADD_PACKAGES =3D "${PN}"
> > USERADD_PARAM_${PN} =3D "--system --no-create-home --home
> > ${localstatedir}/lib/gdm --user-group gdm"
> > <snip/>
> >=20
> > In sysroot /etc/group I see
> > gdm:x:990:
> >=20
> > In sysroot /etc/group I see
> > gdm:!:993:990::/var/lib/gdm:
> >=20
> > The folder in packet/image has IDs 42:42 which is taken from build =
host.
>=20
> This says that something ran an operation outside of the pseudo envir=
onment.
>  So it fell back to looking up the uid from the host system.  (The
> alternative is the item was installed -before- the /etc/passwd,/etc/g=
roup
> was written to the disk.

Right, do_install will be well before this stuff happens and it is not =
a=20
fakeroot task anyway. This needs to be moved to a postinstall script (w=
hich=20
should be able to run during image creation).

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


