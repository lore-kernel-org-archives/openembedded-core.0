Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5122C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 14:47:48 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.175401.1698245261881332914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 07:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=uHSP6zVi;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7788f513872so394702785a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698245261; x=1698850061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYhqk+gItDLIZZ9zRmNN64/610jzfXo/jEEzdPxKhik=;
        b=uHSP6zVi40gSaHscfSFeRhI2U8HtFKFqKecjrXZYWtdN2nuHM8BYodQ4wTILIJyELr
         52qs34AzAgN1tDfgJqeXBbQnLbJd3tKWeVmMi4ArV+YZCpbFmEVycMnAQEmM+WYqSzIL
         xWyerGZmCs5Hbk1fZn0lsK/p4K7LBxOYec5mhcetVtSMNfa36AYzlXBtuwz0cg2Eu/Wp
         Vn/L6T8ycJus6XWTK8lXJFQZ/z648PK/3QFx76fFqectXfIxjLJrgCzcwj6AQdiH6cPq
         vO9paxy3IT42hv6MMPw2SCNsjRVcz4uWtEH3/8cxgv/4JEqZoIVojlHwX9Wx4rhM++zp
         vUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245261; x=1698850061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IYhqk+gItDLIZZ9zRmNN64/610jzfXo/jEEzdPxKhik=;
        b=fKTdfok2ZoaqPCpzU1YyEAOhsQ6Bbvfpxq+Gp4BsetKGMlSOtTM/uc3SsWFyc3qQLr
         F+nDqPt4/BNgAua2lITTPB7U9erfjFMm5BWJ2vBWJ/Qa+nC6hITDAeLrqmYCcEwLpf/5
         /H5XHmKOH93Lk+ovr+btJox4Q8lc7rJql3dJXWE2AMAOdcjuRkOWkjwOuPThUnstB/uq
         4dSgRawrPoUL7GD1gG+wGLgSACVJKwZZLOclTwc/XaWp14CKDwxEpmHdmWgMp4ezqfzj
         sm+bKEBKbHsf24znuV4rTshjZatpCtpVc5ew+tyRJv7+L+1dpBW5g91c0gYF4SJQGrjt
         4tsA==
X-Gm-Message-State: AOJu0YwIqsbYc64Q9m4ouZO7tZtUunCq18xkZegGeQDbP4UQrXF/MPke
	pQLpbwfFwSBsCVlEdaL9E4TstrRCJstVITlK+AiIHQ==
X-Google-Smtp-Source: AGHT+IEPGtt4B41K2sxmVgk/lnVFjovu3xwUn4IY2uGXnfC0frrCev6OKCXQzY9+wsom/D+yA1Pg0w==
X-Received: by 2002:a05:620a:2986:b0:779:d9ee:d35f with SMTP id r6-20020a05620a298600b00779d9eed35fmr10427922qkp.32.1698245260628;
        Wed, 25 Oct 2023 07:47:40 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id f8-20020a05620a408800b007759e9b0eb8sm4263763qko.99.2023.10.25.07.47.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:47:40 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest-send-results: check max line length, simplify responses
Date: Wed, 25 Oct 2023 10:47:39 -0400
Message-ID: <20231025144739.78900-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Oct 2023 14:47:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189680

Check that the maximum line length of the testresult file is less than
220 characters, to help guard against malicious changes being sent in
email responses. If any line exceeds this length, replace the normal
testresults used in the response with a line stating that tests failed,
but the results could not be processed. Also clean up the respone
substrings slightly to go along with the change.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 scripts/patchtest-send-results | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index bb4604aeaf1..078651ec381 100755
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
2.41.0


