Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U74nO-0008Ok-CC for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 15:00:47 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1HDoxrj017256; Sun, 17 Feb 2013 13:50:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hWmmSdHcjX9b; Sun, 17 Feb 2013 13:50:59 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1HDotlS017252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 17 Feb 2013 13:50:57 GMT
Message-ID: <1361108669.32271.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sun, 17 Feb 2013 13:44:29 +0000
In-Reply-To: <CAP9ODKoC6MHFy11Pp6=78+GbfuKnL3xYs6EfNcKPA6HudUk_vQ@mail.gmail.com>
References: <1361049644-27904-1-git-send-email-otavio@ossystems.com.br>
	<1361049644-27904-2-git-send-email-otavio@ossystems.com.br>
	<1361087244.31795.105.camel@ted>
	<CAP9ODKoC6MHFy11Pp6=78+GbfuKnL3xYs6EfNcKPA6HudUk_vQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] dbus: Drop libx11 dependency when building without 'x11' distro feature
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
X-List-Received-Date: Sun, 17 Feb 2013 14:00:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-02-17 at 10:40 -0300, Otavio Salvador wrote:
> On Sun, Feb 17, 2013 at 4:47 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2013-02-16 at 19:20 -0200, Otavio Salvador wrote:
> >> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ---
> >>  meta/recipes-core/dbus/dbus.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> >> index 292ab29..cebab28 100644
> >> --- a/meta/recipes-core/dbus/dbus.inc
> >> +++ b/meta/recipes-core/dbus/dbus.inc
> >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
> >>  X11DEPENDS = "virtual/libx11 libsm"
> >>  DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
> >>  DEPENDS_class-native = "expat-native virtual/libintl-native"
> >> -DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
> >> +DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
> >>  RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
> >>  RDEPENDS_class-native = ""
> >
> > This tends to be a really bad idea for dbus-nativesdk. If you install an
> > SDK compiled with these options into PATH only a system which does have
> > x11, it will break functionality in a way unacceptable to users.
> 
> I don't see how it'd break anything being deployed in a toolchain. We
> don't initialize the dbus daemon so it is mostly used to fulfill
> dependencies.

Imagine you source the toolchain setup script. The limited functionality
dbus-launch just got into PATH. Now you run some X application. Things
break.

Cheers,

Richard



