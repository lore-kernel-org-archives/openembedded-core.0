Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F0FC2BBCA
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 12:26:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.71734.1718972751454338132
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 05:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=690294a050=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LAtcln008441
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 12:25:50 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yvrmurte7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 12:25:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 05:25:48 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ruby: fix CVE-2024-27280
Date: Fri, 21 Jun 2024 12:25:27 +0000
Message-ID: <20240621122527.2552863-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: rWS39odW096vK7BKHuq6fbX7KPaRagkS
X-Proofpoint-ORIG-GUID: rWS39odW096vK7BKHuq6fbX7KPaRagkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406210092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 12:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201022

From: Yogita Urade <yogita.urade@windriver.com>

A buffer-overread issue was discovered in StringIO 3.0.1, as
distributed in Ruby 3.0.x through 3.0.6 and 3.1.x through
3.1.4. The ungetbyte and ungetc methods on a StringIO can
read past the end of a string, and a subsequent call to
StringIO.gets may return the memory value. 3.0.3 is the main
fixed version; however, for Ruby 3.0 users, a fixed version
is stringio 3.0.1.1, and for Ruby 3.1 users, a fixed version
is stringio 3.0.1.2.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-27280

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ruby/ruby/CVE-2024-27280.patch            | 87 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch
new file mode 100644
index 0000000000..2595feb6e9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27280.patch
@@ -0,0 +1,87 @@
+From a35268a3ac1b5f0058e5b7c1a041a7e86d9da067 Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Mon, 10 Jun 2024 11:46:53 +0000
+Subject: [PATCH] Fix expanding size at ungetc/ungetbyte
+
+CVE: CVE-2024-27280
+Upstream-Status: Backport [https://github.com/ruby/stringio/commit/a35268a3ac1b5f0058e5b7c1a041a7e86d9da067]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ ext/stringio/stringio.c        |  2 +-
+ test/stringio/test_stringio.rb | 25 +++++++++++++++++++++----
+ 2 files changed, 22 insertions(+), 5 deletions(-)
+
+diff --git a/ext/stringio/stringio.c b/ext/stringio/stringio.c
+index 8df07e8..b2e8632 100644
+--- a/ext/stringio/stringio.c
++++ b/ext/stringio/stringio.c
+@@ -984,7 +984,7 @@ strio_unget_bytes(struct StringIO *ptr, const char *cp, long cl)
+     len = RSTRING_LEN(str);
+     rest = pos - len;
+     if (cl > pos) {
+-	long ex = (rest < 0 ? cl-pos : cl+rest);
++        long ex = cl - (rest < 0 ? pos : len);
+	rb_str_modify_expand(str, ex);
+	rb_str_set_len(str, len + ex);
+	s = RSTRING_PTR(str);
+diff --git a/test/stringio/test_stringio.rb b/test/stringio/test_stringio.rb
+index e0b4504..4853513 100644
+--- a/test/stringio/test_stringio.rb
++++ b/test/stringio/test_stringio.rb
+@@ -757,6 +757,15 @@ class TestStringIO < Test::Unit::TestCase
+     assert_equal("b""\0""a", s.string)
+   end
+
++  def test_ungetc_fill
++    count = 100
++    s = StringIO.new
++    s.print 'a' * count
++    s.ungetc('b' * (count * 5))
++    assert_equal((count * 5), s.string.size)
++    assert_match(/\Ab+\z/, s.string)
++  end
++
+   def test_ungetbyte_pos
+     b = '\\b00010001 \\B00010001 \\b1 \\B1 \\b000100011'
+     s = StringIO.new( b )
+@@ -782,6 +791,15 @@ class TestStringIO < Test::Unit::TestCase
+     assert_equal("b""\0""a", s.string)
+   end
+
++  def test_ungetbyte_fill
++    count = 100
++    s = StringIO.new
++    s.print 'a' * count
++    s.ungetbyte('b' * (count * 5))
++    assert_equal((count * 5), s.string.size)
++    assert_match(/\Ab+\z/, s.string)
++  end
++
+   def test_frozen
+     s = StringIO.new
+     s.freeze
+@@ -825,18 +843,17 @@ class TestStringIO < Test::Unit::TestCase
+   end
+
+   def test_overflow
+-    omit if RbConfig::SIZEOF["void*"] > RbConfig::SIZEOF["long"]
++    return if RbConfig::SIZEOF["void*"] > RbConfig::SIZEOF["long"]
+     limit = RbConfig::LIMITS["INTPTR_MAX"] - 0x10
+     assert_separately(%w[-rstringio], "#{<<-"begin;"}\n#{<<-"end;"}")
+     begin;
+       limit = #{limit}
+       ary = []
+-      while true
++      begin
+         x = "a"*0x100000
+         break if [x].pack("p").unpack("i!")[0] < 0
+         ary << x
+-        omit if ary.size > 100
+-      end
++      end while ary.size <= 100
+       s = StringIO.new(x)
+       s.gets("xxx", limit)
+       assert_equal(0x100000, s.pos)
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 4f7c9cb10b..63bb017839 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
            file://CVE-2024-27281.patch \
+           file://CVE-2024-27280.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


