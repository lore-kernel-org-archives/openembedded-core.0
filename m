Received: from smtp24.4emm.com ([69.18.222.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RIuOy-0002RE-QH
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Oct 2011 05:43:41 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB24.4emm.local ([::1]) with mapi id 14.01.0289.001; Tue, 25 Oct 2011
	23:37:38 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: useradd changes to dbus, base-passwd
Thread-Index: AcyTffR7oe+bqeWKRRipl7TOziFjKQAEnh7Q
Date: Wed, 26 Oct 2011 03:37:37 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1A8F4E@MBX20.4emm.local>
References: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A8F25@MBX20.4emm.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: useradd changes to dbus, base-passwd
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
X-List-Received-Date: Wed, 26 Oct 2011 03:43:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> James Limbouris
> Sent: Wednesday, 26 October 2011 9:35 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] useradd changes to dbus, base-passwd
>=20
> Hi,
>=20
> Recent changes to dbus have broken some sdk building:
>=20
> Missing or unbuildable dependency chain was: ['meta-toolchain-qte', 'task=
-qte-
> toolchain-host-nativesdk', 'qt4-tools-nativesdk', 'dbus-nativesdk', 'base=
-passwd-
> nativesdk']
>=20
> I think the commit introducing the base-passed dependency is
> 46e6c3fa8034b12d178d605f3f5d7efe69671a13 (dbus: use useradd class to
> allow use in read-only filesystems).
> I'm not too clear on how useradd works, so I can't tell if simply adding
> BBCLASSEXTEND =3D "native nativesdk" to base-passwd is sufficient. I'd ex=
pect
> that this would cause dbus to add itself to the sdk sysroot's passwd (whi=
ch
> previously didn't exist?). Seems harmless enough... I'm giving it a try n=
ow, but
> any advice or opinions would be appreciated.

It seems that adding BBCLASSEXTEND =3D "native nativesdk" to base-passwd an=
d shadow-sysroot is not sufficient.
dbus itself will not build for nativesdk:

NOTE: package dbus-nativesdk-1.4.12-r1: task do_install: Started
ERROR: Function 'useradd_sysroot' failed (see /home/james/oe/build/tmp-egli=
bc/work/i686-nativesdk-ricasdk-linux/dbus-nativesdk-1.4.12-r1/temp/log.do_i=
nstall.1735 for further information)
ERROR: Logfile of failure stored in: /home/james/oe/build/tmp-eglibc/work/i=
686-nativesdk-ricasdk-linux/dbus-nativesdk-1.4.12-r1/temp/log.do_install.17=
35
Log data follows:
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linu=
x', 'common-glibc', 'i686-linux', 'common']
| + cd /home/james/oe/build/tmp-eglibc/work/i686-nativesdk-ricasdk-linux/db=
us-nativesdk-1.4.12-r1/dbus-1.4.12
| + useradd_sysroot
| + export PSEUDO=3D/home/james/oe/build/tmp-eglibc/sysroots/i686-linux/usr=
/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/bin/pseudo
| + PSEUDO=3D/home/james/oe/build/tmp-eglibc/sysroots/i686-linux/usr/local/=
rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/bin/pseudo
| + export PSEUDO_LOCALSTATEDIR=3D/home/james/oe/build/tmp-eglibc/sysroots/=
i686-nativesdk-ricasdk-linux/usr/local/rica-eglibc-i686-armv5te/sysroots/i6=
86-ricasdk-linux/var/pseudo
| + PSEUDO_LOCALSTATEDIR=3D/home/james/oe/build/tmp-eglibc/sysroots/i686-na=
tivesdk-ricasdk-linux/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-rica=
sdk-linux/var/pseudo
| + D=3D/home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-ricasdk-lin=
ux
| + useradd_preinst
| + OPT=3D
| + SYSROOT=3D
| + test x/home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-ricasdk-l=
inux '!=3D' x
| + SYSROOT=3D/home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-ricas=
dk-linux
| + OPT=3D'--root /home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-r=
icasdk-linux'
| + GROUPADD_PARAM=3D'-r netdev'
| + USERADD_PARAM=3D'--system --home /usr/local/rica-eglibc-i686-armv5te/sy=
sroots/i686-ricasdk-linux/var/lib/dbus                        --no-create-h=
ome --user-group messagebus'
| + test 'x-r netdev' '!=3D' x
| + echo 'Running groupadd commands...'
| Running groupadd commands...
| ++ echo '-r netdev'
| ++ cut -d ';' -f 1
| + opts=3D'-r netdev'
| ++ echo '-r netdev'
| ++ cut -d ';' -f 2-
| + remaining=3D'-r netdev'
| + test 'x-r netdev' '!=3D' x
| ++ echo '-r netdev'
| ++ awk '{ print $NF }'
| + groupname=3Dnetdev
| ++ grep '^netdev:' /home/james/oe/build/tmp-eglibc/sysroots/i686-nativesd=
k-ricasdk-linux/etc/group
| grep: /home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-ricasdk-lin=
ux/etc/group: No such file or directory
| ++ true
| + group_exists=3D
| + test x =3D x
| + eval /home/james/oe/build/tmp-eglibc/sysroots/i686-linux/usr/local/rica=
-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/bin/pseudo groupadd --=
root /home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-ricasdk-linux =
-r netdev
| ++ /home/james/oe/build/tmp-eglibc/sysroots/i686-linux/usr/local/rica-egl=
ibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/bin/pseudo groupadd --root=
 /home/james/oe/build/tmp-eglibc/sysroots/i686-nativesdk-ricasdk-linux -r n=
etdev
| /home/james/oe/build/tmp-eglibc/work/i686-nativesdk-ricasdk-linux/dbus-na=
tivesdk-1.4.12-r1/temp/run.useradd_sysroot.1735: line 129: /home/james/oe/b=
uild/tmp-eglibc/sysroots/i686-linux/usr/local/rica-eglibc-i686-armv5te/sysr=
oots/i686-ricasdk-linux/usr/bin/pseudo: No such file or directory
| ERROR: Function 'useradd_sysroot' failed (see /home/james/oe/build/tmp-eg=
libc/work/i686-nativesdk-ricasdk-linux/dbus-nativesdk-1.4.12-r1/temp/log.do=
_install.1735 for further information)
NOTE: package dbus-nativesdk-1.4.12-r1: task do_install: Failed
ERROR: Task 1370 (virtual:nativesdk:/home/james/oe/sources/oe-core/meta/rec=
ipes-core/dbus/dbus_1.4.12.bb, do_install) failed with exit code '1'

Perhaps we should not inherit useradd when building for nativesdk? After al=
l, the sdk sysroots have not had /etc/passwd in the past.

James



