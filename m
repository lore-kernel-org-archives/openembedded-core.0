Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F87C83F0A
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56139.1751879245264749408
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9283af41ed=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675ubtD001896
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 02:07:25 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn17gn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 02:07:24 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 7 Jul 2025 02:07:30 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 7 Jul 2025 02:07:30 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH V2] icu: fix CVE-2025-5222
Date: Mon, 7 Jul 2025 17:07:28 +0800
Message-ID: <20250707090728.232277-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6mnoefwq0f7hEN58z2PcXtWoDW0hFtsn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA1MiBTYWx0ZWRfXy4Iwn29Z908v foR/QVegYsffi6iw1yt6MOLdbXm4mdQgK97eChuXsGfiBj8xknmIHkwMWFDsjxuMPWp9zpI+rh6 tCxjKQht3Zk5YT/YhB/UVZA/Dq9wR776WOrWbXkW6uf5qGi+jWIAtucTPCcU6Y6aoW+oGl1L9+Q
 twE/H82yyfL9M3WCQrXofQfD+7Ph72IJgr9bkdMVYAz2w/tVjANUuQ4M06eYeaskztO42wVgmxh cqKI0huuiMAU7XTr3F+EgHUOD2dcm0U7r5VW3+Mdlyrcenh72Qe/l36pRq8AeKPjsqkGfxQxqZo mRfJVcfpViVnrq0Ia1AlJK21d4V8JQIlnoWHtlr2rvYhTVfMafR+SSGnMGsL2+Jn0u5Wt1Z5LXL
 nRBDyq4hLjlntmglMwC8vyyPP/rDXAbmpUMtbbZ/Resg7D3vrvRoCLKhPMVUg8Y/lc/XNXgt
X-Proofpoint-ORIG-GUID: 6mnoefwq0f7hEN58z2PcXtWoDW0hFtsn
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686b8e4c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=PYnjg3YJAAAA:8 a=SBGlVgBqAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=cm27Pg_UAAAA:8
 a=U52jcThjaRTn087B9wsA:9 a=Ip4rIPIxglOjsMiGO2Hr:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219988

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-5222:
A stack buffer overflow was found in Internationl components for unicode
(ICU ). While running the genrb binary, the 'subtag' struct overflowed
at the SRBRoot::addTag function. This issue may lead to memory
corruption and local arbitrary code execution.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2025-5222
https://unicode-org.atlassian.net/browse/ICU-22957
https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../icu/icu/CVE-2025-5222.patch               | 166 ++++++++++++++++++
 meta/recipes-support/icu/icu_74-2.bb          |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/CVE-2025-5222.patch

diff --git a/meta/recipes-support/icu/icu/CVE-2025-5222.patch b/meta/recipes-support/icu/icu/CVE-2025-5222.patch
new file mode 100644
index 0000000000..276d9e4f90
--- /dev/null
+++ b/meta/recipes-support/icu/icu/CVE-2025-5222.patch
@@ -0,0 +1,166 @@
+From b5fd1ccf1068140ca9333878f2172a0947986ca8 Mon Sep 17 00:00:00 2001
+From: Frank Tang <ftang@chromium.org>
+Date: Wed, 22 Jan 2025 11:50:59 -0800
+Subject: [PATCH] ICU-22973 Fix buffer overflow by using CharString
+
+CVE: CVE-2025-5222
+Upstream-Status: Backport [https://github.com/unicode-org/icu/commit/2c667e31cfd0b6bb1923627a932fd3453a5bac77]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tools/genrb/parse.cpp | 49 +++++++++++++++++++++---------------
+ 1 file changed, 29 insertions(+), 20 deletions(-)
+
+diff --git a/tools/genrb/parse.cpp b/tools/genrb/parse.cpp
+index f487241..eb85d51 100644
+--- a/tools/genrb/parse.cpp
++++ b/tools/genrb/parse.cpp
+@@ -1153,7 +1153,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024];
++    CharString         subtag;
+     UnicodeString      rules;
+     UBool              haveRules = false;
+     UVersionInfo       version;
+@@ -1189,15 +1189,15 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             return nullptr;
+         }
+ 
+-        u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
+-
++        subtag.clear();
++        subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         if (U_FAILURE(*status))
+         {
+             res_close(result);
+             return nullptr;
+         }
+ 
+-        member = parseResource(state, subtag, nullptr, status);
++        member = parseResource(state, subtag.data(), nullptr, status);
+ 
+         if (U_FAILURE(*status))
+         {
+@@ -1208,7 +1208,7 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+         {
+             // Ignore the parsed resources, continue parsing.
+         }
+-        else if (uprv_strcmp(subtag, "Version") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Version") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             char     ver[40];
+@@ -1225,11 +1225,11 @@ addCollation(ParseState* state, TableResource  *result, const char *collationTyp
+             result->add(member, line, *status);
+             member = nullptr;
+         }
+-        else if(uprv_strcmp(subtag, "%%CollationBin")==0)
++        else if(uprv_strcmp(subtag.data(), "%%CollationBin")==0)
+         {
+             /* discard duplicate %%CollationBin if any*/
+         }
+-        else if (uprv_strcmp(subtag, "Sequence") == 0 && member->isString())
++        else if (uprv_strcmp(subtag.data(), "Sequence") == 0 && member->isString())
+         {
+             StringResource *sr = static_cast<StringResource *>(member);
+             rules = sr->fString;
+@@ -1395,7 +1395,7 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+     struct UString    *tokenValue;
+     struct UString     comment;
+     enum   ETokenType  token;
+-    char               subtag[1024], typeKeyword[1024];
++    CharString         subtag, typeKeyword;
+     uint32_t           line;
+ 
+     result = table_open(state->bundle, tag, nullptr, status);
+@@ -1437,7 +1437,8 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return nullptr;
+             }
+ 
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+ 
+             if (U_FAILURE(*status))
+             {
+@@ -1445,9 +1446,9 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 return nullptr;
+             }
+ 
+-            if (uprv_strcmp(subtag, "default") == 0)
++            if (uprv_strcmp(subtag.data(), "default") == 0)
+             {
+-                member = parseResource(state, subtag, nullptr, status);
++                member = parseResource(state, subtag.data(), nullptr, status);
+ 
+                 if (U_FAILURE(*status))
+                 {
+@@ -1466,22 +1467,29 @@ parseCollationElements(ParseState* state, char *tag, uint32_t startline, UBool n
+                 if(token == TOK_OPEN_BRACE) {
+                     token = getToken(state, &tokenValue, &comment, &line, status);
+                     TableResource *collationRes;
+-                    if (keepCollationType(subtag)) {
+-                        collationRes = table_open(state->bundle, subtag, nullptr, status);
++                    if (keepCollationType(subtag.data())) {
++                        collationRes = table_open(state->bundle, subtag.data(), nullptr, status);
+                     } else {
+                         collationRes = nullptr;
+                     }
+                     // need to parse the collation data regardless
+-                    collationRes = addCollation(state, collationRes, subtag, startline, status);
++                    collationRes = addCollation(state, collationRes, subtag.data(), startline, status);
+                     if (collationRes != nullptr) {
+                         result->add(collationRes, startline, *status);
+                     }
+                 } else if(token == TOK_COLON) { /* right now, we'll just try to see if we have aliases */
+                     /* we could have a table too */
+                     token = peekToken(state, 1, &tokenValue, &line, &comment, status);
+-                    u_UCharsToChars(tokenValue->fChars, typeKeyword, u_strlen(tokenValue->fChars) + 1);
+-                    if(uprv_strcmp(typeKeyword, "alias") == 0) {
+-                        member = parseResource(state, subtag, nullptr, status);
++                    typeKeyword.clear();
++                    typeKeyword.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
++                    if (U_FAILURE(*status))
++                    {
++                        res_close(result);
++                        return nullptr;
++                    }
++
++                    if(uprv_strcmp(typeKeyword.data(), "alias") == 0) {
++                        member = parseResource(state, subtag.data(), nullptr, status);
+                         if (U_FAILURE(*status))
+                         {
+                             res_close(result);
+@@ -1523,7 +1531,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+     struct UString    *tokenValue=nullptr;
+     struct UString    comment;
+     enum   ETokenType token;
+-    char              subtag[1024];
++    CharString        subtag;
+     uint32_t          line;
+     UBool             readToken = false;
+ 
+@@ -1562,7 +1570,8 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+         }
+ 
+         if(uprv_isInvariantUString(tokenValue->fChars, -1)) {
+-            u_UCharsToChars(tokenValue->fChars, subtag, u_strlen(tokenValue->fChars) + 1);
++            subtag.clear();
++            subtag.appendInvariantChars(tokenValue->fChars, u_strlen(tokenValue->fChars), *status);
+         } else {
+             *status = U_INVALID_FORMAT_ERROR;
+             error(line, "invariant characters required for table keys");
+@@ -1575,7 +1584,7 @@ realParseTable(ParseState* state, TableResource *table, char *tag, uint32_t star
+             return nullptr;
+         }
+ 
+-        member = parseResource(state, subtag, &comment, status);
++        member = parseResource(state, subtag.data(), &comment, status);
+ 
+         if (member == nullptr || U_FAILURE(*status))
+         {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/icu/icu_74-2.bb b/meta/recipes-support/icu/icu_74-2.bb
index 3a4e197308..83753a18e5 100644
--- a/meta/recipes-support/icu/icu_74-2.bb
+++ b/meta/recipes-support/icu/icu_74-2.bb
@@ -121,6 +121,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://CVE-2025-5222.patch \
            "
 
 SRC_URI:append:class-target = "\
-- 
2.34.1


