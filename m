Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 4733871DCF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:42 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e7so1956866pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CSTZ4auulbSDh84V+l6nf55ZFL4dEFZ5Tc+DgzTUvuc=;
	b=b8HGWeGGFWAoiVI360LR7XHUB+mlsuHonJv05B6b4ST9ImqBF9YtwwTvtffrDJs4+5
	mc+nSDb91YYf5S4B87XXUAZAEEvUYhay9v1I340FvspN+svMMvOcjGcfmgnQz8qgPNn8
	J7n6xiJFidJjFkULVzNCIHfqvZpf8WyvOn39qul3I+Yt2ijIfJb4SgknFm3MLJMpQtPQ
	atmc9DFsjHJwDSWmzhIO1bblq47BWO4ZP2uCxkaLSODI9Vjc/d2nx05F3ohSPv3cJEQV
	5iXFsEY845z8g1//IVV/xTIEkkroyTDST8UNLSPX1gSyIutt9GJuX/TMMMnSQAEMqchT
	8mVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CSTZ4auulbSDh84V+l6nf55ZFL4dEFZ5Tc+DgzTUvuc=;
	b=C2K9mB02aCQLcI0fWc6Z+D4MTZEtwqm3ZwCEskePdhgEe9PkO4GKDzbC0Dlcgx7Apc
	qBsDszw56P6cWpCvarb2TzgxJCFPi27AZZc8ZMPgECI3DboJ1O+UvOCeRZZfoTq3jWAg
	JyfFCx9+QYtAifEvU2VR++u5JX2ZcB37FpaRXCE/G48RU9YKlWGOZjjFGaUMhe37loDF
	g+L5KF/yJze+UYo3rIM+zJK+05w3v7p2AnL4gva6qHUHa4E/aplae8JVPilMEo8KbkM1
	BKLXeVXcxXiuLhmnlK3bJpynmelFPMH4bOW4pQrisIPvOmZ6uk2Z0ieCO0sAa8SxqbxL
	sI6A==
X-Gm-Message-State: AIVw1114EyMT+C51UUv335BmsTaHBiz5BqlUOwD42dRFRSJoLdhKg4lh
	XS7IehHslcfp6Xsw
X-Received: by 10.99.97.76 with SMTP id v73mr26480782pgb.188.1499351624151;
	Thu, 06 Jul 2017 07:33:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:07 -0700
Message-Id: <19605fc65e0715b61d93876893ca087c691502bf.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 06/22] sysklogd: Improve build and fix runtime crash
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:43 -0000

Patch the makefile so it can respect flags from environment
add a patch to fix a run time crash

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-that-causes-a-segmentation-fault-under-.patch | 28 +++++++++++++++++
 ...way-for-respecting-flags-from-environment.patch | 35 ++++++++++++++++++++++
 meta/recipes-extended/sysklogd/sysklogd.inc        |  6 ++--
 3 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch

diff --git a/meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch b/meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
new file mode 100644
index 0000000000..56431af845
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0001-fix-problems-that-causes-a-segmentation-fault-under-.patch
@@ -0,0 +1,28 @@
+From cb72b3e172c238b4b5ae5935dc6be54f5034fcf1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Jun 2017 18:20:06 -0700
+Subject: [PATCH 1/2] fix problems that causes a segmentation fault under some
+ conditions
+
+Upstream-Status: Inappropriate [ no upstream ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ ksym_mod.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/ksym_mod.c b/ksym_mod.c
+index 6e26da1..a3daa7d 100644
+--- a/ksym_mod.c
++++ b/ksym_mod.c
+@@ -186,7 +186,6 @@ extern int InitMsyms()
+ 		else
+ 			Syslog(LOG_ERR, "Error loading kernel symbols " \
+ 			       "- %s\n", strerror(errno));
+-		fclose(ksyms);
+ 		return(0);
+ 	}
+ 
+-- 
+2.13.2
+
diff --git a/meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch b/meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
new file mode 100644
index 0000000000..ebbdef303b
--- /dev/null
+++ b/meta/recipes-extended/sysklogd/files/0002-Make-way-for-respecting-flags-from-environment.patch
@@ -0,0 +1,35 @@
+From b22f244732cd0f475af2f82fc7eecec49f90623b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jul 2017 00:01:50 -0700
+Subject: [PATCH 2/2] Make way for respecting flags from environment
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5af1689..af699d2 100644
+--- a/Makefile
++++ b/Makefile
+@@ -17,14 +17,12 @@
+ #   along with this program; if not, write to the Free Software
+ #   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ 
+-CC= gcc
+ #SKFLAGS= -g -DSYSV -Wall
+ #LDFLAGS= -g
+-SKFLAGS= $(RPM_OPT_FLAGS) -O3 -DSYSV -fomit-frame-pointer -Wall -fno-strength-reduce
++SKFLAGS = $(CFLAGS) $(CPPFLAGS) -DSYSV -Wall -fno-strength-reduce
+ # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
+ # -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE
+ # $(shell getconf LFS_SKFLAGS)
+-LDFLAGS= -s
+ 
+ # Look where your install program is.
+ INSTALL = /usr/bin/install
+-- 
+2.13.2
+
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 78b8d7a985..644728ae67 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -16,6 +16,8 @@ inherit update-rc.d update-alternatives systemd
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
            file://0001-Fix-build-with-musl.patch \
+           file://0001-fix-problems-that-causes-a-segmentation-fault-under-.patch \
+           file://0002-Make-way-for-respecting-flags-from-environment.patch \
            file://sysklogd \
            file://syslog.conf \
            file://syslogd.service \
@@ -32,9 +34,7 @@ SYSTEMD_AUTO_ENABLE = "enable"
 INITSCRIPT_NAME = "syslog"
 CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-CFLAGS_append = " -DSYSV"
+CFLAGS += "-DSYSV -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
 
 do_install () {
 	install -d ${D}${mandir}/man8 \
-- 
2.13.2


