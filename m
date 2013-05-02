Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UXv6x-0001R1-KN for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:07:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r42EpgkB016666; Thu, 2 May 2013 15:51:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bBVeoJhjKjaO; Thu,  2 May 2013 15:51:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r42EpZ9M016658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 2 May 2013 15:51:37 +0100
Message-ID: <1367506179.5379.130.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 02 May 2013 15:49:39 +0100
In-Reply-To: <1556536.BsQG791ajX@helios>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r42EpgkB016666
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
X-List-Received-Date: Thu, 02 May 2013 15:07:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-05-02 at 15:34 +0100, Paul Eggleton wrote:
> On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
> > On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
> > > on one of my build machines useradd.bbclass seem to use the UID/GID=
 of
> > > build host. On other machines useradd works correct.
> > >=20
> > > I have the follwing in gdm:
> > >=20
> > > <snip>
> > > do_install_append() {
> > >=20
> > >      ...
> > >      chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
> > >      chmod 0750 ${D}${localstatedir}/lib/gdm
> > >=20
> > > }
> > >=20
> > > ...
> > >=20
> > > USERADD_PACKAGES =3D "${PN}"
> > > USERADD_PARAM_${PN} =3D "--system --no-create-home --home
> > > ${localstatedir}/lib/gdm --user-group gdm"
> > > <snip/>
> > >=20
> > > In sysroot /etc/group I see
> > > gdm:x:990:
> > >=20
> > > In sysroot /etc/group I see
> > > gdm:!:993:990::/var/lib/gdm:
> > >=20
> > > The folder in packet/image has IDs 42:42 which is taken from build =
host.
> >=20
> > This says that something ran an operation outside of the pseudo envir=
onment.
> >  So it fell back to looking up the uid from the host system.  (The
> > alternative is the item was installed -before- the /etc/passwd,/etc/g=
roup
> > was written to the disk.
>=20
> Right, do_install will be well before this stuff happens and it is not =
a=20
> fakeroot task anyway. This needs to be moved to a postinstall script (w=
hich=20
> should be able to run during image creation).

Er, yes, do_install is a fakeroot task and you should be able to make
something like this work from do_install. We went to a lot of effort to
ensure the preinst scripts work correctly (see dbus as an example recipe
that uses this).

Cheers,

Richard






