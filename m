Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63093C83F0F
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 12:04:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11746.1724933068524170642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 05:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NgWk4ji4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42812945633so5194615e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 05:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724933066; x=1725537866; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4q7rP8sLjCFwEfJM7mhLP107CqUT4HTZ7FyAbKjBA1w=;
        b=NgWk4ji4k8QVKcCSbvHk+fRADkbNEByUeltYqg4PpyPGL3QsvoL0gvpKbQqXCoEszV
         wFKj74P5Gbw6h9wSbZA7LnxyTK6vnpZzfVI0dXRMf3KMelYcGPQRTAW4lx5r0tYlp88e
         ylkhLgqX4LU1Ft9Dp+bmbzS3dbE53xkkrTsU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724933066; x=1725537866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4q7rP8sLjCFwEfJM7mhLP107CqUT4HTZ7FyAbKjBA1w=;
        b=rUMovLJBRnJLeFCM4SDi/1+htpK4kcE8sNrKUHZ/GioNW6NhotioC/b/c9Rrv7nREs
         9zHHFZptFY01fU7HoA2pVhvojhEHNjzKWcpzx/xq87pKhJVSMpVlanYG/e9LG29Sifcc
         40L1SKgHacf51OjzaPI+oEbjdUieiw7PMDWkb6xcsw2oPOnFQ5+ZrAeLwi98kq780O57
         L1dAxQsyjTsLEn/ykaYWsSug7cI3r8sH7Ss3/rnkBKquD+wf455loqODT5/dmVFP5oNR
         iMTA0tCf0XYjqN3Ug8KeJ1nA2YtZDTLh1f5tjR3SDl34SyQUMLgyGRHBU9zhtdl6/6U4
         05kw==
X-Gm-Message-State: AOJu0Yy+k/yvfU6hd6SrCF/XBnfh2lwpEfFIgLlryhKvwQocLIV8esg1
	UEzI//xu0wUL63pObtpse6fZ8iVVmkOJMNJFkJwOn7EiwOmJrqQ2a7++6rgSpHc5w1uH8aAwPe3
	Y
X-Google-Smtp-Source: AGHT+IEHvbF8E3R/xMOlmUyomUa97+EYEaQ5+NSROhG9KsgQy2Y+0neU73tYzdHEub1QLd5F2AdG2Q==
X-Received: by 2002:a05:600c:1391:b0:426:5546:71a with SMTP id 5b1f17b1804b1-42bb023cdcbmr20178865e9.2.1724933066543;
        Thu, 29 Aug 2024 05:04:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:19db:d42a:7902:cfcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee76c84sm1257125f8f.45.2024.08.29.05.04.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:04:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] selftest/sstatetests: Extend to cover ERROR_QA/WARN_QA common issues
Date: Thu, 29 Aug 2024 13:04:25 +0100
Message-ID: <20240829120425.4002024-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 12:04:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203918

Now that adding new values to ERROR_QA doesn't invalidate tasks, add this
check to the selftests so that this functionality doens't regress in future.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 0153ef37cb6..49d650bac7a 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -474,6 +474,8 @@ TCLIBCAPPEND = \"\"
 MACHINE = \"qemuarm\"
 OLDEST_KERNEL = \"3.3.0\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
+ERROR_QA:append = " somenewoption"
+WARN_QA:append = " someotheroption"
 """
         self.sstate_common_samesigs(configA, configB, allarch=True)
 

