Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TaU5L-0006Bp-EY
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 17:20:35 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Nov 2012 08:05:54 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so129684wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 08:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=qZutUrqA1SnPDm7kCbn+i20DHMo4H3blpPxX9CELtrA=;
	b=UCX9c3muQjUw+aXkyBtFiJjL/Hjk1gxXMDxwpM5uDDX78S2qA1Cjl7tZxSXaPbLK3W
	2sN+AshmjkAeKXd7h4F92OaoATTtNWxm/skIDkiq4b3Cu0EhrNRj8N3dhW5eUFaMpAYC
	6j+w3UxFNswj1abZAqCDzA6Wy9JkPz3zdXscmN4O8UmMjZGr4Uq1o2RpIt17NwDGrn4r
	zheNKd3lFwuuF38biELlzyWJ7VE0u3YQt7VSxQTjvDe0ZK2JtIt+ymCauLymsdp7scG/
	LLFOUtZfR4SK7NAouvYf+c6C7Gu8yR9FJkbZ3Q6l9KKJuZmoDdGxzr7JIZHnuw4JRrlp
	9ZxQ==
Received: by 10.180.7.130 with SMTP id j2mr9719552wia.17.1353341185430;
	Mon, 19 Nov 2012 08:06:25 -0800 (PST)
Received: by 10.180.7.130 with SMTP id j2mr9719527wia.17.1353341185193;
	Mon, 19 Nov 2012 08:06:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id i6sm13924680wix.5.2012.11.19.08.06.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Nov 2012 08:06:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Nov 2012 16:04:55 +0000
Message-Id: <1353341095-11669-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1353341095-11669-1-git-send-email-ross.burton@intel.com>
References: <1353341095-11669-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnNCE/58HP9H9HjbKV9dc9Ai+r9IXxCNmMGEdAoRGW4Z6nTK33PBJCoXtW553ErdjD9wKFbgyEFmN8CDDi6ags/mYM/ST7x7zvJ5J8nXnnNF8naot0aEosKOFVmE2xPLyaysgC/7tlX9giI3sMbZ9C5CWjAjUBbATmj6G2sVzYQO4goNlaTlsIZMrwPPm9gCBEFkPk3
Subject: [PATCH 2/2] mesa: default to enabling EGL and GLES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 16:20:35 -0000

Even on systems where Mesa has no hardware support, building the software
renderers is useful for build testing and limited functionality.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc   |    3 +--
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb   |    2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 8e71378..9e42dbf 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -29,8 +29,7 @@ EXTRA_OECONF = "--disable-glu \
                 --disable-glut \
                 --enable-shared-glapi"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG_append_x86 = " gles egl"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} egl gles"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
index fabb99d..a5a592d 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
@@ -1,4 +1,4 @@
 require mesa-common.inc
 require mesa-${PV}.inc
 require mesa-dri.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 5f8697a..e9e4a88 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -5,4 +5,4 @@ require mesa-dri.inc
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
 DEFAULT_PREFERENCE = "-2"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
-- 
1.7.10



