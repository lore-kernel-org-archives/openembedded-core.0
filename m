Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.20320.1607632126056243376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 12:28:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M7gfLWvZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: kergoth@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id v29so5284352pgk.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 12:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w56HpSVWC5JoDZ/ouWmVIWZKA4OJXtjm6+0wYxR3Z1g=;
        b=M7gfLWvZLrxiPcrxvxELjkpb7dfJaF/RcIY6meOo9VfP85+QuMPcsoM6MMhqbb5OwQ
         TXSSILaTQtAdf4KKKsLXE/QCwDz1qxy+y1iD39Ufqc76tE8ZYb+Y2XWTV1epOsu0WveG
         ChWcDjGqRzh7nr+qqAQh0HG8vbgZJVPvmYWZEtaQBZZKdXYzc0xNzvn0PY/HSoNkmPdD
         Ycw4XTXSts74Bsfi23UrdM34mh50OkniGS6ibEYRRIfzOw2g2GfVFmobOKYjuX+xPx3X
         abKE6DHZDI6yKYeQ+d1qMV5UJSa+bYfdRK9swd8Pu+WQmNyh8O7XqFFsjpM/6+sHQR7i
         LnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w56HpSVWC5JoDZ/ouWmVIWZKA4OJXtjm6+0wYxR3Z1g=;
        b=gNbWe/PfZ1GpUx4uQxoMjSKqAKDeQhhDE1aldnph383cKYAFV3OV1RUUESVdGoMC0u
         7V3k1CSvS44WmrmK6GZXIrGznYKMPZU6uuRLWxCNC4rpwCeAiIaSrtF/BeWVG6mGtE71
         JwoMa847ANuNKtaCBIZETd+H1zv1tJf8zQjXmU+GExkTi6vfuCxxSgf0Z7dHk7pi9KTY
         CYeHXL6xPPZko9eNAKKMLyzkbLHRwYgo+HIWbMIaxkOHpUh5PbcHfIqR2BmQBP/ipBJR
         9k5XZwY2x0ir6mYQuspf6qAL84T8/sQoS0ohKzATMkCI3F6H16RVVTzXQea07nzCSNMG
         XECA==
X-Gm-Message-State: AOAM531dxTXDgQNiakAV08fG9tKZyJdpTO7M0sMzJR+fP97tqo8GcFXl
	nzaK76+49huNaRVEJrmgFjwYNE2WpdDbxA==
X-Google-Smtp-Source: ABdhPJyG6TVyd83gaQtUft1AubLYyA+0AKj7ZhpvNuZFvcgmdjJ9czZpr/YtsEAgHCP0rFT11eDYow==
X-Received: by 2002:a63:4b1f:: with SMTP id y31mr8364894pga.29.1607632125295;
        Thu, 10 Dec 2020 12:28:45 -0800 (PST)
Return-Path: <kergoth@gmail.com>
Received: from localhost.localdomain (ip72-201-170-237.ph.ph.cox.net. [72.201.170.237])
        by smtp.googlemail.com with ESMTPSA id v24sm7287929pgi.61.2020.12.10.12.28.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 12:28:44 -0800 (PST)
From: "Christopher Larson" <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 2/2] uboot-extlinux-config: exclude OVERRIDES from do_create_extlinux_config vardeps
Date: Thu, 10 Dec 2020 13:28:27 -0700
Message-Id: <ed436321f5c069d817cbd0fca4aee26ce3b2640d.1607630988.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607630988.git.kergoth@gmail.com>
References: <cover.1607630988.git.kergoth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

This function is primarily *appending* configuration entries to the
overrides, it only gets it to ensure it's set at all, so doesn't belong
in the vardeps. Having a dependency on OVERRIDES means you cannot use a
bbclass like distrooverrides without changing the signatures of recipes
using this class.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/uboot-extlinux-config.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/uboot-extlinux-config.bbclass b/meta/classes/uboot-extlinux-config.bbclass
index f4bf94be04..be285daa01 100644
--- a/meta/classes/uboot-extlinux-config.bbclass
+++ b/meta/classes/uboot-extlinux-config.bbclass
@@ -153,5 +153,6 @@ python do_create_extlinux_config() {
 }
 UBOOT_EXTLINUX_VARS = "CONSOLE MENU_DESCRIPTION ROOT KERNEL_IMAGE FDTDIR FDT KERNEL_ARGS INITRD"
 do_create_extlinux_config[vardeps] += "${@' '.join(['UBOOT_EXTLINUX_%s_%s' % (v, l) for v in d.getVar('UBOOT_EXTLINUX_VARS').split() for l in d.getVar('UBOOT_EXTLINUX_LABELS').split()])}"
+do_create_extlinux_config[vardepsexclude] += "OVERRIDES"
 
 addtask create_extlinux_config before do_install do_deploy after do_compile
-- 
2.29.2

