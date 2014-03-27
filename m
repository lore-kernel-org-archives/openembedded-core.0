Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id AB2A76F896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 22:08:21 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ik5so5218899vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 15:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7b0mlEkk6S6cHf7w8f2Wb2eh9CJcBZXoH7bmEyJIWkE=;
	b=cPVf4DvrXUD7U9zo/twfLSH5o9qiu6FR46jv8rWDRtEoF0swOeXMe/Ua+tkAOMAKOV
	C/38MaVY5MD/Y0wAsXruzRK8BVzeHF43lIgJBCt3kUwHpCoYLuF++5fF4OVfNj6uuetT
	nPO/EvXEB0qaxcog6UOFPINFYmzRoupOQo1Ynchtozct+NhcR3pBs9cOvAv9ayWZBZUu
	Pax6j5tL3pReClRe6r74Xb1XsoTcI2exDPMXOEw4d15l7IFplxhs7kt601VCje2M6C/b
	Jcs2njnqweJTu9ufmvBA3x4SHak7l0JqfIyoGZllJKKzX53h8ihw9EXHHMJlVqJ9ALM7
	P+/g==
X-Received: by 10.220.96.70 with SMTP id g6mr3549517vcn.19.1395958102044;
	Thu, 27 Mar 2014 15:08:22 -0700 (PDT)
Received: from localhost.localdomain ([187.106.6.19])
	by mx.google.com with ESMTPSA id am5sm5771903vdc.15.2014.03.27.15.08.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Mar 2014 15:08:21 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 19:07:56 -0300
Message-Id: <1395958078-5191-6-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1395958078-5191-1-git-send-email-joaohf@gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<1395958078-5191-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: tom.zanussi@linux.intel.com
Subject: [PATCH v3 5/7] wic: Add option --rootfs-dir to --source
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
X-List-Received-Date: Thu, 27 Mar 2014 22:08:21 -0000
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


