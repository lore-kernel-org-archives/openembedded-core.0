Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2ABE748F6
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.62162.1696176054162263816
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A6Gdu9Tf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c5c91bece9so126622725ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176053; x=1696780853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TgpCgtbS5WghIwlJAFH+S3cc9TdzF25hMjr+1iy+eI=;
        b=A6Gdu9TfJMfQTsbTH1rP4Riepv1t6Dd0eO/PotvqvmCwqGvuvHL8dTPtwZtJOuSpN3
         J0KUa9uyPAw3YK/RjFMeLsYD/9cfFDrCwp1ooPgL2a6AUKGG2lEUZf+eC8jmnX0LnO6U
         zAnRnmrmGqZJqwYsxsT5laJozZo/wbALLRgP+O+s26KOy/P527tkY+D52+QxvyqEfSJ8
         5qnNwvvpiyjJq+NKabblYJSk+R88oPRruAl/IC5QcYs1KuKVw9y/WKNzXpC0+Wt+nwUZ
         j/5Wce05c7oAs6bO/Ogvx3UQ74WPMUmNAaF1Y1rwYmrnMgjJCnNMbbhzbG6SjdLXCjsH
         F+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176053; x=1696780853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TgpCgtbS5WghIwlJAFH+S3cc9TdzF25hMjr+1iy+eI=;
        b=xF5NUiSXjbRRuCAECfJ6o6PKo0rQlcd+Bc7tXs4QxD8N18j8DglnksElRXc0vU5soT
         QNYA6EaIpGP7ikdx2AUcxn8rGeyxcU/vswCelelwf9Xeo/IXUn1xd56hXZrEqA8dedOB
         My4w/N5S0fhPtkNM8wvon7jbaF/gyFwEBrHnwFSTawKA69Q+M4h3ug3fyS+cclXMGZ8U
         LXYl7qQlmuIRb+Ts+aPWxjzyySyDqPYUX4O5nzBq7v49rPyqOKcLBckbKFzQkU6yCOWz
         NOUy1mBzqfVPVXQqmGv6xgLtEfjv1guBLn87uPhwgRCX3Twmi/3Bdcprg/UiuGrwXCte
         ofDw==
X-Gm-Message-State: AOJu0YwWWKEmJfE58ofAbqAF9UEy+ZBqtSt6bX4VvZAcOnPGpmq37Z59
	mRejh0tXD8JPuLCd8ys8BR0ja9I+AT+UvhrhOIqIHw==
X-Google-Smtp-Source: AGHT+IEVQC9pefaJgVXJOYhAm7jiA+7xenOPkYsYEGfjdRKdHbu92RPhoxwKMGrrjtFd04plX5Sl2g==
X-Received: by 2002:a17:903:11cc:b0:1c3:c127:540 with SMTP id q12-20020a17090311cc00b001c3c1270540mr9505856plh.29.1696176051670;
        Sun, 01 Oct 2023 09:00:51 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/23] systemd-bootchart: musl fixes have been rejected upstream
Date: Sun,  1 Oct 2023 06:00:05 -1000
Message-Id: <836d8d5b645ded6cb1da9368efc9ca563595503a.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188507

From: Alexander Kanavin <alex.kanavin@gmail.com>

Systemd upstream has reiterated that the only supported libc
implementation is glibc.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3655b965a0b13518e35b3312e1ae7b59b1f231a6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch | 2 +-
 .../systemd-bootchart/0002-musl-does-not-provide-printf-h.patch | 2 +-
 .../0003-musl-does-not-provide-canonicalize_file_name.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
index 12eecc989b..812900051a 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -12,7 +12,7 @@ systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
+Upstream-Status: Denied [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
 
  src/util.h | 2 +-
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
index 8be3bed395..2fac76a549 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
@@ -10,7 +10,7 @@ Original patch author: Emil Renner Berthing <systemd@esmil.dk>
 Includes work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
+Upstream-Status: Denied [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
 
  Makefile.am               |   4 +
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
index c2c276e458..fbe9c93d2d 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
@@ -9,7 +9,7 @@ systemd/0007-check-for-missing-canonicalize_file_name.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
-Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
+Upstream-Status: Denied [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
 
  src/path-util.c | 2 +-
-- 
2.34.1


