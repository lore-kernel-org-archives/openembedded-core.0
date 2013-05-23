Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B2AAF6086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 12:50:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4NCsaaG026126; Thu, 23 May 2013 13:54:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AEbYgL82_ey9; Thu, 23 May 2013 13:54:36 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4NCsWN9026121
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 23 May 2013 13:54:33 +0100
Message-ID: <1369313440.14887.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>
Date: Thu, 23 May 2013 13:50:40 +0100
In-Reply-To: <519E0C26.40502@gmail.com>
References: <1369281734-7989-1-git-send-email-net147@gmail.com>
	<1369309132.14887.32.camel@ted> <519E0C26.40502@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: remove /var/run from package as it is created on startup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 May 2013 12:50:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-23 at 22:31 +1000, Jonathan Liu wrote:
> On 23/05/2013 9:38 PM, Richard Purdie wrote:
> > On Thu, 2013-05-23 at 14:02 +1000, Jonathan Liu wrote:
> >> /var/run is a tmpfs that is created on startup.
> >> For sysvinit, /var/run/dbus is created by populate-volatiles.sh.
> >> For systemd, /var/run/dbus is created implicitly by dbus.socket when
> >> creating a listen stream socket at /var/run/dbus/system_bus_socket.
> >>
> >> Signed-off-by: Jonathan Liu <net147@gmail.com>
> >> ---
> >>   meta/recipes-core/dbus/dbus.inc | 7 +++++--
> >>   1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
> >> index 2be5bda..8055824 100644
> >> --- a/meta/recipes-core/dbus/dbus.inc
> >> +++ b/meta/recipes-core/dbus/dbus.inc
> >> @@ -101,9 +101,9 @@ do_install() {
> >>   	     > ${D}${sysconfdir}/default/volatiles/99_dbus
> >>   
> >>
> >> -	mkdir -p ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
> >> +	mkdir -p ${D}${localstatedir}/lib/dbus
> >>   
> >> -	chown messagebus:messagebus ${D}${localstatedir}/run/dbus ${D}${localstatedir}/lib/dbus
> >> +	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
> > Is what populate-volatiles does truly equivalent? Does this directory
> > need to be owned by messagebus (which is a user created by dbus) iirc?
> >
> > Cheers,
> >
> > Richard
> The dbus recipe writes /etc/default/volatiles/99_dbus.

That is the piece I'd missed, thanks :).

Cheers,

Richard


