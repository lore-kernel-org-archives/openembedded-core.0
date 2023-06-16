Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7A6EB64D7
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:38 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.212.1686926253073899975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xuDmYXJU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b51414b080so5577175ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926252; x=1689518252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZgdypnYxVlzPu4nImMhx3qPwN2Q/TgM5hGIuPWuU6Q=;
        b=xuDmYXJUMnPRErh/ZtBuIXhXuqW8ZwlHqOwm+hulJHIYWfvlfokpQ+Hk6UFWO5lyVH
         yxOxT0ab3sutfDWI4cnbbjtmR50BO7Tq+ujRVJO0v8pY/PnyaQ7IzPmZIQksuP+MldxR
         Dp+8X4JqsN23+fvBPJZI1K0rj1HYqVVSjKzs760tZst6MrwlexJMGOuL4cRU9/VH3zgZ
         ZXFCRyXyX85E8kbd/zLIglhEmrlqQBQe2K/smTgaT7H+Zh4m+JFO9wBfeSv9GVbn0XYM
         cLasfgcf8Ug5oGUtd52GtCn0FbFh1RMnRwQCknYQVZH5L4wx4kGPfna9GBNu/ApDafMi
         ygBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926252; x=1689518252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZgdypnYxVlzPu4nImMhx3qPwN2Q/TgM5hGIuPWuU6Q=;
        b=TU6mHi0mo5t5o/+Sft5bF1ZpLrV7kF4C6paMy4UROsBkXhJozt5LAc0dK2xWVHSUKD
         gZXe0pl3X2WEPJETfHpJopQ9AygUIURSxOvuJDynyWfjt0q0ljSApVOtJQ6rr1TwSrlA
         S8Lg+MiXcdMm4CCLSXGq/Zx5m8FroJCH1QnG4Tj2NB+4S9g/oZ8pDbz1t+wYIDlBAEhZ
         lRKSmqiakOUrDLSwNEIzRn6YWgdJT4NQXc8FBu296spjNjnaNFjkEaGoZEO6U76WUJcM
         qtefp3LOtngfuSvVbkrG52iEw+EwT3cZl49wTXlpsjcOh5lsurmAXprDmXFDGKEe0Fz1
         xRDg==
X-Gm-Message-State: AC+VfDzaoLBTiD7xgGdfQta8d1q4Ah5CLUxhYdTVK19FgcEgljKd00eA
	S6hiuzzCrJiQbKP3GCbBRZQXh0d0yq/HKNUKFZY=
X-Google-Smtp-Source: ACHHUZ6o+JrksUDx7OqistCff03FgLDZOoM560eU0aqGzzvaci+4eDX6cLRuZFT5NQVG4Hdm698b/w==
X-Received: by 2002:a17:902:bb10:b0:1b2:665:d251 with SMTP id im16-20020a170902bb1000b001b20665d251mr1897647plb.47.1686926251857;
        Fri, 16 Jun 2023 07:37:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/24] openssl: upgrade 3.1.0 -> 3.1.1
Date: Fri, 16 Jun 2023 04:36:57 -1000
Message-Id: <0b4cc6aa840aa52c3843c5292f15c028d0037bba.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183027

From: Tim Orling <ticotimo@gmail.com>

* Drop CVE-2023-0464.patch (merged upstream).
* Refresh 0001-Configure-do-not-tweak-mips-cflags.patch

https://github.com/openssl/openssl/blob/openssl-3.1.1/NEWS.md

Major changes between OpenSSL 3.1.0 and OpenSSL 3.1.1 [30 May 2023]

* Mitigate for very slow OBJ_obj2txt() performance with gigantic OBJECT IDENTIFIER sub-identities. (CVE-2023-2650)
* Fixed buffer overread in AES-XTS decryption on ARM 64 bit platforms (CVE-2023-1255)
* Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-2023-0466)
* Fixed handling of invalid certificate policies in leaf certificates (CVE-2023-0465)
* Limited the number of nodes created in a policy tree (CVE-2023-0464)

Security Advisory:
https://www.openssl.org/news/secadv/20230530.txt

CVE: CVE-2023-2650
CVE: CVE-2023-1255
CVE: CVE-2023-0466
CVE: CVE-2023-0465
CVE: CVE-2023-0464

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 26ce9a5fd31c27812ce8784a398b600cc0e9aa80)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-Configure-do-not-tweak-mips-cflags.patch |  19 +-
 .../openssl/openssl/CVE-2023-0464.patch       | 226 ------------------
 .../{openssl_3.1.0.bb => openssl_3.1.1.bb}    |   3 +-
 3 files changed, 12 insertions(+), 236 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.0.bb => openssl_3.1.1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 0b7abc3a11..502a7aaf32 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -1,6 +1,6 @@
-From 326909baf81a638d51fa8be1d8227518784f5cc4 Mon Sep 17 00:00:00 2001
+From 0377f0d5b5c1079e3b9a80881f4dcc891cbe9f9a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 14 Sep 2021 12:18:25 +0200
+Date: Tue, 30 May 2023 09:11:27 -0700
 Subject: [PATCH] Configure: do not tweak mips cflags
 
 This conflicts with mips machine definitons from yocto,
@@ -9,20 +9,23 @@ e.g.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Refreshed for openssl-3.1.1
+Signed-off-by: Tim Orling <tim.orling@konsulko.com>
 ---
  Configure | 10 ----------
  1 file changed, 10 deletions(-)
 
-Index: openssl-3.0.4/Configure
-===================================================================
---- openssl-3.0.4.orig/Configure
-+++ openssl-3.0.4/Configure
-@@ -1423,16 +1423,6 @@ if ($target =~ /^mingw/ && `$config{CC}
+diff --git a/Configure b/Configure
+index 4569952..adf019b 100755
+--- a/Configure
++++ b/Configure
+@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
 -if ($target =~ /linux.*-mips/ && !$disabled{asm}
--        && !grep { $_ !~ /-m(ips|arch=)/ } (@{$config{CFLAGS}})) {
+-        && !grep { $_ =~ /-m(ips|arch=)/ } (@{$config{CFLAGS}})) {
 -        # minimally required architecture flags for assembly modules
 -        my $value;
 -        $value = '-mips2' if ($target =~ /mips32/);
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
deleted file mode 100644
index 33b0bb6c79..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
+++ /dev/null
@@ -1,226 +0,0 @@
-From 2017771e2db3e2b96f89bbe8766c3209f6a99545 Mon Sep 17 00:00:00 2001
-From: Pauli <pauli@openssl.org>
-Date: Wed, 8 Mar 2023 15:28:20 +1100
-Subject: [PATCH] x509: excessive resource use verifying policy constraints
-
-A security vulnerability has been identified in all supported versions
-of OpenSSL related to the verification of X.509 certificate chains
-that include policy constraints.  Attackers may be able to exploit this
-vulnerability by creating a malicious certificate chain that triggers
-exponential use of computational resources, leading to a denial-of-service
-(DoS) attack on affected systems.
-
-Fixes CVE-2023-0464
-
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
-(Merged from https://github.com/openssl/openssl/pull/20570)
-
-Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=2017771e2db3e2b96f89bbe8766c3209f6a99545]
-CVE: CVE-2023-0464
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
-
----
- crypto/x509/pcy_local.h |  8 +++++++-
- crypto/x509/pcy_node.c  | 12 +++++++++---
- crypto/x509/pcy_tree.c  | 36 ++++++++++++++++++++++++++----------
- 3 files changed, 42 insertions(+), 14 deletions(-)
-
-diff --git a/crypto/x509/pcy_local.h b/crypto/x509/pcy_local.h
-index 18b53cc..cba107c 100644
---- a/crypto/x509/pcy_local.h
-+++ b/crypto/x509/pcy_local.h
-@@ -111,6 +111,11 @@ struct X509_POLICY_LEVEL_st {
- };
- 
- struct X509_POLICY_TREE_st {
-+    /* The number of nodes in the tree */
-+    size_t node_count;
-+    /* The maximum number of nodes in the tree */
-+    size_t node_maximum;
-+
-     /* This is the tree 'level' data */
-     X509_POLICY_LEVEL *levels;
-     int nlevel;
-@@ -157,7 +162,8 @@ X509_POLICY_NODE *ossl_policy_tree_find_sk(STACK_OF(X509_POLICY_NODE) *sk,
- X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
-                                              X509_POLICY_DATA *data,
-                                              X509_POLICY_NODE *parent,
--                                             X509_POLICY_TREE *tree);
-+                                             X509_POLICY_TREE *tree,
-+                                             int extra_data);
- void ossl_policy_node_free(X509_POLICY_NODE *node);
- int ossl_policy_node_match(const X509_POLICY_LEVEL *lvl,
-                            const X509_POLICY_NODE *node, const ASN1_OBJECT *oid);
-diff --git a/crypto/x509/pcy_node.c b/crypto/x509/pcy_node.c
-index 9d9a7ea..450f95a 100644
---- a/crypto/x509/pcy_node.c
-+++ b/crypto/x509/pcy_node.c
-@@ -59,10 +59,15 @@ X509_POLICY_NODE *ossl_policy_level_find_node(const X509_POLICY_LEVEL *level,
- X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
-                                              X509_POLICY_DATA *data,
-                                              X509_POLICY_NODE *parent,
--                                             X509_POLICY_TREE *tree)
-+                                             X509_POLICY_TREE *tree,
-+                                             int extra_data)
- {
-     X509_POLICY_NODE *node;
- 
-+    /* Verify that the tree isn't too large.  This mitigates CVE-2023-0464 */
-+    if (tree->node_maximum > 0 && tree->node_count >= tree->node_maximum)
-+        return NULL;
-+
-     node = OPENSSL_zalloc(sizeof(*node));
-     if (node == NULL) {
-         ERR_raise(ERR_LIB_X509V3, ERR_R_MALLOC_FAILURE);
-@@ -70,7 +75,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
-     }
-     node->data = data;
-     node->parent = parent;
--    if (level) {
-+    if (level != NULL) {
-         if (OBJ_obj2nid(data->valid_policy) == NID_any_policy) {
-             if (level->anyPolicy)
-                 goto node_error;
-@@ -90,7 +95,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
-         }
-     }
- 
--    if (tree) {
-+    if (extra_data) {
-         if (tree->extra_data == NULL)
-             tree->extra_data = sk_X509_POLICY_DATA_new_null();
-         if (tree->extra_data == NULL){
-@@ -103,6 +108,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
-         }
-     }
- 
-+    tree->node_count++;
-     if (parent)
-         parent->nchild++;
- 
-diff --git a/crypto/x509/pcy_tree.c b/crypto/x509/pcy_tree.c
-index fa45da5..f953a05 100644
---- a/crypto/x509/pcy_tree.c
-+++ b/crypto/x509/pcy_tree.c
-@@ -14,6 +14,17 @@
- 
- #include "pcy_local.h"
- 
-+/*
-+ * If the maximum number of nodes in the policy tree isn't defined, set it to
-+ * a generous default of 1000 nodes.
-+ *
-+ * Defining this to be zero means unlimited policy tree growth which opens the
-+ * door on CVE-2023-0464.
-+ */
-+#ifndef OPENSSL_POLICY_TREE_NODES_MAX
-+# define OPENSSL_POLICY_TREE_NODES_MAX 1000
-+#endif
-+
- static void expected_print(BIO *channel,
-                            X509_POLICY_LEVEL *lev, X509_POLICY_NODE *node,
-                            int indent)
-@@ -163,6 +174,9 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
-         return X509_PCY_TREE_INTERNAL;
-     }
- 
-+    /* Limit the growth of the tree to mitigate CVE-2023-0464 */
-+    tree->node_maximum = OPENSSL_POLICY_TREE_NODES_MAX;
-+
-     /*
-      * http://tools.ietf.org/html/rfc5280#section-6.1.2, figure 3.
-      *
-@@ -180,7 +194,7 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
-     if ((data = ossl_policy_data_new(NULL,
-                                      OBJ_nid2obj(NID_any_policy), 0)) == NULL)
-         goto bad_tree;
--    if (ossl_policy_level_add_node(level, data, NULL, tree) == NULL) {
-+    if (ossl_policy_level_add_node(level, data, NULL, tree, 1) == NULL) {
-         ossl_policy_data_free(data);
-         goto bad_tree;
-     }
-@@ -239,7 +253,8 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
-  * Return value: 1 on success, 0 otherwise
-  */
- static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
--                                    X509_POLICY_DATA *data)
-+                                    X509_POLICY_DATA *data,
-+                                    X509_POLICY_TREE *tree)
- {
-     X509_POLICY_LEVEL *last = curr - 1;
-     int i, matched = 0;
-@@ -249,13 +264,13 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
-         X509_POLICY_NODE *node = sk_X509_POLICY_NODE_value(last->nodes, i);
- 
-         if (ossl_policy_node_match(last, node, data->valid_policy)) {
--            if (ossl_policy_level_add_node(curr, data, node, NULL) == NULL)
-+            if (ossl_policy_level_add_node(curr, data, node, tree, 0) == NULL)
-                 return 0;
-             matched = 1;
-         }
-     }
-     if (!matched && last->anyPolicy) {
--        if (ossl_policy_level_add_node(curr, data, last->anyPolicy, NULL) == NULL)
-+        if (ossl_policy_level_add_node(curr, data, last->anyPolicy, tree, 0) == NULL)
-             return 0;
-     }
-     return 1;
-@@ -268,7 +283,8 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
-  * Return value: 1 on success, 0 otherwise.
-  */
- static int tree_link_nodes(X509_POLICY_LEVEL *curr,
--                           const X509_POLICY_CACHE *cache)
-+                           const X509_POLICY_CACHE *cache,
-+                           X509_POLICY_TREE *tree)
- {
-     int i;
- 
-@@ -276,7 +292,7 @@ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
-         X509_POLICY_DATA *data = sk_X509_POLICY_DATA_value(cache->data, i);
- 
-         /* Look for matching nodes in previous level */
--        if (!tree_link_matching_nodes(curr, data))
-+        if (!tree_link_matching_nodes(curr, data, tree))
-             return 0;
-     }
-     return 1;
-@@ -307,7 +323,7 @@ static int tree_add_unmatched(X509_POLICY_LEVEL *curr,
-     /* Curr may not have anyPolicy */
-     data->qualifier_set = cache->anyPolicy->qualifier_set;
-     data->flags |= POLICY_DATA_FLAG_SHARED_QUALIFIERS;
--    if (ossl_policy_level_add_node(curr, data, node, tree) == NULL) {
-+    if (ossl_policy_level_add_node(curr, data, node, tree, 1) == NULL) {
-         ossl_policy_data_free(data);
-         return 0;
-     }
-@@ -370,7 +386,7 @@ static int tree_link_any(X509_POLICY_LEVEL *curr,
-     /* Finally add link to anyPolicy */
-     if (last->anyPolicy &&
-             ossl_policy_level_add_node(curr, cache->anyPolicy,
--                                       last->anyPolicy, NULL) == NULL)
-+                                       last->anyPolicy, tree, 0) == NULL)
-         return 0;
-     return 1;
- }
-@@ -553,7 +569,7 @@ static int tree_calculate_user_set(X509_POLICY_TREE *tree,
-             extra->flags = POLICY_DATA_FLAG_SHARED_QUALIFIERS
-                 | POLICY_DATA_FLAG_EXTRA_NODE;
-             node = ossl_policy_level_add_node(NULL, extra, anyPolicy->parent,
--                                              tree);
-+                                              tree, 1);
-         }
-         if (!tree->user_policies) {
-             tree->user_policies = sk_X509_POLICY_NODE_new_null();
-@@ -580,7 +596,7 @@ static int tree_evaluate(X509_POLICY_TREE *tree)
- 
-     for (i = 1; i < tree->nlevel; i++, curr++) {
-         cache = ossl_policy_cache_set(curr->cert);
--        if (!tree_link_nodes(curr, cache))
-+        if (!tree_link_nodes(curr, cache, tree))
-             return X509_PCY_TREE_INTERNAL;
- 
-         if (!(curr->flags & X509_V_FLAG_INHIBIT_ANY)
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.0.bb b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.1.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.1.bb
index b319c66044..dca6f18e74 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
@@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://fix_random_labels.patch \
-           file://CVE-2023-0464.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "aaa925ad9828745c4cad9d9efeb273deca820f2cdcf2c3ac7d7c1212b7c497b4"
+SRC_URI[sha256sum] = "b3aa61334233b852b63ddb048df181177c2c659eb9d4376008118f9c08d07674"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


