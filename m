Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ABAC433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:57 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.23929.1641765897478945474
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=VaAPmLtn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id w204so1079105pfc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5rdn3sETpw3C/6p3Jv2YAV/SlycSKf35DwSm9pIexbY=;
        b=VaAPmLtn6LAIXumLePKpwe4fvSs9vnXGBI0NR69/L21ptzpezTngiWgG/m4BH4tBdg
         JNVuhMGC0k7vvZHoNR43iWUL7h2OHXkmWhbohDhzmeJ7SyNKmFvNPX6qs+EH14W2KaCh
         SJU2iUVfT4w6U1cdeKylU54FGxXjc3z58QqhmaU0wl5yLU4bYMyghn7DhSiflJ7oolLj
         FujRYmZ5L3HbIfVlcoERdwU0UA2b12EpJrKMrkPUBEI9T8fJgiy1PODbD0VqNpowebvi
         zJ0JiUCPjQwHIz2RgrhvFIb3Jb1WLBcFSSd8UzbsFd70iDRd20mbNqw11MCQxk802uxu
         rD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5rdn3sETpw3C/6p3Jv2YAV/SlycSKf35DwSm9pIexbY=;
        b=dK/T2b13WFPkOZIHieHbQwfcB4YdT3glm7d1xDqQ1WhjbJxVP5EYvpr5/8/MO/btES
         8HaBLEXxcMPPlos+ru7oJ56LXnwCwjIqN2ixGoRRoWRLyRHhvkW2xOhTMi3GNZwDnGgJ
         tvZQ0zemhquYYaSxAW3fPBZLbL9lNKkzJZ8ONxvUL4yJDi1IzRPcdQCKwu4UDRn6b83S
         yq9J21XMGgU9l8AA7RUhVJUKdB85ug5rZKoBS3I9YilZsm/Z3l3kPg9h8mTFe2LMJsCB
         wqdoQZ45MO60XMUHCw2Yf9voQh0vwbJpLgzu+QvEI6t1YVnI6Jn7nykOWC3fjspe7YmR
         lQig==
X-Gm-Message-State: AOAM533c132k/EqWNE+tdrx/i7d3nbLuoUd3Q4PJgmlq5WWQ6GNn2Otc
	2l+SkQ2pviILl/Ltpl31A8BlldwnonpgIt4M2CQ=
X-Google-Smtp-Source: 
 ABdhPJx9gu/NiEWVUAeqKScBZ2syiHJaLTOUqFVIJoUcxSCySJiCdpmd94QK7mAhMzEL8Ex/m6cCXQ==
X-Received: by 2002:aa7:8043:0:b0:4bc:1e18:466e with SMTP id
 y3-20020aa78043000000b004bc1e18466emr53915793pfm.49.1641765896680;
        Sun, 09 Jan 2022 14:04:56 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] lib/oe/reproducible: correctly set .git
 location when recursively looking for git repos
Date: Sun,  9 Jan 2022 12:04:15 -1000
Message-Id: 
 <a39e70489038256add6212b86e8728527f750556.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160302

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ffdaa1a0527691d66dd28e86bd015bfad7a020f6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/reproducible.py b/meta/lib/oe/reproducible.py
index 204b9bd734..0938e4cb39 100644
--- a/meta/lib/oe/reproducible.py
+++ b/meta/lib/oe/reproducible.py
@@ -41,7 +41,7 @@ def find_git_folder(d, sourcedir):
     for root, dirs, files in os.walk(workdir, topdown=True):
         dirs[:] = [d for d in dirs if d not in exclude]
         if '.git' in dirs:
-            return root
+            return os.path.join(root, ".git")
 
     bb.warn("Failed to find a git repository in WORKDIR: %s" % workdir)
     return None
-- 
2.25.1


