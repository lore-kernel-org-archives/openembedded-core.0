Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30198C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 04:58:36 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.47642.1680238713645795362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 21:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Oh8xd8DY;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso7594668pjc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680238712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5qkOUgutzztVZxPdeW5300kWAwFEyM584P2XXBrdS4=;
        b=Oh8xd8DYTgMKuptQBf/MiOQzmyf8BgY4stghtFdiLVOuobXfqVQb6sFuZgO+saQcgi
         RAjwnPj/m/S/WqPgQ/PaGbhjQeVPYL7gLyOaQJFELOY7nvRbTHypwqES4TVGeKDB9Nsx
         A30oUYmhTv7PTx40YocgqXZZClkz0mAby8CqRqos4RhMlobTjpm++ub/5lINQRSp+AKU
         ir2Q2tWNHjD3UAMI4c4ugF89Y05dsXNoMY6R55OH3ID49c+BTmiZ0CbOa0ZGKLJ9TAKT
         fZ6nbwJlIrMeJDyzlY/xU+xAjsIUSk2PIW/b04/vtg5UppTGBBaE5g4CdoKPQV0NGeiM
         +n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680238712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y5qkOUgutzztVZxPdeW5300kWAwFEyM584P2XXBrdS4=;
        b=VA9Xk8G5TgahjyDg4PpEycUQt7zAiolwavw4ZmTG+niXMaYWSp1bi5hHqmLy9/HZBL
         O/iFIunRQoJkC5KCQd4mA7T+MGpNLUhrulFkwpXArKQiXcqv10P2itcXwHS9NgoSG1E2
         ggpJevIZlXy2gV19WH8Q+nmBUd5eVBqa4wGS5nwhJdMym3UrzzvhVcgnEK8/YINFxf8F
         GQCqMTmdnULt/ulwJ/uLHPUvLqPm8z16scUSWQYbGpLsvZVAe4HOTxzweRhU+RJZYQEy
         PE3MJTRL2sG7RgsZnBLthykUjBdcKNEO1SGQVv+6y23r4q5SVcA/C0F1QTvbGJZiv2SG
         NUpg==
X-Gm-Message-State: AO0yUKUtXkBmnwL6l1f+6923TbR1EgzM/S0v4OT3n1fKH30grnrTcMSn
	L4fvXo+qNep5zYjR1ForvwUselFyv0h/JZk=
X-Google-Smtp-Source: AK7set/Mx5KFD4l6kk5u5YFq3jWwE/IMDxSjz9TCUD+TEG3D0l+64f/2uDdzL+kWHzp8u3V+4oO+6g==
X-Received: by 2002:a05:6a20:bf2a:b0:d8:d720:7fa with SMTP id gc42-20020a056a20bf2a00b000d8d72007famr20928364pzb.0.1680238712416;
        Thu, 30 Mar 2023 21:58:32 -0700 (PDT)
Received: from localhost.localdomain ([103.171.194.54])
        by smtp.gmail.com with ESMTPSA id 125-20020a630383000000b0050927cb606asm678033pgd.13.2023.03.30.21.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 21:58:31 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org,
	nikhilr5@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhil.r@kpit.com>,
	Nikhil R <nikhilar2410@gmail.com>
Subject: [OE-core][dunfell][PATCH] openssl: Fix CVE-2023-0464
Date: Fri, 31 Mar 2023 10:28:23 +0530
Message-Id: <20230331045823.3794995-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 04:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179383

From: Nikhil R <nikhil.r@kpit.com>

Fix CVE-2023-0464 for openssl

A security vulnerability has been identified in all supported versions
of OpenSSL related to the verification of X.509 certificate chains
that include policy constraints.  Attackers may be able to exploit
this vulnerability by creating a malicious certificate chain that
triggers exponential use of computational resources, leading
to a denial-of-service(DoS) attack on affected systems.

Link: https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=879f7080d7e141f415c79eaa3a8ac4a3dad0348b

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---
 .../openssl/openssl/CVE-2023-0464.patch       | 226 ++++++++++++++++++
 .../openssl/openssl_1.1.1t.bb                 |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
new file mode 100644
index 0000000000..cce5bad9f0
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
@@ -0,0 +1,226 @@
+From 879f7080d7e141f415c79eaa3a8ac4a3dad0348b Mon Sep 17 00:00:00 2001
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
+(Merged from https://github.com/openssl/openssl/pull/20569)
+
+CVE: CVE-2023-0464
+Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=openssl.git;a=patch;h=879f7080d7e141f415c79eaa3a8ac4a3dad0348b]
+Signed-off-by: Nikhil R <nikhil.r@kpit.com>
+
+---
+ crypto/x509v3/pcy_local.h |  8 +++++++-
+ crypto/x509v3/pcy_node.c  | 12 +++++++++---
+ crypto/x509v3/pcy_tree.c  | 37 +++++++++++++++++++++++++++----------
+ 3 files changed, 43 insertions(+), 14 deletions(-)
+
+diff --git a/crypto/x509v3/pcy_local.h b/crypto/x509v3/pcy_local.h
+index 5daf78de45..344aa06765 100644
+--- a/crypto/x509v3/pcy_local.h
++++ b/crypto/x509v3/pcy_local.h
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
+@@ -159,7 +164,8 @@ X509_POLICY_NODE *tree_find_sk(STACK_OF(X509_POLICY_NODE) *sk,
+ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
+                                  X509_POLICY_DATA *data,
+                                  X509_POLICY_NODE *parent,
+-                                 X509_POLICY_TREE *tree);
++                                 X509_POLICY_TREE *tree,
++                                 int extra_data);
+ void policy_node_free(X509_POLICY_NODE *node);
+ int policy_node_match(const X509_POLICY_LEVEL *lvl,
+                       const X509_POLICY_NODE *node, const ASN1_OBJECT *oid);
+diff --git a/crypto/x509v3/pcy_node.c b/crypto/x509v3/pcy_node.c
+index e2d7b15322..d574fb9d66 100644
+--- a/crypto/x509v3/pcy_node.c
++++ b/crypto/x509v3/pcy_node.c
+@@ -59,10 +59,15 @@ X509_POLICY_NODE *level_find_node(const X509_POLICY_LEVEL *level,
+ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
+                                  X509_POLICY_DATA *data,
+                                  X509_POLICY_NODE *parent,
+-                                 X509_POLICY_TREE *tree)
++                                 X509_POLICY_TREE *tree,
++                                 int extra_data)
+ {
+     X509_POLICY_NODE *node;
+ 
++    /* Verify that the tree isn't too large.  This mitigates CVE-2023-0464 */
++    if (tree->node_maximum > 0 && tree->node_count >= tree->node_maximum)
++        return NULL;
++
+     node = OPENSSL_zalloc(sizeof(*node));
+     if (node == NULL) {
+         X509V3err(X509V3_F_LEVEL_ADD_NODE, ERR_R_MALLOC_FAILURE);
+@@ -70,7 +75,7 @@ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
+     }
+     node->data = data;
+     node->parent = parent;
+-    if (level) {
++    if (level != NULL) {
+         if (OBJ_obj2nid(data->valid_policy) == NID_any_policy) {
+             if (level->anyPolicy)
+                 goto node_error;
+@@ -90,7 +95,7 @@ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
+         }
+     }
+ 
+-    if (tree) {
++    if (extra_data) {
+         if (tree->extra_data == NULL)
+             tree->extra_data = sk_X509_POLICY_DATA_new_null();
+         if (tree->extra_data == NULL){
+@@ -103,6 +108,7 @@ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
+         }
+     }
+ 
++    tree->node_count++;
+     if (parent)
+         parent->nchild++;
+ 
+diff --git a/crypto/x509v3/pcy_tree.c b/crypto/x509v3/pcy_tree.c
+index 6e8322cbc5..6c7fd35405 100644
+--- a/crypto/x509v3/pcy_tree.c
++++ b/crypto/x509v3/pcy_tree.c
+@@ -13,6 +13,18 @@
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
++
++#ifndef OPENSSL_POLICY_TREE_NODES_MAX
++# define OPENSSL_POLICY_TREE_NODES_MAX 1000
++#endif
++
+ /*
+  * Enable this to print out the complete policy tree at various point during
+  * evaluation.
+@@ -168,6 +180,9 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
+         return X509_PCY_TREE_INTERNAL;
+     }
+ 
++    /* Limit the growth of the tree to mitigate CVE-2023-0464 */
++    tree->node_maximum = OPENSSL_POLICY_TREE_NODES_MAX;
++
+     /*
+      * http://tools.ietf.org/html/rfc5280#section-6.1.2, figure 3.
+      *
+@@ -184,7 +199,7 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
+     level = tree->levels;
+     if ((data = policy_data_new(NULL, OBJ_nid2obj(NID_any_policy), 0)) == NULL)
+         goto bad_tree;
+-    if (level_add_node(level, data, NULL, tree) == NULL) {
++    if (level_add_node(level, data, NULL, tree, 1) == NULL) {
+         policy_data_free(data);
+         goto bad_tree;
+     }
+@@ -243,7 +258,8 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK_OF(X509) *certs,
+  * Return value: 1 on success, 0 otherwise
+  */
+ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
+-                                    X509_POLICY_DATA *data)
++                                    X509_POLICY_DATA *data,
++                                    X509_POLICY_TREE *tree)
+ {
+     X509_POLICY_LEVEL *last = curr - 1;
+     int i, matched = 0;
+@@ -253,13 +269,13 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
+         X509_POLICY_NODE *node = sk_X509_POLICY_NODE_value(last->nodes, i);
+ 
+         if (policy_node_match(last, node, data->valid_policy)) {
+-            if (level_add_node(curr, data, node, NULL) == NULL)
++            if (level_add_node(curr, data, node, tree, 0) == NULL)
+                 return 0;
+             matched = 1;
+         }
+     }
+     if (!matched && last->anyPolicy) {
+-        if (level_add_node(curr, data, last->anyPolicy, NULL) == NULL)
++        if (level_add_node(curr, data, last->anyPolicy, tree, 0) == NULL)
+             return 0;
+     }
+     return 1;
+@@ -272,7 +288,8 @@ static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
+  * Return value: 1 on success, 0 otherwise.
+  */
+ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
+-                           const X509_POLICY_CACHE *cache)
++                           const X509_POLICY_CACHE *cache,
++                           X509_POLICY_TREE *tree)
+ {
+     int i;
+ 
+@@ -280,7 +297,7 @@ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
+         X509_POLICY_DATA *data = sk_X509_POLICY_DATA_value(cache->data, i);
+ 
+         /* Look for matching nodes in previous level */
+-        if (!tree_link_matching_nodes(curr, data))
++        if (!tree_link_matching_nodes(curr, data, tree))
+             return 0;
+     }
+     return 1;
+@@ -311,7 +328,7 @@ static int tree_add_unmatched(X509_POLICY_LEVEL *curr,
+     /* Curr may not have anyPolicy */
+     data->qualifier_set = cache->anyPolicy->qualifier_set;
+     data->flags |= POLICY_DATA_FLAG_SHARED_QUALIFIERS;
+-    if (level_add_node(curr, data, node, tree) == NULL) {
++    if (level_add_node(curr, data, node, tree, 1) == NULL) {
+         policy_data_free(data);
+         return 0;
+     }
+@@ -373,7 +390,7 @@ static int tree_link_any(X509_POLICY_LEVEL *curr,
+     }
+     /* Finally add link to anyPolicy */
+     if (last->anyPolicy &&
+-        level_add_node(curr, cache->anyPolicy, last->anyPolicy, NULL) == NULL)
++        level_add_node(curr, cache->anyPolicy, last->anyPolicy, tree, 0) == NULL)
+         return 0;
+     return 1;
+ }
+@@ -555,7 +572,7 @@ static int tree_calculate_user_set(X509_POLICY_TREE *tree,
+             extra->qualifier_set = anyPolicy->data->qualifier_set;
+             extra->flags = POLICY_DATA_FLAG_SHARED_QUALIFIERS
+                 | POLICY_DATA_FLAG_EXTRA_NODE;
+-            node = level_add_node(NULL, extra, anyPolicy->parent, tree);
++            node = level_add_node(NULL, extra, anyPolicy->parent, tree, 1);
+         }
+         if (!tree->user_policies) {
+             tree->user_policies = sk_X509_POLICY_NODE_new_null();
+@@ -582,7 +599,7 @@ static int tree_evaluate(X509_POLICY_TREE *tree)
+ 
+     for (i = 1; i < tree->nlevel; i++, curr++) {
+         cache = policy_cache_set(curr->cert);
+-        if (!tree_link_nodes(curr, cache))
++        if (!tree_link_nodes(curr, cache, tree))
+             return X509_PCY_TREE_INTERNAL;
+ 
+         if (!(curr->flags & X509_V_FLAG_INHIBIT_ANY)
+-- 
+2.34.1
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index a1956ad8c2..94cb458508 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
+           file://CVE-2023-0464.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


