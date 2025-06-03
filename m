Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A935C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 11:36:38 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.8970.1748950589086632743
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 04:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dD/g8Vh8;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2202544f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 04:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748950587; x=1749555387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcnvmtLmZd9g3NpYml9dxv+NmVaZGtpKzcf9znh1jfw=;
        b=dD/g8Vh85bxQI2odYCvY9nZ1BdFRbST4eTzC3WrPRPl+dI8dTYUhq2S0zqt2CIgOva
         nnK1OtkYoGd1aiR8vLCiRdQspxBnd/JRHkj37Ie+vmJALUDkpHYZRtyabUFE/3BQaPJw
         YT/+pv1jrj2SM/rDif2CdWnKTHIQsWXIc+NenMFhyjxueUUrKHQTNOXSsjwhaZi1Qj+v
         HC1mw0QXR9hsJLFW+DUJUur2j4qBpzt+xmllDByY/NViRpiEF9hIhmtDSRyCVfgtDlvv
         3wG4rpwKK0LXQCcH0OiHxGRdpKf7ddsLjGITWJEakt/JLtVNSucSoJF+MEuo+0YEeDzZ
         isjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748950587; x=1749555387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcnvmtLmZd9g3NpYml9dxv+NmVaZGtpKzcf9znh1jfw=;
        b=aWG8qwK9fU01uNPDnIesCg4yjB/HQ+3XzxgFEJc9ziM5aj0OVU+IzhsMj1OwsIjO0j
         /K56L4GA3pK3xfluzBDB3X2POUNlqbuIUp5uTo0pzY/MMYFl6Z3pOAhxNnosS+HQuIb2
         oOyyj1naDjcxIW+mqORWCHas0Rcgac7jb3DwybMfIfn+JbhPPlvnzw8PNVpqkEt8miVu
         R4i3NJv1siJ1pOjR1dF3US03DB8Ayl+GxAi1EwWon1AsHlZrODqNbWvcQM795H2QkMGf
         xClxHTBSAUambkFQVXfmijRHNykEJibT9KxoEJV50Mmu86L9MY+kx9NZmKMqRRr6tK24
         QZLQ==
X-Gm-Message-State: AOJu0YxDF+cbgzoQAp199whZVdRiAudKf+hqFxHasTFSortXo+HUEY5B
	ook8x9MNRoTQ7mdoUwqcK3A0dWTGakC6mGMNSvkOWXMiHAIEiV7Ts4DL04jZrw==
X-Gm-Gg: ASbGncvWWEYAd7040cZgKICDhq9Og8vtQ4ndBHk4fCDvFHIjd/mD6iSZwrDnfjyKdF6
	eWWr/B9iz/2x/aoURqL2ZeTOrLc5T8u/McJJc3CZQjNJDJP4QOD4rWC5q4XPOZ3TiEQTB1/SJh8
	Nd9up9fK1oWCJUjGPmD8X7IPOjwAEIOA73M9x2n6BI+O7RkcicDrM7WtcVzqYK73fKLCXhS/PLW
	Y2sn61z8IZwTQn9MPWEqRyNzFDNAZNFX1QzcF7DqIiA2/SqB1CkPmixLYuECWHwTNvd18vzRS41
	Bz10JDHljDHUnr6mZjs4Ed7+wkYarzkehKd/MDcZWCJnWrJ9ydIlDIZRdxtHnlFpPsMycHRlw6Q
	OB+ueq6z4jIp9
X-Google-Smtp-Source: AGHT+IFoqU4FT+wRO68MQxKiguXsc5iD/UErB+1yK7ZVg8UJm9SItvRXUfioO+oMT5UW9Jdy/FLvdg==
X-Received: by 2002:a05:6000:250e:b0:3a4:d367:c586 with SMTP id ffacd0b85a97d-3a5144d5b3dmr1686866f8f.13.1748950587344;
        Tue, 03 Jun 2025 04:36:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f22sm17728247f8f.43.2025.06.03.04.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:36:27 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] conf/fragments: add fragments for qemux86-64 and qemuarm64
Date: Tue,  3 Jun 2025 13:36:18 +0200
Message-Id: <20250603113620.3104900-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250603113620.3104900-1-alex.kanavin@gmail.com>
References: <20250603113620.3104900-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 11:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217806

From: Alexander Kanavin <alex@linutronix.de>

These will be used by official bitbake-setup configurations,
and so let's start with them :) Plenty more fragments can
be added over time.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/fragments/machines/qemuarm64.conf  | 5 +++++
 meta/conf/fragments/machines/qemux86-64.conf | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta/conf/fragments/machines/qemuarm64.conf
 create mode 100644 meta/conf/fragments/machines/qemux86-64.conf

diff --git a/meta/conf/fragments/machines/qemuarm64.conf b/meta/conf/fragments/machines/qemuarm64.conf
new file mode 100644
index 00000000000..0fc164541d5
--- /dev/null
+++ b/meta/conf/fragments/machines/qemuarm64.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use qemuarm64 as a target MACHINE, suitable for running in QEMU system emulator."
+BB_CONF_FRAGMENT_DESCRIPTION = "Select qemuarm64 as the target machine. This is the best option for running the target system inside QEMU emulator on arm64 build hosts, \
+as it allows near-native performance with kvm acceleration. Also useful for testing arm64 specific assembly code or compiler output."
+
+MACHINE ?= "qemuarm64"
diff --git a/meta/conf/fragments/machines/qemux86-64.conf b/meta/conf/fragments/machines/qemux86-64.conf
new file mode 100644
index 00000000000..0fce37c4e2e
--- /dev/null
+++ b/meta/conf/fragments/machines/qemux86-64.conf
@@ -0,0 +1,5 @@
+BB_CONF_FRAGMENT_SUMMARY = "Use qemux86-64 as a target MACHINE, suitable for running in QEMU system emulator."
+BB_CONF_FRAGMENT_DESCRIPTION = "Select qemux86-64 as the target machine. This is the best option for running the target system inside QEMU emulator on x86-64 build hosts, \
+as it allows near-native performance with kvm acceleration. Also useful for testing x86-64 specific assembly code or compiler output."
+
+MACHINE ?= "qemux86-64"
-- 
2.39.5


