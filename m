Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 35B8A73232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:04 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id iv1so78532545pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=mtRxOP5bWDJW7QDQpd2Ks6IP9gzku46sdOMAB+alEmM=;
	b=dZAs1Gws/deiIOUg18meab2IsFIN95RkIU82iNqfVY1mQcD6c/hRB2aBUzJujUIfK8
	x7etxugtC1th6DEY5jJ1Q4zLAnn32SVqgsuF9TnEjDWiK9PwfU/YvbTAj/qj7oxhtS3W
	KqtLoEmVLe0Ur5jfuqOqPrr52ozZdNP/Md2FZpB58/tjWk6gpnyKUtzypN6kCfaq5gZt
	PznWKyephHEfpVh1hYM4Si0P+49guwowuYCtHBWT4IcGA7JNMFftiIpdYZrgyPyhEpt/
	nEZif9fLq+LPhgHn4qyAtQWMD2MYpods9SbFk76ZBipJyOay6y231HN4IFjatESH0i99
	2aVQ==
X-Gm-Message-State: AOPr4FV+Cz/GUEEowcNiPNjAX1CKJEE69s0RQ7+cT5Aq9GJJtwQEbpx7w6BKxMZjjZwNCg==
X-Received: by 10.66.25.243 with SMTP id f19mr54470265pag.11.1462220045811;
	Mon, 02 May 2016 13:14:05 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	bf4sm47326202pac.4.2016.05.02.13.14.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:04 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:13:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:37 -0300
Message-Id: <1462220023-17811-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 1/7] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Mon, 02 May 2016 20:14:07 -0000

When the DISTRO has X11, Wayland and PAM support enabled, XWayland ought to
be enabled by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 16a788d..370c38c 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF_append_qemux86-64 = "\
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland pam', 'xwayland', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                   "
-- 
2.8.2


