Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBF2C6FBEE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 01:50:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4T1o9Tq019266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 18:50:09 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 18:50:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 May 2014 09:50:53 +0800
Message-ID: <99d353d5d2ffbfd6a38e937883820f42a0a880f7.1401328168.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1401328168.git.Qi.Chen@windriver.com>
References: <cover.1401328168.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] update-rc.d: fix to handle priority numbers correctly
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
X-List-Received-Date: Thu, 29 May 2014 01:50:12 -0000
Content-Type: text/plain

The update-rc.d treated priority numbers begin with '0' as octal
numbers. This led to problems of update-rc.d being unable to handle
priorities like '08' or '09' correctly.

This patch fixes the above problem.

[YOCTO #6376]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../fix-to-handle-priority-numbers-correctly.patch |   28 ++++++++++++++++++++
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch

diff --git a/meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch b/meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch
new file mode 100644
index 0000000..85bc234
--- /dev/null
+++ b/meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+Fix to handle priority numbers correctly.
+Previously, if the priority number is '08' or '09', for example,
+the script cannot handle them correctly as these numbers are treated
+as octal numbers.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ update-rc.d |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/update-rc.d b/update-rc.d
+index ec50d15..c70b859 100644
+--- a/update-rc.d
++++ b/update-rc.d
+@@ -205,7 +205,7 @@ case $1 in
+ 				exit 1
+ 			fi
+ 			shift
+-			NN=`printf %02d $1`
++			NN=`printf %02d $(expr $1 + 0)`
+ 			shift
+ 			while [ "x$1" != "x." ]; do
+ 				if [ $# -eq 0 ]; then
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
index 50dcaa2..c15cb78 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.7.bb
@@ -13,6 +13,7 @@ SRCREV = "eca680ddf28d024954895f59a241a622dd575c11"
 SRC_URI = "git://github.com/philb/update-rc.d.git \
            file://add-verbose.patch \
            file://check-if-symlinks-are-valid.patch \
+           file://fix-to-handle-priority-numbers-correctly.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


