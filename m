Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A2BC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 10:02:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.97582.1679652150902508090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 03:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b/txa7D8;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id iw3so1361245plb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1679652150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4wD9w+uw41W7RrYSR4XAHQSnvHbxz8kYEbc79X4870=;
        b=b/txa7D8nqUOXjmrRCjQCgln26suMuZECZAsFTaBG79Ey0VqsacUWjYn6NErJQnv9C
         Sx8rV+sIXgnYLTMdC2Ck8gw4ivltQGuRWB/1wj5zTlSHXvTJDlohzJC8sXTsfTUJORQN
         AGBbyhfQzfjpX72s2AOc0eCMhsbXkxne9ukXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679652150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4wD9w+uw41W7RrYSR4XAHQSnvHbxz8kYEbc79X4870=;
        b=TRmBXcOBfY1eIvOAJ4iVrND+K5/U0BcQyxHXGBXgP2uL+mhqBuO9TOJQYl1RJOLdSq
         qWAy0BGLPRfnRfCxI/ZXUBMkc6PcHVeKlfXe3ZoaE9NKwQ/MpAfRX5z4OQadndB5DFsy
         k9Gb8zsyKglzex+SE4mTM5/a8hkZUSd5rhNItWTX4JBDNpb5omP27uUtTFHVTK4tyw05
         MnaZEgwz/IO7XUUlg36mhHP6hWYwjEQ3j37Z8H51dp13bZTJ5exU1x7kpu3099Ne5W51
         jAwZU/jBNFECXG9yBBWOJHR0IZCGMqtG1OL8DfwTcbsA5uEngfz/ZIDBN9h21KaaoZ24
         rubA==
X-Gm-Message-State: AAQBX9eIY1q4VCkuv9MI5Aq0pV7WPLc4n8dRFLSLCsM3ovXF0YccTOFb
	F2gxfpMn+1r6zH7EFxdJrWtItsU8YEuNvq82Aig=
X-Google-Smtp-Source: AKy350ZzZidLn19YorveDUQFw3HEmaj6OtZu+PMoNzy0DdO4hAwsUdXtSQOzlSwRlnXvibzZ8SOjzg==
X-Received: by 2002:a17:90a:35b:b0:23b:4614:6f84 with SMTP id 27-20020a17090a035b00b0023b46146f84mr2265261pjf.28.1679652149864;
        Fri, 24 Mar 2023 03:02:29 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([45.119.9.190])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c20600b0019b089bc8d7sm13903399pll.78.2023.03.24.03.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 03:02:29 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][langdale][PATCH] OpenSSL: Security fix for CVE-2023-0464
Date: Fri, 24 Mar 2023 15:32:23 +0530
Message-Id: <20230324100223.59441-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 10:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179029

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=959c59c7a0164117e7f8366466a32bb1f8d77ff1]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2023-0464.patch       | 226 ++++++++++++++++++
 .../openssl/openssl_3.0.8.bb                  |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
new file mode 100644
index 0000000000..69c7e2af67
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
@@ -0,0 +1,226 @@
+From 959c59c7a0164117e7f8366466a32bb1f8d77ff1 Mon Sep 17 00:00:00 2001
+From: Pauli <pauli@openssl.org>
+Date: Wed, 8 Mar 2023 15:28:20 +1100
+Subject: [PATCH] x509: excessive resource use verifying policy constraints
+
+A security vulnerability has been identified in all supported versions
+of OpenSSL related to the verification of X.509 certificate chains
+that include policy constraints.  Attackers may be able to exploit this
+vulnerability by creating a malicious certificate chain that triggers
+exponential use of computational resources, leading to a denial-of-service
+(DoS) attack on affected systems.
+
+Fixes CVE-2023-0464
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
+(Merged from https://github.com/openssl/openssl/pull/20568)
+
+Upstream-Status: Backport from
+[https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=959c59c7a0164117e7f8366466a32bb1f8d77ff1]
+CVE: CVE-2023-0464
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ crypto/x509/pcy_local.h |  8 +++++++-
+ crypto/x509/pcy_node.c  | 12 +++++++++---
+ crypto/x509/pcy_tree.c  | 36 ++++++++++++++++++++++++++----------
+ 3 files changed, 42 insertions(+), 14 deletions(-)
+
+diff --git a/crypto/x509/pcy_local.h b/crypto/x509/pcy_local.h
+index 18b53cc..cba107c 100644
+--- a/crypto/x509/pcy_local.h
++++ b/crypto/x509/pcy_local.h
+@@ -111,6 +111,11 @@ struct X509_POLICY_LEVEL_st {
+ };
+ 
+ struct X509_POLICY_TREE_st {
++    /* The number of nodes in the tree */
++    size_t node_count;
++    /* The maximum number of nodes in the tree */
++    size_t node_maximum;
++
+     /* This is the tree 'level' data */
+     X509_POLICY_LEVEL *levels;
+     int nlevel;
+@@ -157,7 +162,8 @@ X509_POLICY_NODE *ossl_policy_tree_find_sk(STACK_OF(X509_POLICY_NODE) *sk,
+ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
+                                              X509_POLICY_DATA *data,
+                                              X509_POLICY_NODE *parent,
+-                                             X509_POLICY_TREE *tree);
++                                             X509_POLICY_TREE *tree,
++                                             int extra_data);
+ void ossl_policy_node_free(X509_POLICY_NODE *node);
+ int ossl_policy_node_match(const X509_POLICY_LEVEL *lvl,
+                            const X509_POLICY_NODE *node, const ASN1_OBJECT *oid);
+diff --git a/crypto/x509/pcy_node.c b/crypto/x509/pcy_node.c
+index 9d9a7ea..450f95a 100644
+--- a/crypto/x509/pcy_node.c
++++ b/crypto/x509/pcy_node.c
+@@ -59,10 +59,15 @@ X509_POLICY_NODE *ossl_policy_level_find_node(const X509_POLICY_LEVEL *level,
+ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
+                                              X509_POLICY_DATA *data,
+                                              X509_POLICY_NODE *parent,
+-                                             X509_POLICY_TREE *tree)
++                                             X509_POLICY_TREE *tree,
++                                             int extra_data)
+ {
+     X509_POLICY_NODE *node;
+ 
++    /* Verify that the tree isn't too large.  This mitigates CVE-2023-0464 */
++    if (tree->node_maximum > 0 && tree->node_count >= tree->node_maximum)
++        return NULL;
++
+     node = OPENSSL_zalloc(sizeof(*node));
+     if (node == NULL) {
+         ERR_raise(ERR_LIB_X509V3, ERR_R_MALLOC_FAILURE);
+@@ -70,7 +75,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
+     }
+     node->data = data;
+     node->parent = parent;
+-    if (level) {
++    if (level != NULL) {
+         if (OBJ_obj2nid(data->valid_policy) == NID_any_policy) {
+             if (level->anyPolicy)
+                 goto node_error;
+@@ -90,7 +95,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
+         }
+     }
+ 
+-    if (tree) {
++    if (extra_data) {
+         if (tree->extra_data == NULL)
+             tree->extra_data = sk_X509_POLICY_DATA_new_null();
+         if (tree->extra_data == NULL){
+@@ -103,6 +108,7 @@ X509_POLICY_NODE *ossl_policy_level_add_node(X509_POLICY_LEVEL *level,
+         }
+     }
+ 
++    tree->node_count++;
+     if (parent)
+         parent->nchild++;
+ 
+diff --git a/crypto/x509/pcy_tree.c b/crypto/x509/pcy_tree.c
+index fa45da5..f953a05 100644
+--- a/crypto/x509/pcy_tree.c
++++ b/crypto/x509/pcy_tree.c
+@@ -14,6 +14,17 @@
+ 
+ #include "pcy_local.h"
+ 
++/*
++ * If the maximum number of nodes in the policy tree isn't defined, set it to
++ * a generous default of 1000 nodes.
++ *
++ * Defining this to be zero means unlimited policy tree growth which opens the
++ * door on CVE-2023-0464.
++ */
++#ifndef OPENSSL_POLICY_TREE_NODES_MAX
++# define OPENSSL_POLICY_TREE_NODES_MAX 1000
++#endif
++
+ static void expected_print(BIO *channel,
+                            X509_POLICY_LEVEL *lev, X509_POLICY_NODE *node,
+                            int indent)
+@@ -163,6 +174,9 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
+         return X509_PCY_TREE_INTERNAL;
+     }
+ 
++    /* Limit the growth of the tree to mitigate CVE-2023-0464 */
++    tree->node_maximum = OPENSSL_POLICY_TREE_NODES_MAX;
++
+     /*
+      * http://tools.ietf.org/html/rfc5280#section-6.1.2, figure 3.
+      *
+@@ -180,7 +194,7 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
+     if ((data = ossl_policy_data_new(NULL,
+                                      OBJ_nid2obj(NID_any_policy), 0)) == NULL)
+         goto bad_tree;
+-    if (ossl_policy_level_add_node(level, data, NULL, tree) == NULL) {
++    if (ossl_policy_level_add_node(level, data, NULL, tree, 1) == NULL) {
+         ossl_policy_data_free(data);
+         goto bad_tree;
+     }
+@@ -239,7 +253,8 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
+  * Return value: 1 on success, 0 otherwise
+  */
+ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
+-                                    X509_POLICY_DATA *data)
++                                    X509_POLICY_DATA *data,
++                                    X509_POLICY_TREE *tree)
+ {
+     X509_POLICY_LEVEL *last = curr - 1;
+     int i, matched = 0;
+@@ -249,13 +264,13 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
+         X509_POLICY_NODE *node = sk_X509_POLICY_NODE_value(last->nodes, i);
+ 
+         if (ossl_policy_node_match(last, node, data->valid_policy)) {
+-            if (ossl_policy_level_add_node(curr, data, node, NULL) == NULL)
++            if (ossl_policy_level_add_node(curr, data, node, tree, 0) == NULL)
+                 return 0;
+             matched = 1;
+         }
+     }
+     if (!matched && last->anyPolicy) {
+-        if (ossl_policy_level_add_node(curr, data, last->anyPolicy, NULL) == NULL)
++        if (ossl_policy_level_add_node(curr, data, last->anyPolicy, tree, 0) == NULL)
+             return 0;
+     }
+     return 1;
+@@ -268,7 +283,8 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
+  * Return value: 1 on success, 0 otherwise.
+  */
+ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
+-                           const X509_POLICY_CACHE *cache)
++                           const X509_POLICY_CACHE *cache,
++                           X509_POLICY_TREE *tree)
+ {
+     int i;
+ 
+@@ -276,7 +292,7 @@ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
+         X509_POLICY_DATA *data = sk_X509_POLICY_DATA_value(cache->data, i);
+ 
+         /* Look for matching nodes in previous level */
+-        if (!tree_link_matching_nodes(curr, data))
++        if (!tree_link_matching_nodes(curr, data, tree))
+             return 0;
+     }
+     return 1;
+@@ -307,7 +323,7 @@ static int tree_add_unmatched(X509_POLICY_LEVEL *curr,
+     /* Curr may not have anyPolicy */
+     data->qualifier_set = cache->anyPolicy->qualifier_set;
+     data->flags |= POLICY_DATA_FLAG_SHARED_QUALIFIERS;
+-    if (ossl_policy_level_add_node(curr, data, node, tree) == NULL) {
++    if (ossl_policy_level_add_node(curr, data, node, tree, 1) == NULL) {
+         ossl_policy_data_free(data);
+         return 0;
+     }
+@@ -370,7 +386,7 @@ static int tree_link_any(X509_POLICY_LEVEL *curr,
+     /* Finally add link to anyPolicy */
+     if (last->anyPolicy &&
+             ossl_policy_level_add_node(curr, cache->anyPolicy,
+-                                       last->anyPolicy, NULL) == NULL)
++                                       last->anyPolicy, tree, 0) == NULL)
+         return 0;
+     return 1;
+ }
+@@ -553,7 +569,7 @@ static int tree_calculate_user_set(X509_POLICY_TREE *tree,
+             extra->flags = POLICY_DATA_FLAG_SHARED_QUALIFIERS
+                 | POLICY_DATA_FLAG_EXTRA_NODE;
+             node = ossl_policy_level_add_node(NULL, extra, anyPolicy->parent,
+-                                              tree);
++                                              tree, 1);
+         }
+         if (!tree->user_policies) {
+             tree->user_policies = sk_X509_POLICY_NODE_new_null();
+@@ -580,7 +596,7 @@ static int tree_evaluate(X509_POLICY_TREE *tree)
+ 
+     for (i = 1; i < tree->nlevel; i++, curr++) {
+         cache = ossl_policy_cache_set(curr->cert);
+-        if (!tree_link_nodes(curr, cache))
++        if (!tree_link_nodes(curr, cache, tree))
+             return X509_PCY_TREE_INTERNAL;
+ 
+         if (!(curr->flags & X509_V_FLAG_INHIBIT_ANY)
+-- 
+2.35.7
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
index 8771884dda..3369c2d729 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2023-0464.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


