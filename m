Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4B5FC021AA
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 11:58:00 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.17872.1739879880340140327
 for <Openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 03:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a9U7ubYn;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f488f3161so881497f8f.3
        for <Openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 03:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879878; x=1740484678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfYkb7vZrbzeLJunIf8g7QbAR+xZFlF08VFcLj0bi5U=;
        b=a9U7ubYnnWUYDrdn78qDyW/0O3xkrARcqqZBUTVRf5FT/6kJDIvM7Cp56SGRf5jzmg
         3TZILh+64Ympotp31pxC5ipJ9PRDy0HlFNQr55ICCmH3fwhbCFba9fTYTxogGAVCEKU/
         E83ZCuzEmBaczwTi1USMDa4a6Ovepadok8al9u14EbPv7WqP9+q8WdR1SLIfCu9lQt8R
         DdhQEIiS2OqQvmoKDnOy6wR31jk6lNTMeQtVOCPtjYyFCKGEuZBOtSooJnZYTyzi9ofz
         Gud6ndx+RhJxcUbsRo09i1qAgr/TJu4PweErN8LSOho5w+rAF8nJSG5s8/sYKexyrYgE
         vpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879878; x=1740484678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfYkb7vZrbzeLJunIf8g7QbAR+xZFlF08VFcLj0bi5U=;
        b=Ug0gaXijgHptOtibcChpGoTxOxJz6BHwyvHQrLtFKzLNi7cjZBc25dP0pzMsC3oVqd
         mnyeDushioyTd4WFd34LTyYo90tj07658X2ILUUBvYJ9HH7LTaMb0qH6rPEdgIkOa+R7
         JBfJ48HRCc2aP8UaHj2Iotbv1UB+MdGY/rJfuXzQqAPcbm345GiFvSHyUXRIF04jqyWN
         E2ZAF4/A7P4IgMbY7dOB9fSe8cGwRuzQ3hjAarKcmL549f6vGEJjbnueXC7bOYdqWhbi
         KqJ6IRZch4PaPxQo5ZVjQoCPph2bAocfMdkLzr99YOjfDLUseJdtZ4b4RkDitMH19Muw
         0gZQ==
X-Gm-Message-State: AOJu0Yyxp/BX521EZc4EOD5jZqpouOYBFKfCMtCzw2rWamycVzJHVP7x
	kmbv5hbZgMJr9ubZewJvPf5ChF1LLBoq9GuQHEtacwkVC4WhDgr508kkXdrS
X-Gm-Gg: ASbGncsOuhhgI9jjG5il9xhEVBm5Umbcbuc36L/qXNzLZzvQ4yiDzKAtyhPWwg4azl/
	HvRFzbsfCoPf77ug7fcbsmDaOPETAC+p/SBHOXaBmj2ygXSLcG24o8rzNlqwgudKgwTWRyPxQME
	hG8ezxwNU31go0oFKuIvfRngIkO1sqmP8mp8nrli1s2DGcxc2atOC5QW+sUD0uVyLWOApjapbh9
	uerI70GWZb+98cptxQkkzfC7Jh4UVEQlNdI2K4s4DlJJt9NJl9LO5IRKROGv7d+1GZ7MRP5qzDl
	/TW84f/cMsi6EpLAHzdXPrL4i29FDZhrsZTibLyyaOcFFsfYhw==
X-Google-Smtp-Source: AGHT+IHrAnQiV5fVdonB1GF8xdgGia9NgnR/OT654I9iYKguYFxltLwIfl5gn8ZgYa8NmAoJnFxsGA==
X-Received: by 2002:adf:ee86:0:b0:38d:b113:eb8 with SMTP id ffacd0b85a97d-38f33f28774mr9050524f8f.20.1739879878249;
        Tue, 18 Feb 2025 03:57:58 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8115sm15029453f8f.92.2025.02.18.03.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:57:57 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v5 2/2] oeqa/selftest: Drop dependency on systemd-native
Date: Tue, 18 Feb 2025 12:56:47 +0100
Message-ID: <20250218115647.40502-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250218115647.40502-1-uvv.mail@gmail.com>
References: <20250218115647.40502-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 11:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211608

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The tests don't need it. On top of that, this extra requirement
creates a dependency loop between systemd-systemctl-native and util-linux.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/uki.py | 1 -
 meta/lib/oeqa/selftest/cases/wic.py | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/uki.py b/meta/lib/oeqa/selftest/cases/uki.py
index cd20a99aca..9a1aa4e269 100644
--- a/meta/lib/oeqa/selftest/cases/uki.py
+++ b/meta/lib/oeqa/selftest/cases/uki.py
@@ -94,7 +94,6 @@ WKS_FILE = "efi-uki-bootdisk.wks.in"
 
 # efi, uki and systemd features must be enabled
 MACHINE_FEATURES:append = " efi"
-DISTRO_FEATURES_NATIVE:append = " systemd"
 IMAGE_CLASSES:append:pn-core-image-base = " uki"
 
 # uki embeds also an initrd, no systemd or udev
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 207e487002..4f5d43b5ee 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1363,7 +1363,6 @@ WKS_FILE = "test_efi_plugin.wks"
 
 # efi, uki and systemd features must be enabled
 MACHINE_FEATURES:append = " efi"
-DISTRO_FEATURES_NATIVE:append = " systemd"
 IMAGE_CLASSES:append:pn-core-image-base = " uki"
 
 # uki embeds also an initrd, no systemd or udev

