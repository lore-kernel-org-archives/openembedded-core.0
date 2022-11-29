Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3254C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 15:42:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.152740.1669736542524415279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 07:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 36B5B40A46;
	Tue, 29 Nov 2022 15:42:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtyXTVvvjWks; Tue, 29 Nov 2022 15:42:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B808400CF;
	Tue, 29 Nov 2022 15:42:18 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 90D1F163690; Tue, 29 Nov 2022 10:42:11 -0500 (EST)
Date: Tue, 29 Nov 2022 10:42:11 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Steve Sakoman <steve@sakoman.com>
Cc: vkumbhar <vkumbhar@mvista.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell][PATCH v2] qemu: fix CVE-2021-20196 block
 fdc null pointer dereference may lead to guest crash
Message-ID: <20221129154211.GR22689@denix.org>
References: <20221129110832.1040199-1-vkumbhar@mvista.com>
 <CAOSpxdbX=7Wz3m9XWVX6wbkwZeMJu3uMzSM3nS5G4bfc0AkzdQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSpxdbX=7Wz3m9XWVX6wbkwZeMJu3uMzSM3nS5G4bfc0AkzdQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173978

On Tue, Nov 29, 2022 at 04:56:08AM -1000, Steve Sakoman wrote:
> On Tue, Nov 29, 2022 at 1:08 AM vkumbhar <vkumbhar@mvista.com> wrote:
> >
> > From: Vivek Kumbhar <vkumbhar@mvista.com>
> >
> > Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]

Plus Upstream-Status is not needed here ^^^, only down there in the patch file itself.


> > Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc           |  1 +
> >  .../qemu/qemu/CVE-2021-20196.patch            | 62 +++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> >  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> > index 764f948a28..a915b54c1a 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -113,6 +113,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
> >             file://CVE-2022-0216-2.patch \
> >             file://CVE-2021-3750.patch \
> >            file://CVE-2021-3638.patch \
> > +          file://CVE-2021-20196.patch \
> >             "
> >  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> > new file mode 100644
> > index 0000000000..24da80e7db
> > --- /dev/null
> > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> > @@ -0,0 +1,62 @@
> > +From 94608c59045791dfd35102bc59b792e96f2cfa30 Mon Sep 17 00:00:00 2001
> > +From: Vivek Kumbhar <vkumbhar@mvista.com>
> > +Date: Tue, 29 Nov 2022 15:57:13 +0530
> > +Subject: [PATCH] CVE-2021-20196
> > +
> > +Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> 
> This should be: Upstream-Status: Backport
> [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]
> 
> I've fixed it, so no need for a v2.
> 
> Steve
> 
> > +CVE: CVE-2021-20196
> > +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> > +
> > +hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
> > +
> > +Guest might select another drive on the bus by setting the
> > +DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
> > +The current controller model doesn't expect a BlockBackend
> > +to be NULL. A simple way to fix CVE-2021-20196 is to create
> > +an empty BlockBackend when it is missing. All further
> > +accesses will be safely handled, and the controller state
> > +machines keep behaving correctly.
> > +---
> > + hw/block/fdc.c | 19 ++++++++++++++++++-
> > + 1 file changed, 18 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> > +index ac5d31e8..e128e975 100644
> > +--- a/hw/block/fdc.c
> > ++++ b/hw/block/fdc.c
> > +@@ -58,6 +58,11 @@
> > +         }                                                       \
> > +     } while (0)
> > +
> > ++/* Anonymous BlockBackend for empty drive */
> > ++static BlockBackend *blk_create_empty_drive(void)
> > ++{
> > ++    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
> > ++}
> > +
> > + /********************************************************/
> > + /* qdev floppy bus                                      */
> > +@@ -1356,7 +1361,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
> > +
> > + static FDrive *get_cur_drv(FDCtrl *fdctrl)
> > + {
> > +-    return get_drv(fdctrl, fdctrl->cur_drv);
> > ++    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
> > ++
> > ++    if (!cur_drv->blk) {
> > ++        /*
> > ++         * Kludge: empty drive line selected. Create an anonymous
> > ++         * BlockBackend to avoid NULL deref with various BlockBackend
> > ++         * API calls within this model (CVE-2021-20196).
> > ++         * Due to the controller QOM model limitations, we don't
> > ++         * attach the created to the controller device.
> > ++         */
> > ++        cur_drv->blk = blk_create_empty_drive();
> > ++    }
> > ++    return cur_drv;
> > + }
> > +
> > + /* Status A register : 0x00 (read-only) */
> > +--
> > +2.25.1
> > +
> > --
> > 2.25.1
> >
> >
> > 
> >

