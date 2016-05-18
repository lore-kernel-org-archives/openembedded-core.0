Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA1C770C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:42:17 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l68so4847869qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:42:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ZMXW6FlnS0BGfZW90lI1E6dPQeJc52dP20AWcndNIjA=;
	b=nEy1PULWWWRevxGeqWkqiTiuTzPry3XLoCPu9hC3c8YUkhjU1GURcBh9MNial0hLDZ
	GoiYm90xx3cLfzxThrepELxuSwdhHGnIsCybPMxG4RGDGqFkcHEPndIo6H1tzMXduvQj
	6JZ3/AZ6HALEM99b+AUs925C7IsBeIsW1glSRW4pljE+XSeIlV50/fY1ps7RNnSO4yyg
	A710RCXRap9rprGxUcKAt9+vo8aMaI8yYkThOqLAPwXLpimT8ZuhOrbMSbDJokZW6/+D
	pQpXEL2idJsfnNDij9LX0l80zd7sQunoSFWoO5ukqd30db+FH3w/vi0Kr5DM77dffZ6Y
	LJpA==
X-Gm-Message-State: AOPr4FUiN87pYkQPnH7Az4NcseZkbAPaGNm7AKHwqNOlSlIjoq4m+gcbvaa8r4TGrHAxfg==
X-Received: by 10.55.79.5 with SMTP id d5mr8855503qkb.30.1463589738680;
	Wed, 18 May 2016 09:42:18 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id o37sm4547360qgd.5.2016.05.18.09.42.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:42:17 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:42:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:42 -0300
Message-Id: <1463589648-28641-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
References: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 07/13] weston-init: Rework do_install to use install -D option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 16:42:18 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/recipes-graphics/wayland/weston-init.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 653541e..4ad62cf 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -8,11 +8,8 @@ SRC_URI = "file://init \
 S = "${WORKDIR}"
 
 do_install() {
-	install -d ${D}/${sysconfdir}/init.d
-	install -m755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
-
-	install -d ${D}${systemd_system_unitdir}
-	install -m0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}
+	install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
+	install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
 }
 
 inherit allarch update-rc.d distro_features_check systemd
-- 
2.8.2


