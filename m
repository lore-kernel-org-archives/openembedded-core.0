Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 08DDE73204
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:14:13 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id xk12so7317886pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=8biDGNrhVP0i18SaOgef/m5MfeIfZjmsuZ9lgwrW9gE=;
	b=mOwR0EFZuPjUC09e1cRkAPdhKwLeZMf/+1iqhSoCR3Pp9MSSaTnAp3SqW+mRDx4m/y
	XCKRryxKFnE9AKD20RShrReOKM07I6gIGQDsiuWjqHlOupOjqKemzIKysxJYjI70qorv
	muEkpVzxGQRTWnGbmmRpOgC4Q/GUBN4915B6ec5c2+QsMcLf9eckHbbZFxwAPbbu2ZZf
	aMiif5Fyp2YrYZdiP9eMBFxoDn0YCc6Jf+5w1ZM/EvL7k1fC6gMvJeCD+RShP5b0MFYx
	FATEgXF1PDACs9tT7vZweuJR901JUI9RdmYCQ6x2IKuyZ4x4qQ0X0PUxZ4O3xsuF9jjE
	BCuw==
X-Gm-Message-State: AOPr4FUefWKAPWIitLY/CJM61bWPfASwFSKtULlNbNHWX0GJI/7MOcx5/rF19EzQ77wL5A==
X-Received: by 10.66.142.232 with SMTP id rz8mr31348888pab.22.1462220054060;
	Mon, 02 May 2016 13:14:14 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	s64sm47464065pfi.77.2016.05.02.13.14.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:14:12 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:14:06 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:38 -0300
Message-Id: <1462220023-17811-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
References: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 2/7] weston: Remove XWayland dependencies on PACKAGECONFIG
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
X-List-Received-Date: Mon, 02 May 2016 20:14:13 -0000

Instead of adding partial dependencies we list the PACKAGECONFIG
options that are required. Those are: X11, Wayland and PAM.

The previous value were redudant with X11 PACKAGECONFIG option and as
it is a requirement, for XWayland, it can be removed to easy
maintenance.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-graphics/wayland/weston_1.9.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.9.0.bb b/meta/recipes-graphics/wayland/weston_1.9.0.bb
index 370c38c..8940410 100644
--- a/meta/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.9.0.bb
@@ -73,8 +73,8 @@ PACKAGECONFIG[webp] = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 # Weston with systemd-login support
 PACKAGECONFIG[systemd] = "--enable-systemd-login,--disable-systemd-login,systemd dbus"
-# Weston with Xwayland support
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,libxcb libxcursor cairo"
+# Weston with Xwayland support (requires X11, Wayland and PAM)
+PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland"
 # colord CMS support
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
-- 
2.8.2


