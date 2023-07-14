Return-Path: <mhalstead@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A99C00528
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 17:47:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.1700.1689356843476493472
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 10:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Yo5BAL0t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.214.174, mailfrom: mhalstead@linuxfoundation.org)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b9cdef8619so14158125ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689356842; x=1691948842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eRrHSIjeM/JHAzvXDVJGv28h0pfHdF/Z+Hz8Wqz+00U=;
        b=Yo5BAL0tODu1q+gytSuKincyvmjsZFCddfMihZPbCLjJhTw3DzLgYgU1ydiheihZOc
         Ky6ZDOq1oy3rI/65YX6mLhUbY+e2/fZUh0Kbc+MyUU4lc8aGOVdV4Lf+FEl1iVPi5HAA
         4v1hXehJ7cmQ4fqC74BZ4zb/rS8UpQ8Af55vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689356842; x=1691948842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eRrHSIjeM/JHAzvXDVJGv28h0pfHdF/Z+Hz8Wqz+00U=;
        b=dVKvfAzAE/A8ynVH8j2b4eiQDJZ0o48cljL7xG0TktTWCVKdP7IhaiiWc2aYTamC6S
         BOS/s/9G2Ue2WBiIZ+rU8ZSDwomPTx92jpWRAWIV9luchxGaS2saNoLFp7qf/r6Gj5Lk
         yZ0rnnSqk95m2ToQa5QWgtAB+wAX91gtXpEEKLX1MD98ywz+g/SxD1ehaCEuuVF+WoxF
         3tymvkbwJ2rVMjCsIAIdsHdHrs0wWt3CO+1J+eXb/KXOW4LQ+CW5pY9YubTN2OCK7/hu
         D/qaB+HLPqtBR6yH9pVDG60T3Ly6UEj09KuHhGy8YRMgcZ1tXfF6M4lFgtVyDb+TuhDe
         P9tw==
X-Gm-Message-State: ABy/qLaVrSve14sIwCJhgNwfsWyyAu25fDYIYPRTcJnF1N5g0AJJEe9w
	/c0aUia/oVujmvm6fv/uLBtNbtG0WLBqr3Kbsja6eQ==
X-Google-Smtp-Source: APBJJlEpH6UFSzwF8Cpewf8a30CNNwRmpHk6mXXRXj/R6zmda4z+VZVO6MUCMcocvL2QFWEiNYD0tA==
X-Received: by 2002:a17:902:b906:b0:1b8:936f:c34d with SMTP id bf6-20020a170902b90600b001b8936fc34dmr3674637plb.27.1689356842080;
        Fri, 14 Jul 2023 10:47:22 -0700 (PDT)
Received: from hd-yct-laptop.taild15c8.ts.net ([67.23.203.37])
        by smtp.gmail.com with ESMTPSA id jk5-20020a170903330500b001b8b2fb52d4sm8062678plb.203.2023.07.14.10.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 10:47:21 -0700 (PDT)
From: Michael Halstead <mhalstead@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Michael Halstead <mhalstead@linuxfoundation.org>
Subject: [OE-core][PATCH] resulttool/resultutils: allow index generaiton despite corrupt json
Date: Fri, 14 Jul 2023 10:46:13 -0700
Message-ID: <20230714174612.28140-2-mhalstead@linuxfoundation.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 17:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184278

non-release indexes will continue to generate when test output is
corrupted.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
---
 scripts/lib/resulttool/resultutils.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 7666331ba2..c5521d81bd 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -58,7 +58,11 @@ def append_resultsdata(results, f, configmap=store_map, configvars=extra_configv
             testseries = posixpath.basename(posixpath.dirname(url.path))
         else:
             with open(f, "r") as filedata:
-                data = json.load(filedata)
+                try:
+                    data = json.load(filedata)
+                except json.decoder.JSONDecodeError:
+                    print("Cannot decode {}. Possible corruption. Skipping.".format(f))
+                    data = ""
             testseries = os.path.basename(os.path.dirname(f))
     else:
         data = f
-- 
2.41.0


