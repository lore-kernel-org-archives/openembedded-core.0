Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B995CDB46B
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5998.1781960411554810166
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=t1Pg0nY3;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-46066e640easo1769852f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960410; x=1782565210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9MWIsw3JAmKs7iwwnrLJZE8GWHyd8LoxcOuQ5Au9iA=;
        b=t1Pg0nY3YQUt18J41feTiQwb8iGpSEyg2Yi8a9paCaxrXF23EQamdQAF9xWjK0Jtck
         vr47ap0UeZTnEY+7QmKDhDL3kA60lbnUry++oujEi2cxRxlzUcP5fhQmOVE51GIQgzOU
         UtgNDNdY1GJJo5l7RGB/9w7cw7848zOMpLm5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960410; x=1782565210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9MWIsw3JAmKs7iwwnrLJZE8GWHyd8LoxcOuQ5Au9iA=;
        b=VJz15E3cqUEfNm0syJhe6ZZEmtbLFySvRXNSHBuxebIW2Zjb+7BT1nf9g42gbQ88QA
         N9JInU5zAb9ilDh2hWVQtYiASYnoEKbim5iUdwtV3nyW0iD4utW/0xOGpX5CGdlJmf1P
         WJ5c9PfvnDjBf86bb+WTduD+2VXADvn6oIEErqeDY45sh2fA/EzrJcXEyO0t3hf3FZPn
         8T21OinW3JU2OJ5hiUEO0au8qkwgduTN5y+d2W+V2Cl+bCrxO2AH8U/dn4F+WiIEWkFG
         ptnAz48paJ4H9m4EHpo73EBPTJe58yLK7I+d6QziPRmDx3Ww6ZQtYpvrFWJS6WDtancQ
         l5BQ==
X-Gm-Message-State: AOJu0YzO8LBELyHuxsXHSm9sM9FkNlOHzlT3KhjXsA+FjpDDcFPNPifW
	hh3iFO5CiW8mSFt5JRjuHmQ6tthO9Sp40j27Y5n8hwfRa+xCc60vxyEjAGixEejFLHbVUoNGVhA
	EyrCD
X-Gm-Gg: AfdE7ck2F9+QnJy+u5K4JA8ahg+70Q7a5HMPyzakXCbS0HqJ8B5l0TNYN5Ksw5EoU20
	jP8RD9aTPsebj6NsWOzXVxEYocfqCLQFFVUL9P5KFMbN3mruPZ/+3BaVZ5U40vrYLeyGOgXq7t/
	9GJzaWt5vEbikXN55itkCjZA2ph4aNJHwrr7EgC7R/qAzDfcdflGLLls2ZOfutORUjIGZyZwMjJ
	+jPGC4f/4h/NIVtYG+/pWhxxmIXUoWSypJDLl2nZa34kuiTp89uRBovkkTMWCJ/lyFIK4XrheR2
	l8Bi7i/8OYnH1d0rIKBOhwHQjRQsCpL42rR7lOKwBVG9ldt2P/9gNwxKWZAc70ik5b6Q/+1kzqe
	wIlzU15Of+IEmkiI/+y/BwBvge4JUJ5fn55zo24MOuYYmos8NJ2jF8CmXqrtg8ReAxNyNWDf4ao
	PPbJ2j/VOJ4T0athopvIU7tOg3NV9xH8yD4UswT25efHFYjWN2Z48KyUCce48cnMPEwMXmDfcsj
	OVu3F18OCkGm8oc
X-Received: by 2002:a05:6000:2906:b0:460:3234:4475 with SMTP id ffacd0b85a97d-4650a423d7fmr13116191f8f.43.1781960409550;
        Sat, 20 Jun 2026 06:00:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 04/36] xwayland: upgrade 24.1.9 -> 24.1.11
Date: Sat, 20 Jun 2026 14:59:19 +0200
Message-ID: <b17a718ce90ec2f8f77e5792df882b6581031772.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239213

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License-Update: The change was only to add a missing author, licenses
are unchanged.

xwayland 24.1.10
Release Notes: https://lists.x.org/archives/xorg-announce/2026-April/003679.
html

Includes fixes for CVE-2026-33999 CVE-2026-34000 CVE-2026-34001 CVE-2026-34002 and CVE-2026-34003

xwayland 24.1.11
Release Notes: https://lists.x.org/archives/xorg-announce/2026-April/003697.
html

This release addresses a number of regressions found in Xwayland 24.1.10:

* Avoids spurious focus changes with KDE when listening for mouse buttons
   is enabled for legacy X11 application support
* Fix tablet tools not working anymore as "slave" devices
* Fix a crash when running some XTS tests
* Fix a crash in window damage handling caused a NULL pointer dereference

(cherry picked from commit 7a08abd1c50ce180b8b3c98636373f6bcdefda17)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb => xwayland_24.1.11.bb} (93%)

diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
similarity index 93%
rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
rename to meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
index b12b0d0cc70..477db6f8c43 100644
--- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
@@ -7,10 +7,10 @@ a way to run unported applications in the meantime."
 HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 
 LICENSE = "MIT & Adobe-Display-PostScript & BSD-3-Clause & DEC-3-Clause & HPND & HPND-Netrek & HPND-sell-MIT-disclaimer-xserver & HPND-sell-variant & HPND-UC & ICU & ISC & MIT-open-group & NTP & SGI-B-2.0 & SMLNJ & X11 & X11-no-permit-persons & X11-swapped"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
-SRC_URI[sha256sum] = "f297af27a84508db9b80d1cbbcc69c3801da38eb64c72f3b5b50f582459afdd0"
+SRC_URI[sha256sum] = "27115a1a8819078409bf6fecfeb7724e8137bd36426de7005a5b3aae0a2138ff"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
 

