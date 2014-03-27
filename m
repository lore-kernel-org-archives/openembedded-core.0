Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 13ADD6F89F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 22:08:19 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id il7so4972641vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 15:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9w8WgeMvMVwAGAr2rupMIJTcL0LMV4GIvuTwgKVbae8=;
	b=PsV3Qq1Jhx+zmeS+R7QDATW/vqBP0nm4zRpAJV9FkS7wKdfbPK8fXIZvCWiNYYpZEI
	54o+i4VUCZUOkVCSFl6ixtWBndFknakBOiaWcUkIT3VPvDEe3XOX9pQo7tujzlenvTo+
	BVcsLvEVhFRdzhWhg4UOM8tYt3xDgHWywTaNrKZgKl+U+5nEWmQeQXSsreOMqjOC+en5
	WlN3M0rn5A8iP/k2+Qo7ySYO7EkmVJTWMCEnDbkx3M7QTm3sgxKjt5Kg/64h2f6PLBrg
	blbmTtSArt24XQ1bspEh7FisYaRErqBU7DyEkIWhy2lxj2bkwcP4CeRkEgr5MwKb8tOd
	NTZg==
X-Received: by 10.52.253.75 with SMTP id zy11mr3107127vdc.10.1395958100197;
	Thu, 27 Mar 2014 15:08:20 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm5771903vdc.15.2014.03.27.15.08.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 15:08:19 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 19:07:55 -0300
Message-Id: <1395958078-5191-5-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395958078-5191-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395958078-5191-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v3 4/7] wic: Use partition label to be part of rootfs filename
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
X-List-Received-Date: Thu, 27 Mar 2014 22:08:19 -0000
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


