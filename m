Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id BC12373179
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 13:13:32 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id p65so36764474wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bynk3JI+wFpnN1u30G1K/Z14LGVgpvM6TyDfDjI2Ggg=;
	b=CgWdWfAhwSATsjbyCd/myTG1quTrc5qfauPJlCou8Ur1xeE5JTXPt7/hRvTiZcMl3C
	b3eV6MM8UvMaib3EBTHSb3h2kmdSNwZz+9zrD9iBVcLcOA9t/+ejXkKaArFGGhdiWQKO
	l0AggstY3MSzMLzyFOChyVd0AdsX136TCN2iefNrOT8TBRBE9Cs4zY5mN9Ou8GEi8j9b
	F8yOwCWHNV3wJTQZbt6zLzqSV9iTW7a3CftEvaeXimoJSfpFp6ytygXOFKowomioX7Vv
	+q9dJpuKMZqhGw+nPgNafAc0QoNbHHO8u5aqAklz3dU05SR9Kw7RmiliMQcc3NX2nRED
	1EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bynk3JI+wFpnN1u30G1K/Z14LGVgpvM6TyDfDjI2Ggg=;
	b=YGO4qyK233wzi9K3dYAE1Tx+JovyxNpFCzHKfGf+hXxb6rSHpXGXyig5nqGbJjB3RA
	dG5wDIUXb7psno/kx4hp10sVZtY1toeDaTlJIf0gPE9EMRRReYDnyoWK/cqtGYJjFui8
	4hqBJppVjwsPVaqHGDgw7oNxQh+wkqS9pk4jMu48LaYLimM4Hu5ihaYNuiw+nOA72qMM
	bZyiLJhPV/iiAVYxgVJcbuqn3a9vesrlmiz2CzkXM5DXikxODeDeopnQ5o0DX1Yvnj0t
	Dq1vKGDD7OJ319mBxAhHktWUJkLGVRCJKUUXutTpY6SoeFU/uj6qSyd+7HwJIWQtuHBE
	K+8Q==
X-Gm-Message-State: AD7BkJKFqJRTEexaafreiMdbMyQg0K+4tcyuOFZ6Fysi5kti+u0QQwm2skJ6ak9tSAn/ZA==
X-Received: by 10.194.175.33 with SMTP id bx1mr16187693wjc.104.1458306812791; 
	Fri, 18 Mar 2016 06:13:32 -0700 (PDT)
Received: from localhost.localdomain
	(LPuteaux-656-1-252-235.w82-127.abo.wanadoo.fr. [82.127.113.235])
	by smtp.gmail.com with ESMTPSA id
	za6sm12269450wjc.18.2016.03.18.06.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 06:13:31 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 06:13:26 -0700
Message-Id: <1458306806-17511-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] gcc-runtime.inc: set LICENSE for all gcc-runtime packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Mar 2016 13:13:34 -0000

LICENSE_${PN} doesn't apply to all gcc-runtime packages. Set LICENSE
instead. Without this fix, gcc-runtime packages such as libstdc++ are
excluded from rootfs for builds which blacklist GPLv3.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 572396d..8639c1c 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -1,5 +1,9 @@
 require gcc-configure-common.inc
 
+# Over-ride the LICENSE set by gcc-${PV}.inc to remove "& GPLv3"
+# All gcc-runtime packages are now covered by the runtime exception.
+LICENSE = "GPL-3.0-with-GCC-exception"
+
 CXXFLAGS_remove = "-fvisibility-inlines-hidden"
 
 EXTRA_OECONF_PATHS = "\
@@ -109,11 +113,6 @@ PACKAGES = "\
     libitm-staticdev \
 "
 
-LICENSE_${PN}-dbg = "GPL-3.0-with-GCC-exception"
-LICENSE_${PN} = "GPL-3.0-with-GCC-exception"
-LICENSE_${PN}-dev = "GPL-3.0-with-GCC-exception"
-LICENSE_${PN}-staticdev = "GPL-3.0-with-GCC-exception"
-
 # The base package doesn't exist, so we clear the recommends.
 RRECOMMENDS_${PN}-dbg = ""
 
-- 
1.9.1


