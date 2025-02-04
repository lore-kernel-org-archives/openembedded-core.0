Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E4B0C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 14:17:28 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.117397.1738678647054571947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 06:17:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qjwKbAir;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-543d8badc30so5914534e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 06:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738678645; x=1739283445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=qjwKbAirngTWDVGqsgIFAyHPF1XCoG2JhYorxwJVQMuVQyNPbDxSSs0zU6Gyxo3agz
         dAW/DfuSqlkRi9Ufv+8f9NUS2AybHLrUZnrzYVjZJPA0xM9ISQSFP65tLqh47NrCsROl
         2b5CueDSQKUq52a1CIYBU6aCdnpWLV22OceFax7MjD8WuzxuMjGwxsMVxHShPlwEZLzr
         M3GcU71O963ZbTLN/qBq8r09wzPal0Yk/gDoAcWaoJbvSLNFj/ZeVEThgHtmoAcp6vC2
         g/BFoYq+gd/S0aOlIMpH2TJWSLhe0HijMFHrcy/ymiA53O3vEgMP1jJVqrGxahaTAUfk
         +nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738678645; x=1739283445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=STJc855sjRAF2XD9UzVhClu2/kemU5PH8qtCoSz8MMs=;
        b=BdwE9rhUhGeXc0QV+zB7EBwDdRcMDJMIGY/cm8DbKPbWEO4dwR8C5v4rcfbE+ktn7M
         HD+fd6V9MiagxGxUdowZo3FLdXhbKrHjwh64BkQae6Fn2iyNpvEe6dgfmBS8TmtwNR0A
         tiuDimIoS5/gcsqrAfclGutdgGzQI+teQYJieb0rzMnGE//c0X98PkR3TWo+w4ZUuD8M
         NbIVoKHezXcswo2JjaIQmaYEKsUOIUWWKiT0wAiEul+gJtG3SygYCpDAgcV0zI//ntk3
         cU3vha2OKcq9UD3fuqkL3UV3zJw5evK8ZyXqI3t3/VPQ+RC1Sy9TZzjeXQChTySrVQFh
         w6vw==
X-Gm-Message-State: AOJu0YzEUzSNAblIRGzPCzYN1RGSoZdDkkb+tDf67/AD6+YPcsN46vaz
	MDjPMS1llJUuMYW8En/Z9aYzRRWKTayDUIwk97qZYq7lHpEG5+VAWivmmhs9OaTZc2yVO9z2uqd
	vJ8A=
X-Gm-Gg: ASbGnctzs4NcShJC1Wk14qzaUVlLcJPEjxe5ts5ehYEE69NgJykdTysaaJQ1M9mDW4X
	PsM3E8KXbQ0UeRLPKepQY3Vvg6pThEvy9e12n4+ayrkGmtNW4MkO6QJHJnci/q2s3Xr0uJ/W3jE
	9XnBwQv1E7WliOlKKqoyCXzu/1A3poCm7muvFZe+CdCd67bLDHViXwgTSOfMG2DP+1myrCQ60bV
	ZUbFm/RFN2EEUBSy9s2Z9DkSR3QrIMAV/x1f1mqEKxy+Z9SG8tsLmC5PbLgewlLAI/4VpxiXuM7
	CEfLf78Qdg6POwuSWDsOfvd+N+R8sNkQ+uHnRjFy8t8nAIMQE3HOAYQ8fFh6
X-Google-Smtp-Source: AGHT+IGfj6/LP0baABvdFolWOlPPVRaEZHJ41OW7n6cy2Zu3Cxwubw7MC8IMVBXCCI5d0NU7ngEE4Q==
X-Received: by 2002:a05:6512:1110:b0:540:2542:d89a with SMTP id 2adb3069b0e04-543e4c42c29mr8785142e87.52.1738678644869;
        Tue, 04 Feb 2025 06:17:24 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebeda2sm1603211e87.247.2025.02.04.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:17:23 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 1/3] systemd-boot-native: undelete but disable configure and compile tasks
Date: Tue,  4 Feb 2025 16:17:02 +0200
Message-ID: <20250204141705.1222153-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 14:17:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210805

The tasks were deleted and do_patch() was run after do_install()
which means that patches applied in SRC_URI were not in the
ukify.py binary installed. Mark the tasks as noexec since
they don't need to do anything.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_257.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
index 58db408dcf..5b4b63c294 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_257.1.bb
@@ -2,13 +2,12 @@ require systemd.inc
 
 inherit native
 
-deltask do_configure
-deltask do_compile
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
 
 do_install () {
        install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
 }
-addtask install after do_unpack
 
 PACKAGES = "${PN}"
 
-- 
2.43.0


