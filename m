Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EADED77CF6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jan 2018 01:55:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0A1tbhJ021621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jan 2018 17:55:38 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 9 Jan 2018 17:55:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jan 2018 09:53:05 +0800
Message-ID: <beff72f63345ccf39c1c7859d9e7ead406fd07c1.1515548571.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1515548571.git.jackie.huang@windriver.com>
References: <cover.1515548571.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] rpcbind: fix assertion failure
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
X-List-Received-Date: Wed, 10 Jan 2018 01:55:37 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backport a patch to fix the assertion failure:
rpcbind: ../../libtirpc-1.0.2/src/pmap_prot.c:50: xdr_pmap: Assertion `regs != NULL' failed.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...proc_dump-Fixed-typo-in-memory-leak-patch.patch | 33 ++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch b/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
new file mode 100644
index 0000000000..859e67bbe0
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
@@ -0,0 +1,33 @@
+From c49a7ea639eb700823e174fd605bbbe183e229aa Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Wed, 17 May 2017 10:52:25 -0400
+Subject: [PATCH] pmapproc_dump: Fixed typo in memory leak patch
+
+commit 7ea36eee introduce a typo that caused
+NIS (aka ypbind) to fail.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/pmap_svc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pmap_svc.c b/src/pmap_svc.c
+index e926cdc..26c31d0 100644
+--- a/src/pmap_svc.c
++++ b/src/pmap_svc.c
+@@ -384,7 +384,7 @@ pmapproc_dump(struct svc_req *rqstp /*__unused*/, SVCXPRT *xprt)
+ 	}
+ 
+ done:
+-	if (!svc_freeargs(xprt, (xdrproc_t) xdr_pmap, (char *)NULL)) {
++	if (!svc_freeargs(xprt, (xdrproc_t) xdr_void, (char *)NULL)) {
+ 		if (debugging) {
+ 			(void) xlog(LOG_DEBUG, "unable to free arguments\n");
+ 			if (doabort) {
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
index 60e46edd53..d3eeaf94b6 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind.socket \
            file://rpcbind.service \
            file://0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch \
+           file://pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch \
           "
 SRC_URI[md5sum] = "cf10cd41ed8228fc54c316191c1f07fe"
 SRC_URI[sha256sum] = "074a9a530dc7c11e0d905aa59bcb0847c009313f02e98d3d798aa9568f414c66"
-- 
2.11.0


