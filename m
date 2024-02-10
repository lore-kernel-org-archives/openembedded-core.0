Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90665C4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:51 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.13257.1707571062323171847
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L0AzfPnt;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5116ec49365so1975079e87.3
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571060; x=1708175860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqXZKF+uS1LYoa25oER+ar6zRmq+VL5/ihwLhd8biSY=;
        b=L0AzfPntE94N1jZAgGmsjSz9lN53cpstvhlNR9w4yIZGmIRwPhgu1rmfJKwu3mQvcp
         H1y+30Qz2RbNIBkwlekAumGyxNf1XCyPQWWiTiM0576zjhaXI5G107z8QRBGUjMJfN23
         soUK7a+taqzb3h4pb6M3w1a2VnVGACYvB97zX36IUOTHaWaunJdwYKmg+4/6MZApJZfU
         ztkguuWObn0RERUmI+fy4duT4QrRqZZPEOpGiU4Estlt8t6LkvJwTztJ5OQeC0E2aBES
         9JpRZSQwmafwdqMcWQ5KVpGH0+EaEx83fe+KiUiTWNE/naSONV2AxQo+4lYlPHZ6urrH
         erTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571060; x=1708175860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fqXZKF+uS1LYoa25oER+ar6zRmq+VL5/ihwLhd8biSY=;
        b=nIcTklocbcmU5aB30xHFGl7k8yOHvWpXBKWLwGazrWeGkPLlOy2R7nxZAPC+L6nU9R
         +xErEPWmkSPLx6E5NvrQRaec7DecjEBw0TB87AP2f1XRAY8VGTWhQwwEObcNNS6qhG/p
         6rPb+PejhTLcioy8NEh3EhRMXpj0MBgVOHLc+QqKaMpWj0GHvrdJa1fhJM5ufTOKF7fh
         IvE9c4DRVX3QsMbG7SxYsj/UxWU+QbuF1QUH8aKTtgi+WbXSOXI/jm8NCYsB7A2NGoB5
         KWj/HcvOwujeevX2U59saqqkCSvdEnrsCYdmkas1z12igcbcs5A3Nelnm+HqDCpLaBa6
         ymYA==
X-Gm-Message-State: AOJu0YwwJZCHVfXO+jNhBLb4bc2XGJpt71U2qGkd3Fwt0GJ6AmFNqvo+
	oHRDDiLsmyv1/wynDCOnOZbcmzh98Lcjn4PtHsHNasnymG3RIQwtlkOyTQRV
X-Google-Smtp-Source: AGHT+IEof2HghLd1/10L3y4E3Io6EegSF9WaTvUg29qyUf0oowSYYjsMg6a3snu8rKMttBbFAFnECA==
X-Received: by 2002:a05:6512:214e:b0:511:82ab:9c88 with SMTP id s14-20020a056512214e00b0051182ab9c88mr656731lfr.68.1707571060057;
        Sat, 10 Feb 2024 05:17:40 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:39 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 4/7] feature-microblaze-versions.inc: python 3.12 regex
Date: Sat, 10 Feb 2024 14:15:56 +0100
Message-ID: <20240210131727.342583-5-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195268

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

feature-microblaze-versions.inc#
---
 .../machine/include/microblaze/feature-microblaze-versions.inc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
index 5c37f49abb7..658e87b8cdb 100644
--- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
+++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.inc
@@ -16,7 +16,7 @@ def microblaze_current_version(d, gcc = False):
     # find the current version, and convert it to major/minor integers
     version = None
     for t in (d.getVar("TUNE_FEATURES") or "").split():
-        m = re.search("^v(\d+)\.(\d+)", t)
+        m = re.search(r"^v(\d+)\.(\d+)", t)
         if m:
             version = int(m.group(1)), int(m.group(2))
             break
-- 
2.43.0


