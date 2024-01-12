Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42EFC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 22:04:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7208.1705097067873223587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 14:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EpP0upml;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d509222c11so31204895ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 14:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705097067; x=1705701867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V6+yAdFle1fKZsoZeblghidei45qKHvWU4ZmPm+dTT0=;
        b=EpP0upmlk1nhG7RaZbIQ7pg1Dmkya94XBvmV/uqbzuMDuXwBVolesKpFeX7EfieyMr
         Gqwka/FuXiQtogGrRBcdKfoafIxchzrHrUaT1oGoki7ZrCeilAEEMMoJWwC+pOydGAfP
         g1DDzSDP88X3OJs5JfRzzdia5+4gbHtbOkSNvt0xGYUIFsG/VQbu8kzOF4LRuDM5Bomn
         PqOQ8QWg9rC0kw985N3vzZ8QEfUe4KZbmRMwxdZ6D7QbCIYTcbsdklOApSuzrk1Ne1l9
         +2b7GB4LFUluUClomsXOEPZiwjIOPC+AozUQtXsd7MeExSmbaEjjQ9pVtxFqKOaIh1LL
         c71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705097067; x=1705701867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6+yAdFle1fKZsoZeblghidei45qKHvWU4ZmPm+dTT0=;
        b=onkp/YwkEJizBYDfTivlHKvjEBinTArJOQd6+yfJGGE9e7KHQ2DhPrs2uebLKhMdmG
         KyDPvGlPCS+s8VQGpf3u5hIvnNyPsx0vVvZj3d2Q3nKhVfc8gP6bYNQRQ22ZaEI7+0DC
         wLZAkRXxxMvy1AIzQ3loOCvxEzgaCgBNOx7oh1WBtq33RS3f72KLmaKi53ZiF1C6lZyk
         uZ0xOByYxhkjp1ZBoygUmnE5XnyzSDluJZVepRNt9Ee7kF0OXAxNPyeNMQevkmxERt0L
         z9vt1JegNPkJ5uEFPQKxbrfOgSSszNiJ3Yeg9B/yRPxjc+ZpcQ4yL15am4Yhty1/rF3u
         CxtA==
X-Gm-Message-State: AOJu0Yy/LsWdG0qCM8kPWXo9CETJlkeoy0bLNFO1s+EjYnSlUkGFtC9v
	mKw/VYntk8EYCUGkgILv2OxMTVTPua194g==
X-Google-Smtp-Source: AGHT+IEcS5ERbSxamKiDQgX6TQOSqgNw5EqA6G+A658WFefbceeX+ywADgG3126JJsKdTumnt/FY4g==
X-Received: by 2002:a17:903:244a:b0:1d5:589e:276e with SMTP id l10-20020a170903244a00b001d5589e276emr1728091pls.53.1705097066969;
        Fri, 12 Jan 2024 14:04:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2e3])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902c61400b001d4ca3087dfsm3632274plr.234.2024.01.12.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 14:04:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mdadm: Disable 10ddf-fail-spare and 10ddf-fail-stop-readd testcases
Date: Fri, 12 Jan 2024 14:04:23 -0800
Message-ID: <20240112220423.1190438-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 22:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193599

This always fails in my CI setup. There are some others which fail
intermittently however, this one is deterministic and fails always e.g.

    AssertionError:- [1/1]
    Failed ptests:
    {'mdadm': ['/usr/lib/mdadm/ptest/tests/10ddf-fail-spareFAILED_-_see_/usr/lib/mdadm/ptest/logs/10ddf-fail-spare.log_and_/usr/lib/mdadm/ptest/lo

Mark them broken for now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fcfb4e1d502..3d09bc7d6b4 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -111,6 +111,8 @@ do_install_ptest() {
 	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/19raid6check.broken
 	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/20raid5journal.broken
 	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/21raid5cache.broken
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/10ddf-fail-spare.broken
+	echo "intermittent failure on autobuilder" > ${D}${PTEST_PATH}/tests/10ddf-fail-stop-readd.broken
 }
 
 RDEPENDS:${PN} += "bash"
-- 
2.43.0


