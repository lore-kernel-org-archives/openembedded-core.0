Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D726D79558
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 16:59:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o18-v6so6590906wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=3ddrWGPAay0Hw1hjJmAyjQRk3H5bmw08k2Z22MW/B4o=;
	b=GePfr9hJWiwYGSrXjy4VbsuIG/4NMf05Sc5EIMKF67ERG66dP1TXMRBjCOHbwxFlKA
	FVDKWFndpyyyd3PyVJ6Sa8JC+8KT2kvWL1Wkv/8ZbYWUhfKS6DJBTcoYJUvdiy4eb0mO
	wLwBE1Bln5kpe0jahDwRBtUeDhXB3sWUwdM04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3ddrWGPAay0Hw1hjJmAyjQRk3H5bmw08k2Z22MW/B4o=;
	b=BmMjMFy+UwTZsFM5HoI2McwZ8DKHACj/42HFqA4ufChVm3XPUGdYyjDmLhSRLQZSxy
	SP4hY6ICv16fYIODoERNHhRo8MCZ6ie2QcNB+kB5w2t8sc6xB4wlE1ZgRgJRYL022hHA
	XXMBzyBuASQ07lIDmgl+F2V+Dba6NoYUotGn8yh41SKj3wXpebtJL19eEgf7n8CHkS3r
	ifTIuV1GHEM7v9UO1JLvnW0SJVdirdc06owK549DyD7QdtJ05jGAPPJIwXlwVVYcst7K
	o/C4XLdRSR1iOB6vP7z6dHh4TNt3Ku5v1RMrZtcrDYZrSQ4o2RC5CrAZZGAkZeX7u2lg
	Cogw==
X-Gm-Message-State: APzg51AW26UzH6goHyLxCI070aAlNZ0nLoUIv9ArIqIYRsnjT3oFIpAx
	IzVbKj9WH8FYMs67GxQvnoJNvs0O04o=
X-Google-Smtp-Source: ANB0VdbQA3rup9m/2u0gGM8zsQvPmS8byLPOBro9TVrGgatarR8ikLEoJlrN4JIcL9gJIIFGLHOXRQ==
X-Received: by 2002:a1c:7c13:: with SMTP id
	x19-v6mr6096004wmc.27.1535043577194; 
	Thu, 23 Aug 2018 09:59:37 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w4-v6sm7144312wro.24.2018.08.23.09.59.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 09:59:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 17:59:35 +0100
Message-Id: <20180823165935.10334-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] scripts: Add autobuilder worker test script
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
X-List-Received-Date: Thu, 23 Aug 2018 16:59:37 -0000

Add a script which can be run on new autobuilder workers to check all needed configuration
is present. Designed to be run in a repo where bitbake/oe-core are already present.

This means when we add new autobuilder workers, we can quickly test whether all the needed
funcationality to support the standard yocto project autobuilder (ie. the standard
OE-Core tests) are present.

It uses images prebuilt in a previous release to cut build/testing time.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100755 scripts/autobuilder-worker-prereq-tests

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
new file mode 100755
index 00000000000..b5742d5b28b
--- /dev/null
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -0,0 +1,59 @@
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
+bitbake qemu-helper-native
+runqemu qemux86-64
+if [ "$?" != "0" ]; then
+    echo "Unable to use runqemu"
+    exit 1
+fi
+runqemu qemux86-64 kvm
+if [ "$?" != "0" ]; then
+    echo "Unable to use runqemu with kvm"
+    exit 1
+fi
-- 
2.17.1


