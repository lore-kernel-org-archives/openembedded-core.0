Return-Path: <peteasa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 701546E614
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 19:17:52 +0000 (UTC)
Received: by wibg7 with SMTP id g7so74659535wib.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 12:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Z+On2p8TdaC2aZEQK6cVLt19MjeEqPPH5mSrptJLgXw=;
	b=jiKhGTsVFyQCbXWdFwwkEGj9DsJ/ANp6vbZRSNbagPhbyqDZdBRn7WXSV0sNugTg2+
	uysRc2oQgfr0TZFDFa0YcwLc48itnBbdsXK/V7obwdf44OBzPq4A8uIlxOSxLCAJJdUC
	DsHG1ztGIlcGEfu2Lrlyo1OASlt++tyVK3QrDzRmsMkn2/jnyi8l01HsDFYNhw3+woD1
	1wEXwy4wGw1NZ2zdGZWGTUNTzps3/Xfc8IV8nyyryU18Jn0CfB6/z3kP9ErCqw3U/1EZ
	TXhcbK9o1xJIhLk+Yc8P/KcDre5xVhol82fHCin3ZJ1SZkHgPXa02R9iFSUcU6UiHljw
	Odhw==
X-Received: by 10.180.77.40 with SMTP id p8mr15220631wiw.1.1427656673609;
	Sun, 29 Mar 2015 12:17:53 -0700 (PDT)
Received: from HomeMegaUbuntu.pascom
	(cpc18-heme10-2-0-cust113.9-1.cable.virginm.net. [81.96.152.114])
	by mx.google.com with ESMTPSA id w3sm13019352wiz.5.2015.03.29.12.17.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Mar 2015 12:17:52 -0700 (PDT)
From: Peter Saunderson <peteasa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2015 20:17:40 +0100
Message-Id: <1427656660-8637-1-git-send-email-peteasa@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: Peter Saunderson <peteasa@gmail.com>
Subject: [meta-oe][PATCH v2] insane.bbclass: Added Epiphany machine definitions
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
X-List-Received-Date: Sun, 29 Mar 2015 19:17:54 -0000

Adding machine definitions for the epiphany (http://www.adapteva.com/) chip.
using https://github.com/adapteva/epiphany-binutils-gdb.
For binutils implementation that defines TARGET_ARCH MACHINE "epiphany": 4643 See https://github.com/adapteva/epiphany-binutils-gdb/blob/epiphany-binutils-2.24/bfd/elf32-epiphany.c
For example layer that uses these defines see https://github.com/peteasa/meta-epiphany.git

Epiphany cross compile is confused by package_qa_check_arch so this check is also skipped.
---
 meta/classes/insane.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index c6dea22..9cdb382 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -52,6 +52,9 @@ def package_qa_get_machine_dict():
             "darwin9" : { 
                         "arm" :       (40,     0,    0,          True,          32),
                       },
+            "e-os" :  {
+                        "epiphany":   ( 4643,  0,    0,          True,          32),
+                      },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
                         "aarch64_be" :(183,    0,    0,          False,         64),
@@ -445,6 +448,10 @@ def package_qa_check_arch(path,name,d, elf, messages):
     provides = d.getVar('PROVIDES', True)
     bpn = d.getVar('BPN', True)
 
+    # FIXME: epiphany cross compile confuses this check
+    if (target_os == 'e-os'):
+        return
+
     # FIXME: Cross package confuse this check, so just skip them
     for s in ['cross', 'nativesdk', 'cross-canadian']:
         if bb.data.inherits_class(s, d):
-- 
2.1.0


