Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WIC-0006HI-JX
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:56 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so459774eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:44:37 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.34.196 as permitted sender) client-ip=10.213.34.196; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.34.196 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.34.196])
	by 10.213.34.196 with SMTP id m4mr267040ebd.51.1329993877716 (num_hops
	= 1); Thu, 23 Feb 2012 02:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ogbHmyz+zalc7FrOnUvm/3r7i9hVFtjXqi9diSxlX4E=;
	b=JD0o9dE2y382fnvn+fwGs4f9Jez62IJYbwWkMJ7tsIhn8LZEbZKgrlgdRjdFNi9Opn
	Fnjw7W01LVgUQi9L7FWc0eiRAueZU3N2TdPyuDlyJqjs+33czac6SM9U56NyK+/84IqB
	HQ8FwR4wPVtaOfuqq/h7RyIN9eWiMKVgoCks8=
Received: by 10.213.34.196 with SMTP id m4mr212253ebd.51.1329993877471;
	Thu, 23 Feb 2012 02:44:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w60sm4003931eeb.4.2012.02.23.02.44.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:44:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:43 +0100
Message-Id: <ea3db66962f588e0614f091f31bb5b929eb8a742.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
Subject: [PATCH 7/7] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Thu, 23 Feb 2012 10:52:56 -0000

* seems like config/config in -L was also wrong

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |    7 +++++--
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index b5746ce..1f39188 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -10,12 +10,15 @@ RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
 
 EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
 
+NATIVESDK_LIBDIR = "${NATIVESDK_SDKPATHNATIVE}${libdir_nativesdk}"
+NATIVESDK_INCLUDEDIR = "${NATIVESDK_SDKPATHNATIVE}${includedir_nativesdk}"
+
 do_configure_prepend() {
 cat > ${WORKDIR}/python << EOF
 #! /bin/sh
 case "\$2" in
-        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
-        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_INCLUDEDIR}/python${PYTHON_BASEVERSION}/" ;;
+        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${NATIVESDK_LIBDIR}/python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
         --exec-prefix) echo "/usr" ;;
         *) exit 1 ;;
 esac
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index 0f95c97..dbcffde 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.8.4



