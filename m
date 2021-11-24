Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CB6C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:14:42 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.4152.1637788481703478404
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L1AzNEqy;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id t83so5022654qke.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TN3Bcp8ldqIDLA16zfQ0BYZCX4gz/FpebwJfEcYTOSk=;
        b=L1AzNEqypG4FSSUB/AbsOMJzRCo5PCbQU9YkxV3Ybbrh93jXXW5TdrMkF1EBOQ2lvV
         1cjr0RskdGNJiC1tmP/9fTnhmZJseHM/he2NCzBeTnBl1hBVYSUvquGbo1eLTk+EciOD
         c3caV7H9nFpkEj0NpiGm81wJ7T++W/IJrGRacaXHni5DjUXR+S+Yafl8prODxIjCAz+N
         H7++fiQmQSHdnl/JQRUl2cZL+0MosbMHLtHbV/BksXRcTkU16kPmipAlzF4ycD1lzM0Y
         8CDsDmrMoyEqsOmuf4n9wS11AsWyWeN9KttqPlWOjoIC5lk0lfgDViHIS8SAFOE/NmY5
         ItkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TN3Bcp8ldqIDLA16zfQ0BYZCX4gz/FpebwJfEcYTOSk=;
        b=2fy8mWAEHAEuteICt0w4LLoZs5Pb7KDbiCSpK3TQBvf4oglacMkL4lCskWyavtGFzS
         32bYiYQizFkPa5+3Dr9Vouqma4Ou9Ta43aBvXScUd5jz7M+KPMqrM05uziJLeGLmdRx8
         beqTMfA3QOyacofJrGYYu3DS7blj2/yBthmFJSbduoxiYbr9lhPtg8Bvw6XA2HaUNd6L
         YN9kqYNgYBba7va5aGcoPFd+Jwvo1rRupqfDH3dBufXxyKxfuRolYSK8F7Wn6PJxHTnl
         do2dTT2sOpNVjrabJSnj68RaWBFKRyfyJmCxJ2NI3gmU8y5zXCm7myXfYhuanslYrqUb
         fPtg==
X-Gm-Message-State: AOAM5314jh+syZ8ZY+kRG26Tf8pGAajQBLAVZ2z4kwhK0w6JjimITlY3
	M5XV+SQ5yY8qnA8Sucg6MP8=
X-Google-Smtp-Source: 
 ABdhPJxaYgzKpytbupT9oLCSGGQZtqk48xc+jaDwFu3WA3iraCRfpuKBuy2CQtnsXtwG5Nmv7zQF4A==
X-Received: by 2002:a05:620a:460e:: with SMTP id
 br14mr1516357qkb.533.1637788480827;
        Wed, 24 Nov 2021 13:14:40 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u9sm495095qta.17.2021.11.24.13.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:14:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	TicoTimo@gmail.com,
	trevor.gamblin@windriver.com
Subject: [PATCH 12/20] python: import rfc3987 from meta-pyton
Date: Wed, 24 Nov 2021 16:14:18 -0500
Message-Id: 
 <f1e0b75f0b21bc05d08d234a5895adcf6e04a04f.1637788184.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1637788184.git.bruce.ashfield@gmail.com>
References: <cover.1637788184.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:14:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158758

From: Bruce Ashfield <bruce.ashfield@gmail.com>

rfc3987 is a depenency of jsonschema and dtschema, which are being
added to support kernel device tree validation.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb

diff --git a/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
new file mode 100644
index 0000000000..80e2aa5bc2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=9;md5=2b723edf67b2f3088bc5e339b1ceda2d"
+
+SRC_URI[md5sum] = "b6c4028acdc788a9ba697e1c1d6b896c"
+SRC_URI[sha256sum] = "d3c4d257a560d544e9826b38bc81db676890c79ab9d7ac92b39c7a253d5ca733"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.19.1


