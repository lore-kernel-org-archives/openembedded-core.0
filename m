Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D4CCD183
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 16:48:13 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.914.1759510091144676506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 09:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mYEjQkaT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7841da939deso2480412b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759510090; x=1760114890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSBEicCJQTue3qtzY152liQLLqeOM92/mG3ku9WCa48=;
        b=mYEjQkaTLajyWbDb1goq8umFJr4Vej/+uSkXxHWar7Myvt5+Cx+v2z2opan4KyD3SS
         FHQdDrooByzotxfi70jKOOixmATnhF/TVxztVvIGv4qk15KLMBTbBFu+wl1In0/iHVB4
         UKOptGL4A1M0dJxsPMxZ0WqM1t3AYC4qHnLdF1Kx2+iLikhgzcpOg7Ez373fDVSXB8YF
         0dSuY0OicOlFn/yIWG1FWgmvS9vrFxzU67tomtU0YPquT0k0kvcyhKBbw1VaGpbDywV2
         9zPsmPUGQy7oLJzCwd2VRPHMXSDpjVmHQ4Wehp9ihN4tvY638JSQjf46LSCdCK22gGFt
         Yh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759510090; x=1760114890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSBEicCJQTue3qtzY152liQLLqeOM92/mG3ku9WCa48=;
        b=ltaEHfuW5WMqfEnbT3nNPoCzrHLSs2DYEKp2+Rjs6opgOQ9vASYP9aW085C4GzHhp0
         cZSnQkuhPCDo4gVZ/z5lO93nyzuUdcJBYWuERa0mpFItzZpgxXH45NP6VXUalavucJ1n
         M0PSdtELnoEi0szCnCdU0rsUMV+z721Gy1025oi6UtBmn/5/tr/pdU3nGPLwZ65turhg
         tZ/yRPCY6BOatQpXzedIbrOn9j+qSXhqUAxzJQYmoX6z5LxRuy8l4h5Ww2ZU8t6hcM23
         /9ivGaF3Y6U9gNf9WQ8P2KUwadYFjtEzXBZNa0MqCvS1APmj2K8jL4HLMwUkHd6zc+p0
         Nopw==
X-Gm-Message-State: AOJu0YxZ0hANnO9tfoLVUGSLAjE7W+oDqmFP2hRAZxBGpEojB6LzM0iC
	pojrsTbPjYp/VoarwrIsn53X4Sj8ZEu3WthhGfFBSO4BcqwAxk5C618wrkI4fZUaOQa7JAplI6m
	d7iRZ
X-Gm-Gg: ASbGncv3qE/SIKadEVbahR/RHkTft58Wv8o0HNg0NnhrwdTScBiGINPpygtZo0meang
	z0emkHNjH9HAIisxof+7K5gwBcHXTROhJb9LDe3LjM36+OLDVQrKDt+j8qaAbYX2SXTE68WtjNd
	PqCIvInea0Q6twXGT7QTBAaR+Cx6euGBkFiOrJVHzSmRrLtBDKqUCPX+dN4uRjp9+letqZRVewW
	rY2M3RnmktjJDuGKCDTTCfZ600mxodhse/PMRpL+YMtUnJxvZaKJmx7DQwwhYH8UdONhQkioOfK
	ZIKJspzY916ZM3kVzt6ZA08YWpaBtCeNQnlGBfvyB381gtEsu12EhV3bD2rmWkNKjaz2CvErKp+
	FHlke7FPEhNbSA2h3zQfUGJsDgntbaDtt+QvE7wUrDlLJ8PGz
X-Google-Smtp-Source: AGHT+IH5Xo+Wr4ksoGpP0H3ZK97bU99WC0zJ3sRRMBO4IeDBdfrClMmjaCTXy+Mby+UVrbWbaIaVPA==
X-Received: by 2002:a17:903:987:b0:267:a95d:7164 with SMTP id d9443c01a7336-28e9a6b25a2mr42693815ad.60.1759510090358;
        Fri, 03 Oct 2025 09:48:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5bdb:26c8:eafe:889c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d568bsm54352445ad.100.2025.10.03.09.48.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 09:48:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] expect: cleanup do_install
Date: Fri,  3 Oct 2025 09:47:52 -0700
Message-ID: <10a501b3bfe8f73ce2eb15673900df71e547b54d.1759509931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759509931.git.steve@sakoman.com>
References: <cover.1759509931.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 16:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224408

From: Ross Burton <ross.burton@arm.com>

Clean up the do_install append, and remove a long-standing unused
variable that appears to be intending to not install the scripts but
would have never actually done that as the relevant override since 2008
has been task-install.  As we've been installing the scripts, keep
instaling them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 4d4c91891c..48f7e1a539 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -42,11 +42,9 @@ S = "${WORKDIR}/${BPN}${PV}"
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
 do_install:append() {
-	install -d ${D}${libdir}
-        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${libdir}/
-        install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV}/
-        rm ${D}${libdir}/expect${PV}/libexpect*.so
-        sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
+    mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
+    install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/
+    sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
 do_install_ptest() {
@@ -65,7 +63,6 @@ EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
                  --disable-rpath \
                  ${TCL_INCLUDE_PATH} \
                 "
-EXTRA_OEMAKE_install = " 'SCRIPTS=' "
 
 ALTERNATIVE:${PN}  = "mkpasswd"
 ALTERNATIVE_LINK_NAME[mkpasswd] = "${bindir}/mkpasswd"
-- 
2.43.0


