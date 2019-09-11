Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3D667CE79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 06:03:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8B63HVL019200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 23:03:17 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 10 Sep 2019 23:03:16 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2019 14:02:53 +0800
Message-ID: <1568181773-91288-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] qemu: Security Advisory - qemu - CVE-2019-15890
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
X-List-Received-Date: Wed, 11 Sep 2019 06:03:16 -0000
Content-Type: text/plain

Backporting patch from
https://gitlab.freedesktop.org/slirp/libslirp/commit/c5927943
to solve CVE-2019-15890.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../qemu/qemu/CVE-2019-15890.patch                 | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 241f9db..de21d30 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -23,6 +23,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
+           file://CVE-2019-15890.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
new file mode 100644
index 0000000..1d89431
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-15890.patch
@@ -0,0 +1,48 @@
+From 4fc0d23e8f6d795c679623d2ed2cbe6a7a17b9c7 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Tue, 10 Sep 2019 20:02:15 -0700
+Subject: [PATCH] ip_reass: Fix use after free
+
+Using ip_deq after m_free might read pointers from an allocation reuse.
+
+This would be difficult to exploit, but that is still related with
+CVE-2019-14378 which generates fragmented IP packets that would trigger this
+issue and at least produce a DoS.
+
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+
+Upstream-Status: Backport
+CVE: CVE-2019-15890
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ slirp/src/ip_input.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/slirp/src/ip_input.c b/slirp/src/ip_input.c
+index 8c75d914..c07d7d40 100644
+--- a/slirp/src/ip_input.c
++++ b/slirp/src/ip_input.c
+@@ -292,6 +292,7 @@ static struct ip *ip_reass(Slirp *slirp, struct ip *ip, struct ipq *fp)
+      */
+     while (q != (struct ipasfrag *)&fp->frag_link &&
+            ip->ip_off + ip->ip_len > q->ipf_off) {
++        struct ipasfrag *prev;
+         i = (ip->ip_off + ip->ip_len) - q->ipf_off;
+         if (i < q->ipf_len) {
+             q->ipf_len -= i;
+@@ -299,9 +300,10 @@ static struct ip *ip_reass(Slirp *slirp, struct ip *ip, struct ipq *fp)
+             m_adj(dtom(slirp, q), i);
+             break;
+         }
++        prev = q;
+         q = q->ipf_next;
+-        m_free(dtom(slirp, q->ipf_prev));
+-        ip_deq(q->ipf_prev);
++        ip_deq(prev);
++        m_free(dtom(slirp, prev));
+     }
+ 
+ insert:
+-- 
+2.23.0
+
-- 
1.9.1


