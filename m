Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98483EE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 13:32:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11076.1692624743138784470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 06:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 860F9143D;
	Mon, 21 Aug 2023 06:33:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 344B93F740;
	Mon, 21 Aug 2023 06:32:22 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/2] procps: backport fix for CVE-2023-4016
Date: Mon, 21 Aug 2023 14:32:19 +0100
Message-Id: <20230821133219.213978-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821133219.213978-1-ross.burton@arm.com>
References: <20230821133219.213978-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 13:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186442

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../procps/procps/CVE-2023-4016.patch         | 73 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.3.bb  |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.pat=
ch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016.patch b/me=
ta/recipes-extended/procps/procps/CVE-2023-4016.patch
new file mode 100644
index 00000000000..202fea91f1d
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2023-4016.patch
@@ -0,0 +1,73 @@
+From 2c933ecba3bb1d3041a5a7a53a7b4078a6003413 Mon Sep 17 00:00:00 2001
+From: Craig Small <csmall@dropbear.xyz>
+Date: Thu, 10 Aug 2023 21:18:38 +1000
+Subject: [PATCH] ps: Fix possible buffer overflow in -C option
+
+ps allocates memory using malloc(length of arg * len of struct).
+In certain strange circumstances, the arg length could be very large
+and the multiplecation will overflow, allocating a small amount of
+memory.
+
+Subsequent strncpy() will then write into unallocated memory.
+The fix is to use calloc. It's slower but this is a one-time
+allocation. Other malloc(x * y) calls have also been replaced
+by calloc(x, y)
+
+References:
+ https://www.freelists.org/post/procps/ps-buffer-overflow-CVE-20234016
+ https://nvd.nist.gov/vuln/detail/CVE-2023-4016
+ https://gitlab.com/procps-ng/procps/-/issues/297
+ https://bugs.debian.org/1042887
+
+Signed-off-by: Craig Small <csmall@dropbear.xyz>
+
+CVE: CVE-2023-4016
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/=
2c933ecba3bb1d3041a5a7a53a7b4078a6003413]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ NEWS            | 1 +
+ src/ps/parser.c | 8 ++++----
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/src/ps/parser.c b/src/ps/parser.c
+index 248aa741..15873dfa 100644
+--- a/src/ps/parser.c
++++ b/src/ps/parser.c
+@@ -189,7 +189,6 @@ static const char *parse_list(const char *arg, const=
 char *(*parse_fn)(char *, s
+   const char *err;       /* error code that could or did happen */
+   /*** prepare to operate ***/
+   node =3D xmalloc(sizeof(selection_node));
+-  node->u =3D xmalloc(strlen(arg)*sizeof(sel_union)); /* waste is insig=
nificant */
+   node->n =3D 0;
+   buf =3D strdup(arg);
+   /*** sanity check and count items ***/
+@@ -210,6 +209,7 @@ static const char *parse_list(const char *arg, const=
 char *(*parse_fn)(char *, s
+   } while (*++walk);
+   if(need_item) goto parse_error;
+   node->n =3D items;
++  node->u =3D xcalloc(items, sizeof(sel_union));
+   /*** actually parse the list ***/
+   walk =3D buf;
+   while(items--){
+@@ -1050,15 +1050,15 @@ static const char *parse_trailing_pids(void){
+   thisarg =3D ps_argc - 1;   /* we must be at the end now */
+=20
+   pidnode =3D xmalloc(sizeof(selection_node));
+-  pidnode->u =3D xmalloc(i*sizeof(sel_union)); /* waste is insignifican=
t */
++  pidnode->u =3D xcalloc(i, sizeof(sel_union)); /* waste is insignifica=
nt */
+   pidnode->n =3D 0;
+=20
+   grpnode =3D xmalloc(sizeof(selection_node));
+-  grpnode->u =3D xmalloc(i*sizeof(sel_union)); /* waste is insignifican=
t */
++  grpnode->u =3D xcalloc(i,sizeof(sel_union)); /* waste is insignifican=
t */
+   grpnode->n =3D 0;
+=20
+   sidnode =3D xmalloc(sizeof(selection_node));
+-  sidnode->u =3D xmalloc(i*sizeof(sel_union)); /* waste is insignifican=
t */
++  sidnode->u =3D xcalloc(i, sizeof(sel_union)); /* waste is insignifica=
nt */
+   sidnode->n =3D 0;
+=20
+   while(i--){
+--=20
+GitLab
+
diff --git a/meta/recipes-extended/procps/procps_4.0.3.bb b/meta/recipes-=
extended/procps/procps_4.0.3.bb
index 71efb80207d..9ef679c6bd8 100644
--- a/meta/recipes-extended/procps/procps_4.0.3.bb
+++ b/meta/recipes-extended/procps/procps_4.0.3.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;prot=
ocol=3Dhttps;branch=3Dmaster \
            file://sysctl.conf \
            file://0001-src-w.c-use-utmp.h-only.patch \
            file://0001-po-fr.po-address-failures-with-gettext-0.22.patch=
 \
+           file://CVE-2023-4016.patch \
            "
 SRCREV =3D "806eb270f217ff7e1e745c7bda2b002b5be74be4"
=20
--=20
2.34.1


