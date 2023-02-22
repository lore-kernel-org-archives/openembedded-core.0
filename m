Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4AEC61DA4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 14:51:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.10810.1677077504088685142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 06:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dlp9N5re;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id az11-20020a05600c600b00b003dc4fd6e61dso6562049wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 06:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L5shgSSwC+KREsc8BXW30aAMp3Hye+7pc3V6ivulcdU=;
        b=Dlp9N5redvJblNyIJkdlL4EOHPpKIXIF3LRLepyNaXtCR3OniU+JtlVbj4Y1QNMzLF
         qaTIZq5Xc3js3zWTZdDH0RzQ+VHcQ/gkGLuvUFNXXDPxL+8Rpw8VAFk/czyLfY+YGeml
         DBXvou+YLukd2yegeyj8Ohcx/WDDPvSzw411I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5shgSSwC+KREsc8BXW30aAMp3Hye+7pc3V6ivulcdU=;
        b=JmdUpBNi1Y0k3q4yYGn4QB1y/oon+ulk/NMzZLx3MP1jn4sTBCpS5hPQv8/V2RB1Gt
         P3K71oLWgkPP2ANpQkmjL25riraiVNhiZdozu/5frZb5FWbfgbwhouQt/L2QQHGpDqmF
         /gShV2sDP12FDN0GKmtXT0YUJygAvSTUTl0Hs8XZlNrnMKTEozLeSdgbtYjP3i+G4T3T
         Ewjcr0InFw/j9+DMvk8WTrpxDrKEpv0655yBjDVfsjBknCc1QHF4n3X/VOLqdyXAZHoc
         gLoX/TKXw2yHGGtfWXBFAAD7VIKzo6VCkQ7/+zuxsXzPKd2MNlt/0Y94/mnvVGf1Wjer
         v8zg==
X-Gm-Message-State: AO0yUKWPkVWtSQQH6Sa6wYG04aoJxRdZNaGnKFArB7e8MJRV8oVom1TO
	4bLyruyOSzYkhxgQln7Zoxpz5qsfHaOk+5c1
X-Google-Smtp-Source: AK7set9NGpnFJPMYtYa48I94+ppzSQTlRsN6qgHBiMxkOeg84CGdkgZWolCWBSQ+8EyDuE4ygIxsBQ==
X-Received: by 2002:a05:600c:32a7:b0:3e2:1368:e395 with SMTP id t39-20020a05600c32a700b003e21368e395mr6347316wmp.33.1677077502238;
        Wed, 22 Feb 2023 06:51:42 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d5d1:6a95:9b62:17ab])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600c1d0800b003e6dcd562a6sm7973500wms.28.2023.02.22.06.51.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 06:51:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Add check_for_interrupts() call functionality added in bitbake
Date: Wed, 22 Feb 2023 14:51:41 +0000
Message-Id: <20230222145141.581289-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 14:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177572

Add in the new 'check' calls which mean that the code can exit from longer
running code loops if requested by the user. This covers sstate checks and
sstate manifest cleanup code which currently couldn't be interrupted by the
user from the UI.

Increase the minimum bitbake version which brings in this API.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sstate.bbclass | 3 +++
 meta/conf/sanity.conf              | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index 567de4aba4d..5b63582b5ae 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -1023,6 +1023,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
 
             if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, next(cnt_tasks_done)), d)
+            bb.event.check_for_interrupts(d)
 
         tasklist = []
         for tid in missed:
@@ -1296,6 +1297,7 @@ python sstate_eventhandler_reachablestamps() {
                 lines.remove(r)
                 removed = removed + 1
                 bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
+                bb.event.check_for_interrupts(d)
 
             bb.event.fire(bb.event.ProcessFinished(msg), d)
 
@@ -1365,6 +1367,7 @@ python sstate_eventhandler_stalesstate() {
                     bb.utils.remove(stamp)
                 removed = removed + 1
                 bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
+                bb.event.check_for_interrupts(d)
 
             bb.event.fire(bb.event.ProcessFinished(msg), d)
 }
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index fff1ad8246b..593419921f5 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "2.0.1"
+BB_MIN_VERSION = "2.3.1"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.37.2


