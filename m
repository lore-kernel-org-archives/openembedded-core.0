Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id B847D731C8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:22 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id xk12so14407530pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=VVkuxq5EkIgZQCN1U6PA5n022Gz8a1ujykd0ZhCtBO0=;
	b=BTnw6UbVKJDA1born092NKdhyiyJrktzNYv90x6REhSJw9Rozqno2yuP07A6Uw0fwO
	DRSIkiGzYyDomqD1ukeJ8q9wCDQVx4iqLYjtpRAFtKsD3NNFPOvvWePlNAbLJzpxemJg
	DDRkrMljfH5S+XN5SP74l1Y7BX3lLX0Pt7YHd9PCbWqLbYe63DfyKkIrmzKLABQc9g+W
	avhQdyozRcG4D37B5W8ijqUNa6DmK9GwwhorEqy+QKH4o8Q7fc2DLWGHVyKlxUDU/UNR
	RQlk2xmKAbH3GQZl9pOhYYybJxLNmnY0zFoD+IkPYfWlXBymkZS5acYpd+I0z4aNyLXj
	0irQ==
X-Gm-Message-State: AOPr4FUu+WIp81fbb36Vf8WXscKL+5jWZ1edHeUh22XKTmEaTVoYk2F8BfuTSIGpTJPeUQ==
X-Received: by 10.66.253.194 with SMTP id ac2mr6097443pad.55.1462305683568;
	Tue, 03 May 2016 13:01:23 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id 71sm89215pfy.32.2016.05.03.13.01.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:22 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:01:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:47 -0300
Message-Id: <1462305651-16593-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
References: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 3/7] weston-init: Rework do_install to use install -D option
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
X-List-Received-Date: Tue, 03 May 2016 20:01:22 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


