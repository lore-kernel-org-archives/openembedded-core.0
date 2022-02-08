Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4773CC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 20:37:57 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.17128.1644352675768137884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 12:37:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jBcSBkYq;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m4so1065601ejb.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vFLPwz5NKbbpo2Ojm48DQ3i/rD6ZJEn0OqzPmWOiiek=;
        b=jBcSBkYqHmuEtcu6va+vcnXPc3aQB/DAv93Y/UDkL9jMaxyLwNiQyaVcHKJqYB8CV6
         XATXhfgv7RYDftxTCYtsZUZ75ZD7DeAFxXoEW4JKV06AKHXeToJt+ChQ48JEDuiK7/AT
         Q/dJbSMi4ba/MkqfcsjuhTPWOgXh1p/HOFLqhfnxFPNwn/35oeNTZbtLG7N9xjKYpJ+f
         ACAaDCTZMYwWUpug6b3ryw/N9Zg7rBVkkIBc52dE1yELULPcMcVSK87Xb7drE41Jg7Vu
         a+vHpOw9XEVDbCQpeHcUxe6V8nU88UrBSGbwOuKIizID+79882GJXKcSPh0vFNNOJ3sl
         o87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vFLPwz5NKbbpo2Ojm48DQ3i/rD6ZJEn0OqzPmWOiiek=;
        b=jk0mYmXb17VAW/A4qLpWpbkRCEVpBHLytOIJOBeC5/e3++DDj76Qce4KuVD6T44Cp1
         7iU9mRPDmhKvGZktgt0Pqc/THXERJZ8y2lK76e+zLOF3L4hmTWBk+stQrzF2JiXpCSkj
         CYCp+RHARmLJ2uDUyBTVt7XWPIEEOpnSXB+lHL988UBe5v5YSnRoFXydTfAFXIfmYDz7
         r8EV8S4sGr4UbIOUGA5EKx9OjUiPSfsd1eMGWCFgaOXmjTfG9HLuygYx33d4DWXonjAz
         LdDMYwLu/GyhI7+K0WkIQz93UdSudlYcixmqhbFnsp1qCnwa6nyba5rrGPEoDMvJ5enB
         PvPA==
X-Gm-Message-State: AOAM533RZbg1U0ZnuvszZcYXgYZ2Xte5I9QaPbLqYJt43A2N9aZHLoXs
	pqNTrGMV3jZYaHZroNPONu/Hkm4HX4Q=
X-Google-Smtp-Source: 
 ABdhPJz5boWhv5B6fCmr3uYZAmnSgOwFFBUcd9LTFH/C1IvM/WxlvblOVfBKad3+mMRg4y/Bi1HHwg==
X-Received: by 2002:a17:907:3d94:: with SMTP id
 he20mr5067881ejc.637.1644352674094;
        Tue, 08 Feb 2022 12:37:54 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 r3sm5272262ejd.129.2022.02.08.12.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 12:37:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] sstate: fix up additional debugging when fetch fails occur
Date: Tue,  8 Feb 2022 21:37:49 +0100
Message-Id: <20220208203749.275175-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 20:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161526

This should print the actual stack trace, for real :)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/sstate.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 475ce40c6b..54edf0bec6 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -992,6 +992,8 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
             localdata.setVar('SRC_URI', srcuri)
             bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
 
+            import traceback
+
             try:
                 fetcher = bb.fetch2.Fetch(srcuri.split(), localdata2,
                             connection_cache=thread_worker.connection_cache)
@@ -1000,9 +1002,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 found.add(tid)
                 missed.remove(tid)
             except bb.fetch2.FetchError as e:
-                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)\n%s" % (srcuri, repr(e), e.__traceback__))
+                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)\n%s" % (srcuri, repr(e), traceback.format_exc()))
             except Exception as e:
-                bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), e.__traceback__))
+                bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), traceback.format_exc()))
 
             if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
-- 
2.20.1


