Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B45EC5AE5E
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.626.1700498390796690810
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Agv++3hY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cbb71c3020so252654b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498390; x=1701103190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rDtdfLZPgQRausMXu9ENTt6v+X79nssneRN09gSsxU=;
        b=Agv++3hY9O8rYN0CAu7CUKDNI/cHTf/eWNM+SEiixAwL/k8elHKGXHO5S/wGIcx4yq
         FmkQjldrfPU8192Zfdym41YIkdSmpVqNdgugVBEX/m/01LAU/qWnBtUi/T4qwVIgLx+r
         2Ow2gxgTTL4jYSDJr+jDsZB06Bg3czQNv3m5LLXTLPOGkG+HfntauajXTHq5O5RLkcFH
         2VNRMK8am9H7uKLq4AuW8bFNFtzTrDk8d8aGvbOuAvyN/2biFqwgSGXSeoLrq+oZlAb3
         VVvofZD0XhUfybndpsbaM8mkCMgMz9kW+jlfJ/6T6QaWH7GRT+1A3B9QAsRSV4bNNWyB
         RUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498390; x=1701103190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rDtdfLZPgQRausMXu9ENTt6v+X79nssneRN09gSsxU=;
        b=vqxdEgpHeP6w8ebVUqoQTw8Gh5pRCDZ6p41AOf2z+aO1sZA0Q2XIKxQO74BMOnJ2eB
         EqF19uEVN9tnP/B8OlFoUfGmKr4u/rdsQIOddk7BVrNe6mG2vDmDMNcuv3t5MdVN/kKw
         rUscsf1CsY59iDYA3WABEBobzlgvxb840/WeRhn5HR9nYKblvd6ff8UdOjXHAHXqzEG/
         xt+YQZAUDn+ATp6vhCHA2Ogd//7lpYp6Fbid0LT73UDf4O3loHWhXfO6VLs88E7FImEI
         4tMl1FrruiE+iV/K98D0ndGg6eubqCPMpuCB857S/J2q9IaHCNKNySTtQ2AFWf56Ky4s
         vOPg==
X-Gm-Message-State: AOJu0Yy5HyL6/qKdc/tgINxD46YWt/HzY8O8MzFnszgzWWx6+cg28HVf
	epNDGMc8nxesv+EU2KmK03LE4Qn/spc/6mRk5zJ7sA==
X-Google-Smtp-Source: AGHT+IEAasp1rCsf1JJAtNz6kKLcxW74huZRLfb3pH7HivoQ42rQP0YyRLezEln6HI6CUm74oLp84Q==
X-Received: by 2002:a05:6a20:1607:b0:15e:9923:3e35 with SMTP id l7-20020a056a20160700b0015e99233e35mr20596581pzj.19.1700498389831;
        Mon, 20 Nov 2023 08:39:49 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 28/33] patchtest-send-results: send results to submitter
Date: Mon, 20 Nov 2023 06:38:42 -1000
Message-Id: <a7270a7428f11fe1ab6b6d7069ddfbcbf1630997.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190917

From: Trevor Gamblin <tgamblin@baylibre.com>

Modify patchtest-send-results so that it extracts the submitter's email
address and responds to them with the patch testresults. Also make a
minor adjustment to the suggestions provided with each email and include
a link to the Patchtest wiki page for additional clarification on
specific failures.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 64ed88e32cf9e04772319ff6e66c602d1cff4fd7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/patchtest-send-results | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 078651ec38..01b071159b 100755
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
2.34.1


