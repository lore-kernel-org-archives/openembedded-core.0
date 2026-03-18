Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6451088E58
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 23:31:14 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28308.1773876673984922454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 16:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=VD+9OAhJ;
 dkim=pass header.i=@valla.it header.s=default header.b=l0PAVKf0;
 spf=pass (domain: valla.it, ip: 185.56.87.12, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	 b=bjrOKkxx6lh0N+c5MZvDq9n6aPVNLEYpJzB4kbWIf09gYVhMu/ao8oAI9Pw8AApTJ0yZYV8Hzq
	  u7zcAny5cLa6oGMEhpNb0UZtt2k/HO6TOrYvxFzrvHh8S3807jOneOV9wtQKL0ttPxiwf+uJUK
	  BZzjNxvqqFUqzq21xBssTXfdDueXIrkXLG7TKZd3FCP+Ecomqo32G90xv6NMmF7rfmA4iyr9QD
	  xHqk1P5oXPL9Ch9xUE72vlvjBq+i6Bq55fGmwZbgNFfw6TsdVoyPHDe0lvrx3BuQviqWAbelWE
	  bosyPztQ0kAf0i4ikpzz5qlsuw8dgjMreMylO4wnOV6ixg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	bh=vp9Ez4YioVeajY7StQEAwZDsz37+8WipB52FZrP8Wpo=;
	h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	  Subject:From:DKIM-Signature:DKIM-Signature;
	b=AyOiS+J8hgqGB07wiiTYq4k066w526m/F4c1HvA838yBX//cVnY7ELHrxQ/NFhxxq4xuGWtWOO
	  CiVd6EHTEY/yEgLAxa14uPeUL7K9pas3IFmAin6jQAVVqm6N8wMmUKPjOs0BRvVkmFnhjnlzdL
	  22i+QaQjc2oaEEvNdJyjxvpslQAkRZ/g7IwTbAZmqC8frFKFAj+3Zi5VvpL2q1xNaIuHDKfFFB
	  a3v4HQ28skp0sQH/0UmpIJPxYJxWG5Xr+5mTL7A+znQuMYTl4azzgqUeWWe2xwnvzfE5uZjaDL
	  TxxPOHD/nLALuIe+MxvKwL8htP5+Jxl38PUiAhtDFdQuLA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:List-Unsubscribe;
	bh=cSFBjaH7dz5GdHKiG800/rS2ALDDPknElY3uiAcMrkA=; b=VD+9OAhJjogL4Px/1pFjayK5f/
	GgIjh+5BXOjs1RrszDoaa7Y5pdNRT+rS+xCX859WsKNfjbX+3YTEXmsIXabQx2NJBIfFIZAtc/vjE
	OoPnuKRNU73sKz/Ej9NMowIl/el6IjmoNi18iT29NrQ63K08tSg2QrLByV7V8sysq/iA=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lx-00000000hUP-2Bo8
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Mar 2026 23:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Date:Subject:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=cSFBjaH7dz5GdHKiG800/rS2ALDDPknElY3uiAcMrkA=; b=l0PAVKf0KG5JBD7xnPvFVelDmx
	GpUWpifaWPVIw2wuuH8/6os4dwHH6D1T3iN/MZAxDnKVab87y2TIlio2Tf3mZmJOs5va/csDnelAs
	6RiNWoY9DnWgwhsVdSzmcsLEt81h6yZUSIMWxYFfQDxaq2bMk7emDEvHZNUonKSmqQ2c=;
Received: from [82.57.88.19] (port=60381 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lr-00000000OEU-1RVt;
	Wed, 18 Mar 2026 23:30:59 +0000
From: Francesco Valla <francesco@valla.it>
Subject: [PATCH RFC 0/4] Add support for bootconfig on initramfs and FIT
 images
Date: Thu, 19 Mar 2026 00:30:48 +0100
Message-Id: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0ML3aT8/JLk/Ly0zHRdE/PUpGQDI2NDQ1NjJaCGgqLUtMwKsGHRSkF
 uzkqxtbUAK92OnGEAAAA=
X-Change-ID: 20260318-bootconfig-47ebc0231153
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4628; i=francesco@valla.it;
 h=from:subject:message-id; bh=vp9Ez4YioVeajY7StQEAwZDsz37+8WipB52FZrP8Wpo=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJm7TdcI+Csz8tsH3tlQzV+z4memTcVJ1dUz/bi0vpSIr
 Ivg7WvvKGVhEONikBVTZAlZd+Penrnm39I2MD6CmcPKBDKEgYtTACaSEcHwv9xKTPDD3DddCSxr
 v7JcMmOREmzX2c0zJfm5ktiiU3NPRDAy7Mq1Nrtqv/CclnzmrOC2g7ZdRxhZpx94pPkydHvnxgp
 3NgA=
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: a8219f26414d39d5f0542cffd4a58ebf
X-AntiAbuse: ID - a8219f26414d39d5f0542cffd4a58ebf
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w30Lx-00000000hUP-2Bo8-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 23:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233448

Hello,

this patchset introduces support for attaching a bootconfig block both
to plain initramfs images and inside FIT images. The bootconfig source
can be configured globally or per-image.

== Introduction to bootconfig ==

A bootconfig is a small footer that can be added to an initramfs image
and is read by the kernel at startup if the CONFIG_BOOT_CONFIG option is
set. Its content can be used to expand the kernel command line even
beyond its canonical size limit.

An interesting point about the bootconfig mechanism is that the
initramfs image does *not* need to be there for the bootconfig to be
read, as its presence is always checked starting from the bottom of the
declared initramfs area.

More details on the bootconfig concept can be found at [0]. 

== Patchset walkthrough == 

Patch 1 adds a new recipe to compile the tool used for bootconfig
management; being this part of the Linux kernel source code, it is
compiled from the kernel shared workdir.

Patch 2 adds a new image conversion type to add the bootconfig to an
image. While today only a cpio (plain or compressed) or an ext2 image
would make sense here as a base for such operation, this is not strictly
enforced as new usecases may arise in the future. A new bbclass
containing the relevant configuration variables for this operation is
also introduced in this patch.

Patche 3 adds a test recipe containing a bootconfig that can be used for
tests; this recipe will then be used by patch 4.

Patch 4 adds support for adding a bootconfig inside a FIT image. Since
the bootconfig is always read from the end of an initramfs memory area
(even if the initramfs isn´t really there!), two forms of support are
added here, both enabled by the FIT_INCLUDE_BOOTCONFIG variable:

 - if INITRAMFS_IMAGE is set, the .bootconfig image is searched to be
   included as ramdisk section;
 - if INITRAMFS_IMAGE is not set, a dummy/empty initramfs artifact is
   created and the bootconfig block is added there; the resulting binary
   is then added as ramdisk section.

It should be noted that if INITRAMFS_IMAGE_BUNDLE the bootconfig will
NOT be included inside the FIT image and a warning will be displayed.

== Usecases ==

The main usecases I can think of are:

 - (the one driving the work) initramfs-less dm-verity setup starting
   from a bootconfig included inside the FIT image and verified as part
   of the FIT verification; I have a working PoC for this based on a
   modified version of image_types_verity from meta-openembedded;
 - complex tracing setups where the classic kernel command line is not
   sufficient (bootconfig is e.g. indicated as boot-time tracing
   mechanism [1]);
 - debug flexibility: no need to modify the kernel nor the bootloader
   setup to pass debug arguments to the kernel.

Bonus track: the first usecase was featured in Francesco Castagnotto's
podcast "I use Yocto btw", with me explaining it (in italian) [2].

== Open points == 

Following points are still open, with probable room for improvements:

 - the BOOTCONFIG_TASK mechanism feels legacy, but I couldn't think of
   a better one;
 - I'm not sure if and how the INITRAMFS_IMAGE_BUNDLE case should be
   managed (maybe bundling also the bootconfig itself?);
 - should an example bootconfig recipe be added?

Thank you in advance for any feedback on this!

Best regards,
Francesco

[0] https://docs.kernel.org/admin-guide/bootconfig.html
[1] https://docs.kernel.org/trace/boottime-trace.html
[2] https://open.spotify.com/episode/0qR6lzm0nz4uylt0lCBfYQ

Signed-off-by: Francesco Valla <francesco@valla.it>
---
Francesco Valla (4):
      bootconfig: add recipe
      image_types: add bootconfig conversion type
      recipes-test: add bootconfig-test recipe
      kernel-fit-image: add bootconfig support

 .../recipes-test/bootconfig/bootconfig-test.bb     | 20 +++++++
 .../bootconfig/bootconfig-test/bootconfig-test.txt |  6 +++
 meta/classes-recipe/bootconfig-config.bbclass      | 12 +++++
 meta/classes-recipe/image_types.bbclass            | 15 +++++-
 meta/classes-recipe/kernel-fit-image.bbclass       | 44 +++++++++++++--
 meta/conf/image-fitimage.conf                      |  3 ++
 meta/lib/oeqa/selftest/cases/fitimage.py           | 63 +++++++++++++++++++---
 meta/recipes-kernel/bootconfig/bootconfig.bb       | 44 +++++++++++++++
 8 files changed, 193 insertions(+), 14 deletions(-)
---
base-commit: 531f87111d83430615f2e20dd41a3dd5fc25c7ab
change-id: 20260318-bootconfig-47ebc0231153

Best regards,
-- 
Francesco Valla <francesco@valla.it>


