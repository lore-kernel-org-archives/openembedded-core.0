Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DABCC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 10:55:38 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7589.1634208937552455227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 03:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I+HzcE9q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v17so18067115wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7IgKWktck760qPkKpA3aBG7C8wTII2Z99LVLxvVsv8Q=;
        b=I+HzcE9qeF3RmDLQHLqQruL8CPAnekF3pf6OEA2IA0Edykcl4RlEKV/H8a9nl5G331
         8qNJwCZtAcCitZGq+ocgVjeQeJ/qVDqwx5ws4H/xukdyg8rjy7Y0xGzRkHtZ/hvUvrll
         /eo69q5Fup5oXQO4KP4v8+DrfVkLlFA8hajm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7IgKWktck760qPkKpA3aBG7C8wTII2Z99LVLxvVsv8Q=;
        b=eeWRaIBOfWXlEf1sr3i+Ix3k5FC4MOpOWr8TSKJsZcyLgYlS4hCmY0j6q3JSRQxHdx
         BwpGw++BiovEglxyLVLdOYhDjZSUUKq2JuXUXUbLy5c2J8/KWUKmomy3+tPVmxpy2wFB
         aPE7UTTOK5Z1RQajHSTAKgoibwCY37mNlKdCIW+OOiM4c9ZKz/iTFxZcSpB7DJlkv4T9
         mUcn4YxCY2XWGp1EgsPUtezugWI1ThlRUPy5dXqdGIlu32HRsC6LyzrYYh1waq/oeK+E
         A99DxpJAtbvRSXT0FhhO7o4twshd3IuNrFMJrSLFMECCjISVDkpm78Bm/MvshX20vo6+
         QlLA==
X-Gm-Message-State: AOAM531ytLTXu7c26BEP62Vdq7v6C7Fdy8kkPL+nRd+ZBERY7AGgktw5
	BhVC9BGFOfl5LQwJDTSb7Hjt0Q3SVfZDeg==
X-Google-Smtp-Source: 
 ABdhPJyhKgHh/cI4y4kFlCxjyo0hP322cF1S1bFdRXLMxNPnYbdKBxer3R453SrSUxESILCovyaOZQ==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr4946853wma.100.1634208935950;
        Thu, 14 Oct 2021 03:55:35 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 z2sm2043695wrh.44.2021.10.14.03.55.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 03:55:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] patch: Use repr() with exceptions instead of str()
Date: Thu, 14 Oct 2021 11:55:35 +0100
Message-Id: <20211014105535.2909960-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 10:55:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156934

This gives more meaningful errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/patch.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 87bcaf91a87..fdf3c633bc8 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -150,12 +150,12 @@ python patch_do_patch() {
             patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
         except Exception as exc:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], str(exc)))
+            bb.fatal("Importing patch '%s' with striplevel '%s'\n%s" % (parm['patchname'], parm['striplevel'], repr(exc)))
         try:
             resolver.Resolve()
         except bb.BBHandledException as e:
             bb.utils.remove(process_tmpdir, True)
-            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, str(e)))
+            bb.fatal("Applying patch '%s' on target directory '%s'\n%s" % (parm['patchname'], patchdir, repr(e)))
 
     bb.utils.remove(process_tmpdir, True)
     del os.environ['TMPDIR']
-- 
2.32.0


