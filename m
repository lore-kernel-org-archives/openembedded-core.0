Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEF3C021A1
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:22 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9253.1739023519223708626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TMrFDms9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f2cfd821eso53990595ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023518; x=1739628318; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xO2OKrIZu1l/Eq8vXAiijOldCHT7nWzD2E8t64LAQhU=;
        b=TMrFDms9XENkq2b/2g8uqaIjDzI6O9g8pqcd2X2ugPFONem2TCLrsBktNitHvgn3LB
         MwYF2WN/bDK2SOoN9Yr0Ds0QLCAeGE7JESGJmxIswvc1jJhjWeq9431xOJtef1rT86Ij
         /1rqiukSxCXAZ2ifOXtLxRyc13gqIljmWKIeqQjuOlct7J9OPguN8wC4QkdK35fuNjzl
         4Ng8ilM2lper418J/XEOeiz7P/Pii2KiNZ9IrdBqKOA41biEih+/HA9YLvXlCPrZC4A5
         DmHHHOuLSb9u8plAgWmjliHXaR1q4aDE1BGfj1zEdd56AYgl7z588Jktt/NyJnkjZdAo
         mcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023518; x=1739628318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xO2OKrIZu1l/Eq8vXAiijOldCHT7nWzD2E8t64LAQhU=;
        b=Vi8A4R5Z8C/aozdUbnR/qKX3hXex75QmZE4YnarTkB+oWGSSrau4yZtYubQpDyM66J
         DDAc5K8XmT3i+fgKmssdHPiv6lwa455u7nZ9rdgt9evNSgkgujtiHFXueuX7NmvYNxYS
         U87HiqfLWEvhhOvF2eLCS5UOFv2KLuWUaeAf3sun2rZl8KSpn1ovD/pOWI4QLvllzThh
         +qHLvDIfkHXLTR7kulZQ91wY5E1Ymgv6U2VyrJa0fGxbKanUQAp9PW/Nx5Twwzi1WHiN
         yCB9PrqyPI9Adnnf7gI2Ea3beZoLmw8xQGb+8aEkV/5iBZDs4+Zm8kFVaxSRTAQFU+CQ
         LCtQ==
X-Gm-Message-State: AOJu0YxWj6FnG8g7EimL6sOJWUse6jndj1Btcxueig2nb8JveSBlJizO
	05nZaArwYTbjyH2GA490hW5fMdZZhlirgUPgMiHXpP+Om3ZQ9OxQxOeQr0RJPW+s9LQpim4Qlcl
	a
X-Gm-Gg: ASbGnctTz4jZXPiHoHbvFT7uVJkkplboaRnneiqavkl6/+d32OoO3CBmYdkeB3Ru/za
	jwRrjhHht99c4s8rddpygVRTDAySO7iEpIc3IQ3eHjjoAcVa4qcZ//djBPs3XSKQGKQd6EuIw9u
	yTjOmwgRUC4CATZCDD6guiOPhIjyHVEzOAvVYr4qi2q5Nb6mmG1tL6FypJQxT5I3T5Izdm3S0AR
	TGU094izmQn45Y8JSGwj2/fAEyJM/g/dcaqw4fIV9n6A+rY5v97P1WNghbOuY50/FVPT6/WdWyx
	rP4o
X-Google-Smtp-Source: AGHT+IHs1KQ5CemlY88773xa1xJttv5ntHfzQqj3fOM9rxYkFgbyu+g6MUeuBCKTAprJ0AqBh3kJzw==
X-Received: by 2002:a17:902:c40c:b0:21c:e34:c8c3 with SMTP id d9443c01a7336-21f4e70430emr125314435ad.24.1739023518496;
        Sat, 08 Feb 2025 06:05:18 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/13] rust: remove redundant cargo config file
Date: Sat,  8 Feb 2025 06:04:57 -0800
Message-ID: <12fd08cf4009d0284ab951cc48a479dcbc74db42.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211030

From: Harish Sadineni <Harish.Sadineni@windriver.com>

YOCTO [#15061]
The rust target and linker are getting setting from the sdk environment and
so the config file is not needed. The redundant config file geneartion is removed.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=d5f78816d2ad0f3e43ce883eef199d1683cfcbb4

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 4e2e051f1d..dbf997560b 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -64,20 +64,6 @@ do_install () {
 
     chown -R root.root ${D}
 
-    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
-    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
-	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
-	mkdir -p "\$CARGO_HOME"
-        # Init the default target once, it might be otherwise user modified.
-	if [ ! -f "\$CARGO_HOME/config" ]; then
-		touch "\$CARGO_HOME/config"
-		echo "[build]" >> "\$CARGO_HOME/config"
-		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
-		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
-		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
-    fi
-	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.43.0


