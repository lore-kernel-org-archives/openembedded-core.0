Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713E8C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 16:02:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.107802.1673366561450837674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 08:02:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ex5xj2GD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id t5so7878683wrq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 08:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=PSvZac+V2s3EWldidFDv89lK9tDBmtluLZje8PI5cS0=;
        b=ex5xj2GDo8zLkRw52cqSlS7VWUHM6xDHhMp8ovXzgJIP+sEmB7Xh2r9Mw4x8kHpvBq
         HSY2LsI/MHwWq2XSdYQrJlC6+sh7bfcK1copmJqEvud70qavO77YHF170pKyADIeqYFd
         6fItUuqTRicHWPnsWCss36soSOiBPaWVzFkvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PSvZac+V2s3EWldidFDv89lK9tDBmtluLZje8PI5cS0=;
        b=hi1KSN3sAdBvI3lkWipUEH9yqt5DqZxjl2PyM3pQQ3/BW1kWabBv67SO+gDRwudcEf
         2Q37MO5WFGz+qH4fRW9O+4x5/c9gvcjudWoGYghSmMPaP+KTcfNlwK5vmBlI9OVSRICL
         /PcMPW5Q7pe+sPkUrrZUaOD9FO9+0m1eELiWS5ENCJfez/eyXQcFnvMdyGj3ECIYhzts
         9xj1JJP1GksdUNq6c4PbqQGDcr6qEvqvkJT4eQaNfi/GM0BjEk0E/TNPUvKh2Zrucfpo
         UGJ3EUGwu0Pr7QRwkGpGWZuE89mLsI+suB5y5Oo52gdB7ojF5F/uv5v22A4xSCihVnxB
         L59w==
X-Gm-Message-State: AFqh2koETQ64NXzakwZJVXJ9bSuj3Ab8G1MCuRc0+dPUl16FbtypeZmK
	RW7tjirRhpRe+8hv5rEcalDdpZLlsGwZzpmh
X-Google-Smtp-Source: AMrXdXtfJyTtYgcOYrjUWRAy5aOH8PcWnxmzswHXcRoa68GbSPzQh7SORXE+GnyAwcb5MjUDbK0GFA==
X-Received: by 2002:a5d:5347:0:b0:2bb:dc76:34e3 with SMTP id t7-20020a5d5347000000b002bbdc7634e3mr6957654wrv.16.1673366558995;
        Tue, 10 Jan 2023 08:02:38 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef35:464f:aac3:7a])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d58ce000000b002879c013b8asm11498450wrf.42.2023.01.10.08.02.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:02:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] uninative: Ensure uninative is enabled in all cases for BuildStarted event
Date: Tue, 10 Jan 2023 16:02:37 +0000
Message-Id: <20230110160237.1470090-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 16:02:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175717

Recent changes in bitbake mean the datastore is not always reset between
ConfigParsed and BuildStarted. This means in a fresh buiild, with memory
resident bitbake active, uninative may end up disabled.

Update the code so the enable code is always run at BuildStarted if
needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/uninative.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/uninative.bbclass b/meta/classes-global/uninative.bbclass
index 42c5f8fdf2e..366f7ac7935 100644
--- a/meta/classes-global/uninative.bbclass
+++ b/meta/classes-global/uninative.bbclass
@@ -40,6 +40,8 @@ python uninative_event_fetchloader() {
         with open(loaderchksum, "r") as f:
             readchksum = f.read().strip()
         if readchksum == chksum:
+            if "uninative" not in d.getVar("SSTATEPOSTUNPACKFUNCS"):
+                enable_uninative(d)
             return
 
     import subprocess
-- 
2.37.2


