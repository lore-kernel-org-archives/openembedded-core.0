Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0048A72053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 10:02:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 19 Nov 2014 00:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="418556654"
Received: from gcwannia-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.103])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Nov 2014 00:44:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 08:53:20 +0000
Message-Id: <b146057c438266de036a1dc81519a6a4b21b9362.1416386960.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416386960.git.paul.eggleton@linux.intel.com>
References: <cover.1416386960.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416386960.git.paul.eggleton@linux.intel.com>
References: <cover.1416386960.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] openssh: drop already applied patch
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
X-List-Received-Date: Wed, 19 Nov 2014 10:02:55 -0000

This patch was part of the 6.6p1 release.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../openssh/openssh/openssh-CVE-2014-2532.patch    | 22 ----------------------
 meta/recipes-connectivity/openssh/openssh_6.6p1.bb |  1 -
 2 files changed, 23 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch
deleted file mode 100644
index 3deaf3f..0000000
--- a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Backport
-
-Fix for CVE-2014-2532
-
-Backported from openssh-6.6p1.tar.gz
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
---- a/session.c
-+++ b/session.c
-@@ -955,6 +955,11 @@
- 	u_int envsize;
- 	u_int i, namelen;
- 
-+	if (strchr(name, '=') != NULL) {
-+		error("Invalid environment variable \"%.100s\"", name);
-+		return;
-+	}
-+
- 	/*
- 	 * If we're passed an uninitialized list, allocate a single null
- 	 * entry before continuing.
diff --git a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
index 047a895..edae036 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.6p1.bb
@@ -23,7 +23,6 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
-           file://openssh-CVE-2014-2532.patch \
            file://openssh-CVE-2014-2653.patch \
            file://auth2-none.c-avoid-authenticate-empty-passwords-to-m.patch"
 
-- 
1.9.3


