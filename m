Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D02CD8C8A
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6271.1780698859340924576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qpVA+ntU;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490a76757e5so16059825e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698858; x=1781303658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ooRbKafcxzqlxsY+jhqg4Ulxsi3BhhTNMuP+9StfRo=;
        b=qpVA+ntUGveKztlLf1pOqxInY/Ss0x9B4K0aLNlrrO+DYMhOlIq7vp/5Cn5RGgeETV
         0hRqe1E/8A+LDpdP2qYrpSeKPz+tfZyxoFo8TrY0PIeB/H3rPudN0v8XqKGbOLjYJGd9
         R/E9xGMbsK/O0y4V13OivwTEnvR+QEOnAS0wg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698858; x=1781303658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2ooRbKafcxzqlxsY+jhqg4Ulxsi3BhhTNMuP+9StfRo=;
        b=joUmAjLfM+cwmqzA1lvVtSUvzjtPaj2teWzt32m8X3GHtRJVmJz1OBSlhhaWY91ejH
         wNXi8WZX5Nwz9xgYTmTs78Qyw2kdFGwKZTi11IcEERO0ShrLgg5ZZSRDn6KOTFwBEhv4
         upHbxoZMTCxYVd3EU22ZSp3WUSwHnRIqq5q4iRbllTCUN12/nzVmh5/GZbxwC7foCACQ
         ZxQRfB6K9idYTdeQr3XkuwfwPlQljYhkpnipiUzACMhhrQD0V2GV4Z8Sww9oPS23YcZ1
         193UAPxvoOFiUnBodUSJ8gZvFOi+NaVfh72T0n2Db0ClsoX1o8IfKUBGRgCN9SxAST7A
         2MaQ==
X-Gm-Message-State: AOJu0YyjKdbYX8SPCIaEHLcEyBP8FNlYNxIHpE1SBK0F6S8dMIpVQC+/
	IOMl5Or/cGu6xHN/EVL3xohh32certY1tHSFTa6KdKCUB7YDZC3lvf5Gy7ocKXhxTTULrIqawhx
	blzEi
X-Gm-Gg: Acq92OHcXTBcnskE22byxXwVyxqupnnYM1uNT8SouB0baxh5G4JNN7q0+HcxnImnz1S
	C1l+30UM+Yka1U4kdeckp5l5Mawt9oNm1piR47C+o+piGK3PW/VaoQyf/EXQ6RC1McmZ0W6cd7S
	AXZamL5bVs8Btc6ta+PrWSb6yxvuGF7G5nz40hz2xFMm/mRMq4ZZ9iuUMS1FROXrFSZKk1B3v9Q
	K+3VbPXw7e6cSOIUoo2EdqRoXDLmt27uKu0s4ws8IzvHW1XxwtcT2b4KhqV1+xITR8m2BxAnQ+Z
	R4r/x5h7BJixNTpOsdNpJsL/qQCwA4+WF/ZmoAFu/23nEwf97ShTiFbc/y7s0tKaVeqdorCc14N
	UdR/HsXiNxYUdbUrxCZTE/oKlLlEus3T2WLjwGbWtXKcKJzVWVF6i5WFqKcVfz1IvUohaYwsQj9
	w7XNcvqXYNH75UvfgrYArXwxtLD6wDwwjSmVLCmkAZJTqYrBrChGN5mWL1RCTlt4nulExFkYaT/
	Wwa/2TBd/NmY8YXc9TbFxNT+8yFEfEq/TjuHW0=
X-Received: by 2002:a05:600c:4fc6:b0:490:51e9:deba with SMTP id 5b1f17b1804b1-490c2615a5cmr90028815e9.27.1780698857722;
        Fri, 05 Jun 2026 15:34:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/25] lz4: Remove a reference to the rejected CVE-2025-62813
Date: Sat,  6 Jun 2026 00:33:53 +0200
Message-ID: <99706716626324605c049a9130f705f2090a9f91.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238195

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

The CVE-2025-62813 is rejected so do not reference it anymore.
So keep the patch but without referencing the CVE identifier.

The CVE database indicates the following reason:
  This candidate was withdrawn by its CNA. Further investigation
  showed that it was not a security issue.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9c840a69b62a5fdffb3679a44d68dd5630b2916c)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{CVE-2025-62813.patch => fix-null-error-handling.patch}   | 1 -
 meta/recipes-support/lz4/lz4_1.9.4.bb                         | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/lz4/files/{CVE-2025-62813.patch => fix-null-error-handling.patch} (99%)

diff --git a/meta/recipes-support/lz4/files/CVE-2025-62813.patch b/meta/recipes-support/lz4/files/fix-null-error-handling.patch
similarity index 99%
rename from meta/recipes-support/lz4/files/CVE-2025-62813.patch
rename to meta/recipes-support/lz4/files/fix-null-error-handling.patch
index bbd0f74541a..14019360343 100644
--- a/meta/recipes-support/lz4/files/CVE-2025-62813.patch
+++ b/meta/recipes-support/lz4/files/fix-null-error-handling.patch
@@ -8,7 +8,6 @@ Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
 Upstream-Status: Backport [Upstream commit https://github.com/lz4/lz4/commit/f64efec011c058bd70348576438abac222fe6c82]
-CVE: CVE-2025-62813
 
 Signed-off-by: David Nyström <david.nystrom@est.tech>
 ---
diff --git a/meta/recipes-support/lz4/lz4_1.9.4.bb b/meta/recipes-support/lz4/lz4_1.9.4.bb
index 8c96f9bab42..a8ce3cec090 100644
--- a/meta/recipes-support/lz4/lz4_1.9.4.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.4.bb
@@ -14,8 +14,8 @@ SRCREV = "5ff839680134437dbf4678f3d0c7b371d84f4964"
 
 SRC_URI = "git://github.com/lz4/lz4.git;branch=release;protocol=https \
            file://run-ptest \
-           file://CVE-2025-62813.patch \
-           "
+           file://fix-null-error-handling.patch \
+"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
 S = "${WORKDIR}/git"

