Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C130C52D73
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 16:09:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.96520.1722614955713166553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 09:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PQTiGZMO;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f04b3cb33so18165287e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722614954; x=1723219754; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjn10oaT9uCt5hLXBkkb8CiMjflgp3j5xjfpKiGVrZo=;
        b=PQTiGZMORcDdfAkBDa1POhBfqf2v9pcKhD8eSXFIscdVBz1D8XGX35D1HjCp+YCVw3
         C9B7w54AsQqqiJG+ErqjoLyXaf1WBszQvyWRQf0XZLPJHeNQZkGfdrelj7dF9xkhCMIc
         Ej5ih47LY0MA19IH/gh4/SDzEtyXz547upFEhPC9vezO5EfIhR9NNjgSKSxV5Lv3j+GH
         CynXnFPCYtXNCSqZObHOAjme3cTi+ikoKxqWy8c/iAyps6sAVGzeg3ReiPaTCLaSuEuW
         vIL4AiR7hyKuoEya1AeAKAihvI2s/vBfxEWflp6mUpE8jZcRmF0Jai82wHJXSVZYbrUT
         GAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722614954; x=1723219754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjn10oaT9uCt5hLXBkkb8CiMjflgp3j5xjfpKiGVrZo=;
        b=EBm6al4NqpTf5OLmCxZBQtOTVkcrxtgQRwgPCZzTlB8EOshmezOx4b9fE+AYkBCazI
         56kf1t4q4oz/JgN1k4KxbCeU7wd8Inmyo9CfKQs3Zb9HcmC8hdKb7qvywXQfRyKYh2Mc
         /u/HEeVIC9Eajc9Xsn0qH94uss5zCCbDboWApMhXR9ZK/ozN9mFjCvQe8z7kD9sCsIyE
         w4vWJjqc2REu8bvBPiekpwT2d2xCchsQ28AOpcT9qamx+hW7WqNh7J91/D3+rc8+KjPs
         F+7hVKP5FmwJKil6WYyIhQ1n5svRB0vTQgw8dOviz08fq+i+mPIbY96SYPecSoQFhNBg
         vnUA==
X-Gm-Message-State: AOJu0YzIzaUUVRKJZpsFxE77/n4i84xN6TAjkBFujX6Y3uqsMilAY6j1
	uVEwg4i4s4L2psrQiDKA4u+9Clqxmb4tfxllQipCYg//KsJclBRDSwYhON9S
X-Google-Smtp-Source: AGHT+IFdkHppUvxOrh1yu1auglkWRzI7nh93r/RFc5vO4REJ96iqqrSjoQjWc12yFuBZWaZ6ozxmvQ==
X-Received: by 2002:a05:6512:2387:b0:52c:d5ac:d42 with SMTP id 2adb3069b0e04-530bb373067mr3324719e87.9.1722614953401;
        Fri, 02 Aug 2024 09:09:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e84340sm114289866b.185.2024.08.02.09.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 09:09:13 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/4] ca-certificates: get sources from debian tarballs
Date: Fri,  2 Aug 2024 18:09:02 +0200
Message-Id: <20240802160903.2800657-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802160903.2800657-1-alex.kanavin@gmail.com>
References: <20240802160903.2800657-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 16:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202924

From: Alexander Kanavin <alex@linutronix.de>

git repo no longer has tags for recent versions which means
we had missed several of them, and wouldn't be able to get
notifications about any future releases.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../ca-certificates/ca-certificates_20240203.bb | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index ac0756471c8..eff1d97bc5e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,26 +14,15 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-# Since there is no TAG in the git repository, the SRCREV was determined
-# through comparison of the git repository and the data on the following
-# package informatin pages:
-#
-# * https://packages.debian.org/trixie/ca-certificates
-# * https://packages.ubuntu.com/noble/ca-certificates
-#
-SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
-
-SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
+SRC_URI[sha256sum] = "3286d3fc42c4d11b7086711a85f865b44065ce05cf1fb5376b2abed07622a9c6"
+SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
-
-S = "${WORKDIR}/git"
-
+S = "${WORKDIR}/ca-certificates"
 inherit allarch
 
 EXTRA_OEMAKE = "\
-- 
2.39.2


