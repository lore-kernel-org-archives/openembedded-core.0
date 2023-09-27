Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0659E7F15A
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 03:40:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10139.1695785999084103959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 20:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cNRAfywA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76349d2722=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R1HsMf031936
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=EX4gz
	Jy2KdEKdUppQDKwlhFZt2OTsDCc1zzsQ1IISMc=; b=cNRAfywA7+zygyhJw8m8x
	hnMByf77QBZ8bPp4FxMI54nTyX07KOeO3W9YKVrvZsmsw0H1vMTqkkTAMiK6ksCt
	QTRzN2Atmy1WUWKUZlQYyUAGseyDTL5hO8rb/mW+VyUxba3eFc5ROXXifZjv5j8o
	QWMSBx9E2evnx53jCVXLKHcm/azT1m382MPZEhS3XbSr4/fXshg/LN8kFmYQYVEj
	ook5+pqK4oznSZuuFt2/u2Yon2yzT9NayGfT0qC3o9fdp/N3qpnsisrnKlkBMf/s
	sPQgkAdSuOXYGpltfXLqM8yDx86yXMyGA/3+v+NHNu5KIeEJ3g5tQU2OQT+twzhH
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x3h9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:39:58 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 20:39:53 -0700
From: Meenali Gupta <meenali.gupta@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] ruby: fix CVE-2023-36617
Date: Wed, 27 Sep 2023 03:39:35 +0000
Message-ID: <20230927033935.2086231-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: fEm74nRDQy7y5IB9FPTNIq0RfIakkits
X-Proofpoint-GUID: fEm74nRDQy7y5IB9FPTNIq0RfIakkits
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_19,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 03:40:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188288

Backport two patches [1] [2] to fix CVE-2023-36617

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../ruby/ruby/CVE-2023-36617_1.patch          | 52 +++++++++++++++++++
 .../ruby/ruby/CVE-2023-36617_2.patch          | 47 +++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
new file mode 100644
index 0000000000..57a15d302e
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_1.patch
@@ -0,0 +1,52 @@
+From 9c2eb12776c1b5df2517a7e618e5fe818cc3395e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 15:53:01 +0800
+Subject: [PATCH] ruby: Fix quadratic backtracking on invalid relative URI
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9010ee2536adda10a0555ae1ed6fe2f5808e6bf1]
+CVE: CVE-2023-36617
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/uri/rfc2396_parser.rb |  4 ++--
+ test/uri/test_parser.rb   | 12 ++++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/lib/uri/rfc2396_parser.rb b/lib/uri/rfc2396_parser.rb
+index 76a8f99..00c66cf 100644
+--- a/lib/uri/rfc2396_parser.rb
++++ b/lib/uri/rfc2396_parser.rb
+@@ -497,8 +497,8 @@ module URI
+       ret = {}
+
+       # for URI::split
+-      ret[:ABS_URI] = Regexp.new('\A\s*' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
+-      ret[:REL_URI] = Regexp.new('\A\s*' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:ABS_URI] = Regexp.new('\A\s*+' + pattern[:X_ABS_URI] + '\s*\z', Regexp::EXTENDED)
++      ret[:REL_URI] = Regexp.new('\A\s*+' + pattern[:X_REL_URI] + '\s*\z', Regexp::EXTENDED)
+
+       # for URI::extract
+       ret[:URI_REF]     = Regexp.new(pattern[:URI_REF])
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 03de137..01ed32a 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -63,4 +63,16 @@ class URI::TestParser < Test::Unit::TestCase
+     assert_equal("\u3042", p1.unescape('%e3%81%82'.force_encoding(Encoding::US_ASCII)))
+     assert_equal("\xe3\x83\x90\xe3\x83\x90", p1.unescape("\xe3\x83\x90%e3%83%90"))
+   end
++
++  def test_rfc2822_parse_relative_uri
++    pre = ->(length) {
++      " " * length + "\0"
++    }
++    parser = URI::RFC2396_Parser.new
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |uri|
++      assert_raise(URI::InvalidURIError) do
++        parser.split(uri)
++      end
++    end
++  end
+ end
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
new file mode 100644
index 0000000000..ff558183b6
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-36617_2.patch
@@ -0,0 +1,47 @@
+From eea5868120509c245216c4b5c2d4b5db1c593d0e Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 27 Jul 2023 16:16:30 +0800
+Subject: [PATCH] ruby: Fix quadratic backtracking on invalid port number
+
+Upstream-Status: Backport [https://github.com/ruby/uri/commit/9d7bcef1e6ad23c9c6e4932f297fb737888144c8]
+CVE: CVE-2023-36617
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/uri/rfc3986_parser.rb |  2 +-
+ test/uri/test_parser.rb   | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index 3c89311..cde3ea7 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -101,7 +101,7 @@ module URI
+         QUERY: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         FRAGMENT: /\A(?:%\h\h|[!$&-.0-;=@-Z_a-z~\/?])*\z/,
+         OPAQUE: /\A(?:[^\/].*)?\z/,
+-        PORT: /\A[\x09\x0a\x0c\x0d ]*\d*[\x09\x0a\x0c\x0d ]*\z/,
++        PORT: /\A[\x09\x0a\x0c\x0d ]*+\d*[\x09\x0a\x0c\x0d ]*\z/,
+       }
+     end
+
+diff --git a/test/uri/test_parser.rb b/test/uri/test_parser.rb
+index 01ed32a..81c2210 100644
+--- a/test/uri/test_parser.rb
++++ b/test/uri/test_parser.rb
+@@ -75,4 +75,14 @@ class URI::TestParser < Test::Unit::TestCase
+       end
+     end
+   end
++
++  def test_rfc3986_port_check
++    pre = ->(length) {"\t" * length + "a"}
++    uri = URI.parse("http://my.example.com")
++    assert_linear_performance((1..5).map {|i| 10**i}, pre: pre) do |port|
++      assert_raise(URI::InvalidComponentError) do
++        uri.port = port
++      end
++    end
++  end
+ end
+--
+2.40.0
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 72030508dd..228a2204db 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://CVE-2023-28756.patch \
            file://CVE-2023-28755.patch \
+           file://CVE-2023-36617_1.patch \
+           file://CVE-2023-36617_2.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


