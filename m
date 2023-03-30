Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7068AC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 15:34:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.28821.1680190488306024229
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 08:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=U/dENr0y;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id l7so17570232pjg.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 08:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1680190487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gjwjjhjE6BbnbN8aKiAKOLczX5msvHfDPRuW3xxECI=;
        b=U/dENr0yzbxe0PjNIBkKhtkN+Lb1Y6BXsSdl18IuOw9htfRZnprnpS+Z/yg5aeU620
         AtPjeAUNHvIZ0Cwy2NtucgexQ8lIDQVsNOfC4z4rytWTf0Vwnh73m21VQuCq8Rw01Mpy
         syZd/advE4gZJvM/dHNZVA6nPQJILEcKL3DzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680190487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gjwjjhjE6BbnbN8aKiAKOLczX5msvHfDPRuW3xxECI=;
        b=Qn0A6FJysHMGoJfNzeDEswLVGz342PqFavZ65YgdqcAyHS7C87WKjRERw7BEkDgoOW
         JWDYNUFTv5zd6BzkPkvFdb9PpEx3iYkqDnuEbziWbti/m6n0sq+nNj4MxlYwktGulUlk
         MowvcsMJt7iuMQqNhUKMN5L06940RZvn76zRNSi64vjGhnpoi63G+sNQoBhdMXVvtKax
         2x9ry75zBDoP7xrISeBWBs1Wk8a3rFxqsuJumLl4rUByR1vtv3X93lM8AFRdQsx+yKGW
         kfPW7fbuv/4h+dkMmMotm39FP+sZ/xe+8NpxxkuaC4zTOQ2XGGmUjWxJJ7540y7WsBgQ
         KJLg==
X-Gm-Message-State: AO0yUKXbFOMBl6vGBR9wY4Ne1dzVDqRxclrcmxK5kXEoG6lp4SZfa5LI
	u2tnxws8JsH5w54YdCJuySlRQBrmzo7CpT7lklM=
X-Google-Smtp-Source: AK7set8QZkxJLcXoSQFYzb/UFLBQPEW5oN6iPNyVXJVi0XglL2VoFJtX3UqtU8jRrhvQN7saFbLvng==
X-Received: by 2002:a05:6a20:6714:b0:da:897b:ae40 with SMTP id q20-20020a056a20671400b000da897bae40mr22039054pzh.37.1680190486914;
        Thu, 30 Mar 2023 08:34:46 -0700 (PDT)
Received: from localhost.localdomain ([49.34.187.146])
        by smtp.gmail.com with ESMTPSA id n23-20020aa78a57000000b005809d382016sm25428pfa.74.2023.03.30.08.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 08:34:46 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] openssl: Security fix for CVE-2023-0464, CVE-2023-0465, CVE-2023-0466
Date: Thu, 30 Mar 2023 21:04:39 +0530
Message-Id: <20230330153439.111910-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 15:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179335

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status:
- CVE-2023-0464: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=879f7080d7e141f415c79eaa3a8ac4a3dad0348b]
- CVE-2023-0465: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95]
- CVE-2023-0466: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a]

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../openssl/openssl/CVE-2023-0464.patch       | 226 ++++++++++++++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  58 +++++
 .../openssl/openssl/CVE-2023-0466.patch       |  50 ++++
 .../openssl/openssl_1.1.1t.bb                 |   3 +
 4 files changed, 337 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
new file mode 100644
index 0000000000..04dbb40a39
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
+Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=879f7080d7e141f415c79eaa3a8ac4a3dad0348b]
+CVE: CVE-2023-0464
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ crypto/x509v3/pcy_local.h |  8 +++++++-
+ crypto/x509v3/pcy_node.c  | 12 +++++++++---
+ crypto/x509v3/pcy_tree.c  | 37 +++++++++++++++++++++++++++----------
+ 3 files changed, 43 insertions(+), 14 deletions(-)
+
+diff --git a/crypto/x509v3/pcy_local.h b/crypto/x509v3/pcy_local.h
+index 5daf78d..344aa06 100644
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
+index e2d7b15..d574fb9 100644
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
+index 6e8322c..6c7fd35 100644
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
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
new file mode 100644
index 0000000000..78b73a663d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
@@ -0,0 +1,58 @@
+From b013765abfa80036dc779dd0e50602c57bb3bf95 Mon Sep 17 00:00:00 2001
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
+(Merged from https://github.com/openssl/openssl/pull/20588)
+
+Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=b013765abfa80036dc779dd0e50602c57bb3bf95]
+CVE: CVE-2023-0465
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ crypto/x509/x509_vfy.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/x509/x509_vfy.c b/crypto/x509/x509_vfy.c
+index 925fbb5..1dfe4f9 100644
+--- a/crypto/x509/x509_vfy.c
++++ b/crypto/x509/x509_vfy.c
+@@ -1649,18 +1649,25 @@ static int check_policy(X509_STORE_CTX *ctx)
+     }
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
+             if (!(x->ex_flags & EXFLAG_INVALID_POLICY))
+                 continue;
++            cbcalled = 1;
+             if (!verify_cb_cert(ctx, x, i,
+                                 X509_V_ERR_INVALID_POLICY_EXTENSION))
+                 return 0;
+         }
++        if (!cbcalled) {
++            /* Should not be able to get here */
++            X509err(X509_F_CHECK_POLICY, ERR_R_INTERNAL_ERROR);
++            return 0;
++        }
++        /* The callback ignored the error so we return success */
+         return 1;
+     }
+     if (ret == X509_PCY_TREE_FAILURE) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
new file mode 100644
index 0000000000..19ef9a6fd7
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
@@ -0,0 +1,50 @@
+From 0d16b7e99aafc0b4a6d729eec65a411a7e025f0a Mon Sep 17 00:00:00 2001
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
+(Merged from https://github.com/openssl/openssl/pull/20564)
+
+Upstream-Status: Backport from [https://git.openssl.org/gitweb/?p=openssl.git;a=commitdiff;h=0d16b7e99aafc0b4a6d729eec65a411a7e025f0a]
+CVE: CVE-2023-0466
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ doc/man3/X509_VERIFY_PARAM_set_flags.pod | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/doc/man3/X509_VERIFY_PARAM_set_flags.pod b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+index f6f304b..aa292f9 100644
+--- a/doc/man3/X509_VERIFY_PARAM_set_flags.pod
++++ b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
+@@ -92,8 +92,9 @@ B<trust>.
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
+@@ -377,6 +378,10 @@ and has no effect.
+ 
+ The X509_VERIFY_PARAM_get_hostflags() function was added in OpenSSL 1.1.0i.
+ 
++The function X509_VERIFY_PARAM_add0_policy() was historically documented as
++enabling policy checking however the implementation has never done this.
++The documentation was changed to align with the implementation.
++
+ =head1 COPYRIGHT
+ 
+ Copyright 2009-2020 The OpenSSL Project Authors. All Rights Reserved.
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
index a1956ad8c2..46875b525c 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
@@ -18,6 +18,9 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://afalg.patch \
            file://reproducible.patch \
            file://reproducibility.patch \
+           file://CVE-2023-0464.patch \
+           file://CVE-2023-0465.patch \
+           file://CVE-2023-0466.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.25.1


