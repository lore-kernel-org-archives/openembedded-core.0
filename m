Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3BDC9830D
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 13:59:49 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7736.1790171985227399334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 06:59:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OEngp/IY;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12450405e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790171983; x=1790776783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p6ycVuMkP24xiFMceYO1Z5haXx8aZG413ysO5Pi6HDs=;
        b=OEngp/IYtQUIODaCQ9mLbnUkUJXdL0BeBqTypTHS+CXe3VeZjVyB5wEFGz/N73YoLk
         XYfC4RffB1SfAk+GnSm+cTPibiFx7XsxLvOejgTBiMXq+YSoc97sa8B6SJc3Pmjd3hX9
         lJjMJSUoIN69IEehENXoWzhuBG5Bm1FsSI5Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171983; x=1790776783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p6ycVuMkP24xiFMceYO1Z5haXx8aZG413ysO5Pi6HDs=;
        b=w//o3Bk4sU5V5rDqbAc3UuIJTTCGhQkTsXgPM7po2DD+2Vy/2KJOQ6oh9oZq5MALGz
         jlZ3f8pZn2SRoNvvDA/yJrs4Jn+z05CzHiU/5vo2jGP9ct7WriyEI44eXUvSHHepYLPs
         NrEF6aWQU3S4gwxVH6TdaX9aqP7u7aaVZzpEyy6Ev0c8/X8RCvRLT7eTLkr82qXYxzse
         CpbrULhuwHdPjKudKzkc5NDg0z0FL6JHquaCQksdy8W471boLB7cyjCXDnDHE3m4VJtS
         P0IsnodTI/5+4kQWciT3GJ3DPhRsWaMbjvIqjGGbfc1d50ld9Q/XD8rBmmVqjgORIgkf
         k5+w==
X-Gm-Message-State: AFuF++kfNqT2V/3iCNbaa4LnxGCzDTgK5KY7DEr1XUQBqacOCqDy9BJB
	jt0FAQ9n6+TvZ8Q3Obhgh/zrIzJRXhS95lKQ2FseB2QucjA911A8VGe4NdLsYVzCjwqUFDtjALL
	Y+RG1xvg=
X-Gm-Gg: AYBFou3Mfks7X5BkUzyw/yaiR2kba/LJ9ZklEYM1KEpW9tUKtzeEhG7qXaUAC4hHkqD
	jYYUEXOP8Si/sfMuA2fpVwgz/5HQUNmL6SkuL1Rmg7VkdpayEIAWwbY2l547NZC9hRe7IS13ejt
	ovLd/SRJqvhjYziWkmYEPO3WZvDvMIR1VlhmbY1TwItnygpv2sSPTU2Kkpb2Y0weV7WntgbkP5m
	is0evD7E7DQkg136cL5IR48Hd2CWKrbo83cDKAdif5Q7tT/OqMSPS6Z2gsqwiUDN8J4/dV+Kkyi
	vVw6m441t3SfG4E7jmac/33IWoUTQr3uIOTe+O8CuWzulSZ1/NsVW/Gnm8ekxOrwNeRBsnR88j+
	0xlufu9GjCu5dzkCBX+WZZxrtntjGelFCJcT19DmWLcnYzyE1OkzSVNo1B4HUaVSFuYmTZ5bGoO
	Rj6h9/B71SPD3EK+OTa3gsFWnTQ4hURS+R+5xFAOzM2UHft/o0u6DBKbAg18yG8t1nvyyrGVuV9
	I/Cloo9UtHdBIibbtlWKoPhz21c9MXw5s9QIg==
X-Received: by 2002:a05:600c:3b21:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-49fdf25486bmr37811405e9.32.1790171983415;
        Wed, 23 Sep 2026 06:59:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:36fd:f492:2703:247a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe43fc27csm8027945e9.2.2026.09.23.06.59.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:59:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] meson: upgrade 1.12.0 -> 1.12.1
Date: Wed, 23 Sep 2026 14:59:36 +0100
Message-ID: <20260923135939.3797785-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
References: <20260923135939.3797785-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 13:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246516

https://github.com/mesonbuild/meson/compare/1.12.0...1.12.1

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../meson/meson/0001-Make-CPU-family-warnings-fatal.patch | 8 ++++----
 .../0002-Support-building-allarch-recipes-again.patch     | 4 ++--
 .../meson/{meson_1.12.0.bb => meson_1.12.1.bb}            | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/meson/{meson_1.12.0.bb => meson_1.12.1.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
index ae8bd4c954b..dfee24e0031 100644
--- a/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
+++ b/meta/recipes-devtools/meson/meson/0001-Make-CPU-family-warnings-fatal.patch
@@ -1,4 +1,4 @@
-From ba79cee701b80984c660ffc1c89ce1226b75ed5b Mon Sep 17 00:00:00 2001
+From 2aa6ab3379281038eae915b0e6e1855ed0707b31 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Tue, 3 Jul 2018 13:59:09 +0100
 Subject: [PATCH] Make CPU family warnings fatal
@@ -10,10 +10,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
  1 file changed, 3 insertions(+), 5 deletions(-)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index b0072a4..762818c 100644
+index 65d0823..07433f0 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
-@@ -294,8 +294,8 @@ class MachineInfo(HoldableObject):
+@@ -293,8 +293,8 @@ class MachineInfo(HoldableObject):
                  'but is missing {}.'.format(minimum_literal - set(literal)))
  
          cpu_family = literal['cpu_family']
@@ -24,7 +24,7 @@ index b0072a4..762818c 100644
  
          endian = literal['endian']
          if endian not in ('little', 'big'):
-@@ -642,9 +642,7 @@ def detect_cpu_family(compilers: CompilerDict) -> str:
+@@ -656,9 +656,7 @@ def detect_cpu_family(compilers: CompilerDict) -> str:
              trial = 'mips'
  
      if trial not in known_cpu_families:
diff --git a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
index 30f79be3693..6bb0c91fd51 100644
--- a/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
+++ b/meta/recipes-devtools/meson/meson/0002-Support-building-allarch-recipes-again.patch
@@ -1,4 +1,4 @@
-From 21abed6786056ae31e4028b98068ff78740872e6 Mon Sep 17 00:00:00 2001
+From 88cef14eb829f7ad5c869695d3ea079ffeccc839 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Thu, 26 Jul 2018 16:32:49 +0200
 Subject: [PATCH] Support building allarch recipes again
@@ -12,7 +12,7 @@ Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/mesonbuild/envconfig.py b/mesonbuild/envconfig.py
-index 762818c..0efa628 100644
+index 07433f0..d818427 100644
 --- a/mesonbuild/envconfig.py
 +++ b/mesonbuild/envconfig.py
 @@ -37,6 +37,7 @@ if T.TYPE_CHECKING:
diff --git a/meta/recipes-devtools/meson/meson_1.12.0.bb b/meta/recipes-devtools/meson/meson_1.12.1.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.12.0.bb
rename to meta/recipes-devtools/meson/meson_1.12.1.bb
index ac69b63bde6..e8c1b3d7e02 100644
--- a/meta/recipes-devtools/meson/meson_1.12.0.bb
+++ b/meta/recipes-devtools/meson/meson_1.12.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c6d7470c7d365886c"
+SRC_URI[sha256sum] = "ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases

