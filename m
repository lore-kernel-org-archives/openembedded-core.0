Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B39C0219C
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:41:51 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.92295.1738600902360078719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WDmek0ua;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385dece873cso2162279f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600900; x=1739205700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTyHi8ffpx3R7KB71B79lY83VWPGHvKgzbQOzC6Lw2g=;
        b=WDmek0ua2VkyP6UFAuYrZh2m2y8ZAhCCU1rgHPgai/iIICJYgIENSB7sgvLLb1ZjUx
         5fz1wFAjZDtCk7i0lALUGfmIrELBLScPekPp73ttTPET4Rpr2h/WEtoBTXQKg358wYfq
         EADj1Y4Hte4G1KuVBtvBr/nBEBALa+JQKZ9gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600900; x=1739205700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTyHi8ffpx3R7KB71B79lY83VWPGHvKgzbQOzC6Lw2g=;
        b=mEhopabW0lVR1bY7fdPuOOY098B2ILXK12eDHSJyWXtmZTg56yW4b7Z9TaJjxuWzi6
         VturPy5uAgkXgdXb8VBh7aw7z+P4fTnKjvToxchJswClqdGuDWUhvtzoFguSr05921ro
         l8OoR8gB1vlsiP/P3zZPvznUpLlN0JJKRJUGTR4d8SFy+JnhryQGJQINNlYtqdmgjFXP
         k2OXF1kDSa3kRkN88ICrpVMXo7h3GTdW27ojWgOJPkXAXGoJoKbzcltg1WnHu64Lq6qW
         iY210zwTAFExyhACSYREPeWar/IypNLckxvwnkV60vqg3hU0Wfa/4xMEk680I5TiBA6V
         j5LA==
X-Gm-Message-State: AOJu0Yyxtf9h/ibJaQmiWePTxnTHFjaVV/9Pc1PQcTrJDCubs7//7CWk
	UJqOC2HgEZmIHE3FdqHixOdwCjyowBLlywM4lkYGmLVZxo5Xdg5W1hZLek0M2wpCE+XBD/1QMeo
	5
X-Gm-Gg: ASbGncsuhcBmY98r/0X+BmcUXeIh71ul14R2mzjyA9llrd/xBvgToXw7lHnHzwwkpm/
	ph8cX4/+KDTtL5MvARlRWiYO9nLRbbMTYnbT/Qs0IkFXMPyY2C/AwZl1xgVd3o/+QDQcDWy1O3I
	NHXOZQCYM+0VQWgFSe4FomTF6MVyYmKVR04wm6H5rheIu54gVTdsXODdrsndMsnACJnfnKSh1Jc
	ElvnfzehvpGSwiMherPLKSwoUzNiTppsDlfwBPqGyyFfcQXgmIbcgaB6gHttu9ChN10jXms8QNa
	rj7nM0xnfcCg1BJkJDCR1gkE1LBe9aJp+5x5SjhiXzhf
X-Google-Smtp-Source: AGHT+IGdhRCFp9avZfQbFlT8b0R/+r1HPIh/utdQLZJOXBNMPWaayS3KGTWzPO3dDOzYC5HXCD8juQ==
X-Received: by 2002:a5d:584c:0:b0:385:edd1:2245 with SMTP id ffacd0b85a97d-38c5196a45amr17088960f8f.30.1738600900434;
        Mon, 03 Feb 2025 08:41:40 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:39 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/46] gstreamer1.0-python: upgrade 1.24.10 -> 1.24.12
Date: Mon,  3 Feb 2025 16:40:54 +0000
Message-ID: <20250203164130.3403325-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:41:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210683

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...amer1.0-python_1.24.10.bb => gstreamer1.0-python_1.24.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.10.bb => gstreamer1.0-python_1.24.12.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
index f682f093eb0..f62cb159c29 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "135bcf8b6f1468bc31e5660409fe8ed38109f01dec44743514aa2fa6b3863309"
+SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"

