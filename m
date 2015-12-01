Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6C747601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 16:55:21 +0000 (UTC)
Received: by wmec201 with SMTP id c201so215055377wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Dec 2015 08:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XP1HJsntWeUtgevf58kU8OC+yb/gIpAB4qecpso1jZc=;
	b=wquPRP+hM29TCQbQxPrIBMo9JF8ED4mLsYhVpjiZ58td8rXhc/5XSuEgtTQRilplbU
	RXUl7RviebfSTkmW7Ar2NQ0rbxUYvO0VlBmKbs7qCSAXl6xkXo8tz+uVkIv3frrtd83S
	Rog5T3BhrjtETLtRqVqS0jqlHO+ybRdby0euNNR+fHePMlzTr3wet9L8v1kxAsM7U1+V
	Osrdg7MwbyGJq73Y1wtTMnFKwMH2xXAcYLvZoqbIPLtPUFenHQ5wsvg8iqTdnbiGY/li
	G1J3sbGlnx6fnqn6Xhy650wI1ao1LvsbQ+t03Xw4LJ1IVGvc0Tc1G+jGvGK/d8W190cT
	E2jA==
X-Received: by 10.28.90.132 with SMTP id o126mr39852558wmb.1.1448988922411;
	Tue, 01 Dec 2015 08:55:22 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	jh4sm52202834wjb.33.2015.12.01.08.55.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Dec 2015 08:55:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 17:56:18 +0100
Message-Id: <1448988978-26366-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH][dizzy] allarch: Force TARGET_*FLAGS variable values
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
X-List-Received-Date: Tue, 01 Dec 2015 16:55:22 -0000

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
index 4bc9927..6f63f9d 100644
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


