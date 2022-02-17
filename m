Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D71AC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 17:48:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.3107.1645120122249750227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B+ce6acM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id o24so10381875wro.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=il48fH2U2TleJIS90mRE2fN+N1iQM6BBkjBj2cpSn4g=;
        b=B+ce6acMjz3evmlrRAOnQ/ZiSyHInCT19H80ejHLLuvZxptoPitDd4L72g3m1V5LwO
         nx7gUPDMabIrpji1L1eN8dWLcli6C2R3mmrxj99/u95zvWAswcO5M2+R1G65c1NTy56D
         uAkSUTjUsYHBbIloNu2e8YGBuRWxIir0XXqlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=il48fH2U2TleJIS90mRE2fN+N1iQM6BBkjBj2cpSn4g=;
        b=Niq1U9Chwq+Aa4tR8vUpaHn1LPjFw477ZwIosdKurG98leALuO4EKd08Qo6nZRdH/5
         LpFib5Z4h5TwO0M80pHDnhxYhl6K4wjKayeAe8M3JZFr5cV7tUP0Tl0NkH5MJdCfLdVe
         oo/rSuN5P/LmwTXDilE+atWD3kcQLm9d2r4WiZhVd5J4oYek8kY34wW9Ehnw6168ln0C
         tv8meHLt0M8IVDNmQdk+3SxWavjQW8cYpKYk0dWs7s2SVx4ysH59LF3Ak8Ih2GmQ3pzP
         AV2DmPwyJM6WcJhCzZzKsd4tkRG0c95ep7JaeKrdPAYxDTOrbIBHTS5rvEMIEKx4VCT0
         riSg==
X-Gm-Message-State: AOAM5306GcsWp0MdJCfGyWgVpLR5pmBdWL+uCBwdWyPrFOmWmJSBtg/M
	lCmx+t8iXMr4nhXuL/4kgjNCqU+/F175Khwm
X-Google-Smtp-Source: 
 ABdhPJysrqcDBMh+cQhxW1rbbsQD9YpFzMX/M98rHE+67PFzfDvyx1rNIHWAuXdd/BQHyRfHk7JOYw==
X-Received: by 2002:a5d:6790:0:b0:1e3:3ece:3e07 with SMTP id
 v16-20020a5d6790000000b001e33ece3e07mr3178395wru.182.1645120120439;
        Thu, 17 Feb 2022 09:48:40 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2892:510b:1ca1:ad61])
        by smtp.gmail.com with ESMTPSA id
 r11sm29837387wrt.28.2022.02.17.09.48.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 09:48:40 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] features_check/insane: Use hasOverrides datastore method
Date: Thu, 17 Feb 2022 17:48:38 +0000
Message-Id: <20220217174838.2971444-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 17:48:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161849

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/features_check.bbclass | 9 +++------
 meta/classes/insane.bbclass         | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index 205e1b9cd31..3ef6b35baae 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -19,12 +19,9 @@ python () {
     unused = True
 
     for kind in ['DISTRO', 'MACHINE', 'COMBINED', 'IMAGE']:
-        if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and \
-           d.overridedata.get('ANY_OF_' + kind + '_FEATURES') is None and \
-           d.getVar('REQUIRED_' + kind + '_FEATURES') is None and \
-           d.overridedata.get('REQUIRED_' + kind + '_FEATURES') is None and \
-           d.getVar('CONFLICT_' + kind + '_FEATURES') is None and \
-           d.overridedata.get('CONFLICT_' + kind + '_FEATURES') is None:
+        if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and not d.hasOverrides('ANY_OF_' + kind + '_FEATURES') and \
+           d.getVar('REQUIRED_' + kind + '_FEATURES') is None and not d.hasOverrides('REQUIRED_' + kind + '_FEATURES') and \
+           d.getVar('CONFLICT_' + kind + '_FEATURES') is None and not d.hasOverrides('CONFLICT_' + kind + '_FEATURES'):
             continue
 
         unused = False
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index a13a947bcf9..a28fcd47986 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -992,7 +992,7 @@ def package_qa_check_unhandled_features_check(pn, d, messages):
         var_set = False
         for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
             for var in ['ANY_OF_' + kind + '_FEATURES', 'REQUIRED_' + kind + '_FEATURES', 'CONFLICT_' + kind + '_FEATURES']:
-                if d.getVar(var) is not None or d.overridedata.get(var) is not None:
+                if d.getVar(var) is not None or d.hasOverrides(var):
                     var_set = True
         if var_set:
             oe.qa.handle_error("unhandled-features-check", "%s: recipe doesn't inherit features_check" % pn, d)
-- 
2.32.0


