Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.195.1609972590823921655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 14:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TUCFxepR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id g185so3925422wmf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Jan 2021 14:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KCyGFVwQOg1mb3t6F5wcc+8wQWXbvaQfatmZvK9Vc7M=;
        b=TUCFxepRmwvOST/XzlnrB85QLaodn3ykUjDJV3c5s7oSFK65//Vl3XTqN8/XIk3rzL
         Wf9ccpEa7vy6RJimPUeZE8qnSa6Raa93p0ncktvZKK9kOshS8UJqrheFJdGLjoufYxRc
         0nzaGJiPUaeTI9kGV/Q7Km+BaW4W+SWZfnQfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KCyGFVwQOg1mb3t6F5wcc+8wQWXbvaQfatmZvK9Vc7M=;
        b=Ycqs2Ax6Trt97ZobYRyleXz5LRseX0mWoJY7Y6Z2crb78o95wPFI5YAF9JZ6dhoVCP
         If+ILD1N6pMjutpcdEzUlChIZJbrLokwzNOYD6ylyK4m1dqDicCu5rSa4kl0AtyRdySB
         HhgJrrhANrmj71pDK2suOj3QbOPmlA/lykrZATML5+fwv5gctjvQDOzRcB7QbySt1sGh
         WKdEfLEAAe3Woh5lLTBe4TpPSS6o6ehEZsWDip01Go5vhldMEkf8FTRcFXJvleEE9bui
         PyV+v8g866fRKJJfvuXrDB3+TKRLdnCecP6KsdOPLAFI46oyihEvHoC+dtx+aRKP3223
         P4SQ==
X-Gm-Message-State: AOAM5332Ks4YOYJHomhb+ImZpn9XU3GfkbDEnPFUYQFr6K7CUHbsqV/w
	/5yU/TQA/Xj6+KhFCJy6TwzuqkX1tEWUDA==
X-Google-Smtp-Source: ABdhPJzD36aFP9FX4tPuaSDCD/7POxqvE0biZJEVAcU1HnmAZnPZE+u8N4SR0vpruh2I9pJIJPUKsA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr5586368wmf.134.1609972589035;
        Wed, 06 Jan 2021 14:36:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f082:51:8822:ee14])
        by smtp.gmail.com with ESMTPSA id o8sm4765510wrm.17.2021.01.06.14.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 14:36:28 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] sanity: Bump min python version to 3.6
Date: Wed,  6 Jan 2021 22:36:25 +0000
Message-Id: <20210106223628.561432-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are a number of reasons 3.6 is a good minimum version. Of our supported/tested
distros, only debian 9 still had python 3.5, the others have 3.6+ or already
required buildtools-tarball.

New versions of qemu need python 3.6 as a minimum. We could work around that
but it seems simper to require 3.6 which will allow other improvements.

As such, bump the minimum python version requirement to 3.6.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3262d08fbfe..d134b40a87b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -770,10 +770,10 @@ def check_sanity_everybuild(status, d):
     if 0 == os.getuid():
         raise_sanity_error("Do not use Bitbake as root.", d)
 
-    # Check the Python version, we now have a minimum of Python 3.4
+    # Check the Python version, we now have a minimum of Python 3.6
     import sys
-    if sys.hexversion < 0x030500F0:
-        status.addresult('The system requires at least Python 3.5 to run. Please update your Python interpreter.\n')
+    if sys.hexversion < 0x030600F0:
+        status.addresult('The system requires at least Python 3.6 to run. Please update your Python interpreter.\n')
 
     # Check the bitbake version meets minimum requirements
     from distutils.version import LooseVersion
-- 
2.27.0

