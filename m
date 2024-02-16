Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12085C48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:52:40 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.16960.1708084355468293304
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jP3vMj9g;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a293f2280c7so271844466b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 03:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708084354; x=1708689154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvYRXNxLcVS3kULtzyErY8vzRoUEx8cd4VPvNizIwzo=;
        b=jP3vMj9gq5TN+vfwT49es0gyCsmlWokxjTiH4xPxjrN2XGZ8O6M3TE4FZfOYQX6CQs
         DtreWDaW1KrIiH3sJb3r28e4L8Ou1fu/o5qaaMBWRLnae2FlP/3GEZ3JIIm+vaQ8clZh
         wPDWU0o8OBK/PnhYscQLoa+blF+2m/xmenor6UO2DoG1fdVgg7ohnLzREwH4CLbzXW+f
         PV40zep1nbypbUkkE1+8vgSSywbfw7pNqJY0KV8dXuLfZ8BpV3UEao66IA2oIOIn9wFm
         wTCQFFMb7/pKj8ve54NGDnxIBxYDO+twf7gOkMIyuPJWjq+ZQzjmbkFclf9e6GtLrviC
         NH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084354; x=1708689154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvYRXNxLcVS3kULtzyErY8vzRoUEx8cd4VPvNizIwzo=;
        b=YKxuhGJ2uHBtePSIcxujZEktD5vyjvzVWxFZxMxueU8frOPPPr/uUMiNwwy4kgujtv
         O+9vEgOmKZ31WJ9mWYvyaftXwYrTVn2GchDTVWi2l8KAhg89MzlQNmFDJHZ1TCI8kGgr
         1Cy3GdegxSopDpLiYhxJVCNc11QowmTHaiJcKDQOtFgxe03CTtSweq03sGE7NMfETsxx
         gRHSMha1zWAawo+on5m9cXO/g/PbvBbonhWHpOFar7oFdkvgDgZfPMl9gWFWlpCX02dO
         KYhza6z3qgJ8GkeUaBC+NGwmmBCwfxZ4U7KVyqtK+i9oSDEKZ+3CwYuiTmZIFd7fzhH1
         U0aA==
X-Gm-Message-State: AOJu0YyIjWa5zA/RX2D9DW6lFobOmXxFN+qPlLCSm9yV+0NrLgsYt/fY
	MqLKWKNF2tNeTya5noAqtczf/n3Z/28gqKH6r+B4PvwA7XaP3EvJtVmt5jyY
X-Google-Smtp-Source: AGHT+IHFMC/xtcbaGh282MOkWW2am12Jrgxr8T5K1Sutj8IFe/8tYrvBP/IRBs5ggzXO/V+EdPz3wQ==
X-Received: by 2002:a17:906:2a97:b0:a3d:83e2:bc9 with SMTP id l23-20020a1709062a9700b00a3d83e20bc9mr3336002eje.50.1708084353699;
        Fri, 16 Feb 2024 03:52:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906d11000b00a3dbd16d1b0sm845788ejz.54.2024.02.16.03.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 03:52:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/5] meta/conf/templates/default/conf-summary.txt: add a template summary
Date: Fri, 16 Feb 2024 12:52:18 +0100
Message-Id: <20240216115222.3545462-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195758

Existing conf-notes.txt is not adequate in situations where the user
needs to select a config template from several, or get an overview of them and
is interested only in a brief explanation of what the template is for,
but not extended multi-paragraph instructions for how to use it.

Such summaries can be provided via conf-summary.txt and
this patch adds such a summary for the oe-core default template.

Updates to the tools and a tool for selecting templates which
will make specific use of the summary will follow.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/conf-summary.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta/conf/templates/default/conf-summary.txt

diff --git a/meta/conf/templates/default/conf-summary.txt b/meta/conf/templates/default/conf-summary.txt
new file mode 100644
index 00000000000..e49172fa0ce
--- /dev/null
+++ b/meta/conf/templates/default/conf-summary.txt
@@ -0,0 +1 @@
+This is the default build configuration for the openembedded-core layer.
-- 
2.39.2


