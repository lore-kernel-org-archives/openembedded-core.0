Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RMOTG-0001fI-Vf
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:26:31 +0100
Received: by gyh4 with SMTP id 4so1449920gyh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Nov 2011 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=4kzXGnQHVEZEahu2/hVDNNZhDLU7DX+XrptSZpcRv9A=;
	b=XNHqeQEy7BKKyCkPcXnDcvQNH9b29WsWWXB+sWTWaHt5Wcx1IB7jef1iUQfMr0VnEq
	4XXdPCDLsN/rNL+r5z8GVKp+ivOwikLUss1IIMoI2HgM5u+JoIQaO/Rzg15L6EbdSMwT
	W+6613jP/7Z6/UyGepOe95IrEvcfc2AjiiX4E=
Received: by 10.236.78.225 with SMTP id g61mr2886081yhe.7.1320430819597;
	Fri, 04 Nov 2011 11:20:19 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id q57sm16408660yhi.22.2011.11.04.11.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 11:20:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 18:20:04 +0000
Message-Id: <f5738a01ffbb87b7b5d7c8a955522e5d92eac5ff.1320430778.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
Subject: [PATCH 1/5] libcap: fix sstate for native package
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
X-List-Received-Date: Fri, 04 Nov 2011 18:26:31 -0000

The 'lib' option needs to be given on target and native builds
otherwise it installs the binaries at ${libdir}64 when host is 64bit.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-support/libcap/libcap.inc     |   15 ++++++++++++---
 meta/recipes-support/libcap/libcap_2.22.bb |    2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 3506530..184b58a 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -21,9 +21,18 @@ do_configure() {
 	sed -e 's,BUILD_CFLAGS ?=,BUILD_CFLAGS := $(BUILD_CFLAGS),' -i Make.Rules
 }
 
-EXTRA_OEMAKE = "LIBATTR=yes PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no"
-EXTRA_OEMAKE_virtclass-native = "LIBATTR=no PAM_CAP=no INDENT= "
-EXTRA_OEMAKE += " lib=${@os.path.basename('${libdir}')}"
+EXTRA_OEMAKE = " \
+  LIBATTR=yes \
+  PAM_CAP=${@base_contains('DISTRO_FEATURES', 'pam', 'yes', 'no', d)} \
+  INDENT= SYSTEM_HEADERS=${STAGING_INCDIR} RAISE_SETFCAP=no \
+  lib=${@os.path.basename('${libdir}')} \
+"
+EXTRA_OEMAKE_virtclass-native = " \
+  LIBATTR=no \
+  PAM_CAP=no \
+  INDENT= \
+  lib=${@os.path.basename('${libdir}')} \
+"
 
 do_compile() {
 	oe_runmake
diff --git a/meta/recipes-support/libcap/libcap_2.22.bb b/meta/recipes-support/libcap/libcap_2.22.bb
index a31ba3f..dd63d9e 100644
--- a/meta/recipes-support/libcap/libcap_2.22.bb
+++ b/meta/recipes-support/libcap/libcap_2.22.bb
@@ -1,6 +1,6 @@
 require libcap.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "ce64058bdb3f086ddbfca8ce6c919845"
 SRC_URI[sha256sum] = "73ebbd4877b5f69dd28b72098e510c5b318bc480f8201c4061ac98b78c04050f"
-- 
1.7.2.5



