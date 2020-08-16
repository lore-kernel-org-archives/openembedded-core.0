Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.24150.1597586368959587186
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 06:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hOnoc8Vj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k8so11832254wma.2
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 06:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3ITv3TEvwuneeZRsb9u45bSx/IpgR5KUE5Jn40gGl4=;
        b=hOnoc8VjE7qeJQ8BYZ+7IRwMEx94L+uzlNmCKYH+OFvsZqQDO/nGh4NK51vnNkcWY8
         st7gOXAXuKAcYQXgDgR/WGh75YZm8gG6xNy3bKbLa088AvNuFQvb4ctKxBE+35odzDjS
         4H8xGpjrcYcVQJywCaSlNNDIfd+zdng2mb0fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i3ITv3TEvwuneeZRsb9u45bSx/IpgR5KUE5Jn40gGl4=;
        b=SdN0uQQ7L+hLbMkUOjs/lyzYk7W2DhdozhcXNIyNf8nFUG7Do7Yw+l8Epun/ce5q/5
         ln5lR2kUhmlcSqJmEXNECxNOepE0gl0ioKB40Sw0vbnNq3yciIojX6qwUbavddKPcaI3
         FBzj6Id+oBz00WGstbJ6oFRaKSSmDYVidWCX8dJjG7+RRpl0zatakUyLMajExr63wq3v
         hmQN7WAuILmV0I02EMv6vbLDRpHeem1N7bO0GIyQMiRrA8iU6LQZCnAHo3GQ6RPqZPFu
         dYtlTWgOfVKj9I9Gy9JpALph1VkC50FyqNXqsg0TV3FZpp38l8L3ikm/ERpeAw1fD/jO
         YYMQ==
X-Gm-Message-State: AOAM530LU7tzrpJBmzad/gwDHAFTYMN1v7msjOaU0lx4AvFAYLvgje8W
	nTBnRnuK7s54oMcDpp6/e4mB//BBnSIKQmi2
X-Google-Smtp-Source: ABdhPJygBbaX4KdDsbyFABWQ8I8oTmp3G0OPKK5WW/31PVl2EayOFL6vzJMGYPWP57sFcSVKMcxdhg==
X-Received: by 2002:a1c:26c4:: with SMTP id m187mr10696549wmm.90.1597586367163;
        Sun, 16 Aug 2020 06:59:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id j5sm27062556wmb.12.2020.08.16.06.59.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 06:59:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/tinfoil: Increase wait event timeout
Date: Sun, 16 Aug 2020 14:59:25 +0100
Message-Id: <20200816135925.1066121-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We're seeing this on the autobuilder when IO load is high. Increase
the timeout to give this a better chance of working out ok since
there is no particular reason we only need to wait 5s and searching
for files is IO sensitive.

[YOCTO #14001]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/tinfoil.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py b/meta/lib/oeqa/selftest/cases/tinfoil.py
index d1aa7b9afdc..206168ed009 100644
--- a/meta/lib/oeqa/selftest/cases/tinfoil.py
+++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
@@ -100,8 +100,9 @@ class TinfoilTests(OESelftestTestCase):
             eventreceived = False
             commandcomplete = False
             start = time.time()
-            # Wait for 5s in total so we'd detect spurious heartbeat events for example
-            while time.time() - start < 5:
+            # Wait for 10s in total so we'd detect spurious heartbeat events for example
+            # The test is IO load sensitive too
+            while time.time() - start < 10:
                 event = tinfoil.wait_event(1)
                 if event:
                     if isinstance(event, bb.command.CommandCompleted):
-- 
2.25.1

