Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B9AC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.419.1652293229303858119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zXpW1Sb8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id e24so3000352pjt.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dTndquuCrH4ol1IlnHK2Uglfj0SGBwVkWPPrKLJpoag=;
        b=zXpW1Sb8rR1m1wjkRz5T3gY4YKGl4oEsqGLr3VyjHixjhqmtFQhGW2vcd8GCFyW/cl
         iRl3I2sf5uYW92hyJv/PLFjl26lBHAJnilz5vRwywXfflclNk5o7qq/gzUErmcEb3pd/
         e19n8YH9y9+7qSdRKL4jXoYh07s8fo8o60GQBzaEDoot7lTCs4P+GcQLrpxOVb+dL2uH
         Ra08G3bO32y3GuhqnPKpFl7mQ6N+apkUBDqme+6Hnf6CVFuohFTkNEoQbWaLdOOSgk4v
         DIGvteJGngBMpA80zWqDfZY65FM86QSSBBEpaC/IfzHECGYZ8mB/Wwlog6y9j/VXVZzz
         yRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dTndquuCrH4ol1IlnHK2Uglfj0SGBwVkWPPrKLJpoag=;
        b=PNPcNGMXuv7ZInugatoGRqpKPzBc+QELRoGvvqoMe9od1ete47VujvFJ8IKGsyx72g
         YiC2sK94jbUi7CLYvACGEkcCAg99iEib30BdjfCsQDaf2MYH3T3NeMRCU9Hc8y0megqJ
         NkylNJtVxZqRas+qKJLzKgEJmBKe4yYYYPvSBFzmmzdOczVmWsF8+Je4KMRgsShkbyoT
         wNs5r9tGp1TY/xCuruRpyNdJuv6PKanOv/usO+Uq2VKDgvXJD4Yiv4nxUOy1e49Ob8xK
         Iq0F2PXJPqL1ORDpme+o9aiM12RXGJZDwUwpzICGjHeqtWGQcnZ3qRCMHJ6cO0J3tP3M
         CIkg==
X-Gm-Message-State: AOAM533QT1k6b0tqaEUwm/5MJxU1uWUVwZ3A6wPIjcuY1U62R61gEfJx
	vbEB0ewcWBSDjIu5F/kCWmSSBiOzYUZhmteN
X-Google-Smtp-Source: 
 ABdhPJyUokYuXZxm0SE+dxe6qszbSdkDFp7t55gnYJAKUehLUOm8O+6ff2jJeaBGknddqyml1FeYBA==
X-Received: by 2002:a17:902:b498:b0:15f:2d62:5f3c with SMTP id
 y24-20020a170902b49800b0015f2d625f3cmr6522103plr.162.1652293228229;
        Wed, 11 May 2022 11:20:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/14] scripts/git: Ensure we don't have circular
 references
Date: Wed, 11 May 2022 08:19:33 -1000
Message-Id: 
 <0f6ae13d76129d96f788b7ede312cfc361ee2bda.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165520

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is horrible but I'm running out of better ideas. We hit circular reference
issues which we were trying to avoid in the core HOSTTOOLS code. When building
the eSDK, there can be two copies of the script.

Therefore assume git will never be in a directory called scripts. This
fixes eSDK build failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 27de610ac30d4c81352efc794df7e9b1060f7a68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/git | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/git b/scripts/git
index 8adf5c9ecb..644055e540 100755
--- a/scripts/git
+++ b/scripts/git
@@ -10,7 +10,14 @@ os.environ['PSEUDO_UNLOAD'] = '1'
 
 # calculate path to the real 'git'
 path = os.environ['PATH']
-path = path.replace(os.path.dirname(sys.argv[0]), '')
+# we need to remove our path but also any other copy of this script which
+# may be present, e.g. eSDK.
+replacements = [os.path.dirname(sys.argv[0])]
+for p in path.split(":"):
+    if p.endswith("/scripts"):
+        replacements.append(p)
+for r in replacements:
+    path = path.replace(r, '/ignoreme')
 real_git = shutil.which('git', path=path)
 
 if len(sys.argv) == 1:
-- 
2.25.1


