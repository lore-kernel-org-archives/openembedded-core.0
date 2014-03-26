Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 121AF6E8B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:43:10 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id id10so1710768vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 19:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=9w8WgeMvMVwAGAr2rupMIJTcL0LMV4GIvuTwgKVbae8=;
	b=ZRJXAR+QJ3IdZIoTY+1tbyg0egxmDII8SuaTks3ICA3UV8A0nBJB7vl0GUOnndbvnb
	KVW9pmRJ/73z/96oZe8TReyW1hvqDAKMVM/39C8uRrtNpUkSjUFiR4pm2vThNOaws3vV
	7t+nWt7ZcsEjnPE0g5r4aI1brHb1HeQD1JQDQuOmJRNt3IHhmawDH2BbxL6FTzgqSQAb
	1I/FeqHCPADCC696UB1Tl2dR3GyO7fhq26BlTnEooZOgOw8rJjY7JIdcKEnuyf/IYEPf
	3MuT5xecuKrOuRcIz1I/6ti6qunHq8SlARba1/LVac2vTWG1a/Z7VKHmUFzTJaLHrKbs
	aRJA==
X-Received: by 10.52.78.231 with SMTP id e7mr7982034vdx.28.1395801791689;
	Tue, 25 Mar 2014 19:43:11 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id ay4sm35813974vdc.6.2014.03.25.19.43.10
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 19:43:11 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 23:42:46 -0300
Message-Id: <1395801769-13042-5-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v2 4/7] wic: Use partition label to be part of rootfs filename
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
X-List-Received-Date: Wed, 26 Mar 2014 02:43:13 -0000
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


