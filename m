Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1S4qUQ-0006lH-PY for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 10:15:26 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id q268uIV4001349
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Mar 2012 09:56:20 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 6 Mar 2012 09:56:21 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 6 Mar 2012 09:56:21 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE52D0@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] read only rootfs?
Thread-Index: Acz7EBsipGLZ16aWTve8vEyLpBGqIgAYxpogAAB2zLA=
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 06 Mar 2012 08:56:21.0531 (UTC)
	FILETIME=[00852EB0:01CCFB77]
Subject: Re: read only rootfs?
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
X-List-Received-Date: Tue, 06 Mar 2012 09:15:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

we run our system using a readonly rootfs.

The main issues is, to figure out which packages need writeable data, =
this data have to be linked and managed by volatiles.
- tmpfs in ram for /tmp /var/volatiles
- links in  volatiles for /var/lib/.. (bluez, dhcp, ...); /var/log =
;/var/run
- links for all files that have to be writeable from the aplications =
which are used.

Next step is to modify the packages that need a runtime (first boot) =
configuration.

- amend (bbappend) or modify the recipes in your own OE layer to avoid =
runtime (first boot) configuration of packages, most of them are capable =
to do its configuration offline. (search for pkg_postinst pkg_preinst)
=20
Finally we got a working readonly Image directly out of OE. We don't use =
filesystem overlays like unionfs.
We use ubifs for NAND, because squashfs isn't able to manage bad blocks =
of NAND.

The number of modified packages isn't that high, so it may be better to =
spent the work to figure out the volatiles instead of overlaying the =
filesystems and carry the overhead.

Our user data reside on a USB-Stick connected to the system.

Reagards
Wolfgang

-----Urspr=FCngliche Nachricht-----
Von: openembedded-core-bounces@lists.openembedded.org =
[mailto:openembedded-core-bounces@lists.openembedded.org] Im Auftrag von =
Cliff Brake
Gesendet: Montag, 5. M=E4rz 2012 21:40
An: Patches and discussions about the oe-core layer
Betreff: [OE-core] read only rootfs?

Hello,

What are the best practices for implementing a read-only rootfs built
with OE?  I've looked at a few things like poky-tiny.conf, but figured
I would ask.

To date, I've been cheating and implementing a tmpfs overlay on top a
RO rootfs using unionfs, but this is less than idea as you need to do
the package install process on every boot.  Others boot the first time
RW, and then switch to RO for subsequent boots.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com

_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


