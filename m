Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D129C5AC67
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 00:17:57 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33205.1786061871767585467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 17:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OAfAHkub;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-51c16ac21acso17939511cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 17:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786061871; x=1786666671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S9MA3BkeAUW1gwWM4YeFUgLSlsZwglWsqKY2qrRK8vY=;
        b=OAfAHkub7fnAeC9EVZrpDTCUrdDglSqpCssoY76Wp8O4EFqFphh3HdeSJo6PAKa4nP
         mYCYr1Eav4oz49CtijPCt5Y2MnSc3HI/MehkHRpR6xmb4yNzjNTQ8KmZoH6dJac2Oyrk
         RVMK+zxmvRhCCcygDOg6KDoa17So3dumfpmjFJwARQEzMvWjgJZydSOhWuKotOQnXBQB
         HPpgoHopl+z6Oywe/gRjNa+G2Nhj9X3Tp/mZqbiFLqJhTxK4FF15gf2Ez3FR1D74nADo
         2itxxhVyCFgiF2+L9AFsdUf3xa+SyivmcQllYQX4PTTbK/ujvwm+PIVv/hK8r53yW9G+
         W6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786061871; x=1786666671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=S9MA3BkeAUW1gwWM4YeFUgLSlsZwglWsqKY2qrRK8vY=;
        b=rFd9hQ/SoONXOCYjKg247HhPT0wM/vMtsEvSMWVK/RrhtDhvMSQFavjvLdcDoJraW3
         EOHqda9moqdqOe90XAyGihR3xtXPhyolEjNYOiAyAZlNN8UGzp/qVwnDXLxbv50zN1gz
         FV+YwyoI9yN1nGdFH5Kx7l7dZasHA81amQQSOsHLMAZNt+eZrwhmQSyEQgbp7/O7U7kr
         Ut+Qn0uPHnW2JQFchnG+wCcM3VlBliJyjGXb84OgR+NtgrC146rJmoOBIofOMSU1C3hx
         uZGhhd66w2UJkm6GK/T0J6hE/ubjTpAy3YXo2XUostq0H9itsMAravXKV1WnK5EpmZ4P
         aQwA==
X-Gm-Message-State: AOJu0YwmIQJYf/Ikmp+MjotjEkRmle2mAZ6iH1vNP5rshcOsvxs3qtmI
	vtrxJiAiGKjGtou0F8pQ7D974qttGg2ImIb4WI7Sf2P86ayWfZYbflIgJuRZMYI3
X-Gm-Gg: AR+sD10I/wSqciCZvlRgAxj6CiEsdQlWPmWKhJ7McjSZ/01/Qfa52YOvv9tAYJ8YZRG
	/o/7HXFhOkDd4iGxyTy4Ad1KE+4lrcDTtX1YE04VV7dyB5SiBm76QGZlMzXDT0aV1zkAoCJs5uG
	k8ugpavIhJI5GX0LM0W46DWO5KEhqI6T9VdV+HF57AbGjJukZTXUSTzYCS6RJcNyZllj5MuPjzp
	CALiRvv47R48/sx9fhH3oj/sRoUhvgzDrf+wpFkfpX1pdNcBckbM6YL+8yj6s2m490ebK9YUsR2
	GZ3qk0ARpKOWvk+PEo56sbR34f98RtT3CmIFMRdtEtd6WY2iRQO1W6PZrVIlLEZyIIkvGiYRPz1
	wbyTxReBYM3TkoJ9QZGCNh146zqSZC1LrPTM2cXYGfhkVVOn6PupMOtQb/GR/uiCxGwJd2/s+ES
	C8b4n2bmUUnc8cnzdwCOVTrrQg24ITT/tjL56WK8TA2kG0zR8zgjW+eWYIOJeQf5DKk5EXjtxam
	z1uYjxQV95RQ/mdJuns+A/SJ92oN8k=
X-Received: by 2002:a05:622a:60a:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52ce5f269bamr194321241cf.5.1786061870645;
        Thu, 06 Aug 2026 17:17:50 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d160da94dsm993411cf.0.2026.08.06.17.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 17:17:49 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] bitbake.conf: add an SDK_FEATURES lever
Date: Thu,  6 Aug 2026 20:17:43 -0400
Message-ID: <20260807001744.3874352-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260807001744.3874352-1-twoerner@gmail.com>
References: <20260807001744.3874352-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 00:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242972

Add SDK_FEATURES, a list for optionally adding features to a standalone
SDK in the same spirit as DISTRO_FEATURES and IMAGE_FEATURES. It only
introduces the variable and its documentation, defaulting to empty, so
nothing consumes it yet.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- none
---
 meta/conf/bitbake.conf       | 1 +
 meta/conf/documentation.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1830cab753e6..c402f9f0b7c8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,6 +898,7 @@ OES_BITBAKE_CONF = "1"
 
 MACHINE_FEATURES:append = " ${@oe.utils.filter_default_features('MACHINE_FEATURES', d)}"
 SDK_MACHINE_FEATURES ?= ""
+SDK_FEATURES ?= ""
 
 DISTRO_FEATURES:append = " ${@oe.utils.filter_default_features('DISTRO_FEATURES', d)}"
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1a6ec8fdd5bc..4c5a5ee8c233 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -362,6 +362,7 @@ SANITY_TESTED_DISTROS[doc] = "A list of the host distribution identifiers that t
 SDK_ARCH[doc] = "The target architecture for the SDK."
 SDK_DEPLOY[doc] = "The directory set up and used by the populate_sdk_base to which the SDK is deployed."
 SDK_DIR[doc] = "The parent directory used by the OpenEmbedded build system when creating SDK output."
+SDK_FEATURES[doc] = "The list of features to include in a standalone SDK, resolved at populate_sdk time. Analogous to IMAGE_FEATURES but for the SDK."
 SDK_NAME[doc] = "The base name for SDK output files."
 SDK_OUTPUT[doc] = "The location used by the OpenEmbedded build system when creating SDK output."
 SDKIMAGE_FEATURES[doc] = "Equivalent to IMAGE_FEATURES. However, this variable applies to the SDK generated from an image using the command 'bitbake -c populate_sdk imagename'."
-- 
2.50.0.173.g8b6f19ccfc3a


