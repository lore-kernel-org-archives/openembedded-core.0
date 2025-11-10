Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB45CCFA1E
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 10:22:13 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45257.1762770129089250491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 02:22:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ndOh7mDm;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-343514c7854so2561380a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 02:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770128; x=1763374928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsH5apOwNefFtNHK2Dbc4/dutooe2JAS6s7qJgK2BxE=;
        b=ndOh7mDm7ncSziudjzFEduWmPGMiRYFXM3nZCtg+VaFWSzi9lJF727Yh/Yi5L4C5HS
         TgGIEfWjDNRQUABYAQ3BtN9OxUSh98D7CWDt/12kevu0Q1KLgWH5raHarWlvx6hzHAkP
         SuUMVlg6S3HtMxMkb0zHUkymmiwOhBAjoEcn9TvqTGuqF5YNLGCP+S7z14Wqjr0pmOML
         sRQid1XxduLyYVsvK1K6zDw/opkHJ8bi/SuQmMH47/YhTStauQm5yB+JFg7ef4ZiDxc+
         oyDp6p29Db5f9/BSaGM98Kwlvbl3AyNNJneeSoE+XUqh6SiOe2FeP+9SLl6jCpRbYb2i
         EQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770128; x=1763374928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WsH5apOwNefFtNHK2Dbc4/dutooe2JAS6s7qJgK2BxE=;
        b=EG3oJEf+5JaazdiHfJGqeUhc4vf6rWkWaLQ8/3hNJNLq15QR85nlj56yAjs6OhtgCc
         tYaMh8Terq61IHcf+Vpab9lPVrJO4Vv8pkjPzYZxZwhk19sIgGZFd9FZPy0GLiS9KkzI
         aXcAxLj2/KtEC+L8lkg+c9OhwBLj1lTzoxjQ5GrCmQeQff/7lj93Qw+Nz3r67TyJoQBt
         rqc0uK6Ph/IuUMh7llsKbLe1IYwhFACGdCu0vZCFL93flom6V6QIYHT+ae+Kc7Tfh8k6
         I++BJYrqdUDdmKSeOAx0L9LkjWqvzC1NZ+Un8CPvSbQmf6aHwtrjjUIIgfP1xCHqqq64
         aP1A==
X-Gm-Message-State: AOJu0Ywd6pmKERuI7XGhSgV+poAN1TPHODR5uWssdf5HoyjS91JmlJzR
	tehV5JwKO9gzUqRXK6rCx+D0VsAkyjJDSJWMQoF+civy9RMebUx743yNCP1jug==
X-Gm-Gg: ASbGncu6jGogUMEg8FnxNAV8zQ9dwqMJ32x7yqvGmtV9zhnoakeLY5w9QaXXJRleq3z
	nRNuQBuRV1jYMgqnoCVcCSzT/KrT3NDsIgLvjbDpCPnYqG0PPwYXXnfkFOEaI0FpWs6N8BYd+0J
	1uPGrPydSbluanOiUb0bdmJeDxGeYUM4QNDYUyXs6c82v+1ACSoc/YEFewGCRpOiC+g9cbyYxyp
	3ZdI0tOetpWszY29+NCUpPEANT2KCS12gi1Arv/+93JybSYb0/YZYUzRc0ZCAq8giYaq8u/8kBb
	EmXKFnHfQz+dR97dugA3m6zmhUB9RWcKop1MmQ7cVnQoQN9jcwR09aveV58DyC767l6Gqb0T0b+
	+JJh6IEizEgg4KwR9zO0++wj10iJe/L7dMV8xeg8GImhXzl0EnnDtv2ykDe2j0aomXBdCddvMtZ
	wkmcVQEqJ4khr/Ug==
X-Google-Smtp-Source: AGHT+IGtziW38wEUTv7sy0C0lkUcQf1kwJ3bgKjE649FoSCJUJ9AqeROgY3UdxJNlLK0Eq/AlhaAnw==
X-Received: by 2002:a17:90a:ac0e:b0:343:747e:2ca4 with SMTP id 98e67ed59e1d1-343747e2ff9mr6508226a91.9.1762770128325;
        Mon, 10 Nov 2025 02:22:08 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343705c1354sm6999894a91.18.2025.11.10.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:22:08 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][scarthgap][PATCH 5/9] ca-certificates: get sources from debian tarballs
Date: Mon, 10 Nov 2025 23:21:43 +1300
Message-ID: <20251110102149.2915435-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
References: <20251110102149.2915435-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 10:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226108

From: Alexander Kanavin <alex@linutronix.de>

git repo no longer has tags for recent versions which means
we had missed several of them, and wouldn't be able to get
notifications about any future releases.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81f013fd1312551628701bf36ac62746a2606dbd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ca-certificates/ca-certificates_20240203.bb | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index ac0756471c..eff1d97bc5 100644
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

