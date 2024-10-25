Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BA9D149DF
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:29:52 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web11.2614.1729880984002231924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0a/6rXfr;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174, mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a3b7442db5so8874605ab.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880983; x=1730485783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqZZ8Phcx2mvNrQe3CbFme1/+NLjy03l/sBuSiO8FBA=;
        b=0a/6rXfr3mE+69jhcjeYr2R9uy3rIUXwe6fj8u9n6N33aWhDLL9wBQkzvRfy0jDwxk
         2d5qxmmRpEA3BDrJ4Hog3e7xqrfEFdIVb8tZH8YKyH7Eh+rRkin/U+4ycYmYjSSKy0a9
         uuiP+I4kI1UHZXQkeNSusA/iYYdbLOOuWdxqzP2Oev2eL2avUHf+WKkjvfP0VKa0WQ2/
         X6VbD+x3tziGJuvxn9lMKr1n/acCxQ1AUaLUHhHUaxfJDBT3jQPkHTsU+76sL8DCQkPT
         KXgj65j2tIN1PKi1ydAM+3bRn1xAzL4wgpqRnGrGL5yYRqicNjYpVydRd8Pyd09Ia/FA
         olcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880983; x=1730485783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqZZ8Phcx2mvNrQe3CbFme1/+NLjy03l/sBuSiO8FBA=;
        b=Fg4jtobZmsB5TLaDqf4p40Fb8xoem4Nfig3tdBHBdOfYzQc3VIgSCtzueMN7zZPu/S
         ia0q8v2iV95gs7dNRp6x18DBBrn7wGHiGW93JOljYjMqD4iRZxb2k3HkJ/p8se7EhODC
         X+sQvGlF8K1K3OFuUn8BBLdNRfC5/PYMv/k9L5E40fjIet6050E24YpVgkWILC6FdpHW
         E7XpkyYqGk8Qgw7kVr0wr8qvRwBXpnIjw27ud/iX8L4KPumXa1s9WofgTnDrgimPY/N5
         45b0JM9wIna2932YJVbh4JyJ4r0wNThX72xLOLfzCYICzLsc0FK7TuVmYwzhmGe2A3ON
         9Hkw==
X-Gm-Message-State: AOJu0YxWUDf4cH3cYEr+0dwc7+yCoauqn7aERgvDPR4fdj4s3JoKF7yp
	us2LraSdCQCnGKcUJZPIE4tfeCPCvfbflxtNhF4KqKPShTqs/HLROiinCbDxN+DFeSo1pUBKRz2
	C
X-Google-Smtp-Source: AGHT+IFC32FEjENGtn8ljO9peSI6tiNzhw45R2AFXUEKbeyPYpuT4/xJ1hYwC2egHdt569S48KvNSQ==
X-Received: by 2002:a05:6e02:16cf:b0:3a3:da4f:79ec with SMTP id e9e14a558f8ab-3a4ed295ba9mr2547205ab.7.1729880982888;
        Fri, 25 Oct 2024 11:29:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] python3-setuptools: Add "python:setuptools" to CVE_PRODUCT
Date: Fri, 25 Oct 2024 11:29:22 -0700
Message-Id: <85b61bf9cefc024faefa083c37ce88ba9c7355e1.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206363

From: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>

Since there are vulnerabilities that cannot be detected by the existing
CVE_PRODUCT, add "python:setuptools" to CVE_PRODUCT.

https://nvd.nist.gov/vuln/detail/CVE-2013-1633
https://nvd.nist.gov/vuln/detail/CVE-2022-40897

Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa1c8d97efc6640a1cffa2459d9b20ad1f7309b0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-setuptools_69.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
index 7b9b02059f..7663101f23 100644
--- a/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_69.1.1.bb
@@ -6,6 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
 inherit pypi python_setuptools_build_meta
 
+CVE_PRODUCT = "python3-setuptools python:setuptools"
+
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += " \
-- 
2.34.1


