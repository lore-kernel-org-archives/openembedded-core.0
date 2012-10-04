Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TJpxh-0000gC-Iz
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 20:15:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q94I2pBe025310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Oct 2012 11:02:51 -0700 (PDT)
Received: from msp-dhcp7.wrs.com (172.25.34.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 4 Oct 2012 11:02:50 -0700
Message-ID: <506DCF4A.5020101@windriver.com>
Date: Thu, 4 Oct 2012 13:02:50 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q94I2pBe025310
Subject: RFC: Secondary Toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 18:15:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: quoted-printable

We have an issue where we'd like to have an alternative toolchain (assemb=
ler,=20
linker, compiler) available for our customers to selectively use.  Howeve=
r,=20
before we just go off and implement something, I'd like at least some bas=
ic=20
consensus on what the best practice is for doing this work.  Below is my =
attempt=20
at an early proposal.

Background
----------------

Many companies have commercial / highly optimized toolchains for specific=
=20
purpose, such as ICC from Intel, LLVM, ARM specific toolchain, etc..  For=
=20
(potentially) better performance with some applications a mechanism to bo=
th=20
provide the hooks for the alternative toolchain as well as a way to activ=
e it=20
per-package is desired.

This work assumes that the third party toolchain is generally compatible =
with=20
the idea of sysroots, linking to the libc provided by OE, and generally=20
compatible with GNU conventions.

However, as part of the third party toolchain, it may not be GNU compatib=
le.=20
This means many Open Source applications simply may not work with this=20
toolchain.  That means that we need to have a way for a toolchain to blac=
klist=20
(or whitelist) specific recipes.  This way only supported components can =
be=20
built by the user, avoiding numerous complaints.

Currently OE has a method to generate an SDK based on the GNU toolchain. =
 We=20
would like to be able to also export the external toolchain along with th=
e SDK,=20
effectively providing both the GNU toolchain and the third party toolchai=
n using=20
the common sysroot.

We need a way to active the third party toolchain on a per-package basis.=
  This=20
activation will need to use the existing sysroot, but be able to pass dif=
ferent=20
C, C++, LD, AS and other flags as specified by the third party toolchain.

Finally third party toolchains should be implemented as layers that can e=
asily=20
plug into OE.

Implementation
---------------------

Add an OVERRIDE to specify the alternative toolchain.  Can this be done w=
ithin=20
the layer by doing something like:

OVERRIDE_append =3D ":toolchain-${TOOLCHAIN}"

TOOLCHAIN =3D "gnu" (or "icc")

To activate the toolchain you would use things like:

TOOLCHAIN_pn-bash =3D 'icc'

To define the correct behavior for the toolchain, the following would nee=
d to be=20
defined (with _toolchain-<toolchain>):

TARGET_CPPFLAGS
TARGET_CFLAGS
TARGET_CXXFLAGS
TARGET_LDFLAGS
CC
CXX
F77
CPP
LD
CCLD
AR
AS
RANLIB
STRIP
OBJCOPY
OBJDUMP
NM
FULL_OPTIMIZATIONS
DEBUG_OPTIMIZATION

Is anyone aware of any other items that may require additional items?  Wi=
ll the=20
above actually work?  Using the override of the TOOLCHAIN_=85 will that a=
ctually=20
change the override values or do we get stuck?

Comments/suggestions appreciated!
--Mark


