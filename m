Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81183C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 14:48:28 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.56.1659106075831474462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=117Q3+2B;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id y1so4837695pja.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=09c0EqBQqh7DuSUbiPP2OX/nSG+rXU0XqyGADOldRTc=;
        b=117Q3+2BIejrZeBNLDtXyAKMQxVP3z4eVRNkZ4rsGpSlk9drE/G+mmZTcSjnquo/o7
         kYQ7u6gGG4iKHGN6Xd5QMBmeI3yPlroLtumP+L7ItjSn5BjDeGCmaST1xWkEOKf9P917
         JsHlZRCLgS4scGOUD5A8DZI70wacCYuEamgyHFlJyhm1liUMel0NM/Yz2NEBrDwBdbck
         zppsGe4jt+WbMkXDFvNBQLECgQYYey5N3Mii/RRi2M5Zs8j1d7EZLpsOJwDqLSY+EJIg
         0sQj2C74cUQP7J6G0z+0XswkV/0ecu70EicL23EnbyRWhqtT+LobEO6wbRmYCgEKP1ym
         6GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09c0EqBQqh7DuSUbiPP2OX/nSG+rXU0XqyGADOldRTc=;
        b=HNkWKyitIagK98Y5FLR4/Cm5srS92ij87rP2ACH/Uyxq7OGP+tGval1t/8tXv305py
         u2XfAJUGzq7/ltvxYGhRCfJJe/hjPZm92A5jT5WQS14faMxEhDz5UZNOzn3HJI7ukfSH
         EuiMAi6MA9B5OwICYvYe5VAU2fOJtLp1ZzueCraYLUYkB7py9Him5T1lyDssF9/nGHx7
         uzhSsGOeLkixrGF/oR50ZNaUDKhPh3Zzd00af11dOcwuTC9IDP73jiIwRJlp0RP1V/Aj
         fZJSgkagj39bzzGluWWgzOkz+QhCbKKV74+NQelvdutcdahbkPSv1NFPllDjUXzA9ezj
         NebQ==
X-Gm-Message-State: ACgBeo1WdHdqSujlqq2WXK1tnX4qVo5bCVn1n5IBg7C7s/jm5hYcGDSx
	PziP+wSOAvsAuBwgDZut5MUZvad4DHaK3Qhw
X-Google-Smtp-Source: 
 AA6agR6lBBdC7KyUg5TO4iSOpQ/Z2ZNs+DvUQW3lbfq/aBKG2DIVEUZ34GQ61p7zJvwjzdaXMfXLKA==
X-Received: by 2002:a17:902:b488:b0:16a:7013:69f0 with SMTP id
 y8-20020a170902b48800b0016a701369f0mr4254561plr.118.1659106102855;
        Fri, 29 Jul 2022 07:48:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x24-20020aa79418000000b00528c6c7bf37sm2958782pfo.129.2022.07.29.07.48.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 07:48:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/29] perf: fix reproduciblity in older releases
 of Linux
Date: Fri, 29 Jul 2022 04:46:41 -1000
Message-Id: 
 <a4326da742c41f69c2d1d49cc8fdc2fda74aaa0d.1659105705.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659105705.git.steve@sakoman.com>
References: <cover.1659105705.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 14:48:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168660

From: Ross Burton <ross.burton@arm.com>

If you build perf from Linux 5.4 it still contains buildpaths (pointing
to the sysroot's Python) as the existing fixes don't apply to the lines
in that old release.

Add further expressions to remove the final buildpaths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6783c1e295e5afafd73a02fd986ca8956a89dda7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 603d3f9eee..95e7eae9fe 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -227,6 +227,9 @@ do_configure:prepend () {
         # reproducible.
         sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO)),$(notdir $(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO))),g' \
             ${S}/tools/perf/Makefile.config
+        # The same line is in older releases, but looking explicitly for Python 2
+        sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(PYTHON2)),$(notdir $(call get-executable-or-default\,PYTHON\,$(PYTHON2))),g' \
+            ${S}/tools/perf/Makefile.config
 
 	# likewise with this substitution. Kernels with commit 18f2967418d031a39
 	# [perf tools: Use Python devtools for version autodetection rather than runtime]
-- 
2.25.1


