Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S7FJY-0000oK-9K
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 01:10:08 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C11C4F8127B; Mon, 12 Mar 2012 18:01:25 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 26D58F81278;
	Mon, 12 Mar 2012 18:01:20 -0600 (MDT)
Message-ID: <4F5E8E50.6090106@mlbassoc.com>
Date: Mon, 12 Mar 2012 18:01:20 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F5E6A75.8050904@mlbassoc.com>
	<CAHod+GeGDBWiBzF6LuDPfAXS5ouBg3bB_TS0AsytHaMHbAR-jw@mail.gmail.com>
In-Reply-To: <CAHod+GeGDBWiBzF6LuDPfAXS5ouBg3bB_TS0AsytHaMHbAR-jw@mail.gmail.com>
Subject: Re: Icon problems with Sato theme
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
X-List-Received-Date: Tue, 13 Mar 2012 00:10:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-03-12 16:40, Marko Kati=C4=87 wrote:
> Similar things have happened to me. I tried to run oe-core built gtk 2.=
16 and pcmanfm on an ARM machine and pcmanfm would segfault if it didn't =
find the icon it wanted. I vaguely
> remember similar things happening with other gtk apps, Abiword 2.8.6 co=
mes to mind...
>
> This may be an issue with gdk-pixbuf, I am not sure.

I've been through the gtk code, but I still can't figure out why these ic=
ons are
not being found.

At least I've found a work-around.  Adding this
   echo 'gtk-fallback-icon-theme =3D "gnome"' >>/etc/gtk-2.0/gtkrc
to the midori install step lets it find the icons.

> On Mon, Mar 12, 2012 at 10:28 PM, Gary Thomas <gary@mlbassoc.com <mailt=
o:gary@mlbassoc.com>> wrote:
>
>     Note: This problem was originally sent to the Poky list, but it's n=
ot
>     Poky specific (I've verified it happens with other oe-core based se=
tups)
>
>     I'm trying to run the midori browser on my Poky based system.  I ha=
ve
>     an image which is based on core-image-sato.  I imported the midori
>     recipe from OE and it builds fine.  When I run midori, it fails
>     like this:
>       %midori
>       (midori:1629): Gtk-WARNING **: Error loading theme icon 'stock_ne=
w-tab' for stock: Icon 'stock_new-tab' not present in te
>       (midori:1629): Gtk-WARNING **: Error loading theme icon 'gnome-st=
ock-trash' for stock: Icon 'gnome-stock-trash' not prese
>       (midori:1629): Gtk-WARNING **: Error loading theme icon 'gtk-undo=
-ltr' for stock: Icon 'gtk-undo-ltr' not present in thee
>       Segmentation fault
>
>     I do have those icons - they come from the gnome-icon-theme package
>     which I also installed.  I even tried duplicating them into the Sat=
o
>     icon tree and ran 'gtk-update-icon-cache -q /usr/share/icons/Sato'
>     afterwards.  I now have these files:
>       root@logopak8347tbga:~# find /usr/share/icons -name "stock_new-ta=
b*"
>       /usr/share/icons/Sato/16x16/__actions/stock_new-tab.png
>       /usr/share/icons/Sato/22x22/__actions/stock_new-tab.png
>       /usr/share/icons/gnome/24x24/__actions/stock_new-tab.png
>       /usr/share/icons/gnome/16x16/__actions/stock_new-tab.png
>       /usr/share/icons/gnome/22x22/__actions/stock_new-tab.png
>     but I still get the same failure.
>
>     The really strange thing is this is what happens if I run midori
>     to the local X server.  If I 'ssh -X' into my board it works proper=
ly!
>     I've run strace on it in this mode and I can see that it's using a
>     different GTK theme - Raleigh, which does seem to find the icons.
>
>     Any ideas how I can get this to work on my local X server?
>
>     n.b. there seems to be a bug in the GTK libraries that make them fa=
il if the default
>     icons are not available.  It tries to render GTK_STOCK_MISSING_IMAG=
E for the missing
>     icons and this fails if there is no such icon available in the set =
(e.g. in sato).
>     On ARM at least, this is a fatal segmentation error.  Should I repo=
rt this as a bug?
>     Where?
>
>     I've also tried to add the missing icon(s) to the sato-icon-theme p=
ackage, but
>     no matter what I do, GTK can't ever seem to find the GTK_STOCK_MISS=
ING_IMAGE ('gtk-missing-image.png')
>     Any ideas how to debug this?
>
>     --
>     ------------------------------__------------------------------
>     Gary Thomas                 |  Consulting for the
>     MLB Associates              |    Embedded world
>     ------------------------------__------------------------------
>
>     _________________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.__openembedded.org <mailto:Openembedded-cor=
e@lists.openembedded.org>
>     http://lists.linuxtogo.org/__cgi-bin/mailman/listinfo/__openembedde=
d-core <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
core>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


