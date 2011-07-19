Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+LXSBBBQBCAMHjLdw7TPAED1bUmEp+Gdw=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjCm4-0004Wd-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 18:03:57 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JE7v4S032469;
	Tue, 19 Jul 2011 09:07:57 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4537825C-7D8E-4260-88D2-C5F851FF827A@kernel.crashing.org>
Date: Tue, 19 Jul 2011 09:07:57 -0500
Message-Id: <E7D51FCF-F5DC-448D-8354-410E0217D10F@kernel.crashing.org>
References: <1311052872-10569-1-git-send-email-galak@kernel.crashing.org>
	<1311052872-10569-2-git-send-email-galak@kernel.crashing.org>
	<CAMKF1sq4ho3-P6L0PfDVxpAscccS561LLRUNc64okvsU9R=f9Q@mail.gmail.com>
	<4537825C-7D8E-4260-88D2-C5F851FF827A@kernel.crashing.org>
To: Kumar Gala <galak@kernel.crashing.org>
X-Mailer: Apple Mail (2.1084)
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [PATCH 1/5] gcc: Add gcc configure for PowerPC e500v2/SPE embedded floating point ABI
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
X-List-Received-Date: Tue, 19 Jul 2011 16:03:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Adding openembedded-core to see if any feedback on my query.

- k

On Jul 19, 2011, at 1:47 AM, Kumar Gala wrote:

>=20
> On Jul 19, 2011, at 1:04 AM, Khem Raj wrote:
>=20
>> On Mon, Jul 18, 2011 at 10:21 PM, Kumar Gala =
<galak@kernel.crashing.org> wrote:
>>> The e500v2 core utilizes a unique floating point programming model / =
ABI.
>>> We utilize TARGET_FPU =3D "spe" to distinguish this choice.  When =
building
>>> the toolchain for this ABI we need configure gcc with =
--enable-e500_double.
>>>=20
>>> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
>>> ---
>>> meta/recipes-devtools/gcc/gcc-4.6.inc    |    2 +-
>>> meta/recipes-devtools/gcc/gcc-common.inc |    2 ++
>>> 2 files changed, 3 insertions(+), 1 deletions(-)
>>>=20
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc =
b/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> index 56064b5..b719155 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> @@ -1,6 +1,6 @@
>>> require gcc-common.inc
>>>=20
>>> -PR =3D "r8"
>>> +PR =3D "r9"
>>>=20
>>> # Third digit in PV should be incremented after a minor release
>>> # happens from this branch on gcc e.g. currently its 4.6.0
>>> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc =
b/meta/recipes-devtools/gcc/gcc-common.inc
>>> index 7bf036c..409ad01 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-common.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
>>> @@ -12,6 +12,8 @@ FILESDIR =3D =
"${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
>>> def get_gcc_fpu_setting(bb, d):
>>>    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>>>        return "--with-float=3Dsoft"
>>> +    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'spe' ]:
>>> +        return "--enable-e500_double"
>>>    return ""
>>>=20
>>=20
>> this will enable e500_double even for e500v1 which IIRC does not have
>> DFP support
>> have you tried building for e500v1 with this ?
>=20
> I think you are correct.  Any suggestions on how to distinguish e500v1 =
vs e500v2?  Utilizing BASE_PACKAGE_ARCH has problems w/native builds =
since it seems to get set to x86_64 at some point.
>=20
> I could do:
>=20
> TARGET_FPU =3D "ppc-efs"  [Embedded scalar single-precision =
floating-point]
> TARGET_FPU =3D "ppc-efd"  [Embedded scalar double-precision =
floating-point]
>=20
> Than meta/recipes-devtools/gcc/gcc-common.inc:
>=20
> def get_gcc_fpu_setting(bb, d):
>    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
>        return "--with-float=3Dsoft"
> +    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'ppc-efd' ]:
> +        return "--enable-e500_double"
>    return ""
>=20
> And meta/conf/distro/include/tclibc-*libc.inc:
>=20
> TARGET_OS_powerpc =3D =
"linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efs', =
'ppc-efd']]}"
>=20
> thoughts?
>=20
> - k
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto



