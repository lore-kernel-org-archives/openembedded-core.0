Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 937296D44C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2013 17:11:06 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VhjOJ-0002zb-RO; Sat, 16 Nov 2013 18:11:07 +0100
Message-ID: <1384625383.3814.34.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Sat, 16 Nov 2013 18:09:43 +0000
In-Reply-To: <CAP9ODKqVib+iDsGEges9Hhy2dyWoOi2JtfhVJ+pNCs=KUq7Q4A@mail.gmail.com>
References: <1384520708.23724.12.camel@phil-desktop.brightsign>
	<CAP9ODKqVib+iDsGEges9Hhy2dyWoOi2JtfhVJ+pNCs=KUq7Q4A@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Fri, 2013-11-15 at 11:26 -0200,
	Otavio Salvador wrote:
	> Hello Phil, > > On Fri, Nov 15, 2013 at 11:05 AM,
	Phil Blundell <pb@pbcl.net>
	wrote: > > The idiomatic way to reinstate the old-style initramfs
	handling appears to be to > > set: > > > > INITRAMFS_TASK =
	"${INITRAMFS_IMAGE}:do_rootfs"
	> > What problems are you having with the 'new-style'? [...] 
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Tolerate empty INITRAMFS_IMAGE when INITRAMFS_TASK is set
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
X-List-Received-Date: Sat, 16 Nov 2013 17:11:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-11-15 at 11:26 -0200, Otavio Salvador wrote:
> Hello Phil,
> 
> On Fri, Nov 15, 2013 at 11:05 AM, Phil Blundell <pb@pbcl.net> wrote:
> > The idiomatic way to reinstate the old-style initramfs handling appears to be to
> > set:
> >
> > INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
> 
> What problems are you having with the 'new-style'?

Good question.  When I first merged the version of kernel.bbclass that
implemented the "new-style" system I was having a bunch of problems
which seemed to be due to the new code.  However, after a bit of further
debugging it now appears that most of them are issues with the
implementation rather than with the concept and selecting INITRAMFS_TASK
doesn't actually help very much because the code that was causing my
problems is shared between the two paths.

The main difficulty I was having was that kernel.bbclass was looking for
the initramfs image with slightly the wrong filename.  After a certain
amount of sleuthing and some clues from Andrea it eventually became
apparent that kernel.bbclass relies on the initramfs image recipe
leaving ${IMAGE_LINK_NAME} at its default value and will fail if it's
set to anything else.  This seems slightly fragile and it seems as
though it would be better for kernel.bbclass to look for the initramfs
image at its primary location rather than relying on the symlink.

I also discovered that the new code in kernel.bbclass uncompresses the
initramfs image before embedding it in the kernel.  I can guess why this
seemed like a good plan, but it's slightly surprising behaviour and it
seems like anybody who wanted to embed the initramfs in uncompressed
form would just select IMAGE_TYPE = "cpio" for it in the first place.
Also, Andrea reports that he does actually get worse compression overall
with this approach in at least some circumstances.

Anyway, with those things fixed I can now at least build images again
and it's entirely possible that the "new style" system would also work
for me.  However, it doesn't seem as though the new technology would
bring me any particular benefits, and as far as I can tell it would
introduce an extra kernel compile step that I don't particularly want,
so I am inclined to stick with INITRAMFS_TASK for the moment.

Right now I'm trying to debug a slightly obscure problem where, under
circumstances that aren't entirely clear to me, bitbake ends up running
linux:do_compile, linux:do_bundle_initramfs and then
linux:do_populate_sysroot but somehow overlooking do_install.  This
causes sysroot_stage_all() to blow up because the directory it's trying
to copy from doesn't exist.  I'm not entirely sure whether this is
related to the initramfs code or not, though it does only seem to affect
kernel recipes.

p.



