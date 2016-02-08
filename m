Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id E8583601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 15:14:19 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id hb3so57261469igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 07:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GgXeB13mtxyx7RHoleHYYhdrcpYx+EkaSOSjf03bnQ4=;
	b=nX/nXZugNQskMSW4d74vCHB5modwNUaG/l8jImOzbP67LeduHs701ooJkOg7+eJtu2
	VeMN/qC8fZN1gU3aEOuy7jzGEnBjOGpLHN8IKh9Qn01K0PoGlpFzsI7mJZWPKELakuoz
	PsGc94fCQPgrGjYnYYz5TBwnF0DPTfF17CG7iYqCwjL7d4z0rjatw2iIDk7C2hV3LIke
	lUESQJfzaCD7wdP8x4zfzdVEqOVz75wthQ8m4qa7FGYuHWjpuaHOD2pwWzT7WlXBws4F
	9O93aoPbtoZuvVben3KD1JZTMdD4WGEI3gYB9KmaW/uZmXIfrGEeXD4igoMBKF56S/sN
	2l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GgXeB13mtxyx7RHoleHYYhdrcpYx+EkaSOSjf03bnQ4=;
	b=NhOTZOfBnOzeJi20DRgHTv/2wPT+0jhpyaGYPVCgGX5ugpXDSx/RWpIcPO3lXLu0bV
	P+sL/2Eabs+h2v9sFie49Ue83dQcLujXbHFj88uTfO92J85Bev2+FqP/x2Qxhvkim2c5
	kUBj0v8+i1l1yOCNdJPLGJodK3HWhCEmbaa2oBXJAyx5M/FFzLbo6OIUuCwxET52nQ56
	jYmexKESnkuTXEEEYeqqF4ZWn0yPuAJ7tJdO+oK7yXFJVoDv/MS8GmJwZ4wqjZp0zY31
	DEN56ibvHxspHrcrd2KrdpO2DiijpF2IyA5gKrXYg+sT+TLgaHOUjHXafpGwUrlLLBab
	k2IQ==
X-Gm-Message-State: AG10YOS3LojySwwopDAZSjL922x+B81/vLJifAIBzJ+sxVY66sFtKZzIyz++DF88KsncF3Zl
X-Received: by 10.50.155.5 with SMTP id vs5mr13456134igb.83.1454944460495;
	Mon, 08 Feb 2016 07:14:20 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A57FB6.dip0.t-ipconnect.de.
	[87.165.127.182])
	by smtp.gmail.com with ESMTPSA id s19sm5343561ign.4.2016.02.08.07.14.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 07:14:19 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 16:14:09 +0100
Message-Id: <1454944449-11435-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] meta/conf/layer.conf: adapt to more flexible initramfs-framework RDEPENDS
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
X-List-Received-Date: Mon, 08 Feb 2016 15:14:20 -0000

initramfs-framework now RDEPENDS on ${VIRTUAL-RUNTIME_base-utils},
which can be busybox or some alternative like toybox. Making the
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS exception flexible, too, ensures that
distros using toybox still pass the selftests.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 7100ed7..baa4fd4 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -46,7 +46,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   ppp-dialin->ppp \
   resolvconf->bash \
   docbook-xsl-stylesheets->perl \
-  initramfs-framework->busybox \
+  initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
   initramfs-framework->systemd \
   initramfs-framework->udev \
   liberation-fonts->fontconfig \
-- 
2.1.4


