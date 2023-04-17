Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB9C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 04:43:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.47095.1681706586004680779
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 21:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=ai2b/u25;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id s6-20020a17090a698600b00247a7794e78so442935pjj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 21:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681706585; x=1684298585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3sn5gNd7aGlcmuBEQ5Jk601/nVUvhlSqZI3i6PKzT0=;
        b=ai2b/u25LVZRvCuQR8vpHoiL4VksrK6JTINaeJfjufpMGJMtoVj8hHNB2yOGU0Te7u
         9rq9xvC41Cv5ICDhDN02jB9S5YHCOVV6g6R0Ii7O4AurAJG8L8Ds6gkAiBq/0apeBpST
         uxx/unLM6EbCvUHb2D9iukfCz54ByKv5z1ttg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681706585; x=1684298585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3sn5gNd7aGlcmuBEQ5Jk601/nVUvhlSqZI3i6PKzT0=;
        b=DMOoLEuCKUCovuVhpNKAMS46yg/Gx9GApEWUCVVms6ahLRFS1s5IcJSvpgupOVSB4X
         ymgPtKwOhjJ94Y64aARyHjHAzfgQ+5oMmc9SGZvzx0gCf7/B/cB0vAlPuwoAoGTSwcGt
         9h06a8COKX/n3nJsQkzaTBhWCsvsaBQ8HZRq53/7/fhWMHbGnYBBtc2aSwvp8znl0sV9
         gkDLi9gByzosJY474hltmu8onhKjK/1Zb4y78lWGGNNwTjZxvtdRa/6i+JjlYvB2e/my
         6QLP7FfXasaDCYWBjl+Abz4vKSFdyz8zYSTqoir1n7bn0Ngo559OylLkhlFSxPDh/NZL
         9+Lg==
X-Gm-Message-State: AAQBX9eqBEoqYKeSE9/DLzhJvcSBEkfRh9KgWHppW9ZixkemMoOz1v6X
	H01o+5kl5Fskn52xGzv3hwR0LemBE6vZulIyQ70=
X-Google-Smtp-Source: AKy350bsDDrqVxM8cNIuxFcAON0NEiCWbWGinNfM4TcH8RlXh2kpPTStc0AgNtEMOdhBIGRT5nFO2w==
X-Received: by 2002:a17:902:eec6:b0:1a2:9183:a49c with SMTP id h6-20020a170902eec600b001a29183a49cmr12021880plb.32.1681706585080;
        Sun, 16 Apr 2023 21:43:05 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.209])
        by smtp.gmail.com with ESMTPSA id ix3-20020a170902f80300b001a69918611csm4983822plb.72.2023.04.16.21.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 21:43:04 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Mon, 17 Apr 2023 10:12:59 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] ruby: CVE-2023-28756 ReDoS vulnerability in Time
Date: Mon, 17 Apr 2023 10:12:58 +0530
Message-Id: <20230417044258.47774-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 04:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180116

Upstream-Status: Backport from https://github.com/ruby/ruby/commit/957bb7cb81995f26c671afce0ee50a5c660e540e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


