Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C63C83F20
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 23:14:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.46385.1752362066374379387
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 16:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928837c1c7=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56CN6qJB2082624;
	Sat, 12 Jul 2025 16:14:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uq7f8d7s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 12 Jul 2025 16:14:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Sat, 12 Jul 2025 16:14:24 -0700
Received: from ala-lpggp3.wrs.com (10.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Sat, 12 Jul 2025 16:14:24 -0700
From: Rob Woolley <rob.woolley@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Divya Chellam <divya.chellam@windriver.com>,
        Steve Sakoman
	<steve@sakoman.com>
Subject: [kirkstone][PATCH 1/1] ruby: correct fix for CVE-2024-43398
Date: Sat, 12 Jul 2025 16:13:04 -0700
Message-ID: <20250712231424.1840000-2-rob.woolley@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250712231424.1840000-1-rob.woolley@windriver.com>
References: <20250712231424.1840000-1-rob.woolley@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA5MyBTYWx0ZWRfX/tFt6J6/S8rr
 8vWPZVNqeIvEudEigibIFoVxEryDYptwTzCK8RJk/Gm768CJ2hZ2hVzs+As4GHK8MTZeTW258IJ
 wlUvfLI27XAgaS/kr7Duv2e4BYKbodxsMV1lnZolAsAzTqSys3cMbepRoU97sF7Hcsqg8B7f4yN
 kB1IJ1pS7XEkVJ1eZWJKbFCy7ks7vwEB1jF9GQHgeDqEvhLPryftVHI/C1E+uhNo+hTxze8eq8x
 9p6rlQdV1YqMarKQurzwtPz5K4KBRxvqi30xUozPvbaEowhRENALnHJ2/rCJv/ggMMzfbdKFkCC
 dB+X7iDemDlxmL46wWOMMIGM1zY7o3wTMSZG9G9yh0MNhTNJSYQtUC/qs1w02+tvCdkn2x8tdD5
 IvqOWgLd
X-Proofpoint-ORIG-GUID: 3jnLbUHIb5gmQAL0OhRXZHRYTxIxdDlG
X-Proofpoint-GUID: 3jnLbUHIb5gmQAL0OhRXZHRYTxIxdDlG
X-Authority-Analysis: v=2.4 cv=cdfSrmDM c=1 sm=1 tr=0 ts=6872ec51 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=SSmOFEACAAAA:8 a=w2PP7KgtAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iDauhgX1AAAA:8 a=0FMKgJOuqCm1vb8yFr8A:9
 a=THn8VnNjhrgV60h2:21 a=CDB6uwv3NW-08_pL9N3q:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=awSlRF10RlbGt6an0hX_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-12_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120093
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 23:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220198

The previous fix for CVE-2024-43398 did not include patches
to provide context for the changes it made.

This caused an exception at run-time when ruby parsed
rexml/parsers/baseparser.rb. This was first observed when using
ruby-native to build the sdformat recipe.

With these additional backports, the sdformat build proceeds
successfully. The REXML library was also tested manually on-target
with a script that used REXML::Document.new file to parse an
XML file.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 .../ruby/ruby/CVE-2024-43398-0001.patch       | 210 ++++++++++++++++++
 .../ruby/ruby/CVE-2024-43398-0002.patch       | 128 +++++++++++
 ...-43398.patch => CVE-2024-43398-0003.patch} |  23 +-
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   4 +-
 4 files changed, 351 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
 rename meta/recipes-devtools/ruby/ruby/{CVE-2024-43398.patch => CVE-2024-43398-0003.patch} (87%)

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
new file mode 100644
index 0000000000..2dd6aa6589
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0001.patch
@@ -0,0 +1,210 @@
+From 0496940d5998ccbc50d16fb734993ab50fc60c2d Mon Sep 17 00:00:00 2001
+From: NAITOH Jun <naitoh@gmail.com>
+Date: Mon, 18 Mar 2024 23:30:47 +0900
+Subject: [PATCH]  Optimize the parse_attributes method to use `Source#match`
+ to parse XML.  (#119)
+
+## Why?
+
+Improve maintainability by consolidating processing into `Source#match`.
+
+## Benchmark
+```
+RUBYLIB= BUNDLER_ORIG_RUBYLIB= /Users/naitoh/.rbenv/versions/3.3.0/bin/ruby -v -S benchmark-driver /Users/naitoh/ghq/github.com/naitoh/rexml/benchmark/parse.yaml
+ruby 3.3.0 (2023-12-25 revision 5124f9ac75) [arm64-darwin22]
+Calculating -------------------------------------
+                         before       after  before(YJIT)  after(YJIT)
+                 dom     10.891      10.622        16.356       17.403 i/s -     100.000 times in 9.182130s 9.414177s 6.113806s 5.746133s
+                 sax     30.335      29.845        49.749       54.877 i/s -     100.000 times in 3.296483s 3.350595s 2.010071s 1.822259s
+                pull     35.514      34.801        61.123       66.908 i/s -     100.000 times in 2.815793s 2.873484s 1.636041s 1.494591s
+              stream     35.141      34.475        52.110       56.836 i/s -     100.000 times in 2.845646s 2.900638s 1.919017s 1.759456s
+
+Comparison:
+                              dom
+         after(YJIT):        17.4 i/s
+        before(YJIT):        16.4 i/s - 1.06x  slower
+              before:        10.9 i/s - 1.60x  slower
+               after:        10.6 i/s - 1.64x  slower
+
+                              sax
+         after(YJIT):        54.9 i/s
+        before(YJIT):        49.7 i/s - 1.10x  slower
+              before:        30.3 i/s - 1.81x  slower
+               after:        29.8 i/s - 1.84x  slower
+
+                             pull
+         after(YJIT):        66.9 i/s
+        before(YJIT):        61.1 i/s - 1.09x  slower
+              before:        35.5 i/s - 1.88x  slower
+               after:        34.8 i/s - 1.92x  slower
+
+                           stream
+         after(YJIT):        56.8 i/s
+        before(YJIT):        52.1 i/s - 1.09x  slower
+              before:        35.1 i/s - 1.62x  slower
+               after:        34.5 i/s - 1.65x  slower
+
+```
+
+- YJIT=ON : 1.06x - 1.10x faster
+- YJIT=OFF : 0.97x - 0.98x faster
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/0496940d5998ccbc50d16fb734993ab50fc60c2d]
+
+Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
+---
+ lib/rexml/parsers/baseparser.rb | 116 ++++++++++++--------------------
+ test/parse/test_element.rb      |   4 +-
+ test/test_core.rb               |  20 +++++-
+ 3 files changed, 64 insertions(+), 76 deletions(-)
+
+Index: ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+===================================================================
+--- ruby-3.1.3.orig/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -114,7 +114,7 @@ module REXML
+
+       module Private
+         INSTRUCTION_END = /#{NAME}(\s+.*?)?\?>/um
+-        TAG_PATTERN = /((?>#{QNAME_STR}))/um
++        TAG_PATTERN = /((?>#{QNAME_STR}))\s*/um
+         CLOSE_PATTERN = /(#{QNAME_STR})\s*>/um
+         ATTLISTDECL_END = /\s+#{NAME}(?:#{ATTDEF})*\s*>/um
+         NAME_PATTERN = /\s*#{NAME}/um
+@@ -136,7 +136,6 @@ module REXML
+         self.stream = source
+         @listeners = []
+         @entity_expansion_count = 0
+-        @attributes_scanner = StringScanner.new('')
+       end
+
+       def add_listener( listener )
+@@ -635,86 +634,60 @@ module REXML
+       def parse_attributes(prefixes, curr_ns)
+         attributes = {}
+         closed = false
+-        match_data = @source.match(/^(.*?)(\/)?>/um, true)
+-        if match_data.nil?
+-          message = "Start tag isn't ended"
+-          raise REXML::ParseException.new(message, @source)
+-        end
++        while true
++          if @source.match(">", true)
++            return attributes, closed
++          elsif @source.match("/>", true)
++            closed = true
++            return attributes, closed
++          elsif match = @source.match(QNAME, true)
++            name = match[1]
++            prefix = match[2]
++            local_part = match[3]
+
+-        raw_attributes = match_data[1]
+-        closed = !match_data[2].nil?
+-        return attributes, closed if raw_attributes.nil?
+-        return attributes, closed if raw_attributes.empty?
+-
+-        @attributes_scanner.string = raw_attributes
+-        scanner = @attributes_scanner
+-        until scanner.eos?
+-          if scanner.scan(/\s+/)
+-            break if scanner.eos?
+-          end
+-
+-          pos = scanner.pos
+-          while true
+-            break if scanner.scan(ATTRIBUTE_PATTERN)
+-            unless scanner.scan(QNAME)
+-              message = "Invalid attribute name: <#{scanner.rest}>"
+-              raise REXML::ParseException.new(message, @source)
+-            end
+-            name = scanner[0]
+-            unless scanner.scan(/\s*=\s*/um)
++            unless @source.match(/\s*=\s*/um, true)
+               message = "Missing attribute equal: <#{name}>"
+               raise REXML::ParseException.new(message, @source)
+             end
+-            quote = scanner.scan(/['"]/)
+-            unless quote
+-              message = "Missing attribute value start quote: <#{name}>"
+-              raise REXML::ParseException.new(message, @source)
+-            end
+-            unless scanner.scan(/.*#{Regexp.escape(quote)}/um)
+-              match_data = @source.match(/^(.*?)(\/)?>/um, true)
+-              if match_data
+-                scanner << "/" if closed
+-                scanner << ">"
+-                scanner << match_data[1]
+-                scanner.pos = pos
+-                closed = !match_data[2].nil?
+-                next
++            unless match = @source.match(/(['"])(.*?)\1\s*/um, true)
++              if match = @source.match(/(['"])/, true)
++                message =
++                  "Missing attribute value end quote: <#{name}>: <#{match[1]}>"
++                raise REXML::ParseException.new(message, @source)
++              else
++                message = "Missing attribute value start quote: <#{name}>"
++                raise REXML::ParseException.new(message, @source)
+               end
+-              message =
+-                "Missing attribute value end quote: <#{name}>: <#{quote}>"
+-              raise REXML::ParseException.new(message, @source)
+             end
+-          end
+-          name = scanner[1]
+-          prefix = scanner[2]
+-          local_part = scanner[3]
+-          # quote = scanner[4]
+-          value = scanner[5]
+-          if prefix == "xmlns"
+-            if local_part == "xml"
+-              if value != "http://www.w3.org/XML/1998/namespace"
+-                msg = "The 'xml' prefix must not be bound to any other namespace "+
++            value = match[2]
++            if prefix == "xmlns"
++              if local_part == "xml"
++                if value != "http://www.w3.org/XML/1998/namespace"
++                  msg = "The 'xml' prefix must not be bound to any other namespace "+
++                    "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
++                  raise REXML::ParseException.new( msg, @source, self )
++                end
++              elsif local_part == "xmlns"
++                msg = "The 'xmlns' prefix must not be declared "+
+                   "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
+-                raise REXML::ParseException.new( msg, @source, self )
++                raise REXML::ParseException.new( msg, @source, self)
+               end
+-            elsif local_part == "xmlns"
+-              msg = "The 'xmlns' prefix must not be declared "+
+-                "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
+-              raise REXML::ParseException.new( msg, @source, self)
++              curr_ns << local_part
++            elsif prefix
++              prefixes << prefix unless prefix == "xml"
+             end
+-            curr_ns << local_part
+-          elsif prefix
+-            prefixes << prefix unless prefix == "xml"
+-          end
+
+-          if attributes.has_key?(name)
+-            msg = "Duplicate attribute #{name.inspect}"
+-            raise REXML::ParseException.new(msg, @source, self)
+-          end
++            if attributes.has_key?(name)
++              msg = "Duplicate attribute #{name.inspect}"
++              raise REXML::ParseException.new(msg, @source, self)
++            end
+
+-          attributes[name] = value
++            attributes[name] = value
++          else
++            message = "Invalid attribute name: <#{@source.buffer.split(%r{[/>\s]}).first}>"
++            raise REXML::ParseException.new(message, @source)
++          end
+         end
+-        return attributes, closed
+       end
+     end
+   end
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
new file mode 100644
index 0000000000..cd2c15d937
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0002.patch
@@ -0,0 +1,128 @@
+From cb158582f18cebb3bf7b3f21f230e2fb17d435aa Mon Sep 17 00:00:00 2001
+From: Sutou Kouhei <kou@clear-code.com>
+Date: Sat, 17 Aug 2024 17:39:14 +0900
+Subject: [PATCH] parser: keep the current namespaces instead of stack of Set
+
+It improves namespace resolution performance for deep element.
+
+Upstream-Status: Backport [https://github.com/ruby/rexml/commit/cb158582f18cebb3bf7b3f21f230e2fb17d435aa]
+
+Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
+
+---
+ lib/rexml/parsers/baseparser.rb | 45 +++++++++++++++++++++++++--------
+ 1 file changed, 35 insertions(+), 10 deletions(-)
+
+Index: ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+===================================================================
+--- ruby-3.1.3.orig/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
++++ ruby-3.1.3/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
+@@ -152,7 +152,8 @@ module REXML
+         @tags = []
+         @stack = []
+         @entities = []
+-        @nsstack = []
++        @namespaces = {}
++        @namespaces_restore_stack = []
+       end
+
+       def position
+@@ -235,7 +236,6 @@ module REXML
+                 @source.string = "<!DOCTYPE" + @source.buffer
+                 raise REXML::ParseException.new(message, @source)
+               end
+-              @nsstack.unshift(curr_ns=Set.new)
+               name = parse_name(base_error_message)
+               if @source.match(/\s*\[/um, true)
+                 id = [nil, nil, nil]
+@@ -320,7 +320,7 @@ module REXML
+                   val = attdef[4] if val == "#FIXED "
+                   pairs[attdef[0]] = val
+                   if attdef[0] =~ /^xmlns:(.*)/
+-                    @nsstack[0] << $1
++                    @namespaces[$1] = val
+                   end
+                 end
+               end
+@@ -365,7 +365,7 @@ module REXML
+         begin
+           if @source.match("<", true)
+             if @source.match("/", true)
+-              @nsstack.shift
++              @namespaces_restore_stack.pop
+               last_tag = @tags.pop
+               md = @source.match(CLOSE_PATTERN, true)
+               if md and !last_tag
+@@ -411,18 +411,18 @@ module REXML
+               @document_status = :in_element
+               prefixes = Set.new
+               prefixes << md[2] if md[2]
+-              @nsstack.unshift(curr_ns=Set.new)
+-              attributes, closed = parse_attributes(prefixes, curr_ns)
++              push_namespaces_restore
++              attributes, closed = parse_attributes(@prefixes)
+               # Verify that all of the prefixes have been defined
+               for prefix in prefixes
+-                unless @nsstack.find{|k| k.member?(prefix)}
++                unless @namespaces.key?(prefix)
+                   raise UndefinedNamespaceException.new(prefix,@source,self)
+                 end
+               end
+
+               if closed
+                 @closed = tag
+-                @nsstack.shift
++                pop_namespaces_restore
+               else
+                 @tags.push( tag )
+               end
+@@ -512,6 +512,31 @@ module REXML
+       end
+
+       private
++      def add_namespace(prefix, uri)
++        @namespaces_restore_stack.last[prefix] = @namespaces[prefix]
++        if uri.nil?
++          @namespaces.delete(prefix)
++        else
++          @namespaces[prefix] = uri
++        end
++      end
++
++      def push_namespaces_restore
++        namespaces_restore = {}
++        @namespaces_restore_stack.push(namespaces_restore)
++        namespaces_restore
++      end
++
++      def pop_namespaces_restore
++        namespaces_restore = @namespaces_restore_stack.pop
++        namespaces_restore.each do |prefix, uri|
++          if uri.nil?
++            @namespaces.delete(prefix)
++          else
++            @namespaces[prefix] = uri
++          end
++        end
++      end
+
+       def record_entity_expansion
+         @entity_expansion_count += 1
+@@ -631,7 +656,7 @@ module REXML
+         [:processing_instruction, match_data[1], match_data[2]]
+       end
+
+-      def parse_attributes(prefixes, curr_ns)
++      def parse_attributes(prefixes)
+         attributes = {}
+         closed = false
+         while true
+@@ -672,7 +697,7 @@ module REXML
+                   "(http://www.w3.org/TR/REC-xml-names/#ns-decl)"
+                 raise REXML::ParseException.new( msg, @source, self)
+               end
+-              curr_ns << local_part
++              add_namespace(local_part, value)
+             elsif prefix
+               prefixes << prefix unless prefix == "xml"
+             end
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0003.patch
similarity index 87%
rename from meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
rename to meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0003.patch
index 02dc0a20be..2a48aabbc5 100644
--- a/meta/recipes-devtools/ruby/ruby/CVE-2024-43398.patch
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-43398-0003.patch
@@ -47,17 +47,17 @@ diff --git a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb b/.bundle/
 index e32c7f4..154f2ac 100644
 --- a/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
 +++ b/.bundle/gems/rexml-3.2.5/lib/rexml/parsers/baseparser.rb
-@@ -634,6 +634,7 @@ module REXML
+@@ -658,6 +658,7 @@ module REXML
  
-       def parse_attributes(prefixes, curr_ns)
+       def parse_attributes(prefixes)
          attributes = {}
 +        expanded_names = {}
          closed = false
-         match_data = @source.match(/^(.*?)(\/)?>/um, true)
-         if match_data.nil?
-@@ -641,6 +642,20 @@ module REXML
-           raise REXML::ParseException.new(message, @source)
-         end
+         while true
+           if @source.match(">", true)
+@@ -707,6 +708,20 @@ module REXML
+               raise REXML::ParseException.new(msg, @source, self)
+             end
  
 +            unless prefix == "xmlns"
 +              uri = @namespaces[prefix]
@@ -73,9 +73,6 @@ index e32c7f4..154f2ac 100644
 +              expanded_names[expanded_name] = prefix
 +            end
 +
-         raw_attributes = match_data[1]
-         closed = !match_data[2].nil?
-         return attributes, closed if raw_attributes.nil?
--- 
-2.40.0
-
+             attributes[name] = value
+           else
+             message = "Invalid attribute name: <#{@source.buffer.split(%r{[/>\s]}).first}>"
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 65d62002ec..19641e5a51 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -48,7 +48,9 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2024-41946.patch \
            file://CVE-2025-27220.patch \
            file://CVE-2025-27219.patch \
-           file://CVE-2024-43398.patch \
+           file://CVE-2024-43398-0001.patch \
+           file://CVE-2024-43398-0002.patch \
+           file://CVE-2024-43398-0003.patch \
            file://CVE-2025-27221-0001.patch \
            file://CVE-2025-27221-0002.patch \
            "
-- 
2.49.0


