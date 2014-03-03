Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5366BF88
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 20:23:39 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id a1so3895406wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 12:23:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MA0U9CmGnWjJ+dW8OONRRJf73dKPjhweQIrYIRg+j/I=;
	b=mJlTrB3igKgSnMEr64TuM75TWjRmLFfE794cRTDAdHAtGHqWzQ2i1dL/qP1AbVrORg
	XO3hhRmo7o6eshG+ReQUhR6aQbMM+e1HY+kEftF1ThFIpzW596vCeFI+tnV5LY2KK4sN
	vr10yQSq+n38lZLVIO1Rys9wda4sy+/CUwSVAUWZM7g7tqrOUV62n58C8DP5rVGUvvUk
	gNbTogNfrKByhNl/hf8XE9LhFzz6xUTluw2wyAn1Klhs69bvcmFqUDy+hXXfJTZqc2Fl
	5LHuwA8SqgSqgt8n9S3zSyM/G3iDo9SnfYtH8EX5+e4aSg6Bd9+czh9SB3dNUklQTMgG
	MrsA==
X-Gm-Message-State: ALoCoQkNLCNRz3/yPf72yQE1ACf5QZ6F6MMZ54rCQOeRvrcrOHBAEzfKByO2UuRjtBssKrMAOoVb
X-Received: by 10.194.24.35 with SMTP id r3mr9296863wjf.68.1393878220228;
	Mon, 03 Mar 2014 12:23:40 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id de3sm40523147wjb.8.2014.03.03.12.23.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 12:23:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Mar 2014 20:23:34 +0000
Message-Id: <1393878215-27447-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393878215-27447-1-git-send-email-ross.burton@intel.com>
References: <1393878215-27447-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] scripts: add lnr (link relative)
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
X-List-Received-Date: Mon, 03 Mar 2014 20:23:43 -0000

lnr is a simple script to generate relative symlinks from absolute paths,
similar to "ln -r" but without requiring coreutils 8.16 (Ubuntu 12.04 and others
currently ship 8.13).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lnr |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100755 scripts/lnr

diff --git a/scripts/lnr b/scripts/lnr
new file mode 100755
index 0000000..9dacebe
--- /dev/null
+++ b/scripts/lnr
@@ -0,0 +1,21 @@
+#! /usr/bin/env python
+
+# Create a *relative* symlink, just like ln --relative does but without needing
+# coreutils 8.16.
+
+import sys, os
+
+if len(sys.argv) != 3:
+   print "$ lnr TARGET LINK_NAME"
+   sys.exit(1)
+
+target = sys.argv[1]
+linkname = sys.argv[2]
+
+if os.path.isabs(target):
+   if not os.path.isabs(linkname):
+      linkname = os.path.abspath(linkname)
+   start = os.path.dirname(linkname)
+   target = os.path.relpath(target, start)
+
+os.symlink(target, linkname)
-- 
1.7.10.4


