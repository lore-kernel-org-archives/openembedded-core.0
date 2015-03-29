Return-Path: <peteasa@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id D5C9C6E614
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 18:35:42 +0000 (UTC)
Received: by wgra20 with SMTP id a20so148151107wgr.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 11:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CeJN+8qTcd+zuDpx1oPqiZdWveDeJV7MHY8nNrRNGq8=;
	b=L0shs7cE6pPulSU5gIyAJ0I9OtMqHSmJVIDQoAWSfTvwNn1DAWBS7518pMvXl50oWl
	iyvu3eE5idu++8iB0FnXHE9FEQCHjMRH0Df1TD8t6fI0Zra+o4fUYc/I9kjjJ4L5ac2p
	Um7lUfPn2CmQr/8twHoMqONwtteM7lKZgzlDVAWputh4Vss4KR6shTMHRQRO/kLf7+50
	/FwkqmFANeXRJe93fS49/6zzdSDLNAWUhq8wFjRT7pNBUFDb6mgpH1DkY03XHLkQB3Iy
	cq1rmhya6qiYplI2l9icUmitW0cFaCvTfFt05XLlE5CiF7jwlUomav68E5k8KggULy+f
	Bleg==
X-Received: by 10.194.82.226 with SMTP id l2mr56915408wjy.11.1427654143172;
	Sun, 29 Mar 2015 11:35:43 -0700 (PDT)
Received: from HomeMegaUbuntu.pascom
	(cpc18-heme10-2-0-cust113.9-1.cable.virginm.net. [81.96.152.114])
	by mx.google.com with ESMTPSA id
	ax10sm12262261wjc.26.2015.03.29.11.35.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Mar 2015 11:35:42 -0700 (PDT)
From: Peter Saunderson <peteasa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2015 19:35:14 +0100
Message-Id: <1427654114-7753-1-git-send-email-peteasa@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: Peter Saunderson <peteasa@gmail.com>
Subject: [meta-oe][PATCH] Added Epiphany machine definitions
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
X-List-Received-Date: Sun, 29 Mar 2015 18:35:44 -0000

Adding machine definitions for the epiphany (http://www.adapteva.com/) chip.
using https://github.com/adapteva/epiphany-binutils-gdb.
For binutils implementation that defines TARGET_ARCH MACHINE "epiphany": 4643 See https://github.com/adapteva/epiphany-binutils-gdb/blob/epiphany-binutils-2.24/bfd/elf32-epiphany.c
For example layer that uses these defines see https://github.com/peteasa/meta-epiphany.git

Signed-off-by: Peter Saunderson <peteasa@gmail.com>
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


