Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 337E87CF09
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 09:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2B9vlmN020278
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 02:58:03 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Mon, 11 Mar 2019 02:57:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2019 18:16:55 +0800
Message-ID: <e3265c111497596f7731b2c65dd502e83e3b6c50.1552299354.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1552299354.git.liezhi.yang@windriver.com>
References: <cover.1552299354.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] oe-init-build-env: Error out when failed to locate cwd
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
X-List-Received-Date: Mon, 11 Mar 2019 09:58:12 -0000
Content-Type: text/plain

Ubuntu's /bin/sh symlinks to /bin/dash by default, so
subprocess.check_call(oe-init-build-env, cwd=builddir) would be failed since
pwd is builddir, and there is no $builddir/oe-init-build-env, this would
lead to other confusing errors, check and error it out earlier to make it
easier to locate the problem.

We don't meet the problem when manually run ". oe-init-build-env" is because
Ubuntu's default login shell is bash, but subprocess.check_call() doesn't
respect to login shell, so the error only happens in situations like
subprocess.check_call().

And also print errors to stderr as oe-buildenv-internal does.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 oe-init-build-env | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index e813230..861c3e0 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -31,13 +31,18 @@ elif [ -n "$ZSH_NAME" ]; then
     THIS_SCRIPT=$0
 else
     THIS_SCRIPT="$(pwd)/oe-init-build-env"
+    if [ ! -e "$THIS_SCRIPT" ]; then
+        echo "Error: $THIS_SCRIPT doesn't exist!" >&2
+        echo "Please run this script in oe-init-build-env's directory." >&2
+        exit 1
+    fi
 fi
 if [ -n "$BBSERVER" ]; then
     unset BBSERVER
 fi
 
 if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
-    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
+    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'" >&2
     exit 1
 fi
 
-- 
2.7.4


