Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3D3C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:53 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.627.1700498393014286263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SW3PcxPB;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.169, mailfrom: steve@sakoman.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35749078a59so12408915ab.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498392; x=1701103192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOAuzL4onpCQ3AJ+upQyFx0xMBqZO2TZ4XqgHb9R148=;
        b=SW3PcxPB1AQZ1wTg6dtR0vqDoEMiq/Kts8pzV//wvbFNtYa/LpTIdW45h+/4FFDxii
         2g7lrufY+F6ugljUX69wZXXEsy8+ieVAPYNpqJwvpWQBigMDY0HTAc+XaLpFvoKA+zX6
         DkWZU6oU3oiuf6tcY7Gvi+zFVxJyjtEjuvn/wsYl/Myu/OfOcbD8U6CxpQC+wxgyslEw
         NFTrZxjalOB7WL/8vJUBRZfqML94uwCD7LiBciaGTV5jfDBwGjXescGhTanmkZd5x8rk
         cYeJKxBMtHuXa2c2ElIYMhRE5U4WyRN570MLl/I37GJwY2fVRC+3sDkNytJzSArUXnXr
         tKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498392; x=1701103192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iOAuzL4onpCQ3AJ+upQyFx0xMBqZO2TZ4XqgHb9R148=;
        b=W/RP6TjvZ2wFaGkolvsscpuWYUVPhqw0eTuP5T8LrMgfVxZFF1ce2EC4/3WkViW0Re
         lMEG5wq58nYWSjCpz78yYBbxOyrxy+VRxzWCa3YA56a8C4FWlxxNYsdDHxiP+qeDDM8N
         +XxtFArSJ9juAVytzH+sThQrZi46OtgugfGCB07vdhfUPLl7zMCIBeI6eCXtGfP3NhXU
         F3YTvnN46ztU+PzP7bf0JVkkt7u0bqAYarWIPpGs+PsqI7r2ahvHszcCdpW0EXnrHhly
         s+dl8m66TGR9pKGx3oi3OKUEEcuEWqzOQIX1yPoi10uDGlihUs1jVWjz94GA/CLogQhA
         Homg==
X-Gm-Message-State: AOJu0YwgWp5+9TVpNPfHlYpDzPfeC0BVzXwi7T2zL1eNv2MsnP9BDJ9p
	Gvj68aGC1sUX/92J37glnHBJiObwwr1tyVuM9X1/QA==
X-Google-Smtp-Source: AGHT+IFM0Lp72U2HDjQdQzuXM6c5MQrcEnPLt3FkYj/2ynSa0enQwXs9q6+TswvqtZgniUVSGUstaQ==
X-Received: by 2002:a05:6e02:b4d:b0:357:704a:8699 with SMTP id f13-20020a056e020b4d00b00357704a8699mr11618147ilu.8.1700498391935;
        Mon, 20 Nov 2023 08:39:51 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 29/33] patchtest-send-results: add In-Reply-To
Date: Mon, 20 Nov 2023 06:38:43 -1000
Message-Id: <a19b530d90f02a12cde2ba4989e96d6b2c7539e4.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190918

From: Trevor Gamblin <tgamblin@baylibre.com>

Rework the script for sending results to use send_raw_email and specify
the 'In-Reply-To' field so that patchtest replies to the emails, rather
than sending them standalone to the submitter and mailing list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c45c92e7f26aea4edf2cfa577b7ba51384e59d3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/patchtest-send-results | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 01b071159b..1df81f943a 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -59,7 +59,16 @@ subject_line = f"Patchtest results for {mbox_subject}"
 
 # extract the submitter email address and use it as the reply address
 # for the results
-reply_address = re.findall("<(.*)>", mbox[0]['from'])
+reply_address = re.findall("<(.*)>", mbox[0]['from'])[0]
+
+# extract the message ID and use that as the in-reply-to address
+in_reply_to = re.findall("<(.*)>", mbox[0]['Message-ID'])[0]
+
+# the address the results email is sent from
+from_address = "patchtest@automation.yoctoproject.org"
+
+# mailing list to CC
+cc_address = "openembedded-core@lists.openembedded.org"
 
 if "FAIL" in testresult:
     reply_contents = None
@@ -70,24 +79,18 @@ if "FAIL" in testresult:
         reply_contents = greeting + testresult + suggestions
 
     ses_client = boto3.client('ses', region_name='us-west-2')
-    response = ses_client.send_email(
-        Source='patchtest@automation.yoctoproject.org',
-        Destination={
-            'CcAddresses': ['openembedded-core@lists.openembedded.org'],
+    raw_data = 'From: ' + from_address + '\nTo: ' + reply_address + \
+        '\nCC: ' + cc_address + '\nSubject:' + subject_line + \
+        '\nIn-Reply-To:' + in_reply_to + \
+        '\nMIME-Version: 1.0" + \
+        "\nContent-type: Multipart/Mixed;boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n' + \
+        reply_contents + '\n\n--NextPart'
+    response = ses_client.send_raw_email(
+        Source="patchtest@automation.yoctoproject.org",
+        RawMessage={
+            "Data": raw_data,
         },
-        ReplyToAddresses=reply_address,
-        Message={
-            'Subject': {
-                'Data': subject_line,
-                'Charset': 'utf-8'
-            },
-            'Body': {
-                'Text': {
-                    'Data': reply_contents,
-                    'Charset': 'utf-8'
-                }
-            }
-        }
     )
+
 else:
     print(f"No failures identified for {args.patch}.")
-- 
2.34.1


