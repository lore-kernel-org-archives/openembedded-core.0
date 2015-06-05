Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D441E65C63
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 03:10:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t553AB2J016600
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jun 2015 20:10:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 4 Jun 2015 20:10:11 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jun 2015 11:03:55 +0800
Message-ID: <1433473435-29346-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] autogen: redirect the log file to build dir
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
X-List-Received-Date: Fri, 05 Jun 2015 03:10:11 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../autogen/autogen-native_5.18.4.bb               |  4 +++-
 .../autogen/autogen/redirect-output-dir.patch      | 28 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
index 302ba79..5fd6b7e 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.4.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://guile.patch \
            file://increase-timeout-limit.patch \
-           file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch"
+           file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
+           file://redirect-output-dir.patch \
+"
 
 SRC_URI[md5sum] = "6f48029cc839303d28496e1609868938"
 SRC_URI[sha256sum] = "3cd9f81a8ae7c6865bb9bbbe16c4307a243a1373d0b315a83571cbba1fff725d"
diff --git a/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch b/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
new file mode 100644
index 0000000..de126ed
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
@@ -0,0 +1,28 @@
+[PATCH] redirect the dir of mklibsrc-log.tx
+
+Upstream-Statue: Pending
+
+redirect mklibsrc-log.tx to builddir, not /tmp; otherwise mklibsrc-log.tx
+maybe unable to be written if other users is building autogen at the same time.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ pkg/libopts/mklibsrc.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pkg/libopts/mklibsrc.sh b/pkg/libopts/mklibsrc.sh
+index 416b402..d612fbc 100644
+--- a/pkg/libopts/mklibsrc.sh
++++ b/pkg/libopts/mklibsrc.sh
+@@ -19,7 +19,7 @@
+ ##  with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
+ set -ex
+-exec 2> /tmp/mklibsrc-log.tx
++exec 2> $top_builddir/mklibsrc-log.tx
+ 
+ top_builddir=`cd $top_builddir ; pwd`
+ top_srcdir=`cd $top_srcdir ; pwd`
+-- 
+1.9.1
+
-- 
1.9.1


