Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263A5C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 19:45:06 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.22721.1635623104859033458
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 12:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XvWDBqFI;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id i5so9058300pla.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 12:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+01axY3BUnTLeEF1h5oiVCbJt8qtp/T7VVAnguMpLzY=;
        b=XvWDBqFIg2wMu1mflXyOjGqKvNDV355UjDFXNQf0HoTa78ESQa9ZFu/Qj/6Tobgudi
         iZ3qz6yBBiA0BKfWhRCHjnrijBZcisvFT78XZJEbkJcYQBqnih9qrIT4kN2vPd7o61cF
         oBQg/YcLFLzBm6+33GccGfQxvFKWcyFTmSE1RMQqhx5cnW57Ji9rTgZZZ3T7REshRoQm
         Gl3n9ftRZ/XZsX0eB9hP3O1X/wyKu/NXWcgkxCP6vdPw1mxaFbWQuJ+UAnSbt0GjsJcZ
         4d1I6X/yvG89/VHO36LuKBApbTd+N/Ck6sPAOP7hV9RWk6VUZhXE5G2ZANRgnXNV12ff
         iyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+01axY3BUnTLeEF1h5oiVCbJt8qtp/T7VVAnguMpLzY=;
        b=Tb2X02BCYZeV8VhE6OwG4h12NbCEhstxTZrVpyiHSXJ47zPOexXs0JOebur5tHt5NN
         tEauXW/pqO56+DTC9PsMp/ZzvOOTUefngI4P7w5Od2xfunQc2F6Pb5MUqqAJpOLxS3yc
         Q/Q0+WBJ2bv3GahwH33f3wfR7R7MeIDAYQv0SuE0aBE+IpyqtVYSIYlNv0LOyW6rDLdj
         MCPmAE8fIuG2WI7chGHvWXiLodqQJNLkK77EpMmlZ2glihfNX/RCMenIijNFPlpQWn4W
         7/bwCgBBrBdqPAQWvroUuWuEQ9kQ2wQHqgVIbxxSmab3wBikHXLcwzIuF4paQZfgBcVa
         C/wA==
X-Gm-Message-State: AOAM532G81/kbcRBkF2Qms4SnROIpeH0hZTa6nx0upQh1goK23NHDIZf
	N3//bHF2SNHB2PL6r3oTVtErk6BcsDM=
X-Google-Smtp-Source: 
 ABdhPJx9Pm2BGRt82QFBUlBvMTKbugt9PqrlTB+9L3sVxZa+cc35MnxyLpOWUUKyqjt2mQ9HDWOaRw==
X-Received: by 2002:a17:90a:930c:: with SMTP id
 p12mr28179603pjo.176.1635623104077;
        Sat, 30 Oct 2021 12:45:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 s30sm12214612pfg.17.2021.10.30.12.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 12:45:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	lexander Kanavin <alex@linutronix.de>
Subject: [PATCH] wpebackend-fdo: Add -Wno-c++11-narrowing
Date: Sat, 30 Oct 2021 12:45:01 -0700
Message-Id: <20211030194501.2751905-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 19:45:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157648

This commit https://github.com/Igalia/WPEBackend-fdo/commit/e4c578f23359dba4d5abbd14b108f59e1b0701c1
causes this warning due to int to uint conversion without static casts
unless its fixes properly by upstream make behaviour same as g++ where
this is flagged too but only as a warning unlike clang which is pedantic
and enables it as error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: lexander Kanavin <alex@linutronix.de>
---
 meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
index ba6c54412a..4a18467ea4 100644
--- a/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
+++ b/meta/recipes-sato/webkit/wpebackend-fdo_1.12.0.bb
@@ -15,6 +15,10 @@ REQUIRED_DISTRO_FEATURES = "opengl"
 SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
 SRC_URI[sha256sum] = "6239c9c15523410798d66315de6b491712ab30009ba180f3e0dd076d9b0074ac"
 
+# Especially helps compiling with clang which enable this as error when
+# using c++11
+CXXFLAGS += "-Wno-c++11-narrowing"
+
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
 UPSTREAM_CHECK_REGEX = "wpebackend-fdo-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar"
-- 
2.33.1


