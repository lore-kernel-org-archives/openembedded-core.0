Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <drew_moseley@mentor.com>) id 1UcbxG-0005Cx-Iu
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 15:41:23 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Ucbfb-0004g7-QT from drew_moseley@mentor.com ;
	Wed, 15 May 2013 06:23:03 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 15 May 2013 06:23:03 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) with mapi id
	14.02.0247.003; Wed, 15 May 2013 06:23:02 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] kernel: Package additional modules files
	needed for systemtap
Thread-Index: AQHOUS9xN1xxhEg5VEahFckJ89jkjpkGsaAA
Date: Wed, 15 May 2013 13:23:02 +0000
Message-ID: <58F22199-6AD3-4FB0-9344-43A7BD08D003@mentor.com>
References: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
	<1368596392.25898.61.camel@ted>
In-Reply-To: <1368596392.25898.61.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
X-OriginalArrivalTime: 15 May 2013 13:23:03.0178 (UTC)
	FILETIME=[53EFFEA0:01CE516F]
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	"<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Package additional modules files needed for systemtap
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
X-List-Received-Date: Wed, 15 May 2013 13:41:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <73BDCE9BD0292C43AEF603C8F64579AA@mentor.com>
Content-Transfer-Encoding: quoted-printable

On May 15, 2013, at 1:39 AM, Richard Purdie <richard.purdie@linuxfoundation=
.org> wrote:
> On Tue, 2013-05-14 at 17:59 -0700, Drew Moseley wrote:
>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>> ---
>> meta/classes/kernel.bbclass |    8 +++++---
>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 6ba31bd..f23818e 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -108,8 +108,6 @@ kernel_do_install() {
>> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> 		oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" modules_install
>> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>> 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>> 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>> 	else
>> @@ -259,7 +257,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>> # kernel-image becomes kernel-image-${KERNEL_VERISON}
>> PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>> FILES =3D ""
>> -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>> +FILES_kernel-image =3D " \
>> +	/boot/${KERNEL_IMAGETYPE}* \
>> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.order \
>> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin \
>> +"
>> FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/conf=
ig* ${KERNEL_SRC_PATH}"
>> FILES_kernel-vmlinux =3D "/boot/vmlinux*"
>> RDEPENDS_kernel =3D "kernel-base"
>=20
> Should these really be installed into every system with a kernel?
> Doesn't systemtap also need other symbol information so these files
> would be better off in whatever other packages systemtap also needs?
>=20
> Cheers,
>=20
> Richard

Running systemtap probes without these files results in warning such as the=
 following when trying to install packages:

Installing kernel-image-3.5.7.11 (3.5.7.11+gitr4+524c7f7782e2c671cccab87aaf=
a1ee41f7202aaf-r6) to root...
Configuring kernel-image-3.5.7.11.
WARNING: could not open /lib/modules/3.5.7.11/modules.order: No such file o=
r directory
WARNING: could not open /lib/modules/3.5.7.11/modules.builtin: No such file=
 or directory

but I suspect systemtap is not the only place where these files are used.  =
Below is the description of these files from the kernel Documentation/kbuil=
d/kbuild.txt and they seem valuable on any module based system.

modules.order
--------------------------------------------------
This file records the order in which modules appear in Makefiles. This
is used by modprobe to deterministically resolve aliases that match
multiple modules.

modules.builtin
--------------------------------------------------
This file lists all modules that are built into the kernel. This is used
by modprobe to not fail when trying to load something builtin.


Regards,
Drew=


