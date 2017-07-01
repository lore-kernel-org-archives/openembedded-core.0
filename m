Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACF2775DE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:23:50 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id q86so80128742pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CSTZ4auulbSDh84V+l6nf55ZFL4dEFZ5Tc+DgzTUvuc=;
	b=NrzowI33HKpSDCpz7R4w6RmIIf1LjxPB7ZMm53N1M9zEbadfyHa89nfxGP/RWBLRyN
	jFGVAP5Yw9S7PHFyLj0wo3dMPKKkT8Qja/KmjtePumRXvGXwn/rF07/liHXQVDztfvPF
	4GGcMhYHChOtXNCfk03QZ+UIehUjKJYBMeCFLiUyrFpPh48aGz4o7+3bIYSeqF3qyqs/
	RRfhsyVz4WDj1AqVJ5M0SCO7zCswOUivH/rpR65CE8JVYJC7oRKikHoClUXK4/tSM/Bw
	tg/ewnUSlwgwtJREiToUmXYWg3eXf7WvZwcYV0r9LXqNTw1bkWSJQaqaB8IKM9VGh7MF
	CaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CSTZ4auulbSDh84V+l6nf55ZFL4dEFZ5Tc+DgzTUvuc=;
	b=Z48qj0s7ZiLcZhvQfaTJt677J3SNzZWI8g+BjTsmPipnr2jwIzUIk75tUu++rIbrkq
	hjmIaeJccmrOcm0xxcvouk80M0U2VGfs1mk1URvKav+uq77JLRHhLiTF6HSIEzsU5Zl+
	fA2RpSM9z32IGWUtNnyjcjppHumzYsUs0e7YcK+yE2KyqdUw2RBVE3HGuQPklLh2kJAG
	I6gdWkMGxk1SB0J5bFW4qtmXkOs383MQ8PQQaW+0IF8sDIKliumeIqzeHn1Ph0ViPHVO
	1OZS+7q1WLHxeMA0XzkNAmoW5lwYqZEmGhgiuUZE0GzPyBBvXSeFg6b20lcgZb6sy4tf
	xNCg==
X-Gm-Message-State: AIVw112w6eIqBGo4ZgEy/jQfK0wwaqkuxb/XSrtPhULpiRsp+tHRu80k
	1CRZle5Raqf2tbVP
X-Received: by 10.84.200.39 with SMTP id s36mr1001706pld.129.1498919031871;
	Sat, 01 Jul 2017 07:23:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.23.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:23:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:12 -0700
Message-Id: <b7687794f4892313993a930d52e5f5c289a8b855.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 09/19] sysklogd: Improve build and fix runtime crash
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
X-List-Received-Date: Sat, 01 Jul 2017 14:23:51 -0000

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


