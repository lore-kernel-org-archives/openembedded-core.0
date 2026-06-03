Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBB8CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:37:08 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15802.1780479427107198537
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Z8Vx4Dsm;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8423f1d8902so1387663b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 02:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1780479426; x=1781084226; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6Mi4xIyMGb5mC5FzIY2po37uLag1hffJO7yQqfhcQc=;
        b=Z8Vx4DsmQkaUd0fy7N4Yf+NE9l2GYoo9/mqz37Gt6DUWwkqd1t74mpm3A/rSHNcPgq
         gylKnpCcbWWfDZbm1BBmLBkzcP7P5Ft/zee4GpZSlgR7hDZmvJNlejlaPJeI7AysP1Kn
         lRY/rYR/LwwFjlduOX9b4TEVH0+a5RgBt0zk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780479426; x=1781084226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6Mi4xIyMGb5mC5FzIY2po37uLag1hffJO7yQqfhcQc=;
        b=X5KBNnTkcWDrigNldt8YgFNV3WetjxEDhyGW4S1C2HHNbJzlv1p/5Alo6y6auOBqjc
         4hwNayTf6ZkNE68jBoC3rHQgegzX1V8BkBUmRlho//QTVrjVMonBv0eeoCZxv3cBglBk
         VWh+AC8sm/jHvCu7jkM5+yFNsIZoG67NpqNftH9M826bwKtoUBBxiai+GNU+n6Lzlgf2
         S5plmkIJ/vX8Bh3YbMDZCfOOvWbXmJzzIjcfDEoZwdqikG8BQEO77l4fim8GJiJxWc2D
         x7dp6iDogVFPQgqtM0LpLb4QoZAreiOFh8WXNWfJc3yBK5hCqs4qmf50ZwnStWPE8JRH
         pnig==
X-Gm-Message-State: AOJu0YzsZ3+ay09vWDV/cuKNYCI1nytKRUTkIqk4cEiNmL1EPV4Grwop
	7xl+1Z+/urPK934iuEtczHEYv4zmu2IPl0BV/zQMllIzXdqc9P9UsrL8CyVlO8RF+3bZB+er27f
	a3tLm
X-Gm-Gg: Acq92OFRmRlv1CvbFNt/jqyMapzEuZsqjrTp+dTr7d3iqR/u473EYYbtyNr/H9WEeQL
	ZuCaXM7nUCsTTy3/OE8YxX4x7OaopyI67J8DDxGOROp2/LMz0PrVA4nmLmKflWSL2/v1zKHWdG8
	oUGV4giakrB9CMFvKrmdJQSYxzvWRsaP1uct/9bd0CQC5paZNUQVIhNqHfB9uUuQmAEU9V9GSGF
	/2Junwek6FrsKleZ6qZjclz9hx6cmMV9MY2703btlka80EElWFfx83mh95fCWcuhEtcL8pWGo9r
	aG6UK3HGySj+oM99nXTIwMSaKFnNgrHhLDm596vR2DDC6jt3/qJnhwb1rgeV1pHMeqx+MDv8EcV
	R7zaKs4+GsMjypkT6Pm/3PK/s7HZ1no6avyCVVD6eoVxZJHY+9N0D3eRW4hxS8wtuiL3Np9o3zW
	Tm97JGR6wrptY0EcQplxsuNzwdtFyPf+vZjiUA+K2yqKHz7Qe+FA==
X-Received: by 2002:a05:6a00:4b16:b0:842:7fc8:eba with SMTP id d2e1a72fcca58-84284e6ffccmr2548863b3a.11.1780479426391;
        Wed, 03 Jun 2026 02:37:06 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc5:f760:e943:b381:76db:38ec])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428706fa9asm1749359b3a.45.2026.06.03.02.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 02:37:05 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch] xserver-xorg: upgrade 21.1.21 -> 21.1.22
Date: Wed,  3 Jun 2026 15:06:56 +0530
Message-ID: <20260603093656.2285854-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238088

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 add author to HPND-sell-MIT-disclaimer-xserver
 add missing paragraph to SGI-B-2.0

Release Notes: https://lists.x.org/archives/xorg-announce/2026-April/003678.html

Includes fixes for CVE-2026-33999 CVE-2026-34000 CVE-2026-34001
CVE-2026-34002 and CVE-2026-34003

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit d4452b34849b4f06c979c394dc0c824958243861)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc             | 2 +-
 .../{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb}        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 59c373280e..0d8d782712 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -2,7 +2,7 @@ SUMMARY = "The X.Org X server"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=21e33dcccf2d5034f798a8ea62622939"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f8778cfcd90ece0e4b225f30182227ca"
 
 # xf86-*-* packages depend on an X server built with the xfree86 DDX
 # so we have a virtual to represent that:
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
index 3781234c84..6a9826d959 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.21.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.22.bb
@@ -1,7 +1,7 @@
 require xserver-xorg.inc
 
 SRC_URI += " file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch"
-SRC_URI[sha256sum] = "c0cbe5545b3f645bae6024b830d1d1154a956350683a4e52b2fff5b0fa1ab519"
+SRC_URI[sha256sum] = "1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.43.0


