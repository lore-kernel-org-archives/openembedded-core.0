Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SC4ey-0005PY-6s
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 09:48:12 +0200
Received: by iaag37 with SMTP id g37so8492259iaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 00:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=2Ncek5ODGUF/mE/bn46XAa4KsOFVE5y2Usi7DSdsh/0=;
	b=GS8Dkl+LbLwsRur5qFlbbPeEJygntu+cp6u6Xeg/hO2zEH1iQsCGfvDoQ9JH64FE0t
	lTaxH5nrzvzKu5/9noeX7U0X17rMbqxQ2g8APKz8ksCMXnTjLQko65/vMjZXsGBwAouk
	fIxOOLysoqCy3ww7RADtfdkDBgI4IHz3ViwaV6ivPFRNV6/vtG5bvRyWTyS6TnQ/Siaa
	ZKoBQOFEykLsiDux3g7rwTyNy8h1BbUEL6PRvfJrWYYQ21UbmOMVEoP3hMVEdqldoB9k
	XPmep979H/evA4gE26KAOdCp4ucI9PwOkhSPgCfayk5AdVBaAw2JUNkRlCJrg1yNp2Nd
	PDGQ==
MIME-Version: 1.0
Received: by 10.50.212.97 with SMTP id nj1mr4811197igc.65.1332747552050; Mon,
	26 Mar 2012 00:39:12 -0700 (PDT)
Received: by 10.42.165.137 with HTTP; Mon, 26 Mar 2012 00:39:12 -0700 (PDT)
In-Reply-To: <1332545863.9740.477.camel@ted>
References: <1332443701-24282-1-git-send-email-schnitzeltony@googlemail.com>
	<1332504745.9740.398.camel@ted>
	<CALbNGRT8Wb2gt7un4efD+szwz3kPZ5pns-4G6EusspH5iYYuZA@mail.gmail.com>
	<1332545863.9740.477.camel@ted>
Date: Mon, 26 Mar 2012 09:39:12 +0200
Message-ID: <CALbNGRTvipVQoipZFeuAwFcCr5APdzBh4jWm-sgn6c9hXs87+w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 26 Mar 2012 07:48:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 12:37 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2012-03-23 at 23:46 +0100, Andreas M=FCller wrote:
>> On Fri, Mar 23, 2012 at 1:12 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2012-03-22 at 20:15 +0100, Andreas M=FCller wrote:
>> >> * Before this patch every inheritance of this class rebuilt the full =
icon cache at the first boot.
>> >> * With this patch the icon cache will only be build once at the first=
 boot and on pkg installations that require it.
>> >> * This patch reduces the time needed for the first boot from 96 minut=
es to 5 minutes on the test machine.
>> >> * Build-tested incremental (BB_SIGNATURE_HANDLER =3D "OEBasicHash") &=
 from scratch
>> >> * Run-tested with systemd and opkg
>> >>
>> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
>> >> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
>> >> ---
>> >> =A0meta/classes/gtk-icon-cache.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 19 +++++++++-------
>> >> =A0.../gtk+/gtk-update-icon-cache-runonce.bb =A0 =A0 =A0 =A0 =A0| =A0=
 23 ++++++++++++++++++++
>> >> =A0.../gtk-update-icon-cache-runonce.in =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 16 +++++++++++++
>> >> =A03 files changed, 50 insertions(+), 8 deletions(-)
>> >> =A0create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-r=
unonce.bb
>> >> =A0create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-r=
unonce/gtk-update-icon-cache-runonce.in
>> >>
>> >> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-i=
con-cache.bbclass
>> >> index 60e3401..b48aabe 100644
>> >> --- a/meta/classes/gtk-icon-cache.bbclass
>> >> +++ b/meta/classes/gtk-icon-cache.bbclass
>> >> @@ -9,14 +9,16 @@ if [ "x$D" !=3D "x" ]; then
>> >> =A0 =A0 =A0 =A0 =A0exit 1
>> >> =A0fi
>> >>
>> >> -# Update the pixbuf loaders in case they haven't been registered yet
>> >> -GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-p=
ixbuf-query-loaders --update-cache
>> >> -
>> >> -for icondir in /usr/share/icons/* ; do
>> >> - =A0 =A0if [ -d $icondir ] ; then
>> >> - =A0 =A0 =A0 =A0gtk-update-icon-cache -fqt =A0$icondir
>> >> - =A0 =A0fi
>> >> -done
>> >> +# do not execute in case a final run-once is waiting
>> >> +if [ ! -e ${sysconfdir}/init.d/gtk-update-icon-cache-runonce ]; then
>> >> + =A0 =A0# Update the pixbuf loaders in case they haven't been regist=
ered yet
>> >> + =A0 =A0GDK_PIXBUF_MODULEDIR=3D${libdir}/gdk-pixbuf-2.0/2.10.0/loade=
rs gdk-pixbuf-query-loaders --update-cache
>> >> + =A0 =A0for icondir in /usr/share/icons/* ; do
>> >> + =A0 =A0 =A0 =A0if [ -d $icondir ] ; then
>> >> + =A0 =A0 =A0 =A0 =A0 =A0gtk-update-icon-cache -fqt =A0$icondir
>> >> + =A0 =A0 =A0 =A0fi
>> >> + =A0 =A0done
>> >> +fi
>> >
>> >
>> > Can't we just reduce this to adding a "touch
>> > ${sysconfdir}/init.d/gtk-update-icon-cache-runonce" to the above code
>> > and then clear that file at boot time?
>> >
>> Maybe it's a misunderstanding on my side but how shall an empty file
>> cover the three tasks during 1st boot:
>>
>> 1. Preventing all postints of running gtk-update-icon-cache by existing
>> 2. Running gtk-update-icon-cache ( after postinsts )
>> 3. Deleting itself and thereby avoid running during subsequent boots
>> and ensuring that packages which are installed later do run
>> gtk-update-icon-cache.
>
> The first time something tries this it creates the "lock".
> Any subsequent postinstall sees the "lock" and knows not to run.
>
> There are two problems:
>
> a) Knowing these are postinstalls at first boot and not package installs
> b) Deleting the unused "lock" files afterwards
>
> You'd therefore probably have to add something to the postinstalls core
> which:
>
> a) Creates some file during final rootfs postinstalls on first boot
> b) Clears some set of files after first boot.
Isn't this exactly what we are doing?
>
> I don't see a major issue with doing either of these two things though
> and it would simplify your patch whilst also allowing other similar
> cases to work in a similar way.
>
We presented a working solution fixing an issue existing for long time
and don't see that this suggestion gives major enhancements. Feel free
to present a different solution.

Andreas


