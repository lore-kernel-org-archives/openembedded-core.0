Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RGzFu-0006u5-J0
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 22:30:22 +0200
Received: by qyk35 with SMTP id 35so5643091qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 13:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=J9dDiTh+jbotCeoS2+PtZ0Ytrc1s0A2QuZV0u+4bgEU=;
	b=TAmzJvbPyN/21v2pHp8SOAI8SqX8fUuVdobr1fNJ4SjLfKTEyv8vGeGzD2SNGA4erj
	HLdBJ0onZdx7ZjwxbLmXsFdjQw+UCAxRK5bPs1fUcjz6m/cmkzHcU+CrgobLRdPzPGw+
	5lf59y3N+a7SZ2CYK8xRa0f9kWrkS+LVyn6F4=
MIME-Version: 1.0
Received: by 10.229.251.73 with SMTP id mr9mr2622523qcb.264.1319142266608;
	Thu, 20 Oct 2011 13:24:26 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Thu, 20 Oct 2011 13:24:26 -0700 (PDT)
In-Reply-To: <1319129657.2410.57.camel@ted>
References: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
	<1319129657.2410.57.camel@ted>
Date: Thu, 20 Oct 2011 13:24:26 -0700
Message-ID: <CA+M6bXm9zigRMzMQSdwntHAUYD+vBAmuLbAdNA7RPkBM=wwFNA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sdk path problem
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
X-List-Received-Date: Thu, 20 Oct 2011 20:30:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 9:54 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-10-20 at 08:22 +0000, James Limbouris wrote:
>> Hi,
>>
>> I have been using meta-toolchain-qte in the past to cross compile a Qt a=
pp, and the Linux kernel.
>> Recently I replaced my old SDK image with a fresh one, and found that I =
could not link vmlinux anymore.
>>
>> When building the kernel, I use the following ('rica' is the distributio=
n name):
>> export PATH=3D$PATH:/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ri=
casdk-linux/usr/bin/armv5te-rica-linux-gnueabi/
>> make ARCH=3Darm CROSS_COMPILE=3Darm-rica-linux-gnueabi- zImage
>>
>> The new error message is:
>>
>> Kernel: arch/arm/boot/Image is ready
>> =A0 AS =A0 =A0 =A0arch/arm/boot/compressed/head.o
>> =A0 GZIP =A0 =A0arch/arm/boot/compressed/piggy.gz
>> =A0 CC =A0 =A0 =A0arch/arm/boot/compressed/misc.o
>> =A0 AS =A0 =A0 =A0arch/arm/boot/compressed/piggy.o
>> =A0 LD =A0 =A0 =A0arch/arm/boot/compressed/vmlinux
>> arm-rica-linux-gnueabi-ld: cannot find libgcc.a: No such file or directo=
ry
>>
>> Comparing the build with the old sdk to the build with the new one, I fi=
nd that the command line for linking has changed from:
>>
>> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym in=
itrd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefined =
-X /usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi/usr/=
lib/arm-rica-linux-gnueabi/4.5.4/libgcc.a -T arch/arm/boot/compressed/vmlin=
ux.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arc=
h/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux
>>
>> to:
>>
>> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym in=
itrd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefined =
-X libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compresse=
d/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -=
o arch/arm/boot/compressed/vmlinux
>>
>> So libgcc.a has lost its path qualification.
>> I also straced the two linker commands, and found that they differed in =
one sequence.
>>
>> Old:
>> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|0755, =
st_size=3D4096, ...}) =3D 0
>> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_IFD=
IR|0755, st_size=3D4096, ...}) =3D 0
>> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnu=
eabi", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>>
>> New:
>> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|0755, =
st_size=3D4096, ...}) =3D 0
>> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_IFD=
IR|0755, st_size=3D4096, ...}) =3D 0
>> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnu=
eabi", 0xbffe67cc) =3D -1 ENOENT (No such file or directory)
>>
>> Both toolchains are looking for a sysroot at 'arm-rica-linux-gnueabi', b=
ut the new toolchain should be looking at 'armv5te-rica-linux-gnueabi', as =
the names have changed.
>> I'm not yet acquainted with the darker arts of toolchain generation. Can=
 anyone help with this?
>
> There should be a --sysroot option being passed to the compiler/linker
> to tell which sysroot to look at. We did recently change the sysroot
> location to reflect the target architecture it was optimized for but
> this does mean the compiler and other tools need the correct sysroot
> path to be specified. The environment script that ships with the
> toolchain should do this?

At least not for things like u-boot and the kernel, no, this isn't
enough.  Just re-confirmed.

--=20
Tom


