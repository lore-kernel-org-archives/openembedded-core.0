Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4775DD0EE3F
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:59:10 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4284.1764104345508830461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j8lCK3g5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so6755674b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104345; x=1764709145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXQ1yuzpz9Xr8hV6LAfh4wzgeP5oeRv/hqE889XOeqg=;
        b=j8lCK3g5nAHNnmxK5v1KZLJ2CGsZnArrjaNM1Kix8TrYpVNSXMEqhYeoigFtGXYRzX
         IPHQDj5AE4+yT8l390JbkRBiMzO3ZnRb40qpm+FMj7uA71+qC6eZd5r5b2SyPdY6U4QT
         rWe0JZui6ztex+niYXAyCHPNcJdYeVa5TB9LT5TyNFI/pKAhH1rKVoIlNIIIDrGWQxFC
         8fvEr4bx7AYzaoCGcDjY6aKexjNrgBcRv7CcmZoQJ4+bqx+dg5EUl8II58u05OVk7Jyl
         cCGU2JKje/cFjNPV5rtXCN/qXIWWgtnWrRMh8Vrnjd9q83sk1DFt1cOS/cv444X4XUsK
         cgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104345; x=1764709145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXQ1yuzpz9Xr8hV6LAfh4wzgeP5oeRv/hqE889XOeqg=;
        b=ZIMprSP3PD3qctEcdfFGA06tZjvvvoqplbOV2AVPsULXXboAjWnEYsVZtO96X77BeM
         NCpZbTHhQbKAdvmD1g+ilpTtEQazB+1pVf6tw2fRPu9bhDIUNlLPKZMl7OJZ3cOKsq+r
         dPOsCEJ39ZrOGUQUMAc3CWt4n2l060fZxocZHppuWblIimjFX7XM17t7h9RuGF0KXTM/
         ickIo+ufER8IBIT48RHuAteHtW5/AaA9/0BO1AtvqUT0c1UsDX4eT7nQd5ymrnclITUe
         5O9/GHb+InhvsLOWOK//92v1OFBEtt7HuAJj2CQhihrVqh09OSR8Jq1kWFDMn6cPm+Ga
         U88g==
X-Gm-Message-State: AOJu0Yy7oPEyAXr8zFT1FQaiMmw+Z8W5g2HgYjn3gA5Mo9Be1QzhNcN5
	0I5Uw4S47QJnwODwWa3jXPv3OrzpbZE1Y6trYFEM6c/R07HyHSe6brVBO1nih6yrqMK4cgOpt2v
	ZIEnu
X-Gm-Gg: ASbGncvFSdoQ85FLfPqYbsvhGcGgdPcy73vd9C9ZZzO+2rLhman8sKqU6Nhy68Tf+mA
	yDHjQYgvBkzGsXv/DRwCV7npE4BeW72QLX0irO7nQZ1gS8lZe+zbzGquFxZreKv1pPdcsi7Gln2
	UCiv9pSwhxOdHd1DV3yLd7V/wMzhaJAhoz2wmOdqDC2cLAA8s8fy04HXE/3LshJG2sH6v+RwTkc
	fMAiM+32gtrpw8auhTsQKPfs7wnhtxQML3LBumPneLvkh4BwOK/2yfXYIUszecmZq482op6wQjv
	2Y8RB/ezlIqxINFsmcHrLPHGKXjSeFfMuB7DxQx7pNe4pAOOy+EXOGYUBOjF8CI8Po6PGNx/tDG
	2wQyor4Qr27uFyzpzFm7lhFafeSITq0KlWDMzGf4W45jx6f4Hez3KcBCtp99c9mYJWTM+HCgs+Y
	rKfg==
X-Google-Smtp-Source: AGHT+IH0z+ZTOrvkXWI/rV2WRjvV1ffk4X0Un2TyS13vrQcbZNNSuWJmP2E3VmG1Ee0Tp7YlBdlyuw==
X-Received: by 2002:a05:6a20:9389:b0:35d:8881:e6c6 with SMTP id adf61e73a8af0-3614eb0ff86mr18165268637.19.1764104344762;
        Tue, 25 Nov 2025 12:59:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm17340755a12.4.2025.11.25.12.59.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:59:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/9] spdx: extend CVE_STATUS variables
Date: Tue, 25 Nov 2025 12:58:43 -0800
Message-ID: <23a4e02542252657fa45fd4a605aec0af9178e0b.1764104199.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764104199.git.steve@sakoman.com>
References: <cover.1764104199.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226790

From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>

If spdx is generated without inheriting cve/vex classes (which is poky
default), only explicitly set CVE_STATUS fields are handled.
Calculated ones (e.g. from CVE_STATUS_GROUPS) are ignored.

Fix this by expanding the CVE_STATUS in spdx classes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ead9c6a8770463c21210a57cc5320f44f7754dd3)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/spdx-common.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 36feb56807..713a7fc651 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,6 +37,11 @@ SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+python () {
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
+}
+
 def create_spdx_source_deps(d):
     import oe.spdx_common
 
-- 
2.43.0


