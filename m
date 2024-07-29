Return-Path: <troth@openavr.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5CCC3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 12:22:46 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web10.54716.1722255756849760977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 05:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@openavr-org.20230601.gappssmtp.com header.s=20230601 header.b=HH21dVSF;
 spf=none, err=permanent DNS error (domain: openavr.org, ip: 209.85.166.43, mailfrom: troth@openavr.org)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-81f96eaa02aso95765239f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 05:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openavr-org.20230601.gappssmtp.com; s=20230601; t=1722255755; x=1722860555; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lPVxDh+tzP5forpz3q3pp70I+KVY4TfR3cB1EZOaI68=;
        b=HH21dVSFXDmcNo1PPqbIYDynVBrZU4Ou6dX7rrFNKo2G/S6OcSHcdebcb5sfVWt4VU
         fc6SmrxRbP8zF+BtZ6/jC8wZM+H8ONRUkJpQJ9IHnOCBe4YuJxmeLV1uU95CEofzE/MR
         p7/56hanqimkWVhZpL48qSItC5ffw8R59WG8snGZOY0AICtToVRwuiwAV6RCrQpYSZ3j
         AeCNlxrbjMtTtaPmheiPJ3y9ducwWAGyDZiUJ4WMRKvPLx+iSGG+TPhJGXrMHmj/i2aj
         YxaBv6MbrzbcuTwyYGsINlosYZTNfjQwo6iy+AmqyQH65Tx8YKfAV3LekpWqXFUye/pB
         CuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722255755; x=1722860555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPVxDh+tzP5forpz3q3pp70I+KVY4TfR3cB1EZOaI68=;
        b=v6Gt80K6JhebJUjj6EdSxwpapt3+vms3/wnK7VGlsoxCysnFkxBTtm2yO48Gg7taMw
         38M0edIlnZhPHEl7e0G59XnuPVR30S9RS/Y3tLMwOH6x2L5is1tp4yiGOVc/+0tCSVsz
         ePqEENKE6PTnOcC1pwN1XPiN4Mux9YDJ8Adt8UjPjoUkS0GSQx7tN7XJ38sTSU8+SsSh
         URL7HSg5lAwCWDqqgfUE+mxaXzXzvAsAWSUQQmRyfj+Q7lx4c9pt+q78uiu+K6kalmgm
         LQnJnMbUCF1ffz4oWyhJV+eo4pztuQfwCfz9BeUAZkpzn7ep05MNUXGPqoTTlOkiqX8h
         BnkA==
X-Gm-Message-State: AOJu0YyvcJqMM1XrkiGSBGcvWsn3EKHYUv1nceF0xfKG+nlxQwgnd8Gw
	jYyRXQjUiZiYh6/H6pDoiabH6KJYV/298kDu7jZAZ5yHfHw/Lio3UJiboodD5Vv9CSB6Cpdnsr3
	MCJg=
X-Google-Smtp-Source: AGHT+IHOxU5J2g1nKSLIr0U++WJ0eeub1Uh5pXlIJylRhbEKgf2BiicuoQJu/wRs4/fjNPexr4ZGjA==
X-Received: by 2002:a05:6602:6405:b0:81f:9215:80da with SMTP id ca18e2360f4ac-81f95a515fdmr727333839f.4.1722255755249;
        Mon, 29 Jul 2024 05:22:35 -0700 (PDT)
Received: from beast.bozoland.org (71-211-135-194.hlrn.qwest.net. [71.211.135.194])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-81f7d7febfcsm291665639f.35.2024.07.29.05.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 05:22:34 -0700 (PDT)
From: "Theodore A. Roth" <troth@openavr.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Theodore A. Roth" <troth@openavr.org>,
	"Theodore A . Roth" <theodore_roth@trimble.com>
Subject: [PATCH] ca-certificates: Add comment for provenance of SRCREV
Date: Mon, 29 Jul 2024 06:22:06 -0600
Message-Id: <20240729122206.8396-1-troth@openavr.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 12:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202612

Signed-off-by: Theodore A. Roth <troth@openavr.org>
Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
---
 .../ca-certificates/ca-certificates_20240203.bb            | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index b198ea77a9..ac0756471c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,6 +14,13 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
+# Since there is no TAG in the git repository, the SRCREV was determined
+# through comparison of the git repository and the data on the following
+# package informatin pages:
+#
+# * https://packages.debian.org/trixie/ca-certificates
+# * https://packages.ubuntu.com/noble/ca-certificates
+#
 SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
-- 
2.34.1


