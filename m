Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A3DCD6E49
	for <webhook@archiver.kernel.org>; Sat, 30 May 2026 22:43:14 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15765.1780180988381573440
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 May 2026 15:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ufxAresc;
 spf=pass (domain: konsulko.com, ip: 209.85.215.169, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c8571b55c62so719750a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 15:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1780180988; x=1780785788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XOSMPii72DCfumgnLqLx84WOMSSbdXHfoKpnszROd8E=;
        b=ufxAresc+xgE1CWruWIKK3+Kd9VB7sTXgrOUWTozb3MAUM9+i7oNrT7S+ArKgm0ZW1
         9TZZ2NdXrrsIIZhkjXzZGNg0qQK24SviRSatzLI0KrMu/aNtqvrfViCyhodmDfnXFG9b
         E/cteqAZbyJZioDdD0TkutUxssMDVg4EAOdV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780180988; x=1780785788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOSMPii72DCfumgnLqLx84WOMSSbdXHfoKpnszROd8E=;
        b=ihFc8y3F8QXK2K/4Q8Ouo5E76SDOICwoe9DSnUDgGZEenWTlf6uvGtO+mWB/YAtCTT
         2jtVvUcRTdbtsBIX6ezOjjy2uBwQKCRDDBCZl75qZ8//JsQefzSgj6iBSvWkPpnhtzW1
         f+ETsO4LQZUpmwaTImGD73atIMQmDhVSb31bGEzv12+maZVuqZ3GQ6/S9gY+5fkoMjtv
         sYots16OLj4ih/acsatZqFflj2lD8aX5q1OVehJLNxz102ih5hlEeYJvKv9s8FD8gP2D
         5amq9U7Y+cqu+qC9uG+Rs3ehi1upyrpiSbYG5bGqxjlC8ne/OwfwIReapaLbwB1koh4O
         HDBw==
X-Gm-Message-State: AOJu0Yyays4bQHDMwxnKn+0r3H45ju1qyVsFtZevT8w+ksrutJRQF4DH
	sguuN6ofKqkLcUBVEvvL9dX3miIcHisoXuucawE5RurVZsdXIF1d4hGe3/k3zfNTPqV5sl2bAd7
	zLwCe
X-Gm-Gg: Acq92OFWEV0nHU5dfjuMQ/5HKqnjc3KR0VLV7Oa3C7yTAt/MgKXN7xo6EhpG5Z8Hkx0
	L27nhNCf+NroOG6NLFrEHC4tyvG8ZRDYV6QIs5oFeRi8tvlBIndq5TQBZ30DSBpwSKMTtKc8YhC
	NAq7jxljlQxTbiRoJlJ91PIFOuunebgSaTlG9VvAtRGtXvh0cGKADKB2ImRI5Rp8ekFjKfVrITQ
	TSy2k2K8RNthqtILCtCi4/53uyPmS5n13ysBfxBt0M+k707a05yGDyZhPpNY7dU1yWyHETPQ5FQ
	ZuZ4aPVHLut9/+pUN1J62x21c27uorQVD3gpyyw2ouGzL/z2WQfdsq+yPeEPCsjYxtoXKGYNm+q
	wkZz9uCHqFMhhxcpbNIgmbssmQcahyTm+Ici3LI62MeJvwCxKQtowIPTjqzxoEcBtRAy7NKzMSz
	YLMi2tcrNoe1oQm0y35ZnwQs0HoFg0v67MbbHlruFzeMA0WiHM7e5GjciagWw7UceKsExwoBBvd
	A==
X-Received: by 2002:a05:6a00:2d1f:b0:837:eaa9:381f with SMTP id d2e1a72fcca58-8422524c538mr4572931b3a.0.1780180987697;
        Sat, 30 May 2026 15:43:07 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214affce1sm5762453b3a.9.2026.05.30.15.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:43:07 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] python_uv_build: add PEP-517 backend class
Date: Sat, 30 May 2026 15:42:31 -0700
Message-ID: <20260530224301.1456167-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 May 2026 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237776

From: Tim Orling <tim.orling@konsulko.com>

uv_build is a slimmed down version of uv containing only the build
backend. See https://pypi.org/project/uv/ and https://docs.astral.sh/uv/
for the main project package and documentation.

python3-cryptography-vectors uses the 'uv_build' backend.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes-recipe/python_uv_build.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/classes-recipe/python_uv_build.bbclass

diff --git a/meta/classes-recipe/python_uv_build.bbclass b/meta/classes-recipe/python_uv_build.bbclass
new file mode 100644
index 0000000000..9c8acdf4fd
--- /dev/null
+++ b/meta/classes-recipe/python_uv_build.bbclass
@@ -0,0 +1,9 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit python_pep517
+
+DEPENDS += "python3-uv-build-native"
-- 
2.43.0


