Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJc7-00043l-QP
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:38:15 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=6wqt3R1I4n2D/DhsH0xcDdEsCWhA/HNl81bbBmeLuFo=;
	b=DphsiS6J/bc45m9wMF3AaysUb1RbopkttcWhqyRzdNlNa3YJ/vOJts8yHB2vEAmRES
	O2+ubv2ut0doXfHcvUxOG6k9Zsnle6zDsYjXXARc4P21Jy9c/ZiQXd+65Yj76vEgZUXY
	AYA0NJlLZfOMbFhR0pp7yIOHhIPOwXOMXrjrM=
Received: by 10.204.132.199 with SMTP id c7mr2389681bkt.45.1318505554294;
	Thu, 13 Oct 2011 04:32:34 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm3289429bkv.3.2011.10.13.04.32.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:32 +0200
Message-Id: <c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 11:42:20 -0000

* not everybody needs i915, i965

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-dri.inc     |    4 ++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb |    2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 603438e..be6905c 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -6,6 +6,10 @@ DEFAULT_PREFERENCE = "-1"
 
 EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium --without-gallium-drivers"
 
+MACHINE_DRI_MODULES ?= ""
+PACKAGE_ARCH = "${@['${MACHINE_ARCH}','${TUNE_PKGARCH}'][bb.data.getVar('MACHINE_DRI_MODULES',d,1) == '']}"
+EXTRA_OECONF += "--with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
+
 python populate_packages_prepend() {
 	import os.path
 
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
index 2cb2e05..11fdc9b 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -5,6 +5,4 @@ PR = "${INC_PR}.0"
 
 LEAD_SONAME = "libGL.so.1"
 
-EXTRA_OECONF += "--with-dri-drivers=swrast,i915,i965"
-
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-- 
1.7.7



