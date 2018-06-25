Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A20D7507D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 09:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 004E3184D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:27:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id iqG6FxUuklQZ
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7CD8E184D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 62CA61A06B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 570A91A067
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by thoth.se.axis.com (Postfix) with ESMTP id 4A8AC1EF7;
	Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 3B2789C0AD; Mon, 25 Jun 2018 11:27:52 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 11:27:38 +0200
Message-Id: <20180625092738.17962-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH] rpm: Avoid leaking temporary scriplet files
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
X-List-Received-Date: Mon, 25 Jun 2018 09:27:53 -0000

RPM writes each package scriptlet (post-/preinstall) to /var/tmp/rpm-tmp.XXXXXX
 --- a lot of files get created. When debugging is enabled, these temporary
scriptlet files aren't cleaned up at all and after a while this results in the
filesystem resources are eaten up (like running out of available inodes).

This is a quick fix to avoid this. It does degrade functionality for
those working with debugging pre-/postintall scripts.

Fixes [YOCTO #12792]

Signed-off-by: Olof Johansson <olofjn@axis.com>
---
 ...ve-written-tmp-scriptlets-even-with-debug.patch | 37 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.1.bb            |  6 ++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Always-remove-written-tmp-scriptlets-even-with-debug.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Always-remove-written-tmp-scriptlets-even-with-debug.patch b/meta/recipes-devtools/rpm/files/0001-Always-remove-written-tmp-scriptlets-even-with-debug.patch
new file mode 100644
index 00000000000..fe4b45bfb3b
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Always-remove-written-tmp-scriptlets-even-with-debug.patch
@@ -0,0 +1,37 @@
+From b74b549ff61ab8a2bdb041febbe135ad10fa303c Mon Sep 17 00:00:00 2001
+From: Olof Johansson <olofjn@axis.com>
+Date: Sun, 17 Jun 2018 12:12:36 +0200
+Subject: [PATCH] Always remove written tmp scriptlets, even with debugging
+ enabled
+
+RPM writes each package scriptlet (post-/preinstall) to /var/tmp/rpm-tmp.XXXXXX
+ --- a lot of files get created. When debugging is enabled, these temporary
+scriptlet files aren't cleaned up at all and after a while this results in the
+filesystem resources are eaten up (like running out of available inodes).
+
+This is a quick fix to avoid this. It does degrade functionality for
+those working with debugging pre-/postintall scripts.
+
+Upstream-Status: inappropriate [OE specific]
+Signed-off-by: Olof Johansson <olofjn@axis.com>
+---
+ lib/rpmscript.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/rpmscript.c b/lib/rpmscript.c
+index 98d3f420d..6bf23c18c 100644
+--- a/lib/rpmscript.c
++++ b/lib/rpmscript.c
+@@ -430,8 +430,7 @@ exit:
+ 	Fclose(out);	/* XXX dup'd STDOUT_FILENO */
+ 
+     if (fn) {
+-	if (!rpmIsDebug())
+-	    unlink(fn);
++	unlink(fn);
+ 	free(fn);
+     }
+     free(mline);
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
index e5e87d39039..63a00ea1c0b 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
@@ -45,6 +45,12 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0003-rpmSetCloseOnExec-use-getrlimit.patch \
            "
 
+# When we use RPM internally in OpenEmbedded, we enable debug output. This
+# unfortunately makes rpm not remove generated temporary files, which causes
+# incremental leakage for every build. Change behavior in rpm-native to always
+# remove the temporary files.
+SRC_URI_append_class-native = " file://0001-Always-remove-written-tmp-scriptlets-even-with-debug.patch"
+
 PE = "1"
 SRCREV = "bfee1410af51c1cc9724791fb8d985260a62102b"
 
-- 
2.11.0


