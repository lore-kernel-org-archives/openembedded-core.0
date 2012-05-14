Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SU0Br-0004dt-VP
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 20:40:17 +0200
Received: by vbbfr13 with SMTP id fr13so5585933vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 11:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=dYCLbqAnEqjyjAzQ9WcbDocXjSQYQE08FpVdX8MygM4=;
	b=u3URJTARwVKgMgJN/JO3WHMVQiOeMc+Yo27dqChBVBBxoq2ANJz4VDaktAUR9Fslza
	YkD3rNAynn5CA14HXTFRZlSwlbnYM+Yliiv1RYiuOHna2g6ZWDh4BtluS8dVafdCpZIB
	ZrlMG7cWuiM9ugJoDWdhXytcituEFKRhREySR5mlig36tEVcXk4KYeVxN8zkA4SMYmub
	N/NicbbBIH/YYPxGwEDkKbCpGrTAmDJOUXZK0RSL3wu1hKzgFOqEVAlXIX1DQVQXO9x5
	VN+Vqt0ZojVe2LuAM5jWbY82a9yMiuU8PDPBw7qJ8z07DkQoB+jv55K89IFuLk/tONMh
	jqMA==
Received: by 10.220.39.197 with SMTP id h5mr1283311vce.51.1337020215576;
	Mon, 14 May 2012 11:30:15 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id v16sm22617048vdi.21.2012.05.14.11.30.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 May 2012 11:30:15 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 May 2012 15:30:06 -0300
Message-Id: <082e4970f3fa5b102b9ef716e300d017f70601cd.1337020062.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
References: <f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1337020062.git.otavio@ossystems.com.br>
References: <cover.1337020062.git.otavio@ossystems.com.br>
Subject: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Mon, 14 May 2012 18:40:17 -0000

The pkgconfig files need to be installed in ${libdir} instead of
${base_libdir}.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-kernel/kmod/kmod_git.bb |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index d9c4d8b..a4a284e 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -3,7 +3,7 @@
 
 require kmod.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 PROVIDES += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
 RPROVIDES_${PN} += "module-init-tools-insmod-static module-init-tools-depmod module-init-tools"
@@ -34,6 +34,10 @@ do_install_append () {
 
         # install depmod.d file for search/ dir
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
+
+        # fix pkgconfig installation path
+        install -dm755 ${D}${libdir}
+        mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 }
 
 pkg_postinst_kmod() {
-- 
1.7.2.5



