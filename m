Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60276D5AE66
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2991.1765620059011564540
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=STnsmtAy;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29f0f875bc5so24822795ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620058; x=1766224858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RytcawXprBtdZavteg/YAT+ca6HHAFbtH0jF11YwVIs=;
        b=STnsmtAyFl1dTCeqM/7FY/9lmvL7UUIXrbG/iS4i+LIJ2uYVtbIX29++05eU9adBrC
         wqOjer/GQZ0OemEjdlhJ4Nrl4fJC7oyXyAF/rDJ6eHVzMKbw7b/ev1OljPToxc44JSj5
         9f/b1NOeTVEO/KJJcaslUXls8ZV0bRTOZUoL3dmuhzKFzKC8VRPLQJ8/gpq3iwZ4QiME
         kMouaAyzH13PbOnpjeAt92TojgxBWksdeULOYIlYFJa4tBgolUmUG4akfITPVS9BWCow
         uBuCfabS6qHDM3tETSGdCyKiUuPlY0RLJQ30upt0gFqU1FWn99nLi7yL+IhJCYJRLy0Y
         k0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620058; x=1766224858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RytcawXprBtdZavteg/YAT+ca6HHAFbtH0jF11YwVIs=;
        b=kjpoSf6fULAYdPmyyE0L/enr4e1PQz4ma8mT3s+/efgHogO63+fKJBiv5Q4wMoNE9U
         easKuhhO/2qfJ9p55ki1IqB+8qUnSM0iUirordMjLokpIKADZvQcoPHJpl535xVfmsiM
         hqEFf3i7MLCv/8pQUJkHRUAkFtCmGSvQ7gyAtzfCItlaCojhaq9dgosaCbMZoMW1keZq
         vR1IycvP50OvzcEaUZ0fT03cTx5+3uJZ4oi+ZTeuuURjmmShcBXLIRe5MrtJ9KTpVl46
         uQ0mbXTRaxJTEuOTLmjvaLNAsHu8+E5H0+IzF0wShxD6gMMwQb0LqmDnZvTT15cX6/RC
         UTWQ==
X-Gm-Message-State: AOJu0Yw3xTd91zYYGMSo2gqwzhJ10uDOojkp6It8+rmrtHLoAjmQIY44
	t7hsiejAMTwuqztOGaRnc7eCaS1q+zmr+8n9N/yOSiEVn13WXyMiV8ERYg6jEtGY
X-Gm-Gg: AY/fxX4IQ+TcN8EbuJVt9JoBBXdd8WNb9F0npkgigrInk1uIo3aGlJglcmJLmRO3aMu
	Cmtf4nPoJHVvHZg7EBc+56WdJb5e9P+RC/oX9Yo2dc+Aj0wXtZlQ5e4mGjPH3wrTrXOhAlX394k
	jyZs7N/kwqeU4P/MIijNWZt2/ALL7sj6nL1pCieKyT6p01BhjjEqO4EGIN8Kipsp0fGrK4MMVBw
	R+iBz94y6GJ3Tns+NgOJHAXEasjeG6jIAUZ/E+vplGbB4M9y9U8ckawcdlYB+r1b+q0oAXDxOkF
	mD7AR5D0zwbJvsfNGCP4r2r8GQnyQduhzjVhIzG1exD+ZCKY5rqCo3LHhrG8gMC6IPf4jXH+fa7
	nEE/YkHdjg6T631QVRmJvgl24JzwUUrR74HjBsqP2lBYjkojO6eaESUF7YYumijkNJWGJMXx3MC
	QnSAny4wDSohBtjWeEprxn/DIJ
X-Google-Smtp-Source: AGHT+IHGmyPuFwaq2+K1K3T14gYhNxk1Es2XCnW4L7eIH06gpD5Yc0UXkjm/hSgTTRTBOPt4C6oh7g==
X-Received: by 2002:a17:902:cecf:b0:2a0:8df5:2f6f with SMTP id d9443c01a7336-2a08df53433mr20478065ad.15.1765620058219;
        Sat, 13 Dec 2025 02:00:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 29/67] gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:53 +0530
Message-ID: <20251213095931.2571498-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227647

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6719158979df0fd8eed2c1730dd0f3dc2d67baea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.26.5.bb => gstreamer1.0-plugins-base_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
index f12d81cda9..4dfd0a207c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f0c0e26cbedaa57732cb6a578e8cc13a1164bf18d737d55c333061c52f0c48d7"
+SRC_URI[sha256sum] = "969e3cbf05dfab92cf37e94840fbe398517d7ba3275331d1c216a2e30a7208d0"
 
 S = "${UNPACKDIR}/gst-plugins-base-${PV}"
 

