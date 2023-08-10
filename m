Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7695DEB64DD
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 02:30:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9018.1691634630409304612
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 19:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Kx0hNzfA;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bc512526cso63026366b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 19:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691634628; x=1692239428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKeQJVRMkccG7zWPYvEdT06LK7t0nMm1DMCTYYoPI0g=;
        b=Kx0hNzfAWY3wYRVj0N29hP+zVJXXrh3Tx3IyoXHIMaBQRz+G5gy7FBW6hssXKWDKhD
         0/47tlAaqN1xmeFhnExpC32mFMG2RXeKYlFFx/Ko6AkYzAMLShIN12CUuOpAXMbYdnH1
         wZmpVSO9Rx4QXofvAlBn/PSxjOWW/ry++v1rhrexyD9ZeKE9M6SG9hCY/LRiNGd72sF4
         lMpAcWM2hzLLyllZjehrz/3YmwbnmOPTYOfJgpgKh5rqFqrK64iq7B1pil6l2C995stX
         1oMVuMLMmcxk/YPflT5fPknMYvlkw0cdwQcJsiNuWViE6YdE7v1bg/D/tH4lEr30dQ/L
         +YpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691634628; x=1692239428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKeQJVRMkccG7zWPYvEdT06LK7t0nMm1DMCTYYoPI0g=;
        b=d9yvsQZH2RYJeauP/2NBx0iuohDD24J7jLLv4Kako+VM4ls3CS8+mJVCiagrafYzCb
         FksEqxTMaRoN4QdVVlIQxu9F8AY2TNHAQL7xYac52KbvguuWpWb2dH/xyhrOb1OS+YPA
         EYTXn8TPCPdkDc5h+K+L1iXvmFWUSANPoSGN0iH1WyFDXwL1S4Uv884nsezOCdpBZizD
         M1HfI4xbUJ2/oWrBAag4dVn9zUlOUZf71A/lrFXz1nipK40FQH//Dy3UYkn1ywwmOS/L
         b3sNsZeqE3c+cfTNiI2cE7RlzkgJMCaFzzFcHfXs3f+kEjX4QhscfbjAOPZHu86cs/7a
         IS4Q==
X-Gm-Message-State: AOJu0YzJSg20WF9LXjitj3gzyPk7P5kxKPt5TqVTAV/hGv/E4Qr2dTNK
	vpE/8Z2EFPWXeU4nykNs9kKmZVFTSUBhcoIDymllHw==
X-Google-Smtp-Source: AGHT+IFtA24vC1Z8HtdnSsTciqXO4MedpqhvcL5mPppEXoQiyxi2LHEow5dC48peLopKCWvxSHnYBqAzU9E8k1NDj3w=
X-Received: by 2002:a17:907:75c9:b0:994:554b:7f27 with SMTP id
 jl9-20020a17090775c900b00994554b7f27mr738854ejc.2.1691634628289; Wed, 09 Aug
 2023 19:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230801222931.2942099-1-peter.marko@siemens.com>
In-Reply-To: <20230801222931.2942099-1-peter.marko@siemens.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 9 Aug 2023 16:30:17 -1000
Message-ID: <CAOSpxdb-Bf_7T_o-DrA_vbOF-Bnz9Zk5bCV3WKEOc95GqtChJA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] openssl: Upgrade 1.1.1t -> 1.1.1v
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 02:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185720

I'm getting a failure on the autobuilder for the qemumips64 machine:

DEBUG: Executing shell function do_compile
NOTE: make -j 16 -l 52
perl "-I." -Mconfigdata "../openssl-1.1.1v/util/dofile.pl" \
    "-oMakefile" ../openssl-1.1.1v/include/crypto/bn_conf.h.in >
include/crypto/bn_conf.h
perl "-I." -Mconfigdata "../openssl-1.1.1v/util/dofile.pl" \
    "-oMakefile" ../openssl-1.1.1v/include/openssl/opensslconf.h.in >
include/openssl/opensslconf.h
perl "-I." -Mconfigdata "../openssl-1.1.1v/util/dofile.pl" \
    "-oMakefile" ../openssl-1.1.1v/include/crypto/dso_conf.h.in >
include/crypto/dso_conf.h
make depend && make _all
make[1]: Entering directory
'TOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/build'
make[1]: Leaving directory
'TOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/build'
make[1]: Entering directory
'TOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/build'
mips64-poky-linux-gcc  -meb -mabi=3D64 -mhard-float -march=3Dmips64r2
-fstack-protector-strong  -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security
--sysroot=3DTOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/recipe-sy=
sroot
 -I. -Iinclude -I../openssl-1.1.1v -I../openssl-1.1.1v/include -fPIC
-pthread -mabi=3D64 -mips3 -Wa,--noexecstack -O2 -pipe -g
-feliminate-unused-debug-types
-fmacro-prefix-map=3DTOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0=
=3D/usr/src/debug/openssl/1.1.1v-r0

-fdebug-prefix-map=3DTOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0=
=3D/usr/src/debug/openssl/1.1.1v-r0

-fdebug-prefix-map=3DTOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/=
recipe-sysroot=3D

-fdebug-prefix-map=3DTOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/=
recipe-sysroot-native=3D
 -DOPENSSL_USE_NODELETE -DOPENSSL_PIC -DOPENSSL_BN_ASM_MONT -DSHA1_ASM
-DSHA256_ASM -DSHA512_ASM -DAES_ASM -DPOLY1305_ASM
-DOPENSSLDIR=3D"\"/usr/lib/ssl-1.1\""
-DENGINESDIR=3D"\"/usr/lib/engines-1.1\"" -DNDEBUG  -MMD -MF
apps/app_rand.d.tmp -MT apps/app_rand.o -c -o apps/app_rand.o
../openssl-1.1.1v/apps/app_rand.c
Assembler messages:
Error: -mips3 conflicts with the other architecture options, which
imply -mips64r2
cc1: error: '-mips3' conflicts with the other architecture options,
which specify a mips64r2 processor
make[1]: *** [Makefile:711: apps/app_rand.o] Error 1
make[1]: Leaving directory
'TOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/build'
make: *** [Makefile:178: all] Error 2
ERROR: oe_runmake failed
WARNING: exit code 1 from a shell command.
ERROR: Execution of
'TOPDIR/tmp/work/mips64r2-poky-linux/openssl/1.1.1v-r0/temp/run.do_compile.=
3017457'
failed with exit code 1

On Tue, Aug 1, 2023 at 12:30=E2=80=AFPM Peter Marko via lists.openembedded.=
org
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> https://www.openssl.org/news/openssl-1.1.1-notes.html
> Major changes between OpenSSL 1.1.1u and OpenSSL 1.1.1v [1 Aug 2023]
> * Fix excessive time spent checking DH q parameter value (CVE-2023-3817)
> * Fix DH_check() excessive time with over sized modulus (CVE-2023-3446)
> Major changes between OpenSSL 1.1.1t and OpenSSL 1.1.1u [30 May 2023]
> * Mitigate for very slow `OBJ_obj2txt()` performance with gigantic OBJECT=
 IDENTIFIER sub-identities. (CVE-2023-2650)
> * Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-2023-0466)
> * Fixed handling of invalid certificate policies in leaf certificates (CV=
E-2023-0465)
> * Limited the number of nodes created in a policy tree ([CVE-2023-0464])
>
> All CVEs for upgrade to 1.1.1u were already patched, so effectively
> this will apply patches for CVE-2023-3446 and CVE-2023-3817 plus
> several non-CVE fixes.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../openssl/openssl/CVE-2023-0464.patch       | 226 ------------------
>  .../openssl/openssl/CVE-2023-0465.patch       |  60 -----
>  .../openssl/openssl/CVE-2023-0466.patch       |  82 -------
>  .../openssl/openssl/CVE-2023-2650.patch       | 122 ----------
>  .../{openssl_1.1.1t.bb =3D> openssl_1.1.1v.bb}  |   6 +-
>  5 files changed, 1 insertion(+), 495 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-04=
64.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-04=
65.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-04=
66.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-26=
50.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1t.bb =3D> openssl=
_1.1.1v.bb} (96%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
> deleted file mode 100644
> index cce5bad9f0..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
> +++ /dev/null
> @@ -1,226 +0,0 @@
> -From 879f7080d7e141f415c79eaa3a8ac4a3dad0348b Mon Sep 17 00:00:00 2001
> -From: Pauli <pauli@openssl.org>
> -Date: Wed, 8 Mar 2023 15:28:20 +1100
> -Subject: [PATCH] x509: excessive resource use verifying policy constrain=
ts
> -
> -A security vulnerability has been identified in all supported versions
> -of OpenSSL related to the verification of X.509 certificate chains
> -that include policy constraints.  Attackers may be able to exploit this
> -vulnerability by creating a malicious certificate chain that triggers
> -exponential use of computational resources, leading to a denial-of-servi=
ce
> -(DoS) attack on affected systems.
> -
> -Fixes CVE-2023-0464
> -
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -Reviewed-by: Shane Lontis <shane.lontis@oracle.com>
> -(Merged from https://github.com/openssl/openssl/pull/20569)
> -
> -CVE: CVE-2023-0464
> -Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=3Dopenssl.g=
it;a=3Dpatch;h=3D879f7080d7e141f415c79eaa3a8ac4a3dad0348b]
> -Signed-off-by: Nikhil R <nikhil.r@kpit.com>
> -
> ----
> - crypto/x509v3/pcy_local.h |  8 +++++++-
> - crypto/x509v3/pcy_node.c  | 12 +++++++++---
> - crypto/x509v3/pcy_tree.c  | 37 +++++++++++++++++++++++++++----------
> - 3 files changed, 43 insertions(+), 14 deletions(-)
> -
> -diff --git a/crypto/x509v3/pcy_local.h b/crypto/x509v3/pcy_local.h
> -index 5daf78de45..344aa06765 100644
> ---- a/crypto/x509v3/pcy_local.h
> -+++ b/crypto/x509v3/pcy_local.h
> -@@ -111,6 +111,11 @@ struct X509_POLICY_LEVEL_st {
> - };
> -
> - struct X509_POLICY_TREE_st {
> -+    /* The number of nodes in the tree */
> -+    size_t node_count;
> -+    /* The maximum number of nodes in the tree */
> -+    size_t node_maximum;
> -+
> -     /* This is the tree 'level' data */
> -     X509_POLICY_LEVEL *levels;
> -     int nlevel;
> -@@ -159,7 +164,8 @@ X509_POLICY_NODE *tree_find_sk(STACK_OF(X509_POLICY_=
NODE) *sk,
> - X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
> -                                  X509_POLICY_DATA *data,
> -                                  X509_POLICY_NODE *parent,
> --                                 X509_POLICY_TREE *tree);
> -+                                 X509_POLICY_TREE *tree,
> -+                                 int extra_data);
> - void policy_node_free(X509_POLICY_NODE *node);
> - int policy_node_match(const X509_POLICY_LEVEL *lvl,
> -                       const X509_POLICY_NODE *node, const ASN1_OBJECT *=
oid);
> -diff --git a/crypto/x509v3/pcy_node.c b/crypto/x509v3/pcy_node.c
> -index e2d7b15322..d574fb9d66 100644
> ---- a/crypto/x509v3/pcy_node.c
> -+++ b/crypto/x509v3/pcy_node.c
> -@@ -59,10 +59,15 @@ X509_POLICY_NODE *level_find_node(const X509_POLICY_=
LEVEL *level,
> - X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *level,
> -                                  X509_POLICY_DATA *data,
> -                                  X509_POLICY_NODE *parent,
> --                                 X509_POLICY_TREE *tree)
> -+                                 X509_POLICY_TREE *tree,
> -+                                 int extra_data)
> - {
> -     X509_POLICY_NODE *node;
> -
> -+    /* Verify that the tree isn't too large.  This mitigates CVE-2023-0=
464 */
> -+    if (tree->node_maximum > 0 && tree->node_count >=3D tree->node_maxi=
mum)
> -+        return NULL;
> -+
> -     node =3D OPENSSL_zalloc(sizeof(*node));
> -     if (node =3D=3D NULL) {
> -         X509V3err(X509V3_F_LEVEL_ADD_NODE, ERR_R_MALLOC_FAILURE);
> -@@ -70,7 +75,7 @@ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *le=
vel,
> -     }
> -     node->data =3D data;
> -     node->parent =3D parent;
> --    if (level) {
> -+    if (level !=3D NULL) {
> -         if (OBJ_obj2nid(data->valid_policy) =3D=3D NID_any_policy) {
> -             if (level->anyPolicy)
> -                 goto node_error;
> -@@ -90,7 +95,7 @@ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *le=
vel,
> -         }
> -     }
> -
> --    if (tree) {
> -+    if (extra_data) {
> -         if (tree->extra_data =3D=3D NULL)
> -             tree->extra_data =3D sk_X509_POLICY_DATA_new_null();
> -         if (tree->extra_data =3D=3D NULL){
> -@@ -103,6 +108,7 @@ X509_POLICY_NODE *level_add_node(X509_POLICY_LEVEL *=
level,
> -         }
> -     }
> -
> -+    tree->node_count++;
> -     if (parent)
> -         parent->nchild++;
> -
> -diff --git a/crypto/x509v3/pcy_tree.c b/crypto/x509v3/pcy_tree.c
> -index 6e8322cbc5..6c7fd35405 100644
> ---- a/crypto/x509v3/pcy_tree.c
> -+++ b/crypto/x509v3/pcy_tree.c
> -@@ -13,6 +13,18 @@
> -
> - #include "pcy_local.h"
> -
> -+/*
> -+ * If the maximum number of nodes in the policy tree isn't defined, set=
 it to
> -+ * a generous default of 1000 nodes.
> -+ *
> -+ * Defining this to be zero means unlimited policy tree growth which op=
ens the
> -+ * door on CVE-2023-0464.
> -+ */
> -+
> -+#ifndef OPENSSL_POLICY_TREE_NODES_MAX
> -+# define OPENSSL_POLICY_TREE_NODES_MAX 1000
> -+#endif
> -+
> - /*
> -  * Enable this to print out the complete policy tree at various point d=
uring
> -  * evaluation.
> -@@ -168,6 +180,9 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK=
_OF(X509) *certs,
> -         return X509_PCY_TREE_INTERNAL;
> -     }
> -
> -+    /* Limit the growth of the tree to mitigate CVE-2023-0464 */
> -+    tree->node_maximum =3D OPENSSL_POLICY_TREE_NODES_MAX;
> -+
> -     /*
> -      * http://tools.ietf.org/html/rfc5280#section-6.1.2, figure 3.
> -      *
> -@@ -184,7 +199,7 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK=
_OF(X509) *certs,
> -     level =3D tree->levels;
> -     if ((data =3D policy_data_new(NULL, OBJ_nid2obj(NID_any_policy), 0)=
) =3D=3D NULL)
> -         goto bad_tree;
> --    if (level_add_node(level, data, NULL, tree) =3D=3D NULL) {
> -+    if (level_add_node(level, data, NULL, tree, 1) =3D=3D NULL) {
> -         policy_data_free(data);
> -         goto bad_tree;
> -     }
> -@@ -243,7 +258,8 @@ static int tree_init(X509_POLICY_TREE **ptree, STACK=
_OF(X509) *certs,
> -  * Return value: 1 on success, 0 otherwise
> -  */
> - static int tree_link_matching_nodes(X509_POLICY_LEVEL *curr,
> --                                    X509_POLICY_DATA *data)
> -+                                    X509_POLICY_DATA *data,
> -+                                    X509_POLICY_TREE *tree)
> - {
> -     X509_POLICY_LEVEL *last =3D curr - 1;
> -     int i, matched =3D 0;
> -@@ -253,13 +269,13 @@ static int tree_link_matching_nodes(X509_POLICY_LE=
VEL *curr,
> -         X509_POLICY_NODE *node =3D sk_X509_POLICY_NODE_value(last->node=
s, i);
> -
> -         if (policy_node_match(last, node, data->valid_policy)) {
> --            if (level_add_node(curr, data, node, NULL) =3D=3D NULL)
> -+            if (level_add_node(curr, data, node, tree, 0) =3D=3D NULL)
> -                 return 0;
> -             matched =3D 1;
> -         }
> -     }
> -     if (!matched && last->anyPolicy) {
> --        if (level_add_node(curr, data, last->anyPolicy, NULL) =3D=3D NU=
LL)
> -+        if (level_add_node(curr, data, last->anyPolicy, tree, 0) =3D=3D=
 NULL)
> -             return 0;
> -     }
> -     return 1;
> -@@ -272,7 +288,8 @@ static int tree_link_matching_nodes(X509_POLICY_LEVE=
L *curr,
> -  * Return value: 1 on success, 0 otherwise.
> -  */
> - static int tree_link_nodes(X509_POLICY_LEVEL *curr,
> --                           const X509_POLICY_CACHE *cache)
> -+                           const X509_POLICY_CACHE *cache,
> -+                           X509_POLICY_TREE *tree)
> - {
> -     int i;
> -
> -@@ -280,7 +297,7 @@ static int tree_link_nodes(X509_POLICY_LEVEL *curr,
> -         X509_POLICY_DATA *data =3D sk_X509_POLICY_DATA_value(cache->dat=
a, i);
> -
> -         /* Look for matching nodes in previous level */
> --        if (!tree_link_matching_nodes(curr, data))
> -+        if (!tree_link_matching_nodes(curr, data, tree))
> -             return 0;
> -     }
> -     return 1;
> -@@ -311,7 +328,7 @@ static int tree_add_unmatched(X509_POLICY_LEVEL *cur=
r,
> -     /* Curr may not have anyPolicy */
> -     data->qualifier_set =3D cache->anyPolicy->qualifier_set;
> -     data->flags |=3D POLICY_DATA_FLAG_SHARED_QUALIFIERS;
> --    if (level_add_node(curr, data, node, tree) =3D=3D NULL) {
> -+    if (level_add_node(curr, data, node, tree, 1) =3D=3D NULL) {
> -         policy_data_free(data);
> -         return 0;
> -     }
> -@@ -373,7 +390,7 @@ static int tree_link_any(X509_POLICY_LEVEL *curr,
> -     }
> -     /* Finally add link to anyPolicy */
> -     if (last->anyPolicy &&
> --        level_add_node(curr, cache->anyPolicy, last->anyPolicy, NULL) =
=3D=3D NULL)
> -+        level_add_node(curr, cache->anyPolicy, last->anyPolicy, tree, 0=
) =3D=3D NULL)
> -         return 0;
> -     return 1;
> - }
> -@@ -555,7 +572,7 @@ static int tree_calculate_user_set(X509_POLICY_TREE =
*tree,
> -             extra->qualifier_set =3D anyPolicy->data->qualifier_set;
> -             extra->flags =3D POLICY_DATA_FLAG_SHARED_QUALIFIERS
> -                 | POLICY_DATA_FLAG_EXTRA_NODE;
> --            node =3D level_add_node(NULL, extra, anyPolicy->parent, tre=
e);
> -+            node =3D level_add_node(NULL, extra, anyPolicy->parent, tre=
e, 1);
> -         }
> -         if (!tree->user_policies) {
> -             tree->user_policies =3D sk_X509_POLICY_NODE_new_null();
> -@@ -582,7 +599,7 @@ static int tree_evaluate(X509_POLICY_TREE *tree)
> -
> -     for (i =3D 1; i < tree->nlevel; i++, curr++) {
> -         cache =3D policy_cache_set(curr->cert);
> --        if (!tree_link_nodes(curr, cache))
> -+        if (!tree_link_nodes(curr, cache, tree))
> -             return X509_PCY_TREE_INTERNAL;
> -
> -         if (!(curr->flags & X509_V_FLAG_INHIBIT_ANY)
> ---
> -2.34.1
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
> deleted file mode 100644
> index be5068074e..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From b013765abfa80036dc779dd0e50602c57bb3bf95 Mon Sep 17 00:00:00 2001
> -From: Matt Caswell <matt@openssl.org>
> -Date: Tue, 7 Mar 2023 16:52:55 +0000
> -Subject: [PATCH] Ensure that EXFLAG_INVALID_POLICY is checked even in le=
af
> - certs
> -
> -Even though we check the leaf cert to confirm it is valid, we
> -later ignored the invalid flag and did not notice that the leaf
> -cert was bad.
> -
> -Fixes: CVE-2023-0465
> -
> -Reviewed-by: Hugo Landau <hlandau@openssl.org>
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/20588)
> -
> -CVE: CVE-2023-0465
> -Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=3Dopenssl.g=
it;a=3Dcommitdiff;h=3Db013765abfa80036dc779dd0e50602c57bb3bf95]
> -Comment: Refreshed first hunk
> -Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
> -
> ----
> - crypto/x509/x509_vfy.c | 11 +++++++++--
> - 1 file changed, 9 insertions(+), 2 deletions(-)
> -
> -diff --git a/crypto/x509/x509_vfy.c b/crypto/x509/x509_vfy.c
> -index 925fbb5412..1dfe4f9f31 100644
> ---- a/crypto/x509/x509_vfy.c
> -+++ b/crypto/x509/x509_vfy.c
> -@@ -1649,18 +1649,25 @@
> -     }
> -     /* Invalid or inconsistent extensions */
> -     if (ret =3D=3D X509_PCY_TREE_INVALID) {
> --        int i;
> -+        int i, cbcalled =3D 0;
> -
> -         /* Locate certificates with bad extensions and notify callback.=
 */
> --        for (i =3D 1; i < sk_X509_num(ctx->chain); i++) {
> -+        for (i =3D 0; i < sk_X509_num(ctx->chain); i++) {
> -             X509 *x =3D sk_X509_value(ctx->chain, i);
> -
> -             if (!(x->ex_flags & EXFLAG_INVALID_POLICY))
> -                 continue;
> -+            cbcalled =3D 1;
> -             if (!verify_cb_cert(ctx, x, i,
> -                                 X509_V_ERR_INVALID_POLICY_EXTENSION))
> -                 return 0;
> -         }
> -+        if (!cbcalled) {
> -+            /* Should not be able to get here */
> -+            X509err(X509_F_CHECK_POLICY, ERR_R_INTERNAL_ERROR);
> -+            return 0;
> -+        }
> -+        /* The callback ignored the error so we return success */
> -         return 1;
> -     }
> -     if (ret =3D=3D X509_PCY_TREE_FAILURE) {
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
> deleted file mode 100644
> index f042aa5da1..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From 0d16b7e99aafc0b4a6d729eec65a411a7e025f0a Mon Sep 17 00:00:00 2001
> -From: Tomas Mraz <tomas@openssl.org>
> -Date: Tue, 21 Mar 2023 16:15:47 +0100
> -Subject: [PATCH] Fix documentation of X509_VERIFY_PARAM_add0_policy()
> -
> -The function was incorrectly documented as enabling policy checking.
> -
> -Fixes: CVE-2023-0466
> -
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -Reviewed-by: Paul Dale <pauli@openssl.org>
> -(Merged from https://github.com/openssl/openssl/pull/20564)
> -
> -CVE: CVE-2023-0466
> -Upstream-Status: Backport [https://git.openssl.org/gitweb/?p=3Dopenssl.g=
it;a=3Dcommitdiff;h=3D0d16b7e99aafc0b4a6d729eec65a411a7e025f0a]
> -Comment: Refreshed first hunk from CHANGE and NEWS
> -Signed-off-by: Omkar Patil <omkar.patil@kpit.com>
> -
> ----
> - CHANGES                                  | 5 +++++
> - NEWS                                     | 1 +
> - doc/man3/X509_VERIFY_PARAM_set_flags.pod | 9 +++++++--
> - 3 files changed, 13 insertions(+), 2 deletions(-)
> -
> -diff --git a/CHANGES b/CHANGES
> -index efccf7838e..b19f1429bb 100644
> ---- a/CHANGES
> -+++ b/CHANGES
> -@@ -9,6 +9,11 @@
> -
> -  Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
> -
> -+  *) Corrected documentation of X509_VERIFY_PARAM_add0_policy() to ment=
ion
> -+     that it does not enable policy checking. Thanks to
> -+     David Benjamin for discovering this issue. (CVE-2023-0466)
> -+     [Tomas Mraz]
> -+
> -   *) Fixed X.400 address type confusion in X.509 GeneralName.
> -
> -      There is a type confusion vulnerability relating to X.400 address =
processing
> -diff --git a/NEWS b/NEWS
> -index 36a9bb6890..62615693fa 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -7,6 +7,7 @@
> -
> -   Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
> -
> -+      o Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-202=
3-0466)
> -       o Fixed X.400 address type confusion in X.509 GeneralName (CVE-20=
23-0286)
> -       o Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
> -       o Fixed Double free after calling PEM_read_bio_ex (CVE-2022-4450)
> -diff --git a/doc/man3/X509_VERIFY_PARAM_set_flags.pod b/doc/man3/X509_VE=
RIFY_PARAM_set_flags.pod
> -index f6f304bf7b..aa292f9336 100644
> ---- a/doc/man3/X509_VERIFY_PARAM_set_flags.pod
> -+++ b/doc/man3/X509_VERIFY_PARAM_set_flags.pod
> -@@ -92,8 +92,9 @@ B<trust>.
> - X509_VERIFY_PARAM_set_time() sets the verification time in B<param> to
> - B<t>. Normally the current time is used.
> -
> --X509_VERIFY_PARAM_add0_policy() enables policy checking (it is disabled
> --by default) and adds B<policy> to the acceptable policy set.
> -+X509_VERIFY_PARAM_add0_policy() adds B<policy> to the acceptable policy=
 set.
> -+Contrary to preexisting documentation of this function it does not enab=
le
> -+policy checking.
> -
> - X509_VERIFY_PARAM_set1_policies() enables policy checking (it is disabl=
ed
> - by default) and sets the acceptable policy set to B<policies>. Any exis=
ting
> -@@ -377,6 +378,10 @@ and has no effect.
> -
> - The X509_VERIFY_PARAM_get_hostflags() function was added in OpenSSL 1.1=
.0i.
> -
> -+The function X509_VERIFY_PARAM_add0_policy() was historically documente=
d as
> -+enabling policy checking however the implementation has never done this=
.
> -+The documentation was changed to align with the implementation.
> -+
> - =3Dhead1 COPYRIGHT
> -
> - Copyright 2009-2020 The OpenSSL Project Authors. All Rights Reserved.
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
> deleted file mode 100644
> index ef344dda7f..0000000000
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
> +++ /dev/null
> @@ -1,122 +0,0 @@
> -From 9e209944b35cf82368071f160a744b6178f9b098 Mon Sep 17 00:00:00 2001
> -From: Richard Levitte <levitte@openssl.org>
> -Date: Fri, 12 May 2023 10:00:13 +0200
> -Subject: [PATCH] Restrict the size of OBJECT IDENTIFIERs that OBJ_obj2tx=
t will
> - translate
> -
> -OBJ_obj2txt() would translate any size OBJECT IDENTIFIER to canonical
> -numeric text form.  For gigantic sub-identifiers, this would take a very
> -long time, the time complexity being O(n^2) where n is the size of that
> -sub-identifier.
> -
> -To mitigate this, a restriction on the size that OBJ_obj2txt() will
> -translate to canonical numeric text form is added, based on RFC 2578
> -(STD 58), which says this:
> -
> -> 3.5. OBJECT IDENTIFIER values
> ->
> -> An OBJECT IDENTIFIER value is an ordered list of non-negative numbers.
> -> For the SMIv2, each number in the list is referred to as a sub-identif=
ier,
> -> there are at most 128 sub-identifiers in a value, and each sub-identif=
ier
> -> has a maximum value of 2^32-1 (4294967295 decimal).
> -
> -Fixes otc/security#96
> -Fixes CVE-2023-2650
> -
> -Reviewed-by: Matt Caswell <matt@openssl.org>
> -Reviewed-by: Tomas Mraz <tomas@openssl.org>
> -
> -Upstream-Status: Backport [https://github.com/openssl/openssl/commit/9e2=
09944b35cf82368071f160a744b6178f9b098]
> -CVE: CVE-2023-2650
> -Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ----
> - CHANGES                  | 28 +++++++++++++++++++++++++++-
> - NEWS                     |  2 ++
> - crypto/objects/obj_dat.c | 19 +++++++++++++++++++
> - 3 files changed, 48 insertions(+), 1 deletion(-)
> -
> -diff --git a/CHANGES b/CHANGES
> -index 1eaaf4e..f2cf38f 100644
> ---- a/CHANGES
> -+++ b/CHANGES
> -@@ -7,7 +7,33 @@
> -  https://github.com/openssl/openssl/commits/ and pick the appropriate
> -  release branch.
> -
> -- Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
> -+ Changes between 1.1.1t and 1.1.1u [xx XXX xxxx]
> -+
> -+  *) Mitigate for the time it takes for `OBJ_obj2txt` to translate giga=
ntic
> -+     OBJECT IDENTIFIER sub-identifiers to canonical numeric text form.
> -+
> -+     OBJ_obj2txt() would translate any size OBJECT IDENTIFIER to canoni=
cal
> -+     numeric text form.  For gigantic sub-identifiers, this would take =
a very
> -+     long time, the time complexity being O(n^2) where n is the size of=
 that
> -+     sub-identifier.  (CVE-2023-2650)
> -+
> -+     To mitigitate this, `OBJ_obj2txt()` will only translate an OBJECT
> -+     IDENTIFIER to canonical numeric text form if the size of that OBJE=
CT
> -+     IDENTIFIER is 586 bytes or less, and fail otherwise.
> -+
> -+     The basis for this restriction is RFC 2578 (STD 58), section 3.5. =
OBJECT
> -+     IDENTIFIER values, which stipulates that OBJECT IDENTIFIERS may ha=
ve at
> -+     most 128 sub-identifiers, and that the maximum value that each sub=
-
> -+     identifier may have is 2^32-1 (4294967295 decimal).
> -+
> -+     For each byte of every sub-identifier, only the 7 lower bits are p=
art of
> -+     the value, so the maximum amount of bytes that an OBJECT IDENTIFIE=
R with
> -+     these restrictions may occupy is 32 * 128 / 7, which is approximat=
ely 586
> -+     bytes.
> -+
> -+     Ref: https://datatracker.ietf.org/doc/html/rfc2578#section-3.5
> -+
> -+Changes between 1.1.1s and 1.1.1t [7 Feb 2023]
> -
> -   *) Corrected documentation of X509_VERIFY_PARAM_add0_policy() to ment=
ion
> -      that it does not enable policy checking. Thanks to
> -diff --git a/NEWS b/NEWS
> -index a86220a..41922c4 100644
> ---- a/NEWS
> -+++ b/NEWS
> -@@ -7,6 +7,8 @@
> -
> -   Major changes between OpenSSL 1.1.1s and OpenSSL 1.1.1t [7 Feb 2023]
> -
> -+      o Mitigate for very slow `OBJ_obj2txt()` performance with giganti=
c
> -+        OBJECT IDENTIFIER sub-identities.  (CVE-2023-2650)
> -       o Fixed documentation of X509_VERIFY_PARAM_add0_policy() (CVE-202=
3-0466)
> -       o Fixed X.400 address type confusion in X.509 GeneralName (CVE-20=
23-0286)
> -       o Fixed Use-after-free following BIO_new_NDEF (CVE-2023-0215)
> -diff --git a/crypto/objects/obj_dat.c b/crypto/objects/obj_dat.c
> -index 7e8de72..d699915 100644
> ---- a/crypto/objects/obj_dat.c
> -+++ b/crypto/objects/obj_dat.c
> -@@ -428,6 +428,25 @@ int OBJ_obj2txt(char *buf, int buf_len, const ASN1_=
OBJECT *a, int no_name)
> -     first =3D 1;
> -     bl =3D NULL;
> -
> -+    /*
> -+     * RFC 2578 (STD 58) says this about OBJECT IDENTIFIERs:
> -+     *
> -+     * > 3.5. OBJECT IDENTIFIER values
> -+     * >
> -+     * > An OBJECT IDENTIFIER value is an ordered list of non-negative
> -+     * > numbers. For the SMIv2, each number in the list is referred to=
 as a
> -+     * > sub-identifier, there are at most 128 sub-identifiers in a val=
ue,
> -+     * > and each sub-identifier has a maximum value of 2^32-1 (4294967=
295
> -+     * > decimal).
> -+     *
> -+     * So a legitimate OID according to this RFC is at most (32 * 128 /=
 7),
> -+     * i.e. 586 bytes long.
> -+     *
> -+     * Ref: https://datatracker.ietf.org/doc/html/rfc2578#section-3.5
> -+     */
> -+    if (len > 586)
> -+        goto err;
> -+
> -     while (len > 0) {
> -         l =3D 0;
> -         use_bn =3D 0;
> ---
> -2.25.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb b/meta/r=
ecipes-connectivity/openssl/openssl_1.1.1v.bb
> similarity index 96%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
> index eea8ef64af..d3bf76863a 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1t.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1v.bb
> @@ -19,17 +19,13 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${=
PV}.tar.gz \
>             file://reproducible.patch \
>             file://reproducibility.patch \
>             file://0001-Configure-add-2-missing-key-sorts.patch \
> -           file://CVE-2023-0464.patch \
> -           file://CVE-2023-0465.patch \
> -           file://CVE-2023-0466.patch \
> -           file://CVE-2023-2650.patch \
>             "
>
>  SRC_URI_append_class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D "8dee9b24bdb1dcbf0c3d1e9b02fb8f6bf22165e807f45ade=
b7c9677536859d3b"
> +SRC_URI[sha256sum] =3D "d6697e2871e77238460402e9362d47d18382b15ef9f246ab=
a6c7bd780d38a6b0"
>
>  inherit lib_package multilib_header multilib_script ptest
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185364): https://lists.openembedded.org/g/openembedde=
d-core/message/185364
> Mute This Topic: https://lists.openembedded.org/mt/100494506/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

