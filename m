Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRKqT-0000ft-3x for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 11:02:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4V8xTOS011384
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 09:59:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11095-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 09:59:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4V8xOM5011378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 09:59:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <642CE635-2E68-4FE6-843D-A2104BED6CD4@dominion.thruhere.net>
References: <1306581686-17625-1-git-send-email-koen@dominion.thruhere.net>
	<642CE635-2E68-4FE6-843D-A2104BED6CD4@dominion.thruhere.net>
Date: Tue, 31 May 2011 09:59:09 +0100
Message-ID: <1306832349.27470.340.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC][PATCH] sysvinit: make pidof usuable in a standalone setting
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
X-List-Received-Date: Tue, 31 May 2011 09:02:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-31 at 10:27 +0200, Koen Kooi wrote:
> No comments at all?

Patience ;-). It was a US/UK holiday yesterday and lots of people have
been taking a long weekend. Personally, whilst I did merge a few things
yesterday, this one didn't look that urgent so its on today's to look at
and reply to list.

> Op 28 mei 2011, om 13:21 heeft Koen Kooi het volgende geschreven:
> 
> > Currently it's a symlink to killall5:
> > 
> > $ dpkg-deb -c sysvinit-pidof_2.88dsf-r1_armv7a.ipk  | grep pidof
> > lrwxrwxrwx root/root         0 2011-05-27 11:05 ./bin/pidof.sysvinit -> /sbin/killall5
> > 
> > The point of the pidof subpackage was to have a pidof without
> needing sysvinit, this restores that behaviour. The trade-off is a
> 14KiB (armv7a, uncompressed) increase in size.
> > 
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> > ---
> > 
> > The alternative is to just move 'killall5' into the pidof subpackage and to RDPEPENDS_${PN} += "${PN}-pidof"

I think I prefer the alternative to duplicating binaries...

Cheers,

Richard

> > The change in this patch was the least amounts of edits to the recipe, let me know which way you prefer.
> > 
> > meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    4 ++--
> > 1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> > index 7d5e936..f0e73bb 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> > +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> > @@ -5,7 +5,7 @@ SECTION = "base"
> > LICENSE = "GPLv2+"
> > LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> >                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
> > -PR = "r1"
> > +PR = "r2"
> > 
> > # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
> > # Set PACKAGE_ARCH appropriately.
> > @@ -100,7 +100,7 @@ EOF
> > 		ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
> > 	done
> > 	mv                 ${D}${base_sbindir}/init               ${D}${base_sbindir}/init.${PN}
> > -	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${PN}
> > +	cp ${D}${base_sbindir}/killall5 ${D}${base_bindir}/pidof.${PN}
> > 	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
> > 	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
> > 	mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${PN}
> > -- 
> > 1.6.6.1
> > 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




