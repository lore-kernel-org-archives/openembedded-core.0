Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.11626.1617714519597800008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Apr 2021 06:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=YzDDQ7rx;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pemorrow@linux.microsoft.com)
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 210FA20B5681;
	Tue,  6 Apr 2021 06:08:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 210FA20B5681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1617714519;
	bh=40vxoPq3HfgizkPez0GMBzOfKmQcMQ/XBXwvthgeSSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzDDQ7rxDjPXCyy+yaD2X7rnvFRUspGtvmOMHKLticp/A43VJyFqzRh/fe2L3Trk6
	 qBeRysOx8XRnh3C9jRPl/CkB9Xbhg/xsniI5CeYgt+QsHSa/i9065aqLYrn5qwCQ3+
	 xDpr0k+fxIX1SrbfcnRUQnvIlUY4v/6FQdC91eOY=
From: "Peter Morrow" <pemorrow@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.morrow@microsoft.com,
	raj.khem@gmail.com
Subject: [dunfell][PATCH 2/2] go_1.14: don't set -buildmode=pie when building for windows targets
Date: Tue,  6 Apr 2021 06:07:58 -0700
Message-Id: <1617714478-10348-2-git-send-email-pemorrow@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com>
References: <1617714478-10348-1-git-send-email-pemorrow@linux.microsoft.com>

go 1.14 for windows targets does not support -buildmode=pie, disable it and use
the default buildmode instead. Support for -buildmode=pie for windows targets
is added with go 1.15 (https://golang.org/doc/go1.15) which is added to poky in
gatesgarth.

Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
---
 meta/classes/go.bbclass             | 8 ++++----
 meta/recipes-devtools/go/go_1.14.bb | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index a9e31b5..8ff482b 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -144,11 +144,11 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg"
 
 INSANE_SKIP_${PN} += "ldflags"
 
-# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
-# variants.
+# Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but
+# windows/mips/riscv doesn't support -buildmode=pie, so skip the QA checking
+# for windows/mips/riscv and their variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH'):
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH') or 'windows' in d.getVar('TARGET_GOOS'):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
         d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
diff --git a/meta/recipes-devtools/go/go_1.14.bb b/meta/recipes-devtools/go/go_1.14.bb
index bc90a13..c175279 100644
--- a/meta/recipes-devtools/go/go_1.14.bb
+++ b/meta/recipes-devtools/go/go_1.14.bb
@@ -3,11 +3,11 @@ require go-target.inc
 
 export GOBUILDMODE=""
 export CGO_ENABLED_riscv64 = ""
-# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but mips/riscv
-# doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
-# variants.
+# Add pie to GOBUILDMODE to satisfy "textrel" QA checking, but
+# windows/mips/riscv doesn't support -buildmode=pie, so skip the QA checking
+# for windows/mips/riscv and their variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
+    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True) or 'windows' in d.getVar('TARGET_GOOS', True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
     else:
         d.setVar('GOBUILDMODE', 'pie')
-- 
1.8.3.1

