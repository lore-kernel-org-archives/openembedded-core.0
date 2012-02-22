Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1S0FYu-0008LC-Vu
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 18:01:05 +0100
Received: by iaby12 with SMTP id y12so289699iab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 08:52:43 -0800 (PST)
Received-SPF: pass (google.com: domain of brandon@rascalmicro.com designates
	10.42.168.197 as permitted sender) client-ip=10.42.168.197; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	brandon@rascalmicro.com designates 10.42.168.197 as permitted
	sender) smtp.mail=brandon@rascalmicro.com
Received: from mr.google.com ([10.42.168.197])
	by 10.42.168.197 with SMTP id x5mr34011749icy.6.1329929563332 (num_hops
	= 1); Wed, 22 Feb 2012 08:52:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.168.197 with SMTP id x5mr27304435icy.6.1329929563047; Wed,
	22 Feb 2012 08:52:43 -0800 (PST)
Received: by 10.231.199.138 with HTTP; Wed, 22 Feb 2012 08:52:42 -0800 (PST)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <1329912732.20261.110.camel@ted>
References: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
	<1329912732.20261.110.camel@ted>
Date: Wed, 22 Feb 2012 11:52:42 -0500
Message-ID: <CA+b4E8znKGcGq=3q+SXn6+N=A9o9Z=rkrVjT3Pf4v7CMBtipzg@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQle65A9r1g0svW3Yy/RlDe4y5MdCFfzwJVOdd8oGQQa2TZeXzKErB6faB8wiEX/uUKHSqcR
Subject: Re: Cannot satisfy the following dependencies for task-core-basic: libusb-compat (>= 0.1.3)
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
X-List-Received-Date: Wed, 22 Feb 2012 17:01:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 22, 2012 at 7:12 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2012-02-21 at 18:50 -0500, Brandon Stafford wrote:
> > In trying to build core-image-basic, it seems that libusb-compat
> > cannot be found:
> >
> > | Collected errors:
> > | =A0* satisfy_dependencies_for: Cannot satisfy the following
> > dependencies for task-core-basic:
> > | =A0* libusb-compat (>=3D 0.1.3) *
> > | =A0* opkg_install_cmd: Cannot install package task-core-basic.
> > NOTE: package core-image-basic-1.0-r0: task do_rootfs: Failed
> >
> > However, it seems like libusb-compat should be findable:
> >
> > :~/oe-core/build$ ls ../meta/recipes-support/libusb/
> > libusb1_1.0.8.bb =A0libusb-compat-0.1.3 =A0libusb-compat_0.1.3.bb
> >
> > Do I need to tell bitbake to look in recipes-support explicitly?
>
> The above error looks like its from the rootfs generation and not from
> bitbake itself.
>
> The first question is did it build libusb-compat at all? Are there any
> stamps for this in tmp/stamps/*/libusb-compat* or files in
> tmp/work/*/libusb-compat* that would suggest that it did?

Thanks for the suggestions, Richard. Answers below.

Yes, some stamps exist, but fewer than I would expect. I don't see a
do_compile step.

:~/oe-core/build/tmp-eglibc/stamps$ find . -name libusb-compat*
./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_package_write
./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_populate_lic_setscen=
e
./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_package_setscene.qem=
uarm
./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_package_write_ipk_se=
tscene
./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_populate_sysroot_set=
scene.qemuarm

However, it does look like binaries were created. For example, here is
a 13 kB ELF file:
tmp-eglibc/work/armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3/packages-=
split/libusb-compat/lib/libusb-0.1.so.4.4.4

:~/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libusb-compat-1_0=
.1.3-r3$
ls -lh packages-split/libusb-compat/lib
total 16K
lrwxrwxrwx 1 rascal rascal =A019 2012-02-14 09:03 libusb-0.1.so.4 ->
libusb-0.1.so.4.4.4
-rwxr-xr-x 1 rascal rascal 13K 2012-02-14 09:03 libusb-0.1.so.4.4.4
:~/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libusb-compat-1_0=
.1.3-r3$
file packages-split/libusb-compat/lib/libusb-0.1.so.4.4.4
packages-split/libusb-compat/lib/libusb-0.1.so.4.4.4: ELF 32-bit LSB
shared object, ARM, version 1 (SYSV), dynamically linked, stripped

> Secondly, did it place any libusb-compat package into tmp/deploy/ipk/* ?

It did not:

:~/oe-core/build/tmp-eglibc/deploy/ipk$ find . -name libusb-compat*

However, there are a bunch of libusb packages:

:~/oe-core/build/tmp-eglibc/deploy/ipk$ find . -name libusb*
./armv5te/libusb-0.1-dbg_0.1.3-r3_armv5te.ipk
./armv5te/libusb-1.0-0_1.0.8-r3_armv5te.ipk
./armv5te/libusb-1.0-dbg_1.0.8-r3_armv5te.ipk
./armv5te/libusb-1.0-dev_1.0.8-r3_armv5te.ipk
./armv5te/libusb-1.0-staticdev_1.0.8-r3_armv5te.ipk
./armv5te/libusb-0.1-dev_0.1.3-r3_armv5te.ipk
./armv5te/libusb-0.1-4_0.1.3-r3_armv5te.ipk
./armv5te/libusb-0.1-staticdev_0.1.3-r3_armv5te.ipk

If I understand how do_rootfs works from
http://docs.openembedded.org/usermanual/usermanual.html#rootfs_ipkg_class,
it seems like the ipk is not being built correctly, so do_rootfs can't
pull it into the filesystem image.

I'm not sure where to go from here. It looks like at least some code
was compiled, but somehow it's not getting packaged right.

Brandon


