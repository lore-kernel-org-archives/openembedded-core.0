Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2D9E77352
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 14:17:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.121252.1766585850949284877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Dec 2025 06:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KZHOwepG;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso58628545e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766585849; x=1767190649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf/d5/rNSFuUPZ1RytwlE3TNP/F1A9vwqZKBTyPL8kI=;
        b=KZHOwepGVpFaGz2tolBwcM4HLH1li1mHLCe/HEqMnCPlylEtpF6UXbHyudrwg4MKqk
         5jR0WhU/c14pbvIchyQg5nU/p8HY9p6w+mIhMcl2oRw5+S4WQv+rQj5V6TXc6QHUd1ll
         QSeeYwfJyvkj87qTM4aeXpSikf2r40kOKpkkVFM2XbxXn5z6kdUhE2PmcSTX1cgNnN3l
         iFCEFZXlR3+v1rLTs5WvUya2F9ASjTjAlELkCW3KreHx30+MNXVVhdI7f2Myt60D0zsG
         3vptJU0PUGywIF5iQq6v9amxX+eRzP/QuTqZZ+nAcnRurfydv0e4vZZkyrMJB7sEfNhg
         xDAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766585849; x=1767190649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tf/d5/rNSFuUPZ1RytwlE3TNP/F1A9vwqZKBTyPL8kI=;
        b=U9RXWH3efNKBthQdNDf0ScJEdZ5PCaicQ/GTDpcwaX70nnpcoOBXAAuH+gQLyFGvEf
         To1ufdySIIHdDNHoA1DndPuhTq7ivN3szp1ay0KX87vkr/g/i2PvT+8WrytTDeg554ns
         kNnSVU0TmJmZg5IwgOC2K5/4umBYI8OQH1MzVV/y4LLcTD9fvqrdAC+BQnuaJPJI6QI/
         NYMK1m7DMhHkIIIIAu+DCIKQs3CFbEtcoPvCcQ4qENWREKk5ZjnNUX1Ad7Xzrdhn+3lc
         OA2deKW59nMRRLYvFpCcHk1GnS2d70zE3LZIE7QihwdB7YLJyBgr67JIp4cHB5BjaKFT
         990Q==
X-Gm-Message-State: AOJu0YzCwAdTvwOpxUiScuB9YhmcTbe0Ux0oDGIxj5p3BKW6ZZ9Gnp7f
	uGaIPj0WUibR1fB9Rjuo0ydMovQ3mhglPeNH5gDPxs12xPvDM3izwtvTqLVM2crx
X-Gm-Gg: AY/fxX6SZM6M9FKK6MGUN096FVbBpMjZLAt17FZbaYZKKx8jC/UatMNyBQ5arvH38e+
	24h2DgnEcHknClCcalkdBUzZOEwWfR6ujkTzrXjHCp4/AaoKt6GmbtdlB4CWFqBMuXz5ftUHMOe
	K9UErFILboF/aRZoZ8FK4jNo4BvtUZmOg6eKce+lMGNANMJnYEEfAW9ymfr2qXIsw8FhUTvpHzr
	WpNt8qjYsp8JAZS0w7bt4P0n9OgCxQkcT90kOIaJ0+n5InY/yx8dO19JKriLgrxREKfUe2Qh4Y3
	VropsKoqlmHi65gCuvr9vzhcb6PGF2K1SrXcgel2uqW52KI2zmFOswGIBc0RJEHIEP+q2vMQip1
	iMJBJcU3nG7rsg77QCD0w5nAQV29QqO4L9+fgvlL+Vvjsk1063siJ8WtfAGqp/dnkdNaAM8qmTw
	AnXH0k74Wo5nQH
X-Google-Smtp-Source: AGHT+IHrWgDGPPtG0Gkh5igOaoc3IFdXb9o32sxaXMCRzCO86AtW2Fb8NVXytVVb4g0gXA+aiVOKbQ==
X-Received: by 2002:a05:600c:468b:b0:47a:975b:e3e6 with SMTP id 5b1f17b1804b1-47d195a72a8mr180362135e9.18.1766585848751;
        Wed, 24 Dec 2025 06:17:28 -0800 (PST)
Received: from Ubuntu-2204-jammy-amd64-base.. ([2a01:4f8:272:3f67::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea2253csm34940079f8f.14.2025.12.24.06.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 06:17:28 -0800 (PST)
From: uvv.mail@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v2 2/4] overlayfs: oe-selftest: Make the test more deterministic
Date: Wed, 24 Dec 2025 14:16:56 +0000
Message-ID: <20251224141659.2218381-2-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251224141659.2218381-1-uvv.mail@gmail.com>
References: <20251224141659.2218381-1-uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 14:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228538

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The test orignally was written under assumption that poky distro is
used. When poky-altcft is used for example, then systemd is already set
in DISTRO_FETURES, which the test did not expect.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 580fbdcb9c..3e55e97927 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_vars
+from oeqa.utils.commands import bitbake, runqemu, get_bb_vars, get_bb_var
 from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import skipIfNotMachine
 
@@ -46,7 +46,8 @@ inherit overlayfs
         res = bitbake('core-image-minimal', ignore_status=True)
         line = getline(res, "overlayfs-user was skipped: missing required distro features")
         self.assertTrue("overlayfs" in res.output, msg=res.output)
-        self.assertTrue("systemd" in res.output, msg=res.output)
+        if not "systemd" in get_bb_var('DISTRO_FEATURES'):
+            self.assertTrue("systemd" in res.output, msg=res.output)
         self.assertTrue("ERROR: Required build target 'core-image-minimal' has no buildable providers." in res.output, msg=res.output)
 
     def test_not_all_units_installed(self):

