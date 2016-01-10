Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D34F7422C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 00:31:08 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id yy13so23082414pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 16:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=2vll+du6W15/syvQXhJTO+pcIM5d+EKcC32JikrWn/o=;
	b=lzllYfbJJigjN4EVE/GSMDCZ6WlIxXCzK9j2mJYyR7YFDnZTCktiWbUlX5I26Hy+kL
	X/uZnTBzoptQKKMmyj9FSpZ1i/tVn87ppk5L3RIq63KuUaDNkG1dHnTBOhmfEnq3fSna
	FpMKfu0Beth2EXVlCe3dtFv+HTr3SuOeNu0RqHk7El9R6BEOqnO4vfuq+ISLJRs80Izp
	rIDRXJ8r0mZf0qclW3TdHuV7p51VWcWicuM7NtSRHhwDtKDBsOepTUkhK1lAwk+Mb32r
	zvYy4CJTZlkzuFNIQaVb/r7QCmjO/HP2Iy6fv8KmvlwEn0FcZaCZYmJ045rcOd9w1eGw
	O5PQ==
X-Received: by 10.66.191.195 with SMTP id ha3mr1153278pac.58.1452385869657;
	Sat, 09 Jan 2016 16:31:09 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	k71sm13697016pfj.55.2016.01.09.16.31.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Jan 2016 16:31:01 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id CE64CFCC843; Sat,  9 Jan 2016 16:30:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 16:30:35 -0800
Message-Id: <d0ac662a911e5b31282888001876c7d4a53d6416.1452385571.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
In-Reply-To: <cover.1452385571.git.akuster808@gmail.com>
References: <cover.1452385571.git.akuster808@gmail.com>
Subject: [PATCH 09/20] allarch: Force TARGET_*FLAGS variable values
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
X-List-Received-Date: Sun, 10 Jan 2016 00:31:08 -0000

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
1.9.1


