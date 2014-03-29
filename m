Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id ACC026B1FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:27 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lg15so6644810vcb.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9w8WgeMvMVwAGAr2rupMIJTcL0LMV4GIvuTwgKVbae8=;
	b=ago+lPAbrGXquvGk8Q2n2UGI8p1XMFXcWTE5DSk/mFTu/CtCOlhrkWwj0pRcAFF5fF
	BG3dgZYI/vZ+gcM+NUCW6u2HZ+PGDwd3xfdvZtzZborOl/cG2rg17Qn6U1p1eF5VpbF0
	KCA97hWpBPU57Cg9pGiIpNbrhhDcdz0jYw3AnPCAB0OURDuxipKg+ccPXhkwoCkL4kCn
	+aJ/v57NJ53zbIdmpib3zelyMH48Tpdbnf6F5ukn3bIo/CrE2pbcQI0YQLCZAXDtEVfs
	Td/SWZS0cWewkRPf4d+EURurF2xYS6kOP7AUL63mJRt08h7NH8zgEKZJP1JHy2osUBjB
	u6JQ==
X-Received: by 10.220.106.84 with SMTP id w20mr10434014vco.18.1396062748601;
	Fri, 28 Mar 2014 20:12:28 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.27 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:28 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:05 -0300
Message-Id: <1396062728-9140-5-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 4/7] wic: Use partition label to be part of rootfs filename
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a partition from .wks file is set up like this:

  part /standby --source rootfs --rootfs-dir=<special rootfs> ... --label \
    --label secondary

This means that 'rootfs' must use '<special rootfs>' as rootfs and
the default partition filename in /var/tmp/wic/build/ will be create
using the '--label' as part of the name. E.g:

  /var/tmp/wic/build/rootfs_secondary.ext3

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index c3bb9a5..8973edc 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -172,7 +172,7 @@ class Wic_PartData(Mic_PartData):
         """
 
         image_rootfs = rootfs_dir
-        rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
+        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label ,self.fstype)
 
         du_cmd = "du -ks %s" % image_rootfs
         rc, out = exec_cmd(du_cmd)
@@ -217,7 +217,7 @@ class Wic_PartData(Mic_PartData):
         Currently handles ext2/3/4 and btrfs.
         """
         image_rootfs = rootfs_dir
-        rootfs = "%s/rootfs.%s" % (cr_workdir, self.fstype)
+        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
 
         du_cmd = "du -ks %s" % image_rootfs
         rc, out = exec_cmd(du_cmd)
-- 
1.8.3.2


