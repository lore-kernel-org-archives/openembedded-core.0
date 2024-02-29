Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7749C54E41
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 12:05:22 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.23114.1709208322604568167
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 04:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XE3CCK+p;
 spf=pass (domain: baylibre.com, ip: 209.85.214.182, mailfrom: pidge@baylibre.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc9222b337so8492265ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 04:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1709208322; x=1709813122; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijbTpKzbpw920mhErlLGe/Sdxq8DANn5qHLyA3MPp80=;
        b=XE3CCK+ptmiSnwKztttCsn08sLCvjj1uHs1md8ao+h7RA3YNvf/4BLPIpaaLBI92ny
         bnXBie10z5YukZ+X0ukKfF2BGx8MSaPvxhHixXkZjXGmKacRmGEHpb+etCHk7h+B7ogM
         QZ9ORs593pAVWY5iZVhNbaMHOthZtpqIUJMjnEupQdqCYA+IvJuYAQWuV3uWOGWJad8d
         Noc8rh91m/M58/u6ssGO41O4JhC4agU99GwKhKFTFUcnLRfNxU67ENSEsEaDKXlX8ucs
         w7ysh70+5kaidyuSYlCQfrJCZq6fJgmZctW5WIv+/Zt9dr9V9fAyK/2ar+kzys3qur0M
         eVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208322; x=1709813122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ijbTpKzbpw920mhErlLGe/Sdxq8DANn5qHLyA3MPp80=;
        b=LI4j3KRnWBvPklWyIpo0zIHP/nF0yegPkJwYlW2l4hipgAjQPVkjliaJFiyaYviw0f
         VlAZ+JvQ6oKjNNtzP7uPhq1p+GUT3aHcZzDH7U1H7wx3MJSbQJP+/g0Ho+KQquCwo+b6
         4qH2An1tiU2K3zFJulcpFKYzLf8M/pJRlPK5YtB5tJNJMsJt53AEJbh88+49gjs2c6MC
         HEc33ZuzzwWP6p5hLwkETldB9Eeg9aWpTUyhnz9SS9f8HLlKjsXXI7x41R4INtkpCrk6
         k7oj/OxubU+Ds8nOdOHFTuDHm/rYMQ23FcNztzOVizl76ft5GgIVfnWwtmoKyMZCiqdd
         hUdQ==
X-Gm-Message-State: AOJu0Yw/1am65fEF875wu6Qd57g/RRc5uArqS3MNqw1+BpVgRvHNurPr
	JB35M8GEbtj+M7rXWUeVs75M+pjDG82Ho+it2k25Cgv/KRWSHudJLUzqIbmrrgfnddc91HKZnm8
	EeLE=
X-Google-Smtp-Source: AGHT+IExinCU1fN0XCkIqbaCS+PvoZh4tXCu86NFhZHfoVRnMVqnvODgxQmJExm2QvVgQ8YQOgKMVA==
X-Received: by 2002:a17:902:8d8c:b0:1db:d586:b2d with SMTP id v12-20020a1709028d8c00b001dbd5860b2dmr1630434plo.18.1709208322075;
        Thu, 29 Feb 2024 04:05:22 -0800 (PST)
Received: from orm.fritz.box ([194.110.145.164])
        by smtp.gmail.com with ESMTPSA id j6-20020a170903024600b001db608107ecsm1289675plh.167.2024.02.29.04.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:05:21 -0800 (PST)
From: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 2/4] qemurunner.py: Fix error on calls to run_monitor
Date: Thu, 29 Feb 2024 12:05:05 +0000
Message-Id: <0e2725349e86ea3a5324651b67e7fad0da897d22.1709207755.git.pidge@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709207755.git.pidge@baylibre.com>
References: <cover.1709207755.git.pidge@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 12:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196432

A change in QEMUMonitorProtocol.cmd() requires that we either pass in
kwargs instead of an argument dict or move to cmd_raw()

cmd() was renamed to cmd_raw() (and command() was renamed to cmd())
See:
https://github.com/qemu/qemu/commit/37274707f6f3868fae7e0055d9a703006fc142d0
https://github.com/qemu/qemu/commit/684750ab4f8a3ad69512b71532408be3ac2547d4

My concern with this patch is that I haven't seen this come up with
utils/dump.py which also uses QemuMonitor's run_monitor. If it is
occuring, this should fix issues there as well

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 277cd328484..cda43aad8c5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -650,9 +650,9 @@ class QemuRunner:
         if hasattr(self, 'qmp') and self.qmp:
             self.qmp.settimeout(timeout)
             if args is not None:
-                return self.qmp.cmd(command, args)
+                return self.qmp.cmd_raw(command, args)
             else:
-                return self.qmp.cmd(command)
+                return self.qmp.cmd_raw(command)
 
     def run_serial(self, command, raw=False, timeout=60):
         # Returns (status, output) where status is 1 on success and 0 on error
-- 
2.34.1


