Received: from smtp22.4emm.com ([69.18.222.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RGo0p-0004wJ-6z
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 10:30:05 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB22.4emm.local ([fe80::1428:544e:162c:c29b%14]) with mapi id
	14.01.0289.001; Thu, 20 Oct 2011 04:22:20 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: sdk path problem
Thread-Index: AcyO/XTRcrseDRejRsCNTp7OP0osCQ==
Date: Thu, 20 Oct 2011 08:22:19 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: sdk path problem
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
X-List-Received-Date: Thu, 20 Oct 2011 08:30:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have been using meta-toolchain-qte in the past to cross compile a Qt app,=
 and the Linux kernel.
Recently I replaced my old SDK image with a fresh one, and found that I cou=
ld not link vmlinux anymore.

When building the kernel, I use the following ('rica' is the distribution n=
ame):
export PATH=3D$PATH:/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricas=
dk-linux/usr/bin/armv5te-rica-linux-gnueabi/
make ARCH=3Darm CROSS_COMPILE=3Darm-rica-linux-gnueabi- zImage

The new error message is:

Kernel: arch/arm/boot/Image is ready
  AS      arch/arm/boot/compressed/head.o
  GZIP    arch/arm/boot/compressed/piggy.gz
  CC      arch/arm/boot/compressed/misc.o
  AS      arch/arm/boot/compressed/piggy.o
  LD      arch/arm/boot/compressed/vmlinux
arm-rica-linux-gnueabi-ld: cannot find libgcc.a: No such file or directory

Comparing the build with the old sdk to the build with the new one, I find =
that the command line for linking has changed from:

arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym initr=
d_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefined -X =
/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi/usr/lib=
/arm-rica-linux-gnueabi/4.5.4/libgcc.a -T arch/arm/boot/compressed/vmlinux.=
lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arch/a=
rm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux

to:

arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym initr=
d_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefined -X =
libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed/h=
ead.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o a=
rch/arm/boot/compressed/vmlinux

So libgcc.a has lost its path qualification.
I also straced the two linker commands, and found that they differed in one=
 sequence.

Old:
lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|0755, st_=
size=3D4096, ...}) =3D 0
lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_IFDIR|=
0755, st_size=3D4096, ...}) =3D 0
lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueab=
i", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0

New:
lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|0755, st_=
size=3D4096, ...}) =3D 0
lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_IFDIR|=
0755, st_size=3D4096, ...}) =3D 0
lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueab=
i", 0xbffe67cc) =3D -1 ENOENT (No such file or directory)

Both toolchains are looking for a sysroot at 'arm-rica-linux-gnueabi', but =
the new toolchain should be looking at 'armv5te-rica-linux-gnueabi', as the=
 names have changed.
I'm not yet acquainted with the darker arts of toolchain generation. Can an=
yone help with this?
=A0=A0
Regards,=A0
James Limbouris



