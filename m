Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2CBC77B70
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:34:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.10668.1681572841209186941
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=p+AlPXvh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id la3so21081002plb.11
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572840; x=1684164840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mTZX6Gvp+DLIdcWH+qoV/0dIGmdBLjyOJKGgUG0SgM=;
        b=p+AlPXvhl5ZOS6QKOAWJBQk8UHJS1AUogvijEA4L6uCNA0mcOpknkblxMAMBC2DD2P
         pnNFcdlHfM2c+qMNPW/xAaoHw2uEUbNyDqmeVgNwCkFf2RkZl1tmYDGfjiCicTiF86Jm
         m0pu/+t3cJ7/d09EvjpUBQth6P+9F9XOCi4p02O/Pv8JDfoXE8qiVSp8q7eJmJDFe9pZ
         LZL5uxpHngWCdbbQEbv11AtAQ0awMD0DjjPLsl8atdFIUp28bosFZ1yqmlrTdGcjX8cL
         mRf28wQqGgRypAfCBIYPXuxt2Yq2W98O/eJDS7kuW88ivgbSoM9eWXgnT0p/3LyocXIr
         YRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572840; x=1684164840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mTZX6Gvp+DLIdcWH+qoV/0dIGmdBLjyOJKGgUG0SgM=;
        b=NpBw7b+zUhOUWPHLvidvagNpQkvpe91SXa8bnDolgb+Bp1qrG3cRlao6CIEC0Zhcir
         M1zMDJcMNh7LhYljJl+uIGEW6HR1eRhRkdk/PlQmTd6CBFQdrnkZ/IH4ElXPO/09tHtz
         lvwwXXlbmNyJOTf720nwHRYFfJg/ggz6exaCSt9CqLcgBDDaJWOaUUJ9bwcSg4eD43/X
         VdGS6Y7vXrnHY0adtGgHuc2smsRK1S1+D7XUCbNK6Gm8Z5v0Z3WARf1RVp4z4TxKh8FR
         tUS/1y8qvHdx4vALglT6W8EMYIB72W1r8QnNLcW+vfKSgL5R5F+0Aqm2WhT397WNorEJ
         ybLQ==
X-Gm-Message-State: AAQBX9fpV5pcd/tfQnJvflC624EuNi4DUOC456PJn/AqXDkj69JeCWWr
	jOsL4EB1kc5k3UiSLK9qyCP2JbsJ0dbjFQBOeEc=
X-Google-Smtp-Source: AKy350a/ysYdzjELHuUcIRrQV4O4/dmrAYuCCchZfy2L5OU9iWrUJ8INmw70iwpeunl22989KkNmwA==
X-Received: by 2002:a17:90b:18f:b0:23f:962e:826b with SMTP id t15-20020a17090b018f00b0023f962e826bmr9377574pjs.15.1681572840259;
        Sat, 15 Apr 2023 08:34:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id cs19-20020a17090af51300b002367325203fsm6313969pjb.50.2023.04.15.08.33.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:33:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/4] ruby: CVE-2023-28756 ReDoS vulnerability in Time
Date: Sat, 15 Apr 2023 05:33:38 -1000
Message-Id: <52d26edffdd0444588ecad56b40a65e225889a01.1681572706.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572706.git.steve@sakoman.com>
References: <cover.1681572706.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180021

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/ruby/ruby/commit/957bb7cb81995f26c671afce0ee50a5c660e540e

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


