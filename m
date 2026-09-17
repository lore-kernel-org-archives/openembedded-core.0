Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE88C982DC
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1572.1789682880735308009
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kNvGpFFL;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso1334545e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682879; x=1790287679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OuE0GuFaxyRmWAd/w1KjivG8psg3cFaLbBKFexj0xos=;
        b=kNvGpFFLG/KA6+2u4hjXZ8mFPfGeqMudukJA9146uYFiTJzaEMpqyKXzQlbhpz5oD6
         1rZrD00D27iJkJTw2n9n6eocKcQK5djbRVHpYa0cfF/scIwVQeXQb6T456ZraK+TaxE8
         sofctY+E5PrWr/tYQUO+SLY+dXiH8vXoleuFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682879; x=1790287679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OuE0GuFaxyRmWAd/w1KjivG8psg3cFaLbBKFexj0xos=;
        b=Rd3Q3CKdk1nMy+c4dSe+tRvrzRcxHlKNZO4mhORbpcJjkeustZGCIFJ+z36gpXwaTk
         Z7AW52RQ3iUR10ZPMvl2pvWobZeN1b2DYZknC8lvN3A/3VLYKf45t6cQD4g7OqbZH49M
         MSf5EWAB6MTaIeHNQ0vJMsO17gb/teaMw/MLkYi+F/eFx8Re3egC92+oW69hl0Cxgl0i
         9AfvsCk4YqBfWh2DZIESOnGbpcppFZ9ex6NbsbZ5/dMM1B3CGYcYi++uNvbBCyD2haPV
         wI5u6uLGXprUWFl8GC/Koko1/mPmntCpQcihKxbzSD/wTKgljCeZOLLoXyEeCVC7323m
         ngpA==
X-Gm-Message-State: AFuF++nM3v+aETb3TdxPI6sv6liYvEA+pevPWY8favW4xuTexEPhVel2
	PqWTX0prXKv6RMUBQnM7YCtWlTmVRvtkJHaw861DI+q82HmsOk2BFYdjemsUGYC3gG7DpawNuJp
	CHdDJ2WA=
X-Gm-Gg: AYBFou3pZeXRnlrbZDPPM5u8DgoicJjSVcc+5+rcx6Gi+5YOg2fXGVPFerb5IYwiYIW
	V6pClE7ll3bphGlw+10/Vp1Ltl7MIqMqasxWG/SCqRdY5+b5fftC1mLHcIpTjIhZplkWY+npl2t
	kn4vDCkU3i9VZx3RIUdMRUVk12Sc4iwQgkg+wXnGz967Zyfngd2b+J3iuej78YMBb+hMkUGSrQC
	hfD6wUcjHQfdkaescgM/Q/cp6HKVeYoe0ZGv5pkbJp2JdW2A4i2KBU6uHDdA6ItY2jwiF6BhxY3
	GSH9erYGA2nS21C5rcd/UUJifP4Q2U88v5aRA99vmJSehkBs/3C4fLEMr9w4QhAKsYQWlbmvXgP
	NXjOC/gL3fgIcBdj5L+l1S/du7aiCZ4dWI3MlKFZ6wkV4M2uo6fGXUfZ2HPRpyYD9y4kfMliyS3
	3AiWwwJXWi/gaunWZRQKgVYPRRIIARI/qnCRLQXZjP63AfT9GZvdxAH6qehFCRu8hsXYTVvKG0C
	lgfQo18knehaWtMyZMkQAoF9FFVVx4S/EdVXVyojZyKoZA2iIAI6NJO0kim7uaj07gFefsxmBg=
X-Received: by 2002:a05:600c:a14:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49fc568f7a7mr3180995e9.10.1789682879026;
        Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/79] sbom-cve-check-update-nvd-native: update to version 2026.06.24-000003
Date: Fri, 18 Sep 2026 00:06:04 +0200
Message-ID: <52b64f4bbd50bbf37db3e0524406276592dddcf6.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246114

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Update fkie-cad/nvd-json-data-feeds to the CVE database from 2026-06-24.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: fba290297e9bbc8c6c4086e7784ece5d06dbd26d)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.06.24-000003.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.06.09-000006.bb => sbom-cve-check-update-nvd-native_2026.06.24-000003.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
index 2917c89e628..73d9e776929 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.24-000003.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "7ff4a0622bfdf5313c79635951112d2a45bbe9fd"
+SRCREV = "11e62eba27133a54836b7a081d05ff96f72d879b"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

