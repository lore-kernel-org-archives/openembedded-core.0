Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF90C52D7C
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:13 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.15073.1722970565083637307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nIJlDQLM;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a1d3e93cceso13881185a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970564; x=1723575364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzzrN2LfRLc/aUVQaRZr7x2vDzcBrP6iG7vg6bbGhgQ=;
        b=nIJlDQLM9UDwO2p7/wb2jSNjaHHJYZo43vyIDdIRb1wC6WAvdGUTKHaYWFHO4zNfhq
         udQzG2Te+yho3SICThcNzlJsUSdg15We/3IZlA/1mjutprwQr+GhGDotUvH9usc6ZCvt
         C8rexg9uMOKdfJxvWU+Zn7SkZACxshum8XpyV7m+2s6GGOogy/vBTajcUl+UiinUPlI0
         5acvmoEuroM3IO4sG1QX3319/HEEffBDiKSlXo+zIb4+QXFxNpjx9FrEusnFzFHOn4ws
         OEJEWvZ1kZEck/kAsWXrlJdgkqzZGwoap3hnn2onhU98Of6McVOU4/Ceg+qh6VTkyaYk
         5eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970564; x=1723575364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzzrN2LfRLc/aUVQaRZr7x2vDzcBrP6iG7vg6bbGhgQ=;
        b=IeO8AXH6UBbXWTlHhg+XKdhKGHJakdrYTGYzpFNt1r4Q1we5FGv022/oTCdpKmq5Jy
         mSXIe+/TDSSGxoARbss/JlFAmjkAa0LxhgK/IRvfaijT6/U22qBc1rMXFipImP5OgiXF
         gHlWq6kK9Ex9QoDx2w2ELfKX9B4RdkGw4RYHoMCBspjpSnEAz/0WHYFn3OtVMht5SvcW
         5JKEpf6LN+IlOdnQhzCgPTpv0HRagHMQawSi2ILTzzMAxpvXZXqKmtq7BQfyU8g/pjsW
         qaRfSaTZ/gNMgBNoF+M0lgnE4xxh1LwYmEbR1jJh5JJ/bNYtUEN4echEF0foImBE38Jy
         zKPQ==
X-Gm-Message-State: AOJu0YxQBgxF89npn0On9ARvR6Tg3wCEg7yySQp67+OsCZlHKgYAB+su
	gCCk+0I5ha9WCm46bT/Flj88xQxG5JPOM8u/uCXGKncdSH+QOX/g9vcAaWp+
X-Google-Smtp-Source: AGHT+IGtLEECFUNfeRRvxEEN/eyYIxhGFjbYxag9juT5stAFrY5TmJy3BGg7bYPKlOf7cOSGvb6Okw==
X-Received: by 2002:a05:620a:271c:b0:7a1:da64:5683 with SMTP id af79cd13be357-7a34c06b210mr2706992285a.20.1722970563977;
        Tue, 06 Aug 2024 11:56:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:56:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] oeqa/runtime/parselogs: update pci BAR ignore for kernel 6.10
Date: Tue,  6 Aug 2024 14:55:51 -0400
Message-Id: <79e2a62693b5117e48e5ba84ca73b5ae31e62328.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203044

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The format of the pci BAR warnings we get on qemu boots has
changed in 6.10+ via the following kernel commit:

    commit dc4e6f21c3f844ebc1c52b6920b8ec5dfc73f4e8
    Author: Puranjay Mohan <puranjay@kernel.org>
    Date:   Sat Nov 6 16:56:06 2021 +0530

        PCI: Use resource names in PCI log messages

        Use the pci_resource_name() to get the name of the resource and use it
        while printing log messages.

        [bhelgaas: rename to match struct resource * names, also use names in other BAR messages]
        Link: https://lore.kernel.org/r/20211106112606.192563-3-puranjay12@gmail.com
        Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
        Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

Since it doesn't appear that we can do regex's in parselogs
and the bar number is now in the middle of the message, we
go with a slightly wider format of the message to ignore.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
index b0c0fc9ddf..143db40d63 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
+++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
@@ -13,6 +13,14 @@ FBIOPUT_VSCREENINFO failed, double buffering disabled
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
 # pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
 invalid BAR (can't size)
+# 6.10+ the invalid BAR warnings are of this format:
+# pci 0000:00:00.0: [Firmware Bug]: BAR 0: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 1: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 2: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 3: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 4: invalid; can't size
+# pci 0000:00:00.0: [Firmware Bug]: BAR 5: invalid; can't size
+invalid; can't size
 
 # These should be reviewed to see if they are still needed
 wrong ELF class
-- 
2.39.2


