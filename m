Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97691C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:10 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.92615.1738600868064267861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ies1P4xK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3863703258fso3477172f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600866; x=1739205666; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKtMV8jCCOD2V3exzQIHFc38+YgEg354zDInRse5YT4=;
        b=ies1P4xKHrhuex84obmE1SPOOafkMZD+leBTK5P3ap7GDXl4GdEgVCLrOaS/8V24ZE
         U3pBoTZ+2S7j9wRtvlRTm7RLSfFGoQrb3LIMu1Amf/lomVy5v3DXDumgyPfRB+4Hc5Vz
         GGQ8bC/lIT5cjzabvjgj7CbYfisg7+MW0+U9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600866; x=1739205666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKtMV8jCCOD2V3exzQIHFc38+YgEg354zDInRse5YT4=;
        b=eF4qdRxLxJl5aMg6FKowZ9gD48tJQhGL3pbjmvKmsKUOfEUwSWT+o2pFgGTlVHA2l1
         KLuzUQK3YZl5LTrNJVdz4KgfHTppIz2FDTxG/iab+eI3HSRDiLjrjdvQ9gGth2EQWbEu
         aDMe8iqN4FfNxa6tdxOMutcxpvyZze4MPWMq79qm9WrguJeSyGiso1SVPWwkUp8hdR7Q
         vSrEkK5DsAcL+B4NAkU0xvOlja3nLEu9Wz9U8xotYUVgHtwnVxbFCGdMCtt5epeD+ehM
         0wo6kKrYI+nRrj3lbjsTa/bR4j6tpgmzA/Qc/soqegBayQkckx93QFMDLPIljlBMCHBQ
         hyeg==
X-Gm-Message-State: AOJu0YzDve1jjqJYIbqsycXS2/aTTqTxteKsQDJADYsVbZ9lcon1qTKV
	9sAR6RnGKgnHQWtyoo2dsWFCy54bYIK0E704c5vYvDTyIXs6/iYjD8GWDXv1A5/hWKASTp2zSWG
	y
X-Gm-Gg: ASbGncs2wmaWJh8iZQKqPYM5wqcVePjQm91QDcaGGS/hyt9hivziJbqUCL2UBqSJX+j
	H7s2DSLnzAZOwKZKJxwI+tvZb4p+Fi32ttSBYHEetLjqMCI1+MtDReVfXSDobw4IVeuGwtSFErp
	UKTxv4m/FI4Mw43DjM9uDp7TdXS5GfUP5NvZyYrzN+t72UUrya1JPnM6AN478Tyte3JB48M4B5T
	iR17YHceSyE1cWqX704qdzW3gyCMM5Fgqd3VgITCIlYFHRS9y0dXxPCdzetb545+WM725/SWwdy
	Z79HiJRY4DfCcsraNt1uykr4GfPrbNOhdCD2HaMLDTPE
X-Google-Smtp-Source: AGHT+IH+oSTNcBZEGcSjact0AzUgmWQqZSsS0fn32OOhgZ+0IeXjXE2FvL4TlRuI/XdHn1jmLTKk4w==
X-Received: by 2002:a05:6000:1a85:b0:38b:ee01:a5b with SMTP id ffacd0b85a97d-38c5a98de08mr15869429f8f.15.1738600866115;
        Mon, 03 Feb 2025 08:41:06 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1d0bbfsm13479806f8f.98.2025.02.03.08.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:05 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 01/47] systemd-serialgetty: add comments explaining use
Date: Mon,  3 Feb 2025 16:40:18 +0000
Message-ID: <20250203164104.3403226-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210667

From: Ross Burton <ross.burton@arm.com>

Add some comments to clarify exactly what this recipe is for.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 9035b8c335a..7b525b10f0c 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -1,8 +1,13 @@
-SUMMARY = "Serial terminal support for systemd"
+SUMMARY = "Serial terminal support for systemd (using SERIAL_CONSOLES)"
 HOMEPAGE = "https://www.freedesktop.org/wiki/Software/systemd/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
+# Note that this recipe explicitly creates a serial-getty@ service for every tty
+# in SERIAL_CONSOLES. This is typically not always needed with systemd as it
+# will probe at boot and generate getty instances for any active consoles as
+# required.  This recipe (enabled via disabling serial-getty-generator in systemd)
+# should only be used if the generator is not appropriate.
 
 SERIAL_CONSOLES ?= "115200;ttyS0"
 SERIAL_TERM ?= "linux"

