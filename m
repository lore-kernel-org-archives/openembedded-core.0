Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1302DC982D2
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:16 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1680.1789682886138291106
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iRfcJvhk;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1335365e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682884; x=1790287684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ciD5AUiLNycPEI7ZpDiXJigUru3nXJ3Bi3lJmE3hwgY=;
        b=iRfcJvhkxJKcze1dwjNi9uo9zFQcQkWYYEnZGTaTCT2fNe65UhFYZm4S7v9FCEbXXq
         pMm/HCLhHCjdfHXo7XriOIsFiN8QxAq5/9DlstXxbQEpZJg7/Yvn/XNqy3ikGIe6Fdl/
         52xTvlCtP7Rem3BA4EgIFi/Hhl/WgAaMfgw2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682884; x=1790287684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ciD5AUiLNycPEI7ZpDiXJigUru3nXJ3Bi3lJmE3hwgY=;
        b=ih4Le6NG2ralfOsYw2AYSuZPlkrgPkSb9iZ2pl44Xhg55jALx5UgdXbajyc+vMw5wE
         nArOFHLWUGAZu8nzSh9+3omNulDmX8IIhkkKb6XBURPooqf3+xaQW15axfvA3dpmPfGH
         /1f/d492lImvxkh0rCdeC2JsZtpp1NdMSpb/9OBAMiRwWd3pPto+0P6Qk3/oib3gz9Ea
         o/4UJ+2V/UD1g+rcyS3JfM7czQiB9BtvVgJzZpcg5LiiaqzsYnc/JZbr7RL8eOh/2tHO
         kuwSNugPmnYhAp2cWYFGBnTddOv3vX0YOojX/4NrSEv4IDg6WziV7AH1JR8EV5uqZCOJ
         T/Sw==
X-Gm-Message-State: AFuF++ngBXfB5B/qGgrGHLzDK/E+OHLTdN/ZRGjb6G53nQCUgtHMt3kp
	ELZxwG1PKmJ7jHcZH67j4YTU1SQAb1OlZUcrfiwksukCMmf6CVFoAd4rq2AJiHCEGCVox8qhU33
	t+DU7nU0=
X-Gm-Gg: AYBFou3ohNY7xyqzjswkcqMUKEjFMOucw5ghfMaZFYT3Fy3AC9UlIuE+yxpLAmJqvpz
	PqpV279nQ/dZu2COgJ+dQ245mslBWSyqsPTby6Tw0Iq+aDedvuvbF/OAXBNkLcMyqQQMT0MF90G
	AQu0DTrR7yw9mb+gpLRJk+IOqbWvUg3DzJ7po6Qzj50n0+zATO37zyb39PEbAptUXSehMdI34mE
	O2+a7TJmQvu1a76aXnolrb/CkyX9apeMLZPlnYD5Ieb2sqcT+dReQRJBdKP38c0okOxY8Jnn5hY
	lPvBQUarkB3uUACPPgwzUPsmXamdu/lPhHJ3Q6GU+FVz/Ak8UT5hurX2Mn16e4Up1qd0gWnoyX0
	gfZBcaQc8rqm4O7f3fDqQw/zjUT8SN3VV7csGXcpvW0iOY3sIvsIj7j6sb8qAkWxjYTX8dLU1R0
	QjhwlBp6Wm2cKwTH8nLzgAhWcySOm0a3QeBWlfDRjiva0xsIsw0/TarOf65ET+WfwocsRTQNKJW
	vF4MgE+wlliYdfTfQwnyye9vdeAauiy6fuvHJzzzCfbkEIzy1hJBq1F4uFWSwWKizjQiQeMnoc=
X-Received: by 2002:a05:600c:4f86:b0:49f:bd3c:bc25 with SMTP id 5b1f17b1804b1-49fc574e7d3mr3345185e9.32.1789682884397;
        Thu, 17 Sep 2026 15:08:04 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:03 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 28/79] upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
Date: Fri, 18 Sep 2026 00:06:13 +0200
Message-ID: <976e9d7fe13f8e8534de26a47a75c3d355437e84.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246123

From: Chen Qi <Qi.Chen@windriver.com>

If a recipe can do stable version upgrade and the stable parts of the version
is seperated by '.', then it can inherit this bbclass.

By default, the stable parts number is 2, which means the following upgrades
are stable version upgrades:
x.y.z -> x.y.z+1
x.y.z+1 -> x.y.z+1.zz
x.y.z+1.zz -> x.y.z+2

Recipes that have different stable version parts can also inherit this bbclass
and set STABLE_VERSION_PARTS. For example, systemd sets this variable to "1".

For recipes whose stable version part is not separated by '.', they should not
inherit this bbclass and intead set UPSTREAM_STABLE_RELEASE_REGEX themselves.
For example, openssh's stable part is separted by 'p' and should not inherit
this bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit a1e069d04cb13e990b362804bd56a4935338ef96)
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../upstream-stable-release-point.bbclass     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbclass

diff --git a/meta/classes-recipe/upstream-stable-release-point.bbclass b/meta/classes-recipe/upstream-stable-release-point.bbclass
new file mode 100644
index 00000000000..98fdb5b808e
--- /dev/null
+++ b/meta/classes-recipe/upstream-stable-release-point.bbclass
@@ -0,0 +1,21 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This bbclass is expected to be inherited by recipes explicitly.
+# If a recipe's version is separated by point and we know for sure
+# which parts of the version represent the stable part, then the
+# recipe could inherit this bbclass.
+#
+
+STABLE_VERSION_PARTS ?= "2"
+def get_majmin_version_regex(d):
+    pv = d.getVar('PV')
+    stable_parts = pv.split('.')[:int(d.getVar('STABLE_VERSION_PARTS'))]
+    return r'\.'.join(stable_parts)
+
+STABLE_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
+UPSTREAM_STABLE_RELEASE_REGEX ?= "^${STABLE_VERSION_REGEX}(\.\d+)*$"

