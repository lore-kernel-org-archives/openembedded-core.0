Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C93FE7D90D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 16:31:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3AGVg3x000143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Apr 2019 09:31:43 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 10 Apr 2019 09:31:42 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Wed, 10 Apr 2019 12:31:33 -0400
Message-ID: <1554913893-4214-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1554913893-4214-1-git-send-email-mark.asselstine@windriver.com>
References: <1554913893-4214-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [v4][PATCH 2/2] goarch.bbclass: use MACHINEOVERRIDES and simplify go_map_arm()
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
X-List-Received-Date: Wed, 10 Apr 2019 16:31:42 -0000
Content-Type: text/plain

Per https://github.com/golang/go/wiki/GoArm we need to set GOARM when
cross building for ARMv5, ARMv6 and ARMv7. The current approach of
using TUNE_FEATURES can be error prone, as we can see today when
attempting to build for Cortex-A7 which results in GOARM=''.

Since the value of MACHINEOVERRIDES already consolidates the values of
TUNE_FEATURES into something more consistent we can use the overrides
mechanism to set GOARM, leaving just a little bit of logic in
go_map_arm() to trigger off the arch (basically target vs host)
for the setting of GOARM.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

V2
* Cover all ARMv7 Cortex* variants

V3
* Switch to using MACHINEOVERRIDES/overrides mechanism

V4
* Access BASE_GOARM directly instead of as a func param
* Avoid using a slow regex


 meta/classes/goarch.bbclass | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 7aaf26a..166dea9 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -3,18 +3,26 @@ BUILD_GOARCH = "${@go_map_arch(d.getVar('BUILD_ARCH'), d)}"
 BUILD_GOTUPLE = "${BUILD_GOOS}_${BUILD_GOARCH}"
 HOST_GOOS = "${@go_map_os(d.getVar('HOST_OS'), d)}"
 HOST_GOARCH = "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
-HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+HOST_GOARM = "${@go_map_arm(d.getVar('HOST_ARCH'), d)}"
 HOST_GO386 = "${@go_map_386(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOMIPS = "${@go_map_mips(d.getVar('HOST_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 HOST_GOTUPLE = "${HOST_GOOS}_${HOST_GOARCH}"
 TARGET_GOOS = "${@go_map_os(d.getVar('TARGET_OS'), d)}"
 TARGET_GOARCH = "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
-TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
+TARGET_GOARM = "${@go_map_arm(d.getVar('TARGET_ARCH'), d)}"
 TARGET_GO386 = "${@go_map_386(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOMIPS = "${@go_map_mips(d.getVar('TARGET_ARCH'), d.getVar('TUNE_FEATURES'), d)}"
 TARGET_GOTUPLE = "${TARGET_GOOS}_${TARGET_GOARCH}"
 GO_BUILD_BINDIR = "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') == d.getVar('HOST_GOTUPLE')]}"
 
+# Use the MACHINEOVERRIDES to map ARM CPU architecture passed to GO via GOARM.
+# This is combined with *_ARCH to set HOST_GOARM and TARGET_GOARM.
+BASE_GOARM = ''
+BASE_GOARM_armv7ve = '7'
+BASE_GOARM_armv7a = '7'
+BASE_GOARM_armv6 = '6'
+BASE_GOARM_armv5 = '5'
+
 # Go supports dynamic linking on a limited set of architectures.
 # See the supportsDynlink function in go/src/cmd/compile/internal/gc/main.go
 GO_DYNLINK = ""
@@ -73,15 +81,9 @@ def go_map_arch(a, d):
     else:
         raise bb.parse.SkipRecipe("Unsupported CPU architecture: %s" % a)
 
-def go_map_arm(a, f, d):
-    import re
-    if re.match('arm.*', a):
-        if 'armv7' in f:
-            return '7'
-        elif 'armv6' in f:
-            return '6'
-        elif 'armv5' in f:
-            return '5'
+def go_map_arm(a, d):
+    if a.startswith("arm"):
+        return d.getVar('BASE_GOARM')
     return ''
 
 def go_map_386(a, f, d):
-- 
2.7.4


