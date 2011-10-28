Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RJopd-0006u7-Mp for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 17:58:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9SFqvNL021635
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 16:52:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20769-08-3 for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 16:52:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9SFqRUt021543
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2011 16:52:28 +0100
Message-ID: <1319797331.22423.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <201110272230.29012.schnitzeltony@gmx.de>
References: <201110272230.29012.schnitzeltony@gmx.de>
Date: Fri, 28 Oct 2011 11:22:11 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.2.1- 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p9SFqvNL021635
Subject: Re: Trouble by last dbus patch (46e6c3fa8034b12d178d605f3f5d7efe69671a13)?
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
X-List-Received-Date: Fri, 28 Oct 2011 15:58:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2011-10-27 at 22:30 +0200, Andreas M=C3=BCller wrote:
> Since the last updates of all layers (angstrom based) I have issues wit=
h
>=20
> * networkmanager/nm-applet (meta-oe): I am not allowed to change the se=
ttings
>   any more
> * xfce-session (meta-oe): Logging out takes very long and Restart/Shutd=
own is=20
>   disabled
>=20
> I remember that I had similar issues a while ago. That could be worked =
around
> by starting some dbus stuff ( do not exactly remember what it was ).
>=20
> With this vague idea I checked and found in oe-core:
>=20
> | dbus: use useradd class to allow use in read-only filesystems
> | author	Otavio Salvador <otavio@ossystems.com.br>
> | commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13
>=20
> Not understanding totally what is all about I see in /etc/passw
>=20
> | messagebus:x:999:998::/var/lib/dbus:/bin/sh
>=20
> but I don't have /var/lib/dbus on my sytem!!
>=20
> I did not check yet, but maybe this is an incompatibilty with angstrom =
custom
>=20
> | FILESYSTEM_PERMS_TABLES =3D "fs-perms-angstrom.txt"
>=20
> somebody around to enlight the darkness?

There are some issues due to the orcering of when we now start some of
the services. After the above change the dbus service starts much
earlier on first boot, before some of the other postinstalls have run.
This can mean you see errors due to users which have not yet been
created by postinstalls (e.g. avahi or xuser) yet the dbus files
reference these and its trying to start those services.

We're looking at fixing the remaining adduser type postinstalls to
address this. I'm not sure if this is related to the problem you were
seeing above or not.

Cheers,

Richard



