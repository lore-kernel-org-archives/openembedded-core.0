Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rdie1-0003wF-6L
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 14:25:15 +0100
Received: by eeit10 with SMTP id t10so4243353eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 05:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Y91LyhMbNBzE4fsaZV48k670WLKONgdJ/+LafRA42hg=;
	b=KRK97dtoKxo5sDRIfU0IhlNcJG8uR4aQlfcMDi1dim4BlkSpsusy/++ftiRJJnS4qC
	vtZ5HZYQ7FQZPuIY7diBIP7vpDg5ukQjaRebgpjggAJZUzSQb+Qo8XVLyqDPhHd7HMun
	Pz+tfKaAV5PZYZcnGhXHb+VZ7gnqVtPCrMxm4=
Received: by 10.14.149.13 with SMTP id w13mr4364716eej.61.1324559886947;
	Thu, 22 Dec 2011 05:18:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm34045437eeh.5.2011.12.22.05.18.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 05:18:06 -0800 (PST)
Date: Thu, 22 Dec 2011 14:17:53 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111222131753.GJ12791@jama.jama.net>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20111222091041.GI12791@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 13:25:15 -0000
X-Groupsio-MsgNum: 14682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Re2uCLPLNzqOLVJA"
Content-Disposition: inline

--Re2uCLPLNzqOLVJA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 10:10:41AM +0100, Martin Jansa wrote:
> On Thu, Dec 22, 2011 at 09:49:01AM +0100, Bernhard Guillon wrote:
> > Hi all,
> > we switched the way we chown /usr/libexec/dbus-daemon-launch-helper
> > with this commit:
> >=20
> > commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
> > Author: Otavio Salvador <otavio@ossystems.com.br>
> > Date:   Fri Oct 21 02:49:51 2011 +0000
> >=20
> >      dbus: use useradd class to allow use in read-only filesystems
> >=20
> >      Move creation of required user/groups to useradd class thus allowi=
ng
> >      use with read-only filesystems and booting the initial boot.
> >=20
> >      Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >=20
> >=20
> > We changed the owner ship of the user on the device before this commit.=
=20
> > Now we change the owner ship on build time which is wrong. If we change=
=20
> > the owner ship on buildtime we cannot know the gid of the messagebus=20
> > group. On my system it is e.g 117 but on my targtet it is 997. There is=
 no=20
> > standard mapping for gid to names so we need to switch back to change t=
he=20
> > group on the device.
>=20
> See http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711
> but it's still broken in some cases (on my buildhost 3 from 5 machines
> are broken, 2 are working after last opkg changes).
>=20
> Good test is to enable testlab and run this in your deploy/images directo=
ry
> find . ! -type l -name \*tar.gz`; do=20
>   echo $i;=20
>   tar -tvf $i | grep dbus-daemon-launch;=20
>   tar --numeric-owner -tvf $i | grep dbus-daemon-launch;=20
>   tar xzvpf $i ./etc/group;=20
>   grep messagebus ./etc/group;=20
> done | tee -a image.test

=2E/om-gta02/shr-image-om-gta02-20111221231021.rootfs.tar.gz
-rwsr-xr-- root/messagebus  142604 2011-12-19 14:11 ./usr/libexec/dbus-daem=
on-launch-helper
-rwsr-xr-- 0/997        142604 2011-12-19 14:11 ./usr/libexec/dbus-daemon-l=
aunch-helper
=2E/etc/group
messagebus:x:997:
=2E/qemux86-64/shr-image-qemux86-64-20111222003421.rootfs.tar.gz
-rwsr-xr-- root/messagebus  250448 2011-12-19 15:10 ./usr/libexec/dbus-daem=
on-launch-helper
-rwsr-xr-- 0/997        250448 2011-12-19 15:10 ./usr/libexec/dbus-daemon-l=
aunch-helper
=2E/etc/group
messagebus:x:997:
=2E/spitz/shr-image-spitz-20111222011259.rootfs.tar.gz
-rwsr-xr-- root/997     138408 2011-12-21 07:47 ./usr/libexec/dbus-daemon-l=
aunch-helper
-rwsr-xr-- 0/997        138408 2011-12-21 07:47 ./usr/libexec/dbus-daemon-l=
aunch-helper
=2E/etc/group
=2E/nokia900/shr-image-nokia900-20111221234558.rootfs.tar.gz
-rwsr-xr-- root/sshd    187568 2011-12-19 14:35 ./usr/libexec/dbus-daemon-l=
aunch-helper
-rwsr-xr-- 0/998        187568 2011-12-19 14:35 ./usr/libexec/dbus-daemon-l=
aunch-helper
=2E/etc/group

This is output from that on my buildhost (qemuarm which was also broken is =
gone, removed when
testing to rebuild spitz - also armv5te from scratch).

So spitz and nokia900 are wrong, qemux86 and om-gta02 working.

When trying to find what's different in spitz and nokia900 I've tried:
OE @ ~/shr-core $ grep messagebus tmp-eglibc/sysroots/*/usr/share/base-pass=
wd/group.master
OE @ ~/shr-core $ grep messagebus tmp-eglibc/sysroots/*/etc/group
tmp-eglibc/sysroots/nokia900/etc/group:messagebus:x:998:
tmp-eglibc/sysroots/om-gta02/etc/group:messagebus:x:998:
tmp-eglibc/sysroots/qemux86-64/etc/group:messagebus:x:998:
tmp-eglibc/sysroots/spitz/etc/group:messagebus:x:997:

OE @ ~/shr-core $ grep messagebus tmp-eglibc/sysroots/*/etc/passwd
tmp-eglibc/sysroots/nokia900/etc/passwd:messagebus:!:999:998::/var/lib/dbus=
:/bin/false
tmp-eglibc/sysroots/om-gta02/etc/passwd:messagebus:!:999:998::/var/lib/dbus=
:/bin/false
tmp-eglibc/sysroots/qemux86-64/etc/passwd:messagebus:!:999:998::/var/lib/db=
us:/bin/false
tmp-eglibc/sysroots/spitz/etc/passwd:messagebus:!:998:997::/var/lib/dbus:/b=
in/false

Sofar looks the same, but from log.do_rootfs files it looks
like base-passwd is not installed soon enough on spitz and nokia900.

Not sure why nscd is so picky or why base-passwd isn't installed soon enoug=
h in some cases,
but I'll try to debug more and provide more info (as I have done before).

I've tried to -c cleansstate base-passwd dbus dbus-native to fix
or break any machine, but it doesn't change it (broken are broken again
after rebuild and correct also stay correct).

/********* logs *************/
Checking ERRORs in log.do_rootfs files
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D correct om-gta02:
Installing base-passwd (3.5.22-r9) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv4t/base-passwd_3.5.=
22-r9_armv4t.ipk.
Running groupadd commands...
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
Installing dbus-1 (1.4.16-r2) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv4t/dbus-1_1.4.16-r2=
_armv4t.ipk.
Installing libexpat1 (2.0.1-r1) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv4t/libexpat1_2.0.1-=
r1_armv4t.ipk.
Running groupadd commands...
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
Running useradd commands...
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be ignored
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
Installing util-linux-blkid (2.19.1-r12) to root...

And similar sequence is in qemux86-64 (also correct)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D wrong nokia900:
Installing dbus-1 (1.4.16-r2) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/dbus-1_=
1.4.16-r2_armv7a-vfp-neon.ipk.
Running groupadd commands...
grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-=
r20/rootfs//etc/group: No such file or directory
groupadd: cannot open /etc/group
Running useradd commands...
grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-=
r20/rootfs//etc/passwd: No such file or directory
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be ignored
useradd: cannot open /etc/passwd
=2E..
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/connman=
_0.78-r9_armv7a-vfp-neon.ipk.
Running useradd commands...
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be ignored
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
Installing iptables (1.4.12.1-r0) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/nokia900/shadow_4.1.4.3=
-r7_nokia900.ipk.
Running groupadd commands...
grep: /OE/shr-core/tmp-eglibc/work/nokia900-oe-linux-gnueabi/shr-image-2.0-=
r20/rootfs//etc/group: No such file or directory
groupadd: cannot open /etc/group

and later
Installing base-passwd (3.5.22-r9) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/base-pa=
sswd_3.5.22-r9_armv7a-vfp-neon.ipk.

and then groupadd/useradd working better
Installing connman (0.78-r9) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/connman=
_0.78-r9_armv7a-vfp-neon.ipk.
Running useradd commands...
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be ignored
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
=2E..
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/armv7a-vfp-neon/openssh=
-sshd_5.9p1-r6_armv7a-vfp-neon.ipk.
Running useradd commands...
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be ignored
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
=2E..
Installing ppp-dialin (0.1-r8) to root...
Downloading file:/OE/shr-core/tmp-eglibc/deploy/ipk/all/ppp-dialin_0.1-r8_a=
ll.ipk.
Running useradd commands...
useradd: group '1000' does not exist
useradd: the GROUP=3D configuration in /etc/default/useradd will be ignored
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!
/usr/sbin/nscd: Only root is allowed to use this option!

And similar sequence is in spitz (also wrong)

Cheers,
>=20
> And working image needs to have not only messagebus as owner but also
> matching GID in 2nd line and last line from packaged /etc/group. With
> latest opkg fixes it seems to work, but only if there is messagebus in
> packaged /etc/group at all, reported here:
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0146=
19.html
> but probably got lost in other issues with new opkg, like this one
> http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/0146=
54.html
> (if D is not needed to be set from opkg then why was offlineroot_varname.=
patch
> added in first place? and I have updated this after
> offlineroot_varname.patch removal and new version is in shr branch)
> =20
> > I can send a patch which reenables the postinstall owner ship change if=
=20
> > you like.
>=20
> Such patch is already on ML from me, now I'm using .bbappend from my
> layer=20
> http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dc0=
8dfd5f5559902f6966648f75d6c6bfd2597a5b
>=20
> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Re2uCLPLNzqOLVJA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7zLgEACgkQN1Ujt2V2gBxqPACfWHijzsfqjlVYdn4o8bnY47/n
e1sAoJGaZSWDf7LKlYv3enpPBJ5CZpAg
=WuIR
-----END PGP SIGNATURE-----

--Re2uCLPLNzqOLVJA--
