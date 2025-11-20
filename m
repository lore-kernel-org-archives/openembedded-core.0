Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1018DCF857B
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 09:37:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30487.1763631472164579109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ocO3uggj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3419b7187b=divya.chellam@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5wrSR2099146
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 09:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Xkx1J5EoetyuW6eBRf28
	RgyIP52q3La55OTtR38FWLU=; b=ocO3uggjAQh3eVnJQHAVt2kv3hG9IyCGM5FI
	YdCnKLeK8zAEXREFzXIkqgEelr0tSwtZoRKNXQHaNi0NCENNIEY6zohEYIVAs2Eq
	fq+3MOgiW/cPJNiXIj3rBR1nAsPZXg+pJGm6sXedlQ+fTyqvDPuAoeqyoYIDSDwH
	a9AfPLg/zm8XwWEBz9abnbOT6kwNOlpnofxzMTbwGNwUx1creUHHddPuYMsLVQtH
	9FQt49RG7jLnL9SV+gvIK+IwREchGmLOQPVnhrglw9/qllbqrzfLABq042w8Jwlt
	i0glipbSoXMHf4HLG75JWfPHJX8RsYAKnpDGYeCEokNLKzirpg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3rd4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 09:37:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 20 Nov 2025 01:37:48 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/3] ruby: fix CVE-2024-35176
Date: Thu, 20 Nov 2025 15:07:20 +0530
Message-ID: <20251120093722.4148633-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NyBTYWx0ZWRfXyEIlOHWQfRwc
 Gvh4zuV+WSibjIhAh+8m3n7iZe7E3TTRM6/e22bkzSVJLjBp+fu1DOd05Ixni5sIhbbkDAhViH+
 v8lZCy8QODxHBF5QWmPv9znN7VsvC+RXCXSQLaD+fhAVffRHiJxmNbkBq/T0GtJ+rjz2quPVKfm
 KCZG52JpSlIcGKnQF7VOnErSd0pThz9XYlMykvAHNDyoNJJ9eWSPv9WVHPCnvgOPcLQHFkj2mpC
 KpECyTrFg7uaSDnQbGpCo0oFPkef0SatgiBQieqeJjc+6gjhfueSG404ZRLPOZwsKgGHnddT/ve
 gibD85cN/RNK2QGS88FXLIgaNRYavKIdv0NOSxLKZAOeLdgOltH4SwLtTo8W2+15BTBUwVXblqE
 aHQmW/graGavavg8ubNb71cRbMNDIQ==
X-Proofpoint-GUID: Vd-eXH5OOudpHEaBGLfzfxIQmpI1-RrA
X-Proofpoint-ORIG-GUID: Vd-eXH5OOudpHEaBGLfzfxIQmpI1-RrA
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691ee16f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=w2PP7KgtAAAA:8
 a=t7CeM3EgAAAA:8 a=t1kVDvCAwgPmzlN0vhgA:9 a=CDB6uwv3NW-08_pL9N3q:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 09:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226610

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.2.6 has a
denial of service vulnerability when it parses an XML that has many
`<`s in an attribute value. Those who need to parse untrusted XMLs
may be impacted to this vulnerability. The REXML gem 3.2.7 or later
include the patch to fix this vulnerability. As a workaround, don't
parse untrusted XMLs.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-35176

Upstream-patch:
https://github.com/ruby/rexml/commit/4325835f92f3f142ebd91a3fdba4e1f1ab7f1cfb

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2024-35176.patch            | 112 ++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch
new file mode 100644
index 0000000000..83fa3fa4e7
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch
@@ -0,0 +1,112 @@
+From 4325835f92f3f142ebd91a3fdba4e1f1ab7f1cfb Mon Sep 17 00:00:00 2001
+From: Nobuyoshi Nakada <nobu@ruby-lang.org>
+Date: Thu, 16 May 2024 11:26:51 +0900
+Subject: [PATCH] Read quoted attributes in chunks (#126)
+
+CVE: CVE-2024-35176
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/4325835f92f3f142ebd91a3fdba4e1f1ab7f1cfb]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 20 ++++++-------
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  | 29 +++++++++++++++----
+ 2 files changed, 34 insertions(+), 15 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index b97beb3..eab942d 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -675,17 +675,17 @@ module REXML
+               message = "Missing attribute equal: <#{name}>"
+               raise REXML::ParseException.new(message, @source)
+             end
+-            unless match = @source.match(/(['"])(.*?)\1\s*/um, true)
+-              if match = @source.match(/(['"])/, true)
+-                message =
+-                  "Missing attribute value end quote: <#{name}>: <#{match[1]}>"
+-                raise REXML::ParseException.new(message, @source)
+-              else
+-                message = "Missing attribute value start quote: <#{name}>"
+-                raise REXML::ParseException.new(message, @source)
+-              end
++            unless match = @source.match(/(['"])/, true)
++              message = "Missing attribute value start quote: <#{name}>"
++              raise REXML::ParseException.new(message, @source)
++            end
++            quote = match[1]
++            value = @source.read_until(quote)
++            unless value.chomp!(quote)
++              message = "Missing attribute value end quote: <#{name}>: <#{quote}>"
++              raise REXML::ParseException.new(message, @source)
+             end
+-            value = match[2]
++            @source.match(/\s*/um, true)
+             if prefix == "xmlns"
+               if local_part == "xml"
+                 if value != "http://www.w3.org/XML/1998/namespace"
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 4111d1d..7132147 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -65,7 +65,11 @@ module REXML
+       encoding_updated
+     end
+ 
+-    def read
++    def read(term = nil)
++    end
++
++    def read_until(term)
++      @scanner.scan_until(Regexp.union(term)) or @scanner.rest
+     end
+ 
+     def match(pattern, cons=false)
+@@ -151,9 +155,9 @@ module REXML
+       end
+     end
+ 
+-    def read
++    def read(term = nil)
+       begin
+-        @scanner << readline
++        @scanner << readline(term)
+         true
+       rescue Exception, NameError
+         @source = nil
+@@ -161,6 +165,21 @@ module REXML
+       end
+     end
+ 
++    def read_until(term)
++      pattern = Regexp.union(term)
++      data = []
++      begin
++        until str = @scanner.scan_until(pattern)
++          @scanner << readline(term)
++        end
++      rescue EOFError
++        @scanner.rest
++      else
++        read if @scanner.eos? and !@source.eof?
++        str
++      end
++    end
++
+     def match( pattern, cons=false )
+       read if @scanner.eos? && @source
+       while true
+@@ -205,8 +224,8 @@ module REXML
+     end
+ 
+     private
+-    def readline
+-      str = @source.readline(@line_break)
++    def readline(term = nil)
++      str = @source.readline(term || @line_break)
+       if @pending_buffer
+         if str.nil?
+           str = @pending_buffer
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 19641e5a51..6a381b2e40 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -53,6 +53,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-43398-0003.patch \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
+           file://CVE-2024-35176.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


