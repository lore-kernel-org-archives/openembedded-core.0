Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACF46025E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 05:03:05 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p189so14778048pfp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 22:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Nf5J6Aoi05Tkt5QrM9FtdL2qhjWEZToAWzuri3vVEZA=;
	b=ZmeR7t5ReJYAFsbrubp6WWt6B3y9tkgsiIiEpII7Rd31jcohvJEgR43H02Ld+iUlVC
	YcZezJC8rOdgiffq8TcpvoeAWq1I/EhMYRar5QbAXctwNnC/sDtLzARMzRYiC8veRdfx
	TRCFweSpzOe46bOYqXhxPlt1BaDHjlPjdGo4Q41W6tSNKMAM0imjsXQn3k2won38Q8rA
	zAbOlZPT4MJEo8ERQ/qL14W0eJwhGv6VY4hep1fX/pcrHxQWwAU00puCdhtOyIeHbTaX
	4cWnzH1nERwWiDPGNxZo3R8verUK/FmjJAzGMOwtP/FhV6f2xsnUGoEN/mDYbaQV/rNe
	B0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Nf5J6Aoi05Tkt5QrM9FtdL2qhjWEZToAWzuri3vVEZA=;
	b=BkHBE3T715qr29TPoFDDSt9fw6VAyRW7bMqOzXox4jMLuudIYghJ6xsJmHaHuM0FSA
	cL5Mdt4d4kIP/EiMoT0Lle1n7aG6rnH0R+MsO0mEBOuA3toIsNxefFgLjEpwuczECe1z
	bAUTPA8TCETz86mmzKs+6PjZFyXK6JBxxjXVljdREgO8KMiX6gDfD/iwovHjb8PVAedr
	pSmyfTUaKBFQp64VRjKfqIa1a1lP8ViNYsxCyeZ8WfsUdnl0fAotF2y/P5jug6c9YQ0k
	bc7LhxrE4mvVYhmYxvqDaEoVVKTvwb8/491ey1peqlmZiLKgXqNmV9ouXDkT9YCNOKhW
	4OPw==
X-Gm-Message-State: AFeK/H1U80nc/oFk1RwU19xUcI+uRW7YQhAzTGX2oDnm0Sl63Ev/bN1Q/SPfsAMj8Brzgw==
X-Received: by 10.99.159.1 with SMTP id g1mr35659727pge.88.1490072586222;
	Mon, 20 Mar 2017 22:03:06 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id d1sm8523365pfa.5.2017.03.20.22.03.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 22:03:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 22:02:55 -0700
Message-Id: <20170321050255.4816-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH V2] libcomps: Fix/optimize building with clang
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
X-List-Received-Date: Tue, 21 Mar 2017 05:03:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Make-__comps_objmrtree_all-static-inline.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/libcomps/libcomps_git.bb     |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch

diff --git a/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch b/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
new file mode 100644
index 0000000000..88469fb331
--- /dev/null
+++ b/meta/recipes-devtools/libcomps/libcomps/0001-Make-__comps_objmrtree_all-static-inline.patch
@@ -0,0 +1,35 @@
+From 91a324f8771818b81017fdf4daaad0c8c4b6987c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 Mar 2017 11:38:54 -0700
+Subject: [PATCH] Make __comps_objmrtree_all() static inline
+
+This helps compilers to scope the symbol correctly
+and apply the inlining optimizations, clang e.g.
+emits the functions and calls in code which is
+suboptimal, therefore give a little help to compiler
+this function is not used anywhere else to have
+a global scope.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcomps/src/comps_objmradix.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcomps/src/comps_objmradix.c b/libcomps/src/comps_objmradix.c
+index 9be6648..55f7793 100644
+--- a/libcomps/src/comps_objmradix.c
++++ b/libcomps/src/comps_objmradix.c
+@@ -604,7 +604,7 @@ inline void comps_objmrtree_pair_destroy_v(void * pair) {
+     free(pair);
+ }
+ 
+-inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
++static inline COMPS_HSList* __comps_objmrtree_all(COMPS_ObjMRTree * rt, char keyvalpair) {
+     COMPS_HSList *to_process, *ret;
+     COMPS_HSListItem *hsit, *oldit;
+     size_t x;
+-- 
+2.12.0
+
diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb b/meta/recipes-devtools/libcomps/libcomps_git.bb
index 8ff13b26b6..db4481bc8c 100644
--- a/meta/recipes-devtools/libcomps/libcomps_git.bb
+++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "git://github.com/rpm-software-management/libcomps.git \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0002-Set-library-installation-path-correctly.patch \
+           file://0001-Make-__comps_objmrtree_all-static-inline.patch \
            "
 
 PV = "0.1.8+git${SRCPV}"
-- 
2.12.0


