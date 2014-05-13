Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1729660B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 07:46:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4D7k7sK023304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 00:46:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 13 May 2014 00:46:06 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 May 2014 15:46:26 +0800
Message-ID: <488068880ae4caab34aba4e470e80921a787f167.1399967110.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399967110.git.Qi.Chen@windriver.com>
References: <cover.1399967110.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] openssh: fix for CVE-2014-2532
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
X-List-Received-Date: Tue, 13 May 2014 07:46:07 -0000
Content-Type: text/plain

sshd in OpenSSH before 6.6 does not properly support wildcards on
AcceptEnv lines in sshd_config, which allows remote attackers to
bypass intended environment restrictions by using a substring located
before a wildcard character.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../openssh/openssh/openssh-CVE-2014-2532.patch    |   22 ++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_6.5p1.bb |    3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch
new file mode 100644
index 0000000..3deaf3f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-CVE-2014-2532.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Backport
+
+Fix for CVE-2014-2532
+
+Backported from openssh-6.6p1.tar.gz
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+--- a/session.c
++++ b/session.c
+@@ -955,6 +955,11 @@
+ 	u_int envsize;
+ 	u_int i, namelen;
+ 
++	if (strchr(name, '=') != NULL) {
++		error("Invalid environment variable \"%.100s\"", name);
++		return;
++	}
++
+ 	/*
+ 	 * If we're passed an uninitialized list, allocate a single null
+ 	 * entry before continuing.
diff --git a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
index b93b9ae..230f38a 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.5p1.bb
@@ -29,7 +29,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
            file://sshdgenkeys.service \
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
-           file://run-ptest"
+           file://run-ptest \
+           file://openssh-CVE-2014-2532.patch"
 
 PAM_SRC_URI = "file://sshd"
 
-- 
1.7.9.5


