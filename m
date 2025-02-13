Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35A0C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:17:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11983.1739456244485978839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4139f9b3b5=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DAU37Y031002
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:17:23 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44rnpbhm0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:17:23 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Feb 2025 06:17:20 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ruby: fix CVE-2024-41946
Date: Thu, 13 Feb 2025 14:16:58 +0000
Message-ID: <20250213141658.557319-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=B4lD0PtM c=1 sm=1 tr=0 ts=67adfef3 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=9JBM4MZNmYaMoez7xzYA:9 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yLanp9dWLKehMzgwjbiI6K15xJzwy5u8
X-Proofpoint-GUID: yLanp9dWLKehMzgwjbiI6K15xJzwy5u8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_06,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=919 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502130108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211335

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem 3.3.2 has a DoS
vulnerability when it parses an XML that has many entity expansions
with SAX2 or pull parser API. The REXML gem 3.3.3 or later include
the patch to fix the vulnerability.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-41946

Upstream-patch:
https://github.com/ruby/rexml/commit/033d1909a8f259d5a7c53681bcaf14f13bcf0368

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2024-41946.patch            | 117 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch
new file mode 100644
index 0000000000..0da383f9b9
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-41946.patch
@@ -0,0 +1,117 @@
+From 033d1909a8f259d5a7c53681bcaf14f13bcf0368 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Thu, 1 Aug 2024 09:20:31 +0900
+Subject: [PATCH] Add support for XML entity expansion limitation in SAX and 
+ pull parsers (#187)
+
+- Supported `REXML::Security.entity_expansion_limit=` in SAX and pull parsers
+- Supported `REXML::Security.entity_expansion_text_limit=` in SAX and pull parsers
+
+CVE: CVE-2024-41946
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/033d1909a8f259d5a7c53681bcaf14f13bcf0368]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 19 ++++++++++++++++++-
+ .../lib/rexml/parsers/pullparser.rb           |  4 ++++
+ .../lib/rexml/parsers/sax2parser.rb           |  4 ++++
+ 3 files changed, 26 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 661f0e2..e32c7f4 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -135,6 +135,7 @@ module REXML
+       def initialize( source )
+         self.stream = source
+         @listeners = []
++        @entity_expansion_count = 0
+         @attributes_scanner = StringScanner.new('')
+       end
+ 
+@@ -143,6 +144,7 @@ module REXML
+       end
+ 
+       attr_reader :source
++      attr_reader :entity_expansion_count
+ 
+       def stream=( source )
+         @source = SourceFactory.create_from( source )
+@@ -447,7 +449,9 @@ module REXML
+       def entity( reference, entities )
+         value = nil
+         value = entities[ reference ] if entities
+-        if not value
++        if value
++          record_entity_expansion
++        else
+           value = DEFAULT_ENTITIES[ reference ]
+           value = value[2] if value
+         end
+@@ -486,12 +490,17 @@ module REXML
+         }
+         matches.collect!{|x|x[0]}.compact!
+         if matches.size > 0
++          sum = 0
+           matches.each do |entity_reference|
+             unless filter and filter.include?(entity_reference)
+               entity_value = entity( entity_reference, entities )
+               if entity_value
+                 re = Private::DEFAULT_ENTITIES_PATTERNS[entity_reference] || /&#{entity_reference};/
+                 rv.gsub!( re, entity_value )
++                sum += rv.bytesize
++                if sum > Security.entity_expansion_text_limit
++                  raise "entity expansion has grown too large"
++                end
+               else
+                 er = DEFAULT_ENTITIES[entity_reference]
+                 rv.gsub!( er[0], er[2] ) if er
+@@ -504,6 +513,14 @@ module REXML
+       end
+ 
+       private
++
++      def record_entity_expansion
++        @entity_expansion_count += 1
++        if @entity_expansion_count > Security.entity_expansion_limit
++          raise "number of entity expansions exceeded, processing aborted."
++        end
++      end
++
+       def need_source_encoding_update?(xml_declaration_encoding)
+         return false if xml_declaration_encoding.nil?
+         return false if /\AUTF-16\z/i =~ xml_declaration_encoding
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb
+index f8b232a..36b4595 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/pullparser.rb
+@@ -47,6 +47,10 @@ module REXML
+         @listeners << listener
+       end
+ 
++      def entity_expansion_count
++        @parser.entity_expansion_count
++      end
++
+       def each
+         while has_next?
+           yield self.pull
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb
+index 6a24ce2..01cb469 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/sax2parser.rb
+@@ -22,6 +22,10 @@ module REXML
+         @parser.source
+       end
+ 
++      def entity_expansion_count
++        @parser.entity_expansion_count
++      end
++
+       def add_listener( listener )
+         @parser.add_listener( listener )
+       end
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index eec7e4684c..96873fd7fa 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-49761-0007.patch \
            file://CVE-2024-49761-0008.patch \
            file://CVE-2024-49761-0009.patch \
+           file://CVE-2024-41946.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


