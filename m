Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A192FC282C8
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 17:40:21 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.17126.1740678018524269976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 09:40:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FjrqCYdf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2233622fdffso25284005ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 09:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740678018; x=1741282818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TRwN2MfLDO1JAUT7VmboEanvYgW26znIBLr6Qcar+4=;
        b=FjrqCYdfWivodlusXa/Dk1y3JLe35ZUMZpKessHt5ukL1/+isPe4xAehw01iOpXrkj
         2NoguAgsR5FZ6PLObC2viojrGipx9qCfJo0iKh8owyUw600JK8aXCNCujSlLpBt0TYYM
         83PPfCELsulgxvWdcmn4VWCeJ2sHjXHN4LcB5bsmYKcQhpJbyEV5ffHZAxiM+DXDAwAD
         Cr8oJbZW9WL3yPUeumWZyqSZZKvBOnbF9cF3pmbg73U2QjzoE02HAJCoefoU8ownIMJQ
         wDo7sEIMImYw3+72pzBYo336rJJejd3QWt64ZhKrQDYbmxMPIoV6rgo9m9n1K7PLvPlR
         xylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740678018; x=1741282818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TRwN2MfLDO1JAUT7VmboEanvYgW26znIBLr6Qcar+4=;
        b=VuecJmmYWkZCy2smH9Fp+/AeUFQoxVQF+mSB5DtlRlotBt+VqQKUIkmxroVsnzcbd2
         pOTGlBcrKmj8Got6QRYk52GUbAHDqn82sL5dX+/X63exrz763YYOhiScxW4aMeHS6Hk2
         RAr9egue0wPINYjXk4w+brocExX0d1HGdJ5ucvdgq2X6RF072MaL47PQPYp0efhEm9Qi
         JSNCfex0JPhvxSrZGDvN1LsUX/3+poQS28uI63zIlb8S5GgFYq+oue6fem2BXDHR4R5Y
         RZvX2qIWITz3L2vvQWdGL4HNhYbOuhXZgJ3mknGJxnbwtQVdAK1RFc0VUhMtDCU4EBli
         BD+g==
X-Gm-Message-State: AOJu0Yz55V3JnEgXapysued6kvPKf0dVemr7hECzkcQ5pEJsMiopPHFS
	EW1dTiKt5mrLPtsTREWI6eDUo5YFGeYNJDuLneNU37DVP80CJYFPk8XDDMhMyIyiv80qw/9OjoD
	r
X-Gm-Gg: ASbGncsrkPXd/xVmYuIKKxqPEiIiN2j/FuHe3q+qLaf6cM0V+PEK7NPWebCUwQ2OfiS
	Td4lWTsG3xt52wrwnlXPN/neH3QBpF+zo6Vuf9InbeRsdEPwBEYCvDeTkknhcnG66Uen4fZDq0n
	7SbKx0utozQZYThMot1z1Dny60pZ3DU7u2SqiaXlCbELF6J2A0iH5KBFvVIIOrAFm13n74LbsDW
	Roj8VowzhZRwy1JjMqisW7+TYl5VC+ejnIYQcAgcZPx9ZGdbJcnVg1KK0B+76HTCHx6MpK82W9y
	IyL9zhOiiE5b7u9npw==
X-Google-Smtp-Source: AGHT+IHhFlEr+wGLnI+28C240xdQ/dPIhzTEGECVjHpAT6ifeKzsqEP0b2YndSh4fxw0uw4a7vz/KQ==
X-Received: by 2002:a05:6a00:c95:b0:732:622f:ec39 with SMTP id d2e1a72fcca58-734ac33c481mr408652b3a.1.1740678017809;
        Thu, 27 Feb 2025 09:40:17 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1dd4:58fa:4fa2:f901])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a00249c3sm1914727b3a.85.2025.02.27.09.40.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 09:40:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] boost: fix do_fetch error
Date: Thu, 27 Feb 2025 09:39:46 -0800
Message-ID: <3b4c5ce6b89477307f3a2c30c7e275473b0c9f00.1740677838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740677838.git.steve@sakoman.com>
References: <cover.1740677838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 17:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212033

From: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: boost-native-1.86.0-r0 do_fetch: Checksum failure encountered with download of https://boostorg.jfrog.io/artifactory/main/release/1.86.0/source/boost_1_86_0.tar.bz2 - will attempt other sources if available

Signed-off-by: Jiaying Song <jsong-cn@ala-lpggp7.wrs.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

backport to kirkstone.
Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/boost/boost-1.78.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.78.0.inc b/meta/recipes-support/boost/boost-1.78.0.inc
index 729a47b54f..98f4f7ff30 100644
--- a/meta/recipes-support/boost/boost-1.78.0.inc
+++ b/meta/recipes-support/boost/boost-1.78.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://archives.boost.io/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "8681f175d4bdb26c52222665793eef08490d7758529330f98d3b29dd0735bccc"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.43.0


