Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2AEC0015E
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:58 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.835.1689374033676295846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=T/r2EXKZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55be1ce1669so1550122a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689374032; x=1691966032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lepVwoo4IN4VnIIzySMXEGgxKncuiB9CJLtcZ5KWMfc=;
        b=T/r2EXKZOAkSTojH4FTJ+nT7ReVipYACfRFg3VTsEx2UMN6o3R+0tZH2PWu641olLu
         Hp2CWJ/Z9nCtFM+z7w0ShhB7bZBdwFFDwOlzBRK23k68SxLqDwuJLY4oCU+1AcL8RN5R
         X5gtz7H1/FZ5r+NF6X2C3r8XKUPPumWPaLkpUlIyz+vlLlcacB/REplTmOeBSiYO97Io
         /IsyKITowHSHI7AdGv/12601edsFTekB9akAGIRHGGgL7ks/lDIDUlP3/eva5ccqYhoJ
         qLtiRNt50FXTji7bZ92z0hJCS55NWF3yYzzSTUlQJjji9GlOPQegPyLOZMhTrcm21x2f
         6oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689374032; x=1691966032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lepVwoo4IN4VnIIzySMXEGgxKncuiB9CJLtcZ5KWMfc=;
        b=JfPEtJsruMgLCn7ycfCvSj89y77nmFfXGz4bnzJtnBSRbIAw9ekI9AA/FAzzIT6Bzn
         tC0zRnYKEMZiW6xYhFDvLxDn9shNTIo9g6rZHPRcFgxFdd9c7hCtJbSQN7oZCZ3Ku/gk
         TzffIYm6ZbF6vAmIc+GBFfI44wsbRLAVg3mvAsV69fBjpd9T8oHq2kFwtn/M4K7WCSVr
         +EKOz85oNAtzuxqfDaZjCORMvWs1ZOEtc9algSn9TUI6zUFME2l4goYTOqLCeMowPc0W
         1JuUUxdEKp74xZ8EX21M0eflmTrUDKDA6/XWZtgci455a0lTvf5GHzwWht+Cf9fTvrnQ
         Q1nA==
X-Gm-Message-State: ABy/qLaYVigmysOye0IrUVlwHri9fRSwzztXk2kT00UHHMgJ8y4RfZgy
	qPUhvmF1Lv5WRyfDxAIz19EHHPc1DuO5/WIoy8E=
X-Google-Smtp-Source: APBJJlGlSsYpMh8RECwwMCrltg/lmkTJcdQJtydDN0CQq1fGMlh9SJ9O2EKAe4t30hE2fk9vekY/SA==
X-Received: by 2002:a17:902:b698:b0:1b6:4bbd:c3a7 with SMTP id c24-20020a170902b69800b001b64bbdc3a7mr4392691pls.66.1689374032583;
        Fri, 14 Jul 2023 15:33:52 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 19/26] recipetool: Fix inherit in created -native* recipes
Date: Fri, 14 Jul 2023 12:32:53 -1000
Message-Id: <6de7a92c4366f8b15ff97e53be91db31348b3922.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184301

From: Yoann Congal <yoann.congal@smile.fr>

native and nativesdk classes are special and must be inherited last :
put them at the end of the gathered classes to inherit.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a6614fd800cbe791264aeb102d379ba79bd145c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/recipetool/create.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 824ac6350d..e99e0714bf 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -745,6 +745,10 @@ def create_recipe(args):
     for handler in handlers:
         handler.process(srctree_use, classes, lines_before, lines_after, handled, extravalues)
 
+    # native and nativesdk classes are special and must be inherited last
+    # If present, put them at the end of the classes list
+    classes.sort(key=lambda c: c in ("native", "nativesdk"))
+
     extrafiles = extravalues.pop('extrafiles', {})
     extra_pn = extravalues.pop('PN', None)
     extra_pv = extravalues.pop('PV', None)
-- 
2.34.1


