Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC6EW-0007Ds-VS for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 11:29:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2Q9K1T3023758
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:20:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17410-06 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:19:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2Q9Jo44023745
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 10:19:51 +0100
Message-ID: <1332753590.28414.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 10:19:50 +0100
In-Reply-To: <CALbNGRTvipVQoipZFeuAwFcCr5APdzBh4jWm-sgn6c9hXs87+w@mail.gmail.com>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
	<1332504745.9740.398.camel@ted>
	<CALbNGRT8Wb2gt7un4efD+szwz3kPZ5pns-4G6EusspH5iYYuZA@mail.gmail.com>
	<1332545863.9740.477.camel@ted>
	<CALbNGRTvipVQoipZFeuAwFcCr5APdzBh4jWm-sgn6c9hXs87+w@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2Q9K1T3023758
Subject: Re: [PATCH] gtk-icon-cache.bbclass: Fix multiple rebuilds of the icon cache on first boot
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
X-List-Received-Date: Mon, 26 Mar 2012 09:29:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-03-26 at 09:39 +0200, Andreas M=C3=BCller wrote:
> On Sat, Mar 24, 2012 at 12:37 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2012-03-23 at 23:46 +0100, Andreas M=C3=BCller wrote:
> >> On Fri, Mar 23, 2012 at 1:12 PM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> > On Thu, 2012-03-22 at 20:15 +0100, Andreas M=C3=BCller wrote:
> >> >> * Before this patch every inheritance of this class rebuilt the f=
ull icon cache at the first boot.
> >> >> * With this patch the icon cache will only be build once at the f=
irst boot and on pkg installations that require it.
> >> >> * This patch reduces the time needed for the first boot from 96 m=
inutes to 5 minutes on the test machine.
> >> >> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash=
") & from scratch
> >> >> * Run-tested with systemd and opkg
> >> >>
> >> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> >> >> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> >> >> ---
> >> >>  meta/classes/gtk-icon-cache.bbclass                |   19 ++++++=
+++-------
> >> >>  .../gtk+/gtk-update-icon-cache-runonce.bb          |   23 ++++++=
++++++++++++++
> >> >>  .../gtk-update-icon-cache-runonce.in               |   16 ++++++=
+++++++
> >> >>  3 files changed, 50 insertions(+), 8 deletions(-)
> >> >>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache=
-runonce.bb
> >> >>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache=
-runonce/gtk-update-icon-cache-runonce.in
> >> >>
> >> >> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/g=
tk-icon-cache.bbclass
> >> >> index 60e3401..b48aabe 100644
> >> >> --- a/meta/classes/gtk-icon-cache.bbclass
> >> >> +++ b/meta/classes/gtk-icon-cache.bbclass
> >> >> @@ -9,14 +9,16 @@ if [ "x$D" !=3D "x" ]; then
> >> >>          exit 1
> >> >>  fi
> >> >>
> >> >> -# Update the pixbuf loaders in case they haven't been registered=
 yet
> >> >> -GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders g=
dk-pixbuf-query-loaders --update-cache
> >> >> -
> >> >> -for icondir in /usr/share/icons/* ; do
> >> >> -    if [ -d $icondir ] ; then
> >> >> -        gtk-update-icon-cache -fqt  $icondir
> >> >> -    fi
> >> >> -done
> >> >> +# do not execute in case a final run-once is waiting
> >> >> +if [ ! -e ${sysconfdir}/init.d/gtk-update-icon-cache-runonce ]; =
then
> >> >> +    # Update the pixbuf loaders in case they haven't been regist=
ered yet
> >> >> +    GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loade=
rs gdk-pixbuf-query-loaders --update-cache
> >> >> +    for icondir in /usr/share/icons/* ; do
> >> >> +        if [ -d $icondir ] ; then
> >> >> +            gtk-update-icon-cache -fqt  $icondir
> >> >> +        fi
> >> >> +    done
> >> >> +fi
> >> >
> >> >
> >> > Can't we just reduce this to adding a "touch
> >> > ${sysconfdir}/init.d/gtk-update-icon-cache-runonce" to the above c=
ode
> >> > and then clear that file at boot time?
> >> >
> >> Maybe it's a misunderstanding on my side but how shall an empty file
> >> cover the three tasks during 1st boot:
> >>
> >> 1. Preventing all postints of running gtk-update-icon-cache by exist=
ing
> >> 2. Running gtk-update-icon-cache ( after postinsts )
> >> 3. Deleting itself and thereby avoid running during subsequent boots
> >> and ensuring that packages which are installed later do run
> >> gtk-update-icon-cache.
> >
> > The first time something tries this it creates the "lock".
> > Any subsequent postinstall sees the "lock" and knows not to run.
> >
> > There are two problems:
> >
> > a) Knowing these are postinstalls at first boot and not package insta=
lls
> > b) Deleting the unused "lock" files afterwards
> >
> > You'd therefore probably have to add something to the postinstalls co=
re
> > which:
> >
> > a) Creates some file during final rootfs postinstalls on first boot
> > b) Clears some set of files after first boot.
> Isn't this exactly what we are doing?
> >
> > I don't see a major issue with doing either of these two things thoug=
h
> > and it would simplify your patch whilst also allowing other similar
> > cases to work in a similar way.
> >
> We presented a working solution fixing an issue existing for long time
> and don't see that this suggestion gives major enhancements. Feel free
> to present a different solution.

Right, what I'm trying to figure out is whether we can simplify that
implementation a little so we don't need a new recipe, dependencies and
a new init script. There is nothing wrong with that solution but I think
its possible to simplify things a little.

My worry is whether the simplifications I have in mind will work in the
systemd world :/.

Cheers,

Richard



