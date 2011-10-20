Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH1WV-0003TS-PC
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 00:55:48 +0200
Received: by yxj20 with SMTP id 20so986467yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 15:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=9cD094PCUTREWnGFqbipQaxVTkWC64NysDpVBFigNNw=;
	b=E7VeIJCpq4QIRuAlAOuiR7i7/NxaxMuovw19+zJbgnerJ1kPH3gmBGzWO9Cw6MQmaD
	wJUQMZwcXn1Xihm6PH7tSL5rwfJBhwh4rLWng88v8tncL89DfSECIB0Bml4hFoj+dQxR
	dshCqYHR8aegA5ArZLo7I0kNdGF8twREji9fY=
Received: by 10.68.17.193 with SMTP id q1mr22821156pbd.98.1319150983088; Thu,
	20 Oct 2011 15:49:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 15:49:13 -0700 (PDT)
In-Reply-To: <1319148494.2410.100.camel@ted>
References: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
	<1319129657.2410.57.camel@ted>
	<CA+M6bXm9zigRMzMQSdwntHAUYD+vBAmuLbAdNA7RPkBM=wwFNA@mail.gmail.com>
	<1319148494.2410.100.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 15:49:13 -0700
Message-ID: <CAMKF1srf2LKe8iv5-KjC7crWFS5pvwbQZArZAzPB33Lmmn1xZA@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2011 22:55:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 3:08 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-10-20 at 13:24 -0700, Tom Rini wrote:
>> On Thu, Oct 20, 2011 at 9:54 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Thu, 2011-10-20 at 08:22 +0000, James Limbouris wrote:
>> >> Hi,
>> >>
>> >> I have been using meta-toolchain-qte in the past to cross compile a Q=
t app, and the Linux kernel.
>> >> Recently I replaced my old SDK image with a fresh one, and found that=
 I could not link vmlinux anymore.
>> >>
>> >> When building the kernel, I use the following ('rica' is the distribu=
tion name):
>> >> export PATH=3D$PATH:/usr/local/rica-eglibc-i686-armv5te/sysroots/i686=
-ricasdk-linux/usr/bin/armv5te-rica-linux-gnueabi/
>> >> make ARCH=3Darm CROSS_COMPILE=3Darm-rica-linux-gnueabi- zImage
>> >>
>> >> The new error message is:
>> >>
>> >> Kernel: arch/arm/boot/Image is ready
>> >> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/head.o
>> >> =C2=A0 GZIP =C2=A0 =C2=A0arch/arm/boot/compressed/piggy.gz
>> >> =C2=A0 CC =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/misc.o
>> >> =C2=A0 AS =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/piggy.o
>> >> =C2=A0 LD =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/vmlinux
>> >> arm-rica-linux-gnueabi-ld: cannot find libgcc.a: No such file or dire=
ctory
>> >>
>> >> Comparing the build with the old sdk to the build with the new one, I=
 find that the command line for linking has changed from:
>> >>
>> >> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym=
 initrd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefin=
ed -X /usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi/u=
sr/lib/arm-rica-linux-gnueabi/4.5.4/libgcc.a -T arch/arm/boot/compressed/vm=
linux.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o =
arch/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux
>> >>
>> >> to:
>> >>
>> >> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym=
 initrd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefin=
ed -X libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compre=
ssed/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.=
o -o arch/arm/boot/compressed/vmlinux
>> >>
>> >> So libgcc.a has lost its path qualification.
>> >> I also straced the two linker commands, and found that they differed =
in one sequence.
>> >>
>> >> Old:
>> >> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|075=
5, st_size=3D4096, ...}) =3D 0
>> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_=
IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-=
gnueabi", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> >>
>> >> New:
>> >> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|075=
5, st_size=3D4096, ...}) =3D 0
>> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_=
IFDIR|0755, st_size=3D4096, ...}) =3D 0
>> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-=
gnueabi", 0xbffe67cc) =3D -1 ENOENT (No such file or directory)
>> >>
>> >> Both toolchains are looking for a sysroot at 'arm-rica-linux-gnueabi'=
, but the new toolchain should be looking at 'armv5te-rica-linux-gnueabi', =
as the names have changed.
>> >> I'm not yet acquainted with the darker arts of toolchain generation. =
Can anyone help with this?
>> >
>> > There should be a --sysroot option being passed to the compiler/linker
>> > to tell which sysroot to look at. We did recently change the sysroot
>> > location to reflect the target architecture it was optimized for but
>> > this does mean the compiler and other tools need the correct sysroot
>> > path to be specified. The environment script that ships with the
>> > toolchain should do this?
>>
>> At least not for things like u-boot and the kernel, no, this isn't
>> enough. =C2=A0Just re-confirmed.
>
> The place I'd start looking is how to ensure the tools get called with
> the right flags.
>
> The end result may be we need to create separate cross bin directories
> for each target sysroot with wrapper scripts for the tools to ensure the
> right flags get passed. Rather nasty and I'd prefer not to but I don't
> see easy alternatives if getting the flags to the tools is a problem.

linker also has its own notion of sysroot when invoked bare and I suspect t=
hats
coming into play here thats why I asked for build logs.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


