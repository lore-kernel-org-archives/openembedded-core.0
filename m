Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CFDC71E02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 08:53:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1G8rPIv005242
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:53:26 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 00:53:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Feb 2017 00:53:24 -0800
Message-ID: <335fdc9ba14019e62b29119cf8fe6875a7fb9076.1487235190.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1487235190.git.liezhi.yang@windriver.com>
References: <cover.1487235190.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe-init-build-env: create a symlink in BUILDDIR
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
X-List-Received-Date: Thu, 16 Feb 2017 08:53:26 -0000
Content-Type: text/plain

When there are multiple oe-core repos (for example, poky-master,
poky-morty and poky-krogoth) and multiple builddirs for them, it's not
easy to reinit builddir in such a case, and very easy to make mistakes.
Create a symlink in builddir will make it easy, for example:

e.g.:
$ . poky-morty/oe-init-build-env test_m
$ ls -l oe-init-build-env
oe-init-build-env -> /buildarea/lyang1/poky-morty/oe-init-build-env

When we want to reinit the builddir test_m:
$ . oe-init-build-env .

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 oe-init-build-env        | 6 +++++-
 oe-init-build-env-memres | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 5fe68d1..5a41bb2 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -41,9 +41,9 @@ if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
     exit 1
 fi
 
+THIS_SCRIPT=$(readlink -f $THIS_SCRIPT)
 if [ -z "$OEROOT" ]; then
     OEROOT=$(dirname "$THIS_SCRIPT")
-    OEROOT=$(readlink -f "$OEROOT")
 fi
 unset THIS_SCRIPT
 
@@ -53,6 +53,10 @@ export OEROOT
     unset OEROOT
     return 1
 }
+
+# Create a symlink
+ln -sf $OEROOT/oe-init-build-env $BUILDDIR
+
 unset OEROOT
 
 [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 9e1425e..71a4857 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -49,9 +49,9 @@ if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
     exit 1
 fi
 
+THIS_SCRIPT=$(readlink -f $THIS_SCRIPT)
 if [ -z "$OEROOT" ]; then
     OEROOT=$(dirname "$THIS_SCRIPT")
-    OEROOT=$(readlink -f "$OEROOT")
 fi
 unset THIS_SCRIPT
 
@@ -61,6 +61,10 @@ export OEROOT
     unset OEROOT
     return 1
 }
+
+# Create a symlink
+ln -sf $OEROOT/oe-init-build-env-memres $BUILDDIR
+
 unset OEROOT
 
 [ -z "$BUILDDIR" ] || cd "$BUILDDIR"
-- 
2.10.2


