Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4CEC4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 04:22:11 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.3043.1668572524816194511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 20:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FtVVhTSN;
 spf=pass (domain: mvista.com, ip: 209.85.215.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f176.google.com with SMTP id o13so15549463pgu.7
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 20:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rbVYpJv3OI3tnMC43Vr283A+VNpVfgZJp3OaAoHDH0c=;
        b=FtVVhTSNY8gReLos8nutyClVV2X0I/8Wn+Ex4KGdrRb1I7OxNfTEYn47qHWAn/KoO3
         630eWGarAnXBROvo/GOS/Kqz+hJeLhhHSk7FOBt/6/ffN3VLfqF9ziCCMCHIMgSPgmTs
         doRWGZxov6+HaimiPI2Pae3Uca2CZadwgzkpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbVYpJv3OI3tnMC43Vr283A+VNpVfgZJp3OaAoHDH0c=;
        b=7NCyBtUbNBFdcNux1iLnwZnDTDs4TEGW1OXZy+nl6ds+vSBVNnzS84OB8CZFWliM/N
         Ybgwe+4ey0vNZINASvYGHwQL557hNNoJuaRmX8gycP2IMPJAZb00PJTrqGecWpiX9FtN
         AK8hZo4Z8/+asisqt2bcWZsWnr1/RjIMKQD1LBIYyFF8FDB17ZpxP6hF695K2GjGrpid
         n5zHZu2LDfPczBvm6XJPeqkCujmlRB+A8yIg4A+2/0txMAqqmFYATnSau3fvHe3Hx3a3
         ZLjH3HkjIOAyen41fYEOr5nfEXPqK7yOZ325u+XMB939Uw6d63y++xhc/VfvKAb1BlSf
         hPlg==
X-Gm-Message-State: ANoB5pl9Q798ZE2QevWuY8/AXAplgiciZ/b77s+PXmDFZtxgAGsNZFOQ
	CnHy+xJWyw33yVaPqwQMq9JMWYoUagFCPw==
X-Google-Smtp-Source: AA0mqf7WSUgFzBKH8K/BwhCQh3/+Zu4+0Y1o9Pw6Qt5AcQlaQE1ggazN+Pf/qHoOl+xXsXK5/Vf/ZA==
X-Received: by 2002:a62:e710:0:b0:563:9203:cc53 with SMTP id s16-20020a62e710000000b005639203cc53mr21241447pfh.20.1668572523434;
        Tue, 15 Nov 2022 20:22:03 -0800 (PST)
Received: from MVIN00024 ([150.129.170.236])
        by smtp.gmail.com with ESMTPSA id c129-20020a621c87000000b00561b3ee73f6sm9993909pfc.144.2022.11.15.20.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 20:22:02 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 16 Nov 2022 09:51:57 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] systemd: CVE-2022-3821 Fix buffer overrun
Date: Wed, 16 Nov 2022 09:51:56 +0530
Message-Id: <20221116042156.5507-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 04:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173374

Upstream-Status: Backport from https://github.com/systemd/systemd-stable/commit/72d4c15a946d20143cd4c6783c802124bc894dc7

Affects "systemd <= 251"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../systemd/systemd/CVE-2022-3821.patch       | 45 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
new file mode 100644
index 0000000000..eb8b0cba12
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
@@ -0,0 +1,45 @@
+From bff52d96598956163d73b7c7bdec7b0ad5b3c2d4 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 15 Nov 2022 16:52:03 +0530
+Subject: [PATCH] CVE-2022-3821
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/72d4c15a946d20143cd4c6783c802124bc894dc7]
+CVE: CVE-2022-3821
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/basic/time-util.c     | 2 +-
+ src/test/test-time-util.c | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index b659d6905d..89dc593d44 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -588,7 +588,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
+                         t = b;
+                 }
+ 
+-                n = MIN((size_t) k, l);
++                n = MIN((size_t) k, l-1);
+ 
+                 l -= n;
+                 p += n;
+diff --git a/src/test/test-time-util.c b/src/test/test-time-util.c
+index 4d0131827e..8db6b25279 100644
+--- a/src/test/test-time-util.c
++++ b/src/test/test-time-util.c
+@@ -238,6 +238,11 @@ TEST(format_timespan) {
+         test_format_timespan_accuracy(1);
+         test_format_timespan_accuracy(USEC_PER_MSEC);
+         test_format_timespan_accuracy(USEC_PER_SEC);
++
++        /* See issue #23928. */
++        _cleanup_free_ char *buf;
++        assert_se(buf = new(char, 5));
++        assert_se(buf == format_timespan(buf, 5, 100005, 1000));
+ }
+ 
+ TEST(verify_timezone) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 5d568f639e..8b6d0e8580 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
+           file://CVE-2022-3821.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


