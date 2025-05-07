Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1909C3ABB6
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 04:58:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1003.1746593913198366485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 21:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72228a98f6=divya.chellam@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5474U3rm029484
	for <openembedded-core@lists.openembedded.org>; Tue, 6 May 2025 21:58:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46djnjutrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 21:58:32 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 6 May 2025 21:58:30 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][styhead][PATCH 2/3] ruby :fix CVE-2025-27220
Date: Wed, 7 May 2025 04:58:04 +0000
Message-ID: <20250507045805.1210982-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250507045805.1210982-1-divya.chellam@windriver.com>
References: <20250507045805.1210982-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA0MyBTYWx0ZWRfX92pxp4526Tlb TwZ3Hbrrmbnru9iUrdKtffGhLzDgYn7kzS/B3MmcOpeNYpy30PoHVOzUOGbRgHkiXQjUm42brbH 1NIJERIQ0gmV2KN0PRQLvx0xiBgOD3kjson30XBUh7eKMujePhcPho5a81Sd2R9M29gkMzXEngt
 hEa8aQG9scf9WyM4AJHflayqKgAkY4WdLzyzUSLDuTZdaQVspr+0AP9ZCvaAi/L0c2WVXOg/4E2 W54CcUhxgh5c8QxSRUdOTeOySsBoYZ7wg12z5vwOpOPxW3M6IbXvyppERCxpULlWNy6jFGLadbv lsP3Db24cvUMhf/yrnoZvoC6WnPfO+tynEZsZAninVtG/BiSn1TY5Duftuca8JemoO8YgDrnh/d
 mwD10jCmOK3Wo5zq2bh4RUjzlI3fzyHsAvKUN4mvuUouVtghuaWTs5oqF8wx8T2XQY95RP6y
X-Proofpoint-ORIG-GUID: MU0deWZYqbrfdq3nmwa-UWX-VZaUrOQB
X-Proofpoint-GUID: MU0deWZYqbrfdq3nmwa-UWX-VZaUrOQB
X-Authority-Analysis: v=2.4 cv=KdHSsRYD c=1 sm=1 tr=0 ts=681ae878 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=dt9VzEwgFbYA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8
 a=vtqi6Q1M_KoHZG1lmhYA:9 a=rCQTDf3W91zKeElX:21 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=800
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505070043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 04:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216088

From: Divya Chellam <divya.chellam@windriver.com>

In the CGI gem before 0.4.2 for Ruby, a Regular Expression Denial
of Service (ReDoS) vulnerability exists in the Util#escapeElement method.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-27220

Upstream-patch:
https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2025-27220.patch            | 78 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.3.4.bb      |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
new file mode 100644
index 0000000000..f2f8bc7f76
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2025-27220.patch
@@ -0,0 +1,78 @@
+From cd1eb08076c8b8e310d4d553d427763f2577a1b6 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 21 Feb 2025 15:53:31 +0900
+Subject: [PATCH] Escape/unescape unclosed tags as well
+
+Co-authored-by: Nobuyoshi Nakada <nobu@ruby-lang.org>
+
+CVE: CVE-2025-27220
+
+Upstream-Status: Backport [https://github.com/ruby/cgi/commit/cd1eb08076c8b8e310d4d553d427763f2577a1b6]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ lib/cgi/util.rb           |  4 ++--
+ test/cgi/test_cgi_util.rb | 18 ++++++++++++++++++
+ 2 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/lib/cgi/util.rb b/lib/cgi/util.rb
+index 4986e54..5f12eae 100644
+--- a/lib/cgi/util.rb
++++ b/lib/cgi/util.rb
+@@ -184,7 +184,7 @@ module CGI::Util
+   def escapeElement(string, *elements)
+     elements = elements[0] if elements[0].kind_of?(Array)
+     unless elements.empty?
+-      string.gsub(/<\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?>/i) do
++      string.gsub(/<\/?(?:#{elements.join("|")})\b[^<>]*+>?/im) do
+         CGI.escapeHTML($&)
+       end
+     else
+@@ -204,7 +204,7 @@ module CGI::Util
+   def unescapeElement(string, *elements)
+     elements = elements[0] if elements[0].kind_of?(Array)
+     unless elements.empty?
+-      string.gsub(/&lt;\/?(?:#{elements.join("|")})(?!\w)(?:.|\n)*?&gt;/i) do
++      string.gsub(/&lt;\/?(?:#{elements.join("|")})\b(?>[^&]+|&(?![gl]t;)\w+;)*(?:&gt;)?/im) do
+         unescapeHTML($&)
+       end
+     else
+diff --git a/test/cgi/test_cgi_util.rb b/test/cgi/test_cgi_util.rb
+index b0612fc..bff77f7 100644
+--- a/test/cgi/test_cgi_util.rb
++++ b/test/cgi/test_cgi_util.rb
+@@ -269,6 +269,14 @@ class CGIUtilTest < Test::Unit::TestCase
+     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<BR><A HREF="url"></A>', ["A", "IMG"]))
+     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', "A", "IMG"))
+     assert_equal("<BR>&lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<BR><A HREF="url"></A>', ["A", "IMG"]))
++
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', "A", "IMG"))
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escapeElement('<A <A HREF="url"></A>', ["A", "IMG"]))
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', "A", "IMG"))
++    assert_equal("&lt;A &lt;A HREF=&quot;url&quot;&gt;&lt;/A&gt;", escape_element('<A <A HREF="url"></A>', ["A", "IMG"]))
++
++    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', "A", "IMG"))
++    assert_equal("&lt;A &lt;A ", escapeElement('<A <A ', ["A", "IMG"]))
+   end
+ 
+ 
+@@ -277,6 +285,16 @@ class CGIUtilTest < Test::Unit::TestCase
+     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescapeElement(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
+     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), "A", "IMG"))
+     assert_equal('&lt;BR&gt;<A HREF="url"></A>', unescape_element(escapeHTML('<BR><A HREF="url"></A>'), ["A", "IMG"]))
++
++    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
++    assert_equal('<A <A HREF="url"></A>', unescapeElement(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
++    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), "A", "IMG"))
++    assert_equal('<A <A HREF="url"></A>', unescape_element(escapeHTML('<A <A HREF="url"></A>'), ["A", "IMG"]))
++
++    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), "A", "IMG"))
++    assert_equal('<A <A ', unescapeElement(escapeHTML('<A <A '), ["A", "IMG"]))
++    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), "A", "IMG"))
++    assert_equal('<A <A ', unescape_element(escapeHTML('<A <A '), ["A", "IMG"]))
+   end
+ end
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.4.bb b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
index a1a0aa5d31..b433fa01f9 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.4.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://CVE-2025-27219.patch \
+           file://CVE-2025-27220.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


