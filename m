Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD636E757
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:18:23 +0000 (UTC)
Received: by mail-vc0-f176.google.com with SMTP id lc6so4168598vcb.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=rVyKnLQQulK7p+FanjxVcJji3QHyjxdRgMrYRyNEyiI=;
	b=XegaH6wuAk3XusuAua24yTtlBnybUx++n2sm5hzra4AJLDKsLxIwLb2B2kM+P7X55o
	9xkRG3nEYSpW1832pijIGQUpNUlGtCFlFoOACiN3eAzA4V0kkPQNJ5KZ7Z2TTyXEonfW
	21Z2+NGFWl4eAN4bkNwJD21ut0TxueQdt5C6DcUtGYxjv6XFZSXv1YWDsL2FGw96VFYb
	+yW03DRSZ2R8oa6UIjyXo56Ly/8EizzK5LHp/V1UyChkmWLBd4b+RgXeMPu/OoeiPrS/
	BQMS/BOogqXBDqtBjjTkqnTzvxEMfQrr/CoSDHHw+eRC9ZijJj0JgoMReJsjURHc06mo
	3wpw==
X-Received: by 10.59.9.38 with SMTP id dp6mr198769ved.24.1394918304717;
	Sat, 15 Mar 2014 14:18:24 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm4382714vdc.15.2014.03.15.14.18.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 14:18:24 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 18:17:50 -0300
Message-Id: <1394918271-14153-5-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 4/5] wic: Use partition label to be part of rootfs filename
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
X-List-Received-Date: Sat, 15 Mar 2014 21:18:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When a partition from .wks file is set up like this:

  part /standby --source rootfs --rootfs=<special rootfs> ... --label \
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


