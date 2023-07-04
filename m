Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CA0C3DA40
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:19 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.61491.1688484612708843091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Op7jf3Kv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-55b12286476so2781871a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484612; x=1691076612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h0NGNVgfgHaydLSRHJAXSUSDZl1A5YpYsuvSn5rU4Gc=;
        b=Op7jf3KviUVKS1WLkIjk3dQjY6jsvwpAWx3HUwUPZYXLRMsVfEQXxkwLwomIiwNtdM
         QxKEhfVFurOC1gPJPb9tAAH2Olul3Ov0mI3dV32NMJzMgFa+8r6cGqm3g+kVfRVDCnt/
         gMcq3MgkxLs+BBSR1DAUIjR/TH0Y6IP2/vh48OMC4FteVrJFQLAoX/I8i0ip0IHPjx26
         4NX17T0lsB/mFbC2Df7gdkSVTnfmBHfteDrT0x044wU87Tb24+GD6fkfYdCuvPrKV0hL
         QNAslLCmVDNCBd6+Svuteu3f9jex3L+1JY/nocikbDxyCXQa9EnzzODbu3GY6ysjy5Es
         PHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484612; x=1691076612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h0NGNVgfgHaydLSRHJAXSUSDZl1A5YpYsuvSn5rU4Gc=;
        b=QmIcA/4jZ0DJ/oN0V0dA6LvHz6+/2wtCZBimd9YRXvDrAWjvnSEuWIb6YWxzjkvNNU
         tdevGoe9SAyNn1mcdst22w40HzdiRWMTMHHlZqOAWRfr5qUC5tUop0A+9BvttinpxOL1
         IF/qiHI1NWnrY4WKOVBHnrHmIzLYO/o97LcTwxuw5iia36U7v3gzrDjpcCX8HSNnUcPf
         cvCaDeOq4Z2y+ZXhvGH8MDoreAx357ZF54In/UQWhl0byQsY+JZkxrnldA8I2pW2TpVT
         InsYdhZKmFvn2hM6SNNnBLbERz3xJDKswxmXA6YlqSsCytQbisEn/KjUO4bEwxUNfWf7
         AvTw==
X-Gm-Message-State: AC+VfDxblwAFL3vk20Vmwh1VURnBmjIR4c/w1p6eawrFPeMD4UFPo4uu
	1UNSHUkhb4hSdCgZ2xdh18i+eGUBi59FNwGKt16HUg==
X-Google-Smtp-Source: ACHHUZ4ler0oAndVpU4iqZQd3gozKev6tc4MrD6Krt03vhJpI6stiTM3ZfjMwkAVWcPC33T37vzTgg==
X-Received: by 2002:a05:6a20:96c5:b0:126:9539:ec30 with SMTP id hq5-20020a056a2096c500b001269539ec30mr10185522pzc.19.1688484611723;
        Tue, 04 Jul 2023 08:30:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/30] sdk.py: fix moving dnf contents
Date: Tue,  4 Jul 2023 05:29:18 -1000
Message-Id: <313f009e346a5aa10a09d65706c12ceefddaf59d.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183851

From: Chen Qi <Qi.Chen@windriver.com>

The dnf contents should be moved to <host_sysroot>/etc/dnf/xxx
instead of just <host_sysroot>/etc.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 74b78d160a985e98f869c777847ab798e419dd2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/rpm/sdk.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/sdk.py b/meta/lib/oe/package_manager/rpm/sdk.py
index 0726a18b91..85df6e949c 100644
--- a/meta/lib/oe/package_manager/rpm/sdk.py
+++ b/meta/lib/oe/package_manager/rpm/sdk.py
@@ -112,5 +112,6 @@ class PkgSdk(Sdk):
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "rpm*")):
             self.movefile(f, native_sysconf_dir)
         for f in glob.glob(os.path.join(self.sdk_output, "etc", "dnf", "*")):
-            self.movefile(f, native_sysconf_dir)
+            self.mkdirhier(native_sysconf_dir + "/dnf")
+            self.movefile(f, native_sysconf_dir + "/dnf")
         self.remove(os.path.join(self.sdk_output, "etc"), True)
-- 
2.34.1


