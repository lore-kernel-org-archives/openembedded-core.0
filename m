Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED78DC433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:24 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web12.27901.1653314421269082582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Hp7ExQBH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id g184so13772795pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jAZaNgVqtN0iUeCSfveAUf/MTVG880buJ1GgedkJCuo=;
        b=Hp7ExQBHB4KdPb7rd1UIaGQt75ZYpOmNO+ykGHPaecWwhcqgfdhLMAsRfu9HEtO8VJ
         X0aAa/nT3/7CpMfzAqOOpamrz4E4pR4iAiiwltb36i35r/+iNTZMC1ICpP1XLI7+He45
         qzpxFHw48NFtvSlORp/6gJLV8f8gtvL4r73ixyLDtrQ7mFEQqTL5szei1UAaNsDXdqf/
         73PVzFnWPbGx3CkMv7YouCT5n+2ztBB/M1xRSJpdn/0qD6hrdpf5WuPOxFOpLBzqAEo0
         EZha+781Td4hOLEqpH1lq0j+sBzgUlJJKePRKO78XDV3rfqCYaHwPXeHCTG00lq+tjGU
         3jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jAZaNgVqtN0iUeCSfveAUf/MTVG880buJ1GgedkJCuo=;
        b=z3tjQBZRLg5LbOecteOSErGKwwEA2GuhZ44j8+Cse+2uASJdrkeJuT/CCROrywFQ6b
         Bs7owt5HoZ/JVVX+2qqaFN05VQMeVdqknE5t2WLYTVxuAEclPpgiYDzTSJRqrzaR2rU0
         JEafoaumO3eTnMos8fEa//h+oZExUXeR8Xui0ww5gC3Q7Pl3raxOUccRcz9EvIhTU/P9
         42vuvEHJ7grnwY8HamLGi1p79NR1g8BtTnyePcI1/eYCXLh8X2v4BdaiGCOdDOncSdhm
         0p0nhz7FGq1qNqccRkwvJWYsnb5liPY0NHHQIE9diX4Rtvrguq/0JZx6k6eremIDztfP
         jy5g==
X-Gm-Message-State: AOAM532k5voxs7XcW7M4Ec0+nkceGVYCOaOBFyvnrY2SdWvAGb3L/ISY
	afbVB31Q73kBYnlqmsisj60gPIS0RAw4yzcp
X-Google-Smtp-Source: 
 ABdhPJwAUQLHgR7koSu5fBVwmDyqVBQA+yRPml82qPV1ZHqtv/+TZLQdHiVAYDN01hXPzz+9HNZ1CQ==
X-Received: by 2002:a05:6a00:1385:b0:50a:9768:9eca with SMTP id
 t5-20020a056a00138500b0050a97689ecamr23831204pfg.43.1653314419870;
        Mon, 23 May 2022 07:00:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] python3: fix reproducibility issue with
 python3-core
Date: Mon, 23 May 2022 03:59:42 -1000
Message-Id: 
 <00b62965bd4c9eb6fd8c016f83126da2a107a5c5.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166026

traceback.cpython-310.pyc is non-deterministic due to 'frozenset'
being written without strict ordering.  For now let's just not
install the problematic file.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4b1f0f7542abcb8606688c974695a6c8a142e7a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3_3.10.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
index d678d55083..2ef320350e 100644
--- a/meta/recipes-devtools/python/python3_3.10.4.bb
+++ b/meta/recipes-devtools/python/python3_3.10.4.bb
@@ -193,6 +193,11 @@ do_install:append() {
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
         rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
 
+        # Similar to the above, we're getting reproducibility issues with 
+        # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
+        # so remove it too
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
+
         # Remove the opt-1.pyc and opt-2.pyc files. They effectively waste space on embedded
         # style targets as they're only used when python is called with the -O or -OO options
         # which is rare.
-- 
2.25.1


