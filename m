Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554BFC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:45:02 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36764.1786081495544183023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 22:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kj/obF03;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fecbbafdaso894240f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786081494; x=1786686294; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UamD8LC9Ob41ervZlIjlJNXWuPpzE3H3vVphI7AEY7c=;
        b=kj/obF03neRFgBMeTrwOu1lOpRwjJvkk+8KqryCMXfQJMVD4AWfPWiv7SL0NFfWl+1
         aI/mWG9iPHcatHjb9XqFqxAdmvnQY7Obw+vhyyNgki9xTtEiTB5Rkr2CBp9Nf6WrP8Tt
         PHnm98lBGqpBxIPJHR9MlHhndgtbTaaouUy8WNkbDuTgX7zx3Mtu8PQK1CL7SPWlg0Hc
         v+XA5PL1w4LjAzPHH5T9VTcjHhF7YVps9gzG2tI+O+BGbUqhXSxZBLG3DencWNFXHUmh
         qUzHjtlbhdMcyzOP8pxrvfqejL+X/jJ2QRgtDwDWLokop5BthdfWskLnXjAnQjBQZiOj
         MH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081494; x=1786686294;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UamD8LC9Ob41ervZlIjlJNXWuPpzE3H3vVphI7AEY7c=;
        b=BJuvsHSCFA9/TDoTai7NXxdonjfBCIw6MRWNxihVX1b/ir1dWUQvQ4thLmngIFL8hA
         usyZHwlZqUkPa1BKj6Z1f5RS7x58/fTQ2n1MzGpneJFtC20qwCSikwPeR1GLyFImpWDA
         E13+UckmSwOI2OFdt1BenJMAYyQKf4+jRTVHivOUc3Xsj35WznQRMjBTJzVNKg7A8gPS
         fVzwb8/GGiWKfbfANsct7U2RwofW05PIdIzQ6BVsFUycC2sHTSMjaljtCwAju0ApOwyO
         YGPVsIF0fC6h9rsNBoStCRfVoWbKedFeUXduyDLOPQx3tDAZ7vORNIxo55L3JOhiP8cB
         YU1A==
X-Gm-Message-State: AOJu0YwHyPxPfjjSvPu9YW6wJ6FtMbva8FDPOh51cm5Zdlpv/EtD7rLT
	QZ8QKakJ6vxhMEYZ1yOLBCne781S1HrMmNcbfeRyHseiwgQIRnjySdUmlHQUiA==
X-Gm-Gg: AR+sD12wXAzyoLKZFapoBerR7ZeUeOzBFn4OsNYfYFyDNf2IR7hCVd403vjHJLrGqS2
	5BUKqm5QdmFEK4Q23QmOndvTFdVASmOf89k4o6J/cnM3T4McbubTQrrM0oFWeDMl+P+qfBZkZrP
	dbMrPJZOg23draQ/bRXSuuviMzUnbvfObw7hZr4C8qaFQWjSImO9X106vpB8VD1uIhAt22BDHxO
	GZ6J6cPS2qgPK8g5hfPJF/IVsRtlGJJKkltEMF4AMPbRMuVZ9YUx8gbC2XkIcsHH7acHXhjFG8A
	Hr9LyKAMI+95WqcEFeLOC4XOXdG8a6m2+gH7tDgDW9Z2ywKjYnLA7uXNFKMt1ES33ithYus7OgN
	1rGFZRUQTPjeJxSezBV3pO0STF+Fr3Cdtb1RRhNAFThF6oOzH20uXrvs/RK2UoV2IctSdXlRGRO
	oEuhqdtCZ5qZnu11nscgvmD8wNM7HP/yR8rSIElYBd2IS2846NNcy8qK+ZsGEn6QdVXpjoxpw6c
	a7dflWTvxgrzb3MFxnJlyMdZTtj+j8qC4r4cwmRc3wTyZBQppqX1ReSaQDbuprjEXuDkfwa2rQH
	IxFqQS33T3RJ6nn/dJdGMKYdbA==
X-Received: by 2002:a05:6000:186a:b0:47f:97ee:f1d4 with SMTP id ffacd0b85a97d-47fec512785mr30905791f8f.9.1786081493795;
        Thu, 06 Aug 2026 22:44:53 -0700 (PDT)
Received: from 2A0011100124613F533917970D022288.mobile.pool.telekom.hu (2A0011100124613F533917970D022288.mobile.pool.telekom.hu. [2a00:1110:124:613f:5339:1797:d02:2288])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm2743096f8f.18.2026.08.06.22.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 22:44:53 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v4 2/3] mesa-libclc: New recipe for forking libclc for Rusticl purposes in Mesa
Date: Fri,  7 Aug 2026 07:44:47 +0200
Message-ID: <20260807054448.1301957-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807054448.1301957-1-zboszor@gmail.com>
References: <20260807054448.1301957-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 05:45:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242982

See the reasoning and discussion at
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
which was merged and backported to 26.2.0.

TL;DR: LLVM constantly introduces breaking changes that cause
regressions for running OpenCL CTS with Rusticl and finally
Karol Herbst had enough.

This fork is from the LLVM 22 version of libclc and contains the
necessary fixes to make Rusticl pass OpenCL CTS.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../mesa/mesa-libclc_22.1.8.3.bb              | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c5b701c244..feccf29ce4 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -524,6 +524,7 @@ RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mesa = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-mesa-libclc = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-mesa-tools-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-meson = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
new file mode 100644
index 0000000000..c93b5b9d9d
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-libclc_22.1.8.3.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Mesa fork of libclc: Implementation of the library requirements of the OpenCL C programming language."
+HOMEPAGE = "https://gitlab.freedesktop.org/karolherbst/mesa-libclc/"
+SECTION = "devel"
+LICENSE = "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=7cc795f6cbb2d801d84336b83c8017db"
+
+SRC_URI = "git://gitlab.freedesktop.org/karolherbst/mesa-libclc.git;protocol=https;branch=llvm_22"
+
+SRCREV = "87f66007242ff10e9e84bf32be84f9057f6abc75"
+
+inherit cmake pkgconfig
+
+# Depend explicitly on clang-native instead of using TOOLCHAIN as the build
+# objects from this recipe are build explicitly using clang for GPU targets.
+# We could INHIBIT_DEFAULT_DEPS to avoid any other toolchain but then we need
+# to wrestle CMake to configure without a toolchain.
+DEPENDS += "clang-native spirv-llvm-translator-native"
+
+# Semicolon-separated list of targets to build
+LIBCLC_TARGETS ?= "all"
+
+EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
+
+FILES:${PN} += "${datadir}/mesa-clc"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.55.0


