Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.9902.1607002664854860920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 05:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qqCYYLwq;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id ga15so3509666ejb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 05:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zSm1IPOAd+5aDSYR3VzljL0yuSEzdCGmwQXBX2P1NzQ=;
        b=qqCYYLwqZttswSDjh9ZTycvW7sYRt5DQ+N894+CHJ5ukLiB3LFp2uyuS1TtOCeMK3N
         EdGSvpghd8lTygUf42Gx7w3GdCRx1ytiLftoQl8XLctCouUMG7qbmLLXJ+/M7k+dY8Ma
         qaUwTK8cWytvaZFj+TShLsQftEWB8yIaIWxos1PMxWmdxKUgmMEpjzHFM1j7y8Nx4Sd3
         gc4YlrxqFWdo5/vMBTWeSFhvDnLWBEESZPQTKlrxkhcPod2eiBpGgjRb7dh+e2bCVKds
         YEiqZB9Aw3ZRYV488EmTc7grqvX17Amzm+D27JsL9TYSR+XDsVyu4gT6IeHqq8aSd47N
         XwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zSm1IPOAd+5aDSYR3VzljL0yuSEzdCGmwQXBX2P1NzQ=;
        b=grUBzmNAt6sXmbL/NZJIZmLOmskeA7ipHYmdd5SQRdeHbKNoF56VXa6bGSGmQZojV+
         BynjXNQ3C2B/8v2z8MDMFaWpYeszC1r46cPXDK5Ko6+HnA8RfLAUTveLUwp1TQuJg7uF
         OP9/z8pLVlzDL2e9sqVp/tgfQ1dsjr58ndcM8gZWiKP4h5GGl9NhDotqUzJynkBXYvWa
         4MAwEPL0GwCKdNsrcqA3xfPpwEzLfrFGmm6gCmQ4MD4RXF07fTFPMuzqT7Z0W4Nl5aLj
         LoUR4fGGKRJL8aiQN9KnFs4yv9QfVneeCafqlr+pbhaU0W+XVs5r5b5RIXpz3ELaXCAQ
         t+CQ==
X-Gm-Message-State: AOAM532bJYebWeyX01gaiw+EcBSuA6GIMD9jQM5arx8Rtalp69jl3KAg
	dI1Agk4KcW2blXb2ePTLIMgspnvmaBhq9g==
X-Google-Smtp-Source: ABdhPJxpXY+mv1w0IUjfkldfg5hFxM5Abr6Zj7+T+7aOXaJdF/qDJNOQA2gnSSk90tLQWfpGlLhLBg==
X-Received: by 2002:a17:906:3ec8:: with SMTP id d8mr2605640ejj.32.1607002663099;
        Thu, 03 Dec 2020 05:37:43 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id ng1sm77130ejb.112.2020.12.03.05.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 05:37:42 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/11] serf: do not install the static library
Date: Thu,  3 Dec 2020 14:37:24 +0100
Message-Id: <20201203133727.12936-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203133727.12936-1-alex.kanavin@gmail.com>
References: <20201203133727.12936-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scons is using host ar to create it, which may or may not
be built with reproducible option by default. Rather than
patch scons for the benefit of a single recipe, let's
just not install the .a, which is unused anyway.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/serf/serf_1.3.9.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index 6a27f12102..2fbf96f997 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -30,4 +30,9 @@ EXTRA_OESCONS = " \
                   OPENSSL="${STAGING_EXECPREFIXDIR}" \
                   "
 
+# scons creates non-reproducible archives
+do_install_append() {
+	rm ${D}/${libdir}/*.a
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

