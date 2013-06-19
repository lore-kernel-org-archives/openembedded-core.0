Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23BCB60130
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 11:33:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5JBXkWr021139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 04:33:46 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 04:33:46 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 19 Jun 2013 19:33:13 +0800
Message-ID: <b48977b03ebeec67c3c5ed0f09b96818805b6eb8.1371641469.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371641469.git.kai.kang@windriver.com>
References: <cover.1371641469.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] autogen-native: fix build failure on overloaded hosts
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
X-List-Received-Date: Wed, 19 Jun 2013 11:33:48 -0000
Content-Type: text/plain

On some overloaded hosts, shell commands of autogen may can not
finish in 5 secs. This has caused many build failures, so increase
the timeout limit to fix this.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../autogen/autogen-native_5.17.4.bb               |    3 +-
 .../autogen/files/increase-timeout-limit.patch     |   33 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/autogen/files/increase-timeout-limit.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb b/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
index e5234c2..230c3a7 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.17.4.bb
@@ -9,7 +9,8 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
 
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
-           file://guile.patch"
+           file://guile.patch \
+           file://increase-timeout-limit.patch"
 
 SRC_URI[md5sum] = "09f074cba57610bf4ef1147e01c8ae90"
 SRC_URI[sha256sum] = "cd2585f4794d0e9d7f2cb0b9af4f2bd429946e718473edf1cf8c49f081ca71ed"
diff --git a/meta/recipes-devtools/autogen/files/increase-timeout-limit.patch b/meta/recipes-devtools/autogen/files/increase-timeout-limit.patch
new file mode 100644
index 0000000..3d4c1d6
--- /dev/null
+++ b/meta/recipes-devtools/autogen/files/increase-timeout-limit.patch
@@ -0,0 +1,33 @@
+Subject: [PATCH] autogen: increase timeout limit for shell commands
+
+On some overloaded hosts, shell commands of autogen may can not
+finish in 5 secs. This has caused many build failures, so increase
+the timeout limit to fix this.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+---
+ configure.ac |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0af7c18..5544f59 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -175,9 +175,9 @@ config_end_time=`date +%s 2>/dev/null`
+ time_delta=`expr ${config_end_time} - ${config_start_time} 2>/dev/null`
+ 
+ if test -z "${time_delta}"
+-then time_delta=10
+-elif test ${time_delta} -lt 5
+-then time_delta=5 ; fi
++then time_delta=60
++elif test ${time_delta} -lt 30
++then time_delta=30 ; fi
+ 
+ AG_TIMEOUT=${time_delta}
+ ]
+-- 
+1.7.9.5
+
-- 
1.7.5.4


