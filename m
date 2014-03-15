Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id BC5AE6E757
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 21:18:27 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id cz12so4162701veb.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Mar 2014 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Pd05W2lS5SlfD2xGmKgi0MfJ4qH+Pc5mDpwVIqeqjJI=;
	b=Iyu0B9VHzlevosNmcSctQ4FKpok3tQhiAlzSDryxCxqeBzyyk8oZdjUuvXt4FZT2Jc
	8AVYrn0oqZAEGCYmCZtuKiftIwelAtqfqj1EFUDa/5jfZTZ+WMaGQ6FNFsY6DLEhZLnn
	jpP5DhghR7LXw7MBszqLdyJAXd0aHtFufcj6B6AIemC0/U8DzqPfv2+FPaVUMMJ/arMp
	IHzE2x2q8uv3HpNp5KVCgcY4h+WCJLH4An8EBPZqVtTmSmLKYSR9rrbB1eVnc6+t7bfY
	JtfZTOvEC3BWdVGx80UYiBo5EE3bk6vdT4nBQx3opFsO6JfvRfDOiMPGOasBZpCznedr
	Qwpg==
X-Received: by 10.52.30.230 with SMTP id v6mr10692686vdh.6.1394918308353;
	Sat, 15 Mar 2014 14:18:28 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm4382714vdc.15.2014.03.15.14.18.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 14:18:27 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Mar 2014 18:17:51 -0300
Message-Id: <1394918271-14153-6-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH 5/5] wic: Add option --rootfs to --source
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
X-List-Received-Date: Sat, 15 Mar 2014 21:18:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The '--rootfs' option is optional and only takes efect is a
partition is set up like this:

  part /standby --source rootfs --rootfs=<special rootfs> ...

So '--rootfs' is used instead of bitbake ROOTFS_DIR variable or
'-r' param.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 8973edc..b70901c 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -45,6 +45,7 @@ class Wic_PartData(Mic_PartData):
         Mic_PartData.__init__(self, *args, **kwargs)
         self.deleteRemovedAttrs()
         self.source = kwargs.get("source", None)
+        self.rootfs = kwargs.get("rootfs", None)
         self.source_file = ""
         self.size = 0
 
@@ -53,6 +54,8 @@ class Wic_PartData(Mic_PartData):
 
         if self.source:
             retval += " --source=%s" % self.source
+            if self.rootfs:
+                retval += " --rootfs=%s" % self.rootfs
 
         return retval
 
@@ -332,4 +335,7 @@ class Wic_Partition(Mic_Partition):
         # and calculate partition size
         op.add_option("--source", type="string", action="store",
                       dest="source", default=None)
+        # use specified rootfs path to fill the partition
+        op.add_option("--rootfs", type="string", action="store",
+                      dest="rootfs", default=None)
         return op
-- 
1.8.3.2


