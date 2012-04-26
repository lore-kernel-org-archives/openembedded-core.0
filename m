Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SNJqt-0007nt-Oi
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Apr 2012 10:14:59 +0200
Received: by wibhj13 with SMTP id hj13so5087219wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=DMGjj9wOtOb5Sf5U+cjmiXptzbWTvNdXc2lfsFMJmP0=;
	b=MSCXRdcEvGfPIyiRbvF5HqFIOvt/klFPiqtViGnFIDD+Q1QSF+SYMJ+ztXbREFpdqy
	KJ06Jpjspb0NAuY0uyV3PF23dk8D6eJkLthupxNCnw3yNy+etO+Hl3K0P6qV1RPDK/gx
	+g37ZHSi3uBQetALB1zCmFcqpxhX5BSVAQEOx0kj8d8CeFhH3HXGRTMOkqZKjA5g3ap/
	fOebKh/glJTBMnHByyH6zcAs/+n28PQBaD3wBIhLyHIPbwICdBdH8p7DDUS0xTPDh9ZI
	OWG6rQ2oo7Ok3+nooHRY2s6SmM8S6aEc3883lwoeZpTlx1Ynis/LTXH8uoTPGwzmxb8l
	JuFA==
Received: by 10.180.107.101 with SMTP id hb5mr13838289wib.7.1335427522158;
	Thu, 26 Apr 2012 01:05:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm8556768wix.10.2012.04.26.01.05.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Apr 2012 01:05:21 -0700 (PDT)
Date: Thu, 26 Apr 2012 10:05:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120426080523.GB3646@jama.jama.net>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Busybox complaining about missing applets
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
X-List-Received-Date: Thu, 26 Apr 2012 08:14:59 -0000
X-Groupsio-MsgNum: 21190
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline

--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

But they are there and they work when started as busybox argument=20
or symlink in same directory as busybox is.

Have anyone seen this?

u-a links are correctly pointing to busybox
SHR root@gjama ~ $ ll /sbin/ifup
lrwxrwxrwx 1 root root 14 Apr 26 09:52 /sbin/ifup -> ../bin/busybox
SHR root@gjama ~ $ ll /usr/bin/less
lrwxrwxrwx 1 root root 17 Apr 26 09:52 /usr/bin/less -> ../../bin/busybox
SHR root@gjama ~ $ grep ifup /etc/busybox.links
/sbin/ifup
SHR root@gjama ~ $ grep less /etc/busybox.links
/usr/bin/less

but starting applet by symlink fails:
SHR root@gjama ~ $ less
less: applet not found
SHR root@gjama ~ $ ifup
ifup: applet not found

and directly it works:
SHR root@gjama ~ $ busybox less
less: missing filename
BusyBox v1.19.4 (2012-04-12 09:31:45 CEST) multi-call binary.

Usage: less [-EMNmh~I?] [FILE]...

SHR root@gjama ~ $ busybox ifup
BusyBox v1.19.4 (2012-04-12 09:31:45 CEST) multi-call binary.

Usage: ifup [-anmvf] [-i FILE] IFACE...

symlinks in /bin (where busybox binary is) seem to work=20
(ln -s busybox /bin/less works too)
SHR root@gjama / $ /bin/less
less: missing filename
BusyBox v1.19.4 (2012-04-12 09:31:45 CEST) multi-call binary.

Usage: less [-EMNmh~I?] [FILE]...

SHR root@gjama / $ /usr/bin/less
less: applet not found

strace diff between starting it with symlink and argument shows=20
that libm was loaded when starting with link=20

--- /home/root/busybox.link
+++ /home/root/busybox.arg
@@ -1,35 +1,43 @@
-execve("./less", ["./less"], [/* 23 vars */]) =3D 0
-brk(0)                                  =3D 0x1b89000
+execve("/bin/busybox", ["busybox", "less"], [/* 23 vars */]) =3D 0
+brk(0)                                  =3D 0x131e000
 uname({sys=3D"Linux", node=3D"gjama", ...}) =3D 0
-mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x4009b000
+mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x40018000
 access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dir=
ectory)
 open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
 fstat64(3, {st_mode=3DS_IFREG|0644, st_size=3D23779, ...}) =3D 0
-mmap2(NULL, 23779, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40101000
+mmap2(NULL, 23779, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x40033000
 close(3)                                =3D 0
-open("/lib/libm.so.6", O_RDONLY|O_CLOEXEC) =3D 3
-read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0h;\0\0004\0\0\0"...=
, 512) =3D 512
-fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D423444, ...}) =3D 0
-mmap2(NULL, 454784, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) =
=3D 0x40108000
-mprotect(0x4016f000, 28672, PROT_NONE)  =3D 0
-mmap2(0x40176000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DE=
NYWRITE, 3, 0x66) =3D 0x40176000
-close(3)                                =3D 0
 open("/lib/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
 read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0h|\1\0004\0\0\0"...=
, 512) =3D 512
 fstat64(3, {st_mode=3DS_IFREG|0755, st_size=3D1189068, ...}) =3D 0
-mmap2(NULL, 1230176, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)=
 =3D 0x40178000
-mprotect(0x40298000, 28672, PROT_NONE)  =3D 0
-mmap2(0x4029f000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0x11f) =3D 0x4029f000
-mmap2(0x402a2000, 9568, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_AN=
ONYMOUS, -1, 0) =3D 0x402a2000
+mmap2(NULL, 1230176, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)=
 =3D 0x400be000
+mprotect(0x401de000, 28672, PROT_NONE)  =3D 0
+mmap2(0x401e5000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_D=
ENYWRITE, 3, 0x11f) =3D 0x401e5000
+mmap2(0x401e8000, 9568, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_AN=
ONYMOUS, -1, 0) =3D 0x401e8000
 close(3)                                =3D 0
-mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x40029000
-set_tls(0x400294c0, 0x40029b98, 0x400e5048, 0x400294c0, 0x400e5048) =3D 0
-mprotect(0x4029f000, 8192, PROT_READ)   =3D 0
-mprotect(0x40176000, 4096, PROT_READ)   =3D 0
-mprotect(0x400e4000, 4096, PROT_READ)   =3D 0
-munmap(0x40101000, 23779)               =3D 0
+mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) =
=3D 0x40005000
+set_tls(0x400054c0, 0x40005b98, 0x4006d048, 0x400054c0, 0x4006d048) =3D 0
+mprotect(0x401e5000, 8192, PROT_READ)   =3D 0
+mprotect(0x4006c000, 4096, PROT_READ)   =3D 0
+munmap(0x40033000, 23779)               =3D 0
 getuid32()                              =3D 0
+brk(0)                                  =3D 0x131e000
+brk(0x133f000)                          =3D 0x133f000
+ioctl(1, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {=
B38400 opost isig icanon echo ...}) =3D 0
+ioctl(0, SNDCTL_TMR_TIMEBASE or SNDRV_TIMER_IOCTL_NEXT_DEVICE or TCGETS, {=
B38400 opost isig icanon echo ...}) =3D 0
+write(2, "less: missing filename\n", 23less: missing filename
+) =3D 23
+mmap2(NULL, 401408, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0=
) =3D 0x401eb000
+munmap(0x401eb000, 401408)              =3D 0
+write(2, "BusyBox v1.19.4 (2012-04-12 09:3"..., 42BusyBox v1.19.4 (2012-04=
-12 09:31:45 CEST)) =3D 42
+write(2, " multi-call binary.\n", 20 multi-call binary.
+)   =3D 20
+write(2, "\nUsage: ", 8
+Usage: )                =3D 8
 write(2, "less", 4less)                     =3D 4
-write(2, ": applet not found\n", 19: applet not found
-)    =3D 19
+write(2, " ", 1 )                        =3D 1
+write(2, "[-EMNmh~I?] [FILE]...", 21[-EMNmh~I?] [FILE]...)   =3D 21
+write(2, "\n\n", 2
+
+)                     =3D 2
 exit_group(1)                           =3D ?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+ZAcMACgkQN1Ujt2V2gBz9gwCdHlQIRbqmMouEPaXUCAWCxiAQ
JBIAn19U76oUeBkYCAXmDABSj+kLafBZ
=h0uE
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
