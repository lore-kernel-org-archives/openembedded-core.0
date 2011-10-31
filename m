Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvyP-00028P-54
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:48:37 +0100
Received: by mail-fx0-f47.google.com with SMTP id s16so6404872faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vNGGdcHL7zY4p/yryZ6uDpp39xTBzgzsSUvISFcHDNk=;
	b=A4mPL8atpWtXAwF7T9ZgW/uKGBHE17VqjMGxUvWcunwwymA+DnoblGxHs+KuYj+w4W
	Q/UB/Qv5JymyyiAOhoz1xOMVxwXTNb3c5G8DTRYRlQdOnW1xrLGiGpA7POAvCpDQPq8p
	GAoJVLq+lFUcjTynAANNGalcIzQiG6f/fVfm0=
Received: by 10.223.17.3 with SMTP id q3mr30661421faa.28.1320082943030;
	Mon, 31 Oct 2011 10:42:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l26sm26632814fad.17.2011.10.31.10.42.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:42:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:41:47 +0100
Message-Id: <dac48ff1192cd6e4d39aa6e1696e91336d371d97.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
References: <b284e9a512860b8a8380be80f96cebce6b92ff80.1320082621.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320082621.git.Martin.Jansa@gmail.com>
References: <cover.1320082621.git.Martin.Jansa@gmail.com>
Subject: [oe-core 4/7] python-2.7.2: fix build issues when additional modules are linked against host or native libpython instead of target
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
X-List-Received-Date: Mon, 31 Oct 2011 17:48:37 -0000

* -L. is needed to find right libpython
* -L${STAGING_LIBDIR} is needed ie for python-zlib to find right zlib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.2.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index af14adb..45d8350 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -51,6 +51,7 @@ do_compile() {
 	install -m 0644 Makefile Makefile.orig
 	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
 	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile
+	sed -i -e 's,LDFLAGS=,LDFLAGS=-L. -L${STAGING_LIBDIR},' Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	# save copy of it now, because if we do it in do_install and 
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
-- 
1.7.7.1



