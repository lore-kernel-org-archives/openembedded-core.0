Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD54EE64AA3
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:43:34 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.19710.1733233414180323877
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 05:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bw8sgZWm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so51242435e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 05:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733233412; x=1733838212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=keexoJzQl3xEd8zSj6v04aNXoUklMTtM/rmwPKhzedw=;
        b=bw8sgZWmYg3IA+ccRwCeuG7Rrp30Ot2KAQHHRrrY7jEo2qVMtC5T62U+YJzDTyOsQQ
         dmsf2gRg4Ge6106wnlo7FAIeD/4zh/KLvxmZDM7VZURABw2F/PZT4+RcYlGIk7lMkFnc
         iHVQtNEYOav+79Yv8w1QkjtpSRgCx0rhdelBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233412; x=1733838212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=keexoJzQl3xEd8zSj6v04aNXoUklMTtM/rmwPKhzedw=;
        b=WAZBHLr7Og5ZLcZl8ZHc+nQBulSSihQNL7nyz3cyVmXRHzEaJs9qQxKJjzCmk6zB7A
         JKTqM9snsi4joEmGJpRYycDGmwh1uSQUFMx6Jv8Mn1OSYjpSJf/JZlkcwEY7HktpTcO0
         FzZkor1KIzhxnwoffOj198ASWmFTnIjcNgg7SKpZuS5B3uUgMf0Xm1zNUEhc5ru2sqxr
         vVk3zsks/uH/oRN1wp0zMNRQySQ9B27n9/ORQNOlGV2TrAAmndxNiHEco+083Q6t3hcN
         4csvBHVUIoUwmwmr9BgoJUkTWvOYwYO0KC9g5jDHHvE2H/fExJj0sQuEcudXidvZQ+CO
         Fetw==
X-Gm-Message-State: AOJu0YzkKobylDcvSIGvj5hRwTgqx1XGR4nTomHATiszCQpMmkJW3d3v
	qinEkHRrA8/8HwHNIx2hifmboqm16iBqHkVg+8bgKxc11exjAunPX6Kb0urYkZLeuLGCka6xzNt
	m
X-Gm-Gg: ASbGncsPcmyrWvuW4wFcEgIhzAodtym+x75Npcrpa6Pr91ydAMp9WHB3zWXqIh7KtH8
	PQR01w6lB7uNE21DmCjKAJby1Hh2/Zo49rh63sbsHSt7Zzj2grsf+Plxv06YdIz4Hlc8efFdOQP
	Vj53GNGeDi0oFr4HZIZbhPFZ6d00Z2MVWf9mTDuSFJ6LsMuU68XMABSoFjFMtG40YCAQkj3vDeH
	ZufTOslsI7xoWpHYgRQKWNXBiGocHLpcUlLgJYYB0T/Q2sfywYJdq+nKNqkEMkd2b2qMAaWPSNr
	kKw=
X-Google-Smtp-Source: AGHT+IEhatldiTEPuRZD4pwuQJ3tCs18piZr04XErRk8PpW1PfBCtTenpAskpXkJyIzmitJHjMYOtQ==
X-Received: by 2002:a05:600c:3aca:b0:42c:b187:bde9 with SMTP id 5b1f17b1804b1-434d0a23a76mr25260745e9.30.1733233412251;
        Tue, 03 Dec 2024 05:43:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f4bb:940d:7186:f454])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4c89sm219381165e9.41.2024.12.03.05.43.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:43:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/gitarchive: Fix syntax warning
Date: Tue,  3 Dec 2024 13:43:30 +0000
Message-ID: <20241203134331.95402-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 13:43:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208206

The backslash characters cause syntax warnings, mark the strings are raw
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/gitarchive.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/gitarchive.py b/meta/lib/oeqa/utils/gitarchive.py
index a826646059a..7e1d5057482 100644
--- a/meta/lib/oeqa/utils/gitarchive.py
+++ b/meta/lib/oeqa/utils/gitarchive.py
@@ -146,7 +146,7 @@ def expand_tag_strings(repo, name_pattern, msg_subj_pattern, msg_body_pattern,
         keyws['tag_number'] = '{tag_number}'
         tag_re = format_str(name_pattern, keyws)
         # Replace parentheses for proper regex matching
-        tag_re = tag_re.replace('(', '\(').replace(')', '\)') + '$'
+        tag_re = tag_re.replace('(', r'\(').replace(')', r'\)') + '$'
         # Inject regex group pattern for 'tag_number'
         tag_re = tag_re.format(tag_number='(?P<tag_number>[0-9]{1,5})')
 

