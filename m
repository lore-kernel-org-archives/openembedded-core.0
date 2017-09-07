Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89F8977D52
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 02:32:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v872W2bQ000324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Sep 2017 19:32:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Sep 2017 19:32:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Sep 2017 10:37:10 +0800
Message-ID: <d0cc8a5e4cb44c2fdabb84f657ce908a5b7c9ecf.1504751799.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504751799.git.Qi.Chen@windriver.com>
References: <cover.1504751799.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] iputils: backport patch to fix arping hang problem
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
X-List-Received-Date: Thu, 07 Sep 2017 02:32:01 -0000
Content-Type: text/plain

arping hangs if SIGALARM is blocked. Backport a patch to fix this problem.

Unblock SIGALRM so that the previously called alarm() can prevent recvfrom()
from blocking forever in case the inherited procmask is blocking SIGALRM and
no packet is received.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/iputils/iputils_s20151218.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch

diff --git a/meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch b/meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
new file mode 100644
index 0000000..7b56276
--- /dev/null
+++ b/meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch
@@ -0,0 +1,44 @@
+arping: fix arping hang if SIGALRM is blocked
+
+Unblock SIGALRM so that the previously called alarm() can prevent
+recvfrom() from blocking forever in case the inherited procmask is
+blocking SIGALRM and no packet is received.
+
+Upstream-Status: Backport
+
+Reported-by: Rui Prior <rprior@dcc.fc.up.pt>
+RH-Bugzilla: #1085971
+Signed-off-by: Jan Synacek <jsynacek@redhat.com>
+Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
+
+diff --git a/arping.c.orig b/arping.c
+index 35408c1..2098159 100644
+--- a/arping.c.orig
++++ b/arping.c
+@@ -1215,16 +1215,22 @@ main(int argc, char **argv)
+ 		socklen_t alen = sizeof(from);
+ 		int cc;
+ 
++		sigemptyset(&sset);
++		sigaddset(&sset, SIGALRM);
++		sigaddset(&sset, SIGINT);
++		/* Unblock SIGALRM so that the previously called alarm()
++		 * can prevent recvfrom from blocking forever in case the
++		 * inherited procmask is blocking SIGALRM and no packet
++		 * is received. */
++		sigprocmask(SIG_UNBLOCK, &sset, &osset);
++
+ 		if ((cc = recvfrom(s, packet, sizeof(packet), 0,
+ 				   (struct sockaddr *)&from, &alen)) < 0) {
+ 			perror("arping: recvfrom");
+ 			continue;
+ 		}
+ 
+-		sigemptyset(&sset);
+-		sigaddset(&sset, SIGALRM);
+-		sigaddset(&sset, SIGINT);
+-		sigprocmask(SIG_BLOCK, &sset, &osset);
++		sigprocmask(SIG_BLOCK, &sset, NULL);
+ 		recv_pack(packet, cc, (struct sockaddr_ll *)&from);
+ 		sigprocmask(SIG_SETMASK, &osset, NULL);
+ 	}
diff --git a/meta/recipes-extended/iputils/iputils_s20151218.bb b/meta/recipes-extended/iputils/iputils_s20151218.bb
index 0d4dd1b..46de6fc 100644
--- a/meta/recipes-extended/iputils/iputils_s20151218.bb
+++ b/meta/recipes-extended/iputils/iputils_s20151218.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
            file://nsgmls-path-fix.patch \
            file://0001-Fix-header-inclusion-for-musl.patch \
            file://0001-Intialize-struct-elements-by-name.patch \
+           file://arping-fix-arping-hang-if-SIGALRM-is-blocked.patch \
           "
 
 SRC_URI[md5sum] = "8aaa7395f27dff9f57ae016d4bc753ce"
-- 
1.9.1


