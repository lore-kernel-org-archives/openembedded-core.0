Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0229DCD37AF
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8248.1778224366952883089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=w/uKf0ry;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so25606455e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224365; x=1778829165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s1tuXbyO3r5Tij3n6tYKp24e+lvoZhLPSXnYLF6zc3s=;
        b=w/uKf0ryKF6UKXeIj6hB1kxdfxNkIib74NKQhfCzPaCg4Z2ELBeAMM4kTZqUIVYMel
         cQNwX0zdBjg8mA5rfEuEp1uMRu+n66ywKQVDBUTuEVru/162WHvJrmw6kEbfHCXBc293
         DXNHF+lXvm5C2emni020giqrrEI3ssEA2DE+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224365; x=1778829165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s1tuXbyO3r5Tij3n6tYKp24e+lvoZhLPSXnYLF6zc3s=;
        b=W1I/1zE3Blyv0xr7CMPOYpSmKudzhJzuBmExETFFTcWNiWERjB+lDoAzdWXj6PGiQ0
         yXoflmcGgk5yUFbmwWy42oQ59NL0e5icyKJcwSE9QEOk9AmbHGiN2DyaxbWyyLf+gXUK
         JLjfXbI1DYJ2SAupfBpon5mndBW6OJ2zQstObvbRaft4cu6tdOxudxyLFjM2NdTvb6P7
         HxZO4hh/4rJKJNRrFNG3ijvqCM2DH12fyOQokph0/JxgXe9LIOszbdDaKzURRm7UYFzI
         V8NMlmiy/nObd+fRp3H/JFGjs3ZY4TtCqy8USJbM5aqY1duyuskG2aGRAKG4FmohWxlA
         7tBg==
X-Gm-Message-State: AOJu0YxyDmcS2U30cop7hujI18VEQLwawcvQkDXsgpWZTaTmBrS8F6U/
	Mp8Hl4N7cBHs9Pf57X64si/M+ROElJHL29Ix0PmH22VK8oUpcqpxL3VKw/khHhsUKgFdnEHEoG1
	p0/m9ABc=
X-Gm-Gg: AeBDieske+AqlmDInkL0LDPuovIY9xN0xJT0QFv2E6yaZsEhZo8w57IJ5grSl/UyKkv
	kFANm0S2jp+HYph6KlpEt547azxCQ/EiTPqeb0B57qBCtxz2PQxFJaPhqeEm4LvwVdMk5kqoo+m
	RPkIrnLHdYxeWVRzaXR628vzdpL8jFXLXGS7GWRcQMpeMK+YyfNC+diQJH0kFtD3xPelNQx9ypH
	2bVFJ6USyaDuu9l2icdh3DPWMK/aU+9ZlZyOi7r83xGO7jRX92lroDzepQkSnxkB6N59tbrd7IY
	M6EZ2wq1Qs1Ok+GsELYGX06n9L57QIPyq1OI0rgstJc4rK2j7m1YkQIes3tZa/Sq9UvtYmaX7Jb
	hJ5iR9VZwv7aFTtcWFLvCUXoT5F5HOmwVQcJikdlje02tA2ygSz7D1vQWQieHE4cabEiApUgg9i
	vtF5YPzzdRlzWEEdmOnMcp5cbUfJR8APJrK2aksIjYJjC2CDx4SihD0JexhQIFgZKMMrN0K4aAj
	P0fmIn0oAC9xHl+j6dZveDG4Pg=
X-Received: by 2002:a05:600c:46d2:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48e51f32c65mr172809535e9.14.1778224364904;
        Fri, 08 May 2026 00:12:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 45/52] sudo: set CVE_PRODUCT
Date: Fri,  8 May 2026 09:11:38 +0200
Message-ID: <51c260422d05c8c6a2fc799afc4e80614cef7aec.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236687

From: Peter Marko <peter.marko@siemens.com>

This change removes currently open CVE-2025-64170 and CVE-2025-64517
from reports which are for "trifectatech:sudo-rs".

It also removes following "patched" ones:
* CVE-2023-42456 (memorysafety:sudo)
* CVE-2025-46717 (trifectatech:sudo)
* CVE-2025-46718 (trifectatech:sudo)
All these are also for "sudo-rs".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0459398d31f74e9653cb55a57d8d0f6bfbdfa2ad)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index d6ee881f8ce..6be2a7c678a 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -10,6 +10,8 @@ PAM_SRC_URI = "file://sudo.pam"
 
 SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
+CVE_PRODUCT = "gratisoft:sudo sudo:sudo sudo_project:sudo todd_miller:sudo"
+
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 

