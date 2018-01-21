Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC0D278757
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 10:02:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0LA2Tpx031052
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 21 Jan 2018 10:02:30 GMT
Message-ID: <1516528949.24502.54.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>, Thomas Perrot <thomas.perrot@tupi.fr>
Date: Sun, 21 Jan 2018 10:02:29 +0000
In-Reply-To: <CAJ86T=Va5HE+zYpKS29jfrB3R=yqTR1vkZuxmk21Uc_qQSzr4g@mail.gmail.com>
References: <20180117092159.19356-1-thomas.perrot@tupi.fr>
	<CAJ86T=Va5HE+zYpKS29jfrB3R=yqTR1vkZuxmk21Uc_qQSzr4g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use KERNEL_IMAGETYPE_FOR_MAKE in do_bundle_initramfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Jan 2018 10:02:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-01-17 at 13:31 -0800, Andre McCurdy wrote:
> On Wed, Jan 17, 2018 at 1:21 AM, Thomas Perrot <thomas.perrot@tupi.fr
> > wrote:
> > 
> > In the case of a fitImage the this step should be done on the
> > image use to assemble the fitImage.
> > 
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > ---
> >  meta/classes/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/kernel.bbclass
> > b/meta/classes/kernel.bbclass
> > index c42f85c665..ff09d4c4c7 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -231,7 +231,7 @@ do_bundle_initramfs () {
> >                 copy_initramfs
> >                 # Backing up kernel image relies on its
> > type(regular file or symbolic link)
> >                 tmp_path=""
> > -               for type in ${KERNEL_IMAGETYPES} ; do
> > +               for type in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
> The net result of this change is to no longer backup the non-
> initramfs
> vmlinux.gz kernel image before creating the kernel image(s)
> containing
> bundled initramfs (plus some other corner cases, depending on whether
> the legacy KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE variables are
> used and whether or not KERNEL_IMAGETYPES contains both vmlinux and
> vmlinux.gz or vmlinux.gz only).
> 
> Can you explain a little how that's related to building fitImage
> kernels?
> 
> This code in do_bundle_initramfs() is extremely fragile and changes
> may only break less well testing targets such as MIPS, so any changes
> need to be very carefully reviewed and tested.

Actually, I think it means we need better tests.

I'm seriously considering removing a lot of the stuff in kernel.bbclass
and then rebuilding things in hopefully a cleaner way. The test for
anything being needed would be whether our regression tests pass.

I appreciate the idea will fill some with horror but there are a few
places the code code is turning into an unmaintainable (and
unreviewable) mess, the kernel classes are getting there :(

Cheers,

Richard

