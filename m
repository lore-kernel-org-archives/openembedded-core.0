Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2261ACE7A89
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 21:05:17 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.8586.1695416713970602985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 14:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CwLXnly9;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c47309a8ccso31029985ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695416713; x=1696021513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zuK4yWURiWAd4/sBkwNpLdwd3Sm1EmOB7jDVqEOkTGg=;
        b=CwLXnly91D518qqVwvjgqno6c7Q3bID5fB97UnVTZmSxhFG+MpoV2f7kN4c+pP4yfz
         jzFPjgRw5kthZRNWouZr8Grg6Is9cZEGvjMcRkt1FYbwKsXPGJEAkuzOJpv5c51kEzCu
         jOarmqgzyacqEQzLBsruqYLKRr43IRLf7alNU1FFsBFHNiFUvmBcZubsqwqtIefAB5jH
         foMKQm99rvrwY/xjKwvqDg3/NtptOcMBrLlSm2ZxOXDVp/IQ9F2cwM34hbeI0G41wBZZ
         mRKM9HUHwXJ4R8WxPLBsuhnJnPTHAJvffkcbUDMyYNXqgJjyRhX7mJ/1GzT44BSmj+NW
         57nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695416713; x=1696021513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuK4yWURiWAd4/sBkwNpLdwd3Sm1EmOB7jDVqEOkTGg=;
        b=kKN9s/n/t73ib7Nd5I4/44lzAhHOFAQteSG3w7PCjUJpKiP8X9ImgY8MNNrTCP4++V
         dpxk4pfbbP25KbAVc91dp/hXFpoUaNQOUmOdug8nkl0kdIf/6K5/6SRQcpZTc1Hq/K7L
         +5Y6XLulsEk75Iw0+MagFLFwIAeJAv5LYbJvXZAfoyz8B56hK6QxEmwW2p6qbG1UeLHc
         zsACicwTL5n1SNJ2+/dCpfRKkQwBf7xcvBDmrjYakIRhWKDzw+GRn+ENbxfvbBrCvZ+P
         H3c+fN/OKfZun5PxjajMsx7XGBQvPQP63GZt8BgeVGvYrX1BcIGRQxtdqA4hPv6zR8Sy
         2moQ==
X-Gm-Message-State: AOJu0YxOV2IiTL5ENP4xGBFFeKDUN9Q7MrZGTyGF3fixSHeTwHtoFgIm
	AKEImgufCRSRHxGY+xg9rYafGj8fMNhJIQ==
X-Google-Smtp-Source: AGHT+IFmrGKkNfQcJ3kQstrmwiTrPgAVYK98jlEAyBow1n5ZUNsywL9duEpxLKPa7oR/FMYdZXcFDg==
X-Received: by 2002:a17:902:d2c6:b0:1c5:6f43:9502 with SMTP id n6-20020a170902d2c600b001c56f439502mr1024233plc.14.1695416713026;
        Fri, 22 Sep 2023 14:05:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001a5fccab02dsm3943623plf.177.2023.09.22.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 14:05:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/5] bsd-headers: Define __CONCAT and __STRING
Date: Fri, 22 Sep 2023 14:05:05 -0700
Message-ID: <20230922210508.24087-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922210508.24087-1-raj.khem@gmail.com>
References: <20230922210508.24087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 21:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188134

Sync with other musl distros

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Rebased

 meta/recipes-core/musl/bsd-headers/sys-cdefs.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/musl/bsd-headers/sys-cdefs.h b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
index 209a623c0f0..841a5da8ba4 100644
--- a/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
+++ b/meta/recipes-core/musl/bsd-headers/sys-cdefs.h
@@ -1,3 +1,6 @@
+#ifndef _SYS_CDEFS_H_
+#define _SYS_CDEFS_H_
+
 #warning usage of non-standard #include <sys/cdefs.h> is deprecated
 
 #undef __P
@@ -24,3 +27,8 @@
 # define __THROW
 # define __NTH(fct)     fct
 #endif
+
+#define __CONCAT(x,y)   x ## y
+#define __STRING(x)     #x
+
+#endif /* _SYS_CDEFS_H_ */
-- 
2.42.0


