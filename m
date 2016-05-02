Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2D83A73204
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:20 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id bt5so78051183pac.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=HvXjUuNYa+qrrj+lqXtoutyAW9vWBZmGYQK+q+fAPJM=;
	b=h2JGtPqqHMOXAeY4Rbukaf5/tzbnkqNZS85YBxBoMVnNNC37RFSaeqqzyqXZsYtwX9
	C1AdGolZVEnkHa0fejvmEb3eINMvBdD2yPPq3FjXa1MD15tOz3D4054cSCIxW4QCi1vx
	olvyQmb1OiE8ZUvuHTab1ZSr8opT775CWC2KmezDMhy+2Q0NAaipgQ/599z3w8BhD0QH
	eYtS1C1PfXeWuh6Vl63/pRG/mWX6058fQhuj3BRqTgT3T9/tVfxmoy1qs1saYuhxgjT5
	RViwolT7DrtBGWmLpiWNTz8hS+zY0DOQXVEeuuGuAAgD5d9T5O568+P4MqPNY3FXIHTc
	+tNw==
X-Gm-Message-State: AOPr4FU5JYolhnpX1UoQx6XskkDT/BpvnhVexOgsaBccANaQt7B7HqEcM/n1t36u84fT0g==
X-Received: by 10.66.218.161 with SMTP id ph1mr53686312pac.83.1462220061127;
	Mon, 02 May 2016 13:14:21 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	h88sm47521673pfd.10.2016.05.02.13.14.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:20 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:14:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:39 -0300
Message-Id: <1462220023-17811-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 3/7] weston-init: Rework do_install to use install -D option
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
X-List-Received-Date: Mon, 02 May 2016 20:14:21 -0000

The install -D allow for the parent directories to be created in a
single command line, reducing the code and number of fork during the
build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


