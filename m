Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6F1C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.53254.1638136765522837726
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZfNkeSj4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id u17so10477901plg.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eey/Sjaqqw8Vl2VMOY7ve7kgbmINy0SiDmiP6fdyXwU=;
        b=ZfNkeSj4FIwLpesJuoiUwhXJ0rJWbyF+We5FHRoZZHvRQ1eNgvWxQq7VzhcXG54hLp
         FRC5udropwXCY2gXK7Ux5YzSN+ajDB0hYE5yDaF6IgFfsT60O8OChmYi4olu2pz4/p/f
         iPQOLIrjUDKumkPDi97CXUmreqnw8W6NSTiZhV33coK7UFI2Eu0LTOVaIb6bLt2dBWZD
         EWdtUnQw32OROWBGp9uCeGdgmwf+SfBexPlVY6YhLygzAld4I0jGabXf5K69Qr3Fhekv
         KfspTA20MZAqBeCnWWszNGnfWpuwiv1/pON/vXj6lxqBlkHw4FIUNuuiEc7LzflXdxP2
         O82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eey/Sjaqqw8Vl2VMOY7ve7kgbmINy0SiDmiP6fdyXwU=;
        b=Z52TTfFIvi6eI1dDrhus1oIEsh0Z3+vfFziGyff6ybvnf1h7cMlTno2hJhnjmbqSWi
         KL3iK2tTfmkbLXsAijNROnCvIwxf/Iroaa0kJHaVdUAosNeeICBfWSxQcAAWHv0iKYVQ
         7mQuELx6hhEJS04Sko55I7CcyeAyl0lmVHU66A+4dffwBnSx4kDEvU0vqUfXkXlexTxo
         Spggmhds/9iN5SlaaPhwrsJ7T3VSjSK1MIwNZhy1AjsupKXQc2iqz6w4vC4vrApE98sr
         Zm4KiaAnfxgHE7du6rL4nlWqSWef2PMMEfo9R9+LjPg/BiSDwFpExfhnaYgkDk3PIISZ
         pGvw==
X-Gm-Message-State: AOAM533WQo4tAYSv0JzZVwfEpBr9H09ZD3jfFOoKDop3KyYqpE37qG0I
	eomLogaRuMK6HiuupT98HEHJQXbb3MaRcmlx1gY=
X-Google-Smtp-Source: 
 ABdhPJyEQ60k2qlpiajdL516F57plMyXT833JtPK8xSIOP9csHZp3lKHNi/gdcTu4iemLKrbfxrAtA==
X-Received: by 2002:a17:903:11cd:b0:143:d220:fdd8 with SMTP id
 q13-20020a17090311cd00b00143d220fdd8mr54814967plh.79.1638136764444;
        Sun, 28 Nov 2021 13:59:24 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/42] systemd-bootchart: submit musl patches
 upstream
Date: Sun, 28 Nov 2021 11:57:38 -1000
Message-Id: 
 <b25133e55dfa03d9e36b083659931e9b6d69bfec.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158908

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit abb4f439cdb364f7b04da8bd452fc18dbe44e67e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch | 2 +-
 .../systemd-bootchart/0002-musl-does-not-provide-printf-h.patch | 2 +-
 .../0003-musl-does-not-provide-canonicalize_file_name.patch     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
index f392ceafcc..12eecc989b 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0001-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
@@ -12,8 +12,8 @@ systemd/0013-comparison_fn_t-is-glibc-specific-use-raw-signature-.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
-Upstream-Status: Pending
 
  src/util.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
index 196272f7a2..8be3bed395 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0002-musl-does-not-provide-printf-h.patch
@@ -10,8 +10,8 @@ Original patch author: Emil Renner Berthing <systemd@esmil.dk>
 Includes work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
-Upstream-Status: Pending
 
  Makefile.am               |   4 +
  configure.ac              |   3 +
diff --git a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
index 7670d95f07..c2c276e458 100644
--- a/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
+++ b/meta/recipes-devtools/systemd-bootchart/systemd-bootchart/0003-musl-does-not-provide-canonicalize_file_name.patch
@@ -9,8 +9,8 @@ systemd/0007-check-for-missing-canonicalize_file_name.patch
 Based on work by: Khem Raj <raj.khem@gmail.com>
 
 Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+Upstream-Status: Submitted [https://github.com/systemd/systemd-bootchart/pull/47]
 ---
-Upstream-Status: Pending
 
  src/path-util.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.25.1


