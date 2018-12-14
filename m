Return-Path: <erik.boto@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id BCB407BD9C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 18:54:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c126so6790133wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 10:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QwgNThzCdWzepnOeYkmlBcusZBwEWsO/IbaNRAhypHs=;
	b=mrHnHK/FqDZbb1OkiZefusNTjAhXKW/CzFbwWbP/ZDBEEGARCFHARlVRrT29kYS/Vl
	0x4Z+gjBexeDL03u1QMrQpjK1Gc3oYDmblpVivIwLEzkwKvSq23iNfc/P+sdwwlKvQ2b
	f//CnhskHSf7xVOSfGEx+6Md1JCHppy/M/+xWQXeH9qVLFHFl7UR1yJqCyaH0z2wzKZ5
	vTfdP2R0A2gMBLt6SPR0zhvXcSKHZqVZyFfk2iVMVEy+0sFXxmNidYwS4ZAhp8QZKMkX
	G5ZkHFyPcSZKjGDgXriIe2CrYWVhbuWSbxcmBYn2vxFuIk59OLqaWTvzXnlpIltjzDs7
	1eRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QwgNThzCdWzepnOeYkmlBcusZBwEWsO/IbaNRAhypHs=;
	b=tzvLEhY8PjNJ8tzG9Ad/fzBYbZNn3Rqloemb/dcn2bIjGhwYLAKtyHLD7Zgu5PntZb
	wVgPe+Ttqi3qaVI4gSRqIZOiIHass20WQ8IvBbGIWP9Q3hXoQ8L11yuiuiKKiDFAgclr
	57zLlw4SN6VBkmTUkOy/55JIIz8dlDSsmGx/1hkiokhFzFVmYA2vEfxIHmQ8TVdxaXDg
	1Nx4qJHIPRPwsQ0FSiTgjUm0pWxlT6zPK34BRg0W7vfuam6sTOjIc76ZU+HIhtZ+Labc
	1/yYhf2CeEVMRggJdf95o9ZewMMK2pD5fgjrcIjaeXeF9ODni//zr1XCw3Ue6rqVIe+1
	8qKA==
X-Gm-Message-State: AA+aEWbWOiMnPybqgWCJt+DBgJX8XB7R0djwbWqa3EZX9Yu7C+WocRHP
	/FB1Cm3crriNeu5yRngzzm0+V2at
X-Google-Smtp-Source: AFSGD/WLDPUEQwaRTnHrzaDmyYEykv9lJgwjZNmlaOV6xDfQnXtVwKh0IWHVHOL7NP49w4leLaV9sw==
X-Received: by 2002:a1c:ca15:: with SMTP id a21mr3899392wmg.132.1544813642925; 
	Fri, 14 Dec 2018 10:54:02 -0800 (PST)
Received: from debbie.luxoft.com ([83.218.80.243])
	by smtp.gmail.com with ESMTPSA id
	k135sm7888743wmd.42.2018.12.14.10.54.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 10:54:01 -0800 (PST)
From: =?UTF-8?q?Erik=20Bot=C3=B6?= <erik.boto@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:53:42 +0100
Message-Id: <20181214185342.11550-1-erik.boto@gmail.com>
X-Mailer: git-send-email 2.20.0.rc2
MIME-Version: 1.0
Subject: [PATCH] testimage: Add possibility to pass parmeters to qemu
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
X-List-Received-Date: Fri, 14 Dec 2018 18:54:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a variable called TEST_QEMUPARAMS in testimage.bbclass to make it
possible to pass parameters to qemu. This can be useful for e.g.
increasing the amount of RAM available during testimage runs.

Signed-off-by: Erik Botö <erik.boto@gmail.com>
---
 meta/classes/testimage.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 82cbb068ed..8a15c30c79 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -31,6 +31,7 @@ TESTIMAGE_AUTO ??= "0"
 # TEST_LOG_DIR contains a command ssh log and may contain infromation about what command is running, output and return codes and for qemu a boot log till login.
 # Booting is handled by this class, and it's not a test in itself.
 # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
+# TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
 
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
@@ -63,6 +64,7 @@ TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
 TEST_TARGET ?= "qemu"
+TEST_QEMUPARAMS ?= ""
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_append_qemuall = " qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
@@ -301,7 +303,8 @@ def testimage_main(d):
     try:
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
-        tc.target.start(extra_bootparams=bootparams)
+        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"),
+                        extra_bootparams=bootparams)
         results = tc.runTests()
     except (RuntimeError, BlockingIOError) as err:
         if isinstance(err, RuntimeError):
-- 
2.20.0.rc2


