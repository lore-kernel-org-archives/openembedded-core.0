Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AA0CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 13:59:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48492.1762783147460254913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 05:59:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GjijVVCG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775ae77516so36440155e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 05:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1762783145; x=1763387945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OR3JZNgSf+crEwVpGiJRpWdU7I6Ro9mu7LxDgE1mG0g=;
        b=GjijVVCGpVZWslwpnIgYw/v4chRyMA4Z0gH+XrbCm1t/mP3wrxUCGdy6ANh6iSnb4i
         lia4nLwql449zRuG/75MNEO3AebplIu1Hcv556XAv37fa4ht9MdzIo1VAst80VsIm9zm
         15RcGh0hdyCyNFib922Wqd3FDJ20BgR31rWiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762783145; x=1763387945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR3JZNgSf+crEwVpGiJRpWdU7I6Ro9mu7LxDgE1mG0g=;
        b=iaNyO8tnwC9xGMJ3JyCx0knLu9tiYk2+G3eac0wGIND+TdakOIWXzMINl8uSBd9ygm
         vdFnPPhFVFz19Bva1DyxnS+cTUAWCq5JVyKhcorz8dipy6MLIWnDBQH1SATfq3ox5SmN
         yPQh66tTBgU1H1XFoaKxH0NLQLofF26AFuwxk3OFuQfIqyeQx2bD2gIhk/biUD5xABqB
         TlgJoNAvVEo1cA3s6BufYipcuPLAPT52QOxg6s4r8GE1PAO2tb0mpWjt7RRqQzIU2Mw8
         IAuQ4liNvD1h7NCWSL6jq64aqPzJeEDdqZLyYOTTWqeBLztPnHk+fJpHtunoEvaZWMjj
         /CTw==
X-Gm-Message-State: AOJu0Yzcqn58FgL6M/50sF1iUxUmfstCN0GrReA/gw0EYbcG93A1GCen
	W/61oR4NUz6SllnULnir0t19r3x8kgoj+wlUmPzNgZqsZmVFwcny5mD4fOMtDMeo2fYbkVFCcRZ
	fzWZ7
X-Gm-Gg: ASbGncvvfOJNdHyji3WumHmLhVJO6uzDjvypC8kd1tTw5lGYQWZcgaDb18yJypDgp04
	4hqrnnuf0VZSF6ENTz7Xpap9Qm6fR3wPJpzkTPp0qWYd7VXzgWn9WfqJNZ+cu/S8kRz5YAOQe0L
	P7jEoAMI0LsIo4PWdOKkIeY4NhQUlyOOPB8lzeABPg98+RStDJvL7LJ325Y11QgPpKLbjCyKuCd
	Db2TRXMrwDwpdK2yMWGoxmSNtlYMrW6hXHwxMwlM6g8PAIdnKgli3/b936VlVPUi+WISHQoBEbA
	AtSlkm18g8nopR+gUHuMzhXfj3Ef3WO6k7YRIAPDAfoTpgoO6ifC9gpu6np1qDSetZtWVl5HyxY
	QluQfsmuGHOsD7IERFPglns9TMKVV0ya/GcZ5wo6Knc8q6S8m40L+deXhcd5vOY5yyvyzYnOWhl
	JzxPOF8CLNBSBRQJYK4Gv8t4PKz6wAnYYZAsmpWOQ=
X-Google-Smtp-Source: AGHT+IFrFGyVMx+6kUfOPneegVBgJ+H2K+gyLaPDau7l0jlpsBENdwYo3+FEj0xSivgKptP0+sMAww==
X-Received: by 2002:adf:9d89:0:b0:42b:3090:2680 with SMTP id ffacd0b85a97d-42b30902856mr4947530f8f.10.1762783144971;
        Mon, 10 Nov 2025 05:59:04 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ec3b:58b3:3d18:55e2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b2fb308f5sm14164265f8f.42.2025.11.10.05.59.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 05:59:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/devtool: Update after upstream repo changes
Date: Mon, 10 Nov 2025 13:59:03 +0000
Message-ID: <20251110135903.2426523-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 13:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226121

The upstream changed the branch name, moving to archive/ so we need to
update too. Take the opportunity to match the new location too to avoid
the redirect.

We could use a different branch but upstream would probably eventually
rename that too so this may last longer.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index b92f017b81..8d7e984753 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -469,8 +469,8 @@ class DevtoolAddTests(DevtoolBase):
         version = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
-        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https'"
-        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;branch=mbedtls-2.28;protocol=https"
+        git_url = "'git://git@github.com/Mbed-TLS/mbedtls.git;branch=archive/mbedtls-2.28;protocol=https'"
+        resulting_src_uri = "git://git@github.com/Mbed-TLS/mbedtls.git;branch=archive/mbedtls-2.28;protocol=https"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
 
     def test_devtool_add_git_style2(self):
@@ -478,8 +478,8 @@ class DevtoolAddTests(DevtoolBase):
         srcrev = 'v3.1.0'
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
-        git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
-        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        git_url = "'git://git@github.com/Mbed-TLS/mbedtls.git;protocol=https'"
+        resulting_src_uri = "git://git@github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=master"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri, srcrev)
 
     def test_devtool_add_library(self):

