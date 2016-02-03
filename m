Return-Path: <alexandru.but@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id A761C77144
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 10:39:26 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u13AdPFr020878; Wed, 3 Feb 2016 04:39:25 -0600
Received: from zdravan.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020304392524-594925 ;
	Wed, 3 Feb 2016 04:39:25 -0600 
Date: Wed, 3 Feb 2016 12:39:23 +0200
From: Alexandru But <alexandru.but@ni.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20160203103923.GA30675@zdravan.emea.corp.natinst.com>
References: <1454436308-29949-1-git-send-email-alexandru.but@ni.com>
	<1454438419.22468.178.camel@linux.intel.com>
	<CADkTA4OgkC7ytFj=fvg2V4upqTNJCc=k=ofEAh-biS06uF917g@mail.gmail.com>
	<1454440198.22468.187.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1454440198.22468.187.camel@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/03/2016 04:39:25 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/03/2016 04:39:25 AM,
	Serialize complete at 02/03/2016 04:39:25 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-03_04:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: backport uapi header list
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
X-List-Received-Date: Wed, 03 Feb 2016 10:39:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 02, 2016 at 11:09:58AM -0800, Saul Wold wrote:
> On Tue, 2016-02-02 at 13:47 -0500, Bruce Ashfield wrote:
> > 
> > 
> > On Tue, Feb 2, 2016 at 1:40 PM, Saul Wold <sgw@linux.intel.com>
> > wrote:
> > > On Tue, 2016-02-02 at 20:05 +0200, Alexandru But wrote:
> > > > nvme uapi header was renamed from nvme.h to nvme_ioctl.h in linux
> > > > 4.4, but the
> > > > header list was not updated. This causes efivar (and maybe other)
> > > > package build
> > > > to fail. This should fix the build while the commit is backported
> > > in
> > > > the
> > > > kernel.
> > > >
> > > Would it not make more sense to fix efivar (and maybe others)
> > > instead
> > > of changing the kernel headers, which were clearly changed for a
> > > reason
> > > to start with.
> > Yep. But I recall some argument against that. I'm on a plane at the
> > moment
> > and can't check my references.
> > ??
> > > ??
> > > This patch seems to be pending:??
> > > https://gitweb.gentoo.org/repo/gentoo.git/tree/sys-libs/efivar/file
> > > s/0.
> > > 21-nvme_ioctl.h.patch
> > > 
> > > And a more appropriate patch to the kernel headers would be
> > > backporting
> > > this already merged patch:
> > > 
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/com
> > > mit/
> > > ?id=a9cf8284b45110a4d98aea180a89c857e53bf850
> > > 
> > > You can request that Bruce (the linux-yocto maintainer) backport
> > > this
> > > patch via the linux-yocto@yoctoproject.org??list.
> > > 
> > Maybe I'm missing something, but wouldn't that just fix projects that
> > build against
> > linux-yocto ? If that's good enough, then yes, I can cherry pick the
> > patch (or
> > better yet, get it via -stable).
> > 
> > but we'd still need to update the linux-libc-headers, since unless
> > these apps
> > are building against the kernel_staging_dir, they are using the libc-
> > headers
> > variant of the header. 
> > 
> > Right ? .. or again, I may be missing what efivar is building
> > against.
> > 
> There seems to be a patch on the gentoo version of efivar to address
> getting the correct header (the first patch I listed above) for efivar,
> that in conjunction with adding the patch to linux-libc-headers to fix
> the installation of the nvme-ioctl.h should solve the problem, at least
> for efivar.
> 
> So the header file install of nvme-ioctl.h patch would be need to be
> backported to both the linux-libc-headers and linux-yocto. My bad for
> not checking the linux-libc-headers recipe more carefully.
> 
> 
> Sau!
> 

I should of added more context to this. Here is the analisys and the discussion
had after efivar start failing, along with some feedback from Bruce:
http://lists.openembedded.org/pipermail/openembedded-devel/2016-February/105790.html

The patch applyed to the linux-libc-headers is the one that got in the mainline
and Saul referenced above. The change should be backported to the stable 4.4
linux archive that this recipe uses, but until then we can have the build
working like this. Another option wich would spare the work to remove this
patch later on would be to backport this patch to linux 4.4.1 and update the
recipe version. The time window should be short enough to do it, but maybe
some would consider there is a high risk of breaking other things.

I sent the gentoo patch to meta-oe layer just after sending this one.
http://patches.openembedded.org/patch/114375/

Regards,
Alex But

> 
> 
> > Bruce
> > ??
> > > ??
> > > Sau!
> > > ??
> > > > Signed-off-by: Alexandru But <alexandru.but@ni.com>
> > > > ---
> > > > ??...i-update-install-list-after-nvme.h-rename.patch | 34
> > > > ++++++++++++++++++++++
> > > > ??.../linux-libc-headers/linux-libc-headers_4.4.bb??????|????4 +++
> > > > ??2 files changed, 38 insertions(+)
> > > > ??create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-
> > > > libc-headers/0001-uapi-update-install-list-after-nvme.h-
> > > rename.patch
> > > >
> > > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > > > headers/0001-uapi-update-install-list-after-nvme.h-rename.patch
> > > > b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-
> > > > uapi-update-install-list-after-nvme.h-rename.patch
> > > > new file mode 100644
> > > > index 0000000..4d9f5a1
> > > > --- /dev/null
> > > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > > headers/0001-
> > > > uapi-update-install-list-after-nvme.h-rename.patch
> > > > @@ -0,0 +1,34 @@
> > > > +From a9cf8284b45110a4d98aea180a89c857e53bf850 Mon Sep 17
> > > 00:00:00
> > > > 2001
> > > > +From: Mike Frysinger <vapier@gentoo.org>
> > > > +Date: Sun, 10 Jan 2016 20:14:11 -0500
> > > > +Subject: [PATCH] uapi: update install list after nvme.h rename
> > > > +
> > > > +Commit 9d99a8dda154 ("nvme: move hardware structures out of the
> > > uapi
> > > > +version of nvme.h") renamed nvme.h to nvme_ioctl.h, but the uapi
> > > > list
> > > > +still refers to nvme.h.????People trying to install the headers
> > > hit a
> > > > +failure as the header no longer exists.
> > > > +
> > > > +Cc: stable@vger.kernel.org
> > > > +Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > > > +Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > > +Signed-off-by: Jens Axboe <axboe@fb.com>
> > > > +---
> > > > + include/uapi/linux/Kbuild | 2 +-
> > > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/include/uapi/linux/Kbuild
> > > b/include/uapi/linux/Kbuild
> > > > +index 628e6e6..88e1292 100644
> > > > +--- a/include/uapi/linux/Kbuild
> > > > ++++ b/include/uapi/linux/Kbuild
> > > > +@@ -306,7 +306,7 @@ header-y += nfs_mount.h
> > > > + header-y += nl80211.h
> > > > + header-y += n_r3964.h
> > > > + header-y += nubus.h
> > > > +-header-y += nvme.h
> > > > ++header-y += nvme_ioctl.h
> > > > + header-y += nvram.h
> > > > + header-y += omap3isp.h
> > > > + header-y += omapfb.h
> > > > +--
> > > > +2.6.1
> > > > +
> > > > diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > > > headers_4.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-
> > > libc-
> > > > headers_4.4.bb
> > > > index 3763dc0..c8c7a10 100644
> > > > --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > > > headers_4.4.bb
> > > > +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-
> > > > headers_4.4.bb
> > > > @@ -5,5 +5,9 @@ SRC_URI_append_libc-musl = "\
> > > > ??????????file://0002-libc-compat.h-prevent-redefinition-of-struct-
> > > > ethhdr.patch \
> > > > ??????????file://0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
> > > \
> > > > ????????"
> > > > +SRC_URI_append ="\
> > > > +????????file://0001-uapi-update-install-list-after-nvme.h-
> > > rename.patch \
> > > > +??????"
> > > > +
> > > > ??SRC_URI[md5sum] = "9a78fa2eb6c68ca5a40ed5af08142599"
> > > > ??SRC_URI[sha256sum] =
> > > >
> > > "401d7c8fef594999a460d10c72c5a94e9c2e1022f16795ec51746b0d165418b2"
> > > > --
> > > > 2.6.1
> > > >
> > > 
> > 
> > 

