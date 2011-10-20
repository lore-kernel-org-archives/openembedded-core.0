Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RGvZ7-0003EB-Rf
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 18:33:57 +0200
Received: by qam2 with SMTP id 2so2400326qam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 09:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=Aal/h28m1HNLswmIi1fR6j+EtVVREBVHWbEjQURx1ew=;
	b=HNFzJqDV9FcRceoiHMyqh+mJQHx0NelEHPo6wR4DlOIOGYyKi3XIOxhgolupm05M9Q
	fw6pJeJuF6AgWWSGLmXmt7buy5x0Rp3LRTl5GATC/GRv5TDX0o3QO+HT6xgXk52CA9BF
	G2I7DH1zlBR8nQiP3xQlfLzVuCWvm8ORgwjb4=
Received: by 10.68.17.225 with SMTP id r1mr21412571pbd.64.1319128081117; Thu,
	20 Oct 2011 09:28:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 09:27:31 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
References: <AcyO/XTRcrseDRejRsCNTp7OP0osCQ==>
	<840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 09:27:31 -0700
Message-ID: <CAMKF1spFtH+40uCMJO1nfV2h90n1FnEusooOHq3gBmrA5L+zDw@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Oct 2011 16:33:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 1:22 AM, James Limbouris
<james@digitalmatter.com.au> wrote:
> Hi,
>
> I have been using meta-toolchain-qte in the past to cross compile a Qt ap=
p, and the Linux kernel.
> Recently I replaced my old SDK image with a fresh one, and found that I c=
ould not link vmlinux anymore.
>
> When building the kernel, I use the following ('rica' is the distribution=
 name):
> export PATH=3D$PATH:/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ric=
asdk-linux/usr/bin/armv5te-rica-linux-gnueabi/
> make ARCH=3Darm CROSS_COMPILE=3Darm-rica-linux-gnueabi- zImage
>
> The new error message is:
>
> Kernel: arch/arm/boot/Image is ready
> =C2=A0AS =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/head.o
> =C2=A0GZIP =C2=A0 =C2=A0arch/arm/boot/compressed/piggy.gz
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/misc.o
> =C2=A0AS =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/piggy.o
> =C2=A0LD =C2=A0 =C2=A0 =C2=A0arch/arm/boot/compressed/vmlinux
> arm-rica-linux-gnueabi-ld: cannot find libgcc.a: No such file or director=
y
>
> Comparing the build with the old sdk to the build with the new one, I fin=
d that the command line for linking has changed from:
>
> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym ini=
trd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefined -=
X /usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi/usr/l=
ib/arm-rica-linux-gnueabi/4.5.4/libgcc.a -T arch/arm/boot/compressed/vmlinu=
x.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arch=
/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux
>
> to:
>
> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=3D0x80008000 --defsym ini=
trd_phys=3D0x80800000 --defsym params_phys=3D0x80000100 -p --no-undefined -=
X libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed=
/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o=
 arch/arm/boot/compressed/vmlinux
>
> So libgcc.a has lost its path qualification.
> I also straced the two linker commands, and found that they differed in o=
ne sequence.
>
> Old:
> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|0755, s=
t_size=3D4096, ...}) =3D 0
> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_IFDI=
R|0755, st_size=3D4096, ...}) =3D 0
> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnue=
abi", {st_mode=3DS_IFDIR|0755, st_size=3D4096, ...}) =3D 0
>
> New:
> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=3DS_IFDIR|0755, s=
t_size=3D4096, ...}) =3D 0
> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=3DS_IFDI=
R|0755, st_size=3D4096, ...}) =3D 0
> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnue=
abi", 0xbffe67cc) =3D -1 ENOENT (No such file or directory)
>
> Both toolchains are looking for a sysroot at 'arm-rica-linux-gnueabi', bu=
t the new toolchain should be looking at 'armv5te-rica-linux-gnueabi', as t=
he names have changed.
> I'm not yet acquainted with the darker arts of toolchain generation. Can =
anyone help with this?
>

can you post the build logs and configure logs of
binutils sdk

> Regards,
> James Limbouris
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


