Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0926460797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:14:59 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id q184so15377463qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=2qtdZun0yG3TQx6E5YeGSixoxc16qrfILRVThmdzDBo=;
	b=IrOoFUnIEPymyowNTp2B7PtEcDfqfCSRFE3ZMApvo46spAXw7YJTjl7IdsOICdnZGX
	4sxznuTSAULCik5K3ksizs52Z1XoX3m3uqXFp6q4evY7BlkuHhvfOwJEKWSu6BKP7fI2
	dICSgmtW2ZpUVXtYJB8KYYnGj49ue1NtVIFbE5LOOq4byzYvrIcCly/KfcYgruJQgKf3
	cHFWd/wNzosMakHIARVVWLd33HFnfUVWWU/d3I7/M0+5EAkg77RczkYUm+ufhMMgKMVS
	XVvbQm6jKWOxS52c46T8rgMykz9R2pJo31oX9myDFgKSBxQkByoGSeRgS25waqvSonCc
	fIFA==
X-Gm-Message-State: AOPr4FWyYSv1ri3EH77XcZCxJu7jCHyj8G6TGFcOvqUOt6YSGDRyxkYVaO1z+VcC/4Psrg==
X-Received: by 10.55.71.143 with SMTP id u137mr32237898qka.1.1463426099862;
	Mon, 16 May 2016 12:14:59 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	d12sm15348731qhd.13.2016.05.16.12.14.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:14:58 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:14:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:12:12 -0300
Message-Id: <1463425932-10080-15-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
References: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 14/14] core-image-weston: If X11 is enabled, add XWayland support
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
X-List-Received-Date: Mon, 16 May 2016 19:14:59 -0000

When the distribution has X11 and Wayland backends, we enable XWayland
support and include XTerm as a test application for the XWayland
backend.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- Add xterm

Changes in v5: None
Changes in v4: None
Changes in v3:
- New patch.

Changes in v2: None

 meta/recipes-graphics/images/core-image-weston.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 52e271d..07ae70b 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -9,3 +9,4 @@ inherit core-image distro_features_check
 REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
+CORE_IMAGE_BASE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xserver-xorg-xwayland xterm', '', d)}"
-- 
2.8.2


