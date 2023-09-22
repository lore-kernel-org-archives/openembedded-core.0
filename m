Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F91CD4942
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 07:24:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.16345.1695367481713024570
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 00:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R98Z4bHE;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so28525531fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 00:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695367480; x=1695972280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HfJVBVGXQ3wnMBuPQ0fAzinMnIuoi1MZAb/z0AeQ5A=;
        b=R98Z4bHEJX7w7iLipRo1B8kSNSlJxp0x2Mj4blL9n/DCuUr+s0mB/jyLZAHsLuWvoT
         3xJ44NNO8rSb/fW7Z1ym+bQudf5iBvb+THiMPH7y5PiNUjhYOq+TH9LlqtEqBD6CmpM7
         Fsj2I8uD8s52xDnpYYfCdoocpafoUOivE2PvrwWXHoN0W4kHSg2ognVccCEENdJ1w+RT
         1JF2CXncf/xy/KOlytU1MnO4sS39XtvdwzeO6NY5geAoyrw+NqKymT53B2ImqUOlX1YD
         Ji3JzOqAFHCwUQufbN76aCzns5wa1bK5frYTgC5MHLOFi4HP5QtYkPG96jska0WOAaZS
         JcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695367480; x=1695972280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HfJVBVGXQ3wnMBuPQ0fAzinMnIuoi1MZAb/z0AeQ5A=;
        b=wEgkAZjzxBJBgg+S/re8lrkWlmI/3jBJv3kDrbHMgmOLDjgus90GSryS8XejiFmBAj
         33EV1oz2+6m7vUdGJ6/zX4VoINOjqMJqypXA+4a/boSRtpr54DMcQiN8BVro25Qs6bBd
         FHYqkI6V1Qf9uv32Zz3zH0GDU82nxDmrVGg3S7o/AYJArwagybsBggmQ8+fJyB1vyuKd
         h7zMk6ZTVbRn9bXfAEecCSrlF/WBTxmsUCsOlkBBqXE61rtM11uzfBjtAenaCxBeVSiU
         MwImvhfPSyWkLXzOPDcc7ZsIQSfLizXijaqziUE80h6dCbFWWus4uzbKkyJclGtkCVL5
         mV6A==
X-Gm-Message-State: AOJu0YzZqbFv//ZMmlLDFnh7joBxFNO8driZXXGXK+HWu2FxOUPzeSxL
	Ukcfvr0DAOE4Z4r/6TFOzBQXRBiQf04=
X-Google-Smtp-Source: AGHT+IFhYKarsKYG5nrNM7iRvgck5zb1u3GnmzULsAn29o2Lqz57wumjYJ2j0Vrf/Oc6yByhNh+yVQ==
X-Received: by 2002:a2e:80ca:0:b0:2bf:ff53:556e with SMTP id r10-20020a2e80ca000000b002bfff53556emr6719887ljg.23.1695367479701;
        Fri, 22 Sep 2023 00:24:39 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id z23-20020a170906435700b00992f309cfe8sm2311330ejm.178.2023.09.22.00.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 00:24:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/40] boost: upgrade 1.82.0 -> 1.83.0
Date: Fri, 22 Sep 2023 09:24:00 +0200
Message-Id: <20230922072431.1481743-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230922072431.1481743-1-alex@linutronix.de>
References: <20230922072431.1481743-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 07:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188053

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../boost/{boost-1.82.0.inc => boost-1.83.0.inc}                | 2 +-
 ...oost-build-native_1.82.0.bb => boost-build-native_1.83.0.bb} | 2 +-
 meta/recipes-support/boost/{boost_1.82.0.bb => boost_1.83.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/boost/{boost-1.82.0.inc => boost-1.83.0.inc} (90%)
 rename meta/recipes-support/boost/{boost-build-native_1.82.0.bb => boost-build-native_1.83.0.bb} (92%)
 rename meta/recipes-support/boost/{boost_1.82.0.bb => boost_1.83.0.bb} (100%)

diff --git a/meta/recipes-support/boost/boost-1.82.0.inc b/meta/recipes-support/boost/boost-1.83.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.82.0.inc
rename to meta/recipes-support/boost/boost-1.83.0.inc
index 39d3c9ce5da..da275f18c1f 100644
--- a/meta/recipes-support/boost/boost-1.82.0.inc
+++ b/meta/recipes-support/boost/boost-1.83.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "a6e1ab9b0860e6a2881dd7b21fe9f737a095e5f33a3a874afc6a345228597ee6"
+SRC_URI[sha256sum] = "6478edfe2f3305127cffe8caf73ea0176c53769f4bf1585be237eb30798c3b8e"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost-build-native_1.82.0.bb b/meta/recipes-support/boost/boost-build-native_1.83.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.82.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.83.0.bb
index dcfb65e3d6e..a345bac4999 100644
--- a/meta/recipes-support/boost/boost-build-native_1.82.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.83.0.bb
@@ -7,7 +7,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/boostorg/build;protocol=https;branch=master"
-SRCREV = "9f488e003a568dffe0caed05d86ed6f1a8f8c7f3"
+SRCREV = "8d86b9a85407d73d6e8c631771f18c2a237d2d71"
 PE = "1"
 
 UPSTREAM_CHECK_GITTAGREGEX = "boost-(?P<pver>(\d+(\.\d+)+))"
diff --git a/meta/recipes-support/boost/boost_1.82.0.bb b/meta/recipes-support/boost/boost_1.83.0.bb
similarity index 100%
rename from meta/recipes-support/boost/boost_1.82.0.bb
rename to meta/recipes-support/boost/boost_1.83.0.bb
-- 
2.30.2


