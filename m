Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E58C7EE23
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:20:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.51325.1682788852001233636
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=lfkZohDB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64115e652eeso19066504b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788851; x=1685380851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cuxd0KSAKW2egAr7ix3D5Z+Z994oXV2woH9DquAY2Qo=;
        b=lfkZohDBL4yV/nYQouYW2VtvoYO9kcBM/050rJ+v1bGfdYGs/L1Jy+z4eLsOK32v1x
         6G8Z+wEY0wH0yKDez6uWGphaerUq2+2kIHeO7dl64QqBjphlpnOhYSsgeDOSTngQpDEa
         I3oHz0aBKVAMEKaYVYLhnNgRq5jjGamv8FhodpBmG1xWiuIw/x4srUPAaE1sEM/apQLw
         coxbWt6iblpvmde4RdYNjylrac/1ZV5ZUdYZc1by199qUFdxnZvvcjnAzVJRmALM+1Xb
         h7JqyJOwRSiCW/X/pgsehRgvZ4U94hupDIf4WpiCjFcAUmcGUT4MANYCqJ0m0t9mQeaL
         mgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788851; x=1685380851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cuxd0KSAKW2egAr7ix3D5Z+Z994oXV2woH9DquAY2Qo=;
        b=LTotRtENgBevo1ITRrt1WcX/4fFcIN7d1yDRD2jXoZtmcC3XZUJlyCHkRBO3//w7ys
         /poCFNvNrSw/dihe9tjqMWbAut/xKgSSYz8VfIIg7ewDXOkGoCbFMDH1fRDYCU6/VYLw
         rKXoatCBKfEjO9CJo6WlTdKbKsQsfKG56Oup2FmZv8cBxEuf8xg7XHReHnCdXf0mOeAh
         X1LpXZZEdAFNEczfsENCwk9WfJY51pN3OU3g+kSw6n9e9Vo5TyFfl+RmpnBnXeASZPjf
         qsMS0o6ktDaLfBE8UxXsoft+3PIOc7HVNV5R7a+5XqQBsVYTdatBDiwIcGlKk7NDevJ4
         ADlw==
X-Gm-Message-State: AC+VfDylpDU52gReyTUsbCffRKWoZHQZsoxaVkq3R2enj3kWaqNDy/Et
	1t2dlankuUyYHYdrt/mLNmBh7+vPZkQo/PnCK1I=
X-Google-Smtp-Source: ACHHUZ4Kr9VMB36bs7niCtCZyx2xt9tGKDcTtXlwK6Ook9U1Jr03csxA2ZjA1tvuafdPdvo8ycVoIQ==
X-Received: by 2002:a17:903:1c9:b0:1a6:f5d5:b7f6 with SMTP id e9-20020a17090301c900b001a6f5d5b7f6mr16477440plh.10.1682788850883;
        Sat, 29 Apr 2023 10:20:50 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.20.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:20:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/13] ruby: Fix CVE-2023-28755
Date: Sat, 29 Apr 2023 07:20:21 -1000
Message-Id: <605634cf1adef2d9cf6dc6fdf17aa4032385497f.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180544

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-28755.

[1] https://github.com/ruby/ruby/commit/8ce4ab146498879b65e22f1be951b25eebb=
79300

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 92efc5db91..72030508dd 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -30,6 +30,7 @@ SRC_URI =3D "http://cache.ruby-lang.org/pub/ruby/${SHRT_V=
ER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.p=
atch \
            file://CVE-2023-28756.patch \
+           file://CVE-2023-28755.patch \
            "
 UPSTREAM_CHECK_URI =3D "https://www.ruby-lang.org/en/downloads/"
=20
--=20
2.34.1


