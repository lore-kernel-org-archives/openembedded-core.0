Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25D1B606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 08:25:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5C8PGcU021201
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 01:25:16 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 12 Jun 2016 01:25:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 01:25:03 -0700
Message-ID: <da4977cef519067dab90b5a09d234dbef83426b9.1465719878.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465719878.git.liezhi.yang@windriver.com>
References: <cover.1465719878.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] autogen-native: 5.18.6 -> 5.18.10
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
X-List-Received-Date: Sun, 12 Jun 2016 08:25:17 -0000
Content-Type: text/plain

Removed redirect-output-dir.patch, there is no /tmp/mklibsrc-log.tx, so
the patch is not needed any more.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-native_5.18.6.bb => autogen-native_5.18.10.bb} |  5 ++--
 .../autogen/autogen/redirect-output-dir.patch      | 28 ----------------------
 2 files changed, 2 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/autogen/{autogen-native_5.18.6.bb => autogen-native_5.18.10.bb} (87%)
 delete mode 100644 meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.6.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
similarity index 87%
rename from meta/recipes-devtools/autogen/autogen-native_5.18.6.bb
rename to meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
index d77b827..fd52c83 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.6.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
@@ -11,11 +11,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://increase-timeout-limit.patch \
            file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
-           file://redirect-output-dir.patch \
 "
 
-SRC_URI[md5sum] = "fdee403e524c0af3ded6b3becb365671"
-SRC_URI[sha256sum] = "2fc7f12a5ecb3b1e8bd4364aa906b837cff01f80edb7d2fb38ed8b9dfbcd3271"
+SRC_URI[md5sum] = "2d1b5226e1929d0680011df631289571"
+SRC_URI[sha256sum] = "0b8681d9724c481d3b726b5a9e81d3d09dc7f307d1a801c76d0a30d8f843d20a"
 
 UPSTREAM_CHECK_URI = "http://ftp.gnu.org/gnu/autogen/"
 UPSTREAM_CHECK_REGEX = "rel(?P<pver>\d+(\.\d+)+)/"
diff --git a/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch b/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
deleted file mode 100644
index fc5a71b..0000000
--- a/meta/recipes-devtools/autogen/autogen/redirect-output-dir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-[PATCH] redirect the dir of mklibsrc-log.tx
-
-Upstream-Status: Pending
-
-redirect mklibsrc-log.tx to builddir, not /tmp; otherwise mklibsrc-log.tx
-maybe unable to be written if other users is building autogen at the same time.
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- pkg/libopts/mklibsrc.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/pkg/libopts/mklibsrc.sh b/pkg/libopts/mklibsrc.sh
-index 416b402..d612fbc 100644
---- a/pkg/libopts/mklibsrc.sh
-+++ b/pkg/libopts/mklibsrc.sh
-@@ -19,7 +19,7 @@
- ##  with this program.  If not, see <http://www.gnu.org/licenses/>.
- 
- set -ex
--exec 2> /tmp/mklibsrc-log.tx
-+exec 2> $top_builddir/mklibsrc-log.tx
- 
- top_builddir=`cd $top_builddir ; pwd`
- top_srcdir=`cd $top_srcdir ; pwd`
--- 
-1.9.1
-
-- 
2.8.0


