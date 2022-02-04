Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4DFC433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 17:54:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.12513.1643997276076259613
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dQFV1iF6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id n8so5070768wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 09:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iM+51VFGomu8ys73PpQ9kHsSnKZefUMq/r3fNKkRB34=;
        b=dQFV1iF64X9wIY47hNZkQEQoslbSdHo5cutI/jKYa1l+2/Yo63S8NaWfhguGbeYJ4V
         pokC6cLpqkmL71/nHqveWWsQ9oN6TFYyGjPuH1ErfTMqgSEcvTtot5KEQrqaujJ/004Q
         r6By72XvLAZmz9QCgfFbB2lmvDrcnBF3YfoB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iM+51VFGomu8ys73PpQ9kHsSnKZefUMq/r3fNKkRB34=;
        b=XQ9EA4bVa9gFvgwy10nYZptUBbokO6pyNjzu1Ohnx04CNuAVD10A18SBTl51/uXyiq
         BFZYGYcnshjCwoKpMKDlDtyX0jMe/yZ0bTySsh+D9ihiGO/4kYkgSEFyUfhDVU578LN5
         Q9jHoQcKwIqHgMCF2KJx3ni58xIRhqmDBcky1QIR6qELzSWyY6YFpjFApdr5xDWLr0Ms
         u74AXK1c9fallzaK2HycwGbaQo8ALO8ph/GcyAKqAp3MDt/05lz8dICeUvOQO/UM7wWk
         fFwaTu+Ee0VA/1m4G1Trz1W8NJQB6QP9U8Q0MSUzO4j2cBLykmyGN8aAJSgveBHOR7Rt
         nIRg==
X-Gm-Message-State: AOAM530HUaGiRmEA1NYMBlValLDRj/PTCGV08ImjzwT0Bq4SnPZ4i980
	cnzmYpgGRZFEw15qPCMLKhOgJHwLNC7H1g==
X-Google-Smtp-Source: 
 ABdhPJxNoHLsv3D5ijor4F8mgDqFGCWOIfzSapGGAbhxgHLsRM21yoa1DA/hNQdpZZwtXwAmJl/VNQ==
X-Received: by 2002:a05:600c:3b90:: with SMTP id
 n16mr3133946wms.178.1643997274298;
        Fri, 04 Feb 2022 09:54:34 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7818:26e5:4f1b:504a])
        by smtp.gmail.com with ESMTPSA id
 be11sm2827834wmb.19.2022.02.04.09.54.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 09:54:33 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oqea/runtime/oe_syslog: Improve test
Date: Fri,  4 Feb 2022 17:54:33 +0000
Message-Id: <20220204175433.2447432-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 17:54:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161376

We're seeing failures on the autobuilder where the log message isn't present in the
log. This could just be a race in the compound command but it is hard to say due
to the poor log output from the test.

Splittng the command into two sections should add more of a delay whilst ssh
reconnects and may well fix the issues but this change should also improve
the log output in the failure case too so if the failure isn't solved, we should
be better able to debug it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/oe_syslog.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/oe_syslog.py b/meta/lib/oeqa/runtime/cases/oe_syslog.py
index f3c2bedbaf9..150b70d9f03 100644
--- a/meta/lib/oeqa/runtime/cases/oe_syslog.py
+++ b/meta/lib/oeqa/runtime/cases/oe_syslog.py
@@ -121,11 +121,16 @@ class SyslogTestConfig(OERuntimeTestCase):
 
         self.test_syslog_restart()
 
-        cmd = 'logger foobar && grep foobar /var/log/test'
-        status,output = self.target.run(cmd)
-        msg = 'Test log string not found. Output: %s ' % output
+        cmd = 'logger foobar'
+        status, output = self.target.run(cmd)
+        msg = 'Logger command failed, %s. Output: %s ' % (status, output)
         self.assertEqual(status, 0, msg=msg)
 
+        cmd = 'cat /var/log/test'
+        status, output = self.target.run(cmd)
+        if "foobar" not in output or status:
+            self.fail("'foobar' not found in logfile, status %s, contents %s" % (status, output))
+
         cmd = "sed -i 's#LOGFILE=/var/log/test##' /etc/syslog-startup.conf"
         self.target.run(cmd)
         self.test_syslog_restart()
-- 
2.32.0


