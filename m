Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C13C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 11:12:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14457.1711710744717762922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 04:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=o+TIZ/d9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4818e71fb8=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42TAsLLC021903
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 11:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=PPS06212021; bh=i4TotTIsjsF4zUC+qZ
	SHnmQDhoQMxrf+21suY8Z1jzw=; b=o+TIZ/d9ESpz52SVKkOCfVvR0mlinpzeR+
	lLPvJ2aCsuLgzEa4XrLuQJZAL1pu7J4q5Vry8d0X4SBH5h3/SwzAgckCropGi1Nl
	YWTXSNKknT29JO9Fu760EoN1ARBnoOrfBceblziRofoKJJuJPnowOTWWbgBHIlZY
	6pcsz3MuVpIdwLN1wpgLKZYS1avuyVoHZclSi1SO4Y/TIi9R5Cn59yIZVUMd25jS
	1cjtHIt9Zezip2zXNxu4dkcR6fRcqp/K6P0KVD/50DwPIPHQwfJmyO3AfX+GFwrG
	LBLWT7xzQxsyr3pkfPtC09ceezhJtih3R+HOGbM45S2LtpYo1dcg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x1m9xr4xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 11:12:22 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 29 Mar 2024 04:12:20 -0700
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH v2 1/1] expat: fix CVE-2023-52425
Date: Fri, 29 Mar 2024 11:12:02 +0000
Message-ID: <20240329111202.618618-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: SaZz1QuYLZojX9tqIlDWihPEKkWRAn7C
X-Proofpoint-ORIG-GUID: SaZz1QuYLZojX9tqIlDWihPEKkWRAn7C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_11,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290099
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 42TAsLLC021903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Mar 2024 11:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197628

From: Meenali Gupta <meenali.gupta@windriver.com>

libexpat through 2.5.0 allows a denial of service (resource consumption) =
because
many full reparsings are required in the case of a large token for which =
multiple
buffer fills are needed.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-52425

Changes related to test directory are not included as most of the files a=
re not present
and are introduced in the later version.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../expat/expat/CVE-2023-52425-0001.patch     |  40 ++++
 .../expat/expat/CVE-2023-52425-0002.patch     |  87 +++++++
 .../expat/expat/CVE-2023-52425-0003.patch     | 222 ++++++++++++++++++
 .../expat/expat/CVE-2023-52425-0004.patch     |  42 ++++
 .../expat/expat/CVE-2023-52425-0005.patch     |  69 ++++++
 .../expat/expat/CVE-2023-52425-0006.patch     |  67 ++++++
 .../expat/expat/CVE-2023-52425-0007.patch     | 159 +++++++++++++
 .../expat/expat/CVE-2023-52425-0008.patch     |  95 ++++++++
 .../expat/expat/CVE-2023-52425-0009.patch     |  52 ++++
 .../expat/expat/CVE-2023-52425-0010.patch     | 111 +++++++++
 .../expat/expat/CVE-2023-52425-0011.patch     |  89 +++++++
 .../expat/expat/CVE-2023-52425-0012.patch     |  87 +++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  12 +
 13 files changed, 1132 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0001.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0002.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0003.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0004.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0005.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0006.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0007.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0008.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0009.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0010.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0011.pat=
ch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2023-52425-0012.pat=
ch

diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0001.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0001.patch
new file mode 100644
index 0000000000..4e21ade018
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0001.patch
@@ -0,0 +1,40 @@
+From d5b02e96ab95d2a7ae0aea72d00054b9d036d76d Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 9 Nov 2023 19:28:05 +0100
+Subject: [PATCH] xmlwf: Document argument "-q"
+
+Rebased-and-adapted-by: Snild Dolkow <snild@sony.com>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/d=
5b02e96ab95d2a7ae0aea72d00054b9d036d76d]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ doc/xmlwf.xml | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/doc/xmlwf.xml b/doc/xmlwf.xml
+index 9603abf..3d35393 100644
+--- a/doc/xmlwf.xml
++++ b/doc/xmlwf.xml
+@@ -313,6 +313,16 @@ supports both.
+         </listitem>
+       </varlistentry>
+=20
++      <varlistentry>
++        <term><option>-q</option></term>
++        <listitem>
++          <para>
++            Disable reparse deferral, and allow quadratic parse runtime
++            on large tokens (default: reparse deferral enabled).
++          </para>
++        </listitem>
++      </varlistentry>
++
+       <varlistentry>
+         <term><option>-r</option></term>
+         <listitem>
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0002.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0002.patch
new file mode 100644
index 0000000000..8376727778
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0002.patch
@@ -0,0 +1,87 @@
+From 09fdf998e7cf3f8f9327e6602077791095aedd4d Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Thu, 9 Nov 2023 19:14:14 +0100
+Subject: [PATCH] xmlwf: Support disabling reparse deferral
+
+Rebased-and-adapted-by: Snild Dolkow <snild@sony.com>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/0=
9fdf998e7cf3f8f9327e6602077791095aedd4d]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ xmlwf/xmlwf.c          | 20 ++++++++++++++++++++
+ xmlwf/xmlwf_helpgen.py |  4 ++++
+ 2 files changed, 24 insertions(+)
+
+diff --git a/xmlwf/xmlwf.c b/xmlwf/xmlwf.c
+index dd023a9..9a5441c 100644
+--- a/xmlwf/xmlwf.c
++++ b/xmlwf/xmlwf.c
+@@ -911,6 +911,9 @@ usage(const XML_Char *prog, int rc) {
+       T("billion laughs attack protection:\n")
+       T("  NOTE: If you ever need to increase these values for non-atta=
ck payload, please file a bug report.\n")
+       T("\n")
++      T("reparse deferral:\n")
++      T("  -q             disable reparse deferral, and allow [q]uadrat=
ic parse runtime with large tokens\n")
++      T("\n")
+       T("  -a FACTOR     set maximum tolerated [a]mplification factor (=
default: 100.0)\n")
+       T("  -b BYTES      set number of output [b]ytes needed to activat=
e (default: 8 MiB)\n")
+       T("\n")
+@@ -967,6 +970,8 @@ tmain(int argc, XML_Char **argv) {
+   unsigned long long attackThresholdBytes;
+   XML_Bool attackThresholdGiven =3D XML_FALSE;
+=20
++  XML_Bool disableDeferral =3D XML_FALSE;
++
+   int exitCode =3D XMLWF_EXIT_SUCCESS;
+   enum XML_ParamEntityParsing paramEntityParsing
+       =3D XML_PARAM_ENTITY_PARSING_NEVER;
+@@ -1091,6 +1096,11 @@ tmain(int argc, XML_Char **argv) {
+ #endif
+       break;
+     }
++    case T('q'): {
++      disableDeferral =3D XML_TRUE;
++      j++;
++      break;
++    }
+     case T('\0'):
+       if (j > 1) {
+         i++;
+@@ -1136,6 +1146,16 @@ tmain(int argc, XML_Char **argv) {
+ #endif
+     }
+=20
++    if (disableDeferral) {
++      const XML_Bool success =3D XML_SetReparseDeferralEnabled(parser, =
XML_FALSE);
++      if (! success) {
++        // This prevents tperror(..) from reporting misleading "[..]: S=
uccess"
++        errno =3D EINVAL;
++        tperror(T("Failed to disable reparse deferral"));
++        exit(XMLWF_EXIT_INTERNAL_ERROR);
++      }
++    }
++
+     if (requireStandalone)
+       XML_SetNotStandaloneHandler(parser, notStandalone);
+     XML_SetParamEntityParsing(parser, paramEntityParsing);
+diff --git a/xmlwf/xmlwf_helpgen.py b/xmlwf/xmlwf_helpgen.py
+index c2a527f..1bd0a0a 100755
+--- a/xmlwf/xmlwf_helpgen.py
++++ b/xmlwf/xmlwf_helpgen.py
+@@ -81,6 +81,10 @@ billion_laughs.add_argument('-a', metavar=3D'FACTOR',
+                             help=3D'set maximum tolerated [a]mplificati=
on factor (default: 100.0)')
+ billion_laughs.add_argument('-b', metavar=3D'BYTES', help=3D'set number=
 of output [b]ytes needed to activate (default: 8 MiB)')
+=20
++reparse_deferral =3D parser.add_argument_group('reparse deferral')
++reparse_deferral.add_argument('-q', metavar=3D'FACTOR',
++                            help=3D'disable reparse deferral, and allow=
 [q]uadratic parse runtime with large tokens')
++
+ parser.add_argument('files', metavar=3D'FILE', nargs=3D'*', help=3D'fil=
e to process (default: STDIN)')
+=20
+ info =3D parser.add_argument_group('info arguments')
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0003.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0003.patch
new file mode 100644
index 0000000000..e5c3606e19
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0003.patch
@@ -0,0 +1,222 @@
+From 9cdf9b8d77d5c2c2a27d15fb68dd3f83cafb45a1 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Thu, 17 Aug 2023 16:25:26 +0200
+Subject: [PATCH] Skip parsing after repeated partials on the same token =
When
+ the parse buffer contains the starting bytes of a token but not all of =
them,
+ we cannot parse the token to completion. We call this a partial token. =
 When
+ this happens, the parse position is reset to the start of the token, an=
d the
+ parse() call returns. The client is then expected to provide more data =
and
+ call parse() again.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+In extreme cases, this means that the bytes of a token may be parsed
+many times: once for every buffer refill required before the full token
+is present in the buffer.
+
+Math:
+  Assume there's a token of T bytes
+  Assume the client fills the buffer in chunks of X bytes
+  We'll try to parse X, 2X, 3X, 4X ... until mX =3D=3D T (technically >=3D=
)
+  That's (m=C2=B2+m)X/2 =3D (T=C2=B2/X+T)/2 bytes parsed (arithmetic pro=
gression)
+  While it is alleviated by larger refills, this amounts to O(T=C2=B2)
+
+Expat grows its internal buffer by doubling it when necessary, but has
+no way to inform the client about how much space is available. Instead,
+we add a heuristic that skips parsing when we've repeatedly stopped on
+an incomplete token. Specifically:
+
+ * Only try to parse if we have a certain amount of data buffered
+ * Every time we stop on an incomplete token, double the threshold
+ * As soon as any token completes, the threshold is reset
+
+This means that when we get stuck on an incomplete token, the threshold
+grows exponentially, effectively making the client perform larger buffer
+fills, limiting how many times we can end up re-parsing the same bytes.
+
+Math:
+  Assume there's a token of T bytes
+  Assume the client fills the buffer in chunks of X bytes
+  We'll try to parse X, 2X, 4X, 8X ... until (2^k)X =3D=3D T (or larger)
+  That's (2^(k+1)-1)X bytes parsed -- e.g. 15X if T =3D 8X
+  This is equal to 2T-X, which amounts to O(T)
+
+We could've chosen a faster growth rate, e.g. 4 or 8. Those seem to
+increase performance further, at the cost of further increasing the
+risk of growing the buffer more than necessary. This can easily be
+adjusted in the future, if desired.
+
+This is all completely transparent to the client, except for:
+1. possible delay of some callbacks (when our heuristic overshoots)
+2. apps that never do isFinal=3DXML_TRUE could miss data at the end
+
+For the affected testdata, this change shows a 100-400x speedup.
+The recset.xml benchmark shows no clear change either way.
+
+Before:
+benchmark -n ../testdata/largefiles/recset.xml 65535 3
+  3 loops, with buffer size 65535. Average time per loop: 0.270223
+benchmark -n ../testdata/largefiles/aaaaaa_attr.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 15.033048
+benchmark -n ../testdata/largefiles/aaaaaa_cdata.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.018027
+benchmark -n ../testdata/largefiles/aaaaaa_comment.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 11.775362
+benchmark -n ../testdata/largefiles/aaaaaa_tag.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 11.711414
+benchmark -n ../testdata/largefiles/aaaaaa_text.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.019362
+
+After:
+./run.sh benchmark -n ../testdata/largefiles/recset.xml 65535 3
+  3 loops, with buffer size 65535. Average time per loop: 0.269030
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_attr.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.044794
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_cdata.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.016377
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_comment.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.027022
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_tag.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.099360
+./run.sh benchmark -n ../testdata/largefiles/aaaaaa_text.xml 4096 3
+  3 loops, with buffer size 4096. Average time per loop: 0.017956
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/9=
cdf9b8d77d5c2c2a27d15fb68dd3f83cafb45a1]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 58 +++++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 39 insertions(+), 19 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index bbffcaa..5695417 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -81,6 +81,7 @@
+ #  endif
+ #endif
+=20
++#include <stdbool.h>
+ #include <stddef.h>
+ #include <string.h> /* memset(), memcpy() */
+ #include <assert.h>
+@@ -629,6 +630,7 @@ struct XML_ParserStruct {
+   const char *m_bufferLim;
+   XML_Index m_parseEndByteIndex;
+   const char *m_parseEndPtr;
++  size_t m_partialTokenBytesBefore; /* used in heuristic to avoid O(n^2=
) */
+   XML_Char *m_dataBuf;
+   XML_Char *m_dataBufEnd;
+   XML_StartElementHandler m_startElementHandler;
+@@ -960,6 +962,32 @@ get_hash_secret_salt(XML_Parser parser) {
+   return parser->m_hash_secret_salt;
+ }
+=20
++static enum XML_Error
++callProcessor(XML_Parser parser, const char *start, const char *end,
++              const char **endPtr) {
++  const size_t have_now =3D EXPAT_SAFE_PTR_DIFF(end, start);
++
++  if (! parser->m_parsingStatus.finalBuffer) {
++    // Heuristic: don't try to parse a partial token again until the am=
ount of
++    // available data has increased significantly.
++    const size_t had_before =3D parser->m_partialTokenBytesBefore;
++    const bool enough =3D (have_now >=3D 2 * had_before);
++
++    if (! enough) {
++      *endPtr =3D start; // callers may expect this to be set
++      return XML_ERROR_NONE;
++    }
++  }
++  const enum XML_Error ret =3D parser->m_processor(parser, start, end, =
endPtr);
++  // if we consumed nothing, remember what we had on this parse attempt.
++  if (*endPtr =3D=3D start) {
++    parser->m_partialTokenBytesBefore =3D have_now;
++  } else {
++    parser->m_partialTokenBytesBefore =3D 0;
++  }
++  return ret;
++}
++
+ static XML_Bool /* only valid for root parser */
+ startParsing(XML_Parser parser) {
+   /* hash functions must be initialized before setContext() is called *=
/
+@@ -1141,6 +1169,7 @@ parserInit(XML_Parser parser, const XML_Char *enco=
dingName) {
+   parser->m_bufferEnd =3D parser->m_buffer;
+   parser->m_parseEndByteIndex =3D 0;
+   parser->m_parseEndPtr =3D NULL;
++  parser->m_partialTokenBytesBefore =3D 0;
+   parser->m_declElementType =3D NULL;
+   parser->m_declAttributeId =3D NULL;
+   parser->m_declEntity =3D NULL;
+@@ -1872,29 +1901,20 @@ XML_Parse(XML_Parser parser, const char *s, int =
len, int isFinal) {
+        to detect errors based on that fact.
+     */
+     parser->m_errorCode
+-        =3D parser->m_processor(parser, parser->m_bufferPtr,
+-                              parser->m_parseEndPtr, &parser->m_bufferP=
tr);
++        =3D callProcessor(parser, parser->m_bufferPtr, parser->m_parseE=
ndPtr,
++                        &parser->m_bufferPtr);
+=20
+     if (parser->m_errorCode =3D=3D XML_ERROR_NONE) {
+       switch (parser->m_parsingStatus.parsing) {
+       case XML_SUSPENDED:
+-        /* It is hard to be certain, but it seems that this case
+-         * cannot occur.  This code is cleaning up a previous parse
+-         * with no new data (since len =3D=3D 0).  Changing the parsing
+-         * state requires getting to execute a handler function, and
+-         * there doesn't seem to be an opportunity for that while in
+-         * this circumstance.
+-         *
+-         * Given the uncertainty, we retain the code but exclude it
+-         * from coverage tests.
+-         *
+-         * LCOV_EXCL_START
+-         */
++        /* While we added no new data, the finalBuffer flag may have ca=
used
++         * us to parse previously-unparsed data in the internal buffer.
++         * If that triggered a callback to the application, it would ha=
ve
++         * had an opportunity to suspend parsing. */
+         XmlUpdatePosition(parser->m_encoding, parser->m_positionPtr,
+                           parser->m_bufferPtr, &parser->m_position);
+         parser->m_positionPtr =3D parser->m_bufferPtr;
+         return XML_STATUS_SUSPENDED;
+-        /* LCOV_EXCL_STOP */
+       case XML_INITIALIZED:
+       case XML_PARSING:
+         parser->m_parsingStatus.parsing =3D XML_FINISHED;
+@@ -1924,7 +1944,7 @@ XML_Parse(XML_Parser parser, const char *s, int le=
n, int isFinal) {
+     parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+=20
+     parser->m_errorCode
+-        =3D parser->m_processor(parser, s, parser->m_parseEndPtr =3D s =
+ len, &end);
++        =3D callProcessor(parser, s, parser->m_parseEndPtr =3D s + len,=
 &end);
+=20
+     if (parser->m_errorCode !=3D XML_ERROR_NONE) {
+       parser->m_eventEndPtr =3D parser->m_eventPtr;
+@@ -2027,8 +2047,8 @@ XML_ParseBuffer(XML_Parser parser, int len, int is=
Final) {
+   parser->m_parseEndByteIndex +=3D len;
+   parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+=20
+-  parser->m_errorCode =3D parser->m_processor(
+-      parser, start, parser->m_parseEndPtr, &parser->m_bufferPtr);
++  parser->m_errorCode =3D callProcessor(parser, start, parser->m_parseE=
ndPtr,
++                                      &parser->m_bufferPtr);
+=20
+   if (parser->m_errorCode !=3D XML_ERROR_NONE) {
+     parser->m_eventEndPtr =3D parser->m_eventPtr;
+@@ -2220,7 +2240,7 @@ XML_ResumeParser(XML_Parser parser) {
+   }
+   parser->m_parsingStatus.parsing =3D XML_PARSING;
+=20
+-  parser->m_errorCode =3D parser->m_processor(
++  parser->m_errorCode =3D callProcessor(
+       parser, parser->m_bufferPtr, parser->m_parseEndPtr, &parser->m_bu=
fferPtr);
+=20
+   if (parser->m_errorCode !=3D XML_ERROR_NONE) {
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0004.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0004.patch
new file mode 100644
index 0000000000..35e8e0b1e5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0004.patch
@@ -0,0 +1,42 @@
+From 1b9d398517befeb944cbbadadf10992b07e96fa2 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Mon, 4 Sep 2023 17:21:14 +0200
+Subject: [PATCH] [PATCH] Don't update partial token heuristic on error
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
b9d398517befeb944cbbadadf10992b07e96fa2]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 5695417..5c66f54 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -979,11 +979,13 @@ callProcessor(XML_Parser parser, const char *start=
, const char *end,
+     }
+   }
+   const enum XML_Error ret =3D parser->m_processor(parser, start, end, =
endPtr);
+-  // if we consumed nothing, remember what we had on this parse attempt.
+-  if (*endPtr =3D=3D start) {
+-    parser->m_partialTokenBytesBefore =3D have_now;
+-  } else {
+-    parser->m_partialTokenBytesBefore =3D 0;
++  if (ret =3D=3D XML_ERROR_NONE) {
++    // if we consumed nothing, remember what we had on this parse attem=
pt.
++    if (*endPtr =3D=3D start) {
++      parser->m_partialTokenBytesBefore =3D have_now;
++    } else {
++      parser->m_partialTokenBytesBefore =3D 0;
++    }
+   }
+   return ret;
+ }
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0005.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0005.patch
new file mode 100644
index 0000000000..d4e112db58
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0005.patch
@@ -0,0 +1,69 @@
+From 09957b8ced725b96a95acff150facda93f03afe1 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Thu, 26 Oct 2023 10:41:00 +0200
+Subject: [PATCH] Allow XML_GetBuffer() with len=3D0 on a fresh parser
+
+len=3D0 was previously OK if there had previously been a non-zero call.
+It makes sense to allow an application to work the same way on a
+newly-created parser, and not have to care if its incoming buffer
+happens to be 0.
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/0=
9957b8ced725b96a95acff150facda93f03afe1]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 5c66f54..5b112c6 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2095,7 +2095,8 @@ XML_GetBuffer(XML_Parser parser, int len) {
+   default:;
+   }
+=20
+-  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEn=
d)) {
++  if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEn=
d)
++      || parser->m_buffer =3D=3D NULL) {
+ #ifdef XML_CONTEXT_BYTES
+     int keep;
+ #endif /* defined XML_CONTEXT_BYTES */
+@@ -2118,8 +2119,9 @@ XML_GetBuffer(XML_Parser parser, int len) {
+     }
+     neededSize +=3D keep;
+ #endif /* defined XML_CONTEXT_BYTES */
+-    if (neededSize
+-        <=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_buffer)=
) {
++    if (parser->m_buffer && parser->m_bufferPtr
++        && neededSize
++               <=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_=
buffer)) {
+ #ifdef XML_CONTEXT_BYTES
+       if (keep < EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buf=
fer)) {
+         int offset
+@@ -2133,14 +2135,12 @@ XML_GetBuffer(XML_Parser parser, int len) {
+         parser->m_bufferPtr -=3D offset;
+       }
+ #else
+-      if (parser->m_buffer && parser->m_bufferPtr) {
+-        memmove(parser->m_buffer, parser->m_bufferPtr,
+-                EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buff=
erPtr));
+-        parser->m_bufferEnd
+-            =3D parser->m_buffer
+-              + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buff=
erPtr);
+-        parser->m_bufferPtr =3D parser->m_buffer;
+-      }
++       memmove(parser->m_buffer, parser->m_bufferPtr,
++              EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buffer=
Ptr));
++      parser->m_bufferEnd
++          =3D parser->m_buffer
++            + EXPAT_SAFE_PTR_DIFF(parser->m_bufferEnd, parser->m_buffer=
Ptr);
++      parser->m_bufferPtr =3D parser->m_buffer;
+ #endif /* not defined XML_CONTEXT_BYTES */
+     } else {
+       char *newBuf;
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0006.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0006.patch
new file mode 100644
index 0000000000..c1fb4893ed
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0006.patch
@@ -0,0 +1,67 @@
+From 9fe3672459c1bf10926b85f013aa1b623d855545 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Mon, 18 Sep 2023 20:32:55 +0200
+Subject: [PATCH] tests: Run both with and without partial token heuristi=
c
+
+If we always run with the heuristic enabled, it may hide some bugs by
+grouping up input into bigger parse attempts.
+
+CI-fighting-assistance-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/9=
fe3672459c1bf10926b85f013aa1b623d855545]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/internal.h | 3 +++
+ lib/xmlparse.c | 5 ++++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/internal.h b/lib/internal.h
+index 03c8fde..1df417f 100644
+--- a/lib/internal.h
++++ b/lib/internal.h
+@@ -31,6 +31,7 @@
+    Copyright (c) 2016-2022 Sebastian Pipping <sebastian@pipping.org>
+    Copyright (c) 2018      Yury Gribov <tetra2005@gmail.com>
+    Copyright (c) 2019      David Loffredo <loffredo@steptools.com>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.=
com>
+    Licensed under the MIT license:
+=20
+    Permission is  hereby granted,  free of charge,  to any  person obta=
ining
+@@ -160,6 +161,8 @@ unsigned long long testingAccountingGetCountBytesInd=
irect(XML_Parser parser);
+ const char *unsignedCharToPrintable(unsigned char c);
+ #endif
+=20
++extern XML_Bool g_reparseDeferralEnabledDefault; // written ONLY in run=
tests.c
++						 //
+ #ifdef __cplusplus
+ }
+ #endif
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 5b112c6..be6dd92 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -615,6 +615,8 @@ static unsigned long getDebugLevel(const char *varia=
bleName,
+        ? 0                                                             =
        \
+        : ((*((pool)->ptr)++ =3D c), 1))
+=20
++XML_Bool g_reparseDeferralEnabledDefault =3D XML_TRUE; // write ONLY in=
 runtests.c
++						     //
+ struct XML_ParserStruct {
+   /* The first member must be m_userData so that the XML_GetUserData
+      macro works. */
+@@ -967,7 +969,8 @@ callProcessor(XML_Parser parser, const char *start, =
const char *end,
+               const char **endPtr) {
+   const size_t have_now =3D EXPAT_SAFE_PTR_DIFF(end, start);
+=20
+-  if (! parser->m_parsingStatus.finalBuffer) {
++  if (g_reparseDeferralEnabledDefault
++      && ! parser->m_parsingStatus.finalBuffer) {
+     // Heuristic: don't try to parse a partial token again until the am=
ount of
+     // available data has increased significantly.
+     const size_t had_before =3D parser->m_partialTokenBytesBefore;
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0007.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0007.patch
new file mode 100644
index 0000000000..e2fb35eae6
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0007.patch
@@ -0,0 +1,159 @@
+From 1d3162da8a85a398ab451aadd6c2ad19587e5a68 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Mon, 11 Sep 2023 15:31:24 +0200
+Subject: [PATCH] Add app setting for enabling/disabling reparse heuristi=
c
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+CI-fighting-assistance-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
d3162da8a85a398ab451aadd6c2ad19587e5a68]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ doc/reference.html     | 30 ++++++++++++++++++++++++------
+ lib/expat.h            |  5 +++++
+ lib/libexpat.def.cmake |  2 ++
+ lib/xmlparse.c         | 13 ++++++++++++-
+ 4 files changed, 43 insertions(+), 7 deletions(-)
+
+diff --git a/doc/reference.html b/doc/reference.html
+index 9953aa7..7dd9370 100644
+--- a/doc/reference.html
++++ b/doc/reference.html
+@@ -151,10 +151,11 @@ interface.</p>
+     </ul>
+     </li>
+     <li>
+-      <a href=3D"#billion-laughs">Billion Laughs Attack Protection</a>
++      <a href=3D"#attack-protection">Attack Protection</a>
+       <ul>
+         <li><a href=3D"#XML_SetBillionLaughsAttackProtectionMaximumAmpl=
ification">XML_SetBillionLaughsAttackProtectionMaximumAmplification</a></=
li>
+         <li><a href=3D"#XML_SetBillionLaughsAttackProtectionActivationT=
hreshold">XML_SetBillionLaughsAttackProtectionActivationThreshold</a></li=
>
++	<li><a href=3D"#XML_SetReparseDeferralEnabled">XML_SetReparseDeferralE=
nabled</a></li>
+       </ul>
+     </li>
+     <li><a href=3D"#miscellaneous">Miscellaneous Functions</a>
+@@ -2123,11 +2124,7 @@ parse position may be before the beginning of the=
 buffer.</p>
+ return NULL.</p>
+ </div>
+=20
+-<h3><a name=3D"billion-laughs">Billion Laughs Attack Protection</a></h3=
>
+-
+-<p>The functions in this section configure the built-in
+-  protection against various forms of
+-  <a href=3D"https://en.wikipedia.org/wiki/Billion_laughs_attack">billi=
on laughs attacks</a>.</p>
++<h3><a name=3D"attack-protection">Attack Protection</a><a name=3D"billi=
on-laughs"></a></h3>
+=20
+ <h4 id=3D"XML_SetBillionLaughsAttackProtectionMaximumAmplification">XML=
_SetBillionLaughsAttackProtectionMaximumAmplification</h4>
+ <pre class=3D"fcndec">
+@@ -2215,6 +2212,27 @@ XML_SetBillionLaughsAttackProtectionActivationThr=
eshold(XML_Parser p,
+   </p>
+ </div>
+=20
++<h4 id=3D"XML_SetReparseDeferralEnabled">XML_SetReparseDeferralEnabled<=
/h4>
++<pre class=3D"fcndec">
++/* Added in Expat 2.6.0. */
++XML_Bool XMLCALL
++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled);
++</pre>
++<div class=3D"fcndef">
++  <p>
++    Large tokens may require many parse calls before enough data is ava=
ilable for Expat to parse it in full.
++    If Expat retried parsing the token on every parse call, parsing cou=
ld take quadratic time.
++    To avoid this, Expat only retries once a significant amount of new =
data is available.
++    This function allows disabling this behavior.
++  </p>
++  <p>
++    The <code>enabled</code> argument should be <code>XML_TRUE</code> o=
r <code>XML_FALSE</code>.
++  </p>
++  <p>
++    Returns <code>XML_TRUE</code> on success, and <code>XML_FALSE</code=
> on error.
++  </p>
++</div>
++
+ <h3><a name=3D"miscellaneous">Miscellaneous functions</a></h3>
+=20
+ <p>The functions in this section either obtain state information from
+diff --git a/lib/expat.h b/lib/expat.h
+index 9e64174..73dda6d 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -16,6 +16,7 @@
+    Copyright (c) 2016      Thomas Beutlich <tc@tbeu.de>
+    Copyright (c) 2017      Rhodri James <rhodri@wildebeest.org.uk>
+    Copyright (c) 2022      Thijs Schreijer <thijs@thijsschreijer.nl>
++   Copyright (c) 2023      Sony Corporation / Snild Dolkow <snild@sony.=
com>
+    Licensed under the MIT license:
+=20
+    Permission is  hereby granted,  free of charge,  to any  person obta=
ining
+@@ -1054,6 +1055,10 @@ XML_SetBillionLaughsAttackProtectionActivationThr=
eshold(
+     XML_Parser parser, unsigned long long activationThresholdBytes);
+ #endif
+=20
++/* Added in Expat 2.6.0. */
++XMLPARSEAPI(XML_Bool)
++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled);
++
+ /* Expat follows the semantic versioning convention.
+    See http://semver.org.
+ */
+diff --git a/lib/libexpat.def.cmake b/lib/libexpat.def.cmake
+index 61a4f00..10ee9cd 100644
+--- a/lib/libexpat.def.cmake
++++ b/lib/libexpat.def.cmake
+@@ -77,3 +77,5 @@ EXPORTS
+ ; added with version 2.4.0
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionActivati=
onThreshold @69
+ @_EXPAT_COMMENT_DTD_OR_GE@ XML_SetBillionLaughsAttackProtectionMaximumA=
mplification @70
++; added with version 2.6.0
++  XML_SetReparseDeferralEnabled @71
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index be6dd92..8cf32e0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -633,6 +633,7 @@ struct XML_ParserStruct {
+   XML_Index m_parseEndByteIndex;
+   const char *m_parseEndPtr;
+   size_t m_partialTokenBytesBefore; /* used in heuristic to avoid O(n^2=
) */
++  XML_Bool m_reparseDeferralEnabled;
+   XML_Char *m_dataBuf;
+   XML_Char *m_dataBufEnd;
+   XML_StartElementHandler m_startElementHandler;
+@@ -969,7 +970,7 @@ callProcessor(XML_Parser parser, const char *start, =
const char *end,
+               const char **endPtr) {
+   const size_t have_now =3D EXPAT_SAFE_PTR_DIFF(end, start);
+=20
+-  if (g_reparseDeferralEnabledDefault
++  if (parser->m_reparseDeferralEnabled
+       && ! parser->m_parsingStatus.finalBuffer) {
+     // Heuristic: don't try to parse a partial token again until the am=
ount of
+     // available data has increased significantly.
+@@ -1175,6 +1176,7 @@ parserInit(XML_Parser parser, const XML_Char *enco=
dingName) {
+   parser->m_parseEndByteIndex =3D 0;
+   parser->m_parseEndPtr =3D NULL;
+   parser->m_partialTokenBytesBefore =3D 0;
++  parser->m_reparseDeferralEnabled =3D g_reparseDeferralEnabledDefault;
+   parser->m_declElementType =3D NULL;
+   parser->m_declAttributeId =3D NULL;
+   parser->m_declEntity =3D NULL;
+@@ -2601,6 +2603,15 @@ XML_SetBillionLaughsAttackProtectionActivationThr=
eshold(
+ }
+ #endif /* XML_GE =3D=3D 1 */
+=20
++XML_Bool XMLCALL
++XML_SetReparseDeferralEnabled(XML_Parser parser, XML_Bool enabled) {
++  if (parser !=3D NULL && (enabled =3D=3D XML_TRUE || enabled =3D=3D XM=
L_FALSE)) {
++    parser->m_reparseDeferralEnabled =3D enabled;
++    return XML_TRUE;
++  }
++  return XML_FALSE;
++}
++
+ /* Initially tag->rawName always points into the parse buffer;
+    for those TAG instances opened while the current parse buffer was
+    processed, and not yet closed, we need to store tag->rawName in a mo=
re
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0008.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0008.patch
new file mode 100644
index 0000000000..fa25fcd2db
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0008.patch
@@ -0,0 +1,95 @@
+From 8ddd8e86aa446d02eb8d398972d3b10d4cad908a Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Fri, 29 Sep 2023 10:14:59 +0200
+Subject: [PATCH] Try to parse even when incoming len is zero
+
+If the reparse deferral setting has changed, it may be possible to
+finish a token.
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8=
ddd8e86aa446d02eb8d398972d3b10d4cad908a]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 55 ++++++++------------------------------------------
+ 1 file changed, 8 insertions(+), 47 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8cf32e0..f4ff66e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1896,46 +1896,8 @@ XML_Parse(XML_Parser parser, const char *s, int l=
en, int isFinal) {
+     parser->m_parsingStatus.parsing =3D XML_PARSING;
+   }
+=20
+-  if (len =3D=3D 0) {
+-    parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+-    if (! isFinal)
+-      return XML_STATUS_OK;
+-    parser->m_positionPtr =3D parser->m_bufferPtr;
+-    parser->m_parseEndPtr =3D parser->m_bufferEnd;
+-
+-    /* If data are left over from last buffer, and we now know that the=
se
+-       data are the final chunk of input, then we have to check them ag=
ain
+-       to detect errors based on that fact.
+-    */
+-    parser->m_errorCode
+-        =3D callProcessor(parser, parser->m_bufferPtr, parser->m_parseE=
ndPtr,
+-                        &parser->m_bufferPtr);
+-
+-    if (parser->m_errorCode =3D=3D XML_ERROR_NONE) {
+-      switch (parser->m_parsingStatus.parsing) {
+-      case XML_SUSPENDED:
+-        /* While we added no new data, the finalBuffer flag may have ca=
used
+-         * us to parse previously-unparsed data in the internal buffer.
+-         * If that triggered a callback to the application, it would ha=
ve
+-         * had an opportunity to suspend parsing. */
+-        XmlUpdatePosition(parser->m_encoding, parser->m_positionPtr,
+-                          parser->m_bufferPtr, &parser->m_position);
+-        parser->m_positionPtr =3D parser->m_bufferPtr;
+-        return XML_STATUS_SUSPENDED;
+-      case XML_INITIALIZED:
+-      case XML_PARSING:
+-        parser->m_parsingStatus.parsing =3D XML_FINISHED;
+-        /* fall through */
+-      default:
+-        return XML_STATUS_OK;
+-      }
+-    }
+-    parser->m_eventEndPtr =3D parser->m_eventPtr;
+-    parser->m_processor =3D errorProcessor;
+-    return XML_STATUS_ERROR;
+-  }
+ #ifndef XML_CONTEXT_BYTES
+-  else if (parser->m_bufferPtr =3D=3D parser->m_bufferEnd) {
++  if (parser->m_bufferPtr =3D=3D parser->m_bufferEnd) {
+     const char *end;
+     int nLeftOver;
+     enum XML_Status result;
+@@ -2006,15 +1968,14 @@ XML_Parse(XML_Parser parser, const char *s, int =
len, int isFinal) {
+     return result;
+   }
+ #endif /* not defined XML_CONTEXT_BYTES */
+-  else {
+-    void *buff =3D XML_GetBuffer(parser, len);
+-    if (buff =3D=3D NULL)
+-      return XML_STATUS_ERROR;
+-    else {
+-      memcpy(buff, s, len);
+-      return XML_ParseBuffer(parser, len, isFinal);
+-    }
++  void *buff =3D XML_GetBuffer(parser, len);
++  if (buff =3D=3D NULL)
++    return XML_STATUS_ERROR;
++  if (len > 0) {
++    assert(s !=3D NULL); // make sure s=3D=3DNULL && len!=3D0 was rejec=
ted above
++    memcpy(buff, s, len);
+   }
++  return XML_ParseBuffer(parser, len, isFinal);
+ }
+=20
+ enum XML_Status XMLCALL
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0009.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0009.patch
new file mode 100644
index 0000000000..9c1157faac
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0009.patch
@@ -0,0 +1,52 @@
+From ad9c01be8ee5d3d5cac2bfd3949ad764541d35e7 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Thu, 26 Oct 2023 13:55:02 +0200
+Subject: [PATCH]  Make external entity parser inherit partial token heur=
istic=20
+ setting
+
+The test is essentially a copy of the existing test for the setter,
+adapted to run on the external parser instead of the original one.
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+CI-fighting-assistance-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/a=
d9c01be8ee5d3d5cac2bfd3949ad764541d35e7]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index f4ff66e..6746d70 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1346,6 +1346,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
r, const XML_Char *context,
+      to worry which hash secrets each table has.
+   */
+   unsigned long oldhash_secret_salt;
++  XML_Bool oldReparseDeferralEnabled;
+=20
+   /* Validate the oldParser parameter before we pull everything out of =
it */
+   if (oldParser =3D=3D NULL)
+@@ -1390,6 +1391,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
r, const XML_Char *context,
+      to worry which hash secrets each table has.
+   */
+   oldhash_secret_salt =3D parser->m_hash_secret_salt;
++  oldReparseDeferralEnabled =3D parser->m_reparseDeferralEnabled;
+=20
+ #ifdef XML_DTD
+   if (! context)
+@@ -1442,6 +1444,7 @@ XML_ExternalEntityParserCreate(XML_Parser oldParse=
r, const XML_Char *context,
+   parser->m_defaultExpandInternalEntities =3D oldDefaultExpandInternalE=
ntities;
+   parser->m_ns_triplets =3D oldns_triplets;
+   parser->m_hash_secret_salt =3D oldhash_secret_salt;
++  parser->m_reparseDeferralEnabled =3D oldReparseDeferralEnabled;
+   parser->m_parentParser =3D oldParser;
+ #ifdef XML_DTD
+   parser->m_paramEntityParsing =3D oldParamEntityParsing;
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0010.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0010.patch
new file mode 100644
index 0000000000..3fbf69de08
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0010.patch
@@ -0,0 +1,111 @@
+From 60b74209899a67d426d208662674b55a5eed918c Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Wed, 4 Oct 2023 16:00:14 +0200
+Subject: [PATCH] Bypass partial token heuristic when close to maximum bu=
ffer=20
+ size
+
+For huge tokens, we may end up in a situation where the partial token
+parse deferral heuristic demands more bytes than Expat's maximum buffer
+size (currently ~half of INT_MAX) could fit.
+
+INT_MAX/2 is 1024 MiB on most systems. Clearly, a token of 950 MiB could
+fit in that buffer, but the reparse threshold might be such that
+callProcessor() will defer it, allowing the app to keep filling the
+buffer until XML_GetBuffer() eventually returns a memory error.
+
+By bypassing the heuristic when we're getting close to the maximum
+buffer size, it will once again be possible to parse tokens in the size
+range INT_MAX/2/ratio < size < INT_MAX/2 reliably.
+
+We subtract the last buffer fill size as a way to detect that the next
+XML_GetBuffer() call has a risk of returning a memory error -- assuming
+that the application is likely to keep using the same (or smaller) fill.
+
+We subtract XML_CONTEXT_BYTES because that's the maximum amount of bytes
+that could remain at the start of the buffer, preceding the partial
+token. Technically, it could be fewer bytes, but XML_CONTEXT_BYTES is
+normally small relative to INT_MAX, and is much simpler to use.
+
+Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/6=
0b74209899a67d426d208662674b55a5eed918c]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 6746d70..32c57f6 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -205,6 +205,8 @@ typedef char ICHAR;
+ /* Do safe (NULL-aware) pointer arithmetic */
+ #define EXPAT_SAFE_PTR_DIFF(p, q) (((p) && (q)) ? ((p) - (q)) : 0)
+=20
++#define EXPAT_MIN(a, b) (((a) < (b)) ? (a) : (b))
++
+ #include "internal.h"
+ #include "xmltok.h"
+ #include "xmlrole.h"
+@@ -634,6 +636,7 @@ struct XML_ParserStruct {
+   const char *m_parseEndPtr;
+   size_t m_partialTokenBytesBefore; /* used in heuristic to avoid O(n^2=
) */
+   XML_Bool m_reparseDeferralEnabled;
++  int m_lastBufferRequestSize;
+   XML_Char *m_dataBuf;
+   XML_Char *m_dataBufEnd;
+   XML_StartElementHandler m_startElementHandler;
+@@ -975,7 +978,18 @@ callProcessor(XML_Parser parser, const char *start,=
 const char *end,
+     // Heuristic: don't try to parse a partial token again until the am=
ount of
+     // available data has increased significantly.
+     const size_t had_before =3D parser->m_partialTokenBytesBefore;
+-    const bool enough =3D (have_now >=3D 2 * had_before);
++    // ...but *do* try anyway if we're close to reaching the max buffer=
 size.
++    size_t close_to_maxbuf =3D INT_MAX / 2 + (INT_MAX & 1); // round up
++#if XML_CONTEXT_BYTES > 0
++    // subtract XML_CONTEXT_BYTES, but don't go below zero
++    close_to_maxbuf -=3D EXPAT_MIN(close_to_maxbuf, XML_CONTEXT_BYTES);
++#endif
++    // subtract the last buffer fill size, but don't go below zero
++    // m_lastBufferRequestSize is never assigned a value < 0, so the ca=
st is ok
++    close_to_maxbuf
++        -=3D EXPAT_MIN(close_to_maxbuf, (size_t)parser->m_lastBufferReq=
uestSize);
++    const bool enough
++        =3D (have_now >=3D 2 * had_before) || (have_now > close_to_maxb=
uf);
+=20
+     if (! enough) {
+       *endPtr =3D start; // callers may expect this to be set
+@@ -1177,6 +1191,7 @@ parserInit(XML_Parser parser, const XML_Char *enco=
dingName) {
+   parser->m_parseEndPtr =3D NULL;
+   parser->m_partialTokenBytesBefore =3D 0;
+   parser->m_reparseDeferralEnabled =3D g_reparseDeferralEnabledDefault;
++  parser->m_lastBufferRequestSize =3D 0;
+   parser->m_declElementType =3D NULL;
+   parser->m_declAttributeId =3D NULL;
+   parser->m_declEntity =3D NULL;
+@@ -1911,6 +1926,9 @@ XML_Parse(XML_Parser parser, const char *s, int le=
n, int isFinal) {
+       parser->m_processor =3D errorProcessor;
+       return XML_STATUS_ERROR;
+     }
++    // though this isn't a buffer request, we assume that `len` is the =
app's
++    // preferred buffer fill size, and therefore save it here.
++    parser->m_lastBufferRequestSize =3D len;
+     parser->m_parseEndByteIndex +=3D len;
+     parser->m_positionPtr =3D s;
+     parser->m_parsingStatus.finalBuffer =3D (XML_Bool)isFinal;
+@@ -2064,6 +2082,9 @@ XML_GetBuffer(XML_Parser parser, int len) {
+   default:;
+   }
+=20
++  // whether or not the request succeeds, `len` seems to be the app's p=
referred
++  // buffer fill size; remember it.
++  parser->m_lastBufferRequestSize =3D len;
+   if (len > EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferEn=
d)
+       || parser->m_buffer =3D=3D NULL) {
+ #ifdef XML_CONTEXT_BYTES
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0011.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0011.patch
new file mode 100644
index 0000000000..800aaff544
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0011.patch
@@ -0,0 +1,89 @@
+From 3d8141d26a3b01ff948e00956cb0723a89dadf7f Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Mon, 20 Nov 2023 16:11:24 +0100
+Subject: [PATCH] Bypass partial token heuristic when nearing full buffer
+
+...instead of only when approaching the maximum buffer size INT/2+1.
+
+We'd like to give applications a chance to finish parsing a large token
+before buffer reallocation, in case the reallocation fails.
+
+By bypassing the reparse deferral heuristic when getting close to the
+filling the buffer, we give them this chance -- if the whole token is
+present in the buffer, it will be parsed at that time.
+
+This may come at the cost of some extra reparse attempts. For a token
+of n bytes, these extra parses cause us to scan over a maximum of
+2n bytes (... + n/8 + n/4 + n/2 + n). Therefore, parsing of big tokens
+remains O(n) in regard how many bytes we scan in attempts to parse. The
+cost in reality is lower than that, since the reparses that happen due
+to the bypass will affect m_partialTokenBytesBefore, delaying the next
+ratio-based reparse. Furthermore, only the first token that "breaks
+through" a buffer ceiling takes that extra reparse attempt; subsequent
+large tokens will only bypass the heuristic if they manage to hit the
+new buffer ceiling.
+
+Note that this cost analysis depends on the assumption that Expat grows
+its buffer by doubling it (or, more generally, grows it exponentially).
+If this changes, the cost of this bypass may increase. Hopefully, this
+would be caught by test_big_tokens_take_linear_time or the new test.
+
+The bypass logic assumes that the application uses a consistent fill.
+If the app increases its fill size, it may miss the bypass (and the
+normal heuristic will apply). If the app decreases its fill size, the
+bypass may be hit multiple times for the same buffer size. The very
+worst case would be to always fill half of the remaining buffer space,
+in which case parsing of a large n-byte token becomes O(n log n).
+
+As an added bonus, the new test case should be faster than the old one,
+since it doesn't have to go all the way to 1GiB to check the behavior.
+
+Finally, this change necessitated a small modification to two existing
+tests related to reparse deferral. These tests are testing the deferral
+enabled setting, and assume that reparsing will not happen for any other
+reason. By pre-growing the buffer, we make sure that this new deferral
+does not affect those test cases.
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/3=
d8141d26a3b01ff948e00956cb0723a89dadf7f]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 32c57f6..2830c1e 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -978,18 +978,18 @@ callProcessor(XML_Parser parser, const char *start=
, const char *end,
+     // Heuristic: don't try to parse a partial token again until the am=
ount of
+     // available data has increased significantly.
+     const size_t had_before =3D parser->m_partialTokenBytesBefore;
+-    // ...but *do* try anyway if we're close to reaching the max buffer=
 size.
+-    size_t close_to_maxbuf =3D INT_MAX / 2 + (INT_MAX & 1); // round up
++    // ...but *do* try anyway if we're close to causing a reallocation.
++    size_t available_buffer
++        =3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buffer);
+ #if XML_CONTEXT_BYTES > 0
+-    // subtract XML_CONTEXT_BYTES, but don't go below zero
+-    close_to_maxbuf -=3D EXPAT_MIN(close_to_maxbuf, XML_CONTEXT_BYTES);
++      available_buffer -=3D EXPAT_MIN(available_buffer, XML_CONTEXT_BYT=
ES);
+ #endif
+-    // subtract the last buffer fill size, but don't go below zero
++    available_buffer
++        +=3D EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_bufferE=
nd);
+     // m_lastBufferRequestSize is never assigned a value < 0, so the ca=
st is ok
+-    close_to_maxbuf
+-        -=3D EXPAT_MIN(close_to_maxbuf, (size_t)parser->m_lastBufferReq=
uestSize);
+     const bool enough
+-        =3D (have_now >=3D 2 * had_before) || (have_now > close_to_maxb=
uf);
++         =3D (have_now >=3D 2 * had_before)
++          || ((size_t)parser->m_lastBufferRequestSize > available_buffe=
r);
+=20
+     if (! enough) {
+       *endPtr =3D start; // callers may expect this to be set
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat/CVE-2023-52425-0012.patch b/me=
ta/recipes-core/expat/expat/CVE-2023-52425-0012.patch
new file mode 100644
index 0000000000..8693e9449e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2023-52425-0012.patch
@@ -0,0 +1,87 @@
+From 119ae277abaabd4d17b2e64300fec712ef403b28 Mon Sep 17 00:00:00 2001
+From: Snild Dolkow <snild@sony.com>
+Date: Thu, 28 Sep 2023 18:26:19 +0200
+Subject: [PATCH] Grow buffer based on current size Until now, the buffer=
 size
+ to grow to has been calculated based on the distance from the current p=
arse
+ position to the end of the buffer. This means that the size of any
+ already-parsed data was not considered, leading to inconsistent buffer
+ growth.
+
+There was also a special case in XML_Parse() when XML_CONTEXT_BYTES was
+zero, where the buffer size would be set to twice the incoming string
+length. This patch replaces this with an XML_GetBuffer() call.
+
+Growing the buffer based on its total size makes its growth consistent.
+
+The commit includes a test that checks that we can reach the max buffer
+size (usually INT_MAX/2 + 1) regardless of previously parsed content.
+
+GitHub CI couldn't allocate the full 1GiB with MinGW/wine32, though it
+works locally with the same compiler and wine version. As a workaround,
+the test tries to malloc 1GiB, and reduces `maxbuf` to 512MiB in case
+of failure.
+
+CVE: CVE-2023-52425
+
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1=
19ae277abaabd4d17b2e64300fec712ef403b28]
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/xmlparse.c | 33 ++++++++++++++++-----------------
+ 1 file changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2830c1e..81f9bb3 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -1961,23 +1961,22 @@ XML_Parse(XML_Parser parser, const char *s, int =
len, int isFinal) {
+                       &parser->m_position);
+     nLeftOver =3D s + len - end;
+     if (nLeftOver) {
+-      if (parser->m_buffer =3D=3D NULL
+-          || nLeftOver > parser->m_bufferLim - parser->m_buffer) {
+-        /* avoid _signed_ integer overflow */
+-        char *temp =3D NULL;
+-        const int bytesToAllocate =3D (int)((unsigned)len * 2U);
+-        if (bytesToAllocate > 0) {
+-          temp =3D (char *)REALLOC(parser, parser->m_buffer, bytesToAll=
ocate);
+-        }
+-        if (temp =3D=3D NULL) {
+-          parser->m_errorCode =3D XML_ERROR_NO_MEMORY;
+-          parser->m_eventPtr =3D parser->m_eventEndPtr =3D NULL;
+-          parser->m_processor =3D errorProcessor;
+-          return XML_STATUS_ERROR;
+-        }
+-        parser->m_buffer =3D temp;
+-        parser->m_bufferLim =3D parser->m_buffer + bytesToAllocate;
++       // Back up and restore the parsing status to avoid XML_ERROR_SUS=
PENDED
++      // (and XML_ERROR_FINISHED) from XML_GetBuffer.
++      const enum XML_Parsing originalStatus =3D parser->m_parsingStatus=
.parsing;
++      parser->m_parsingStatus.parsing =3D XML_PARSING;
++      void *const temp =3D XML_GetBuffer(parser, nLeftOver);
++      parser->m_parsingStatus.parsing =3D originalStatus;
++      if (temp =3D=3D NULL) {
++        // NOTE: parser->m_errorCode has already been set by XML_GetBuf=
fer().
++        parser->m_eventPtr =3D parser->m_eventEndPtr =3D NULL;
++        parser->m_processor =3D errorProcessor;
++        return XML_STATUS_ERROR;
+       }
++      // Since we know that the buffer was empty and XML_CONTEXT_BYTES =
is 0, we
++      // don't have any data to preserve, and can copy straight into th=
e start
++      // of the buffer rather than the GetBuffer return pointer (which =
may be
++      // pointing further into the allocated buffer).
+       memcpy(parser->m_buffer, end, nLeftOver);
+     }
+     parser->m_bufferPtr =3D parser->m_buffer;
+@@ -2135,7 +2134,7 @@ XML_GetBuffer(XML_Parser parser, int len) {
+     } else {
+       char *newBuf;
+       int bufferSize
+-          =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_b=
ufferPtr);
++          =3D (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferLim, parser->m_b=
uffer);
+       if (bufferSize =3D=3D 0)
+         bufferSize =3D INIT_BUFFER_SIZE;
+       do {
+--=20
+2.40.0
+
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/e=
xpat/expat_2.5.0.bb
index 31e989cfe2..b7b5cce925 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -22,6 +22,18 @@ SRC_URI =3D "https://github.com/libexpat/libexpat/rele=
ases/download/R_${VERSION_TA
 	   file://CVE-2023-52426-009.patch \
 	   file://CVE-2023-52426-010.patch \
 	   file://CVE-2023-52426-011.patch \
+	   file://CVE-2023-52425-0001.patch \
+           file://CVE-2023-52425-0002.patch \
+           file://CVE-2023-52425-0003.patch \
+           file://CVE-2023-52425-0004.patch \
+           file://CVE-2023-52425-0005.patch \
+           file://CVE-2023-52425-0006.patch \
+           file://CVE-2023-52425-0007.patch \
+           file://CVE-2023-52425-0008.patch \
+           file://CVE-2023-52425-0009.patch \
+           file://CVE-2023-52425-0010.patch \
+           file://CVE-2023-52425-0011.patch \
+	   file://CVE-2023-52425-0012.patch \
            "
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/libexpat/libexpat/releases/"
--=20
2.40.0


