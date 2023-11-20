Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DC6C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:43 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.638.1700498380648573948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rrqYVJe6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6bee11456baso3822647b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498380; x=1701103180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2ZUPGvD9FBaBq+HskjD05uaQ5BquoN3VAPcZkVOFZs=;
        b=rrqYVJe6gDt5yQ81EiFCmuH3xZa0ft2UyIVE9ClOZb5E0sYWa61ckY2iOoaiQ6Hx+f
         ulK6I2mUPQ9SaXtB5XMhn1zcauaQKTOFuydxlBw8WvRtUNDi02G5DTl7PbEpSa/WcNnl
         Q1WkSuJFxRTt39AH7+19FuX/PH24m2qiAhAVXIpPE+CuCsawDb5jKdWN9GKy3+5tWktO
         sFXQJB1JDZUDNmvPu7lms+4OwDn5k7dOkuzYQ1VpCmYgCz7RNaokZ9lfqg1lzcjP+qLO
         7PXCSa5DNaK9Do98MRWIytmoPBRY0vsm5Zv52iDfgf0apVjGwyp+RcyK2e24xComxV/R
         EKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498380; x=1701103180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2ZUPGvD9FBaBq+HskjD05uaQ5BquoN3VAPcZkVOFZs=;
        b=AOthtC8O94rAPK6h/Zlm7K2CxPXa6+cIscEIJQd1lBDyJQVQo/KMS64hSpLJ5IaGPo
         vYkVHMGivd6NpSnXSJrg9aFpmJ/sTO2l2i8joZ1TS1wlR7yKeV89CJet1G2v8mJ1Ykia
         kMDMs8HrTCWkpCXuS2f3wGCBncZhauIX+TNcQDTSKRj8Umn2WlyHxRpQTfiC6WQ1HrwH
         KCLJWc6b4BghK11wd4JvElvoqR74ALhvesHs6hrjE+uGjY00KDxt91921SmjmxnZ9RjL
         6e/njWPOjbsRqaMch0d/iDiwTOvfLaBIV13jwywgUM0VIe71+iqMnPguQ8rpNbH8v3eM
         VbAw==
X-Gm-Message-State: AOJu0YxijBWazS/XI2Y1eOR3/692QWftJLMToyCpozF+F0MMaFaprn1P
	ih7V1DjWojeS3GujU+0u34D2KSzXEYgEj7lqFQCIpQ==
X-Google-Smtp-Source: AGHT+IGgz3NoYIn9wA8VXYMiIb2V+qD+YeyitSwrxLzCMKA8r1OiRpxIGMEtspJ3dL2s+2fKxootQw==
X-Received: by 2002:a05:6a20:9183:b0:187:ce9f:e198 with SMTP id v3-20020a056a20918300b00187ce9fe198mr7058362pzd.5.1700498379686;
        Mon, 20 Nov 2023 08:39:39 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 23/33] patchtest-send-results: check max line length, simplify responses
Date: Mon, 20 Nov 2023 06:38:37 -1000
Message-Id: <5be9766d5c70e9b4e9ff57ba73e582f1dd6a18bf.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190912

From: Trevor Gamblin <tgamblin@baylibre.com>

Check that the maximum line length of the testresult file is less than
220 characters, to help guard against malicious changes being sent in
email responses. If any line exceeds this length, replace the normal
testresults used in the response with a line stating that tests failed,
but the results could not be processed. Also clean up the respone
substrings slightly to go along with the change.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0d53cf587dc9afb97f00c1089e45b758e96dd7c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/patchtest-send-results | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index bb4604aeaf..078651ec38 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -25,12 +25,8 @@ more information:\n\n---\n"""
 
 suggestions = """\n---\n\nPlease address the issues identified and
 submit a new revision of the patch, or alternatively, reply to this
-email with an explanation of why the patch format should be accepted.
-Note that patchtest may report failures in the merge-on-head test for
-patches that are part of a series if they rely on changes from
-preceeding entries.
-
-If you believe these results are due to an error in patchtest, please
+email with an explanation of why the patch format should be accepted. If
+you believe these results are due to an error in patchtest, please
 submit a bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest'
 category under 'Yocto Project Subprojects'). Thank you!"""
 
@@ -52,8 +48,6 @@ testresult = None
 with open(result_file, "r") as f:
     testresult = f.read()
 
-reply_contents = greeting + testresult + suggestions
-
 # we know these patch files will only contain a single patch, so only
 # worry about the first element for getting the subject
 mbox = mailbox.mbox(args.patch)
@@ -61,6 +55,13 @@ mbox_subject = mbox[0]['subject']
 subject_line = f"Patchtest results for {mbox_subject}"
 
 if "FAIL" in testresult:
+    reply_contents = None
+    if len(max(open(result_file, 'r'), key=len)) > 220:
+        warning = "Tests failed for the patch, but the results log could not be processed due to excessive result line length."
+        reply_contents = greeting + warning + suggestions
+    else:
+        reply_contents = greeting + testresult + suggestions
+
     ses_client = boto3.client('ses', region_name='us-west-2')
     response = ses_client.send_email(
         Source='patchtest@automation.yoctoproject.org',
-- 
2.34.1


