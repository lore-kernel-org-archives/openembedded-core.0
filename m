Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 21D876EA3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 02:43:12 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id pa12so1681478veb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 19:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7b0mlEkk6S6cHf7w8f2Wb2eh9CJcBZXoH7bmEyJIWkE=;
	b=OlxJNX56xkNEss+gYaM2VBfuxxVnt2wJ4JAmf4Ab8ZU98xl62W+TnftzVoHHbrWBpB
	Hv5jYAxwymxVF1iZJNVKx29mh7+7JlfglSmOv6+kXgitTB6MkeV/aNBcF7IphA+raXHT
	hif2DiI7mm433FCTk09Wydq9qEoY2Jr8rSo/PwQhaCndfCXQuLhCscQ54XxsiX6gjiKm
	fo5v+xmmmIY3P0tMm4WOO7BNsLdkNc/dbNtcL8Wj9MgKzE4KjojHHQu+w4frX/M6nPzY
	tn6I1sDby/wHcRlY71HhZ5PXZz41aejRJ69disdSCwixjQeykIDxTW2Aabw2GmFrdiT8
	M/OQ==
X-Received: by 10.52.72.48 with SMTP id a16mr8228759vdv.19.1395801793829;
	Tue, 25 Mar 2014 19:43:13 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id ay4sm35813974vdc.6.2014.03.25.19.43.12
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 19:43:13 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Mar 2014 23:42:47 -0300
Message-Id: <1395801769-13042-6-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395801769-13042-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395801769-13042-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v2 5/7] wic: Add option --rootfs-dir to --source
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
X-List-Received-Date: Wed, 26 Mar 2014 02:43:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The '--rootfs-dir' option is optional and only takes efect is a
partition is set up like this:

  part /standby --source rootfs --rootfs-dir=<special rootfs> ...

So '--rootfs-dir' is used instead of bitbake ROOTFS_DIR variable or
'-r' param.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 8973edc..887195f 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -45,6 +45,7 @@ class Wic_PartData(Mic_PartData):
         Mic_PartData.__init__(self, *args, **kwargs)
         self.deleteRemovedAttrs()
         self.source = kwargs.get("source", None)
+        self.rootfs = kwargs.get("rootfs-dir", None)
         self.source_file = ""
         self.size = 0
 
@@ -53,6 +54,8 @@ class Wic_PartData(Mic_PartData):
 
         if self.source:
             retval += " --source=%s" % self.source
+            if self.rootfs:
+                retval += " --rootfs-dir=%s" % self.rootfs
 
         return retval
 
@@ -332,4 +335,7 @@ class Wic_Partition(Mic_Partition):
         # and calculate partition size
         op.add_option("--source", type="string", action="store",
                       dest="source", default=None)
+        # use specified rootfs path to fill the partition
+        op.add_option("--rootfs-dir", type="string", action="store",
+                      dest="rootfs", default=None)
         return op
-- 
1.8.3.2


