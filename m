Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0F6C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 11:12:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17195.1744715513946735881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 04:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62000427ad=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F2bifL003766
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:11:52 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ydd1k9cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:11:52 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 15 Apr 2025 04:11:49 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] ruby: fix CVE-2024-43398
Date: Tue, 15 Apr 2025 11:11:27 +0000
Message-ID: <20250415111127.2184783-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: G7ufRhVYLeY4AiITnabWQRg8PQvX6xkS
X-Proofpoint-GUID: G7ufRhVYLeY4AiITnabWQRg8PQvX6xkS
X-Authority-Analysis: v=2.4 cv=HecUTjE8 c=1 sm=1 tr=0 ts=67fe3ef8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8 a=iDauhgX1AAAA:8
 a=igK4HWs5TACI1J00ZygA:9 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22 a=awSlRF10RlbGt6an0hX_:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214840

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.3.6 has a DoS
vulnerability when it parses an XML that has many deep elements that have
same local name attributes. If you need to parse untrusted XMLs with tree
parser API like REXML::Document.new, you may be impacted to this vulnerability.
If you use other parser APIs such as stream parser API and SAX2 parser API,
this vulnerability is not affected. The REXML gem 3.3.6 or later include the
patch to fix the vulnerability.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-43398

Upstream-patch:
https://github.com/ruby/rexml/commit/7cb5eaeb221c322b9912f724183294d8ce96bae3

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2024-43398.patch            | 81 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
new file mode 100644
index 0000000000..02dc0a20be
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
@@ -0,0 +1,81 @@
+From 7cb5eaeb221c322b9912f724183294d8ce96bae3 Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Sat, 17 Aug 2024 17:45:52 +0900
+Subject: [PATCH] parser tree: improve namespace conflicted attribute check 
+ performance
+
+It was slow for deep element.
+
+Reported by l33thaxor. Thanks!!!
+
+The changes to the test folder files are not included in this patch
+because the test folder was not generated during the devtool source build.
+
+CVE: CVE-2024-43398
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/7cb5eaeb221c322b9912f724183294d8ce96bae3]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/element.rb     | 11 -----------
+ .../rexml-3.2.5/lib/rexml/parsers/baseparser.rb   | 15 +++++++++++++++
+ 2 files changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb
+index 4c21dbd..78e78c2 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/element.rb
+@@ -2388,17 +2388,6 @@ module REXML
+       elsif old_attr.kind_of? Hash
+         old_attr[value.prefix] = value
+       elsif old_attr.prefix != value.prefix
+-        # Check for conflicting namespaces
+-        if value.prefix != "xmlns" and old_attr.prefix != "xmlns"
+-          old_namespace = old_attr.namespace
+-          new_namespace = value.namespace
+-          if old_namespace == new_namespace
+-            raise ParseException.new(
+-                    "Namespace conflict in adding attribute \"#{value.name}\": "+
+-                    "Prefix \"#{old_attr.prefix}\" = \"#{old_namespace}\" and "+
+-                    "prefix \"#{value.prefix}\" = \"#{new_namespace}\"")
+-          end
+-        end
+         store value.name, {old_attr.prefix => old_attr,
+                            value.prefix    => value}
+       else
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index e32c7f4..154f2ac 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -634,6 +634,7 @@ module REXML
+ 
+       def parse_attributes(prefixes, curr_ns)
+         attributes = {}
++        expanded_names = {}
+         closed = false
+         match_data = @source.match(/^(.*?)(\/)?>/um, true)
+         if match_data.nil?
+@@ -641,6 +642,20 @@ module REXML
+           raise REXML::ParseException.new(message, @source)
+         end
+ 
++            unless prefix == "xmlns"
++              uri = @namespaces[prefix]
++              expanded_name = [uri, local_part]
++              existing_prefix = expanded_names[expanded_name]
++              if existing_prefix
++                message = "Namespace conflict in adding attribute " +
++                          "\"#{local_part}\": " +
++                          "Prefix \"#{existing_prefix}\" = \"#{uri}\" and " +
++                          "prefix \"#{prefix}\" = \"#{uri}\""
++                raise REXML::ParseException.new(message, @source, self)
++              end
++              expanded_names[expanded_name] = prefix
++            end
++
+         raw_attributes = match_data[1]
+         closed = !match_data[2].nil?
+         return attributes, closed if raw_attributes.nil?
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 76e5ac81ed..ca061e7f70 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-41946.patch \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27219.patch \
+           file://CVE-2024-43398.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


