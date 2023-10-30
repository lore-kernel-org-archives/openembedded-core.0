Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59FBC4332F
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 15:44:52 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.152675.1698680684226884286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Oct 2023 08:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=1Y8h6Mny;
 spf=pass (domain: baylibre.com, ip: 209.85.219.53, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-66d0f945893so37822496d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 08:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698680683; x=1699285483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppoik5TCScSZbQAjqacgm1GpWndo9RliLE7Ikr3CIbY=;
        b=1Y8h6MnyoPHz4mFCj+flOQzZSBEzXXT3zXIFif7/EQOXSlbLjRDjBTLiGdM801iaNu
         4IJvCYSdvD/qufCUwl3hsv49eMgK9mYHfLhUM32/x1qAljVnt2RzG1fK9Gv98pc7an/X
         FNT2iLjxeb3r3irRd7CYgnpJyj3YmcPVxbrIzHq1lnZ/5ORB28cV6z/l9I5j/erSbp9s
         V338t+nlliAKQxpr5jjVy0+7yX8yVFxt5Mw1kEGuO0BoZCsodbavd/eqpxN7d2DVCukb
         jhne24cWMjlzwCoQzr+vC1EClo+uH7snquom1oGpqDWA3rXwgl4+uYAzYM8BrNEa/GFc
         I15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698680683; x=1699285483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppoik5TCScSZbQAjqacgm1GpWndo9RliLE7Ikr3CIbY=;
        b=dXPayMArgeH95lQ0Ya4/q6Dag0J4damM4GIrBW3qjThzSCDB8NDHWMrnb9Vuu5Qsyt
         Zgh5tX5gTbbZZxtFbW+ZH+4w06sczrAJbgkp8rfWXbaCfDZdoH+ew/BuGV+F8gManOEo
         sdFPBLwdA7GZAMa/nNUAGMnLxaTbhGxe/IkavzpuvsbbREgytVtxIptkPkck+gnIvm2v
         W4ye5WrgOZVXQ3tVDgH9KlibkNrhJZDQlHTx68Cc57SfmaICaEEjeSd/gGzwvTAXjwIr
         DaVj/YUzNjNMzitbOnwxonZi/q4uZShKUoWjsz6kak/pktBiWGZgwUMPo0vdSspB0WYc
         j3yw==
X-Gm-Message-State: AOJu0YznJIejeu8VTEbFwslUMQ9R5Stsu/6Apu+ypz8VZOJljLOGIlLb
	QTJZ1D3kalnu++3HhOdp8s1aSLJW042dWU58niV5ew==
X-Google-Smtp-Source: AGHT+IFQu46xvzACMRTCDFlpHCUmpyig8kuBjvn06+ki4Aj+T8kXkTc9UvFlplB6GB+28nlqu0w6gw==
X-Received: by 2002:a0c:dc87:0:b0:66d:13b5:ca16 with SMTP id n7-20020a0cdc87000000b0066d13b5ca16mr20442886qvk.27.1698680682724;
        Mon, 30 Oct 2023 08:44:42 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id e3-20020ad450c3000000b0065b11053445sm3528475qvq.54.2023.10.30.08.44.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 08:44:42 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: send results to submitter
Date: Mon, 30 Oct 2023 11:44:41 -0400
Message-ID: <20231030154441.217692-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Oct 2023 15:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189800

Modify patchtest-send-results so that it extracts the submitter's email
address and responds to them with the patch testresults. Also make a
minor adjustment to the suggestions provided with each email and include
a link to the Patchtest wiki page for additional clarification on
specific failures.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 078651ec381..01b071159be 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -17,6 +17,7 @@ import boto3
 import configparser
 import mailbox
 import os
+import re
 import sys
 
 greeting = """Thank you for your submission. Patchtest identified one
@@ -25,10 +26,12 @@ more information:\n\n---\n"""
 
 suggestions = """\n---\n\nPlease address the issues identified and
 submit a new revision of the patch, or alternatively, reply to this
-email with an explanation of why the patch format should be accepted. If
-you believe these results are due to an error in patchtest, please
-submit a bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
-category under 'Yocto Project Subprojects'). Thank you!"""
+email with an explanation of why the patch should be accepted. If you
+believe these results are due to an error in patchtest, please submit a
+bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
+under 'Yocto Project Subprojects'). For more information on specific
+failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
+you!"""
 
 parser = argparse.ArgumentParser(description="Send patchtest results to a submitter for a given patch")
 parser.add_argument("-p", "--patch", dest="patch", required=True, help="The patch file to summarize")
@@ -54,6 +57,10 @@ mbox = mailbox.mbox(args.patch)
 mbox_subject = mbox[0]['subject']
 subject_line = f"Patchtest results for {mbox_subject}"
 
+# extract the submitter email address and use it as the reply address
+# for the results
+reply_address = re.findall("<(.*)>", mbox[0]['from'])
+
 if "FAIL" in testresult:
     reply_contents = None
     if len(max(open(result_file, 'r'), key=len)) > 220:
@@ -66,9 +73,9 @@ if "FAIL" in testresult:
     response = ses_client.send_email(
         Source='patchtest@automation.yoctoproject.org',
         Destination={
-            'ToAddresses': ['test-list@lists.yoctoproject.org'],
+            'CcAddresses': ['openembedded-core@lists.openembedded.org'],
         },
-        ReplyToAddresses=['test-list@lists.yoctoproject.org'],
+        ReplyToAddresses=reply_address,
         Message={
             'Subject': {
                 'Data': subject_line,
-- 
2.41.0


