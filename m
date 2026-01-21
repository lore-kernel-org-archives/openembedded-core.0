Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89A5C44536
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 15:27:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14258.1769009217687307310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 07:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpOlIHW8;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-432d2670932so5124284f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 07:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769009216; x=1769614016; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BYDkzeEn2eW2okHcdrXDtzgEilxGaJ/AJXVAtEiKGzI=;
        b=VpOlIHW8lgEBmTegzJYSRzNlwSF8O67tEBsBAzB6Pk4vOm3eDWhQHiVtejSzWHPlgv
         xiClFYUD8G3jhY6WcH+RkpZjYH6G/y5kIqvaPUYb1AMepiBszM3YMsMgwHZWDBluMkDA
         PosxfgpQHUifetaMaGPGgiQPexKCutMQVX2Am1D4PnfOAW932S9S1dGarcU5Jmv7KDNc
         AeSav0qxOme7bu8Hlq1d0zWKBq9MD/x7bx6vOvAD4hf+7KHkpElJtwtGFLnF1t4chzhw
         v0qxM9Fns6weKYUT5QJF+PFwGZ1ZifCZdMKtiGuML7Cm6r3OSZZJ0Qk9j2+naClEB2Ha
         T5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769009216; x=1769614016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYDkzeEn2eW2okHcdrXDtzgEilxGaJ/AJXVAtEiKGzI=;
        b=VY8KqVcNqZnLa9L0QQn69coT8jV1IhI/s03mqYbkreTNoX2vpDIMD9gry87/dKSeXl
         Nn/Mio3aoopaYObuq7rk372VN4UhJn2K1iYaLR7JT8e+2yt3SXwXZoFcKR6tcmEVDzTQ
         zORxm5l1C/hpbeIo3qSolymVEDrtRiD6SFAgr3VZuVErfEsublipqznnmNU5uaPavjOS
         Gh0Y79gBIk5VBNAesXF+P4mwwMVd//tIvsah/uSsXES0WQiwo3aCvcBWVlYMzQ/zUeEN
         xFofktsLFK7fmzURmPw7Z6N6rJno3917PZSTeguqOenyaFA0siRi4ylf9uX/x9IFV1dI
         e4WQ==
X-Gm-Message-State: AOJu0YwEs1faqpzMRPFf7gWYnreCRT9mEa9ce2co4lbAuK9Cpq6WV2eu
	2zwf4TH5eTDH0NHL9Y3oM4cbos0iiSvM6x3zvoO3b/Dm21IQHWA/zmt2LkZ01hPk
X-Gm-Gg: AZuq6aLoZ4INKqO4u7U/e1nD9w9APjkCRwSv3Hdogk8WcBus7JsA9vCnLNhWTkIrJy7
	NqdyKSSVS4spKCCFBUQCj2Di4wQmzHpRoTkkN+BZTAq46XOTA+GM/VCtR48y8ExDfrHQtnGSB5a
	X5sLeyxsQUNDrLUl/okNqJ8T01bRUWuLzxt/lkEzmqOrtLj3puDtOGVjvHeY1uxG7w3i6IUoaGw
	z80xud/GUTqMLWOlSOKOBiAyD4frFQ49vvQ0vnYkBnCLnwa1QsUEbqjvxzlesRZDPrvrCx7MNGr
	qLBQM8Vj+mKTJhIZrfMFmgLodkJUh/tVv625pnYzWIkCyZbd+3WqlnvUJ3x8j0oP4birizeLUl8
	MmLa1IdPad3rpghDpFrp6ngXhcK9cv2rgWy2x6YuX+1DB8Hnj9F1wWyTjOL2Xr1Pf8Sm9GfS4lq
	o8pPv0086fYj3V
X-Received: by 2002:a05:6000:400f:b0:431:8f8:7f31 with SMTP id ffacd0b85a97d-43569bd6a3fmr28063116f8f.56.1769009215368;
        Wed, 21 Jan 2026 07:26:55 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm38817935f8f.31.2026.01.21.07.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 07:26:54 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2] time64: Use consistent TIME defines
Date: Wed, 21 Jan 2026 15:26:35 +0000
Message-ID: <20260121152635.2897967-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 15:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229817

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

Pipewire crashes when other dependent libraries are built with the
different TIME and FILE_OFFSET defines.

Related bug report:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/5055

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
---
 meta/conf/distro/include/time64.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
index 24a81c83f1..3ed0a4253d 100644
--- a/meta/conf/distro/include/time64.inc
+++ b/meta/conf/distro/include/time64.inc
@@ -21,10 +21,6 @@ TARGET_CC_ARCH:append:x86 = "${@bb.utils.contains('TUNE_FEATURES', 'm32', '${GLI
 
 GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
 GLIBC_64BIT_TIME_FLAGS:pn-glibc-testsuite = ""
-# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
-# both 32 and 64 bit file APIs.  But it does not handle the time side?
-# Needs further investigation
-GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
 # Undefines _FILE_OFFSET_BITS on purpose in
 # libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cpp
 GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""

