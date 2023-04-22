Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33C9C77B7F
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:54:59 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.10293.1682178893075932394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xbfSrBVS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1a67bcde3a7so34611585ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682178892; x=1684770892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ibe4sE/z4qA8aYoR3a3Ndn/KiaKklsxlSgZtqM9qlzs=;
        b=xbfSrBVS2160mvxCh7JSiXLEmLOi76f9zpkw/0xnZfA9C8njhkGz9rkgIQtBjOKkPB
         dEepJkUpatDu8N0LqSRYgXj54XpC+t7z5tjeIoPuyfNcmS1cVB3390WUKdq8ii4LGaOY
         ZXv3lQqhQw/BP0R6P/RqegYumjNP9Syoa+yOUFoGZkzr5+/df95jhdT1F1qCu7euAO6q
         QUIYkzHWJ16D4m/5BGCOr3n1MqdPKCzB8VVlBQYDjeWgIDe03I6lpNG47VAWV14WT8PJ
         KmxxJFt4usWu2szpVKHQlcvdKoasE0r+np1xfH/MFeIUc38/k9jEkEst93vQP9K9liJV
         X0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682178892; x=1684770892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ibe4sE/z4qA8aYoR3a3Ndn/KiaKklsxlSgZtqM9qlzs=;
        b=Y5CfNjAQE0ciF3v607VdNyIo170NfKb/oCOGPOkr/EOFd0spvcoywFJSeFLmWcxHk1
         uExyjogyOopAw/sz+1kJsRgD6ZA0FopS57H7NWU+2ka0xDKwFlwIdyr1KLryqVVsQbaB
         tHo2hI0LuHgjNXwhkXjhBUVmpIrd0NOqCysgeiP0JzphMqLUu2cWCjdLat/AnVeAjZdJ
         PLuskQWxHMyE5d7l52P5c67f0a0AUMJi08tgBxd8afzCc+VLv3loYcvTA3N7+m8dryd7
         7lqy9vAwoWashQkiBkCW5Ytx4ZTqOSNRriW3vxeYXMH3I48cW6Ufzip9S3beVtFslOAB
         XluQ==
X-Gm-Message-State: AAQBX9dsuRZ8KMq6RoEdTWjdxuDsH0hFLJjyXzeJdKln8HA0vYwGTHWj
	mbQbMUR02exfxqDBcOBz8i1j7hZs9aL4boy6eI0=
X-Google-Smtp-Source: AKy350Zaa49e99p84QXMY/g7qq9aR2c44jMAla3Oi2tKq2b+tGcVqg+eAR8HH3VpVxelQut/dqkRWA==
X-Received: by 2002:a17:902:e742:b0:1a9:1b4:9fd5 with SMTP id p2-20020a170902e74200b001a901b49fd5mr9793057plf.68.1682178892120;
        Sat, 22 Apr 2023 08:54:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001a686578b44sm4205342pld.110.2023.04.22.08.54.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:54:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] ruby: CVE-2023-28756 ReDoS vulnerability in Time
Date: Sat, 22 Apr 2023 05:54:33 -1000
Message-Id: <0f8eb0505e19ccd27e1b91f27285a9fc87f2aa93.1682178752.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178752.git.steve@sakoman.com>
References: <cover.1682178752.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180303

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/ruby/ruby/commit/957bb7cb81995f26c671afce0ee50a5c660e540e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ruby/ruby/CVE-2023-28756.patch            | 73 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch
new file mode 100644
index 0000000000..cf24b13f53
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch
@@ -0,0 +1,73 @@
+From 957bb7cb81995f26c671afce0ee50a5c660e540e Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Wed, 29 Mar 2023 13:28:25 +0900
+Subject: [PATCH] CVE-2023-28756
+
+CVE: CVE-2023-28756
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/957bb7cb81995f26c671afce0ee50a5c660e540e]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/time.gemspec  | 2 +-
+ lib/time.rb       | 6 +++---
+ test/test_time.rb | 9 +++++++++
+ 3 files changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/lib/time.gemspec b/lib/time.gemspec
+index 72fba34..bada91a 100644
+--- a/lib/time.gemspec
++++ b/lib/time.gemspec
+@@ -1,6 +1,6 @@
+ Gem::Specification.new do |spec|
+   spec.name          = "time"
+-  spec.version       = "0.2.0"
++  spec.version       = "0.2.2"
+   spec.authors       = ["Tanaka Akira"]
+   spec.email         = ["akr@fsij.org"]
+ 
+diff --git a/lib/time.rb b/lib/time.rb
+index bd20a1a..6a13212 100644
+--- a/lib/time.rb
++++ b/lib/time.rb
+@@ -509,8 +509,8 @@ class Time
+           (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)\s+
+           (\d{2,})\s+
+           (\d{2})\s*
+-          :\s*(\d{2})\s*
+-          (?::\s*(\d{2}))?\s+
++          :\s*(\d{2})
++          (?:\s*:\s*(\d\d))?\s+
+           ([+-]\d{4}|
+            UT|GMT|EST|EDT|CST|CDT|MST|MDT|PST|PDT|[A-IK-Z])/ix =~ date
+         # Since RFC 2822 permit comments, the regexp has no right anchor.
+@@ -701,7 +701,7 @@ class Time
+   #
+   # If self is a UTC time, Z is used as TZD.  [+-]hh:mm is used otherwise.
+   #
+-  # +fractional_digits+ specifies a number of digits to use for fractional
++  # +fraction_digits+ specifies a number of digits to use for fractional
+   # seconds.  Its default value is 0.
+   #
+   #     require 'time'
+diff --git a/test/test_time.rb b/test/test_time.rb
+index b50d841..23e8e10 100644
+--- a/test/test_time.rb
++++ b/test/test_time.rb
+@@ -62,6 +62,15 @@ class TestTimeExtension < Test::Unit::TestCase # :nodoc:
+     assert_equal(true, t.utc?)
+   end
+ 
++  def test_rfc2822_nonlinear
++    pre = ->(n) {"0 Feb 00 00 :00" + " " * n}
++    assert_linear_performance([100, 500, 5000, 50_000], pre: pre) do |s|
++      assert_raise(ArgumentError) do
++        Time.rfc2822(s)
++      end
++    end
++  end
++
+   if defined?(Ractor)
+     def test_rfc2822_ractor
+       assert_ractor(<<~RUBY, require: 'time')
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index c8454da3a9..92efc5db91 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -29,6 +29,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
+           file://CVE-2023-28756.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.34.1


