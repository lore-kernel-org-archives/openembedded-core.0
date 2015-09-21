Return-Path: <avery.brian@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5A79D76E04
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 23:44:29 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so129839847pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 16:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GB4l+7yLH0m08/ym+GqJkBmNpCb02n+kf3Mv2aDIZDo=;
	b=dPl1KrxkUs3n7eor2Bdh8M4NuVHHcupkvsmTvWXyeCLnr2dGOZiQEQT8gZ1sPyV3J/
	R2QBYrLMTE2fhRTuQ3EiOEQr+b0zYYejnTmlZ27pLrzBW9+msMl0wgT+v87r1pACiwck
	NhLH+v1K64bYIhNBu3oUVJ0z+8HT3cavGs9C/WhELW6eyPuQednF/DmXtvcJXjZ42OHW
	oSULh4/vF/0MMDj5bXJ7oBPcs9MnaK99cSPPj9TnZ6hlY1YX1qO2hDjOxXIkGiDE5v1e
	fqom9mjkAANyLuwXkCGqM2pV9f1p+ett+QjFu0iL0tUDuSo6hNigH4F+tV/ukrVsO/2u
	VGLg==
X-Received: by 10.68.182.3 with SMTP id ea3mr27780194pbc.126.1442879070318;
	Mon, 21 Sep 2015 16:44:30 -0700 (PDT)
Received: from whisper.hsd1.or.comcast.net
	(c-98-232-142-195.hsd1.or.comcast.net. [98.232.142.195])
	by smtp.gmail.com with ESMTPSA id
	rs8sm22652824pbb.14.2015.09.21.16.44.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Sep 2015 16:44:29 -0700 (PDT)
From: brian avery <avery.brian@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Sep 2015 16:45:55 -0700
Message-Id: <3366ed861620969c03d9542b12287eda9840a208.1442879015.git.avery.brian@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1442879015.git.avery.brian@gmail.com>
References: <cover.1442879015.git.avery.brian@gmail.com>
Subject: [PATCH 1/1] meta-selftest: add error recipe and error-image
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
X-List-Received-Date: Mon, 21 Sep 2015 23:44:30 -0000

    * The error recipe throws an error during compile

    * The error-image includes the error recipe

    * Initial target is toaster selenium testing

Signed-off-by: brian avery <avery.brian@gmail.com>
---
 meta-selftest/recipes-test/error/error.bb        | 11 +++++++++++
 meta-selftest/recipes-test/images/error-image.bb |  8 ++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-selftest/recipes-test/error/error.bb
 create mode 100644 meta-selftest/recipes-test/images/error-image.bb

diff --git a/meta-selftest/recipes-test/error/error.bb b/meta-selftest/recipes-test/error/error.bb
new file mode 100644
index 0000000..a7bdecf
--- /dev/null
+++ b/meta-selftest/recipes-test/error/error.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Error Test case that fails on do_compile"
+DESCRIPTION = "This generates a compile time error to be used to for testing."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+INHIBIT_DEFAULT_DEPS = "1"                                                                                                                                                                  
+EXCLUDE_FROM_WORLD = "1"
+
+do_compile() {
+        bbfatal "Failing as expected.";
+}
diff --git a/meta-selftest/recipes-test/images/error-image.bb b/meta-selftest/recipes-test/images/error-image.bb
new file mode 100644
index 0000000..13d9cc0
--- /dev/null
+++ b/meta-selftest/recipes-test/images/error-image.bb
@@ -0,0 +1,8 @@
+SUMMARY = "An image that includes the error recipe and will therefore fail"
+DESCRIPTION = "This generates an error. Not currently used by oe-selftest"
+
+IMAGE_INSTALL = "error"
+
+IMAGE_LINGUAS = " "
+
+inherit core-image
-- 
1.9.1


