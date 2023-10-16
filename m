Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE11ECDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:44:10 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.127696.1697467442062950643
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 07:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=f+zY95bS;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-27d153c7f00so2882007a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697467441; x=1698072241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0No9K0UrGkuWua+rWMtEUF7tL4gsJog1A4IqQOlyclg=;
        b=f+zY95bSzXZfFTHTMa2ve4NIfyW468Wl6Ni56jUYqEV6VfbtwToMDT16glhm+xa1XZ
         tB45amElXJmlrp4ztCqTqs9CMeaubwGVtFug6eXzKKFsy3UUfxZDsGX5CF1D/m8KLEbA
         OiJ+OKofS217i+1cLrp2jnanoy5Vn7urksCKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697467441; x=1698072241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0No9K0UrGkuWua+rWMtEUF7tL4gsJog1A4IqQOlyclg=;
        b=nOewVs9KX/OVPD7CuSAj0wCmqXG5AcCBBl0t1Qp88CWhhIzUh0AHYReFzjgRB9+6Sz
         TJp1eUT1+Fah3BsIbe029Rrvaqc/P6l46BY5tUMEXHQ7EITlZpkMHiy77rAYP7juKo00
         SCEfnL0SSz4N0WLvAYenYkvudqLQP/aQOzPzE0HLeCejra0VEZLBpZOZcO5kujfNIOD8
         yfja1S5RcL7NjKSpZM85zdDfNkM64tnd07zeVHnC6IcOkf3tmLeIpPtudwVTqQCO0Z1J
         JXwHjsm7VAD4mOMY450ewn/sTxRwle31gCK7Iu2+h9wbYBG41FZKVRuZbrVlc3CyFIh2
         IAVw==
X-Gm-Message-State: AOJu0Yw+5+jJQXLRZFETjYF13Lo/dfZgr7zIbS5SnUJWDHfzzN1AMHBm
	XFAW5eV/ukbfQakng+cpCVs31jHAPV7ohFFhSDg=
X-Google-Smtp-Source: AGHT+IEXu2C/aFVZbSdelntsjwp+bDVyG/FqJnPy+On6B0WD1VMI76AKdD4z1oJWH3ADgR9ELZM8mw==
X-Received: by 2002:a17:90b:4f42:b0:27d:7666:9596 with SMTP id pj2-20020a17090b4f4200b0027d76669596mr2816144pjb.11.1697467440884;
        Mon, 16 Oct 2023 07:44:00 -0700 (PDT)
Received: from localhost.localdomain ([157.32.79.139])
        by smtp.gmail.com with ESMTPSA id az7-20020a17090b028700b0027360359b70sm4735948pjb.48.2023.10.16.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 07:44:00 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>,
	Robert Joslyn <robert.joslyn@redrectangle.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [OE-core][dunfell][PATCH 1/2] xorg-lib-common: Add variable to set tarball type
Date: Mon, 16 Oct 2023 20:13:49 +0530
Message-Id: <20231016144350.312086-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 14:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189295

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream has switched some new releases from bz2 to xz compression. Add
an XORG_EXT variable so recipes can set the file name extension needed
for the compression type.

Following the approach in oe-core/master: 6a8068e036b4b2a40b38896275b936916b4db76e
xorg-lib-common: Add variable to set tarball type use a variable for the tarball suffix/compression format.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index a566eaa45e..1e8525d874 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -6,8 +6,9 @@ LICENSE = "MIT-X"
 DEPENDS = "util-macros"
 
 XORG_PN = "${BPN}"
+XORG_EXT ?= "tar.bz2"
 
-SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.tar.bz2"
+SRC_URI = "${XORG_MIRROR}/individual/lib/${XORG_PN}-${PV}.${XORG_EXT}"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.34.1


