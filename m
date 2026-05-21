Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94FFCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 15:48:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39876.1779378525092300504
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 08:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SsPs0znR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso82371205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779378523; x=1779983323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UtNKPtAGH9nJRtLsAwyeejsb94kse0v27xI8JwWTxV0=;
        b=SsPs0znRK21910TR8xevAcgM7vWTSsldCi3hfic3bc9T2mHhOmazfNv3ckuJdF+/Fh
         QAet+8OTSbswziIwZFVZx8fHcGgJ/2n5KZPdUtyE+zRANXdw+TIVWI0nNhHkaoaUDA6O
         vvjCAd23uffHr5nCUYKfdb6pW/rKE40ovSXyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378523; x=1779983323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UtNKPtAGH9nJRtLsAwyeejsb94kse0v27xI8JwWTxV0=;
        b=C0MWvgMhsFE2TWmZC3ucTJF6yAJsobTPeaJWfmz+84wuajw26RmErYSWC2VjIJfM4q
         27zZuVVsR9t33BUHzYK5PX4Wo5hoZCcH/s0l+9dlrLwzxqe0Xl9CEPWZQp7WBj8zCl+v
         tVfMsv89GZkGc6YlcWSQ6zaUmDM7TrUuhjVR2W4e9cpD9vYmf8Eh9SijoxjNa53wv32B
         1wTyrY8FwOHwJykwlqgMdymc0Dgm7mL+mYA9b0wG1+O8nV3k6IIT4kbjTIQy9X6Ye6Km
         2XjYvx0pJaePt4BueIxpT87rYje/RPue44GcILz4aSGttq++NKidh+Mm9EuqIAlkbOJW
         33bA==
X-Gm-Message-State: AOJu0YxkdZpzyg5OUeKp2PnTXcH16RnGBruvWP870k1JQsTR/70QuVAk
	JXdpWYJvTKmzBkCDupLJrht9QLcoGulczHkWc/Y1vo1CSOMsJV/n5kCCyhQ6F5XeH2uX9AQVyV0
	2bBh7
X-Gm-Gg: Acq92OH1OUauq/0r2nzGjPseAwGQ05ds1Tt+CURH5I9/iWP5VSnmHg3+SorYx3w2MwB
	TZHpFG37wyjKeXLZGey6BUQ7mP7m/j2+OOk//ql7kWrfhIlPTe97Ae23bZ7ljiU0askHcKdt5QZ
	jtJ7AdBvPA69i889wkLfSTqtBkAGtr+LPGbhlPRkqYoJ3jmMlVWcvUqpu45alBlwT9oJDQvFQpw
	LXcfPcb6VJWW7MEvJvR7lGCaCF9NZALUjI9KZbogHOQ6cUHumdjZBV61SSPmB6XWJQ8gAHEVEyZ
	/1H/JlQZkOj/+v5Dlc3YLGlTEIOA3CneX+rh6bVaxkLXbGO+YyqLuoQBxFDBkLNlKBCuz2WuLOw
	Fxy2uIaUldsNW+YMnyvC0XPcPX5aSPUCyaoY9SwUjjJP5SXZhK+sjyj8JaLhj/0DPi/9PxOnx3f
	bynuK0VYkmQCgQxqI1KHujLTFv6+YCspwrW58fyUTEs/RPI4WyL1qx
X-Received: by 2002:a05:600c:848d:b0:48e:635a:18d7 with SMTP id 5b1f17b1804b1-49035fbaad0mr52428055e9.0.1779378523383;
        Thu, 21 May 2026 08:48:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8b8a:4d15:b8f5:8634])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c4239dsm18242115e9.10.2026.05.21.08.48.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:48:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xwayland: upgrade 24.1.9 -> 24.1.11
Date: Thu, 21 May 2026 16:48:42 +0100
Message-ID: <20260521154842.2278934-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 15:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237516

License-Update: The change was only to add a missing author, licenses
are unchanged.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb} (94%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
similarity index 94%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
index 44b8bb605a7..b77b8e994ae 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -7,10 +7,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT && Adobe-Display-PostScript && BSD-3-Clause && DEC-3-Clause && HPND && HPND-Netrek && HPND-sell-MIT-disclaimer-xserver && HPND-sell-variant && HPND-UC && ICU && ISC && MIT-open-group && NTP && SGI-B-2.0 && SMLNJ && X11 && X11-no-permit-persons && X11-swapped"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
+SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

