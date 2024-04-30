Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A94C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.220.1714512286511721156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aLadWJhy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1eab16c8d83so50314815ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512286; x=1715117086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXKU4gMbSBYr8zVuSkJRsQJxVVLMAO8wuppd7BX8i74=;
        b=aLadWJhy9gI1y6VMnZNV+Za/tvcDM+YYx1gLaXsT+XFJJRFdW5GKm8LbznR4sPQcxr
         oxWtCDGyzXsiYsoW18tHZ+hFscesUivL5WCjQ4HSyeFAb34zKXV83/88rRKZNxNr1FOg
         tjKpgtXemUxyFS8rlNYDBl2I2W3tkesEToiCAORSUBDhRyWiAviDPnzWwxXQNpwG5JIE
         4/1cK0kPGhFyE3aP7ufVEByldiLQCNttJYwLHdInmz9AUkvK2ggEg0MGq/6BpMWDxJ5x
         oQooQVU60xHU10XEjLzL7M2N+sV92YVs2oyxb178WMONNq6sGDHpr+SUULjzM6XxlYOB
         NkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512286; x=1715117086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXKU4gMbSBYr8zVuSkJRsQJxVVLMAO8wuppd7BX8i74=;
        b=jSlxuK/Q7Un5IYcsz8wod3Cpp2LaSK/CqyQvDwAAPSuMCT69dtViM9w35FZ9K7ZWs0
         v7Rc+qS0NeulzD3kIwlkHEPEu6FD0qJcnBeGEuCDxGCCIXqAbqWaNW9aQVOcop7wk2iZ
         av+BXF6OvqLJ6pYTA+4imXqfq9HcuT0eE6bLeEIN5QAky5IMe5k4+rgS9VreCaoh4que
         eW1vFWlb1UCCw5/ToVD3ZK5hsD5Hvq0DPdfzsQ6pwmXiOiA05+Ct8PfgU9JFMIEriS/o
         qIpQEF/guGuUeCanYqnikO8vyph/aWuj3fICBylPtHAjdiWXnBU5CH4tNzAu9xq5mzLa
         N0Fg==
X-Gm-Message-State: AOJu0YyDPdSySfe12FoQLD5GBtjnBlSSJHslZkvGk02CEEA7XaGzlQ3a
	4OiBPOovmT7zoTVRqyAH3G8Z99nW0VdsGs7tZvQm2F8vscIkhkJha8H+vUU0FpQ3O7aITa7ScZJ
	+d/I=
X-Google-Smtp-Source: AGHT+IG8/olapVd02pyM43fcEYAF69SasKUs8d9MUR19qpA92YeUGgSAdE+TuNj+d3Lzwj9qUA4o4w==
X-Received: by 2002:a17:902:cf08:b0:1e8:674b:d10f with SMTP id i8-20020a170902cf0800b001e8674bd10fmr758163plg.41.1714512285858;
        Tue, 30 Apr 2024 14:24:45 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/17] ttyrun: upgrade 2.31.0 -> 2.32.0
Date: Tue, 30 Apr 2024 14:24:02 -0700
Message-Id: <a475523cc32cbe44032e31845dc61107b0dc518c.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198781

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- dbginfo.sh: dash compatible copy sequence
- rust/pv_core: Fix UvDeviceInfo::get() method
- zipl/src: Fix leak of files if run with a broken configuration
- zkey: Fix convert command to accept only keys of type CCA-AESDATA

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5890c1b9f6892a19ac4fb145ddad683dd16ca7f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.31.0.bb => ttyrun_2.32.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
index 122dd9d8e7..9a8be15dab 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.31.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.32.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "6f15ed326491a17d83ca60cd2bda47fb5e8a0175"
+SRCREV = "9eea78b3ad8ab3710fb3b2d80b9cd058d7c8aba7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


