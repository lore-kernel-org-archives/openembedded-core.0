Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D14C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:29 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.10163.1633357288427976425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P2MMTZe2;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id on6so800306pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6dOE736m+iRbDNW4ymmcaM+31EIj2/1Eph6YvNOSQxI=;
        b=P2MMTZe2FCFU2FIiEvYz9lzjLN4RjF777lHFDn5kKuR7OGPkSXP1+hBFLHyW+z3rPf
         F1bXlToIMgBA1+6dZgbkRd8PVu3IdPZy3Floi7kZcQuCLy86PUCJXAb5SZneHl6d8fyJ
         k5Oc/GdeYSxWmb8x7VgQhH00HkOGegeYyYGz91iSDMNWdkQsulCs3nfymArZ+SLNUpCV
         2RhCkKz/WcmcAGdgdZcbpKPhGHfldnwsjEOTm3o+j6D9qLItVSE9vSpO09mFF2LTLhu3
         45IdzVxQmqcD9lTfjDbatA7ziyrvGdCxgflh/fWz7bL3bn4dnAw3uEptxszTgSr6sCcs
         bXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6dOE736m+iRbDNW4ymmcaM+31EIj2/1Eph6YvNOSQxI=;
        b=bvHWxzjqWc6TB0ssTn9PMwcSG7cyc1XWt5dTHtJAhCuw4I8oy6MHcTCibL8Dw9J0tu
         G07CcZtkYQQlbSN88Cvav5TH679gSFYpFBykiW5WDVDoXhHZPdj0088CET8VhtIrC6JG
         1Ob+Qes9UvX7J6nQkDnAXaxRAvF+/O47KKKoELXKcBXb8jxc4VeEy6a4W43IVjRG0Mp0
         v+y92nWwexWPXzNzbsrFHWUsBD/Y2ctPg4t5lOfMJUa75926zMf7sH/rwkaotVus4FRV
         WAPe4jAYGlfFbD3l6Q3W0SWVZnhIAmkoAYldsVdYv+/mZvtgO6boUe6yy3o7QcAmd/CL
         Jd1A==
X-Gm-Message-State: AOAM532WHpIBUH+FzagGVAdYLnalnmZ+B4PIcB/xigXo5/ZjOdgFwpTm
	nOeTcYN7h8TsX+pIvOcvpdFBLxPdcwJw5ffMyZk=
X-Google-Smtp-Source: 
 ABdhPJwHaBYdgQHN6Ajl7WZlw1eL3G6FoPZEA6r6UABDQqKu4uYTctVesp1AsCncixgg4qOR00LERg==
X-Received: by 2002:a17:90a:1d6:: with SMTP id
 22mr30353163pjd.39.1633357287475;
        Mon, 04 Oct 2021 07:21:27 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/15] oeqa/selftest/gotoolchain: Fix temp file
 cleanup
Date: Mon,  4 Oct 2021 04:18:41 -1000
Message-Id: 
 <c0d4c3f96d3b3bca55013efd0ffb1ea189bd206c.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156606

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The go tests leave readonly files and directories behind.
Fix this to allow cleanup.

[YOCTO #14575]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5680e95d7bd9fe00a797b2d0deb8cb4790027508)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 3119520f0d..59f80aad28 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -43,6 +43,12 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
 
     @classmethod
     def tearDownClass(cls):
+        # Go creates file which are readonly
+        for dirpath, dirnames, filenames in os.walk(cls.tmpdir_SDKQA):
+            for filename in filenames + dirnames:
+                f = os.path.join(dirpath, filename)
+                if not os.path.islink(f):
+                    os.chmod(f, 0o775)
         shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=True)
         super(oeGoToolchainSelfTest, cls).tearDownClass()
 
-- 
2.25.1


