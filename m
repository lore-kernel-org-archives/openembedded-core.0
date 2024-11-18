Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F14D4401E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 16:26:59 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.46148.1731947212729839984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 08:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F+oOl5qE;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-381ee2e10dfso1365142f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731947211; x=1732552011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KAkpJHn8jc+EzSd9PJlt6GgXHC45Xa0itwPvUrDcskA=;
        b=F+oOl5qEa/bfPOB/Kz4soynuI/74xNs0mr/1kLFnm/f+YFLUByZErUPT4yBY25C3hW
         TJ61nDDEiGPK+tq+5zqRVgXDtIxW7SIbM/TvUqVNGbcWqaiQWjYdNtqIcq83nofIRoYm
         Xv8UWKceagC0fdYZoH53bw+FGCSMxetsmMRtDNYoys4fAVG00ZV/amJ6mlJtVp4+2dxX
         HLLhljKRmQXlideugXf+UjQOFeqTht4gX3Joq8ywVohuCZvRac1tW9SxcwWOJGb5kp/x
         HB1epTBQqX6AyKKj8OXFHyqlEJn/oxlNc5vdVRCL7m0eoafyZrelCqufEp5YpwMSV3FV
         RRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947211; x=1732552011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KAkpJHn8jc+EzSd9PJlt6GgXHC45Xa0itwPvUrDcskA=;
        b=tBjLXLOiOh1sjLI2oJZVMfV/RmGMyE0NevkgjipQ1EWkiXMI2b9wr82fd9CK7lvyWH
         qKwWhf5Bk5/+bqDnj8iy/mYfdylwcaCEodTpLwGABWWWfBrhl0pC+MrlupUHXEaPuIQI
         yKqj9r4kNva9esAkqGjJgvX16adIkvrYXV8jH9vZsqQA5QNt3dfBOP0BXaBHfZzkYbNS
         /4bhAgx4Zls6eMBcIDM/OiFtttpgmemF5NtX8Bm2ZXY5xgYoUJGjmDfLN0pcK9ob7wna
         HLGK9v5M/GqJzWGZ+SuSyxDq6xZ+//2eySWJOdlu8iE8YAMvB4dsiFg016x6PUePWB77
         9ToA==
X-Gm-Message-State: AOJu0YwMtp7kYYlp0Q9efQFDOMo2FyMeg1TD5marJ3X8MlZ/swHs3Hnc
	vEfR1T4h0lEpF9dkjCg9jGpQDAG6eeYqm/hCua2Uk+tKYG+vBivm3FNXtA==
X-Google-Smtp-Source: AGHT+IE5FO5UJOmd6P31X1sUyqVI0m+YJsWl3HCKpEC/JrsV6ukrRlVqMYOOPqUwe5ryWrispXKO2g==
X-Received: by 2002:a5d:5d8a:0:b0:37d:51bc:3229 with SMTP id ffacd0b85a97d-38225ad5e80mr10856902f8f.51.1731947211005;
        Mon, 18 Nov 2024 08:26:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3824770f3dasm3563048f8f.54.2024.11.18.08.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:26:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v3 1/3] patchtest: use HEAD commit as base for the selftest and not master
Date: Mon, 18 Nov 2024 17:26:41 +0100
Message-Id: <20241118162643.1423409-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 16:26:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207222

From: Alexander Kanavin <alex@linutronix.de>

Patchtest applies patches on top of poky master branch by default;
this means selftest does the same, and any commits from the branch-under-test
are then discarded.

This can cause issues for example, if bitbake-server process started by selftest
from the master branch tries to parse bitbake.conf from the branch under test:
https://valkyrie.yoctoproject.org/#/builders/71/builds/460

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/patchtest/selftest/selftest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 6fad50ce616..3cf1c361f7f 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -38,7 +38,7 @@ def test(root, patch):
     res = True
     patchpath = os.path.abspath(os.path.join(root, patch))
     
-    cmd     = 'patchtest --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
+    cmd     = 'patchtest --base-commit HEAD --repodir %s --testdir %s/tests --patch %s' % (repodir, topdir, patchpath)
     results = subprocess.check_output(cmd, stderr=subprocess.STDOUT, universal_newlines=True, shell=True)
 
     return results
-- 
2.39.5


