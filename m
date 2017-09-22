Return-Path: <prvs=431c23770=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id 396D671BA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 05:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1296; q=dns/txt;
	s=ironport1; t=1506058174; x=1537594174;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=zS6+Q6hqzHDcfYMYB0Resrz176xgfsDRMTC0iTGMjw8=;
	b=ZTA2hvQCwAcil9oStHSMKtOvQPBIOjsL/z30mojqikFiqbd15MymtBX5
	IXRQAvJkmhGl4nYa4zusVlCZO7KLBLUXgE7dfKibWRDqASW/v0m0cxn4l
	GESRXiXKLB7AFFI2ll/Ke50IFNN4BWgyP17TD6I0joP6uPZXrNBMpDDO+ k=;
X-IronPort-AV: E=Sophos;i="5.42,427,1500933600"; 
   d="scan'208";a="2624131"
Received: from vmprevas3.prevas.se (HELO smtp.prevas.se) ([172.16.8.103])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 07:29:29 +0200
Received: from mnhu.prevas.se (172.16.8.31) by smtp.prevas.se (172.16.8.103)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 22 Sep 2017 07:29:28 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <mnhu@prevas.dk>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 22 Sep 2017 07:29:08 +0200
Message-ID: <20170922052908.25666-1-mnhu@prevas.dk>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Originating-IP: [172.16.8.31]
Cc: akuster@mvista.com
Subject: [pyro][PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Fri, 22 Sep 2017 05:29:32 -0000
Content-Type: text/plain

From: Gerson Fernando Budke <nandojve@gmail.com>

When selected multiple subimages a similar error could happend:
  Variable do_image_cpio[subimages] value changed \
    from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.

This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
order and consequently 'do_image_cpio' have the same hash.

(From OE-Core rev: 271f1a5f65b8685a1e3645026876251122ef3974)

Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ef2b38aeaf..9c9f14a99a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -453,7 +453,7 @@ python () {
 
         rm_tmp_images = set()
         def gen_conversion_cmds(bt):
-            for ctype in ctypes:
+            for ctype in sorted(ctypes):
                 if bt.endswith("." + ctype):
                     type = bt[0:-len(ctype) - 1]
                     if type.startswith("debugfs_"):
-- 
2.14.1


