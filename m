Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D50C43458
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:48 +0000 (UTC)
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9342.1783835506931242986
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=LWBQ6s1m;
 spf=pass (domain: underview.tech, ip: 74.125.224.50, mailfrom: vince@underview.tech)
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-667971437d6so3414145d50.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835506; x=1784440306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLHYSayuAI0+PNxiORMP6oLepN3WwbNmmuhzSMJKvkU=;
        b=LWBQ6s1mq7h6ouWXPNcrxxPosx2QTZ2+aQIj3ZqfKINvYk4HSAG4XsupP2IdJh3LfI
         NOViHK2DfrrMaLA6uLXNGbu71NhDIx6g8cI8Yecu8cXi4XAE0D+AoJhobH3Tzi6vGUAn
         W/fRaNHro/T/+O9QnSA/hL2vXIRVBX++0GzBEDgXcaOfnluBQtW1KVCSGBOD7Th0Ss8o
         masyG+QftLeyUv8R48klHxt/Pqg/6bE1IHeIZ2z/oRlJyflyOwfd3CPlic8fMpsYdKgo
         KJi9g1cyUkt1BGXdwK4fOMYvv3KNNSSWe92kKriGu87k2SfmzcfS7QuBqSq8dt4K2DRg
         VIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835506; x=1784440306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YLHYSayuAI0+PNxiORMP6oLepN3WwbNmmuhzSMJKvkU=;
        b=LYdbwzr6QaOSJsmFoNhmTwoccHhEiW8wSyafT/Wqs3+MCDVA4nr2WhmnEMKNkXoFuX
         xSd4WYNgtYUrWwQY4IfhvyZoHJJzJgjQyVhhSiUWU/5OAdqnSCSOxrA66YNL9XsOvSMZ
         Z5GUaAOcvxFqFoD0ECX5jBZep89ALfpA6z/cLldXxR7KWC5UGA8xWCnWCIiwkFdzCEYo
         g3wqQcCoCBy+fy++sgIYOWQWq6X9Y4KUwZsTE/u/X3/nmlahVb9EgFeyIFkdRrLv8XBD
         OzTAkDeBhN/jsGHd4N2W5CNbzIyCnnC+dUHK6LizYmMl4/6O46O4dwbq1BigCiQnWnyW
         LOpA==
X-Gm-Message-State: AOJu0YwfCHC+1LtgbrV487R0eKBmj9aULylheRTE8+UbOEH9kngxt517
	sF9UUU/63hn8277XrrqJBtxgerfn9oilFEtqD1mg2dvjrrem3LUMsfMdqu/S6fvdy7KkxmJNS59
	Aulstsd0=
X-Gm-Gg: AfdE7cnYiqSryDfQf6p+50417Uhixx0To2YQMjINl1RbgPIbbuN6q+4KMbv5qOtfAyY
	vdHefcJhOIJHLUA/xs3WgNs197JqVJnz1da1/AtqoCcjQyDzCSHO2oztHQGkSK0CFVWxNa5c5j5
	c4f0Pb9+WJIwalCc4RoDm8ItGK2xob35AmC+t3uEUU7ddLDOJ3zYBY/uoyyJJqNOJRTh3OGj6EL
	aHCeo6Hk7wM6yE53gQDmG3ge9qv/RwYYNHhuTc5E75/vCw+58Q8UFN/bzF89f9DF86TiuRJG7XY
	i/d6SciYTf7kbNbeimciorRhlWwZnJVw/xfQpwKlKCeq1jmdF6bwlbnZpAdpnTeyExHmahL+JmQ
	QEmQbVndWdOjYWiATItEWFcMTw0H4vgFcus1PjKeygom2qgy5urSNxlMJr/lXdp9OEexnLTZXYh
	1uIT0KqNB4ZF3EH3sbmRxUGg86
X-Received: by 2002:a05:690c:688e:b0:809:ae5:1d2f with SMTP id 00721157ae682-81e90017f6emr34502087b3.9.1783835506017;
        Sat, 11 Jul 2026 22:51:46 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:44 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 17/26] hwlatdetect: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:45 -0400
Message-ID: <20260712054954.4063745-17-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240742

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-rt/rt-tests/hwlatdetect_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
index 2dcc80965a..7abbe25dec 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_git.bb
@@ -23,4 +23,4 @@ do_install() {
 
 FILES:${PN} += "${libdir}/python${PYTHON_BASEVERSION}/dist-packages/hwlatdetect.py"
 RDEPENDS:${PN} = "python3-core "
-RRECOMMENDS:${PN} = "kernel-module-hwlat-detector"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-hwlat-detector"
-- 
2.43.0


