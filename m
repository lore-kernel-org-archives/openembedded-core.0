Return-Path: <scott.a.garman@intel.com>
Received: from masterfoo.zenlinux.com (masterfoo.zenlinux.com [207.192.74.254])
	by mail.openembedded.org (Postfix) with ESMTP id 70EEC6DF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 21:58:26 +0000 (UTC)
Received: from localhost (c-50-139-96-211.hsd1.or.comcast.net [50.139.96.211])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 22C28301C9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 16:57:42 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 13:57:31 -0800
Message-Id: <91f2cb9128007933216034298897b5ab34cc90ed.1386279548.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386279548.git.scott.a.garman@intel.com>
References: <cover.1386279548.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1386279548.git.scott.a.garman@intel.com>
References: <cover.1386279548.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 22C28301C9.21964
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu: remove core-image-* whitelist
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
X-List-Received-Date: Thu, 05 Dec 2013 21:58:26 -0000

Using a whitelist for image names to default to when none are
specified on the command line is no longer desired. Instead,
choose the most recently created image filename that conforms
to typical image naming conventions.

Fixes [YOCTO #5617].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 619ffb6..9c0a03b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -399,18 +399,11 @@ findimage() {
 
     # Sort rootfs candidates by modification time - the most
     # recently created one is the one we most likely want to boot.
-    filenames=`ls -t $where/*-image*$machine.$extension 2>/dev/null | xargs`
-    for name in $filenames; do
-        case $name in
-        *core-image-sato* | \
-        *core-image-lsb* | \
-        *core-image-basic* | \
-        *core-image-minimal* )
-            ROOTFS=$name
-            return
-            ;;
-        esac
-    done
+    filename=`ls -t1 $where/*-image*$machine.$extension 2>/dev/null | head -n1`
+    if [ "x$filename" != "x" ]; then
+        ROOTFS=$filename
+        return
+    fi
 
     echo "Couldn't find a $machine rootfs image in $where."
     exit 1
-- 
1.8.1.2


