Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A803C982D8
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1690.1789682894928114525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=osjxu1Ut;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e64ccso1006445e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682893; x=1790287693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/mynyi+jqbESn6LtPwFNdECTVYiQOm98OP4ssLDlvyw=;
        b=osjxu1UttzbIxLsME0BFStUL+R2vx94Og1/gcPxrRy51/01pHJsI5LKxN/zQU1oZ3e
         aAp6ukLcdB/fNpy4pmHheA3+47zSnJX3f1cKunsQ4ThdOC5po4M19tXBJFxESIjz/ecF
         liX/Z/ipERa+ik/yJi9x9I9ta5wCzFeTF+6+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682893; x=1790287693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/mynyi+jqbESn6LtPwFNdECTVYiQOm98OP4ssLDlvyw=;
        b=ne9SjhqXmN0D4I6SV0QNW+MGtyG0eJIr2p8CbAAtGHXUXBhXMBvQPBxnfuBBTM+xIu
         jv7c922DYbeWQkMzNOkhVxTnPMTL05T/fGuLvnb8q9dscBBhcC6mAMkbfgXS3CKjGy/x
         A+c9+5Dx9xL2V0Ssa5YOPbYrd5NsVNPh7ElMP1A7qzHRcYyhG7tdeHuiQKTTxTeSBlAI
         Ws+N+JVHOaCafdKS05w/poviFpLh56y2zQEtB30gR7tuJXB4F2d+X317MN+wmkASnbzU
         6SWvcI3jhwveP10JtOv75+iGPKlvrmODtIb3//fYbEc5/9q67M4PK19zdS7nJNkJP1Vj
         0Ytg==
X-Gm-Message-State: AFuF++l1QMMbsE/tkHAZdWeYz2z+WtL/WrwYehlIkGvH3lbggpYPTS6c
	jHSFCJ7jpRcZ448tg7HtbYDZ0ZC7Cr52XYA6aTqHlbb79PgEiNvbszKPVR6aIQc08PiXDZm0Hnl
	mT4RYDI0=
X-Gm-Gg: AYBFou20mQs0HOQGsBfTd/Uo6M4aohbYUlQtFey/57NExR39bTyBXRi317F8b7Eajt/
	GQLcY8mAVFAyGw2YwvN+cZWtsHAsWVmKeCdxKFzKywTCtug9X3ISdV3OOVeUGT4pWEC9wmKPwrQ
	bkBltSSnn7fvWJyBhX9reUN9wfWvX4YgDHncmnpss5RWi+1iQrI8tfwFZkEliTN7Bxe9r2NVush
	iST6uWYVKOoWTE+abmgy3KCSVi4ZnxqK6WRxteBzJxW6ZFezGxJpESj+q2Rvp/vaaD0pdvHDnkI
	u0JNupUqLAR1BTSC8Slltf0xyGQoOHakrNo4hVVi6chBZaUzBpt16moLwm2YJbP2ZFEi3XvNmRG
	G/TaVBOj/DyXbIVXmz9Zgor+hkLLmO1s4t4oA347EqUlETFLewNctz6qUacIahtByMJOU0QA9bd
	85WfjZSvHIZoPccMWtf2GKuOPUENUMgbo5rDwaF+mgk0kmQUAGFThRz+56swPt8rqEwXNLrZF0j
	dRObQWf0v+jm2trScCYxpNno9TTLaTGpS1YiR78GcNrqrZR98+M3O2j3m2D0oVjoDYBBWXX0mgo
X-Received: by 2002:a05:600c:4e86:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49fc566e6efmr3231465e9.4.1789682893209;
        Thu, 17 Sep 2026 15:08:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 45/79] babeltrace2: inherit upstream-stable-release-point
Date: Fri, 18 Sep 2026 00:06:30 +0200
Message-ID: <dcb1db441180ec1b904c00567d2180ec4edd5cd7.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246140

From: Daniel Turull <daniel.turull@ericsson.com>

babeltrace2 maintains a branch per minor series (stable-2.0, stable-2.1)
and keeps the older one alive: 2.0.7 and 2.1.2 were released the same day
in July 2025, with 2.1.1 already out since April. So upgrades within a
major.minor are stable point upgrades per the OE-Core stable release
policy (ref-manual, "Stable Point Release Upgrades"). There is no written
policy document, so qualification rests on that branch structure and the
release contents below.

  https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stable-point-release-upgrades
  https://github.com/efficios/babeltrace/tree/stable-2.1

Upstream keeps a ChangeLog with a per-release entry list. Both point
releases in the current series are fixes, tests and documentation: 2.1.2
(Jul 22 2025) is 13 commits, and 2.1.1 (Apr 14 2025) 10.

Already tracked this way on the OE stable branches, counting only bumps
since each branch forked: kirkstone took 2.0.4 -> 2.0.5 and scarthgap
2.0.5 -> 2.0.6. wrynose has taken none and sits at 2.1.2.

AI-Generated: Kiro with Claude Opus 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d742fa47d795b6b013d5ca3d78f0dd601432832)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
index b0cd6efde18..5b9c02b0c21 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb
@@ -19,7 +19,9 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
 SRCREV = "d0e946a71faf5f0c2d7f1fb5b92a369983e9cf10"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
-inherit autotools pkgconfig ptest setuptools3-base
+# babeltrace2 publishes bugfix/security-only releases on its per-minor
+# stable-X.Y branches.
+inherit autotools pkgconfig ptest setuptools3-base upstream-stable-release-point
 
 EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
 

