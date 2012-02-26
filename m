Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S1Z02-0007VH-M0
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 08:58:30 +0100
Received: by mail-ey0-f175.google.com with SMTP id e1so159520eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 23:50:08 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.32.148 as permitted sender) client-ip=10.213.32.148; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.32.148 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.32.148])
	by 10.213.32.148 with SMTP id c20mr2597368ebd.109.1330242608344
	(num_hops = 1); Sat, 25 Feb 2012 23:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=ro3B+DrBCD9GAHlkxreIXzi5FD7mFfKfZ/TsXumxgD4=;
	b=gvLmNZftkyQ4e2dVzG99wgxs3EIcKpDhv2wkMdMJzzjATYOTuiOn2r3BUx4dpOhcPN
	xYpuheXMUpcWO0idC5SLqDw4z63wYxYpbKcVBvMxZmL0/edzZ2azn1P+cBXZ52KjDgxH
	WiXFy3dDaAVwBaa+SoL/sWuGnNfjDT8LQ6q7M=
Received: by 10.213.32.148 with SMTP id c20mr1973553ebd.109.1330242608251;
	Sat, 25 Feb 2012 23:50:08 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i10sm1717639eea.8.2012.02.25.23.50.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 25 Feb 2012 23:50:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 08:49:42 +0100
Message-Id: <4f9ef690b7dcf5931be1f20c4257283eb9a9a0ce.1330242184.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
References: <85003f1e060b6a4406bdde5c48fb9a09bea2ee05.1330242184.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330242184.git.Martin.Jansa@gmail.com>
References: <cover.1330242184.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv2 3/5] gdb-cross-canadian: build gdb with python support
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
X-List-Received-Date: Sun, 26 Feb 2012 07:58:30 -0000
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

* MJ: updated paths to python as disscussed here
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/018222.html
  now it's easier with cross-canadian staging dir and SDKPATH fixed :)

Signed-off-by: Eric Bénard <eric@eukrea.com>
Cc: fcooper@ti.com
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   20 +++++++++++++++++++-
 .../recipes-devtools/gdb/gdb-cross-canadian_7.4.bb |    2 +-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index ec0748e..a7cac61 100644
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
+        --includes) echo "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}/" ;;
+        --ldflags) echo "-L${STAGING_LIBDIR}/../python${PYTHON_BASEVERSION}/config -lpthread -ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+        --exec-prefix) echo "/usr" ;;
+        *) exit 1 ;;
+esac
+exit 0
+EOF
+        chmod +x ${WORKDIR}/python
+}
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
index a4714e7..dbcffde 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_7.4.bb
@@ -1,7 +1,7 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.3"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 EXPAT = "--with-expat"
-- 
1.7.8.4



