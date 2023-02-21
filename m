Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C23C6379F
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:57 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.43560.1676990510422522404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=01zVYtu7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d7so2714547pfu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdJK4UfanqJxNXfyGFrXDR6RoMDH3dic4Yd1NpqSz5w=;
        b=01zVYtu7pMTGrqu+ymixA11VEH9H/2skIGSTwtkI/JQ2ZcF+FptpD0VeXlDQWvxnjd
         y6qfj4+3kXpwq0KuSFBiYA1w6PK5J98l95GEUtKetRTtUd0i7mnClmBffvjPz3XCvLtg
         0qzlBnE48xQAXqULJgLo/dbhbT6npj8YGCWsPI9XeL07qisgbh02BpVBZ73Jp9wH1t7o
         jdQTN72UXZWLpN2hYOzgwOCetnDSh+xhGrWQ/Ly+Wq58wYsi0HLatMbY1qxiUbSEA91O
         6HVIR7wClrHdkG2pw+h4yUfGS8PyWypxNOyIE9pL6N+DTjsT8Em0+BVqxFLrnZTSqVBc
         yciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdJK4UfanqJxNXfyGFrXDR6RoMDH3dic4Yd1NpqSz5w=;
        b=DL60mt2+JU1gyeupw2zOHsckPmW8Ds4Keqt5cVjGmC6VE6uOZFOsUxp69ht8ZtmJ8p
         UGXD9TfYooDocrpWzOrHotKCOZA7hinHl8dYNYITLGTghwJc3pDEwgggO/zXZ/QPlUmI
         xpAc5fiRbrcJwcznvk70qXa5kzWJxS9ImV27oXoIe2cyQhM2JSNA6ULvf/fvO7rdCsKU
         69yd7Fxd7nq+73cTjp/qYUGseTfg2ZMopnh19OKZHDc7Fr0krfk1AbJgLwyisO/cBrUa
         dCyvFSQrwFDOKl/Tw4Mf6WyxTCU6RMosf4NLI2FFMa4TIJjUSM1JT2zgoHF9lrWLDgIc
         S3hQ==
X-Gm-Message-State: AO0yUKXbhcazJUTNEcbxXFItrp8udVTvbqvXxHy8NE+/s68DC8jgMYVK
	t8CSSHVPUCb4NP1xBfNMz1s9rt3kEkU7B/NLiQU=
X-Google-Smtp-Source: AK7set/tKUqP2+dEjGcTB/9mOTfwiDKJJM5MOmJ0GvtlPD4SuR8H+mNXttkhKoEXHK6wylzogrxNNg==
X-Received: by 2002:aa7:955c:0:b0:5a8:be36:65a8 with SMTP id w28-20020aa7955c000000b005a8be3665a8mr4789406pfq.27.1676990509504;
        Tue, 21 Feb 2023 06:41:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/23] oeqa ssh.py: move output prints to new line
Date: Tue, 21 Feb 2023 04:41:00 -1000
Message-Id: <36b572fbc5c88b9aaf4e146ecdb00c8d4ea6ff70.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177517

From: Mikko Rapeli <mikko.rapeli@linaro.org>

The output from is garbled otherwise and it's not
easy to remove debug output form real command output on target.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 917a70cbc43ac1c70c477b220c4115735457ef04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/core/target/ssh.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index f956a7744f..f1b9090bbf 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -240,7 +240,7 @@ def SSHCall(command, logger, timeout=None, **opts):
                             eof = True
                         else:
                             output += data
-                            logger.debug('Partial data from SSH call: %s' % data)
+                            logger.debug('Partial data from SSH call:\n%s' % data)
                             endtime = time.time() + timeout
                 except InterruptedError:
                     continue
@@ -256,12 +256,12 @@ def SSHCall(command, logger, timeout=None, **opts):
                 endtime = time.time() - starttime
                 lastline = ("\nProcess killed - no output for %d seconds. Total"
                             " running time: %d seconds." % (timeout, endtime))
-                logger.debug('Received data from SSH call %s ' % lastline)
+                logger.debug('Received data from SSH call:\n%s ' % lastline)
                 output += lastline
 
         else:
             output = process.communicate()[0].decode('utf-8', errors='ignore')
-            logger.debug('Data from SSH call: %s' % output.rstrip())
+            logger.debug('Data from SSH call:\n%s' % output.rstrip())
 
     options = {
         "stdout": subprocess.PIPE,
-- 
2.34.1


