Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72F0C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 08:50:48 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3360.1743583842549609767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 01:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G/WXIRK0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5443995f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743583840; x=1744188640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1T4Fsm9MjJ954leCYusWd34FDV4OxxVdWuvuS5iisjc=;
        b=G/WXIRK06t60nDB7iWj27r09x545hzalo8P1INZC+qz044NTb/B3VTp4zTQaKOQLuw
         u8prBmTpTmTCO3P/XmaVY0DVCcWf/V/23AGok/LZlGF9u+n8WFPG9fBxdLcVMKzD208J
         cJV9lj3IwmgEm91IhZJB+vbqpZaZovBQqJN94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743583840; x=1744188640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1T4Fsm9MjJ954leCYusWd34FDV4OxxVdWuvuS5iisjc=;
        b=AtleAoWI3JSPYFtsrodD7fV302u22cSeaaJ7JyS78FXhIKxi58IgLYnOY05FaQDK0Y
         VVi/NxBWuA5wH+BKpRgro+aAy0lh/8dAzxeg/6QX8YzE1IfsNmW8UqAAE3dhk8E79SMR
         2MBKcEUwKeYIPqJs0xP1zMvz7nVo7I98lva7Bqu7GckYsIK0s926w02vqB1I2XtgMkQ8
         qF58gPMbxWMSaUgZHTMLY6pjYcTzzi5UJq3lPhfC4ocyezrrAX8/YUrr4Cr4GXUnTqtH
         2GelZyjfLegMi7ULJwLv8RSvfvrpwQH6BWogWhSQJ8+Oj28wCAWuS/GgV1HJEEMKE76i
         ZY+w==
X-Gm-Message-State: AOJu0YzV/PfMYiclf2RzIMyYqPtOVJ3zbDExGBeMES/vxVPOSjlUtIB4
	bg6PZlZhCY5AYzhl9U1WYjkeUHzlFfKJ75sO1goOPt29LnKpHQUYTEeLZKiEe7S+XrofMGGvl+B
	z
X-Gm-Gg: ASbGncsYCMMjYl/BcRXjjvLYrjsG3NW7NvryyYMtmHeIryMU/IbGhAV2T73pkF0mcCe
	u7c1PmzQxVtcBqc6TRZCfOJ/TCEBf2l3Oc2qV9D8SdgdrZlph4ScEK2MHI5X5is8AOT8bF/c8Ku
	7HXAfipl2rs7jIE8XGsVoE5uFgxsXc+RLWVf2vqrP9ngtl2AUV1swBtl9xV2sXdJ2hfkEH2DHop
	rHI+mbGZI/ze7fNf+uVFLtRXsjeZ3LETGQFllUdH6ahZo/jPNV4GdVHSx98nWDF3xY+Cfs3ojUv
	T287jLz3uO/FKLWAGzpk1NqJiQ3zuvp0ZzQ9Inmk/nOQB1O9KIbpnrSsGn6UCqmOPZGLxJDDow=
	=
X-Google-Smtp-Source: AGHT+IHdTJTCvKT0Leh14IqIu1f6w79/wIQF7fOjOvPGDiTv5kzNl/uciZ94D98gtvZIVkUaXFNceQ==
X-Received: by 2002:a5d:584f:0:b0:38f:4acd:975c with SMTP id ffacd0b85a97d-39c120e0a93mr12083196f8f.27.1743583840592;
        Wed, 02 Apr 2025 01:50:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e393sm16558448f8f.72.2025.04.02.01.50.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:50:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] stress-ng: upgrade 0.18.11 -> 0.18.12
Date: Wed,  2 Apr 2025 09:50:37 +0100
Message-ID: <20250402085037.2340549-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402085037.2340549-1-richard.purdie@linuxfoundation.org>
References: <20250402085037.2340549-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214232

Add tag to SRC_URI to verify SRCREV.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../stress-ng/{stress-ng_0.18.11.bb => stress-ng_0.18.12.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.11.bb => stress-ng_0.18.12.bb} (91%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
similarity index 91%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
index 2b1e306b17f..b1cfdc371fb 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.11.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.12.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV} \
            "
-SRCREV = "44162bc4e00d06d366436857093a276ea692711e"
+SRCREV = "d4eef982dc98fe915aa82303c0a24070d0a51b00"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"

