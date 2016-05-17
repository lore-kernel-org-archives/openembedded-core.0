Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 43CCD6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:37:50 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id l68so1939678qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=Uc5CfYnDNxk7Z+1gPGo+zz2FwyVrqrdrvW3yZnBKJhc=;
	b=XHoJV6z89d9jTLa4+K1WSw1fk6kugVOs+b9PJ4/KVxHbU6U7AlPCiVMj+mC1Bql6zG
	ui6RgvGSPnvseoYwnnOYARe6/QqIPbIS7LgbPsCn+O/TSE3eRBC2b3PNPaucGYi7MUec
	OgdIPx2u6BP8NEm6+yiY71AjeRTTi8WR7eVsjaHe39ShPGqRgEvwvJh2obSMMWl5NxNk
	q8VMABxb27giG4Cor+f2nKEfb6eA5QDAfIEDItwZF8s0d06nhMyKgvcgK+dzTs/gL8c+
	8QVrxMPQdNPWentgB3CraHfldYcSkgfKdKKNrIDWntcZurK+r5mAAnMMeOBUcYGCqaTx
	PYdA==
X-Gm-Message-State: AOPr4FVP2dbDpSK8CFshsGz8cdtCSYqOYtVZT9pI4BxKhO9uB68hVp4EAzSibkXi2Ib/xQ==
X-Received: by 10.55.40.219 with SMTP id o88mr2679468qko.23.1463503071092;
	Tue, 17 May 2016 09:37:51 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	j88sm1706444qgj.35.2016.05.17.09.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:37:49 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:37:41 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:19 -0300
Message-Id: <1463502985-5428-8-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 07/13] weston-init: Rework do_install to use install -D option
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
X-List-Received-Date: Tue, 17 May 2016 16:37:50 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


