Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0GPg-00017H-Az for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 18:55:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MHlGs6031840
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 17:47:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30866-06 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 17:47:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MHl8LZ031834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 17:47:09 GMT
Message-ID: <1329932828.32110.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 17:47:08 +0000
In-Reply-To: <CA+b4E8znKGcGq=3q+SXn6+N=A9o9Z=rkrVjT3Pf4v7CMBtipzg@mail.gmail.com>
References: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
	<1329912732.20261.110.camel@ted>
	<CA+b4E8znKGcGq=3q+SXn6+N=A9o9Z=rkrVjT3Pf4v7CMBtipzg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 22 Feb 2012 17:55:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 11:52 -0500, Brandon Stafford wrote:
> On Wed, Feb 22, 2012 at 7:12 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > The first question is did it build libusb-compat at all? Are there any
> > stamps for this in tmp/stamps/*/libusb-compat* or files in
> > tmp/work/*/libusb-compat* that would suggest that it did?
> 
> Thanks for the suggestions, Richard. Answers below.
> 
> Yes, some stamps exist, but fewer than I would expect. I don't see a
> do_compile step.
> 
> :~/oe-core/build/tmp-eglibc/stamps$ find . -name libusb-compat*
> ./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_package_write
> ./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_populate_lic_setscene
> ./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_package_setscene.qemuarm
> ./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_package_write_ipk_setscene
> ./armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3.do_populate_sysroot_setscene.qemuarm

What this means is that it build libusb-compat from the sstate cache
rather than building it completely from scratch. The
do_package_write_ipk_setscene in particular means it should have
installed some .ipk files into tmp/deploy/ipk/.

> However, it does look like binaries were created. For example, here is
> a 13 kB ELF file:
> tmp-eglibc/work/armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3/packages-split/libusb-compat/lib/libusb-0.1.so.4.4.4
> 
> :~/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3$
> ls -lh packages-split/libusb-compat/lib
> total 16K
> lrwxrwxrwx 1 rascal rascal  19 2012-02-14 09:03 libusb-0.1.so.4 ->
> libusb-0.1.so.4.4.4
> -rwxr-xr-x 1 rascal rascal 13K 2012-02-14 09:03 libusb-0.1.so.4.4.4
> :~/oe-core/build/tmp-eglibc/work/armv5te-oe-linux-gnueabi/libusb-compat-1_0.1.3-r3$
> file packages-split/libusb-compat/lib/libusb-0.1.so.4.4.4
> packages-split/libusb-compat/lib/libusb-0.1.so.4.4.4: ELF 32-bit LSB
> shared object, ARM, version 1 (SYSV), dynamically linked, stripped
> 
> > Secondly, did it place any libusb-compat package into tmp/deploy/ipk/* ?
> 
> It did not:
> 
> :~/oe-core/build/tmp-eglibc/deploy/ipk$ find . -name libusb-compat*
> 
> However, there are a bunch of libusb packages:
> 
> :~/oe-core/build/tmp-eglibc/deploy/ipk$ find . -name libusb*
> ./armv5te/libusb-0.1-dbg_0.1.3-r3_armv5te.ipk
> ./armv5te/libusb-1.0-0_1.0.8-r3_armv5te.ipk
> ./armv5te/libusb-1.0-dbg_1.0.8-r3_armv5te.ipk
> ./armv5te/libusb-1.0-dev_1.0.8-r3_armv5te.ipk
> ./armv5te/libusb-1.0-staticdev_1.0.8-r3_armv5te.ipk
> ./armv5te/libusb-0.1-dev_0.1.3-r3_armv5te.ipk
> ./armv5te/libusb-0.1-4_0.1.3-r3_armv5te.ipk
> ./armv5te/libusb-0.1-staticdev_0.1.3-r3_armv5te.ipk

I think the library renaming code is renaming "libusb-compat" to a
package called "libusb-0.1" using the 'debian' renaming code. Your
packages are therefore present.

> If I understand how do_rootfs works from
> http://docs.openembedded.org/usermanual/usermanual.html#rootfs_ipkg_class,
> it seems like the ipk is not being built correctly, so do_rootfs can't
> pull it into the filesystem image.
> 
> I'm not sure where to go from here. It looks like at least some code
> was compiled, but somehow it's not getting packaged right.

It appears for some reason the system wants a "libusb-compat" when it
should be looking for a "libusb-0.1". This would imply that somewhere,
the renaming failed, either in the dependencies of some package, or at
the rootfs creation point itself.

If you look at the tmp/deploy/ipk/*/Packages index file, you should see
the dependencies of each package listed. It would be interesting to see
if something is depending on "libusb-compat". If there is something I'd
be tempted to try running "bitbake xxx -c cleansstate" and rebuilding
that specific recipe.

If there is nothing listing libusb-compat in index, the problem is in
the rootfs step itself.

Cheers,

Richard



