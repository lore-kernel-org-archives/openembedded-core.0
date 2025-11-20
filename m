Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E6EECF857A
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 09:37:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30488.1763631473016115441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 01:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Xg8JYTKH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3419b7187b=divya.chellam@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK6eqs7243882
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 01:37:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+B511Hq1TyaBQf4mrzsQeLlzbw6bkbmQQdIF8jbUC+4=; b=Xg8JYTKHZmya
	yKXrR6q9UGDkkw9QTAW77lbzZ878B5iUOr8gZTU2AqQvgSVLPmFv0pu7GLVODETK
	MvfQHsXSbZpDdif6x6MS5YjBGNPCC6792OyLmVZ/jUlptMOm4ZDDMuQOUCCQJJEC
	2UKQVTkAUGvyDUKINTj6XGnkNvOyqSxyhA+1vGgWXsbqhHiujivRdDxOiNM7iIid
	OkZe4IJMlGmDwWdhSiXCAWh0AU9jEgaZ23aiq6f2QSieS97n0b1RAazrnI3Kn8/5
	HIMkWXCD8FTBQwJJtEZoUMrXXDpusIUbI4GbPRq4TXhpeR8F8DaiUPBW1iZoOFI/
	qbGq/sXM7Q==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aenp2x54q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 01:37:52 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 20 Nov 2025 01:37:50 -0800
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 2/3] ruby: fix CVE-2024-39908
Date: Thu, 20 Nov 2025 15:07:21 +0530
Message-ID: <20251120093722.4148633-2-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251120093722.4148633-1-divya.chellam@windriver.com>
References: <20251120093722.4148633-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1NyBTYWx0ZWRfX4NXz5S8zYxVO
 pEwlpkKVHeD2hioOQRJVglpMAen2666ZHJ23IBljRn/OGKvnmz5GqQ5jr+KF9DCUmmQuhwotKVP
 v9XRMjHFk0hnvOYxaAB2OmEaSsf+QNhEV539pS1E0p642FUP5Um+8imz8N+GC1mjTQHAjyL8cYL
 g0hVYNz2lT/lljfXuzLTLMV8FgQInO3otrIAszRVyZ5tTRrBsuVeRC63yd+iWqfzcFDRmiwdiMz
 2xwK7cKGFRKQcUd9r6C/939do6Q7uVdT4EZp9RK6cZIa3i3EYWELz4FAHrrZ3GyYPncbq+D7bVo
 pk//WGWXw5L40LWUXtW9ZA41Gat0etd/ga3XiuK+BZGo4UePiBH6/2wvMxu1uc/TqF5kJOTRu/1
 ZXpKpJg1i/+dciIKFFPjRwv636le/Q==
X-Proofpoint-ORIG-GUID: Dhc70Mf_PcLUqN0-yQgCImYjGncqP_j0
X-Proofpoint-GUID: Dhc70Mf_PcLUqN0-yQgCImYjGncqP_j0
X-Authority-Analysis: v=2.4 cv=Z6Xh3XRA c=1 sm=1 tr=0 ts=691ee170 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xNf9USuDAAAA:8 a=NEAV23lmAAAA:8 a=w2PP7KgtAAAA:8 a=t7CeM3EgAAAA:8
 a=iDauhgX1AAAA:8 a=pGLkceISAAAA:8 a=V4LBpFkcAAAA:8 a=aNu4taNgwDFarIiFXMYA:9
 a=EZ1rnsXPcTMiki62:21 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=awSlRF10RlbGt6an0hX_:22 a=1gEN4mCcg7y7_F5Dl51E:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 09:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226611

From: Divya Chellam <divya.chellam@windriver.com>

REXML is an XML toolkit for Ruby. The REXML gem before 3.3.1 has some
DoS vulnerabilities when it parses an XML that has many specific characters
such as `<`, `0` and `%>`. If you need to parse untrusted XMLs, you many be
impacted to these vulnerabilities. The REXML gem 3.3.2 or later include the
patches to fix these vulnerabilities. Users are advised to upgrade. Users
unable to upgrade should avoid parsing untrusted XML strings.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-39908

Upstream-patches:
https://github.com/ruby/rexml/commit/f1df7d13b3e57a5e059273d2f0870163c08d7420
https://github.com/ruby/rexml/commit/d146162e9a61574499d10428bc0065754cd26601
https://github.com/ruby/rexml/commit/b5bf109a599ea733663150e99c09eb44046b41dd
https://github.com/ruby/rexml/commit/b8a5f4cd5c8fe29c65d7a00e67170223d9d2b50e
https://github.com/ruby/rexml/commit/0af55fa49d4c9369f90f239a9571edab800ed36e
https://github.com/ruby/rexml/commit/c1b64c174ec2e8ca2174c51332670e3be30c865f
https://github.com/ruby/rexml/commit/9f1415a2616c77cad44a176eee90e8457b4774b6
https://github.com/ruby/rexml/commit/c33ea498102be65082940e8b7d6d31cb2c6e6ee2
https://github.com/ruby/rexml/commit/a79ac8b4b42a9efabe33a0be31bd82d33fd50347
https://github.com/ruby/rexml/commit/67efb5951ed09dbb575c375b130a1e469f437d1f
https://github.com/ruby/rexml/commit/1f1e6e9b40bf339894e843dfd679c2fb1a5ddbf2
https://github.com/ruby/rexml/commit/910e5a2b487cb5a30989884a39f9cad2cc499cfc

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 .../ruby/ruby/CVE-2024-39908-0001.patch       |  46 +++++++
 .../ruby/ruby/CVE-2024-39908-0002.patch       | 130 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-39908-0003.patch       |  46 +++++++
 .../ruby/ruby/CVE-2024-39908-0004.patch       |  76 ++++++++++
 .../ruby/ruby/CVE-2024-39908-0005.patch       |  87 ++++++++++++
 .../ruby/ruby/CVE-2024-39908-0006.patch       |  44 ++++++
 .../ruby/ruby/CVE-2024-39908-0007.patch       |  44 ++++++
 .../ruby/ruby/CVE-2024-39908-0008.patch       |  44 ++++++
 .../ruby/ruby/CVE-2024-39908-0009.patch       |  36 +++++
 .../ruby/ruby/CVE-2024-39908-0010.patch       |  53 +++++++
 .../ruby/ruby/CVE-2024-39908-0011.patch       |  35 +++++
 .../ruby/ruby/CVE-2024-39908-0012.patch       |  36 +++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  12 ++
 13 files changed, 689 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
new file mode 100644
index 0000000000..44d3e1dffe
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
@@ -0,0 +1,46 @@
+From f1df7d13b3e57a5e059273d2f0870163c08d7420 Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Mon, 20 May 2024 12:17:27 +0900
+Subject: [PATCH] Add support for old strscan
+
+Fix GH-132
+
+If we support old strscan, users can also use strscan installed as a
+default gem.
+
+Reported by Adam. Thanks!!!
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/f1df7d13b3e57a5e059273d2f0870163c08d7420]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb  | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index eab942d..8ea8b43 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -7,6 +7,17 @@ require "strscan"
+ 
+ module REXML
+   module Parsers
++    if StringScanner::Version < "3.0.8"
++      module StringScannerCaptures
++        refine StringScanner do
++          def captures
++            values_at(*(1...size))
++          end
++        end
++      end
++      using StringScannerCaptures
++    end
++
+     # = Using the Pull Parser
+     # <em>This API is experimental, and subject to change.</em>
+     #  parser = PullParser.new( "<a>text<b att='val'/>txet</a>" )
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
new file mode 100644
index 0000000000..25a9e70891
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
@@ -0,0 +1,130 @@
+From d146162e9a61574499d10428bc0065754cd26601 Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Mon, 4 Mar 2024 05:24:53 +0900
+Subject: [PATCH] Remove `Source#string=` method (#117)
+
+We want to just change scan pointer.
+
+https://github.com/ruby/rexml/pull/114#discussion_r1501773803
+> I want to just change scan pointer (`StringScanner#pos=`) instead of
+changing `@scanner.string`.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/d146162e9a61574499d10428bc0065754cd26601]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .../lib/rexml/parsers/baseparser.rb           | 19 +++++++++++--------
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb  |  8 ++++++--
+ 2 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 8ea8b43..81415a8 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -231,8 +231,9 @@ module REXML
+         #STDERR.puts @source.encoding
+         #STDERR.puts "BUFFER = #{@source.buffer.inspect}"
+         if @document_status == nil
++          start_position = @source.position
+           if @source.match("<?", true)
+-            return process_instruction
++            return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+               return [ :comment, @source.match(/(.*?)-->/um, true)[1] ]
+@@ -244,7 +245,7 @@ module REXML
+                 else
+                   message = "#{base_error_message}: invalid name"
+                 end
+-                @source.string = "<!DOCTYPE" + @source.buffer
++                @source.position = start_position
+                 raise REXML::ParseException.new(message, @source)
+               end
+               name = parse_name(base_error_message)
+@@ -285,6 +286,7 @@ module REXML
+         end
+         if @document_status == :in_doctype
+           @source.match(/\s*/um, true) # skip spaces
++          start_position = @source.position
+           if @source.match("<!", true)
+             if @source.match("ELEMENT", true)
+               md = @source.match(/(.*?)>/um, true)
+@@ -344,7 +346,7 @@ module REXML
+                 else
+                   message = "#{base_error_message}: invalid name"
+                 end
+-                @source.string = " <!NOTATION" + @source.buffer
++                @source.position = start_position
+                 raise REXML::ParseException.new(message, @source)
+               end
+               name = parse_name(base_error_message)
+@@ -374,6 +376,7 @@ module REXML
+           @source.match(/\s*/um, true)
+         end
+         begin
++          start_position = @source.position
+           if @source.match("<", true)
+             if @source.match("/", true)
+               @namespaces_restore_stack.pop
+@@ -386,7 +389,7 @@ module REXML
+               if md.nil? or last_tag != md[1]
+                 message = "Missing end tag for '#{last_tag}'"
+                 message += " (got '#{md[1]}')" if md
+-                @source.string = "</" + @source.buffer if md.nil?
++                @source.position = start_position if md.nil?
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [ :end_element, last_tag ]
+@@ -410,12 +413,12 @@ module REXML
+               raise REXML::ParseException.new( "Declarations can only occur "+
+                 "in the doctype declaration.", @source)
+             elsif @source.match("?", true)
+-              return process_instruction
++              return process_instruction(start_position)
+             else
+               # Get the next tag
+               md = @source.match(TAG_PATTERN, true)
+               unless md
+-                @source.string = "<" + @source.buffer
++                @source.position = start_position
+                 raise REXML::ParseException.new("malformed XML: missing tag start", @source)
+               end
+               tag = md[1]
+@@ -641,11 +644,11 @@ module REXML
+         end
+       end
+ 
+-      def process_instruction
++      def process_instruction(start_position)
+         match_data = @source.match(INSTRUCTION_END, true)
+         unless match_data
+           message = "Invalid processing instruction node"
+-          @source.string = "<?" + @source.buffer
++          @source.position = start_position
+           raise REXML::ParseException.new(message, @source)
+         end
+         if @document_status.nil? and match_data[1] == "xml"
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index 7132147..b20cc4f 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -80,8 +80,12 @@ module REXML
+       end
+     end
+ 
+-    def string=(string)
+-      @scanner.string = string
++    def position
++      @scanner.pos
++    end
++
++    def position=(pos)
++      @scanner.pos = pos
+     end
+ 
+     # @return true if the Source is exhausted
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
new file mode 100644
index 0000000000..4208555c3c
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
@@ -0,0 +1,46 @@
+From b5bf109a599ea733663150e99c09eb44046b41dd Mon Sep 17 00:00:00 2001
+From: Hiroya Fujinami <make.just.on@gmail.com>
+Date: Thu, 13 Jun 2024 15:12:32 +0900
+Subject: [PATCH] Add a "malformed comment" check for top-level comments (#145)
+
+This check was missing. Therefore, `REXML::Document.new("<!--")` raised
+the ``undefined method `[]' for nil`` error, for example.
+
+This PR also adds tests for "malformed comment" checks.
+
+---------
+
+Co-authored-by: Sutou Kouhei <kou@cozmixng.org>
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/b5bf109a599ea733663150e99c09eb44046b41dd]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 81415a8..49c313c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -236,7 +236,14 @@ module REXML
+             return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+-              return [ :comment, @source.match(/(.*?)-->/um, true)[1] ]
++              md = @source.match(/(.*?)-->/um, true)
++              if md.nil?
++                raise REXML::ParseException.new("Unclosed comment", @source)
++              end
++              if /--|-\z/.match?(md[1])
++                raise REXML::ParseException.new("Malformed comment", @source)
++              end
++              return [ :comment, md[1] ]
+             elsif @source.match("DOCTYPE", true)
+               base_error_message = "Malformed DOCTYPE"
+               unless @source.match(/\s+/um, true)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
new file mode 100644
index 0000000000..11a4c1ca54
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
@@ -0,0 +1,76 @@
+From b8a5f4cd5c8fe29c65d7a00e67170223d9d2b50e Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 10:48:53 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+  inside `<?xml` (#170)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/b8a5f4cd5c8fe29c65d7a00e67170223d9d2b50e]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ .bundle/gems/rexml-3.2.5/lib/rexml/source.rb             | 6 +++---
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 49c313c..767e134 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -125,6 +125,7 @@ module REXML
+ 
+       module Private
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
++        INSTRUCTION_TERM = "?>"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -652,7 +653,7 @@ module REXML
+       end
+ 
+       def process_instruction(start_position)
+-        match_data = @source.match(INSTRUCTION_END, true)
++        match_data = @source.match(Private::INSTRUCTION_END, true, term: Private::INSTRUCTION_TERM)
+         unless match_data
+           message = "Invalid processing instruction node"
+           @source.position = start_position
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+index b20cc4f..08a035c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/source.rb
+@@ -72,7 +72,7 @@ module REXML
+       @scanner.scan_until(Regexp.union(term)) or @scanner.rest
+     end
+ 
+-    def match(pattern, cons=false)
++    def match(pattern, cons=false, term: nil)
+       if cons
+         @scanner.scan(pattern).nil? ? nil : @scanner
+       else
+@@ -184,7 +184,7 @@ module REXML
+       end
+     end
+ 
+-    def match( pattern, cons=false )
++    def match( pattern, cons=false, term: nil )
+       read if @scanner.eos? && @source
+       while true
+         if cons
+@@ -195,7 +195,7 @@ module REXML
+         break if md
+         return nil if pattern.is_a?(String) && pattern.bytesize <= @scanner.rest_size
+         return nil if @source.nil?
+-        return nil unless read
++        return nil unless read(term)
+       end
+ 
+       md.nil? ? nil : @scanner
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
new file mode 100644
index 0000000000..0726927865
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
@@ -0,0 +1,87 @@
+From 0af55fa49d4c9369f90f239a9571edab800ed36e Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 10:57:39 +0900
+Subject: [PATCH] Fix ReDoS caused by very large character references using
+ repeated 0s (#169)
+
+This patch will fix the ReDoS that is caused by large string of 0s on a
+character reference (like `&#00000000...`).
+
+This is occurred in Ruby 3.1 or earlier.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/0af55fa49d4c9369f90f239a9571edab800ed36e]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/text.rb | 48 +++++++++++++++-------
+ 1 file changed, 34 insertions(+), 14 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb
+index 050b09c..0957d70 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/text.rb
+@@ -151,25 +151,45 @@ module REXML
+         end
+       end
+ 
+-      # context sensitive
+-      string.scan(pattern) do
+-        if $1[-1] != ?;
+-          raise "Illegal character #{$1.inspect} in raw string #{string.inspect}"
+-        elsif $1[0] == ?&
+-          if $5 and $5[0] == ?#
+-            case ($5[1] == ?x ? $5[2..-1].to_i(16) : $5[1..-1].to_i)
+-            when *VALID_CHAR
++      pos = 0
++      while (index = string.index(/<|&/, pos))
++        if string[index] == "<"
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
++        end
++
++        unless (end_index = string.index(/[^\s];/, index + 1))
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
++        end
++
++        value = string[(index + 1)..end_index]
++        if /\s/.match?(value)
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
++        end
++
++        if value[0] == "#"
++          character_reference = value[1..-1]
++
++          unless (/\A(\d+|x[0-9a-fA-F]+)\z/.match?(character_reference))
++            if character_reference[0] == "x" || character_reference[-1] == "x"
++              raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
+             else
+-              raise "Illegal character #{$1.inspect} in raw string #{string.inspect}"
++              raise "Illegal character #{string.inspect} in raw string #{string.inspect}"
+             end
+-          # FIXME: below can't work but this needs API change.
+-          # elsif @parent and $3 and !SUBSTITUTES.include?($1)
+-          #   if !doctype or !doctype.entities.has_key?($3)
+-          #     raise "Undeclared entity '#{$1}' in raw string \"#{string}\""
+-          #   end
+           end
++
++          case (character_reference[0] == "x" ? character_reference[1..-1].to_i(16) : character_reference[0..-1].to_i)
++          when *VALID_CHAR
++          else
++            raise "Illegal character #{string.inspect} in raw string #{string.inspect}"
++          end
++        elsif !(/\A#{Entity::NAME}\z/um.match?(value))
++          raise "Illegal character \"#{string[index]}\" in raw string #{string.inspect}"
+         end
++
++        pos = end_index + 1
+       end
++
++      string
+     end
+ 
+     def node_type
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
new file mode 100644
index 0000000000..9d78112edd
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
@@ -0,0 +1,44 @@
+From c1b64c174ec2e8ca2174c51332670e3be30c865f Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 10:57:50 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside comments (#171)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/c1b64c174ec2e8ca2174c51332670e3be30c865f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 767e134..81753ad 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -126,6 +126,7 @@ module REXML
+       module Private
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         INSTRUCTION_TERM = "?>"
++        COMMENT_TERM = "-->"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -237,7 +238,7 @@ module REXML
+             return process_instruction(start_position)
+           elsif @source.match("<!", true)
+             if @source.match("--", true)
+-              md = @source.match(/(.*?)-->/um, true)
++              md = @source.match(/(.*?)-->/um, true, term: Private::COMMENT_TERM)
+               if md.nil?
+                 raise REXML::ParseException.new("Unclosed comment", @source)
+               end
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
new file mode 100644
index 0000000000..bb2325bbbd
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
@@ -0,0 +1,44 @@
+From 9f1415a2616c77cad44a176eee90e8457b4774b6 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:04:40 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `CDATA [ PAYLOAD ]` (#172)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/9f1415a2616c77cad44a176eee90e8457b4774b6]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 81753ad..c907f8c 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -127,6 +127,7 @@ module REXML
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         INSTRUCTION_TERM = "?>"
+         COMMENT_TERM = "-->"
++        CDATA_TERM = "]]>"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -416,7 +417,7 @@ module REXML
+ 
+                 return [ :comment, md[1] ] if md
+               else
+-                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true)
++                md = @source.match(/\[CDATA\[(.*?)\]\]>/um, true, term: Private::CDATA_TERM)
+                 return [ :cdata, md[1] ] if md
+               end
+               raise REXML::ParseException.new( "Declarations can only occur "+
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
new file mode 100644
index 0000000000..e9413ba2c0
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
@@ -0,0 +1,44 @@
+From c33ea498102be65082940e8b7d6d31cb2c6e6ee2 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:11:17 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ after ` <!DOCTYPE name` (#173)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/c33ea498102be65082940e8b7d6d31cb2c6e6ee2]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c907f8c..5391e0a 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -128,6 +128,7 @@ module REXML
+         INSTRUCTION_TERM = "?>"
+         COMMENT_TERM = "-->"
+         CDATA_TERM = "]]>"
++        DOCTYPE_TERM = "]>"
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -375,7 +376,7 @@ module REXML
+               end
+               return [ :comment, md[1] ] if md
+             end
+-          elsif match = @source.match(/(%.*?;)\s*/um, true)
++          elsif match = @source.match(/(%.*?;)\s*/um, true, term: Private::DOCTYPE_TERM)
+             return [ :externalentity, match[1] ]
+           elsif @source.match(/\]\s*>/um, true)
+             @document_status = :after_doctype
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
new file mode 100644
index 0000000000..1de0551879
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
@@ -0,0 +1,36 @@
+From a79ac8b4b42a9efabe33a0be31bd82d33fd50347 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:18:11 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `<!DOCTYPE root [<!-- PAYLOAD -->]>` (#174)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/a79ac8b4b42a9efabe33a0be31bd82d33fd50347]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index 5391e0a..c22b632 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -369,7 +369,7 @@ module REXML
+                 raise REXML::ParseException.new(message, @source)
+               end
+               return [:notationdecl, name, *id]
+-            elsif md = @source.match(/--(.*?)-->/um, true)
++            elsif md = @source.match(/--(.*?)-->/um, true, term: Private::COMMENT_TERM)
+               case md[1]
+               when /--/, /-\z/
+                 raise REXML::ParseException.new("Malformed comment", @source)
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
new file mode 100644
index 0000000000..a46ba171de
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
@@ -0,0 +1,53 @@
+From 67efb5951ed09dbb575c375b130a1e469f437d1f Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:26:57 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `<!DOCTYPE name [<!ENTITY>]>` (#175)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/67efb5951ed09dbb575c375b130a1e469f437d1f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c22b632..c4de254 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -124,11 +124,15 @@ module REXML
+       }
+ 
+       module Private
+-        INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
++        # Terminal requires two or more letters.
+         INSTRUCTION_TERM = "?>"
+         COMMENT_TERM = "-->"
+         CDATA_TERM = "]]>"
+         DOCTYPE_TERM = "]>"
++        # Read to the end of DOCTYPE because there is no proper ENTITY termination
++        ENTITY_TERM = DOCTYPE_TERM
++
++        INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+         TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+@@ -304,7 +308,7 @@ module REXML
+               raise REXML::ParseException.new( "Bad ELEMENT declaration!", @source ) if md.nil?
+               return [ :elementdecl, "<!ELEMENT" + md[1] ]
+             elsif @source.match("ENTITY", true)
+-              match = [:entitydecl, *@source.match(ENTITYDECL_PATTERN, true).captures.compact]
++              match = [:entitydecl, *@source.match(Private::ENTITYDECL_PATTERN, true, term: Private::ENTITY_TERM).captures.compact]
+               ref = false
+               if match[1] == '%'
+                 ref = true
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
new file mode 100644
index 0000000000..505007af9a
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
@@ -0,0 +1,35 @@
+From 1f1e6e9b40bf339894e843dfd679c2fb1a5ddbf2 Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:35:41 +0900
+Subject: [PATCH] Fix ReDoS by using repeated space characters inside
+ `<!DOCTYPE name [<!ATTLIST>]>` (#176)
+
+Fix performance by removing unnecessary spaces.
+
+This is occurred in Ruby 3.1 or earlier.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/1f1e6e9b40bf339894e843dfd679c2fb1a5ddbf2]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index c4de254..a9b1b44 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -340,7 +340,7 @@ module REXML
+               contents = md[0]
+ 
+               pairs = {}
+-              values = md[0].scan( ATTDEF_RE )
++              values = md[0].strip.scan( ATTDEF_RE )
+               values.each do |attdef|
+                 unless attdef[3] == "#IMPLIED"
+                   attdef.compact!
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch
new file mode 100644
index 0000000000..5a7cbe18dc
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch
@@ -0,0 +1,36 @@
+From 910e5a2b487cb5a30989884a39f9cad2cc499cfc Mon Sep 17 00:00:00 2001
+From: Watson <watson1978@gmail.com>
+Date: Tue, 16 Jul 2024 11:36:05 +0900
+Subject: [PATCH] Fix performance issue caused by using repeated `>` characters
+ inside `<xml><!-- --></xml>` (#177)
+
+A `<` is treated as a string delimiter.
+In certain cases, if `<` is used in succession, read and match are
+repeated, which slows down the process. Therefore, the following is used
+to read ahead to a specific part of the string in advance.
+
+CVE: CVE-2024-39908
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/910e5a2b487cb5a30989884a39f9cad2cc499cfc]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ .bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+index a9b1b44..4864ba1 100644
+--- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -413,7 +413,7 @@ module REXML
+               #STDERR.puts "SOURCE BUFFER = #{source.buffer}, #{source.buffer.size}"
+               raise REXML::ParseException.new("Malformed node", @source) unless md
+               if md[0][0] == ?-
+-                md = @source.match(/--(.*?)-->/um, true)
++                md = @source.match(/--(.*?)-->/um, true, term: Private::COMMENT_TERM)
+ 
+                 case md[1]
+                 when /--/, /-\z/
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 6a381b2e40..f967cc6948 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -54,6 +54,18 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
            file://CVE-2024-35176.patch \
+           file://CVE-2024-39908-0001.patch \
+           file://CVE-2024-39908-0002.patch \
+           file://CVE-2024-39908-0003.patch \
+           file://CVE-2024-39908-0004.patch \
+           file://CVE-2024-39908-0005.patch \
+           file://CVE-2024-39908-0006.patch \
+           file://CVE-2024-39908-0007.patch \
+           file://CVE-2024-39908-0008.patch \
+           file://CVE-2024-39908-0009.patch \
+           file://CVE-2024-39908-0010.patch \
+           file://CVE-2024-39908-0011.patch \
+           file://CVE-2024-39908-0012.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.40.0


