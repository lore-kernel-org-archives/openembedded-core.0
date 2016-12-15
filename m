Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wj0-f169.google.com (mail-wj0-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 066C4772D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 14:40:39 +0000 (UTC)
Received: by mail-wj0-f169.google.com with SMTP id tg4so67996062wjb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Hg3CnXKTxte+Zv8i4dy9CeUzEZXy/2BwL7oCptuyhBg=;
	b=YkHN5u9jKBkY61gEWHw9jwlvyYFEqz3yqY7gz/iY0DXSJbax7PIeIhftQeXrFw3zW9
	phKDpZ9i9o81g2CgDlIe3wcA1dNd2oTCPX/OOrcqXgFjnDQbmClEN3ej+uEEX4Q6tEbD
	GFcGa3eyNjLuk6U5aea+yh0UC5070WUJnQ2cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hg3CnXKTxte+Zv8i4dy9CeUzEZXy/2BwL7oCptuyhBg=;
	b=b6ZGBwW2IeLXYaOo8OZcvF+4WIhsPg1TpdTHaYmBPIu7TqHSYEO+nKdneAQ1gyctlA
	RIwEDob1AX2tRLF3MtBF3fbllJKh7capC3IUEWzRAzy8UHmFmYyXvYIZZjU5Om6iWHVC
	QPb0OUW+dFQMo7sjdGP0mgAyenXJ+3C6ETTf3h+9B0ro+1j/Ad63YwfoRi1/AsUeqHjv
	9vf857z5tv5LnpeC9lSc40LbJ6RS4v3PxL7xhQhZdq1+J9Xl7wSXaszGwlJWeKoBMfT8
	6HAdyhC/U01GH88EkJqVCo5ugRXz3jNlRFXJF7/1uPqoAUah919EkNu6BglCKjwbkYAf
	GP2w==
X-Gm-Message-State: AKaTC01xflZJFWSXWU3xIgQ9SM7rqu34HRzOgO0sZM5PsoHxpTmqhLex1qtbMnovXhHXohrj
X-Received: by 10.194.248.5 with SMTP id yi5mr1776993wjc.11.1481812840270;
	Thu, 15 Dec 2016 06:40:40 -0800 (PST)
Received: from localhost.localdomain (ANice-651-1-9-14.w86-203.abo.wanadoo.fr.
	[86.203.160.14]) by smtp.gmail.com with ESMTPSA id
	cl6sm2345452wjc.10.2016.12.15.06.40.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Dec 2016 06:40:39 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Dec 2016 15:40:11 +0100
Message-Id: <20161215144011.1761-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] gstreamer1.0-plugins-bad: default to using egl
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
X-List-Received-Date: Thu, 15 Dec 2016 14:40:40 -0000

With the current set of PACKAGECONFIG, we end up building with 'gles2' and neither
'opengl', nor 'egl'. As a result we are building -bad with neither 'glx' nor
'egl' platform support. So let's make sure that we at least have egl by default
(since we default to 'gles2').

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d3c5326d45..3cb7ab1ae1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -12,7 +12,7 @@ SRC_URI_append = " \
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2', '', d)}"
+PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2 egl', '', d)}"
 
 # gtk is not in the PACKAGECONFIG variable by default until
 # the transition to gtk+3 is finished
-- 
2.11.0


