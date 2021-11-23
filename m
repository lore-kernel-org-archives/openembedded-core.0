Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F18C4332F
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 21:58:10 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web12.814.1637704689418143370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MwYBUjNo;
 spf=pass (domain: gmail.com, ip: 209.85.219.53,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id j9so291119qvm.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 13:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C6d8B2omlg6Sj/OABpX2midY7BIH2EsaxKUKfsueuEs=;
        b=MwYBUjNoOfadWq1VSXPyI4oJd5j2unUJAdCfPzPQyVs6XjiuXVy2t3oNibGW2HMQUt
         5nASVdBzTXXyEf7f5pVRJyn5YxH5+T/MIOM8MRFlclUWBte7pT804cYhEvgAB0VxM1Zr
         3UKhoCjmVQwTQuaXa2kdu4tLrJoReVnVaKOv4oHUAufRNIRYMC/T0Xi4PGrKPzeMdNhD
         PcfeCIoAELGbgTIbreJ6T/yuAxuQyg6BNQ1MBjLsOznWb6yhYteagnDCKuKgEt9FO9xl
         /eWOwWtIhmUVUebbbWahMsyokrcJriM4ZtCWWuTwqCQZjm33nxhQyyXKVXyTz3I9EXOA
         ahrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C6d8B2omlg6Sj/OABpX2midY7BIH2EsaxKUKfsueuEs=;
        b=WwsL772iQtq3U8SA+T2i8AqfTF+PpIMv5YOjuzMUxkcVYxCp5kAatwDcZzAGzXADav
         AsBMw6VFKAGjoQd+hXZVdfW7RYnPD1lwItX8T0SBJWhJ1IJV2kQ4d8uo4Bdna1s/kWZQ
         yQdUa6/1GNtB1PlGw/pa8yhvFaovOFY7t+ZSE7E21n66PIGCpe1yaXtQW1NeLng6FGtG
         hetoUpeTS5uDGDo0n2DSiHru7Fd4w6HixQgr3llnOr0q+U7bu2R3GwqOtjD4kWkJOOwx
         tyhLySbQAV2lXtX8EdwPhVd/SiWpJYha++AzzmEGsE63Isi14b9xcABiZl9l7wW+kpyR
         haIw==
X-Gm-Message-State: AOAM533D5917hozfCPo5SuEKRTH3EGlUOF1ESKSvWZbgROkKtvVcOCr3
	SY1xKl7mcwm2c4YM4bbZtyg=
X-Google-Smtp-Source: 
 ABdhPJxQ0eWBvDJgxnNJN1cFn9ko4oshsR5gHd4m9eor2gFhcKeIHAuYRKCjiN+KghCg5yTmV9Lvvg==
X-Received: by 2002:a05:6214:c8a:: with SMTP id
 r10mr680170qvr.38.1637704688567;
        Tue, 23 Nov 2021 13:58:08 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 m9sm6395640qtn.73.2021.11.23.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 13:58:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 18/20] linux-yocto-dev: introduce dt-validation PACKAGECONFIG
Date: Tue, 23 Nov 2021 16:57:45 -0500
Message-Id: 
 <b3ce9655ef17f09c39e374d234cd494580f92674.1637703810.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 21:58:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158639

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Add a PACKAGECONFIG to control which type of dt-validation
is installed (full, or wrapped).

This is currently in linux-yocto-dev, as 5.16 introduces
the functionality of required dt schema validation.

Other v5.16 providing recipes can use the base functionality
as they desire (with or without PACKAGECONFIG).

Over time, we can migrate the support the the core
kernel classes .. in particular when more providers are at
v5.16+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index ed94ab2517..858772ba41 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -39,8 +39,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
-# yaml and dtschema are required for 5.16+ device tree validation
-DEPENDS += "libyaml-native python3-dtschema-native"
+
+# yaml and dtschema are required for 5.16+ device tree validation, libyaml is checked
+# via pkgconfig, so must always be present, but we can wrap the others to make them
+# conditional
+DEPENDS += "libyaml-native"
+
+PACKAGECONFIG ??= ""
+DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', 'python3-dtschema-native', 'python3-dtschema-wrapper-native', d)}"
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
 
-- 
2.19.1


