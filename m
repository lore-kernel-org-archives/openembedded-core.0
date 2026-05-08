Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8466CD37AC
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8226.1778224338437245595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ezFZIzYa;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-453903ee4adso1138998f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224336; x=1778829136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5ASaPIXRr10dHnkZMBihIYjDbKYzCCGOLrsTa93qV4=;
        b=ezFZIzYaZlXW0/zzwDxa+qVk+i84tOdTiEB0wuhV9uqlNFSbaOiz78jZYsK89yf0D7
         AJE2W4L2z7su0IvD0kqa4/Bz4ervMNAcLvLcBHR7DIBRdNWTKRxjHCs2JcV7IbTtMUHA
         /Y0/KasOTFCNjhFoLzYx9Y8hVCY9r6UnDznko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224336; x=1778829136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5ASaPIXRr10dHnkZMBihIYjDbKYzCCGOLrsTa93qV4=;
        b=X+tVX46U2b/nKoRrLr0CS/ZAn8FUZouHKhRksSY8h1BQx3MT4pSE+M2tp+dmpf0NdQ
         ygIJBcXzipSRGlSUntOSLiNImG1D0nVoefAXnggzW0WAXGWoD7QLyFruwtVVj33d9yNY
         n4Bbtnvol6tf0+xz7ffvb8jziret1RuQ5dWZuHXmj/J2x1NPOdm/r8rAogzvG+yv/9Aq
         gSNFK+WuZs0xMhHexOYZ86QQo6h2WcHsJzbj2Hm9NUSbxdt6HXW9S+Ar+9Zx5yWTw6F+
         W9p/PZ+WfeoWmS9PBFzCsb4l8VmUgnwZWVLWsC+LqKVCMMaj5pANZrBCvH/Hxc/71QnS
         AfWg==
X-Gm-Message-State: AOJu0Yz5YIQ/8HuvDYwA5qf4mFuRTBR/EA6Cbd6IxpJH9EVGrnb3vPx2
	oTWouJhd+NToqSoEBysw2EMFFOL3axUIDUiLHvPpzG1QZNB7aVdeTqF+DSZLHbKS5bXvBxzmspc
	2MMuVznY=
X-Gm-Gg: Acq92OGSofIx1bcyPhaWpFb49AlwjBSWQbxaBrm4woBo9FR6sNefoKZAMV27VqqJiEl
	97BD+OMNFk8KICgkJTd1HfJPXvuNFWvnnADPNR2gun+SeiyLA9DkslVT9MHkWDZMoFKlDBfo4l6
	pjyFoMJM1y82kHN52JxT97YBMfD1bBvL0TbK2sMi+gs/nEl2TdJhxZk1iPE8Y28FaaRCgCcbQXT
	jh8kmbqifflcwglGydGgded52TkN0J5fjvw7PKxAj0/CIDIqUSKySo+1DnIZojUZ01iXoQfC6pS
	IzMmHRjcN0NVXDbv3QpYn3cbeQKjzUFTLNoRMoS7DWevp6DLKTBZhyEfbclXJ95LEaOHS3ewQxo
	hjXaXb9Jzdzdtx4YD43CGoAxIM8uj4WGo6RnlwuRo//3QH+ha7WDElbk1JnKqHHSVzJKjEkHNwh
	xxkQlISyzxpgqvUnggl8hguucdVjG6ESFmL48pgw7smRwO6hi4hnDxjA1RKl9bWopmTp1eD3Rfp
	4fshURCAltd4BMdAC5Rp4SJsUc=
X-Received: by 2002:a5d:64e9:0:b0:445:eb07:f0bf with SMTP id ffacd0b85a97d-4515b524398mr17670348f8f.16.1778224336420;
        Fri, 08 May 2026 00:12:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 10/52] base-files: set status for CVE-2018-6557
Date: Fri,  8 May 2026 09:11:03 +0200
Message-ID: <4441dbaac52c8294fca13c9fcf589a9bbe1b6692.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236652

From: Peter Marko <peter.marko@siemens.com>

CPE in NVD [1] shows ubuntu.
Debian [1] says "Ubuntu specific motd update code".
cvelistV5 has unparseable CPE so it sbom-cve-check assumes vulnerable
  ("lessThan": "10.1ubuntu2.2").

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 24d38fe4da4ea7d110877c5aaf419af1d27dd43b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 3f01bb35d92..d4d777b4851 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -167,3 +167,5 @@ CONFFILES:${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname ${sysconf
 CONFFILES:${PN} += "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile"
 
 INSANE_SKIP:${PN} += "empty-dirs"
+
+CVE_STATUS[CVE-2018-6557] = "not-applicable-platform: Ubuntu specific motd update code"

