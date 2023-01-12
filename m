Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE31FC54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 15:41:58 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.58571.1673538111691236136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 07:41:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Fw/E3Dm1;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so15408650wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 07:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ss9BUCSzK1t0BYLnXI3iWX+m7uYac+v1NhhqMB5KrYQ=;
        b=Fw/E3Dm1JHqw5hzJ++uFKMw2Tnq1AHwJTN8ohNQfqjhDEjMn957wjnZcUb/pJHaOYz
         lrLb8h+i2yKqghDJQ728UZNXDk0xcYgqwsTp05+bG3omERRvI6BlE6ZoqXDKkQkMlRbe
         /to8CNVShN9eGk/nwYQc0CgkISUHW+xgYhXpjwLjJeyC7Jb9PV0L/bwmqlG1b9UUaSPR
         n5YsPv23qMRRArrOLZtE5LJA7+ReWVkgJGrqNB0lyBeFBhXYFcaNnTQoTM+/F//jET0r
         qe3OD5TzRD/pSINRLSPlbHrYJWK5CapwOtsNxCHTilMiOIbMnaF0vJYufsGmRGuFFkdl
         xRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ss9BUCSzK1t0BYLnXI3iWX+m7uYac+v1NhhqMB5KrYQ=;
        b=kIPdBsSuamVjHmJxzSLDwRCeVKd8BgpoO3dhZKLTIQA+wV9uBB0eRQXjiwiobKTWCX
         rbEgMP1fuS6TrB/RmgWsQ3RnIP19ccbhj0i+iBSQ5K8sBmAMt7h9W069yRMiSoE2GPM3
         M6oE/ZwLsrGfRYrH4htFefi3C9NLU41SDKlv7rYAwrk4MHhDmeA/v760yNUB1xZ3LPX9
         JKdaaIHVjEktf16oG3hynI7vd/REAak/csLUByj6+3C8YezzmeeJeZYU+kGTOVF65N+V
         ZXusKrj+oVjJKpcB30QJivq1l411eQ8THwl5ewY8/V2cCtEbc5nVSpiFL4RvpAITg+v6
         z6kw==
X-Gm-Message-State: AFqh2kqaObAkAHZ+OISp0f9WZrdUiJow7ZgdfqB2ZCUY9W0KCEe6KsAf
	UOEe2GfqcIWeDLTWXEM9D+3iFJg/1vY=
X-Google-Smtp-Source: AMrXdXtPnij8kTC0MjrpM7JGjrWNy5Wb7BQqMsl6s4zv5q0uuIN775mRVlIW6jtZtIB7QhHuXwveMQ==
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id m8-20020a05600c4f4800b003c6f7ff6f87mr56719653wmq.11.1673538109994;
        Thu, 12 Jan 2023 07:41:49 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z14-20020a05600c220e00b003d99fad7511sm21193187wml.22.2023.01.12.07.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 07:41:49 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] selftest/virgl: use pkg-config from the host
Date: Thu, 12 Jan 2023 16:41:35 +0100
Message-Id: <20230112154135.2284006-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 15:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175802

The check needs to report dri location on the host machine,
so pkg-config binary needs to be capable of finding the needed
dri.pc file on the host, and therefore needs to know where
host .pc files are located.

This may not be the case when using pkg-config from buildtools,
so this forces usage of host pkg-config.

runqemu already does the same PATH tweak, so this simply brings
the two in sync.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index ae79724956..7d99c158e5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -268,7 +268,7 @@ class TestImage(OESelftestTestCase):
         except FileNotFoundError:
             self.fail("/dev/dri directory does not exist; no render nodes available on this machine. %s" %(render_hint))
         try:
-            dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
+            dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.fail("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
         qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
-- 
2.30.2


