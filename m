Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF8F734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 16:10:31 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id t8OGASRL008518
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 18:10:28 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ww002.siemens.net [139.16.76.236])
	by mail1.siemens.de (8.15.1/8.15.1) with ESMTP id t8OGASgF029242;
	Thu, 24 Sep 2015 18:10:28 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 18:10:05 +0200
Message-Id: <1443111005-20485-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runqemu: don't complain about conflicting machines if they are equal
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
X-List-Received-Date: Thu, 24 Sep 2015 16:10:34 -0000

When the MACHINE variable was set as an environment variable, via
"export MACHINE=qemuarm" and runqemu was executed as "runqemu qemuarm"

The confusing error message appears:
Error: conflicting MACHINE types [qemuarm] and [qemuarm]

This checks if the two values are equal, in that case there is no problem
and execution can continue.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100755 => 100644 scripts/runqemu

diff --git a/scripts/runqemu b/scripts/runqemu
old mode 100755
new mode 100644
index 23cf5be..5989507
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -111,7 +111,7 @@ while true; do
     case "$arg" in
         "qemux86" | "qemux86-64" | "qemuarm" | "qemuarm64" | "qemumips" | "qemumipsel" | \
         "qemumips64" | "qemush4"  | "qemuppc" | "qemumicroblaze" | "qemuzynq")
-            [ -z "$MACHINE" ] && MACHINE=$arg || \
+            [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
         "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs" | "hddimg" | "hdddirect" )
-- 
2.1.4


