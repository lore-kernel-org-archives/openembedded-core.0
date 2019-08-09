Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9A97ECB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 14:59:20 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n9so98645649wru.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2019 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gpb4WadaaJ+k4kWd9JWfHWIx7t9kaY39HekiHAyqrEw=;
	b=OUkdPakezKVYbGAT2Eejff7FGTJMc1DP+YpZgzLFFCaEbuqVvNSJl+pCA/xICcePIy
	UDIpZ71CWWbDIB7gZSDV+xwJDccBiac7Yl1puUsm3cskySPPNY/1JG2fJuJ0XifOVcYj
	WA7PXdn65+9XfP/2sQAjq4evqIKhhOIXZPLTmj71roTGcIUU6nyXXaFX3NA5kEMGHimx
	GkTb/J9V6H8Aw02kVUjGoc49zx9NLFF8EX7A2/VUc/jzavV+sJPMKZGioe7eC4EAH0y+
	epcs1Xr58PiMPY/hhK2a5twx6emcLzhJR/Iq6PHBmSf+/CDFYhRneC0R+WpkSgJaK0HK
	1GMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gpb4WadaaJ+k4kWd9JWfHWIx7t9kaY39HekiHAyqrEw=;
	b=MfVC37arihMyLIDAqg6/YVK3Rm4zrqT124y0QcQWuQZpzM/uMEaFplSzAYTizuw8s4
	kgu91IldD+frVw6SkIDcv/9088CdD4Y3Zxhm3/RrwfF9wa+Tf+TuBpEuAs8I7/TTjkMh
	Bw13c8vrdZ+9FPxlXrTSK3TDm3MPp97jJf/Lpu/aM1jMed+2weAb5O485SI58sgAZNmh
	n6QuvWAZ9JybwifVP+lLQTIMLs2O78VA/nMEqDFshdVgHabChqtIo/NoQpa2In8NTnQL
	Fiw6icAKK5Q/rQK1Pun7hUl8O/1WNZvcPJYeMlCv597es94T0sRkPMbYpgTwmh7kUerX
	dedA==
X-Gm-Message-State: APjAAAVi+cs8thgrF/Q3LqxYvVmiUM8wsiaXVAja2Fn0IXbLk0fBhOGX
	BFbqYBCKyP/cNfRYte+dfEvcSw5guFuQ0A==
X-Google-Smtp-Source: APXvYqxRIthOJbk5+zqigWd0163lj1ilV4GGnkeYm+Evqjv3AoG9wNGWpnerIzyOtnTcd2RGUK1bhA==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr24370205wrl.79.1565362760895; 
	Fri, 09 Aug 2019 07:59:20 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a2sm5159160wmj.9.2019.08.09.07.59.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 07:59:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2019 16:59:13 +0200
Message-Id: <20190809145913.114922-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190809145913.114922-1-alex.kanavin@gmail.com>
References: <20190809145913.114922-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] mesa: enable glx-tls option in native and nativesdk builds
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
X-List-Received-Date: Fri, 09 Aug 2019 14:59:20 -0000

Before meson conversion this was always enabled; now it needs to
be explicitly switched on.

This un-breaks the virgl headless test in particular, which regressed
with the meson conversion (and the test is not currently run on AB
due to oudated graphics hardware in it).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e99eb39d26e..60d07f536c8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -54,8 +54,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
                    glx-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl"
+PACKAGECONFIG_class-native ?= "gbm dri egl opengl glx-tls"
+PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl glx-tls"
 
 PACKAGECONFIG_remove_libc-musl = "glx-tls"
 
-- 
2.17.1


