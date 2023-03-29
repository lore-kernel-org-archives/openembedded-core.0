Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08CDFC6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 14:54:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.26878.1680101647283751631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 07:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dpQ6MYCp;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so18794905pjb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680101646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQuB+L9JpC3IBqnrTm6eC7ASUpCoSmopSUT07Yfi1mI=;
        b=dpQ6MYCpeR6LYKM7nXyN/yHrFvLhQacORVm3JaktEoFezjo6Z2940bQyoY9XuPfiZm
         AOWSbM/Z4JxuUXs6PAOW+Ch3a6+nE3GmNc4fzJJBSaSzUU4m/1j1g0eC+ZhBi4wLL/HV
         8B3nxYEspP6jfhSOcrRTYFqfeNAg8hTRfcdt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680101646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iQuB+L9JpC3IBqnrTm6eC7ASUpCoSmopSUT07Yfi1mI=;
        b=ASqtXnTXU/uRNoK1Ykbt0UD5t0fox/IJ4gL4vVObfp7NIgOnMPeMYFV3qxPnOWaGzx
         ppJFSOftbsfBXGg+x5WzpUwMO9fV3EC/jYpk85ATwLo48lAR+JSpOiUX+J8iUlAFAABq
         iyGi+k8zHsP/pC8abgduGoKIUx0zfjc7iOTuyRCIaPyETW/sVFb4EeGeAycBVe182Lb2
         APJwvfDzF33V7kMIOgsLdfGaMXUnh8/G45hRjoSYywoGZ5AsgQVCDTNQFNVwbrwJ4WQC
         AnhCzu8SSyQYF/9hnVTuXyRRGyrn7ITAVbvD+JIwU7poJkuHnv2WHe+Rdrgl/UYZKMo9
         KQ7A==
X-Gm-Message-State: AAQBX9d7SKI62a3VIZ/VAmcBoqHEAFBtpHil1CigLjjvdBSpmIsAQ7Eu
	IAHgKJxoOo8Mtg4uAQPpCQReB0yo52lHzU0r4/E=
X-Google-Smtp-Source: AKy350bPlTOBVn+bwM3u7KQo8VvFvSfu/0RSiGsg5hV1+tyX4jVUWJi4WnF0zKfStRT+KOEGTBfclg==
X-Received: by 2002:a17:902:f90e:b0:1a1:d949:a54a with SMTP id kw14-20020a170902f90e00b001a1d949a54amr15109646plb.58.1680101646249;
        Wed, 29 Mar 2023 07:54:06 -0700 (PDT)
Received: from localhost.localdomain ([49.34.107.117])
        by smtp.gmail.com with ESMTPSA id x21-20020a170902ea9500b0019b9a075f1fsm23193654plb.80.2023.03.29.07.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 07:54:05 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][langdale][PATCHv2] openssl: Security fix for CVE-2023-0464, CVE-2023-0465, CVE-2023-0466
Date: Wed, 29 Mar 2023 20:23:56 +0530
Message-Id: <20230329145356.147717-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 14:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179283

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status:
- CVE-2023-0464: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=959c59c7a0164117e7f8366466a32bb1f8d77ff1]
- CVE-2023-0465: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=1dd43e0709fece299b15208f36cc7c76209ba0bb]
- CVE-2023-0466: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=51e8a84ce742db0f6c70510d0159dad8f7825908]

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2023-0464.patch       | 225 ++++++++++++++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  56 +++++
 .../openssl/openssl/CVE-2023-0466.patch       |  50 ++++
 .../openssl/openssl_3.0.8.bb                  |   3 +
 4 files changed, 334 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
new file mode 100644
index 0000000000..3b94c48e8d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
@@ -0,0 +1,225 @@
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
+Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=959c59c7a0164117e7f8366466a32bb1f8d77ff1]
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
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
new file mode 100644
index 0000000000..57fd494464
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
@@ -0,0 +1,56 @@
+From 1dd43e0709fece299b15208f36cc7c76209ba0bb Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Tue, 7 Mar 2023 16:52:55 +0000
+Subject: [PATCH] Ensure that EXFLAG_INVALID_POLICY is checked even in leaf
+ certs
+
+Even though we check the leaf cert to confirm it is valid, we
+later ignored the invalid flag and did not notice that the leaf
+cert was bad.
+
+Fixes: CVE-2023-0465
+
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/20587)
+
+Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=1dd43e0709fece299b15208f36cc7c76209ba0bb]
+CVE: CVE-2023-0465
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ crypto/x509/x509_vfy.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/x509/x509_vfy.c b/crypto/x509/x509_vfy.c
+index 9384f1d..a0282c3 100644
+--- a/crypto/x509/x509_vfy.c
++++ b/crypto/x509/x509_vfy.c
+@@ -1654,15 +1654,23 @@ static int check_policy(X509_STORE_CTX *ctx)
+         goto memerr;
+     /* Invalid or inconsistent extensions */
+     if (ret == X509_PCY_TREE_INVALID) {
+-        int i;
++        int i, cbcalled = 0;
+ 
+         /* Locate certificates with bad extensions and notify callback. */
+-        for (i = 1; i < sk_X509_num(ctx->chain); i++) {
++        for (i = 0; i < sk_X509_num(ctx->chain); i++) {
+             X509 *x = sk_X509_value(ctx->chain, i);
+ 
++            if ((x->ex_flags & EXFLAG_INVALID_POLICY) != 0)
++                cbcalled = 1;
+             CB_FAIL_IF((x->ex_flags & EXFLAG_INVALID_POLICY) != 0,
+                        ctx, x, i, X509_V_ERR_INVALID_POLICY_EXTENSION);
+         }
++        if (!cbcalled) {
++            /* Should not be able to get here */
++            ERR_raise(ERR_LIB_X509, ERR_R_INTERNAL_ERROR);
++            return 0;
++        }
++        /* The callback ignored the error so we return success */
+         return 1;
+     }
+     if (ret == X509_PCY_TREE_FAILURE) {
+-- 
+2.35.7
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
new file mode 100644
index 0000000000..a16bfe42ca
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
@@ -0,0 +1,50 @@
+From 51e8a84ce742db0f6c70510d0159dad8f7825908 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Tue, 21 Mar 2023 16:15:47 +0100
+Subject: [PATCH] Fix documentation of X509_VERIFY_PARAM_add0_policy()
+
+The function was incorrectly documented as enabling policy checking.
+
+Fixes: CVE-2023-0466
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/20563)
+
+Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=51e8a84ce742db0f6c70510d0159dad8f7825908]
+CVE: CVE-2023-0466
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ doc/man3/X509_VERIFY_PARAM_set_flags.pod | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/doc/man3/X509_VERIFY_PARAM_set_flags.pod b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+index 75a1677..43c1900 100644
+--- a/doc/man3/X509_VERIFY_PARAM_set_flags.pod
++++ b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+@@ -98,8 +98,9 @@ B<trust>.
+ X509_VERIFY_PARAM_set_time() sets the verification time in B<param> to
+ B<t>. Normally the current time is used.
+ 
+-X509_VERIFY_PARAM_add0_policy() enables policy checking (it is disabled
+-by default) and adds B<policy> to the acceptable policy set.
++X509_VERIFY_PARAM_add0_policy() adds B<policy> to the acceptable policy set.
++Contrary to preexisting documentation of this function it does not enable
++policy checking.
+ 
+ X509_VERIFY_PARAM_set1_policies() enables policy checking (it is disabled
+ by default) and sets the acceptable policy set to B<policies>. Any existing
+@@ -400,6 +401,10 @@ The X509_VERIFY_PARAM_get_hostflags() function was added in OpenSSL 1.1.0i.
+ The X509_VERIFY_PARAM_get0_host(), X509_VERIFY_PARAM_get0_email(),
+ and X509_VERIFY_PARAM_get1_ip_asc() functions were added in OpenSSL 3.0.
+ 
++The function X509_VERIFY_PARAM_add0_policy() was historically documented as
++enabling policy checking however the implementation has never done this.
++The documentation was changed to align with the implementation.
++
+ =head1 COPYRIGHT
+ 
+ Copyright 2009-2023 The OpenSSL Project Authors. All Rights Reserved.
+-- 
+2.35.7
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
index 8771884dda..82f3e18dd7 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.8.bb
@@ -12,6 +12,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2023-0464.patch \
+           file://CVE-2023-0465.patch \
+           file://CVE-2023-0466.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.25.1


