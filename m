Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0124CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 11:57:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7865.1762343849309708248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 03:57:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hDW8or8u;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4711810948aso46983155e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 03:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762343848; x=1762948648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDw241lKsiAcCgzJ8vEhqiVzcZB4d8uFSOJ7q4/hQC8=;
        b=hDW8or8umd1DJh5z2q1beSqO/kAWHBddBtMzWujatBCcOA2EgfYdlS53lrz5E6nSNt
         ZC9t93X9NtBAmaKHgrvo6mWf7jV3r1MObIk1E5sm+/kAE8JRxa1YDnYpKmd6ujV6zh/n
         6oBd7/UkDkvuMRBRX0rhdw9KgnYtmqjhBUiWtLy2ie3jafVIAY7Y96mB5LY16cf931xw
         lFZ/8+UZsMv7oxAe7fK3y6Hx0qXkrkqK3ys5KzuBR2TyUZKj64rQHbb189K+5KuygMjp
         mCkq+6kWuXxf97MDejMvd05ogV7BAhyFmmBxcZpScto7st6R/sbUCnHysHjFSr/u/liM
         OnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762343848; x=1762948648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDw241lKsiAcCgzJ8vEhqiVzcZB4d8uFSOJ7q4/hQC8=;
        b=pm56eBwvx2OoEU+IZDZbE4b/4pcma4XebeWGrYMGcdHNp1kXSkTWvTVZGve/PYIEEd
         UVcLq3s0xcJK00rQMWhYwA1aHq1jiI5LU4aJckWb/OVWq4HPOiYu4fYCWlgRrOMVDSRu
         Ab81xVmcQMLulLrFIxmNWBfoR5eWk1kWDnlWlvMJnfM25QfSSzKIXqezUO+JZrn9yH04
         2cOlH4VN8n12AdegdhHRFWAA9MQoNr3dHqQq7Lkpu4n70K2ankKTYEXwGzjf/9OSwMCO
         mLcXUosO2bXhyFjhHtKSbqRx/OqOWyFL4pGqGnfbIic43x4sxiQPa1NzVO9X+g3HU1ff
         K3KQ==
X-Gm-Message-State: AOJu0YyCci2DBOnpxJZN0ASak0s0M9tqPAR3W4HgobIxQ8uxMbkl7mG5
	Tkky+N9gH3wrEtQm+/k+XL1LZ/aE0mi9z1zkocNWCS/3ljREOq6SQfGRbjiPBw==
X-Gm-Gg: ASbGncuK1UTtya0SxwWdXCuu2U7yvoR+RxYq61tKKY85oJe/npgfvpO53vCRztNagnE
	d3QhXyO3/ASkPWq+FbZ+rblnXms6BszgroaA1R58FTl8+IZ8XC2UDHZhYVa2VxDgtx634/twwBB
	pJR8fjzuUqBZGJu44QDQEnJga+1V09xnNdhu5xBlQx6V3QrVtxyVmtfV73O06ZhcmnVGSH4/ASw
	PfbhPH6YMPa7ubacmtw6vpDk/tru9AYJAetjmACW3mNKVCRZHCJ3CcHmHhfATUxmSy0sU/nMPAo
	m78D/gsi5LFqw3wd6zrgSNbiFBqHUcjGfVEh0obGZQTHikfm5kGaapJR5HzUrUes/RO1i8QpNf3
	X73tonTzpAEirmjNKKPRgTAwq/LQUKATbEh25kA2Oq+kZSPV3einj+OfiVzGVbx1p5lAYPMUzlU
	C/OWzoFQZ483T9GBeW198lYp9syiuUjMDQy1KcOEmdB7rQX6E=
X-Google-Smtp-Source: AGHT+IH4o8gEb7KvUX50lzA3gbxsJs5C58ciWTNRWNP1V8Dz1t3XXa56bjD2BTdsidbk/LvoruxAPA==
X-Received: by 2002:a05:6000:1846:b0:429:b2ad:f31e with SMTP id ffacd0b85a97d-429e3305c82mr2359766f8f.35.1762343847424;
        Wed, 05 Nov 2025 03:57:27 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc18efb3sm11100191f8f.3.2025.11.05.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 03:57:27 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] libnput: correct upstream version check
Date: Wed,  5 Nov 2025 12:57:22 +0100
Message-Id: <20251105115723.560713-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 11:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225751

From: Alexander Kanavin <alex@linutronix.de>

It wasn't updated when the recipe was switched to git.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/libinput_1.29.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.1.bb b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
index 79df97ac068..809c291e233 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;bra
            "
 SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
 
-UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
 inherit meson pkgconfig lib_package ptest
 
-- 
2.39.5


