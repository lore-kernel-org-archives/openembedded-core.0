Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3EDC54EE9
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:26:54 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.51639.1661624808642244705
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=8RwMMo88;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id u22so4339935plq.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=/Hul1R155T0ekrUwg7yqhrgeZ3yOK1AEptaevlomKvQ=;
        b=8RwMMo88FQI75SLFl9Tkx29wcJS5OLncvt98d5e1MSSrETdDpSAxKhwf+YCYRt2A/I
         ayMzqaF1dtcCKkcWx/X9THV06i7+fypGQr+43F22Bfkt89CoubUjRD6+j9/8SBZx3PXO
         i0UXaeEW4B100qsppBQV5BwaD/W39nh1oQIZrsruVFGySiRDnnXCPkvnEOAHNwGGUr39
         KU7WcHAmMpalAoeq8DdFTIyNRFDhUMcxjk4IIf4HHo2aLtzghUQltHUoXngu7fI6fH9J
         flmuHIGA6y2e327qnHDvPRHy7KsYsvcnU/kbZpoFRtBi9eLUtKutHSIgqXSufsLEpp39
         GlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=/Hul1R155T0ekrUwg7yqhrgeZ3yOK1AEptaevlomKvQ=;
        b=d/CWH1DwmE5gUBGud6Qgar4QELKe3NDLPBU0SDsy51pkgUqZOucVofoe3041D9jEKU
         u2pyts438GH8sEGYD6XCNtk6ylu8wO5Al6LIosU9lG83Hs6UWxPm60+LIBquBzOaWtdQ
         7jJ2ehWVd39m7bQFVx5TL8cdQI5XXZI7qS2GMi899LR8gWsB28pWSlu6Ci36PS1MaMwR
         B+WuLITs97IHkg19h77LvWg2fPTuQrDhlI37cow9elqt9d2JeYgaNUebKGr3GLFfhK5v
         A6/UVEDTUvjqwRa7Os6+ijpDZJ67ncbnAC5A/Pj6Ln9GRKeuVADfMDtB9ubBaSDt8YYN
         aNrg==
X-Gm-Message-State: ACgBeo2hcI+jtfuKdiDYfx2ZxAlyo7tK7uLjhjsbLdKBm6uNohoQ2dfV
	CGdHs56Xwylw3fJecYbRmtGd3kayzv/mOOaA
X-Google-Smtp-Source: 
 AA6agR7MQ3ZB41HyzRiYSxDjISQfxaEEeGVdfjC1ldoiWKqN5pCHYvokgO65aSVyC8+QoXYsOZ0dMg==
X-Received: by 2002:a17:90b:3e8d:b0:1fa:facf:672f with SMTP id
 rj13-20020a17090b3e8d00b001fafacf672fmr10635819pjb.0.1661624807716;
        Sat, 27 Aug 2022 11:26:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b001708c4ebbaesm3864716plg.309.2022.08.27.11.26.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 11:26:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/24] oeqa/gotoolchain: set CGO_ENABLED=1
Date: Sat, 27 Aug 2022 08:25:45 -1000
Message-Id: 
 <62bd5d4a6b0bfbc7ac00bcb45ad20d32fd92689e.1661624569.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661624569.git.steve@sakoman.com>
References: <cover.1661624569.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:26:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169962

From: Ross Burton <ross.burton@arm.com>

In cross-compiles CGO_ENABLED=1 needs to be set explicitly, as otherwise
Go refuses to use it even if CC is already set.

This fixes the selftest on setups where the host and the SDK target
don't have matching architectures.

[ YOCTO #14859 ]

(From OE-Core rev: 19be072619d39267df44f23c4c8b64f3808f6148)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 345f533379..978898b86f 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -51,6 +51,7 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
         cmd = cmd + ". %s; " % self.env_SDK
         cmd = cmd + "export GOPATH=%s; " % self.go_path
         cmd = cmd + "export GOFLAGS=-modcacherw; "
+        cmd = cmd + "export CGO_ENABLED=1; "
         cmd = cmd + "${CROSS_COMPILE}go %s" % gocmd
         return runCmd(cmd).status
 
-- 
2.25.1


