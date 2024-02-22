Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5D7C47DD9
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 22:47:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.27102.1708642013903626413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 14:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=M0+nWnOK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41MMkqG3047451;
	Thu, 22 Feb 2024 16:46:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708642012;
	bh=5/MY9ORi8H0VGb5hcM+aAP0UaWhSwYf6pZDffX2zoPg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M0+nWnOKsorQF4fPzpIoeKAY2xf8OOVJwSe9rvurHdlQu6ES+E271lZm64Gputpld
	 w20FN8zMAxq5wkvoHodO+v6IVIBl4VXnWoM2YzXn9fFZHVm7e7PvbAM2HMSFucV4UN
	 S8Mrtrvcw7dVBatRyOZHm3DD38DeT1vkdZmqKLYE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41MMkqxj110498
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Feb 2024 16:46:52 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Feb 2024 16:46:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Feb 2024 16:46:52 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41MMkqBr019739;
	Thu, 22 Feb 2024 16:46:52 -0600
Message-ID: <b6288054-4032-48a0-ac6e-f021aa71b95e@ti.com>
Date: Thu, 22 Feb 2024 16:46:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 3/3] kernel: make LOCALVERSION
 consistent between recipes
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Andreas Helbech Kleist <andreaskleist@gmail.com>,
        <openembedded-core@lists.openembedded.org>
References: <20240222103545.2970387-1-andreaskleist@gmail.com>
 <20240222103545.2970387-4-andreaskleist@gmail.com>
 <b0eff6e6-f931-4fff-bcf4-dcff40562fc8@ti.com>
 <CADkTA4NqBZafroO5qVQ9ATM1_xNidxkwmkVTPb9msDhGiooceA@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CADkTA4NqBZafroO5qVQ9ATM1_xNidxkwmkVTPb9msDhGiooceA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 41MMkqG3047451
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 22:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196045



On 2/22/2024 3:56 PM, Bruce Ashfield wrote:
> On Thu, Feb 22, 2024 at 4:51=E2=80=AFPM Ryan Eatmon via lists.openembed=
ded.org
> <reatmon=3Dti.com@lists.openembedded.org> wrote:
>>
>>
>>
>> On 2/22/2024 4:35 AM, Andreas Helbech Kleist wrote:
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> The initial fix for localversion setting in 6.3+ broke older
>>> recipes and also broke recipes setting localversion in a kernel
>>> recipe, as make-mod-scripts (and other locations) can trigger
>>> a regeneration of files and don't have access to the variable.
>>>
>>> Moving the setting of this variable to the global namespace
>>> doesn't make sense, so we follow the example of the kernel-abiversion
>>> and save a kernel-localversion to the build artifacts.
>>>
>>> Recipes that may regenerate scripts/dynamic files, must
>>> depend on the do_shared_workedir of the kernel and use the helper
>>> function to read the file storing the localversion.
>>>
>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
>>>
>>> cherry-picked from master b378eec156998eea55ba61e59103cb34fab0d07c
>>>
>>> Signed-off-by: Andreas Helbech Kleist <andreaskleist@gmail.com>
>>
>> I'm not sure what is going on with our meta-ti testing.  This set of
>> changes causes the same issue we were seeing before.  Plus, now that I=
'm
>> looking into it deeper, I'm seeing a breakage in master related to the=
se
>> same patches on there.  Not sure why the changes were not caught in ou=
r
>> testing on master back when the patches were accepted there...  Clearl=
y
>> I need some better checks on the images as part of our QC process...
>>
>> I need to figure out how to fix the issue on master and see if the sam=
e
>> change can be applied to these patches on kirkstone.  I'll try and get
>> all this done as quickly as I can.
>=20
> Please make sure to copy me directly, both as the maintainer of the
> parts of core in question and the author of the patches.
>=20
> We've had no reports of issues since any of these went in, and they
> aren't exactly a recent change. Which obviously means there's
> potentially something different in the environment or the kernel
> recipes.
>=20
> If you get a set of reproducing steps with linux-yocto and core, I
> can lend a hand with any fixes.
>=20
> Bruce

This may not be an issue with these patches per se.  It may be an issue=20
with our kernel recipes in meta-ti.  But since kirkstone is our primary=20
release vector right now, it is breaking us to accept these patches onto=20
kirkstone.  I fully acknowledge that this might solely a TI issue.  And=20
now that we are aware of the issue we are going to work very very hard=20
to find a solution as quickly as we can.

As soon as we have an understanding of how to recreate the issue outside=20
of our recipe we will definitely share with this thread.


>>
>>
>>
>>> ---
>>>    meta/classes/kernel-arch.bbclass                   |  8 --------
>>>    meta/classes/kernel.bbclass                        | 14 ++++++++++=
++++
>>>    meta/classes/kernelsrc.bbclass                     |  1 +
>>>    meta/classes/linux-kernel-base.bbclass             | 11 ++++++++++=
+
>>>    meta/classes/module-base.bbclass                   |  1 +
>>>    .../make-mod-scripts/make-mod-scripts_1.0.bb       |  3 +++
>>>    6 files changed, 30 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-a=
rch.bbclass
>>> index 0a79dea0af..62c8211621 100644
>>> --- a/meta/classes/kernel-arch.bbclass
>>> +++ b/meta/classes/kernel-arch.bbclass
>>> @@ -65,11 +65,3 @@ KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_C=
C_KERNEL_ARCH} -fuse-ld=3Dbfd ${DE
>>>    KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH=
}"
>>>    KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
>>>    TOOLCHAIN ?=3D "gcc"
>>> -
>>> -# 6.3+ requires the variable LOCALVERSION to be set to not get a "+"=
 in
>>> -# the local version. Having it empty means nothing will be added, an=
d any
>>> -# value will be appended to the local kernel version. This replaces =
the
>>> -# use of .scmversion file for setting a localversion without using
>>> -# the CONFIG_LOCALVERSION option.
>>> -KERNEL_LOCALVERSION ??=3D ""
>>> -export LOCALVERSION ?=3D "${KERNEL_LOCALVERSION}"
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclas=
s
>>> index 940f1a3cf4..96e41b5192 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -541,6 +541,7 @@ do_shared_workdir () {
>>>        #
>>>
>>>        echo "${KERNEL_VERSION}" > $kerneldir/${KERNEL_PACKAGE_NAME}-a=
biversion
>>> +     echo "${KERNEL_LOCALVERSION}" > $kerneldir/${KERNEL_PACKAGE_NAM=
E}-localversion
>>>
>>>        # Copy files required for module builds
>>>        cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>>> @@ -630,6 +631,19 @@ python check_oldest_kernel() {
>>>    check_oldest_kernel[vardepsexclude] +=3D "OLDEST_KERNEL KERNEL_VER=
SION"
>>>    do_configure[prefuncs] +=3D "check_oldest_kernel"
>>>
>>> +KERNEL_LOCALVERSION ??=3D ""
>>> +
>>> +# 6.3+ requires the variable LOCALVERSION to be set to not get a "+"=
 in
>>> +# the local version. Having it empty means nothing will be added, an=
d any
>>> +# value will be appended to the local kernel version. This replaces =
the
>>> +# use of .scmversion file for setting a localversion without using
>>> +# the CONFIG_LOCALVERSION option.
>>> +#
>>> +# Note: This class saves the value of localversion to a file
>>> +# so other recipes like make-mod-scripts can restore it via the
>>> +# helper function get_kernellocalversion_file
>>> +export LOCALVERSION=3D"${KERNEL_LOCALVERSION}"
>>> +
>>>    kernel_do_configure() {
>>>        # fixes extra + in /lib/modules/2.6.37+
>>>        # $ scripts/setlocalversion . =3D> +
>>> diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.=
bbclass
>>> index a951ba3325..a79bf18b09 100644
>>> --- a/meta/classes/kernelsrc.bbclass
>>> +++ b/meta/classes/kernelsrc.bbclass
>>> @@ -5,6 +5,7 @@ do_patch[depends] +=3D "virtual/kernel:do_shared_work=
dir"
>>>    do_patch[noexec] =3D "1"
>>>    do_package[depends] +=3D "virtual/kernel:do_populate_sysroot"
>>>    KERNEL_VERSION =3D "${@get_kernelversion_file("${STAGING_KERNEL_BU=
ILDDIR}")}"
>>> +LOCAL_VERSION =3D "${@get_kernellocalversion_file("${STAGING_KERNEL_=
BUILDDIR}")}"
>>>
>>>    inherit linux-kernel-base
>>>
>>> diff --git a/meta/classes/linux-kernel-base.bbclass b/meta/classes/li=
nux-kernel-base.bbclass
>>> index 73a6fe36d9..0e2a4a4abe 100644
>>> --- a/meta/classes/linux-kernel-base.bbclass
>>> +++ b/meta/classes/linux-kernel-base.bbclass
>>> @@ -33,6 +33,17 @@ def get_kernelversion_file(p):
>>>        except IOError:
>>>            return None
>>>
>>> +def get_kernellocalversion_file(p):
>>> +    fn =3D p + '/kernel-localversion'
>>> +
>>> +    try:
>>> +        with open(fn, 'r') as f:
>>> +            return f.readlines()[0].strip()
>>> +    except IOError:
>>> +        return ""
>>> +
>>> +    return ""
>>> +
>>>    def linux_module_packages(s, d):
>>>        suffix =3D ""
>>>        return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower(=
).replace('_', '-').replace('@', '+'), suffix), s.split()))
>>> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-b=
ase.bbclass
>>> index 27bd69ff33..5b2fde8144 100644
>>> --- a/meta/classes/module-base.bbclass
>>> +++ b/meta/classes/module-base.bbclass
>>> @@ -14,6 +14,7 @@ export CROSS_COMPILE =3D "${TARGET_PREFIX}"
>>>    export KBUILD_OUTPUT =3D "${STAGING_KERNEL_BUILDDIR}"
>>>
>>>    export KERNEL_VERSION =3D "${@oe.utils.read_file('${STAGING_KERNEL=
_BUILDDIR}/kernel-abiversion')}"
>>> +export LOCALVERSION =3D "${@oe.utils.read_file('${STAGING_KERNEL_BUI=
LDDIR}/kernel-localversion')}"
>>>    KERNEL_OBJECT_SUFFIX =3D ".ko"
>>>
>>>    # kernel modules are generally machine specific
>>> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.=
0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>> index f6f47cfff5..8727d003f9 100644
>>> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>>> @@ -21,6 +21,9 @@ DEPENDS +=3D "gmp-native"
>>>    EXTRA_OEMAKE =3D " HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_L=
DFLAGS}" HOSTCPP=3D"${BUILD_CPP}""
>>>    EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXXFLAGS} ${BU=
ILD_LDFLAGS}" CROSS_COMPILE=3D${TARGET_PREFIX}"
>>>
>>> +KERNEL_LOCALVERSION =3D "${@get_kernellocalversion_file("${STAGING_K=
ERNEL_BUILDDIR}")}"
>>> +export LOCALVERSION=3D"${KERNEL_LOCALVERSION}"
>>> +
>>>    # Build some host tools under work-shared.  CC, LD, and AR are pro=
bably
>>>    # not used, but this is the historical way of invoking "make scrip=
ts".
>>>    #
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#196043): https://lists.openembedded.org/g/openembe=
dded-core/message/196043
>> Mute This Topic: https://lists.openembedded.org/mt/104505983/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[bruce.ashfield@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

