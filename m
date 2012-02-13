Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rwy9J-0006xO-MW
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 16:49:05 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so1581425eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 07:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=WbRbQ30EJrKOl4abU8MYlbKoezT7W/aAfFiZn7zDz4s=;
	b=fqscB5tR8EbLzOPhvv+Kq/ef5EB+cYK06o+8lOWLpDWm+IpqCAuE4x6VWqstLJ1VVL
	V9zYuhkLL3oeNEnBzuBq5En1I+7O83zloCYmhlKPTK9sM1eyZdq3lyoBygcygskmLYMR
	z09qsOUT/4du8lklvTu1IGyrpecPX5n2uJ1sE=
Received: by 10.213.22.84 with SMTP id m20mr2816791ebb.38.1329147658343;
	Mon, 13 Feb 2012 07:40:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y12sm62160574eeb.11.2012.02.13.07.40.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 07:40:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2012 16:40:46 +0100
Message-Id: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1329147583.git.Martin.Jansa@gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Mon, 13 Feb 2012 15:49:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Eric BENARD <eric@eukrea.com>

* python support is needed for providing finer scripting control
in gdb, and for remote controling gdb for example from qtcreator
* gdb/configure tries to autodetect python using python executable
with --includes --ldflags --exec-prefix to get the right flags
As it's difficult to achieve in OE's context, we generate a
script which will return the right values and make gdb's build
system happy. This idea was taken from the following article :
http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-relocation.html
* tested using angstrom & armv7 target & qtcreator 201005 & 2.4.0

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: fcooper@ti.com
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index ec0748e..b5746ce 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -4,4 +4,22 @@ DESCRIPTION = "cross-canadian gdb for ${TARGET_ARCH} target - GNU debugger"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
-DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk readline-nativesdk"
+DEPENDS = "ncurses-nativesdk expat-nativesdk gettext-nativesdk readline-nativesdk python-nativesdk"
+RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
+             python-nativesdk-codecs python-nativesdk-netclient"
+
+EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
+
+do_configure_prepend() {
+cat > ${WORKDIR}/python << EOF
+#! /bin/sh
+case "\$2" in
+        --includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
+        --ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --exec-prefix) echo "/usr" ;;
+        *) exit 1 ;;
+esac
+exit 0
+EOF
+        chmod +x ${WORKDIR}/python
+}
-- 
1.7.8.4



