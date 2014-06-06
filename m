Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36CBB6FC2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:21:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s568LZnM022219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:21:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 01:21:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jun 2014 16:22:28 +0800
Message-ID: <a1318528465ddd9120a3e187c053cfd67254811c.1402042902.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402042902.git.Qi.Chen@windriver.com>
References: <cover.1402042902.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] autogen-native: upgrade from 2.18.2 to 2.18.3
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
X-List-Received-Date: Fri, 06 Jun 2014 08:21:36 -0000
Content-Type: text/plain

Upgrade autogen-native from 2.18.2 to 2.18.3.
A patch is made to fix the compilation error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...n-native_5.18.2.bb => autogen-native_5.18.3.bb} |    7 +++--
 ...ig.sh-force-exit-value-to-be-0-in-subproc.patch |   30 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.2.bb => autogen-native_5.18.3.bb} (80%)
 create mode 100644 meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
similarity index 80%
rename from meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
index 92e7099..61bd21f 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.3.bb
@@ -10,10 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://guile.patch \
-           file://increase-timeout-limit.patch"
+           file://increase-timeout-limit.patch \
+           file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch"
 
-SRC_URI[md5sum] = "117c4bc5613c57e1b97d760a5d1910a4"
-SRC_URI[sha256sum] = "cc2702dec21ba5b01144865163f6d1a54268d2b72aafc5520ad0e0cb57104068"
+SRC_URI[md5sum] = "0fb6b003423e004d94e0119c2390078f"
+SRC_URI[sha256sum] = "73d05a689105eb9b8be54f32498c99ddbd360776fc61cf45be6a2a4eb4a40039"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 
diff --git a/meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch b/meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch
new file mode 100644
index 0000000..e56da7b
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Pending
+
+mk-tpl-config.sh: force exit value to be 0 in subprocess
+
+The return value of statement list=`<subcommands>` is the exit value of the
+subcommands. So if the subcommands fails, the compilation fails. This is obviously
+not intended. In the normal case, we expect the grep command to fail as there should
+be no 'noreturn' word in the libguile files.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ autoopts/mk-tpl-config.sh |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autoopts/mk-tpl-config.sh b/autoopts/mk-tpl-config.sh
+index 926f5ab..6b4a0fb 100755
+--- a/autoopts/mk-tpl-config.sh
++++ b/autoopts/mk-tpl-config.sh
+@@ -202,7 +202,7 @@ fix_guile() {
+ 
+     list=`set +e ; exec 2>/dev/null
+         find ${libguiledir}/libguile* -type f | \
+-            xargs grep -l -E '\<noreturn\>'`
++            xargs grep -l -E '\<noreturn\>' ; exit 0`
+ 
+     test -z "$list" && exit 0
+ 
+-- 
+1.7.9.5
+
-- 
1.7.9.5


