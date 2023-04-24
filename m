Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB906C7618E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 09:16:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.46482.1682327765466552180
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 02:16:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3478a72184=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33O8fhRC002187
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 09:16:04 GMT
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q46jba47w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 09:16:04 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 24 Apr 2023 02:16:03 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 24 Apr 2023 02:16:02 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] ruby: Fix CVE-2023-28755
Date: Mon, 24 Apr 2023 17:16:01 +0800
Message-ID: <20230424091601.3982244-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: PFGa0kOxDY_XYrHYQTOFCW3R3b7fiNX7
X-Proofpoint-ORIG-GUID: PFGa0kOxDY_XYrHYQTOFCW3R3b7fiNX7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 09:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180345

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-28755.

[1] https://github.com/ruby/ruby/commit/8ce4ab146498879b65e22f1be951b25eebb=
79300

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ruby/ruby/CVE-2023-28755.patch            | 68 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-28755.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-28755.patch b/meta/re=
cipes-devtools/ruby/ruby/CVE-2023-28755.patch
new file mode 100644
index 0000000000..d611c41dcc
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-28755.patch
@@ -0,0 +1,68 @@
+From db4bb57d4af6d097a0c29490536793d95f1d8983 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Mon, 24 Apr 2023 08:27:24 +0000
+Subject: [PATCH] Merge URI-0.12.1
+
+CVE: CVE-2023-28755
+
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/8ce4ab14649=
8879b65e22f1be951b25eebb79300]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/uri/rfc3986_parser.rb |  4 ++--
+ lib/uri/version.rb        |  2 +-
+ test/uri/test_common.rb   | 11 +++++++++++
+ 3 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/lib/uri/rfc3986_parser.rb b/lib/uri/rfc3986_parser.rb
+index 3e07de4..3c89311 100644
+--- a/lib/uri/rfc3986_parser.rb
++++ b/lib/uri/rfc3986_parser.rb
+@@ -3,8 +3,8 @@ module URI
+   class RFC3986_Parser # :nodoc:
+     # URI defined in RFC3986
+     # this regexp is modified not to host is not empty string
+-    RFC3986_URI =3D /\A(?<URI>(?<scheme>[A-Za-z][+\-.0-9A-Za-z]*):(?<hier=
-part>\/\/(?<authority>(?:(?<userinfo>(?:%\h\h|[!$&-.0-;=3DA-Z_a-z~])*)@)?(=
?<host>(?<IP-literal>\[(?:(?<IPv6address>(?:\h{1,4}:){6}(?<ls32>\h{1,4}:\h{=
1,4}|(?<IPv4address>(?<dec-octet>[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]|\d)\.\g<de=
c-octet>\.\g<dec-octet>\.\g<dec-octet>))|::(?:\h{1,4}:){5}\g<ls32>|\h{1,4}?=
::(?:\h{1,4}:){4}\g<ls32>|(?:(?:\h{1,4}:)?\h{1,4})?::(?:\h{1,4}:){3}\g<ls32=
>|(?:(?:\h{1,4}:){,2}\h{1,4})?::(?:\h{1,4}:){2}\g<ls32>|(?:(?:\h{1,4}:){,3}=
\h{1,4})?::\h{1,4}:\g<ls32>|(?:(?:\h{1,4}:){,4}\h{1,4})?::\g<ls32>|(?:(?:\h=
{1,4}:){,5}\h{1,4})?::\h{1,4}|(?:(?:\h{1,4}:){,6}\h{1,4})?::)|(?<IPvFuture>=
v\h+\.[!$&-.0-;=3DA-Z_a-z~]+))\])|\g<IPv4address>|(?<reg-name>(?:%\h\h|[!$&=
-.0-9;=3DA-Z_a-z~])+))?(?::(?<port>\d*))?)(?<path-abempty>(?:\/(?<segment>(=
?:%\h\h|[!$&-.0-;=3D@-Z_a-z~])*))*)|(?<path-absolute>\/(?:(?<segment-nz>(?:=
%\h\h|[!$&-.0-;=3D@-Z_a-z~])+)(?:\/\g<segment>)*)?)|(?<path-rootless>\g<seg=
ment-nz>(?:\/\g<segment>)*)|(?<path-empty>))(?:\?(?<query>[^#]*))?(?:\#(?<f=
ragment>(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*))?)\z/
+-    RFC3986_relative_ref =3D /\A(?<relative-ref>(?<relative-part>\/\/(?<a=
uthority>(?:(?<userinfo>(?:%\h\h|[!$&-.0-;=3DA-Z_a-z~])*)@)?(?<host>(?<IP-l=
iteral>\[(?<IPv6address>(?:\h{1,4}:){6}(?<ls32>\h{1,4}:\h{1,4}|(?<IPv4addre=
ss>(?<dec-octet>[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]|\d)\.\g<dec-octet>\.\g<dec-=
octet>\.\g<dec-octet>))|::(?:\h{1,4}:){5}\g<ls32>|\h{1,4}?::(?:\h{1,4}:){4}=
\g<ls32>|(?:(?:\h{1,4}:){,1}\h{1,4})?::(?:\h{1,4}:){3}\g<ls32>|(?:(?:\h{1,4=
}:){,2}\h{1,4})?::(?:\h{1,4}:){2}\g<ls32>|(?:(?:\h{1,4}:){,3}\h{1,4})?::\h{=
1,4}:\g<ls32>|(?:(?:\h{1,4}:){,4}\h{1,4})?::\g<ls32>|(?:(?:\h{1,4}:){,5}\h{=
1,4})?::\h{1,4}|(?:(?:\h{1,4}:){,6}\h{1,4})?::)|(?<IPvFuture>v\h+\.[!$&-.0-=
;=3DA-Z_a-z~]+)\])|\g<IPv4address>|(?<reg-name>(?:%\h\h|[!$&-.0-9;=3DA-Z_a-=
z~])+))?(?::(?<port>\d*))?)(?<path-abempty>(?:\/(?<segment>(?:%\h\h|[!$&-.0=
-;=3D@-Z_a-z~])*))*)|(?<path-absolute>\/(?:(?<segment-nz>(?:%\h\h|[!$&-.0-;=
=3D@-Z_a-z~])+)(?:\/\g<segment>)*)?)|(?<path-noscheme>(?<segment-nz-nc>(?:%=
\h\h|[!$&-.0-9;=3D@-Z_a-z~])+)(?:\/\g<segment>)*)|(?<path-empty>))(?:\?(?<q=
uery>[^#]*))?(?:\#(?<fragment>(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*))?)\z/
++    RFC3986_URI =3D /\A(?<URI>(?<scheme>[A-Za-z][+\-.0-9A-Za-z]*+):(?<hie=
r-part>\/\/(?<authority>(?:(?<userinfo>(?:%\h\h|[!$&-.0-;=3DA-Z_a-z~])*+)@)=
?(?<host>(?<IP-literal>\[(?:(?<IPv6address>(?:\h{1,4}:){6}(?<ls32>\h{1,4}:\=
h{1,4}|(?<IPv4address>(?<dec-octet>[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]|\d)\.\g<=
dec-octet>\.\g<dec-octet>\.\g<dec-octet>))|::(?:\h{1,4}:){5}\g<ls32>|\h{1,4=
}?::(?:\h{1,4}:){4}\g<ls32>|(?:(?:\h{1,4}:)?\h{1,4})?::(?:\h{1,4}:){3}\g<ls=
32>|(?:(?:\h{1,4}:){,2}\h{1,4})?::(?:\h{1,4}:){2}\g<ls32>|(?:(?:\h{1,4}:){,=
3}\h{1,4})?::\h{1,4}:\g<ls32>|(?:(?:\h{1,4}:){,4}\h{1,4})?::\g<ls32>|(?:(?:=
\h{1,4}:){,5}\h{1,4})?::\h{1,4}|(?:(?:\h{1,4}:){,6}\h{1,4})?::)|(?<IPvFutur=
e>v\h++\.[!$&-.0-;=3DA-Z_a-z~]++))\])|\g<IPv4address>|(?<reg-name>(?:%\h\h|=
[!$&-.0-9;=3DA-Z_a-z~])*+))(?::(?<port>\d*+))?)(?<path-abempty>(?:\/(?<segm=
ent>(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~])*+))*+)|(?<path-absolute>\/(?:(?<segment=
-nz>(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~])++)(?:\/\g<segment>)*+)?)|(?<path-rootle=
ss>\g<segment-nz>(?:\/\g<segment>)*+)|(?<path-empty>))(?:\?(?<query>[^#]*+)=
)?(?:\#(?<fragment>(?:%\h\h|[!$&-.0-;=3D@-Z_a-z~\/?])*+))?)\z/
++    RFC3986_relative_ref =3D /\A(?<relative-ref>(?<relative-part>\/\/(?<a=
uthority>(?:(?<userinfo>(?:%\h\h|[!$&-.0-;=3DA-Z_a-z~])*+)@)?(?<host>(?<IP-=
literal>\[(?:(?<IPv6address>(?:\h{1,4}:){6}(?<ls32>\h{1,4}:\h{1,4}|(?<IPv4a=
ddress>(?<dec-octet>[1-9]\d|1\d{2}|2[0-4]\d|25[0-5]|\d)\.\g<dec-octet>\.\g<=
dec-octet>\.\g<dec-octet>))|::(?:\h{1,4}:){5}\g<ls32>|\h{1,4}?::(?:\h{1,4}:=
){4}\g<ls32>|(?:(?:\h{1,4}:){,1}\h{1,4})?::(?:\h{1,4}:){3}\g<ls32>|(?:(?:\h=
{1,4}:){,2}\h{1,4})?::(?:\h{1,4}:){2}\g<ls32>|(?:(?:\h{1,4}:){,3}\h{1,4})?:=
:\h{1,4}:\g<ls32>|(?:(?:\h{1,4}:){,4}\h{1,4})?::\g<ls32>|(?:(?:\h{1,4}:){,5=
}\h{1,4})?::\h{1,4}|(?:(?:\h{1,4}:){,6}\h{1,4})?::)|(?<IPvFuture>v\h++\.[!$=
&-.0-;=3DA-Z_a-z~]++))\])|\g<IPv4address>|(?<reg-name>(?:%\h\h|[!$&-.0-9;=
=3DA-Z_a-z~])++))?(?::(?<port>\d*+))?)(?<path-abempty>(?:\/(?<segment>(?:%\=
h\h|[!$&-.0-;=3D@-Z_a-z~])*+))*+)|(?<path-absolute>\/(?:(?<segment-nz>(?:%\=
h\h|[!$&-.0-;=3D@-Z_a-z~])++)(?:\/\g<segment>)*+)?)|(?<path-noscheme>(?<seg=
ment-nz-nc>(?:%\h\h|[!$&-.0-9;=3D@-Z_a-z~])++)(?:\/\g<segment>)*+)|(?<path-=
empty>))(?:\?(?<query>[^#]*+))?(?:\#(?<fragment>(?:%\h\h|[!$&-.0-;=3D@-Z_a-=
z~\/?])*+))?)\z/
+     attr_reader :regexp
+=20
+     def initialize
+diff --git a/lib/uri/version.rb b/lib/uri/version.rb
+index 82188e2..7497a7d 100644
+--- a/lib/uri/version.rb
++++ b/lib/uri/version.rb
+@@ -1,6 +1,6 @@
+ module URI
+   # :stopdoc:
+-  VERSION_CODE =3D '001100'.freeze
++  VERSION_CODE =3D '001201'.freeze
+   VERSION =3D VERSION_CODE.scan(/../).collect{|n| n.to_i}.join('.').freeze
+   # :startdoc:
+ end
+diff --git a/test/uri/test_common.rb b/test/uri/test_common.rb
+index 5e30cda..1d34783 100644
+--- a/test/uri/test_common.rb
++++ b/test/uri/test_common.rb
+@@ -78,6 +78,17 @@ class TestCommon < Test::Unit::TestCase
+     assert_raise(NoMethodError) { Object.new.URI("http://www.ruby-lang.or=
g/") }
+   end
+=20
++  def test_parse_timeout
++    pre =3D ->(n) {
++      'https://example.com/dir/' + 'a' * (n * 100) + '/##.jpg'
++    }
++    assert_linear_performance((1..10).map {|i| i * 100}, rehearsal: 1000,=
 pre: pre) do |uri|
++      assert_raise(URI::InvalidURIError) do
++        URI.parse(uri)
++      end
++    end
++  end
++
+   def test_encode_www_form_component
+     assert_equal("%00+%21%22%23%24%25%26%27%28%29*%2B%2C-.%2F09%3A%3B%3C%=
3D%3E%3F%40" \
+                  "AZ%5B%5C%5D%5E_%60az%7B%7C%7D%7E",
+--=20
+2.35.5
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtoo=
ls/ruby/ruby_3.1.3.bb
index c8454da3a9..320de83c34 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_V=
ER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.=
patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.p=
atch \
+           file://CVE-2023-28755.patch \
            "
 UPSTREAM_CHECK_URI =3D "https://www.ruby-lang.org/en/downloads/"
=20
--=20
2.25.1


