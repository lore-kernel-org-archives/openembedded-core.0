Return-Path: <otavio@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC11FC433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 16:43:14 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.18753.1657471393311969654
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 09:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: otavio.salvador@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id
 cb12-20020a056830618c00b00616b871cef3so2606733otb.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 09:43:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rAUtoG49QopfNPwRN4qzthflQTDqUjOBe+3yOPuQYS0=;
        b=NcEV/EO/sxmPHvsO8ewqPI8jCnitN4QmlA4qhlcVrbaKkEu/srdFYBTeZMVB42wPvs
         TIiGBFvvuN2tcasHPhoUdlwDJpRgeHIqd+9h37QEuKlpy/X52C+isB9usgFVnlh+Kohr
         qaRdbMR4S+SOaBXknxca5beIDg1wUGQDNLnhUz0gJK06Z8neowuOA8KkBvYsjsROTtzl
         t7STize6cJQto6pmdg/XLLCd6KKnxLACoWtvBvml2CJA/Kqd+iRBcV1zQrGdMF040OSM
         A6Fsqw6B7vbFkrCoTeUdEJ22wS9j6pi0Rsdi0Oq8SaVccqvDzXb93ydq7DcnOGfvcSsY
         eC5w==
X-Gm-Message-State: AJIora92EN7N2HUPe7N/StPSTOaSR3F6XtkSsGN/pUKerKgSu6oVKZDF
	6djzpjO7hsNtRTKL0DJnBSo7SFvoSs8UPQ1T
X-Google-Smtp-Source: 
 AGRyM1uXsQ21QkWqt8yYcTYdWsDDODPaWCVrZe96Aq+p9fJEvPCaR4Y+hzHnsJKYkgeRhft7ntbvPg==
X-Received: by 2002:a05:6830:3106:b0:618:8052:e8b2 with SMTP id
 b6-20020a056830310600b006188052e8b2mr5802597ots.76.1657471392316;
        Sun, 10 Jul 2022 09:43:12 -0700 (PDT)
Received: from localhost (177-4-253-164.user3p.brasiltelecom.net.br.
 [177.4.253.164])
        by smtp.gmail.com with ESMTPSA id
 z34-20020a056870c22200b0010c275b6376sm2100318oae.38.2022.07.10.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 09:43:11 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] cargo-cross-canadian: Use SDK's flags during target
 linking
Date: Sun, 10 Jul 2022 13:43:00 -0300
Message-Id: <20220710164300.953098-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220710164300.953098-1-otavio@ossystems.com.br>
References: <20220710164300.953098-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 16:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167849

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

(no changes since v1)

 .../cargo/cargo-cross-canadian.inc            | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
index 7fc22a4128..01ba151d0a 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
@@ -39,6 +39,18 @@ do_compile:prepend () {
 	PKG_CONFIG_PATH="${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
 }
 
+create_sdk_wrapper () {
+        file="$1"
+        shift
+
+        cat <<- EOF > "${file}"
+		#!/bin/sh
+		\$$1 \$@
+		EOF
+
+        chmod +x "$file"
+}
+
 do_install () {
     SYS_BINDIR=$(dirname ${D}${bindir})
     install -d "${SYS_BINDIR}"
@@ -47,6 +59,9 @@ do_install () {
 	chrpath -r "\$ORIGIN/../lib" ${i}
     done
 
+    # Uses SDK's CC as linker so linked binaries works out of box.
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
+
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
@@ -58,7 +73,10 @@ do_install () {
 		touch "\$CARGO_HOME/config"
 		echo "[build]" >> "\$CARGO_HOME/config"
 		echo 'target = "'${TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-        fi
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
 
 	# Keep the below off as long as HTTP/2 is disabled.
 	export CARGO_HTTP_MULTIPLEXING=false
-- 
2.36.1


