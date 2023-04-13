Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0EEC77B61
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 05:36:21 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.5700.1681364170721942077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 22:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RRYvJMBo;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-63b5465fc13so663b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 22:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1681364170; x=1683956170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLAlL3qtDouShr+OQGrdlnlLFp7lse8qgHm07mpgJLQ=;
        b=RRYvJMBo93Av/npdQRtcA2W3YAMs6VPlo70IxuYeRORD3nDxGSTEty0TSIr6ajWNgr
         58N6PSm4a9qO5RjQZTG6az6Iiom57LJkzQmYO++5Xy0XckuNKoUXpf4jqBRCswhSGo9D
         mjXM0FLwZ3spueetZRm71VOFZPK1PrDTNa9eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681364170; x=1683956170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLAlL3qtDouShr+OQGrdlnlLFp7lse8qgHm07mpgJLQ=;
        b=lgcBar2FPSwqz5CzPqbOmMxOlfh6FgJWDPogpheiB5qrC0eAxFj1hF5Ls6urqfkzju
         wD+F1fIYoROMHRv5JECe4SeghEzmX+s8CZ+4R1aKZKoPlc2kPdj9ukcCdfs+YdSrgZ3Z
         781ApXh1M3FLk5ddH+CwMmZKDFvPsJnQnQVZ1bPp7uv3XfGOoGCkOZZ+nhuoQUbT2Vio
         wFYm+NSztKTIZVIV+0cSE8jAL3UAPR1m56+su0uvuJ9umfDOPZmZ/M3eD12QcRo0NZcv
         Hz8tceCUPiRrSKCKc2ZFRPN7gh2fC3vT6NdNIOFmhqAH3bCI5iAPG7Sy0bJfiYiX4gNW
         bP8A==
X-Gm-Message-State: AAQBX9ctA8hNaoL9kmqpOW1sOsBmHpkWHGrYve0a+qbHnmktQhC8AILi
	14k/5XiEBO0tbS7tgpQ88pDCxzGKK64lhJMA3yE=
X-Google-Smtp-Source: AKy350Z2ruLVe4igCYf9yzHd/27az+pg44/GEVIMnOZamHUU4qrKdRwYQYFxqO7HjozQO30F+04cfA==
X-Received: by 2002:a05:6a00:b4f:b0:634:dcf7:e885 with SMTP id p15-20020a056a000b4f00b00634dcf7e885mr2398354pfo.25.1681364169908;
        Wed, 12 Apr 2023 22:36:09 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.197])
        by smtp.gmail.com with ESMTPSA id z9-20020aa791c9000000b0062e63cdfcb2sm422029pfa.93.2023.04.12.22.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 22:36:09 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 13 Apr 2023 11:06:04 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] ruby: CVE-2023-28756 ReDoS vulnerability in Time
Date: Thu, 13 Apr 2023 11:06:02 +0530
Message-Id: <20230413053602.95914-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 05:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179956

Upstream-Status: Backport from https://github.com/ruby/ruby/commit/957bb7cb81995f26c671afce0ee50a5c660e540e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../ruby/ruby/CVE-2023-28756.patch            | 61 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.6.bb      |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch b/meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch
new file mode 100644
index 0000000000..c25a147d36
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2023-28756.patch
@@ -0,0 +1,61 @@
+From 957bb7cb81995f26c671afce0ee50a5c660e540e Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Wed, 29 Mar 2023 13:28:25 +0900
+Subject: [PATCH] CVE-2023-28756
+
+CVE: CVE-2023-28756
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/957bb7cb81995f26c671afce0ee50a5c660e540e]
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/time.rb       | 6 +++---
+ test/test_time.rb | 9 +++++++++
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/lib/time.rb b/lib/time.rb
+index f27bacd..4a86e8e 100644
+--- a/lib/time.rb
++++ b/lib/time.rb
+@@ -501,8 +501,8 @@ class Time
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
+@@ -717,7 +717,7 @@ class Time
+   #
+   # If self is a UTC time, Z is used as TZD.  [+-]hh:mm is used otherwise.
+   #
+-  # +fractional_digits+ specifies a number of digits to use for fractional
++  # +fraction_digits+ specifies a number of digits to use for fractional
+   # seconds.  Its default value is 0.
+   #
+   #     require 'time'
+diff --git a/test/test_time.rb b/test/test_time.rb
+index ca20788..4f11048 100644
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
+   def test_encode_rfc2822
+     t = Time.utc(1)
+     assert_equal("Mon, 01 Jan 0001 00:00:00 -0000", t.rfc2822)
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_2.7.6.bb b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
index 3af321a83e..91ffde5fa3 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.6.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.6.bb
@@ -7,6 +7,7 @@ SRC_URI += " \
            file://run-ptest \
            file://0001-Modify-shebang-of-libexec-y2racc-and-libexec-racc2y.patch \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
+           file://CVE-2023-28756.patch \
            "
 
 SRC_URI[md5sum] = "f972fb0cce662966bec10d5c5f32d042"
-- 
2.25.1


