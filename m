Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 1A78D70B35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:45:10 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0158.001; Mon, 11 Aug 2014 15:45:10 +0200
From: Tudor Florea <Tudor.Florea@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: glibc-devel requirement for yocto host development system
Thread-Index: Ac+1Z/azzZOKgkCMTj6iiEHRtM5MNw==
Date: Mon, 11 Aug 2014 13:45:09 +0000
Message-ID: <26724FB0BFCB3D4C91BDE184751AA3A428A94251@SESTOEX04.enea.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Subject: glibc-devel requirement for yocto host development system
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 13:45:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I'd like to reach a broader audience on an issue I had and request your opi=
nion about what could be done to prevent similar issue in the future, or at=
 least add an appropriate note note in the yocto manual about this.

I was using a Centos 6.4  64 bit host machine to create an yocto (based) im=
age. The host machine contained glibc-headers-2.12-1.107.el6.x86_64 and ker=
nel-headers-2.6.32-358.el6.x86_64.rpm
Accoding to yocto manual (http://www.yoctoproject.org/docs/current/ref-manu=
al/ref-manual.html#required-packages-for-the-host-development-system) I've =
run the command "sudo yum install glibc-devel"
This updated glibc-header to glibc-headers-2.12-1.132.el6_5.2 (which is act=
ually the glibc-header for the latest  Centos 6.5 available) without updati=
ng accordingly the kernel (headers).

The new glib-header define:
/usr/include/bits/syscall.h:220:#define SYS_setns __NR_setns
However the kernel symbol __NR_setns is only added on kernel-2.6.32-431.el6=
.x86_64.rpm (the kernel headers for Centos 6.5)

The result is: when "bitbake util-linux-native" as part of building the ima=
ge I got the following error:
"/path/to/build/tmp/work/x86_64-linux/util-linux-native/2.24.1-r0/util-linu=
x-2.24.1/include/namespace.h:40: error: '__NR_setns' undeclared (first use =
in this function)"

The culprit code was:
# if !defined(HAVE_SETNS) && defined(SYS_setns)
static inline int setns(int fd, int nstype)
{
        return syscall(SYS_setns, fd, nstype);
}
# endif

I managed to alleviate the issue above but I'd like to know what should be =
the generic solution for the issues like this that may appear again in futu=
re (e.g. when newer host distro are released).
I assume a requirement to update the kernel to be back in in sync with glib=
c(-header) is not feasible.
Is it a simple way to "yum_install_without_update" the required packages to=
 avoid having the host kernel and glibc out of sync. Should something be ch=
anged (or added) in yocto manual? =20
Is this a bug of Centos distro after all, cause yum command leave the host =
into an inconsistent state?=20
Thank you,
   Tudor.


