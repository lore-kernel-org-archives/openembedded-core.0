Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id D19ED7C897
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 13:30:05 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id p48so19132079qtk.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2019 05:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:organization:content-transfer-encoding;
	bh=7az10fx8b/xf1TkX92jaPTn625T4611g01upk0c/vDA=;
	b=pZEBxjF2J8LaFd7CHu8cjYdQar/HsRryzm5WQrgsQDnj5HUkM90F1u9E1TWRqNXASm
	Y8xDCfc/snNeYg8ZYsp82njerD0frOrirhMcN4pu9DjvCXbLwbyPNKgTvpp0RpJB2qpK
	bEs9vVbw5H2XdOhyVL326NUEVQxvtbocDMeWsyAYgFSDvqB/KkdNXIynGEpSKnxeSVhz
	gxgVMVsgi/4R12oGEtAE0L3RI6um4yzlrT1u1eXuzWg1Lou+DIFHbJOy2m6R7A7W36oa
	kFlQ0vo+h526tgaHa3LEwutkELINpAxJmRxWIbb/PIFV7NN5O3jLPCM/Y8PQ1Gr6vbZi
	tKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=7az10fx8b/xf1TkX92jaPTn625T4611g01upk0c/vDA=;
	b=Q8sQtko0waWn5oxO1ccSxYymxpT4JwGSmrUvTNqXrJvE0kGbIrpHli7tG7WAbWvzsg
	cZeQ+EmSrR2O6GHoUAgdLR24mtwEssnKvmovlMkzf8RQUWQPOgBEqluz8VpbYDUjO5vq
	mmumCHiCQGlUiUHTRYsGTTsH7xVItPBOP5hNwTF9UOtNurILlF1v+8X0nfCHyYkatFK8
	yI32U5iisMOrpS5aW8g02vU9s7KdW7f7Wvv8nk4LzPJW+DwANAybGdxVCwoYd/hHVVYY
	IDK53tfa6OdcM0W8UdjudicxDsvVWa1yyv9JNzEWPN6h2s30wENlWHa+xSR+oDxDiIHW
	AdfA==
X-Gm-Message-State: AHQUAuYyGs2NKd9cwlCY3IO5TUdYaHcghZ+iobKMkQNcYSSZGJ0pRQQQ
	arfrgtW+OBdDeuHLz0e6JvqvANSx6FQAHw==
X-Google-Smtp-Source: AHgI3IZ3z90eN4d/sWCFqxLdQiBycQh54A/Nvm7N1MeC2tiLgP1pYKtjAMZ7RqWjk4UfXAm+s1eLzQ==
X-Received: by 2002:ac8:36b6:: with SMTP id a51mr1644048qtc.208.1550496606526; 
	Mon, 18 Feb 2019 05:30:06 -0800 (PST)
Received: from centrium.lab.ossystems ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	q184sm6751768qkb.23.2019.02.18.05.30.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Feb 2019 05:30:05 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2019 10:29:47 -0300
Message-Id: <20190218132948.27668-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
References: <20190218132948.27668-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH 2/3] mesa: Replace dri-native with dri for native and nativesdk classes
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
X-List-Received-Date: Mon, 18 Feb 2019 13:30:06 -0000
Content-Transfer-Encoding: 8bit

Instead of using a native specific packageconfig option, we now set
the swrast as the supported driver.

Based on https://patchwork.openembedded.org/patch/158748/

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta/recipes-graphics/mesa/mesa.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a57438b295..8d3e976481 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -49,8 +49,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri-native egl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri-native egl"
+PACKAGECONFIG_class-native ?= "gbm dri egl"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl"
 
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
@@ -61,13 +61,12 @@ PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
 
-DRIDRIVERS = "swrast"
-DRIDRIVERS_append_x86_class-target = ",radeon,r200,nouveau,i965,i915"
-DRIDRIVERS_append_x86-64_class-target = ",radeon,r200,nouveau,i965,i915"
+DRIDRIVERS_class-native = "swrast"
+DRIDRIVERS_class-nativesdk = "swrast"
+DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
+DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
 # "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, xorgproto libdrm"
-# On the native builds we use host's dri drivers
-PACKAGECONFIG[dri-native] = "--enable-dri, , xorgproto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, xorgproto libxshmfence"
 
 # Vulkan drivers need dri3 enabled
-- 
2.20.1


