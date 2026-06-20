Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE032CDB473
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:15 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5950.1781960414890299681
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RMvG6C/e;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4624a44e152so2427412f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960413; x=1782565213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEoEpFMEpL590+/PJ7U940qzvdVkSomzwLs5F76mTT8=;
        b=RMvG6C/e6jBY8nvt/9aZI9GOOcrfbU1JJyI2TMMawTNoMzSCGFdFsorkR6OdD9l8+8
         dkjvZFmdynuJFTG6KFN9orPvk0XXtq2MF3tAPfdhyUeiOP5foN44g0vz1LKqUNSAhqGn
         Sbkn4EMIUTTENlOHDaJcqC0GBdpqmAJZi6zf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960413; x=1782565213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEoEpFMEpL590+/PJ7U940qzvdVkSomzwLs5F76mTT8=;
        b=pSz81Tbq5s25q6j4f6fdmU1rt2bWsqtZTWVJ2LG5XxewUM4ezdGgCXz5uf9zlvstO/
         3TCvfNCUM+p8XviVKzl8KnFMhnfmnf4H4RTND3DvRdXz10F8c4NInH2fm6Hi52lyAkh+
         yLiLXjg8zQ+Ts2xFsZvtb09Bjzh9FQ1E8v2TNq5Ra0Lu2ifrPesbDFDySn/Zi2rBcssH
         OBupKE4eefbTEwy2JbJM5vNedAOELHEZMsGUBmqblqAwx1hQ3SnnD6smi6xibuKwGLPX
         0fxmSAEcI+6re3VLyg5te/FEqsKYWRseeHCSgTW24ewkIEyuLU36GFEqvQbNoOu4eWW+
         M7Zw==
X-Gm-Message-State: AOJu0Ywg/J3K794bJUDB1M06618+TCKY2O28f/5azg4a23x1vU1ROJGB
	KlMxef9174J6VMjHYXb3zuGX4rEW1GwgubJAkE8M14G/n0+ygjsOx5GVXozBgW+qAXZ9PWvz6Yc
	+8avy
X-Gm-Gg: AfdE7cmOXCkFuk4mLh+yxxYhTnsrdWg12uRIO6vcCW/CO5aW9h0psJIo28Ywc3+QJ8+
	F2fwL+V7sXLwztM7uRNttYQLlMJSCtEf1WEOeHCRxcuNIC3jgONbprHiMFPojJENu4z528Rkr+N
	zhSU18RRHXz788Xabspfs6SjiVXS04hO+qNd+BM8cw/Pt8MKZrjS8t5yaStNtwFKU6fbKGUQBQQ
	LzcVrYSHEyR/TMsZnu/vcRApWxIaKtS67aEkwy2fpS+q9RcfvIL4f+OJB0p5Hobpg2pOdbPRvSK
	aZNSq9X78xhzunotVPzQDlLzRUxe4evICDR13+jzjpyggDBxEZdc0my/YZqsmj3jwf2O3HS81C2
	LoiZpnS6UQdx51wpGyABdBG4Dqab2Er0AYVNSHJwKruOGOoHTr3a15bxoj/qFjrMseSWIpl7mVD
	SnhnewCB0lTgKISQUdH92mdLCKvpaVN9ARsQDAyQ3EolPOzN7T0Ql+RcdYZkTIaEjVBk5hlXLxW
	QeMBRe7ghbrf/GC
X-Received: by 2002:a5d:420d:0:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-46508afa8f6mr9260432f8f.37.1781960413044;
        Sat, 20 Jun 2026 06:00:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/36] xserver-xorg: set status for CVE-2026-34000 and CVE-2026-34002
Date: Sat, 20 Jun 2026 14:59:24 +0200
Message-ID: <321a589cc50dac26bde7cfedf7ed6672fcb1f843.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239219

From: Peter Marko <peter.marko@siemens.com>

These are version-less RedHat CVEs.

[1] points to [2].
This was backported as [3 ]in v22.1.22.

[4] points to [5].
This was backported as [6] in v22.1.22.

[1] https://security-tracker.debian.org/tracker/CVE-2026-34000
[2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/81b6a34f90b28c32ad499a78a4f391b7c06daea2
[3] https://gitlab.freedesktop.org/xorg/xserver/-/commit/a48d67f38753de551cd177e471b545bd8b9b1b64
[4] https://security-tracker.debian.org/tracker/CVE-2026-34002
[5] https://gitlab.freedesktop.org/xorg/xserver/-/commit/f056ce1cc96ed9261052c31524162c78e458f98c
[6] https://gitlab.freedesktop.org/xorg/xserver/-/commit/5328a544ba6c32ecdd1758283ee69058dec100f8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e8cef838ebd40aedcbefecc1b1955c48f4fff39f)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 7491715134b..782c1f76ca4 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -29,6 +29,8 @@ connection to the X server is lost, so a typical desktop session is either \
 impossible or difficult to exploit. There is currently no upstream patch \
 available for this flaw."
 CVE_STATUS[CVE-2022-3553] = "cpe-incorrect: This is specific to XQuartz, which is the macOS X server port"
+CVE_STATUS[CVE-2026-34000] = "fixed-version: fixed since v21.1.22"
+CVE_STATUS[CVE-2026-34002] = "fixed-version: fixed since v21.1.22"
 
 S = "${UNPACKDIR}/${XORG_PN}-${PV}"
 

