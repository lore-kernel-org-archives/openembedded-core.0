Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC4C5AE5B
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 14:46:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.51874.1700491594971403030
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 06:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DUxuXu8+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32f7c44f6a7so2971675f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 06:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700491593; x=1701096393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bZy+Gx0I3+tJrj05Rac0WLotK159bhY71sUU/vWKTQ=;
        b=DUxuXu8+vr8s+L4oR3iewS+abJJ9v3hlD3ouJ3YSV6i+1Szj382qbTVEFDwR075vH2
         vmG4BSI5Iu0OTmB/5Z7QChsw20ju/WosUzdCMSlxCA2sOZKUlx0c13O/T1M1efen0Q5v
         NgGricZsSAR3mV0eElt3DfFohDlOuhQsq4dDxL/JvFV2kheM1WspH9IZm74n5n75jbEV
         YJf1R87jy3rPt5VwZLp7/UVGFAxXs5bX9c2eMACPrKeDD5wAOpRN7yfUXCoRH2UV6ATB
         xP4TWfYYOnAN3YXyeA/F6FuI3lXrDEt7nktI0WGAqxfeDGpAe5QJbt0bLnYfiVVgr/l/
         C1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700491593; x=1701096393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bZy+Gx0I3+tJrj05Rac0WLotK159bhY71sUU/vWKTQ=;
        b=Di6mq85N4UtrkDEBBmO2YdtrYDFK++JYDTWXQtmuydZpcUA3JamvsUS5foseUMmAaq
         qY6PfmaOl8CylSDSOii379LLgb994fPDcpOCxBV6iWLMi7ND+TRFh251MFEOqo8qFbgC
         f0ErfA1PcoNOiUQo8YLnqf85GpHU1D6KpSIJnlANZH/MggRG+xEPoIFTW29IQs5cilng
         lojl5yM4J/deQ8m+2hbPZVWnYquMxNdWGxewlpsTMH4oSWoSD7VoVEWvFubBB7+ymjap
         UbGFKU+nqgLba4nKfs0YCUag4wmMuahEC8YKj8GWKG4MyvzneC74l6GwDE5JSSRcdeKO
         HBwA==
X-Gm-Message-State: AOJu0YwM+PHHBExdqEENL5vNczPF6H+8tceu6TTg8J3rpcWfT6PmOwmv
	7ro6ceK/suT5mfzUgL0eAk9/n4b+W1Y=
X-Google-Smtp-Source: AGHT+IEseORSoBfcClNDMM/SYXQVv0IcqbDcyV1xiIHGwqEneamH0KzkHJRE2KU1kkzkFumc9b0vMA==
X-Received: by 2002:a5d:64c2:0:b0:332:c65a:8f5d with SMTP id f2-20020a5d64c2000000b00332c65a8f5dmr2364929wri.35.1700491593237;
        Mon, 20 Nov 2023 06:46:33 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a18-20020adfeed2000000b00327de0173f6sm11454848wrp.115.2023.11.20.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 06:46:32 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] cmake-qemu.bbclass: support qemu for cmake
Date: Mon, 20 Nov 2023 15:46:27 +0100
Message-ID: <20231120144628.52664-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231120144628.52664-1-adrian.freihofer@siemens.com>
References: <20231120144628.52664-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 14:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190879

Define the CMAKE_CROSSCOMPILING_EMULATOR variable similar to what the
meson bbclass does. This allows for example to execute cross compilied
unit tests on the build machine when using an SDK.

CMAKE_CROSSCOMPILING_EMULATOR is a semi colon separated list of
paramters which could directly handle the -L and the -E parameters.
Creating a wrapper script is not absolutely mandatory. But anyway lets
do it similar to what the meson.bbclass does and also disable pseudo.

Further information can be found in the camke documentation in the
CMAKE_CROSSCOMPILING_EMULATOR section.

Keep the code optional, as the core does not need this function and does
not intend to use it in the future.

[YOCTO #15214]

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake-qemu.bbclass | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta/classes-recipe/cmake-qemu.bbclass

diff --git a/meta/classes-recipe/cmake-qemu.bbclass b/meta/classes-recipe/cmake-qemu.bbclass
new file mode 100644
index 0000000000..76b748f340
--- /dev/null
+++ b/meta/classes-recipe/cmake-qemu.bbclass
@@ -0,0 +1,28 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Not all platforms are supported by Qemu. Using qemu-user therefore
+# involves a certain risk, which is also the reason why this feature
+# is not activated by default.
+
+inherit qemu
+
+CMAKE_EXEWRAPPER_ENABLED:class-native = "False"
+CMAKE_EXEWRAPPER_ENABLED:class-nativesdk = "False"
+CMAKE_EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
+DEPENDS:append = "${@' qemu-native' if d.getVar('CMAKE_EXEWRAPPER_ENABLED') == 'True' else ''}"
+
+cmake_do_generate_toolchain_file:append:class-target() {
+    if [ "${CMAKE_EXEWRAPPER_ENABLED}" = "True" ]; then
+        # Write out a qemu wrapper that will be used as exe_wrapper so that camake
+        # can run target helper binaries through that. This also allows to execute ctest.
+        qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+        echo "#!/bin/sh" > "${WORKDIR}/cmake-qemuwrapper"
+        echo "$qemu_binary \"\$@\"" >> "${WORKDIR}/cmake-qemuwrapper"
+        chmod +x "${WORKDIR}/cmake-qemuwrapper"
+        echo "set( CMAKE_CROSSCOMPILING_EMULATOR ${WORKDIR}/cmake-qemuwrapper)" \
+          >> ${WORKDIR}/toolchain.cmake
+    fi
+}
-- 
2.41.0


