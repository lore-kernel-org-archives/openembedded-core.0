Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RGvjL-0005fC-KI
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 18:44:32 +0200
Received: by qam2 with SMTP id 2so2410922qam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 09:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AJYbvp0LlSfQdQ9CWfVO9mWO9F9giFNDE7ufT/oSxx0=;
	b=ZsLUNZoyqJ+mHyaCR3ibCg1j0v9nV2Rr/KfPim4esHllO327/SzEuMWZGzAhJ9A+oE
	+bmlAQNu8fIHRpVyHyoUjU604ynacRJF/3yN3DCaJn1LGcqJoyY7tZsqHn12/s1K4SW2
	x6MgL02ygKrrNawtBJ9XpqY8PohiczxWvtDII=
MIME-Version: 1.0
Received: by 10.224.198.10 with SMTP id em10mr9431446qab.44.1319128718120;
	Thu, 20 Oct 2011 09:38:38 -0700 (PDT)
Received: by 10.229.94.72 with HTTP; Thu, 20 Oct 2011 09:38:38 -0700 (PDT)
In-Reply-To: <CAMKF1spFtH+40uCMJO1nfV2h90n1FnEusooOHq3gBmrA5L+zDw@mail.gmail.com>
References: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
	<CAMKF1spFtH+40uCMJO1nfV2h90n1FnEusooOHq3gBmrA5L+zDw@mail.gmail.com>
Date: Thu, 20 Oct 2011 09:38:38 -0700
Message-ID: <CA+M6bXkZ718C7WaG9KhAbLFLfE5W52Hf9sNNTpL3u1cYk-9Z_w@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2011 16:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 9:27 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Oct 20, 2011 at 1:22 AM, James Limbouris
> <james@digitalmatter.com.au> wrote:
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
>> =A0AS =A0 =A0 =A0arch/arm/boot/compressed/head.o
>> =A0GZIP =A0 =A0arch/arm/boot/compressed/piggy.gz
>> =A0CC =A0 =A0 =A0arch/arm/boot/compressed/misc.o
>> =A0AS =A0 =A0 =A0arch/arm/boot/compressed/piggy.o
>> =A0LD =A0 =A0 =A0arch/arm/boot/compressed/vmlinux
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
>>
>
> can you post the build logs and configure logs of
> binutils sdk

I've seen the same problem with just plain old meta-toolchain and
trying to build something simple like u-boot.  Hadn't had the time to
dig at it tho.

--=20
Tom


