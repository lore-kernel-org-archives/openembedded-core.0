Return-Path: <logang@deltatee.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361F6CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 18:11:02 +0000 (UTC)
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by mx.groups.io with SMTP id smtpd.web10.35370.1697739057088632604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 11:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@deltatee.com header.s=20200525 header.b=aLo9ki3q;
 spf=pass (domain: deltatee.com, ip: 204.191.154.188, mailfrom: gunthorp@deltatee.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:MIME-Version:Message-Id:Date:Cc:To:From
	:references:content-disposition:in-reply-to;
	bh=MLzIsRj7l/lBhkRIzuSHFIKVm/U6dTnKf7g4pliSlg0=; b=aLo9ki3qHQERLhqyAZgG3kqOH3
	sRRlsjDDWvxuNgvrDmngPOPUmxHQs48HWTGXhebkUY5H0BSNVmzQF7ABHPNzDA7ml1nWzYeY7kXij
	pzoAvHoGrMmD2ZDkmJKylus4EYswNnvYZgaiseo/va/7dEu50vn1nS4cuEYAT2NGhiEwoAEPnj30t
	eZM8jgCNO21PnJisB8eXYWkRkb1J1W3Py8IxlKEE4Ccfvq14kvcVSVABFU8MPRqQUl0tDzTg+2Gez
	BK2/CYjuUKncYP6AxqbRf9eWl5OwhzWwJ/UXKHdyAXIlumqB8ibUZXMSJX0EdYjXPYwEHLnLnNyMA
	rQQc/yew==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
	by ale.deltatee.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1qtXTz-000o4x-FV; Thu, 19 Oct 2023 12:10:56 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.94.2)
	(envelope-from <gunthorp@deltatee.com>)
	id 1qtXTx-000uLJ-3e; Thu, 19 Oct 2023 12:10:53 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: openembedded-core@lists.openembedded.org
Cc: Logan Gunthorpe <logan.gunthorpe@eideticom.com>,
	Logan Gunthorpe <logang@deltatee.com>
Date: Thu, 19 Oct 2023 12:10:51 -0600
Message-Id: <20231019181051.216536-1-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: openembedded-core@lists.openembedded.org, logan.gunthorpe@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH] runqemu: Add squashfs filesystem types
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 18:11:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189478

From: Logan Gunthorpe <logan.gunthorpe@eideticom.com>

When using a squashfs filesystem type, runqemu requires specifying the
full path to the image because it doesn't list squashfs types in its
fstypes variable. Add them to provide the same support as other
filesystem types.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 scripts/runqemu | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 6fca7439a1d2..18aeb7f5f0cf 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -198,7 +198,9 @@ class BaseConfig(object):
         self.snapshot = False
         self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs',
-                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz')
+                        'cpio.gz', 'cpio', 'ramfs', 'tar.bz2', 'tar.gz',
+                        'squashfs', 'squashfs-xz', 'squashfs-lzo',
+                        'squashfs-lz4', 'squashfs-zst')
         self.vmtypes = ('hddimg', 'iso')
         self.fsinfo = {}
         self.network_device = "-device e1000,netdev=net0,mac=@MAC@"

base-commit: f65f100bc5379c3153ee00b2aa62ea5c9a66ec79
-- 
2.30.2


