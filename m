Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0WI5-0006HI-AK
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 11:52:49 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so459774eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 02:44:30 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.53.7 as permitted sender) client-ip=10.14.53.7; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.53.7 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.53.7])
	by 10.14.53.7 with SMTP id f7mr486085eec.105.1329993870431 (num_hops =
	1); Thu, 23 Feb 2012 02:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=Rlj1ds1iLh07DroLGBxpCU7eech99gH1lpF9vHD1um0=;
	b=Fa1jHQzQh4NgiROkd75XsjJm9eY+Y7bIGDuHHaJGVv5y/Hap3DJOqOu6k1cX7qP+hP
	OjSa/jqa21qK9nMX6A3MjDZnTVUGYtFhAev4I14B6K43OUmVRCxn5FrErBmLG15XKWqY
	JDfZHrlKYdbrTeMQ7HJjYddOvJ0bAQmQH2glw=
Received: by 10.14.53.7 with SMTP id f7mr386140eec.105.1329993869993;
	Thu, 23 Feb 2012 02:44:29 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm4040091eem.0.2012.02.23.02.44.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 02:44:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 11:43:42 +0100
Message-Id: <3e1c594f0f2dcae9d8a611c435aa6aeef4be8fb7.1329993620.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
References: <d04b7081c135f61e831e1b6cdc6fc6f4bb2340a8.1329993620.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329993620.git.Martin.Jansa@gmail.com>
References: <cover.1329993620.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Thu, 23 Feb 2012 10:52:49 -0000
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
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   20 +++++++++++++++++++-
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

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
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index a4714e7..0f95c97 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.8.4



