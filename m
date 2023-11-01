Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7899C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 18:08:32 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.1300.1698862104738916974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 11:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pZtS3dL3;
 spf=pass (domain: baylibre.com, ip: 209.85.222.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-778af1b5b1eso471885a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698862103; x=1699466903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=APd5aCg7inH9hzKIXRwtlNYPd/3LKnDvJil6ngWdXn0=;
        b=pZtS3dL3hm9HUrRzDjAknJwJL7UyRG+QTLxcU9CSFI9VypgQnY0oiKX/xGz+szV8oI
         MwgGJt7arfYm3DeH/dMmxPSBUDjyxQlLJ2T70zyXOyEekyD8WzHuGUAMp17fCrR37+/X
         ebbhuW55WuKrK1KSaJ2Ptvc2p+4ojdaTyDcY0TxxeSfUsJCMLutRHafHODWoO+anmd1S
         H/RQoT3rstf8LhS3BYHwZHIanUdGCsB9q3kEurS4erIim/3H+2SDdPajaYbJ7T79pycX
         SxK9FQXH8CXqy03XKC0GRtP7jt9DuJg/xBUmQb8t4DuTFaeIUdjP6hjkTmRC/fqx68rD
         i8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698862103; x=1699466903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APd5aCg7inH9hzKIXRwtlNYPd/3LKnDvJil6ngWdXn0=;
        b=nDrEPKMgViNyDgJ+LoOrsp7SLqeCPNotm3nPttoSjA0duotz9eay25J9k7DWcbo2R4
         viElZeC1SZOrYvhEDjub4tmlDK4FlkhbNQD25lUjVeM2BoGtTmNX+QFA0pRGewPj+QDa
         IwUqJs9hZQiYL7qrya7XW7KlAkhBgea22FU6qj3Ea+iZ6CCGcU0IyQdObXHFre3EAqSW
         1vuIP+IRlKoq9Wppchm1aK/9oT7R+/VOHKP9H5PD41vvm3tNlDYndRtdt74gRG45VLta
         Pz06x7TSEmkpHMpIWQ4vauwrQavlejqeP/isQ7nh4Kqwc7XTevCK7tTTh5B/mnuoVA3i
         +mxA==
X-Gm-Message-State: AOJu0Yz1c/eVycyXhMI15M3awWBID/HWKexnoXT9jImH4WA/JcjiRnoF
	OafsdR2/AvFvQKavHPxGrNbzxN2xzSHpZq7lJ1Vv5A==
X-Google-Smtp-Source: AGHT+IHofT9DrqEJf0k+Wy3SmYt3dDlS0I9l99hZZtlD8ttF2HMAPSx9lzCoyXoIcBCb0bb25wmUeA==
X-Received: by 2002:a05:620a:f85:b0:76e:f496:1930 with SMTP id b5-20020a05620a0f8500b0076ef4961930mr14819969qkn.43.1698862103114;
        Wed, 01 Nov 2023 11:08:23 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id m23-20020ae9e717000000b007740c0e52edsm1644435qka.89.2023.11.01.11.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 11:08:22 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: add In-Reply-To
Date: Wed,  1 Nov 2023 14:08:21 -0400
Message-ID: <20231101180821.2119199-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 18:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190047

Rework the script for sending results to use send_raw_email and specify
the 'In-Reply-To' field so that patchtest replies to the emails, rather
than sending them standalone to the submitter and mailing list.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
Note that this patch is a reworded version of a previous submission with
subject '[OE-core][PATCH] patchtest-send-results: fix sender', but with
a more accurate commit message and subject line.

 scripts/patchtest-send-results | 39 ++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 01b071159be..1df81f943a1 100755
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
2.41.0


