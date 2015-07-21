Return-Path: <tobias.olausson@pelagicore.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 05EE66013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 17:46:51 +0000 (UTC)
Received: by padck2 with SMTP id ck2so123311822pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 10:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gwBmj90KBnZokF144sY6ooMp4cAXohBaY206SXqLd4c=;
	b=FgMEvWiIzarYkrpIiAYcJj4+rBA71vKd06wYs+3tHp9UCedruZYfO3KmP+QUK93CCu
	624efW/UMqsTqSJrJogKJczs8knFUW5tRDzXBgBq4bYhLcU0iPp1cqOFOl4bp5dZJA9c
	no9wTXnUcWDPotjgAVP8eESRiqa4FeO7QcFGmOHvD5mgWbwFtdLHEEgHFkMRcstHwB8M
	ddTbbPEVnNke/27SN+aiFW0/QO2JFYt084JWBNEfdPSCnfxcJB+tHW2DBxyL99Es8KQ8
	FcSF7e9kX6y7xHH4CZ5x7uD4TCAVpQVYaZlHbu38RPyIcoVyB2UPPQ72N/uVLyXtZ66J
	q6ng==
X-Gm-Message-State: ALoCoQn3mV31wn2SzdYbKRuHg71YQdG3xkx1K3vicZJMxq0SqcP8RfonY5JiLYLHWsMy8OkCBNjE
X-Received: by 10.70.37.144 with SMTP id y16mr75029134pdj.86.1437500811900;
	Tue, 21 Jul 2015 10:46:51 -0700 (PDT)
Received: from localhost.localdomain ([38.104.105.146])
	by smtp.gmail.com with ESMTPSA id 1sm28615755pds.79.2015.07.21.10.46.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Jul 2015 10:46:50 -0700 (PDT)
From: Tobias Olausson <tobias.olausson@pelagicore.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jul 2015 10:46:11 -0700
Message-Id: <1437500771-20097-1-git-send-email-tobias.olausson@pelagicore.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mesa: fix sed for MESA_EGL_NO_X11_HEADERS in fido
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
X-List-Received-Date: Tue, 21 Jul 2015 17:46:55 -0000

In 10.4 versions of mesa, the check for MESA_EGL_NO_X11_HEADERS uses an #ifdef,
not an #if define().

Also, this backports commit 9c746017af381884cc20c7cd563fc429c2c66112
to fido from master.

Signed-off-by: Tobias Olausson <tobias.olausson@pelagicore.com>
---
 meta/recipes-graphics/mesa/mesa_10.4.4.bb | 2 +-
 meta/recipes-graphics/mesa/mesa_git.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_10.4.4.bb b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
index 90cccbe..a5f510d 100644
--- a/meta/recipes-graphics/mesa/mesa_10.4.4.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.4.4.bb
@@ -11,6 +11,6 @@ S = "${WORKDIR}/Mesa-${PV}"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 1598019..269ae1e 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -13,6 +13,6 @@ S = "${WORKDIR}/git"
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
 do_install_append() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#if defined(MESA_EGL_NO_X11_HEADERS)/#if ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if defined(MESA_EGL_NO_X11_HEADERS) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
     fi
 }
-- 
2.1.4


