Return-Path: <joaohf@gmail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6F54660EFA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Mar 2014 03:12:29 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id db11so3276654veb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 20:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7b0mlEkk6S6cHf7w8f2Wb2eh9CJcBZXoH7bmEyJIWkE=;
	b=FBrJw0Zx1SZK246P1RNU9A7WTN0OllXJuLwjvw/NOenVUhtgY79RuhQeM2AbNZKBc7
	GUY0gfNKi9FGf98R7byvBDx9VTOs7VkSCF2pumOI/Ucyx2q+kcux1OSqfQVrvaL0bYae
	omz+qY8pge1qE2LKZ1g0eBfiDB6OFdkck6uR/1FSghwAJrdYa9CFcwrI+Xz0VNcBDv/j
	kVme0GuNovkIp5oq09raWUez5VB/YTHTZ/UMPOmq2dsG3u3puD/U9vA0f10sO3yuwOwp
	aNtu2iqu1reWSA59jB4bD4rQTuGJHNgYmnRJBK9VaBhGxZOIVtYcKf0VxnhPBCPjRv3E
	IQuw==
X-Received: by 10.220.191.134 with SMTP id dm6mr10507346vcb.16.1396062750835; 
	Fri, 28 Mar 2014 20:12:30 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id
	ha7sm12869708vdb.17.2014.03.28.20.12.29 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Mar 2014 20:12:30 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 29 Mar 2014 00:12:06 -0300
Message-Id: <1396062728-9140-6-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1396062728-9140-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1396062728-9140-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v4 5/7] wic: Add option --rootfs-dir to --source
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
X-List-Received-Date: Sat, 29 Mar 2014 03:12:30 -0000
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


