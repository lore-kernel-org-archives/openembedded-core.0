Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2D2A0601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:54:55 +0000 (UTC)
Received: by wmww144 with SMTP id w144so21714654wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 08:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2kvLtByl2GVIa6yirMcKENllS+UrTOqk8lqSbfkdpPA=;
	b=VpFBxLeh8UwZviHAZk1JfKoN9lWcoxQlX/YJ0XRX9yPivNuXxw1PiNb7Za4AuzKJZ7
	Q7besrVTjwF2GW41cuYMOISwVgx/LC+WV0UINVUoRNvMHyGUo+RaO7LEOs9DRgqGNU73
	tvHYejXRxMabgLRcY2J4jrG5UNIRQ23l3mdd83e0EIDLJZBJN27gSKWOfT+CmqyCC8MH
	/VpP1mHlhgTfbON/gB6hCjL0AMqhjyAIVnbq4h6S2RrLXCzfYkDaFew4GUQZTcEz4T7k
	+zRE9qeoWBnKoDOcHN5Z7JW6ZXV2pzwXe4DpkZ5UoSEmLKgVcS3XMmwYTe4D7ZxCg7FL
	Uxqg==
X-Received: by 10.194.249.69 with SMTP id ys5mr77891123wjc.97.1448988896100;
	Tue, 01 Dec 2015 08:54:56 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	h5sm24676182wjz.21.2015.12.01.08.54.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Dec 2015 08:54:55 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 17:55:51 +0100
Message-Id: <1448988951-26260-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH][jethro] allarch: Force TARGET_*FLAGS variable values
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
X-List-Received-Date: Tue, 01 Dec 2015 16:54:57 -0000

From: Mike Crowe <mac@mcrowe.com>

TARGET_CPPFLAGS, TARGET_CFLAGS, TARGET_CPPFLAGS and TARGET_LDFLAGS may
differ between MACHINEs. Since they are exported they affect task hashes
even if unused which leads to multiple variants of allarch packages
existing in sstate and bouncing in the sysroot when switching between
MACHINEs.

allarch packages shouldn't be using these variables anyway, so let's
ensure they have a fixed value in order to avoid this problem.

(Compare with 05a70ac30b37cab0952f1b9df501993a9dec70da and
14f4d016fef9d660da1e7e91aec4a0e807de59ab.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/allarch.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 2fea7c0..4af38d7 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -27,6 +27,10 @@ python () {
         d.setVar("PACKAGE_EXTRA_ARCHS", "")
         d.setVar("SDK_ARCH", "none")
         d.setVar("SDK_CC_ARCH", "none")
+        d.setVar("TARGET_CPPFLAGS", "none")
+        d.setVar("TARGET_CFLAGS", "none")
+        d.setVar("TARGET_CXXFLAGS", "none")
+        d.setVar("TARGET_LDFLAGS", "none")
 
         # Avoid this being unnecessarily different due to nuances of
         # the target machine that aren't important for "all" arch
-- 
2.6.3


