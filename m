Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id F273875EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:44:24 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n63so67130517qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=1PNI+mv6whOHsImOP0ecVZsJFtXFEJh6veXi3Kmx9/s=;
	b=I/P6ETVIKwaB17QNXnbAjv/FU1MAuDJWcAu2Xvp1z4zfa8bK/TjjgpRrqdCNQUhwgo
	PeJhr8qZgKRtl+hfOQ4gGTa8O1+4TuyWFzZMYSTY7a98dFgNHYpTReL2X0uLmcF0Bs3U
	SI0OSFxZ+pgjlq7QRUZJ+aWCJg2pXe9WM9m87qI5pF3lBUxXuwquxVnhjuSO8uVJ+Rhq
	NmO1tTRCIxyAnLjwDTzHGbvP68x8giHmsxfG3hX4QCdvlvrickajUjRhnYHdlDP4ZueS
	PWzrfWk8TOjXfqcdpwowEKkKeDdhiud2lylYwY7qZuj2QIRopvEeuMt7t4AxhfCXIctg
	X5Hg==
X-Gm-Message-State: AOPr4FUKl+vLciHeebYu95nOjnnptMsixRXpUTs+LfnhC+1Od8+lwXocVxb4uMhYkBBdOQ==
X-Received: by 10.55.192.86 with SMTP id o83mr24195941qki.54.1462567465171;
	Fri, 06 May 2016 13:44:25 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id d8sm815659qge.40.2016.05.06.13.44.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:44:24 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:44:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:34 -0300
Message-Id: <1462567419-3459-6-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
References: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 05/10] weston-init: Rework do_install to use install -D option
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
X-List-Received-Date: Fri, 06 May 2016 20:44:25 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


