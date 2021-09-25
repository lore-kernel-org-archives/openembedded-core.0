Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C1EC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 18:03:21 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.9696.1632592999469543246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FsRwfUBg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id i24so21591133wrc.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 11:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N5Gaw2ypw0Y1D4pwfkau326QQUAPR+E9BClLc9wNlCA=;
        b=FsRwfUBgOTvBEuaFOTfj6hEwRXcBzuUBDsir8r3JMZ5mQ52oeTDYWQ4HAzhMySzVXg
         wG5eeNKwwFTqcjpdvScfwvGFUD+ykOs9ZSaj4HJAcU26lnMkHptGHugCUy+rzE3p6fog
         9YI69WJxDzlR8LYzIeCf7GfJdRYBwR97+GsGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N5Gaw2ypw0Y1D4pwfkau326QQUAPR+E9BClLc9wNlCA=;
        b=0/xMwYayJzWwG45KVpO4OTyfCpDW/0/g9jsVuAjF2abVxL7fK58E99UA57aemoD+Kw
         q7pGKUQhqvvNl2FSF/qbgOSKVKZ7yoZ8uXqcbaldN2vv6K9WIbddGmIsgLkDNaVWgqUq
         dZXvzZfpexftdBAGnQLXm4sgSa90OdLfgMjznKMsj2pxd8DiG8takl7C1e4cnv+CxmI1
         KHWmjdyWsmsF8Q2Uy28iDTL38aw9ZP37pJMUNXQO7JO2JWhu38rpwWqkceDasl+dC3A2
         yIawWBHdf208qt5ElY4GaBvxUNBNSbPeMht4bFwilavN96ul726eadqWYHjvBSPR7+F9
         eIHA==
X-Gm-Message-State: AOAM533VudU3Qtdb4emcFF+WenOrrfwC0hGA0uxgy81liBLybZx/hodo
	erx1fmpjfencgIOCDikw1gKbRtj4fDKLCbr8
X-Google-Smtp-Source: 
 ABdhPJx8+PN1LHKVpuRnm/3spxLaTPiGJIBtS3cBDaY0+Evo+VK/E0CafEqhDwpljLsA/yVku5Rttg==
X-Received: by 2002:a5d:4592:: with SMTP id
 p18mr17974509wrq.198.1632592997220;
        Sat, 25 Sep 2021 11:03:17 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2185:dd9d:1e31:557d])
        by smtp.gmail.com with ESMTPSA id
 20sm17340492wme.46.2021.09.25.11.03.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 11:03:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/gotoolchain: Fix temp file cleanup
Date: Sat, 25 Sep 2021 19:03:16 +0100
Message-Id: <20210925180316.1987149-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 18:03:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156354

The go tests leave readonly files and directories behind.
Fix this to allow cleanup.

[YOCTO #14575]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/gotoolchain.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/gotoolchain.py b/meta/lib/oeqa/selftest/cases/gotoolchain.py
index 4fc3605f42f..d1fe9b297c7 100644
--- a/meta/lib/oeqa/selftest/cases/gotoolchain.py
+++ b/meta/lib/oeqa/selftest/cases/gotoolchain.py
@@ -43,6 +43,10 @@ class oeGoToolchainSelfTest(OESelftestTestCase):
 
     @classmethod
     def tearDownClass(cls):
+        # Go creates file which are readonly
+        for dirpath, dirnames, filenames in os.walk(cls.tmpdir_SDKQA):
+            for filename in filenames + dirnames:
+                os.chmod(os.path.join(dirpath, filename), 0o775)
         shutil.rmtree(cls.tmpdir_SDKQA, ignore_errors=True)
         super(oeGoToolchainSelfTest, cls).tearDownClass()
 
-- 
2.32.0


