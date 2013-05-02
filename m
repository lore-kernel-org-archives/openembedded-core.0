Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UXvNN-0003LV-7X for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:25:01 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r42F8enx018175; Thu, 2 May 2013 16:08:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id DPoIegMJciAX; Thu,  2 May 2013 16:08:40 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r42F8bbc018166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 2 May 2013 16:08:39 +0100
Message-ID: <1367507201.5379.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 02 May 2013 16:06:41 +0100
In-Reply-To: <51827D4B.4070907@windriver.com>
References: <CALbNGRTYCh8aB_JNpL7T-80PzybUN9KMJmZ=_GP6AfkrJmAccw@mail.gmail.com>
	<51826BBB.2090307@windriver.com> <1556536.BsQG791ajX@helios>
	<51827D4B.4070907@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r42F8enx018175
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 02 May 2013 15:25:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-05-02 at 09:50 -0500, Mark Hatle wrote:
> On 5/2/13 9:34 AM, Paul Eggleton wrote:
> > On Thursday 02 May 2013 08:35:55 Mark Hatle wrote:
> >> On 5/2/13 2:49 AM, Andreas M=C3=BCller wrote:
> >>> on one of my build machines useradd.bbclass seem to use the UID/GID=
 of
> >>> build host. On other machines useradd works correct.
> >>>
> >>> I have the follwing in gdm:
> >>>
> >>> <snip>
> >>> do_install_append() {
> >>>
> >>>       ...
> >>>       chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
> >>>       chmod 0750 ${D}${localstatedir}/lib/gdm
> >>>
> >>> }
> >>>
> >>> ...
> >>>
> >>> USERADD_PACKAGES =3D "${PN}"
> >>> USERADD_PARAM_${PN} =3D "--system --no-create-home --home
> >>> ${localstatedir}/lib/gdm --user-group gdm"
> >>> <snip/>
>=20
> I don't know how ipk and deb handle this.  But with the RPM system it c=
aptures=20
> the uname/gname (not uid/gid) and uses that when installing the file(s)=
.  This=20
> way the USERADD is processed before the install and the right value is =
used=20
> during the install.
>=20
> We may have a problem here where we need to also process the useradd -b=
efore-=20
> the do_install runs so that it's available for pseudo to use for deb/ip=
k.

No problem, see below.

>   (But=20
> if deb/ipk capture uid/gid vs uname/gname..  unless we set a static val=
ue we=20
> could still have a problem.)
>=20
> Does anyone know how ipk/deb handle this?

The same way rpm does. We have a preinst that sets things up before the
files get extracted. The extraction then preserves the users.

> >>>
> >>> In sysroot /etc/group I see
> >>> gdm:x:990:
> >>>
> >>> In sysroot /etc/group I see
> >>> gdm:!:993:990::/var/lib/gdm:
> >>>
> >>> The folder in packet/image has IDs 42:42 which is taken from build =
host.
> >>
> >> This says that something ran an operation outside of the pseudo envi=
ronment.
> >>   So it fell back to looking up the uid from the host system.  (The
> >> alternative is the item was installed -before- the /etc/passwd,/etc/=
group
> >> was written to the disk.
> >
> > Right, do_install will be well before this stuff happens and it is no=
t a
> > fakeroot task anyway. This needs to be moved to a postinstall script =
(which
> > should be able to run during image creation).
>=20
> do_install is a 'fakeroot' task.  But ya, the useradd action doesn't ne=
cessarily=20
> happen before it.

Yes it does. useradd.bbclass says:

do_install[prefuncs] +=3D "${SYSROOTFUNC}"

and that call sets up the user in advance. pseudo is set to use the
passwd/group files we add the entries to.

So this does all work and is used by dbus.

> We should -not- be using a postinstall action to change user/groups on=20
> files/directories.  This breaks the integrity checking that RPM has.  Y=
ou can=20
> (on the target) issue an rpm -V <package> and it will go and verify the=
=20
> installed files (including permissions, user, group) match what the RPM=
 database=20
> says.  Making the change in a postinstall will cause a validation failu=
re.

Right.

Cheers,

Richard



