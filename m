Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1S4pfJ-0005VH-7c
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 09:22:37 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 6D04E4B01A6;
	Tue,  6 Mar 2012 09:13:59 +0100 (CET)
Date: Tue, 6 Mar 2012 09:13:58 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <20120306091358.6c9d5b49@eb-e6520>
In-Reply-To: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
References: <CAOd_LFz2nUOW4D4Q9YuDHzwvs6qTwgS2TJZA5UnJbYaROCiSGg@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 06 Mar 2012 08:22:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Cliff,

Le Mon, 5 Mar 2012 15:39:36 -0500,
Cliff Brake <cliff.brake@gmail.com> a =E9crit :
> What are the best practices for implementing a read-only rootfs built
> with OE?  I've looked at a few things like poky-tiny.conf, but figured
> I would ask.
>=20
> To date, I've been cheating and implementing a tmpfs overlay on top a
> RO rootfs using unionfs, but this is less than idea as you need to do
> the package install process on every boot.  Others boot the first time
> RW, and then switch to RO for subsequent boots.
>=20
I've just done a squashfs image (using angstrom and based on
systemd-image) which was designed to run from a USB stick on an
OMAP3 board (for production testing purpose).

I went this way :
- build an ext3 image and run it read write to check it works fine,
- flash again the same ext3 image and run it read only to check which
  init scripts fail,
- amend the corresponding recipes to create links to tmpfs for the files
  that the init or postinstall scripts are creating, the first recipe to
  amend is base-files that angstrom modifies to not have volatile var/*
  directories which is a big problem when running read only (or simply
  when running on a flash where erase/write cycles are counted),
  other problematic recipes are those which install files in /var/log
  for example,
- run the new ext3 image read only to validate all the scripts are
  fixed (I'm using ext3 as it's easy to turn it rw to check how to fix
  a problem on the target without loosing to much time)
- once the ext3 image works fine ro, build the squasfs image and it
  should run fine.

Eric
--=20
http://eukrea.com/en/news/104-2012


