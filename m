Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6851060053
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 05:39:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t895d5YB000209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Sep 2015 22:39:05 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Tue, 8 Sep 2015 22:39:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Sep 2015 13:40:03 +0800
Message-ID: <e7f786277bcb7591b7cd8073f398586a7fa0bc8b.1441777155.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1441777155.git.Qi.Chen@windriver.com>
References: <cover.1441777155.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: chi.xu@windriver.com
Subject: [PATCH 1/1] bind: fix compile failure when building path is long
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
X-List-Received-Date: Wed, 09 Sep 2015 05:39:08 -0000
Content-Type: text/plain

Fix the building path is long, when building bind, we would meet the following
error.

    ".../long/path/to/bind/9.10.2-P3-r0/bind-9.10.2-P3/lib/dns" too long

This is because the in gen.c, DIRNAMESIZE is limited to 256. But in OE, the
path length limit is more than 400. So we change it to 512.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 25 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2-P3.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch

diff --git a/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
new file mode 100644
index 0000000..1215093
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+Subject: gen.c: extend DIRNAMESIZE from 256 to 512
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lib/dns/gen.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/dns/gen.c b/lib/dns/gen.c
+index 7a7dafb..51a0435 100644
+--- a/lib/dns/gen.c
++++ b/lib/dns/gen.c
+@@ -148,7 +148,7 @@ static const char copyright[] =
+ #define TYPECLASSBUF (TYPECLASSLEN + 1)
+ #define TYPECLASSFMT "%" STR(TYPECLASSLEN) "[-0-9a-z]_%d"
+ #define ATTRIBUTESIZE 256
+-#define DIRNAMESIZE 256
++#define DIRNAMESIZE 512
+ 
+ static struct cc {
+ 	struct cc *next;
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb b/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
index 151eec0..ff7937a 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2-P3.bb
@@ -19,6 +19,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://bind-confgen-build-unix.o-once.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
+           file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
            "
 
 SRC_URI[md5sum] = "a810d5d65fbdcf28dcda80d646913c3a"
-- 
1.9.1


