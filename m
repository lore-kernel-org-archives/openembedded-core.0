Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVqjo-00040V-Gy for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 21:26:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUKK0ph004493;
	Wed, 30 Nov 2011 20:20:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03889-05; Wed, 30 Nov 2011 20:19:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUKJoSN004487
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 20:19:51 GMT
Message-ID: <1322684398.17484.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 30 Nov 2011 20:19:58 +0000
In-Reply-To: <F82CA009-53D5-45C1-AD7B-E0168518436F@dominion.thruhere.net>
References: <1322641493-5889-1-git-send-email-koen@dominion.thruhere.net>
	<1322674730.17484.15.camel@ted>
	<F82CA009-53D5-45C1-AD7B-E0168518436F@dominion.thruhere.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] consolekit: package /var/log/Consolekit
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
X-List-Received-Date: Wed, 30 Nov 2011 20:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-30 at 18:50 +0100, Koen Kooi wrote:
> Op 30 nov. 2011, om 18:38 heeft Richard Purdie het volgende geschreven:
> 
> > On Wed, 2011-11-30 at 09:24 +0100, Koen Kooi wrote:
> >> This fixes startup issues like this:
> >> 
> >> 2011-11-30T09:02:10+01:00 beaglebone ck-log-system-start[91]: **
> >> (process:91): WARNING **: Couldn't create log
> >> file /var/log/ConsoleKit/history (No such file or directory)
> >> 
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
> >> 1 files changed, 2 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/meta/recipes-support/consolekit/consolekit_0.4.5.bb b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> >> index 562dfb3..a02203c 100644
> >> --- a/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> >> +++ b/meta/recipes-support/consolekit/consolekit_0.4.5.bb
> >> @@ -2,7 +2,7 @@ DESCRIPTION = "ConsoleKit is a framework for defining and tracking users, login
> >> HOMEPAGE="http://www.freedesktop.org/wiki/Software/ConsoleKit"
> >> BUGTRACKER="https://bugs.freedesktop.org/buglist.cgi?query_format=specific&product=ConsoleKit"
> >> 
> >> -PR = "r5"
> >> +PR = "r6"
> >> 
> >> LICENSE = "GPLv2+"
> >> LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
> >> @@ -23,7 +23,7 @@ EXTRA_OECONF = "--with-systemdsystemunitdir=${base_libdir}/systemd/system/ \
> >>                 ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module --with-pam-module-dir=${base_libdir}/security', '--disable-pam-module', d)} \
> >>                "
> >> 
> >> -FILES_${PN} += "${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
> >> +FILES_${PN} += "${localstatedir}/log/ConsoleKit ${libdir}/ConsoleKit ${base_libdir} ${datadir}/dbus-1 ${datadir}/PolicyKit ${datadir}/polkit*"
> >> FILES_${PN}-dbg += "${base_libdir}/security/.debug"
> >> 
> >> PACKAGES =+ "pam-plugin-ck-connector"
> > 
> > Looks like this is breaking builds:
> > 
> > | consolekit                  ##################################################
> > | error: unpacking of archive failed on file /var/log: cpio: rename failed - Invalid argument
> > 
> > :(
> > 
> > http://autobuilder.pokylinux.org:8010/builders/nightly-x86-64/builds/197/steps/shell_30/logs/stdio
> 
> I suspect that's another victim of fs-perms.txt and rpm, it seems to
> break if /var/log is a symlink in other packages. I am going to argue
> that the breakage isn't a bug in consolekit :)

I really don't care whether its a bug in consolekit or not. The point is
that builds that were working before this change are now broken and we
have a regression.

Who is going to fix the regression?

Someone told me the answer is easy, I just revert the appropriate patch.
I tend to take on a lot of these types of issues and silently fix them
but I really need some help with it...

Cheers,

Richard




