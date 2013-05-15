Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <drew_moseley@mentor.com>) id 1UcdGY-00043O-50
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 17:05:18 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Uccys-0005sy-8h from drew_moseley@mentor.com ;
	Wed, 15 May 2013 07:47:02 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 15 May 2013 07:47:02 -0700
Received: from NA-MBX-03.mgc.mentorg.com ([fe80::9a:1569:df57:45b8]) by
	SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) with mapi id
	14.02.0247.003; Wed, 15 May 2013 07:47:01 -0700
From: "Moseley, Drew" <drew_moseley@mentor.com>
To: Tom Zanussi <tom.zanussi@intel.com>
Thread-Topic: [OE-core] [PATCH] kernel: Package additional modules files
	needed for systemtap
Thread-Index: AQHOUS9xN1xxhEg5VEahFckJ89jkjpkGsaAAgAADV4CAABQfAA==
Date: Wed, 15 May 2013 14:47:01 +0000
Message-ID: <0E3FD650-ED1E-4296-B1E4-E09ABACC0D7E@mentor.com>
References: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
	<1368596392.25898.61.camel@ted>
	<58F22199-6AD3-4FB0-9344-43A7BD08D003@mentor.com>
	<1368624899.1607.8.camel@empanada>
In-Reply-To: <1368624899.1607.8.camel@empanada>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.34.91.1]
MIME-Version: 1.0
X-OriginalArrivalTime: 15 May 2013 14:47:02.0667 (UTC)
	FILETIME=[0FB4FDB0:01CE517B]
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
X-List-Received-Date: Wed, 15 May 2013 15:05:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0F6B5ECCD3207D4DB0B6E5918C60DBF8@mentor.com>
Content-Transfer-Encoding: quoted-printable

On May 15, 2013, at 9:34 AM, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Wed, 2013-05-15 at 13:23 +0000, Moseley, Drew wrote:
>> On May 15, 2013, at 1:39 AM, Richard Purdie <richard.purdie@linuxfoundat=
ion.org> wrote:
>>> On Tue, 2013-05-14 at 17:59 -0700, Drew Moseley wrote:
>>>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>>>> ---
>>>> meta/classes/kernel.bbclass |    8 +++++---
>>>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>>> index 6ba31bd..f23818e 100644
>>>> --- a/meta/classes/kernel.bbclass
>>>> +++ b/meta/classes/kernel.bbclass
>>>> @@ -108,8 +108,6 @@ kernel_do_install() {
>>>> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>>>> 	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>>>> 		oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" modules_install
>>>> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
>>>> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
>>>> 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
>>>> 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
>>>> 	else
>>>> @@ -259,7 +257,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configu=
re
>>>> # kernel-image becomes kernel-image-${KERNEL_VERISON}
>>>> PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-de=
v"
>>>> FILES =3D ""
>>>> -FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
>>>> +FILES_kernel-image =3D " \
>>>> +	/boot/${KERNEL_IMAGETYPE}* \
>>>> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.order \
>>>> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin \
>>>> +"
>>>> FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot/co=
nfig* ${KERNEL_SRC_PATH}"
>>>> FILES_kernel-vmlinux =3D "/boot/vmlinux*"
>>>> RDEPENDS_kernel =3D "kernel-base"
>>>=20
>>> Should these really be installed into every system with a kernel?
>>> Doesn't systemtap also need other symbol information so these files
>>> would be better off in whatever other packages systemtap also needs?
>>>=20
>>> Cheers,
>>>=20
>>> Richard
>>=20
>> Running systemtap probes without these files results in warning such as =
the following when trying to install packages:
>>=20
>> Installing kernel-image-3.5.7.11 (3.5.7.11+gitr4+524c7f7782e2c671cccab87=
aafa1ee41f7202aaf-r6) to root...
>> Configuring kernel-image-3.5.7.11.
>> WARNING: could not open /lib/modules/3.5.7.11/modules.order: No such fil=
e or directory
>> WARNING: could not open /lib/modules/3.5.7.11/modules.builtin: No such f=
ile or directory
>>=20
>> but I suspect systemtap is not the only place where these files are used=
.  Below is the description of these files from the kernel Documentation/kb=
uild/kbuild.txt and they seem valuable on any module based system.
>>=20
>> modules.order
>> --------------------------------------------------
>> This file records the order in which modules appear in Makefiles. This
>> is used by modprobe to deterministically resolve aliases that match
>> multiple modules.
>>=20
>> modules.builtin
>> --------------------------------------------------
>> This file lists all modules that are built into the kernel. This is used
>> by modprobe to not fail when trying to load something builtin.
>>=20
>=20
> Hmm, is this happening when using the crosstap script?  I haven't seen
> it before..
>=20
> If this is happening when trying to compile probes on the target, that
> isn't really supported yet, but there's a bug open for it in 1.5:=20
>=20
> Bug 4442 - systemtap: make it usable on-target=20
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4442
>=20
> Part of that would be to get all the debug symbols systemtap needs on
> the target, which as Richard mentions would be overkill to install on
> every system regardless of whether systemtap or something else that
> needs the kernel debug symbols was also installed..
>=20
> It's on my plate for 1.5, but I haven't really spend much time thinking
> about it yet..
>=20
> Tom
>=20

Hi Tom,

This warning occurs when installing an updated kernel package using opkg.  =
It's primarily in a debug scenario so not a terribly high priority situatio=
n.

Drew=


