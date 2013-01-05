Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TrHRb-0000VC-SQ
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2013 01:17:24 +0100
Received: by mail-pb0-f42.google.com with SMTP id rp2so9507536pbb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Jan 2013 16:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=5V0gWLs0X8tikOZxIOSdINWBP74UM5J2yqQTubfC27c=;
	b=UpRdlfjBClSZV4QQGmuhFRB9h0XFx2iEPb+GzEbVPP/KgIL1Ge2yyxRQXjzX0WRcg2
	QyaOuHDdlgpmfx7UncIN+hDQnxldyHxIx7/skhmYTdcSohnifqf+UtXG20trwU5tocnC
	AW86loUEZwsi3JMk4ppN7ibTIC7Rj10KdrivHeShTwsHEou3Ec+YtZhz8Nc+sPIRnsWA
	fVrGMBULBpxfjTu+gP/YFFLzJ2wyzai24OwZom4AeW5WsgWWj1UILQisyBnRokBunwb9
	FPLkPl6sAv4glVIQjCPmhRnZBU3XQOZ/EkmKmStl9n8HGQCoTqwT/0WTkzcFbZ7lcF4U
	D2mg==
X-Received: by 10.68.253.230 with SMTP id ad6mr168549960pbd.84.1357344113533; 
	Fri, 04 Jan 2013 16:01:53 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nf9sm33017692pbc.17.2013.01.04.16.01.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Jan 2013 16:01:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2013 16:00:59 -0800
Message-Id: <9b989d3a02e356e4e83c90ad22508cca3a866f06.1357343832.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
References: <a199c2dc372f0c5a524685e30d8417f05b3713f9.1357343832.git.raj.khem@gmail.com>
In-Reply-To: <cover.1357343832.git.raj.khem@gmail.com>
References: <cover.1357343832.git.raj.khem@gmail.com>
Subject: [PATCH 4/4] ofono: Fix build with eglibc 2.17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000
X-List-Received-Date: Sat, 05 Jan 2013 00:17:37 -0000

include unistd.h explicitly to get ssize_t defined

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ofono/ofono/missing-ssize_t.patch              |   23 ++++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.12.bb      |    3 ++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch b/meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
new file mode 100644
index 0000000..71903c4
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/missing-ssize_t.patch
@@ -0,0 +1,23 @@
+include unistd.h for getting ssize_t definitions
+Fixes errors like
+
+| In file included from src/sms.c:38:0:
+| src/storage.h:32:1: error: unknown type name 'ssize_t'
+| src/storage.h:36:1: error: unknown type name 'ssize_t'
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: ofono-1.12/src/storage.h
+===================================================================
+--- ofono-1.12.org/src/storage.h	2013-01-04 10:01:24.137804178 -0800
++++ ofono-1.12/src/storage.h	2013-01-04 10:02:09.325806426 -0800
+@@ -26,6 +26,7 @@
+ #endif
+ 
+ #include <fcntl.h>
++#include <unistd.h>
+ 
+ int create_dirs(const char *filename, const mode_t mode);
+ 
diff --git a/meta/recipes-connectivity/ofono/ofono_1.12.bb b/meta/recipes-connectivity/ofono/ofono_1.12.bb
index 1767971..c33ede4 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.12.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.12.bb
@@ -3,8 +3,9 @@ require ofono.inc
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
+  file://missing-ssize_t.patch \
 "
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "aa8924c0e8de3ec7ac5e41fe7df4cb99"
 SRC_URI[sha256sum] = "733b75bfd1b2a1925b6de532989c496b8ae17a746691120ef64cceb00b3ef751"
-- 
1.7.9.5



