Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C48C61CE0
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:33 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14926.1771650629507682540
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BnuJi5R3;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so31886185e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650628; x=1772255428; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1Nkb+inbDZXtmF5/xVFA2cY5GeygR6vJkAvCs+fRrE=;
        b=BnuJi5R3WdD67dkuhHzbo9OkUrLugFuXCIcAzYO8I+ifCyHOkZ7MHSvPO3/zl8lL93
         xVblLMJ9U33QzyWqm52r8nlWvPWurZ/U0ngYpl3db8ZZX8OAu/6LcnMX02NDJXwnlHlx
         w/WlJ6RGFXs53s1F/gXjMCXUn3zxXJNDLTSgWd2H3PoW5EIjdCtlwVM1pQu9ud8R8X3y
         CJWCi/RlLtyHQjm64yw+WlwYUUhFFaL3djLk/W3PUgnqKvPoKUVr+WVMpLrEwVchTjfX
         a1X3HX3vTkIjO8neA5PA4898ka4h0Xqqufe+TmKfFjeG7R4xebqZc4AFKK2yvJFL8NNB
         kpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650628; x=1772255428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1Nkb+inbDZXtmF5/xVFA2cY5GeygR6vJkAvCs+fRrE=;
        b=P4OQgZfiIVZxWOb31lx2NjUn39RXJngpgYQ7qjO9y79B95xszlpji5Vz4BSiJU9rpU
         26OVz4SUzFh1hUr1nQLRaSqa6AacVDTh/smjODOmuLDrf4TzgFMf63+H1KY+Ugcw7l9T
         l4GfOLUvj1X1PSmMNNNqjvkQtowMlxEOmvgG96x2VACtc08nIKTk2UTbhwLfsHI8Q0+y
         63wNuKIwQx0MIDOgtclfVUbBMbRucCdiGra1RTESVYLauKCZE82gP5JZhTROkSlWBf7e
         q1lwpUsG1S2r6YKbmP7aALb0wkW1lVKb+ZJasZZA7WEs0wDW/+4Wk6ZBhmB7ZSC0vdMm
         FPQg==
X-Gm-Message-State: AOJu0YywgN9kcp9vETujzxk4fC0GunpTtyWsOVzAi96wT3tblOQXvI2d
	XKoHIKMSSV+7Fu+L33AEH7uwZCUaOGrxqzxP+NQzNnhr+uiLg1cbCGAtdKu+ug==
X-Gm-Gg: AZuq6aLV8LyilbekUGgGNUtHXgAaFzmLJynm612xluhKZDZxzLbbR9Mpzl6VtMUuAfi
	C+TG/LLUrQbNJ5b3QmCDmBppfz7QrD9HyKx1BMlxo70URjv9o9ZZpY9t4eN7ERsq7aafuwC47dk
	2ATP5FQUqCKSrz9WUiriH+qL26/tE1kB2tQI5IYINUHq5aEuX1yexpHZA8kdZqv1ddEJ1Q/8j4B
	TouNORqZ6F/7b7xxajP38hWlbA6nw9JW0E8Gg/81AGghzfhsy2lmdgouzX7r3rGWaBjlxK+Nb5M
	J/Ys8qhQ7hTB4c+WVrhAcLTplxbE6CwdQ6vYS0/DgPufR/iXCZojMwRysSqwpPEVbotu5peSY/A
	y3nX53t2Wk7qiPAl8+cxYFkvYbWzOk/U+5uMiLn4XLa7aN47FoHl4pNpbMyWHX5VT/vzV46nehq
	asCo/HkdY0LQhmBymb4zozTu5T445zlX/3Cxc=
X-Received: by 2002:a05:600c:821b:b0:483:71f7:2794 with SMTP id 5b1f17b1804b1-483a95c9e73mr33220185e9.15.1771650627549;
        Fri, 20 Feb 2026 21:10:27 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:26 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 10/18] spdx30_tasks: Fix non-deterministic BUILDNAME in image package version
Date: Sat, 21 Feb 2026 06:09:58 +0100
Message-ID: <20260221051006.335141-11-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231590

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

BUILDNAME is a timestamp set by buildstats.bbclass that changes
between builds, causing non-deterministic BitBake task hashes.

This was causing basehash mismatch errors:
  ERROR: When reparsing ...do_create_image_spdx, the basehash value
  changed from X to Y. The metadata is not deterministic.

Root Cause:
  The image_package metadata uses BUILDNAME as packageVersion.
  BUILDNAME varies between builds (e.g., "20260120151200" vs "")
  making it unsuitable for deterministic builds.

Fix:
  Replace BUILDNAME with DISTRO_VERSION which is:
  - Deterministic across builds
  - Semantically appropriate for image versioning
  - Falls back to "1.0" for nodistro builds

This ensures clean builds without basehash errors while maintaining
meaningful version information in the SBOM.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 0d62de61a3..12b8e68fbe 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1505,7 +1505,7 @@ def create_image_spdx(d):
             _id=objset.new_spdxid("image", "root"),
             creationInfo=objset.doc.creationInfo,
             name=f"{image_basename}-{machine}",
-            software_packageVersion=d.getVar("BUILDNAME") or "1.0",
+            software_packageVersion=d.getVar("DISTRO_VERSION") or "1.0",
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.container,
             description=d.getVar("IMAGE_DESCRIPTION") or f"{image_basename} image for {machine}",
         )
-- 
2.53.0


