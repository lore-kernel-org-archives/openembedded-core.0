Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 868E37861F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Aug 2017 00:33:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r77so8088435wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 17:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Iz5SPuRUubdX58bzatA9DWei3XCquRS2n3XMktrgsUw=;
	b=nYsi0WOwphAabU5MENRfNShFrBpbwO0R60lBb212kn1Ca6BnFGr+0Oo4ltY1mEyhoX
	dt32P8hgmxNdo2qChh/rCeh0oOffZTruAx7oRy0k/Frk6B8bFm2zCPqoxtaZPXLXO95I
	lmlHxAbWKpSWRkMiutO612jPn6eBa0TftVnkQHFkKRbt0uRwwi8Lki+FQw+9p4WCCvgL
	b+flg51kwenbofIzQEgo65khAKuKaX1I0iHj0k4mHmjoPaj+/Ft49tQ2LHWm3AB9bWrU
	vguX+9OLRtH6kG6KkY1feRpbB+nDnUqNJZutgsp5OfV7Aw8phafBNL3N/+hPIOBGuwk/
	y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Iz5SPuRUubdX58bzatA9DWei3XCquRS2n3XMktrgsUw=;
	b=Imjnttrskk8tgbPZiAqhheLOuV0fXVrNkjr1hfGica36jxcEd3RQ2UBvQxcy8PsTz1
	Tgz6WKLqZ7fe/7PWlPxDHoMpHtG/pcr/sgFd32/uM6zmlhIWgWZuIefw2IF/+F+x5RJn
	ARTLVmI10ybhIJqKJLD3vdfKKhgFGWAvORvRj8IgUvW1RoRD0544b4PyA2G9kCkL+B1R
	8XB7G7Yi8bGlsMyY94UHHc0vGH2zWfjcT/sicJQYEOrF1wxSFwT49AAeZyq/8z7btSDm
	aawcyKmwTvs7rPh/POLm3NMRcURr1YdUWsF7hl9vPHi+3EDT8quCjQPSBbFO30+mDNPV
	fKhA==
X-Gm-Message-State: AHYfb5gzlPqen9J4hPa0S3pmzu8nuh12nSc3L0fI5r4JcTCyS0WB8JTm
	5Ims43zbhWwp73P1
X-Received: by 10.28.34.130 with SMTP id i124mr263381wmi.135.1502498010148;
	Fri, 11 Aug 2017 17:33:30 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 140sm225738wmx.1.2017.08.11.17.33.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Aug 2017 17:33:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2017 02:34:55 +0200
Message-Id: <20170812003455.27183-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
In-Reply-To: <20170812003455.27183-1-Martin.Jansa@gmail.com>
References: <20170812003455.27183-1-Martin.Jansa@gmail.com>
Subject: [PATCH][pyro 4/4] mesa.inc: drop wrong path in --with-llvm-prefix and export LLVM_CONFIG
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
X-List-Received-Date: Sat, 12 Aug 2017 00:33:30 -0000

* this was added in oe-core/pyro but breaks all builds with llvm from
  meta-oe as reported in:
  http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135050.html

* fix it by partial backport from master:
  http://git.openembedded.org/openembedded-core/commit/?id=da29bc17e4dd748f50b054c5e3afaf8d41bf4077
  but with different path as llvm-3.3 from meta-oe installs llvm-config in:
  ${STAGING_BINDIR_CROSS}/llvm-config
  while llvm-5.0 from oe-core master (rocko) in:
  ${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config-host"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0348bb2dbb..25cbf631a7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,8 @@ inherit autotools pkgconfig pythonnative gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "--enable-shared-glapi --with-llvm-prefix=${STAGING_BINDIR_NATIVE}"
+export LLVM_CONFIG = "${STAGING_BINDIR_CROSS}/llvm-config"
+EXTRA_OECONF = "--enable-shared-glapi"
 
 PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
-- 
2.14.0


