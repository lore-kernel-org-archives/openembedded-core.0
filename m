Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD685C982DD
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 20:56:37 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.751.1789764993195950223
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 13:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OxBeS781;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.76, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd78so675899f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 13:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789764991; x=1790369791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z93btWr2xMHgt6EHQMOPVOSKvkT2a+f41yvSvCqBbz0=;
        b=OxBeS781N+pf4I5qyQOMS8Z8/SdASzWAg1EbvAPcGQ0L4u42ROFMXgBZl5FTLOTkWk
         XxdRyncpplSZGIpGjQ7IE9s0WKRgUoIhcOT2pAExp3kO9AB8Pchcs2bQ4rxhEAxUUgTN
         H2ZucewPKDAUGgOcqJ3pY9Cc/lSo32lkSOmOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789764991; x=1790369791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z93btWr2xMHgt6EHQMOPVOSKvkT2a+f41yvSvCqBbz0=;
        b=jgT+T/l7PgeIzKSSI2arUPDb9p1/xSiNo/avEXwXfYBTPgr9Qsv9DX7jzNcq2rHFnW
         24kcOGMvYMbbArcCube+E/pk08QpOLTXzVwKb6saBNuQxzmnEG2LyPQ4PLkozqJIU0OE
         KmAS8XWVnfYAtzPSCiWJT8P06v21JJUiYWD9u79SDiamxVdX24HBIRhIOwyhhSEUnn0D
         TqVs8PRsqXDedp/wVTGEiWr1PyhVdHCC0L0Gcj52vCp6H6kOomEMPnsvPnSR3XfGFRcU
         qRBH4n1xlDxwtUvwrgfPLgRhjY6K8oGMrFTE1eg49QhvcFlWVoDmQbB8IlgR9SEil0OD
         OAng==
X-Gm-Message-State: AFuF++nvzOoSNQ09VMXkxpAJvbD4kWDyuE/Drh/dkwmniO+4pSh8kilu
	WOBkL+S2m30ffwUE6b85R60L0oFO9mC6uI2zbS4SOtYE6sQsXxXk7GSmBM5e0WMKZmcG9vrmia5
	PbAA3nw8=
X-Gm-Gg: AYBFou2L5hrZV5qUUkoAal/wis+GODfyVbFkX3h4OSlGJp9BBeMvffZp8+aAz3s9Q+b
	P6IXIHH0TStFgWtVZofmTN3NZMtgH7mMxrj2UwSl09h6pYB28+71g0yXPyMbA3byZGlTn40YMkE
	7+Bf1XnuxyLCYRL+LjKF893Wef8CQ0BYPXeLoYTABIy0HO/wjdSD5XaqbGWn0u1DV7G/HR1WTfe
	u5SWR38uRHj9ze7BxdiOgH/HYcz01uEZ9C8625j0JLc3q3LutOJgL8a+v44Bj2V9WYaPer4B7qf
	kTRizuPFkyvp/kHh7V2W6xYubRkTbwr83I2RZy+wYpoSYqzFaRYFPIokMEtIJdwHq9B12JhsFKX
	aTEo97r8iJxeZQiMIqcMXuIej8v4EIi5p/YpDQMVSewId6NPRlPiWNr+xXK4Uaq7jjnBcdQdBOs
	8icK0RIq43gh5m2niFCM1VXcxxrePgK4zi3Mqs/+kJ3B3hOwfdYvR10OuhmtIKg5m0rQuQYVGNp
	iHvREK4WFjWeCb8iG9TqA8wDdE=
X-Received: by 2002:a05:6000:178c:b0:487:72f:fb41 with SMTP id ffacd0b85a97d-4871e36b7dcmr5240119f8f.39.1789764991179;
        Fri, 18 Sep 2026 13:56:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:22f8:9184:5b80:7430])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459f446sm1229405f8f.35.2026.09.18.13.56.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 13:56:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] libmodule-build-perl: Fix build arch contamination
Date: Fri, 18 Sep 2026 21:56:28 +0100
Message-ID: <20260918205629.3117092-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 20:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246225

Ensure BUILD_ARCH doesn't leak into the ptest output package causing
reproducibility to break cross build architecture.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
index 3ec712cb8e6..5eebe3c38d2 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4234.bb
@@ -53,6 +53,7 @@ do_install_ptest() {
                -e "s,${STAGING_BINDIR_NATIVE}/perl-native/\.\.,${bindir}/,g" \
                -e "s,${S},,g" \
                -e "s,${D},,g" \
+               -e "s,/${BUILD_ARCH}-${BUILD_OS}',\',g" \
                ${D}${PTEST_PATH}/_build/build_params \
                ${D}${PTEST_PATH}/_build/runtime_params
         rm -rf ${D}${PTEST_PATH}/blib/libhtml/site/lib/Module/

