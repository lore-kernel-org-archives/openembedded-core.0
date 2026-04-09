Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923FEE98FC0
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:17:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126109.1775715414334912210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YyqSrxVH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6394hWvn3576489
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Apr 2026 06:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CwiBurXs0ncbjIofVKvFXaq83HgsAZNnnrVcEvvIuGk=; b=YyqSrxVHf+Ro
	XVcM0KANxkzY7fQZ33JB7El/NKGhEasnl/SovMP4XIQlp1axh0KoZjwt71TEmEe0
	1wmxDD4ckPsmd90letm/+Lh/soQ+E8YPeb84o3eq0eYAB9yYVJ4MIAMTxFu+tW89
	kLHQVjpqbbfaAQckrAHs/BvgFN8uDaqT3+um4sm/Dr/pZNgeWjVPueE5EqLXGR8u
	Qw0axo1NnYLRUs8ybIoQMCzvyXPVg5/jSwSI0mqr+UnWPZGQckS2k7hV37pnriw9
	ipPyaJLSqI5hsvvBoYOiGo7am9nFZUh1OZN8WMnOsbnuHYb5QNt4/feQ1kZtlOl4
	7dnEa16ndw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqkr6f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:16:53 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:16:52 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:16:51 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 11/12] zlib: upgrade 1.3.1 -> 1.3.2
Date: Thu, 9 Apr 2026 14:16:38 +0800
Message-ID: <20260409061639.1688205-12-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
References: <20260409061639.1688205-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d74455 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=fXms6y0vAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8
 a=kv0iZ2aEAAAA:8 a=Crg_IfaRAAAA:8 a=fRJhPY7y4gF2qQe6sUoA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=c6Zb8eaUoX5VaqycxFvw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=kOKwvp6dMpUQ8r7jYgfa:22 a=WKt6puP8o2WZ-s9Jsdj1:22
X-Proofpoint-ORIG-GUID: ZQhmazzbpSi7qcadX0Jq0iItuJ7rq9_6
X-Proofpoint-GUID: ZQhmazzbpSi7qcadX0Jq0iItuJ7rq9_6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfX+kxYiteg27Td
 vDeIc3uZCNxVnb4zBQp0t/8rfdDGbQ2oEXdRJgdWZqQParaxUhhpv/vquTDznEM91Vk+a5Lp71X
 IKfo8xCT7YUCx0cMyiEEzDnwsXeRFjUzHN1R1DcR0iclLucQ9AyuOib+yA5cF2/IfkmBhx+2qu+
 2R6auSXr9XNZcY/0PFr0cUYVcHeW8A1haf/YpCWC4RolOnfG7fSgXgvKiaLhrWE6aYro0y1/NAY
 F+TbV8u4mQ6SxQcOELwJMAxQuaZFjlQ098utp84qqOYxnpwfw8065JAsTksCJM56Jv9sgyZEcSy
 wbLgeWBJKYX+mEg+LjydhKBCPCXXTeueGCJzOj9gCELxaxJPuPsnphOI6gWzFh/kgRGk91bJPMd
 S1VzzbKd5EpyYH+NgsSPTMDzkX7WOp0aTlo8gYlp4CwYHSvef72mK1yU8J2WN5TA8a2gZADN1bp
 gWfDzxEWPocPJYxBJDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 06:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234887

From: Liyin Zhang <liyin.zhang.cn@windriver.com>

Upgrade zlib from 1.3.1 to 1.3.2 to fix CVE-2026-27171.
And delete patches included in this version.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2026-27171]
[https://git.openembedded.org/openembedded-core/commit/meta/recipes-core/zlib?id=af357536104e918aefbb2a2cb835c45eed690e88]

Signed-off-by: Liyin Zhang <liyin.zhang.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...configure-Pass-LDFLAGS-to-link-tests.patch | 78 -------------------
 .../zlib/zlib/CVE-2026-27171.patch            | 63 ---------------
 .../zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb}     |  4 +-
 3 files changed, 1 insertion(+), 144 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
 delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
 rename meta/recipes-core/zlib/{zlib_1.3.1.bb => zlib_1.3.2.bb} (87%)

diff --git a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch b/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
deleted file mode 100644
index 07b2cd3879..0000000000
--- a/meta/recipes-core/zlib/zlib/0001-configure-Pass-LDFLAGS-to-link-tests.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Submitted [https://github.com/madler/zlib/pull/599]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From ea77f1f003a4d18b23cca703f3c824942863a1b4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 8 Mar 2022 22:38:47 -0800
-Subject: [PATCH] configure: Pass LDFLAGS to link tests
-
-LDFLAGS can contain critical flags without which linking wont succeed
-therefore ensure that all configure tests involving link time checks are
-using LDFLAGS on compiler commandline along with CFLAGS to ensure the
-tests perform correctly. Without this some tests may fail resulting in
-wrong confgure result, ending in miscompiling the package
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- configure | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/configure b/configure
-index c55098a..a7c6d72 100755
---- a/configure
-+++ b/configure
-@@ -443,7 +443,7 @@ if test $shared -eq 1; then
-   echo Checking for shared library support... | tee -a configure.log
-   # we must test in two steps (cc then ld), required at least on SunOS 4.x
-   if try $CC -c $SFLAGS $test.c &&
--     try $LDSHARED $SFLAGS -o $test$shared_ext $test.o; then
-+     try $LDSHARED $SFLAGS $LDFLAGS -o $test$shared_ext $test.o; then
-     echo Building shared library $SHAREDLIBV with $CC. | tee -a configure.log
-   elif test -z "$old_cc" -a -z "$old_cflags"; then
-     echo No shared library support. | tee -a configure.log
-@@ -505,7 +505,7 @@ int main(void) {
- }
- EOF
-   fi
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     sizet=`./$test`
-     echo "Checking for a pointer-size integer type..." $sizet"." | tee -a configure.log
-     CFLAGS="${CFLAGS} -DNO_SIZE_T=${sizet}"
-@@ -539,7 +539,7 @@ int main(void) {
-   return 0;
- }
- EOF
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for fseeko... Yes." | tee -a configure.log
-   else
-     CFLAGS="${CFLAGS} -DNO_FSEEKO"
-@@ -556,7 +556,7 @@ cat > $test.c <<EOF
- #include <errno.h>
- int main() { return strlen(strerror(errno)); }
- EOF
--if try $CC $CFLAGS -o $test $test.c; then
-+if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-   echo "Checking for strerror... Yes." | tee -a configure.log
- else
-   CFLAGS="${CFLAGS} -DNO_STRERROR"
-@@ -663,7 +663,7 @@ int main()
-   return (mytest("Hello%d\n", 1));
- }
- EOF
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for vsnprintf() in stdio.h... Yes." | tee -a configure.log
- 
-     echo >> configure.log
-@@ -753,7 +753,7 @@ int main()
- }
- EOF
- 
--  if try $CC $CFLAGS -o $test $test.c; then
-+  if try $CC $CFLAGS $LDFLAGS -o $test $test.c; then
-     echo "Checking for snprintf() in stdio.h... Yes." | tee -a configure.log
- 
-     echo >> configure.log
diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
deleted file mode 100644
index e6a8a3eac5..0000000000
--- a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
-From: Mark Adler <git@madler.net>
-Date: Sun, 21 Dec 2025 18:17:56 -0800
-Subject: [PATCH] Check for negative lengths in crc32_combine functions.
-
-Though zlib.h says that len2 must be non-negative, this avoids the
-possibility of an accidental infinite loop.
-
-Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a458576d1ff0f26fc7230c6de816d1f6a77]
-CVE: CVE-2026-27171
-
-Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
----
- crc32.c | 4 ++++
- zlib.h  | 4 ++--
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/crc32.c b/crc32.c
-index 6c38f5c..33d8c79 100644
---- a/crc32.c
-+++ b/crc32.c
-@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, const unsigned char FAR *buf,
- 
- /* ========================================================================= */
- uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
-+    if (len2 < 0)
-+        return 0;
- #ifdef DYNAMIC_CRC_TABLE
-     once(&made, make_crc_table);
- #endif /* DYNAMIC_CRC_TABLE */
-@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2) {
- 
- /* ========================================================================= */
- uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
-+    if (len2 < 0)
-+        return 0;
- #ifdef DYNAMIC_CRC_TABLE
-     once(&made, make_crc_table);
- #endif /* DYNAMIC_CRC_TABLE */
-diff --git a/zlib.h b/zlib.h
-index 8d4b932..8c7f8ac 100644
---- a/zlib.h
-+++ b/zlib.h
-@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2, z_off_t len2);
-    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
-    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC-32
-    check value of seq1 and seq2 concatenated, requiring only crc1, crc2, and
--   len2. len2 must be non-negative.
-+   len2. len2 must be non-negative, otherwise zero is returned.
- */
- 
- /*
- ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
- 
-      Return the operator corresponding to length len2, to be used with
--   crc32_combine_op(). len2 must be non-negative.
-+   crc32_combine_op(). len2 must be non-negative, otherwise zero is returned.
- */
- 
- ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op);
--- 
-2.43.0
-
diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
similarity index 87%
rename from meta/recipes-core/zlib/zlib_1.3.1.bb
rename to meta/recipes-core/zlib/zlib_1.3.2.bb
index e42578fd7e..c7d59fdf78 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -8,13 +8,11 @@ LIC_FILES_CHKSUM = "file://zlib.h;beginline=6;endline=23;md5=5377232268e952e9ef6
 
 # The source tarball needs to be .gz as only the .gz ends up in fossils/
 SRC_URI = "https://zlib.net/${BP}.tar.gz \
-           file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
            file://run-ptest \
-           file://CVE-2026-27171.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23"
+SRC_URI[sha256sum] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
-- 
2.34.1


