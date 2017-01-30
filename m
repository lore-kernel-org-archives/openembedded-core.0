Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id C08F87321C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:39:23 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 194so30882362pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=RwXvhONGZKchb6Va8dq6of+hO1WRHY3NpLYhjy+Gv+8=;
	b=J+2QpYsUwuaMMgfPxjFdeNu/LSb8brvV9btccFBlZXR2GwNk0SP5lps1PO6vfNc7Bn
	2bXveH5CvwrlSkKZ5In/fwDzIvcRjH8g6FmK+L2o2oQ60nIKPqZEbMsulOeexk8HOGym
	QFgtw/V0mVyzxzPmdGWDW83pilvE3Cj+hdeBcxybVdjjv4adLWnIdm/mSrv/eho6Mt3c
	fOSVl5DjMufb2HXXPgF2osWLcOgHwkp/hdAaRYFMPgrHxYZy5w+aJbvVLgJOX0eT2sKf
	M8QEiIXqiGpD82bX3Bpehc+dcIpFR6EOGvf/q0W8txTQoKh4sxmAvVOsnBUaSaGsOzsS
	L9wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=RwXvhONGZKchb6Va8dq6of+hO1WRHY3NpLYhjy+Gv+8=;
	b=pBa9lAfF3x8AwqRXVabzxUDzGd8KqyNPAThK13nAAkzUi03tHjz7tg0F+/6FT2Xf2R
	9OJbOcn8+R7+yJYmDQBJcd/BtOR4WxwXxk+Iahh7/5B5ZyG7RRxVqIR5FMWgUNCAXGTb
	XNFQq4Lfnqrpk8spM8WHbo6em3uHXhIwuaNnpy7qCrFg3y7mxr6Mks2fvkvyNa7UE6Vc
	CDZ8DGxsfGtIQzFfgLtWrN86Zsv9xBdeN5953Y++eifkM6M0Hj6CLD4whW6v0bVuhz5I
	hvQO2E34gpKM7M6VfZYwGROOojPgKcGIQkkSx3QtumJeWcfypJ9l+Rk5ABX60oF/bOzB
	qI7Q==
X-Gm-Message-State: AIkVDXJoXw3SIzNB9zd/OuqRl9nUlkjmuYAR3zJKA6O/SywxiGxX0jvon+1KQzWjAMNfvQ==
X-Received: by 10.99.8.70 with SMTP id 67mr22317946pgi.205.1485761963630;
	Sun, 29 Jan 2017 23:39:23 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	h4sm29549341pfk.96.2017.01.29.23.39.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:39:22 -0800 (PST)
Date: Mon, 30 Jan 2017 17:39:12 +1000
Message-Id: <20170130073912.31483-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: Use 'populate_sdk_base' for non-linux targets
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
X-List-Received-Date: Mon, 30 Jan 2017 07:39:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When 'populate_sdk_ext' was first introduced in commit bf81d6bb7f6 it
replaced the inheriting of 'populate_sdk_base'. For non-linux targets
building the extensible SDK caused build errors, and the image class was
changed to inherit 'populate_sdk' when targeting a non-linux SDK_OS (in
commmit e471ce3464d). However inheriting 'populate_sdk' instead of
'populate_sdk_base' causes the SDK to always be built, this is not
expected for the image class.

This change makes the image class inherit 'populate_sdk_base' in the
non-linux SDK_OS case so that it behaves the same as it is expected to
behave where 'bitbake <image> -c populate_sdk' must be executed to
generate the SDK deployables.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4d50601bb2..bad73e3c51 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,8 +1,8 @@
 inherit rootfs_${IMAGE_PKGTYPE}
 
-# Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk
+# Only Linux SDKs support populate_sdk_ext, fall back to populate_sdk_base
 # in the non-Linux SDK_OS case, such as mingw32
-SDKEXTCLASS ?= "${@['populate_sdk', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
+SDKEXTCLASS ?= "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar("SDK_OS")]}"
 inherit ${SDKEXTCLASS}
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
-- 
2.11.0


