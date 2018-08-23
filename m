Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97CE378FEF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 16:51:49 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o37-v6so5198721wrf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=NIgKVg8uteBrIKnGo20uNiJ8M5rBXVpx9tHFqw+PRzc=;
	b=fMVywQx8lBWZvRox7zF4fKRcJpS0xX9tZ+BXm/pCq4Q5/rsT4c8f9A6bav2sUqG7+5
	GI0NQhd0vTm2hO90iNRxMHA49wuSnbsOfBsgRkYlGeQMsB8UNDeEjfAjHXKkEGYUEg6K
	E2ezLuhvSAkCHpX4P3L4cGFPOlvgnZ99TckA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=NIgKVg8uteBrIKnGo20uNiJ8M5rBXVpx9tHFqw+PRzc=;
	b=gBBHm+pvvNFntoMEfq9Gnup7oKIkhkQi85oT+kmXEtvZHgWgf0/A7gyF7GLAj2vBrt
	Suhl7zPRkv7H3TQ67wzVdAJUZCgzm5xWJba9baBibK3HNSKDdtKVJQc4kXgMCZKzkxs1
	CcBMjI2BU/qE3etrMLxEh32/rH8a+276g56vl3sxzWI37RMMgJlxXDcLVji/cVIFpGT9
	KGqL3K2O25pmUmHoSc5fI2NYkQ79UDKuM0EjzwvdJz0nq+T1UIGirw3/AkOeYhy7xtgK
	OLKLkLeM/EdVFRhnpuz5wsagMnOQgVzNTscXbnjbTVHgdDoPg9cznIvBHUtuw+tEGTfQ
	T5nA==
X-Gm-Message-State: APzg51BnbG7K1R96BqhDbrjR0yn16b0O+itKYF7MDE7CfGl6/rnlen88
	OajyO0ftLocVfOUcvkKzJ3HGPEy7ijg=
X-Google-Smtp-Source: ANB0VdZslhbzQRUkYrOZdI8FU0TMruKg8nfDj/NeFHkxAlCv/qxlUIKHAw2yqbntYhiMZyd4imHFcA==
X-Received: by 2002:adf:f24e:: with SMTP id
	b14-v6mr10097013wrp.184.1535043109910; 
	Thu, 23 Aug 2018 09:51:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u1-v6sm3420535wrt.59.2018.08.23.09.51.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 09:51:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 17:51:47 +0100
Message-Id: <20180823165147.8544-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] scripts: Add autobuilder worker test script
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
X-List-Received-Date: Thu, 23 Aug 2018 16:51:49 -0000

Add a script which can be run on new autobuilder workers to check all needed configuration
is present. Designed to be run in a repo where bitbake/oe-core are already present.

This means when we add new autobuilder workers, we can quickly test whether all the needed
funcationality to support the standard yocto project autobuilder (ie. the standard
OE-Core tests) are present.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100755 scripts/autobuilder-worker-prereq-tests

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
new file mode 100755
index 00000000000..282657e8eee
--- /dev/null
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -0,0 +1,54 @@
+#!/bin/bash
+#
+# Script which can be run on new autobuilder workers to check all needed configuration is present.
+# Designed to be run in a repo where bitbake/oe-core are already present.
+#
+
+#
+# Todo
+# Add testtools/subunit import test
+# Add python3-git test
+# Check for working x86 KVM acceleration
+#
+
+. ./oe-init-build-env > /dev/null
+if [ "$?" != "0" ]; then
+    exit 1
+fi
+git config --global user.name > /dev/null
+if [ "$?" != "0" ]; then
+    echo "Please set git config --global user.name"
+    exit 1
+fi
+git config --global user.email > /dev/null
+if [ "$?" != "0" ]; then
+    echo "Please set git config --global user.email"
+    exit 1
+fi
+bitbake -p
+if [ "$?" != "0" ]; then
+    echo "Bitbake parsing failed"
+    exit 1
+fi
+WATCHES=`sysctl fs.inotify.max_user_watches -n`
+if (( $WATCHES < 100000 )); then
+    echo 'Need to increase watches (echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf'
+    #exit 1
+fi
+mkdir -p tmp/deploy/images/qemux86-64
+pushd tmp/deploy/images/qemux86-64
+if [ ! -e core-image-minimal-qemux86-64.ext4 ]; then
+    wget http://downloads.yoctoproject.org/releases/yocto/yocto-2.5.1/machines/qemu/qemux86-64/core-image-minimal-qemux86-64.ext4
+fi
+if [ ! -e core-image-minimal-qemux86-64.qemuboot.conf ]; then
+    wget http://downloads.yoctoproject.org/releases/yocto/yocto-2.5.1/machines/qemu/qemux86-64/core-image-minimal-qemux86-64.qemuboot.conf
+fi
+if [ ! -e bzImage-qemux86-64.bin ]; then
+    wget http://downloads.yoctoproject.org/releases/yocto/yocto-2.5.1/machines/qemu/qemux86-64/bzImage-qemux86-64.bin
+fi
+popd
+runqemu qemux86-64
+if [ "$?" != "0" ]; then
+    echo "Unable to use runqemu"
+    exit 1
+fi
-- 
2.17.1


