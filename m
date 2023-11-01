Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EF9C4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 13:37:30 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.7494.1698845845414044507
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 06:37:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=KoSeBAN2;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-41cd1fe4645so39541761cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 06:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698845844; x=1699450644; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymNcvIlcWUQM0P8SnqtEz25YihMqR99LDZliVuJKjIM=;
        b=KoSeBAN2Muqv0wM43kvUzYEQf5muEt1xMnoSXNYdkcVF3L1qVWIblRTZNjkloL1URk
         20Yg18FMwb1oOCkcUk0tvTtikx4RMqLqnL6Ddx3rfvcVR+wJZR2JINnrKH1OXOvSyOqD
         t2fDqNcjUiOBiUQQZ0+ksB5138zpu5qTdKkwD7DkQIKj8DVGB8gcTjFm38ecWucGALnT
         HaW/FPosbp5FNyZ0AZcXYFnCynSuqdw10Jrs/MF9Vy3FAzxMXfdXChzkJADQQQfJc9SX
         BeC+mI4YJY5Tc+q3uIIorOVFeSgPSxYtQPnp/a1EIJCjmD3eeY6kj4lYoAQBo9Z06aCU
         kN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698845844; x=1699450644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymNcvIlcWUQM0P8SnqtEz25YihMqR99LDZliVuJKjIM=;
        b=FvnBvXxFGGNKIjpslUQFGfwZ0lImTifqGM8vv14rQsHvlsTaDOtOxXh2YRbJ6HlEwl
         OrIHMB4f47PgbKQ7loPyu06fe+XKLes9w0e7NcD1HM10Sfdumow0FqtyKKNqFxoILqov
         ulocBChnQiMmUHkxV2TE0XRvU1jA1Mucdb7IqAhxLLmoYNtUAa31qaRxYY0psDIbmB39
         A4WsLNfjqJQo5UIWAjeq2Mv5CRANzSQbb9HLel1Xpz/M1KnfO4nSYiLQNjX+OBCErfjS
         aJoreb5CTbbLmt3hA7W4UwrW4HZXpK7fXKprDerZ2q8cNIayg9nlcE3TfLxmbxJ3Ogsg
         4HXw==
X-Gm-Message-State: AOJu0YwC+HRaDJglqUhjRjW+qIfylOqp+5ZYaWcKDVGdexi3FxkngBL6
	6pCLK1H7t55pzRnyne+wsS1AWtJyJiuZNUQdoIoYPw==
X-Google-Smtp-Source: AGHT+IEH9+IvNWOpWcQ7StX70i2CGGSJezpk668iibwexxjbavOlLVa4j4Qyx1pwCB2xlm0SYReoNg==
X-Received: by 2002:ac8:5f06:0:b0:418:b8c:1a0a with SMTP id x6-20020ac85f06000000b004180b8c1a0amr16927088qta.25.1698845844063;
        Wed, 01 Nov 2023 06:37:24 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id cc14-20020a05622a410e00b00417b9f5b883sm1410120qtb.2.2023.11.01.06.37.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 06:37:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: fix sender
Date: Wed,  1 Nov 2023 09:37:22 -0400
Message-ID: <20231101133722.2106317-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 13:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189911

the reply_address being used was actually the original patch sender's
email address, so when patchtest sent results they would appear to be
from the submitter rather than patchtest@automation.yoctoproject.org.
Use send_raw_email and construct the raw data more explicitly to avoid
this.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
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


