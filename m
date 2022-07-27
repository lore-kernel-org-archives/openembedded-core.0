Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B58C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 17:49:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.22768.1658944134108819877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 10:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CDtAo3xa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=4207a3abb1=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26RBRUmw029422
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 17:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=mLSvu8SAmA4KAK7bfzeQBwa8DLtAJ7QvYWMOSwEB8MM=;
 b=CDtAo3xaozWzCWfJy2jCmjePIV1ZjXcOYZQxn+IuTh1sO/M90/G6OFUmfF5dQ+SwU0DI
 /UMWyV8ao6Ow+WdCBtIuAFyuynNoZi+p4DMe3CuPIKtkEXhIbwT8lHCEFZnZiuYdD7so
 GfQ2qqXv/KDpgZyYTdZI0kY5J/Uy5N73TZE10DJ0Fr/cl1T9ruy4npPjxwRLr9TF7Y7R
 HZ+C1xa1TrVqOgOEtWOyfS70rWnI34m5gs6YgOo0Fn1Hc9ghFkpqiJA4gMq6tTpwa2Tw
 G0NJlFqyFSYm1qFZEixrQKxRKqBrvIY0fuDUxGonW4dzYa+9pR2P8pIHHratnNX/0J2X 7A==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hg671bjsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 17:48:53 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 27 Jul 2022 10:48:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 27 Jul 2022 10:48:51 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.209.73) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 27 Jul 2022 10:48:51 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] lua: Backport fix for CVE-2022-33099
Date: Wed, 27 Jul 2022 10:48:51 -0700
Message-ID: <20220727174851.793703-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TSwlTLjhtmm1CKryKzPG_dCXGsFN5xLJ
X-Proofpoint-GUID: TSwlTLjhtmm1CKryKzPG_dCXGsFN5xLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-27_06,2022-07-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=542 mlxscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 17:49:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168584

From: Khem Raj <raj.khem@gmail.com>

Fixes stack overflow while handling recurring errors in Lua-stack

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit caad9d5f7184f0fa60fa7770e5d3da3f533647cb)
Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../lua/lua/CVE-2022-33099.patch              | 61 +++++++++++++++++++
 meta/recipes-devtools/lua/lua_5.4.4.bb        |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-33099.patch

diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
new file mode 100644
index 0000000000..fe7b6065c2
--- /dev/null
+++ b/meta/recipes-devtools/lua/lua/CVE-2022-33099.patch
@@ -0,0 +1,61 @@
+From 42d40581dd919fb134c07027ca1ce0844c670daf Mon Sep 17 00:00:00 2001
+From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
+Date: Fri, 20 May 2022 13:14:33 -0300
+Subject: [PATCH] Save stack space while handling errors
+
+Because error handling (luaG_errormsg) uses slots from EXTRA_STACK,
+and some errors can recur (e.g., string overflow while creating an
+error message in 'luaG_runerror', or a C-stack overflow before calling
+the message handler), the code should use stack slots with parsimony.
+
+This commit fixes the bug "Lua-stack overflow when C stack overflows
+while handling an error".
+
+CVE: CVE-2022-33099
+
+Upstream-Status: Backport [https://github.com/lua/lua/commit/42d40581dd919fb134c07027ca1ce0844c670daf]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ldebug.c | 5 ++++-
+ lvm.c    | 6 ++++--
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+--- a/src/ldebug.c
++++ b/src/ldebug.c
+@@ -824,8 +824,11 @@ l_noret luaG_runerror (lua_State *L, con
+   va_start(argp, fmt);
+   msg = luaO_pushvfstring(L, fmt, argp);  /* format message */
+   va_end(argp);
+-  if (isLua(ci))  /* if Lua function, add source:line information */
++  if (isLua(ci)) {  /* if Lua function, add source:line information */
+     luaG_addinfo(L, msg, ci_func(ci)->p->source, getcurrentline(ci));
++    setobjs2s(L, L->top - 2, L->top - 1);  /* remove 'msg' from the stack */
++    L->top--;
++  }
+   luaG_errormsg(L);
+ }
+ 
+--- a/src/lvm.c
++++ b/src/lvm.c
+@@ -656,8 +656,10 @@ void luaV_concat (lua_State *L, int tota
+       /* collect total length and number of strings */
+       for (n = 1; n < total && tostring(L, s2v(top - n - 1)); n++) {
+         size_t l = vslen(s2v(top - n - 1));
+-        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl))
++        if (l_unlikely(l >= (MAX_SIZE/sizeof(char)) - tl)) {
++          L->top = top - total;  /* pop strings to avoid wasting stack */
+           luaG_runerror(L, "string length overflow");
++        }
+         tl += l;
+       }
+       if (tl <= LUAI_MAXSHORTLEN) {  /* is result a short string? */
+@@ -672,7 +674,7 @@ void luaV_concat (lua_State *L, int tota
+       setsvalue2s(L, top - n, ts);  /* create result */
+     }
+     total -= n-1;  /* got 'n' strings to create 1 new */
+-    L->top -= n-1;  /* popped 'n' strings and pushed one */
++    L->top = top - (n - 1);  /* popped 'n' strings and pushed one */
+   } while (total > 1);  /* repeat until only 1 result left */
+ }
+ 
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index 6f2cea5314..0b2e754b31 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -7,6 +7,7 @@ HOMEPAGE = "http://www.lua.org/"
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
            file://lua.pc.in \
            file://CVE-2022-28805.patch \
+           file://CVE-2022-33099.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'http://www.lua.org/tests/lua-${PV_testsuites}-tests.tar.gz;name=tarballtest file://run-ptest ', '', d)} \
            "
 
-- 
2.25.1


