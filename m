Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80143C55178
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:22:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1042.1785565362889269889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f6qXMbZH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so864993f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785565361; x=1786170161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bnx+6Hrs/3zUPJ8nP1NYNovKshl3QVMapqf6L8LCZq8=;
        b=f6qXMbZHro46VAyqf+M7mgqXzPDW6O6dFW3XWL6fjHW3KAoJl5NxbJeDCUwU1vMnN1
         X/Yj2qpJLxqUII5jWy8wXxGlof92hMOjbWYU3nu/PF2PTpLEfSnuls2swkK1oIKXDrCd
         OpPmd79+l9P+YO6qM/x0nGQe+5eZ0DcOJwkp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785565361; x=1786170161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bnx+6Hrs/3zUPJ8nP1NYNovKshl3QVMapqf6L8LCZq8=;
        b=qC+5dJ9+XVmxrHucx82LQGqUliZDRWpC/XHqByvHgXBCyNV4GTA6oemY/ogweYRgES
         0xYMqysxSwPp02wz7RRaCdTxMTissmd3hDrGd8qS+e85Q9s5/2E03ZkzQNUcIWLWHfyL
         pOFukt7N1+86IJVyaXNdEg2fDeMBSN73hDA51qAf0U9sFirdcxf2u0s3k4Xa+wER7zCN
         cN+gU5HDo8+i0pnF7HVs77SVaIBywj0gpy87HPtt/1HaDPBHDmM8+Owj2uMKFjDjsqan
         tsrNtoapVaMXk6YEmGmHERdm/T5tQuB/uYM5yH5E7WDi/igFWK4b+K9woQ+WSKyYYB81
         //NA==
X-Gm-Message-State: AOJu0YxNV6wcOl8dS2K+4RhWmusyHfqj5OGVOJAh8eN3rp7CgHeCteuI
	Uru3HJmFey/TpoxgH/qLNRfLn1NumusRPVeMY84WjBvGcH07k2wdcL2ovNRSE9DY3RW/0w8rO8W
	8imW7dTE=
X-Gm-Gg: AR+sD12yKD1/B6BVDtwTDa2HPY8jW/ebFAhY7+tO22mCTceJWXHRBg8HqvOMR+U77LE
	84ECeibRjiWKAARcaVTvDwvILgZmr828+If7c4+PnlHkY0aO/lJGL14RacNCqRPAiLb/WFX4m25
	Xk2nsw+ksJFyzrcEexPyulFauwTAG3FNkns6jCdWly1Yx+UhEQcW0hf1haC4xaHMUWW+ZveNFlm
	uSOXTVjzviAWOP09D7mkH/hlxAUdAbfFidtIiIxPUstLIK8lyOxad7j31GSpV38HGJKTOzkJY5H
	VUKxmjaZYmqRG9GHcQP/+AgRAIVmBWjOs0x1OkIPLXeJDkwcvQkGmjSjKHaLRlSFocCeW8C75vk
	XFnOWH8eLoK2rbZUayggwwmnBpl9lz0nipdPOMOgdMY6x7euXp1cQwhX8yx6frDWir5D5dp5ouZ
	indcDTffLKOBPZ+XKA02skWZCzg3TQ2Cwyze2MPnIaGAmD1O4vfvLvkrP5Jw1H+pLGQL+haFYg3
	1HGSo4cCswPDGQ3n434xmnOIbPX
X-Received: by 2002:a05:6000:2483:b0:47f:7c50:2222 with SMTP id ffacd0b85a97d-47fd72c353emr4688983f8f.24.1785565360987;
        Fri, 31 Jul 2026 23:22:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm13921262f8f.0.2026.07.31.23.22.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:22:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] barebox-tools: upgrade 2026.06.1 -> 2026.07.0
Date: Sat,  1 Aug 2026 07:22:33 +0100
Message-ID: <20260801062235.2497102-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
References: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242472

Source: Documentation/migration-guides/migration-2026.06.0.rst

Release v2026.06.0
==================

global.linux.bootargs.* appending order
---------------------------------------

If barebox was configured to automatically generate any of the ``root``,
``rootwait``, ``earlycon``, ``systemd.machine_id``, ``systemd.hostname``
or ``barebox.security.policy`` kernel command line options, they will be
appended onto the final kernel command line
:ref:`**after** all other options <bootargs_concat_order>`.

Removal of global.env.autoprobe
-------------------------------

The global.env.autoprobe variable introduced with v2025.02.0 is removed and
now replaced with CONFIG_ENV_HANDLING_AUTOPROBE. It has never worked. If you
want to load a barebox environment based on its partition UUID enable
CONFIG_ENV_HANDLING_AUTOPROBE.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 2a42c0a2668..6bc3fa07faa 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.06.1"
+PV = "2026.07.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "8752b3752819ec4aaf848a1d06df05242a64954525fb15b6cf07b3c3dd7ebd7f"
+SRC_URI[sha256sum] = "8b8fb781094cd01c4c5be9d0899d629668cee2b73f1447260851715c4496bd78"

