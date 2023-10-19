Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC36CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 21:03:42 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.39403.1697749414732300392
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 14:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dnLW1gO+;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7788ebea620so4386985a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 14:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697749413; x=1698354213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HEzUkzSbygVkf9f3hMXooKBcRwl6j4OIt7GYJDVmIPY=;
        b=dnLW1gO+MWSqHhY+TxFVAZ/IRQNLkacLM/qMUEzc5MPC5hxk6RyHDcrpfCoyQ2zOFx
         t2ltc9SwiaxWJWPDPMAOQAo7Vt5iHYkmIcJVCQ7RTgPJ8HmnMFoWqPyJ95UWXgJuDLW4
         nqUppnzIwGhSN96X30SOXEnZu3pZhqk7SWqJ70W2wPUVqEwWJE50TXUQ7uYJmERY/zeD
         J0o+YXH0KE83B3WWe5gygg0Bmti+7nDwPl6cNF5KJUOcz3RS8u+EJLyUylnlbbDjdA7i
         N3U1HbgyIbwHfyUo6XisQQucHGcTxcECU6LyeP3xR4q2aQiJceP7QDrJJb2VC4OEUdkk
         /3KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697749413; x=1698354213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEzUkzSbygVkf9f3hMXooKBcRwl6j4OIt7GYJDVmIPY=;
        b=SJPYVgM9TnuiS6BmFGG8me4waYzjDd+pc8sT8INcmGEIBZbBG8SJJgVSWTUgAJuuM1
         EnxJUyEK0dXjw57MxtW3PWtFEhQgw9KFE6wjHML/M7UeBEKyU3lvhy9X8MONS0C/vBOl
         g07drNO5uf1LLQ/xSf19XD5mpji+V1M+cf0MQ9fSY3dsf0+RK2gA0xT7jXgrV7i3m3hP
         wrg4pgiQL22hoNWkbUMVS7aYcIB1dywBkU9f93KO28/cKofAZgdNsFesEaaiEVOcBZHj
         drfwpaPJWdITDnI1XOLVJTIPxZusQjR9BIYz6eEC52d1RYdHuWXOLlx0ZzYPw4MPd+Um
         oJ+A==
X-Gm-Message-State: AOJu0YxH06QslQELMFYywfZdlN7wjN6LYvFg1lUs++DkV7p/Qcy1xlI4
	d7s2bEV3t6q7JI12N1nrLD/2HN3oovQGpGKP3cicfQ==
X-Google-Smtp-Source: AGHT+IF9nJDGEeC56VtOI+xmS1Vm6lwqNTbPDeRYi8cpAP76fIaodwzbpLdJgRqwBQ25jkuIQt9iYg==
X-Received: by 2002:a05:620a:2904:b0:774:1e86:d395 with SMTP id m4-20020a05620a290400b007741e86d395mr4156646qkp.8.1697749413640;
        Thu, 19 Oct 2023 14:03:33 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id bm39-20020a05620a19a700b00774309d3e89sm99473qkb.7.2023.10.19.14.03.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:03:33 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2 v2] patchtest: skip merge test if not targeting master
Date: Thu, 19 Oct 2023 17:03:32 -0400
Message-ID: <20231019210332.2294049-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 21:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189486

Avoid testing mergeability of a patch when not targeting master, so that
patches tested via other means (e.g. maintainer branches and AB runs)
don't get unnecessarily reviewed an extra time.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
v2 corrects the logic in the new if statement (modified during a test)
and states which branch was detected as a patch target when printing the
message. It also adds a detailed commit message so that it'll pass the
patchtest check.

 meta/lib/patchtest/tests/test_mbox_merge.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index bc55c588b40..f69d57c71b1 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -18,6 +18,8 @@ def headlog():
 
 class Merge(base.Base):
     def test_series_merge_on_head(self):
+        if PatchTestInput.repo.branch != "master":
+            self.skip("Skipping merge test since patch is not intended for master branch. Target detected is %s" % PatchTestInput.repo.branch)
         if not PatchTestInput.repo.ismerged:
             commithash, author, date, shortlog = headlog()
             self.fail('Series does not apply on top of target branch. Rebase your series and ensure the target is correct',
-- 
2.41.0


