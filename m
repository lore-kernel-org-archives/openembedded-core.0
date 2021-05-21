Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.2928.1621556416750368952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 17:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0zJwCmoC;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id c3so18088452oic.8
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 17:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=l70LSGExLbSp0so812MPio0cT56sD1x7VAxWdvZr8ws=;
        b=0zJwCmoCili4AGxAGmOaWHQMY8hwg1JnP+JkHFzZRAiGFnLzi8sMNVBHT+EursCpsq
         7Y0tGgnQorpesyJ1RU7EA9riWRNPcaZIIgfN6YOYenTF1tCc1uWsQiz4mdUB2VuEOFMw
         BSKn4HNAqrfcKN0KrwHGV0mW2Mfppceitc1rzGupE16QV0ExqVnnwRf6m9WVDei5b4+D
         472U6IgGSXU+LUdHO1FlIBxwcKB7SOOoTplbr6HXhe5HYvo1cT07OV2vFrgl4hgLU38Q
         77LLSlQT/cdqgsEqNKb6V3PwkUw0x/EYElGDYRlPzrtIe6xake10RHkWA6vg0YIJ/3a3
         nVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l70LSGExLbSp0so812MPio0cT56sD1x7VAxWdvZr8ws=;
        b=q6FdX/EBO9opAtvIrQC2ST2mNdGZjx2WJh6dydCAv0GgglEYLKcDcX0v6TQu0sa1oh
         0uaVV+Gg2CDABYYyGMgj4aB6t0DRYSJL/QUd4NqylZObAUYtS7MsSD30ClyWJLWp9nhV
         /B3IO2nXxWLAUF1leZkdY5mSBHrM3rxNEy87c4F5gYUbNIzHo5w5hOu/WWXzxVdnQdom
         QuJS4PRLM+0vvhMRR9AKPZTczHgvJCVEJWhwYzSgnbarow37yH2fVdBsjrOCutXbEpw4
         5uziujoigWYYVlbNMq8r1Od9NcnQ8JjHgOzUMTjEi3bBhxekHnJJ2bMnd2Q8TInZLt/O
         wEYw==
X-Gm-Message-State: AOAM530sETH2UxuRzTYlRfgaLU9/VVBBW++zIFUYYWr0EydUPacmykdv
	2OnxYVSVAwJ4WXFLjlSLN7Ypc0OJxu7UyBkS+U4=
X-Google-Smtp-Source: ABdhPJyikq6CdyZcK2RYHRqOSi9lnDDZihafuvuQJU6qdXAhL2MktTHOZbb/jVazObJbYGzLtvswzA==
X-Received: by 2002:a54:438e:: with SMTP id u14mr99875oiv.116.1621556415682;
        Thu, 20 May 2021 17:20:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v22sm831013oic.37.2021.05.20.17.20.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:20:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] Revert "cml1.bbclass: Return sorted list of cfg files"
Date: Thu, 20 May 2021 14:19:27 -1000
Message-Id: <da2d337fb964ec25ab2e593cc9c2f0786c39581e.1621520845.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621520845.git.steve@sakoman.com>
References: <cover.1621520845.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This reverts commit dee41e92f0efac7e453597bed4b4c02f867e3aa9.

This patch breaks cases where some config files make changes to earlier ones,
ordering is important. The reproducibility issue in busybox was elsewhere.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab0a296607b58775e91948ba40956c666dbb1244)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index e91452081c..8ab240589a 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -6,7 +6,7 @@ def find_cfgs(d):
         if s.endswith('.cfg'):
             sources_list.append(s)
 
-    return sorted(sources_list)
+    return sources_list
 
 cml1_do_configure() {
 	set -e
-- 
2.25.1

