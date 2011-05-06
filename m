Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QILw7-0004fu-59 for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 16:23:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p46EKYhs024539
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 May 2011 15:20:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24190-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2011 15:20:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p46EKPsl024533
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 May 2011 15:20:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
Date: Fri, 06 May 2011 15:20:22 +0100
Message-ID: <1304691622.30391.124.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 14:23:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-06 at 15:39 +0200, Koen Kooi wrote:
> Now onto my issues:
> 
> packaging:
> 	In OE .dev I added FILES_${PN} += "${base_libdir}/systemd" to udev,
> dbus, rsyslog and avahi. This means we end up with both sysV script
> and systemd units. What I would like to have is ${PN}-sysvinit and
> ${PN}-systemd and the image recipe can choose which init systems gets
> used. Is something like that possible?

I'm not sure that it is to be honest. We simply don't have the
capability in the package managers to be able to say "if systemd is
installed, install *-systemd where * is any currently installed
package". Its the same problem we have with locales.

Now if we had that functionality, great, but we simply don't :(.

>  Are there better ways? Note that systemd support sysV initscripts as
> well, but it needs some care with naming. As I understand it, if a
> unit is found with the same name as a sysV script, only the unit will
> get used.
> A rootfs postprocess command that deletes /etc/init.d won't work,
> since it will come back when upgrading the packages.
> 
> building:
> 	At the moment systemd enabled software installs the units regardless
> or config options. What should be do with software that has an option
> for that? And what if we need to patch the units files in? The
> initsystem is a choice at the image level, so artificially limiting it
> to a distro choice is not a good idea.

Its an artificial limit but our tools don't give us any other option,
for now I think this has to be a distro config choice.

> And related to this: how do I get the "installed but not packaged"
> output back? The bitbake logging changes are hiding it now, which is
> counterproductive. 

As others have said, this should be a bb.warn.

Cheers,

Richard



