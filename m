Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF195C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:47 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.4579.1741809399848040693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tY23V+VT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22355618fd9so4858855ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809399; x=1742414199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3bzI5G6skpy45IDrUE1yESEk2OaqPv5Xv17PqFl2+fU=;
        b=tY23V+VTd4SphWhg5XV/UJlJWthlobzpPiA6S5IhgBF8CqjfU66T58+5UylYuHtxAZ
         eDmZ08vJ1e7hpi/DBmtyJQdwGqf3c2HUrHtVShVDaV3Ca1e9TOlqdOSg0I44FyuxlCid
         9yLsMbbFlBaZElIlJMbsQXPs+06O+rZUJ5uM+nWkEwPhpS4XRn4cXV1RbZDmUApRrCh7
         jU7duodYozjCdWFIEyX/IttI4/w6e9PGlUxvCuHhz/Zaui+YuTyGCyxLlTG6kNJSgu7/
         nloEeSm6ZvEUdIBh1gmBE5xECvJDe4rJIginY8p3Ic0idyYyLYauDosJYaaU9t9kJDOh
         At/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809399; x=1742414199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bzI5G6skpy45IDrUE1yESEk2OaqPv5Xv17PqFl2+fU=;
        b=Ru6RCW3wRimALdwYmZHmZy9srD2bcvhnmuGwFscIbphqQ1ugaBuQSxbU+sCYfmSfMN
         shSb7ZcLYArK4PxKesbSOPGkpsNvuouMCX8Das1an0f5hR1tRAgM7WdPyVleIHaOL+oP
         oXcrdjjS1EMXGjm/dUpWAZRkYRv9dULt75+wqTUsAD4jJF6/0BJqoxkrpfJzRk5lHwXj
         N9Im75UmuLEbtKpH7ZLtuTt+rqGo63FX8s8i9hqMXzpOFMqjAmCsyHADp92ejZvNxIl6
         MljRpdnUX0syNAaT8K7UyVaIM0Yx2Go49RLYBcQBl2VtGwjyZFRNxgT1tLmj4sIJhTAM
         aRqQ==
X-Gm-Message-State: AOJu0YzJ+aDzZk/fC0KX38IZblup5sG4oPI7uSXP+UMom+39u3OWJOpq
	idW5S5P1xRXWzSisFWXTzBSRWzn+5LIzmISQ/cV/6kSMnuss4ZZg0V4hZpunc5bxoSKhcpR5AgU
	f
X-Gm-Gg: ASbGncugJlunoTHBn3l52K6rPeRccGmobessR1zb1fVApR+8vSD6+O1p573cfRIWqDb
	HgudB2CddyGryyp9rmRYbVdqx1zP1EN/YXOz+/fFWJ1tJaehGUOHoUcBo3p5eybOfnDBqqzNty5
	zVx2DkWNj9BHl43cohShJH2GDZEf9rs7glae1EbxuVU3PZMKcXpjhYhal8HlFMqd97J8qQB3clQ
	Tpty9Anp8n1RiMEING42fNmezsw496o1bBWaXkqG+fOO4KC8Ul4g7mmkj5iI+UjE6KiYj8QbbJ/
	33imcYPtX9CXU4n+wEnIMwRpZ6pFW2MkOJar4Wmr18Y8DQ==
X-Google-Smtp-Source: AGHT+IHzMptrN3sr8biRuk6RsSWCjNfoV9hjHTHAlzSpANQZosI1lEfCMy6eyqgiADIPo/dJ4NqJLw==
X-Received: by 2002:a05:6a21:4cc7:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-1f58cbf3befmr14052688637.41.1741809399065;
        Wed, 12 Mar 2025 12:56:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/28] babeltrace2: extend to nativesdk
Date: Wed, 12 Mar 2025 12:55:49 -0700
Message-ID: <b00b0d744a1768843386cfd529b73cc17c88bec9.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212722

From: Changqing Li <changqing.li@windriver.com>

This allows anyone using the SDK to be able to analyze the logs
collected on target

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
index d6c75d7580..bd6eb9ba1c 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.6.bb
@@ -93,3 +93,15 @@ do_install_ptest () {
     # Remove architechture specific testfiles
     rm -rf ${D}${PTEST_PATH}/tests/data/plugins/flt.lttng-utils.debug-info/*
 }
+
+do_install:append:class-nativesdk() {
+    mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+    cat <<- EOF > ${D}${SDKPATHNATIVE}/environment-setup.d/babeltrace2.sh
+	export BABELTRACE_PLUGIN_PATH="${libdir}/babeltrace2/plugins"
+	export LIBBABELTRACE2_PLUGIN_PROVIDER_DIR="${libdir}/babeltrace2/plugin-providers"
+	EOF
+}
+
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/babeltrace2.sh"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.43.0


