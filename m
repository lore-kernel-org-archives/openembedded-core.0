Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQ42e-0003ey-Ln
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 23:58:28 +0200
Received: by laai10 with SMTP id i10so908425laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 14:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=k/bIUcw8vyUNMb//J/eVW19x3hFME8ednJL+/WxrQzw=;
	b=NzXLjVce+yK4J51D5hvHMQA9yb4j0uax74kkw05A/zCtQhjHbjatZ0pnwECDO+1tFI
	vl7PrxolcyUhq2iOA3HyZTUhQpt+G3VOCqOiXZDdvXjp7HVTq6/bctQOgwyFkUIdE7a1
	UbhbkXDYXBfXd0yet/gkTM6R59pDEA5E6nF0KHy/FZ3iqgrA5EpsMhk3ptXxSDd6SoKX
	VLq9MpqSsQJkiTWLIe9Mxfxw/ZSFSHfQNLEQ1I0YX3gPWsUgaqdeqUC0I1gaKioSFQ1U
	vjii8YhB3/VU7dFuZzPMdpxzqVWzE0qRwavO+yQuaSj1+WMtRFw54y48Jy8OUF04KI0J
	E7QA==
Received: by 10.152.145.228 with SMTP id sx4mr3472628lab.45.1336081722731;
	Thu, 03 May 2012 14:48:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 14:48:12 -0700 (PDT)
In-Reply-To: <4FA2F3EC.4000607@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<71993993e48a2abeb09b5c6c86a1d8d2ebec7c25.1328510188.git.raj.khem@gmail.com>
	<4FA2F3EC.4000607@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 14:48:12 -0700
Message-ID: <CAMKF1sp-yuyzOmbtPG+DXZd7qKuja=osjbH1zs3rR3ux3wMRWQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/20] image.bbclass, kernel.bbclass: Use kmod-native instead of module-init-tools-cross
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
X-List-Received-Date: Thu, 03 May 2012 21:58:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 3, 2012 at 2:09 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> Some comments regarding implementation are needed here. For example, why
> is HOST_PREFIX no longer necessary?

Its no longer treated like a cross-tool like we did before. so depmod is re=
ally
treated as a host tool since it does not do anything target specific

>
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/classes/image.bbclass =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0meta/classes/kernel.bbclass | =C2=A0 =C2=A09 ++++-----
>> =C2=A02 files changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 3034725..adb9b39 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -173,7 +173,7 @@ fakeroot do_rootfs () {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNEL_VERSION=3D`cat $=
{STAGING_KERNEL_DIR}/kernel-abiversion`
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${IMAGE_ROOTFS=
}/lib/modules/$KERNEL_VERSION
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${TARGET_PREFIX}depmod -a -b=
 ${IMAGE_ROOTFS} -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNE=
L_VERSION
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depmod -a -b ${IMAGE_ROOTFS}=
 -F ${STAGING_KERNEL_DIR}/System.map-$KERNEL_VERSION $KERNEL_VERSION
>> =C2=A0 =C2=A0 =C2=A0 fi
>>
>> =C2=A0 =C2=A0 =C2=A0 ${IMAGE_PREPROCESS_COMMAND}
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index ec5d65e..be54f8e 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -1,7 +1,7 @@
>> =C2=A0inherit linux-kernel-base module_strip
>>
>> =C2=A0PROVIDES +=3D "virtual/kernel"
>> -DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}depmo=
d virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
>> +DEPENDS +=3D "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_=
PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
>>
>> =C2=A0# we include gcc above, we dont need virtual/libc
>> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>> @@ -259,7 +259,7 @@ if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
>> =C2=A0 =C2=A0 =C2=A0 mkdir -p $D/lib/modules/${KERNEL_VERSION}
>> =C2=A0fi
>> =C2=A0if [ -n "$D" ]; then
>> - =C2=A0 =C2=A0 ${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/S=
ystem.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>> + =C2=A0 =C2=A0 depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KE=
RNEL_VERSION} ${KERNEL_VERSION}
>> =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 depmod -a
>> =C2=A0fi
>> @@ -267,7 +267,7 @@ fi
>>
>> =C2=A0pkg_postinst_modules () {
>> =C2=A0if [ -n "$D" ]; then
>> - =C2=A0 =C2=A0 ${HOST_PREFIX}depmod -A -b $D -F ${STAGING_KERNEL_DIR}/S=
ystem.map-${KERNEL_VERSION} ${KERNEL_VERSION}
>> + =C2=A0 =C2=A0 depmod -a -b $D -F ${STAGING_KERNEL_DIR}/System.map-${KE=
RNEL_VERSION} ${KERNEL_VERSION}
>> =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 depmod -a
>> =C2=A0 =C2=A0 =C2=A0 update-modules || true
>> @@ -339,9 +339,8 @@ python populate_packages_prepend () {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 kernelver_stripped =3D m.group(1)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 path =3D d.getVar("PATH=
", 1)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_prefix =3D d.getVar("HO=
ST_PREFIX", 1) or ""
>>
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D "PATH=3D\"%s\" %sdep=
mod -n -a -r -b %s -F %s/boot/System.map-%s %s" % (path, host_prefix, dvar,=
 dvar, kernelver, kernelver_stripped)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D "PATH=3D\"%s\" depmo=
d -n -a -b %s -F %s/boot/System.map-%s %s" % (path, dvar, dvar, kernelver, =
kernelver_stripped)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f =3D os.popen(cmd, 'r'=
)
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D {}
>
> --
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel


