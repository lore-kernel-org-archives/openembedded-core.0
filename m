Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39033C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 13:20:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.42230.1676985654604922403
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 05:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LeOzgXZV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=14161df58d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LDIbX3007993
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 13:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=MyteRhxhnhSvmoHKvL7FpW4j6byIIroKzIAqC9hSQJM=;
 b=LeOzgXZVuNszHK4FpguwrujSfpZ/fB/vfby/SnLGYiUDXjeJuk3fxFudCxB20EcmXAVC
 8VXUlOmSV/WtCfSwjjooOodGO0SPMH88EoLGrTbFvYnCUTh4WqTScy3gbpgF4a6p8jnc
 AwK+QKgUtvUIqgMwOwptoPzQ6OTNMRU3fhtgaT73bJa2p0Nitu2Vo1AsSkHSQvH99cOh
 sJUMpB0fuo8zwInz7ebewjJamIvUHJ+FiprMr6enTTaASWNYUUq5Xe6jmcdRnP4CepbE
 JtTWTKz5kKQvdVHAjXgcSLKzMtYG1bkq7i8C2v0iv2Pa2B39iAyF9PJkB8jWoAWeTK8x Jg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpem2np0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 13:20:53 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 21 Feb 2023 05:20:52 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 21 Feb 2023 05:20:50 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] apr-util: fix for CVE-2022-25147
Date: Tue, 21 Feb 2023 13:20:21 +0000
Message-ID: <20230221132021.2838669-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fucR-iR57Z-eJLxXuZ_3NEi6Gln3UfzM
X-Proofpoint-GUID: fucR-iR57Z-eJLxXuZ_3NEi6Gln3UfzM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 13:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177496

Integer Overflow or Wraparound vulnerability in apr_base64 functions
of Apache Portable Runtime Utility (APR-util) allows an attacker to
write beyond bounds of a buffer. This issue affects Apache Portable
Runtime Utility (APR-util) 1.6.1 and prior versions.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-25147

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../apr/apr-util/CVE-2022-25147.patch         | 180 ++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.6.1.bb    |   3 +-
 2 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2022-25147.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
new file mode 100644
index 0000000000..e85785aca0
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
@@ -0,0 +1,180 @@
+From 3f5257075c7eb601aed6333e9bb5d9eb0e11254b Mon Sep 17 00:00:00 2001
+From: Yann Ylavic <ylavic@apache.org>
+Date: Thu, 20 Oct 2022 09:38:34 +0000
+Subject: [PATCH] apr_base64: Make sure encoding/decoding lengths fit in an int
+ >= 0.
+
+The (old) API of apr_base64 functions has always used int for representing
+lengths and it does not return errors. Make sure to abort() if the provided
+data don't fit.
+
+* encoding/apr_base64.c():
+  #define APR_BASE64_ENCODE_MAX and APR_BASE64_DECODE_MAX as the hard length
+  limits for encoding and decoding respectively.
+
+* encoding/apr_base64.c(apr_base64_encode_len, apr_base64_encode,
+                        apr_base64_encode_binary, apr_pbase64_encode):
+  abort() if the given length is above APR_BASE64_ENCODE_MAX.
+
+* encoding/apr_base64.c(apr_base64_decode_len, apr_base64_decode,
+                        apr_base64_decode_binary, apr_pbase64_decode):
+  abort() if the given plain buffer length is above APR_BASE64_DECODE_MAX.
+
+
+apr_base64: Follow up to r1902206: Cap to APR_BASE64_ENCODE_MAX in apr_pbase64_encode().
+
+
+Merges r1902206[, r1904666] from trunk.
+Merges r1904727 from 1.7.x.
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1904728 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2022-25147
+
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/3f5257075c7eb601aed6333e9bb5d9eb0e11254b]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ encoding/apr_base64.c | 41 +++++++++++++++++++++++++----------------
+ 1 file changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/encoding/apr_base64.c b/encoding/apr_base64.c
+index e9b75e3d..ac9f2816 100644
+--- a/encoding/apr_base64.c
++++ b/encoding/apr_base64.c
+@@ -20,11 +20,20 @@
+  * ugly 'len' functions, which is quite a nasty cost.
+  */
+ 
++#undef NDEBUG /* always abort() on assert()ion failure */
++#include <assert.h>
++
+ #include "apr_base64.h"
+ #if APR_CHARSET_EBCDIC
+ #include "apr_xlate.h"
+ #endif				/* APR_CHARSET_EBCDIC */
+ 
++/* Above APR_BASE64_ENCODE_MAX length the encoding can't fit in an int >= 0 */
++#define APR_BASE64_ENCODE_MAX 1610612733
++
++/* Above APR_BASE64_DECODE_MAX length the decoding can't fit in an int >= 0 */
++#define APR_BASE64_DECODE_MAX 2863311524u
++
+ /* aaaack but it's fast and const should make it shared text page. */
+ static const unsigned char pr2six[256] =
+ {
+@@ -109,24 +118,22 @@ APU_DECLARE(apr_status_t) apr_base64init_ebcdic(apr_xlate_t *to_ascii,
+ 
+ APU_DECLARE(int) apr_base64_decode_len(const char *bufcoded)
+ {
+-    int nbytesdecoded;
+     register const unsigned char *bufin;
+     register apr_size_t nprbytes;
+ 
+     bufin = (const unsigned char *) bufcoded;
+     while (pr2six[*(bufin++)] <= 63);
+-
+     nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
+-    nbytesdecoded = (((int)nprbytes + 3) / 4) * 3;
++    assert(nprbytes <= APR_BASE64_DECODE_MAX);
+ 
+-    return nbytesdecoded + 1;
++    return (int)(((nprbytes + 3u) / 4u) * 3u + 1u);
+ }
+ 
+ APU_DECLARE(int) apr_base64_decode(char *bufplain, const char *bufcoded)
+ {
+ #if APR_CHARSET_EBCDIC
+     apr_size_t inbytes_left, outbytes_left;
+-#endif				/* APR_CHARSET_EBCDIC */
++#endif /* APR_CHARSET_EBCDIC */
+     int len;
+     
+     len = apr_base64_decode_binary((unsigned char *) bufplain, bufcoded);
+@@ -143,7 +150,7 @@ APU_DECLARE(int) apr_base64_decode(char *bufplain, const char *bufcoded)
+  * the conversion of the output to ebcdic is left out.
+  */
+ APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,
+-				   const char *bufcoded)
++                                          const char *bufcoded)
+ {
+     int nbytesdecoded;
+     register const unsigned char *bufin;
+@@ -153,12 +160,13 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,
+     bufin = (const unsigned char *) bufcoded;
+     while (pr2six[*(bufin++)] <= 63);
+     nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
+-    nbytesdecoded = (((int)nprbytes + 3) / 4) * 3;
++    assert(nprbytes <= APR_BASE64_DECODE_MAX);
++    nbytesdecoded = (int)(((nprbytes + 3u) / 4u) * 3u);
+ 
+     bufout = (unsigned char *) bufplain;
+     bufin = (const unsigned char *) bufcoded;
+ 
+-    while (nprbytes > 4) {
++    while (nprbytes >= 4) {
+ 	*(bufout++) =
+ 	    (unsigned char) (pr2six[*bufin] << 2 | pr2six[bufin[1]] >> 4);
+ 	*(bufout++) =
+@@ -178,13 +186,8 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,
+ 	*(bufout++) =
+ 	    (unsigned char) (pr2six[bufin[1]] << 4 | pr2six[bufin[2]] >> 2);
+     }
+-    if (nprbytes > 3) {
+-	*(bufout++) =
+-	    (unsigned char) (pr2six[bufin[2]] << 6 | pr2six[bufin[3]]);
+-    }
+ 
+-    nbytesdecoded -= (4 - (int)nprbytes) & 3;
+-    return nbytesdecoded;
++    return nbytesdecoded - (int)((4u - nprbytes) & 3u);
+ }
+ 
+ static const char basis_64[] =
+@@ -192,6 +195,8 @@ static const char basis_64[] =
+ 
+ APU_DECLARE(int) apr_base64_encode_len(int len)
+ {
++    assert(len >= 0 && len <= APR_BASE64_ENCODE_MAX);
++
+     return ((len + 2) / 3 * 4) + 1;
+ }
+ 
+@@ -203,6 +208,8 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, const char *string, int len)
+     int i;
+     char *p;
+ 
++    assert(len >= 0 && len <= APR_BASE64_ENCODE_MAX);
++
+     p = encoded;
+     for (i = 0; i < len - 2; i += 3) {
+ 	*p++ = basis_64[(os_toascii[string[i]] >> 2) & 0x3F];
+@@ -227,7 +234,7 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, const char *string, int len)
+     }
+ 
+     *p++ = '\0';
+-    return p - encoded;
++    return (unsigned int)(p - encoded);
+ #endif				/* APR_CHARSET_EBCDIC */
+ }
+ 
+@@ -240,6 +247,8 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encoded,
+     int i;
+     char *p;
+ 
++    assert(len >= 0 && len <= APR_BASE64_ENCODE_MAX);
++
+     p = encoded;
+     for (i = 0; i < len - 2; i += 3) {
+ 	*p++ = basis_64[(string[i] >> 2) & 0x3F];
+@@ -264,5 +273,5 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encoded,
+     }
+ 
+     *p++ = '\0';
+-    return (int)(p - encoded);
++    return (unsigned int)(p - encoded);
+ }
+-- 
+2.32.0
+
diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index b851d46351..f5a2888016 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -14,7 +14,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configure_fixes.patch \
            file://run-ptest \
            file://0001-Fix-error-handling-in-gdbm.patch \
-"
+           file://CVE-2022-25147.patch \
+          "
 
 SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
 SRC_URI[sha256sum] = "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
-- 
2.34.1


