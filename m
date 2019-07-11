Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B12037ECC0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 20:27:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6BKRddN004010
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 13:27:39 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 11 Jul 2019 13:27:39 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jul 2019 13:27:39 -0700
Message-ID: <20190711202739.131168-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] libtool: allow for use of reproducible_build bbclass
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
X-List-Received-Date: Thu, 11 Jul 2019 20:27:38 -0000
Content-Type: text/plain

In a reproducible build environment, do not put the build host
name into libtool.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libtool/libtool/reproducible_build.patch       | 29 ++++++++++++++++++++++
 meta/recipes-devtools/libtool/libtool_2.4.6.bb     |  2 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/reproducible_build.patch

diff --git a/meta/recipes-devtools/libtool/libtool/reproducible_build.patch b/meta/recipes-devtools/libtool/libtool/reproducible_build.patch
new file mode 100644
index 0000000..c770c24
--- /dev/null
+++ b/meta/recipes-devtools/libtool/libtool/reproducible_build.patch
@@ -0,0 +1,29 @@
+libtool: allow for reproducible build
+
+If we are in a reproducible build environment, do not put the build host
+name into libtool.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+--- a/m4/libtool.m4
++++ b/m4/libtool.m4
+@@ -728,7 +728,17 @@ _LT_CONFIG_SAVE_COMMANDS([
+     cat <<_LT_EOF >> "$cfgfile"
+ #! $SHELL
+ # Generated automatically by $as_me ($PACKAGE) $VERSION
++_LT_EOF
++    if test -n "${SOURCE_DATE_EPOCH}"; then
++        cat <<_LT_EOF >> "$cfgfile"
++# Libtool was configured for a reproducible build: ${SOURCE_DATE_EPOCH}
++_LT_EOF
++    else
++        cat <<_LT_EOF >> "$cfgfile"
+ # Libtool was configured on host `(hostname || uname -n) 2>/dev/null | sed 1q`:
++_LT_EOF
++    fi
++    cat <<_LT_EOF >> "$cfgfile"
+ # NOTE: Changes made to this file will be lost: look at ltmain.sh.
+ 
+ # Provide generalized library-building support services.
diff --git a/meta/recipes-devtools/libtool/libtool_2.4.6.bb b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
index f5fdd00..a67d6dd 100644
--- a/meta/recipes-devtools/libtool/libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool_2.4.6.bb
@@ -1,6 +1,6 @@
 require libtool-${PV}.inc
 
-SRC_URI += "file://multilib.patch"
+SRC_URI += "file://multilib.patch file://reproducible_build.patch"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.7.4


