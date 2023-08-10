Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F538C04FE1
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:47 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.21408.1691683540497011998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=sVXJ3isP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-686b91c2744so811977b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683539; x=1692288339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vs0yH+el0hZu+/D86NErocP143V958KLqVA9KvOSQGY=;
        b=sVXJ3isPGma7Wz/MlNLl4RBzaF9VlVX1YcCp2jellbAgpiepTnGQBMeigrSttBExPs
         L1Mn0O2q10O4B+d7Zb1T/sE9L49nLQxrzRhn4J56auPd5ZdmBkQ7FuK5R5Z0JsWWRK6z
         T5NeuD33V5U0EfQ6v18joYketuBdJW6tb1kbax6s7fv1i8oRWm+w8cE2K8crsMF2CRJD
         fBp2ZtpTi/bN/Tiup8FNjNdcheSv0Kecf7tuKXUqstWoLyb7GIKSjdNFRK4vv7uLAnA2
         JClGC7uFasO//vYQz9n4u40IUIFJBePp03WK7Ro/cCyHQ/N64bTa8qbvsZymAR/+nL6h
         DbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683539; x=1692288339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vs0yH+el0hZu+/D86NErocP143V958KLqVA9KvOSQGY=;
        b=DJz3GbManpUCrFTq1VgR9rzLXPXl2G++LmHuH7gv6qdxRrgWPHd0eiTr/OB1RtKo0R
         YBfIZ9Uxjv2UnqqMhiJHdjUVOZgoX8OC9mRivu6nqFSLKf6RUPrMoOgedYFnjo1O+w+z
         aukoRSrCd57ZeEIy38Am0CF4vnMUqAXbDMHyRxYDnHVLkcEiLYTGb4cbmHrfa0FgIYm9
         5QN2uD+ISLShTkdD4hKopvu0K4Zv823iH2laUwLR1sKF11vEcUXxWltfSNXJs5L2n4yM
         8C5yh8HWJnJIp08W5voT0R7Qj2plntRDj1X30Ys4+9erowSU41fUFrRIMm5VDqgxP/yy
         db4Q==
X-Gm-Message-State: AOJu0Yy2c/mn0/UbjyUUifGfRiiA7eaPGotRiGYTYxITYH1/GA4p4P0n
	M4OCN0e9gDwr5ld7bXdkX5daWE3QUtGRT5W000I=
X-Google-Smtp-Source: AGHT+IHNwlLX/xE0rq9KhV+rjpJ0DCXb+iuuRt1spt3yyeNqLPbHNAv8hfSceuzGMyYdeIXYZgX6TA==
X-Received: by 2002:a05:6a20:938b:b0:12c:e745:78b3 with SMTP id x11-20020a056a20938b00b0012ce74578b3mr3108269pzh.62.1691683539474;
        Thu, 10 Aug 2023 09:05:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 25/37] ltp: add RDEPENDS on findutils
Date: Thu, 10 Aug 2023 06:04:24 -1000
Message-Id: <d1055d9f0aafbc687b857e85843e74c54bc014a1.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185787

From: Ross Burton <ross.burton@arm.com>

With busybox find some of the test script fails, so depend on GNU find.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2d1b1987ef927b33b799bb6e6805a1fdd8d92921)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/ltp/ltp_20230127.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20230127.bb b/meta/recipes-extended/ltp/ltp_20230127.bb
index 4325aa6672..58a267fc2a 100644
--- a/meta/recipes-extended/ltp/ltp_20230127.bb
+++ b/meta/recipes-extended/ltp/ltp_20230127.bb
@@ -92,6 +92,7 @@ RDEPENDS:${PN} = "\
     e2fsprogs-mke2fs \
     expect \
     file \
+    findutils \
     gawk \
     gdb \
     gzip \
-- 
2.34.1


