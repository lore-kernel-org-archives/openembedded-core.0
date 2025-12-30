Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42568EE49A6
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:35 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71736.1767125552759095953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MXVtveq0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a099233e8dso85542855ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125552; x=1767730352; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PEDJ4lkckbciWuob1lAvaDkGrlU0mPBG6osmKWI5bVs=;
        b=MXVtveq0QXBnoR3RBRnML3BbL5EIKKBTOAh0dl9w3q/BC/EsCb4idAs4BpY2IUKIf/
         Gss+FIVi81Wt03VwEPH5saFyn61uiQM9C9GUncH3wmKN/KJaxKk6oZlAhoszhHLlbSJS
         NGUZoICqrwnKsGQCpn0zA4hlyNrhLjhBU41DuFTrqBxXug0AgjUDY23hEpIxtbjUkDTG
         8yWj52dqcyZ5p5Gapw0j2+pkM2/aC0hBHrBquZ2Oaaitf2fXZUP2aLJC7pf6Gazx4E/V
         B4/jxkNctUIH9P2SVZqfomiyLEoewhRIxcCZHQ0O2DyVzObiwNDXeL9XzH3YKASBUY+A
         qYtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125552; x=1767730352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PEDJ4lkckbciWuob1lAvaDkGrlU0mPBG6osmKWI5bVs=;
        b=QjuNYkD0e6Y006NKoe35/8bLhPpPcnq1tnc/ZZextEQrDrURL/Hy/iPSIC7FPTKQkM
         0rT3a53nIsZdnOctMrhTfmUY5uVM1l0CnLkpqowb6qXftbZkfRK1Yn7a/lC00+AxCk5T
         XbUL67cGJo3wGqL1pIaDAtXEXIb8RvF7u9lLfbor2KMp/8PFFeV4QYRwgvvnEUxLLTF/
         aZQFn/RKt/8pH1AWkYCkN574w/Qmoy4jy+PBB3FG85o85o4WstjuQ2HpO26MDYwjqfTW
         kfacIpAbB+ntyKJKuweG8oG9Soe2ilMvGYjxLTRFMbMtiFsier2i45i1TP0wsPTMqkji
         rRdA==
X-Gm-Message-State: AOJu0Yw0FO/AYEJK+u8gdS7SmDg2Ji2De2YLDTdbyZ/FGEmBbqeIEl1i
	tS/piNNnDsI7fy2+SrarGTUG/ebJ1PrDmqwxmOQfPgl7rPfCkr03fu6SYafbvZ0ZbfTcYVIX/9+
	SNNkE
X-Gm-Gg: AY/fxX5O95tyg9E1PthxwvF+REpkPstv87rKznVoFo4zoY/u8thslkqGdpiyYUpTF5W
	5plis+4woYY1CLD3qpzSRRgjYo8fBVsKM/pv0vm74xne0Bkzc6a3PpR0p9B2YittWuaNVndaKw3
	ehvmxdpN1ybVF+eJ1BDeE1tHqoErkyBGlDa/zNqFrZOWnrEQ72eIiX10nNdV4Lo8XMqw9enrJ7g
	0C5NVya5tlrSb2wsA4y3ZO2thgLMy/wEOZIwfFPNi3VT0pD0Gzfsy/E+H6QCKfN3+ngpDlsazb3
	uE3Fennd0l9AxWo6pu6rm18IJvpa5L/Trf3Fp9P+1zSFSFI4ucMXzA8sy9UzVzllOWjfa61MQUF
	UowE1AhS34XW7SPIgzItXYgcY3N50mDxeDKJOms22qefmbenB3rYx4mhZxvY7xYEmsNAZMLudfd
	f2Mw==
X-Google-Smtp-Source: AGHT+IG32+yndF5/HNsFDDTgusA+ps0MdzayyhLy5EQPyHlHKVqcEG28xOj1USgz7AnahlltXjn5ZA==
X-Received: by 2002:a17:902:f68b:b0:29f:2ec4:83e5 with SMTP id d9443c01a7336-2a2f2205201mr315530145ad.12.1767125552015;
        Tue, 30 Dec 2025 12:12:32 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 14/29] gstreamer1.0-plugins-base: upgrade 1.26.5 -> 1.26.7
Date: Tue, 30 Dec 2025 12:11:44 -0800
Message-ID: <381fbf56088ebaebeb1021fbc440d43e971ffb1c.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228706

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 6719158979df0fd8eed2c1730dd0f3dc2d67baea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


