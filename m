Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 690D777188
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 06:48:06 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so24451137pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 07 Aug 2016 23:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gbIPdhl/jQlhCUYxfGzv23AU6ZGZNCsoTRcDuZys8Dc=;
	b=QG/ueya2qhaaktgdKJU9I9rmGAKofOb0XT3MclaJ6p0oAIC/tkkNXTTsxa92Ai72W7
	tbA1zUsz8JNuoptk5tX0t//GUhXz7dXcu+IZWgWuy20k8QhTejJLt7FvoMyg4ITHriw9
	QTE+yxv+mQeIfKlXsRafVni8cEQgpM58G3HTTwz0wBF9G4uztgGx7QbDslALkhg9B7YG
	eTOGG9T+3C1mfFP/w4llBSbn8YmEq26WYWKFUo29KCeQIjewrW+96+Pkj+Wfl383JZXi
	q2WvNfKlfdjd8evuPBURV2DjWZFbqiYBqrpCSqYU/CD5KaJJ8Txi9x0xiEQoOAjYvj5M
	spIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gbIPdhl/jQlhCUYxfGzv23AU6ZGZNCsoTRcDuZys8Dc=;
	b=EvAh6bI5QMViWRz11QHgt6NmRGeQtyRCgie3Ue7hWj7RSja/Xxe6tAN2n6jDIVHpY4
	KnjvzyuXSQ5DP1COUgpIqiw3yVY9utdrs2mikYL8eg8WdpH0Au5qo1bsMUTn6dZf1LKi
	cUZ8dRo2Px8HoBPSXwAKxLh7cbrP5BZMXrhQ3ez/osHyyVLcFNn1ZZzru/Que+pdmLQQ
	fZv+eRkt1N6f+aiy06IQqH9eNUxVLHJlsBVmEz3EiHEOqbOCFW33lZQkUQFB8q35CI7q
	DM4ShKE+/vqBgLB94vNERL7Sm7THFLpHQ6PSG3ZuPaeuijA0ilF0i0Iw84zeMWtWo2D/
	PdcA==
X-Gm-Message-State: AEkoouuQspPAbuwmmk4t/U91ajsujfrZECP7PAihHl1V5QLjBJXjLD1tnDi8v7fl9TYc0A==
X-Received: by 10.98.14.72 with SMTP id w69mr160073287pfi.119.1470638887891;
	Sun, 07 Aug 2016 23:48:07 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	q1sm44920020pfd.48.2016.08.07.23.48.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 07 Aug 2016 23:48:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 23:47:57 -0700
Message-Id: <20160808064758.19267-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [PATCH] strace: Fix build with mips/mips64 on musl
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
X-List-Received-Date: Mon, 08 Aug 2016 06:48:08 -0000

SIGEMT doesnt exist on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../strace/strace/mips-SIGEMT.patch                | 24 ++++++++++++++++++++++
 meta/recipes-devtools/strace/strace_4.13.bb        |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/mips-SIGEMT.patch

diff --git a/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch b/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
new file mode 100644
index 0000000..b24378b
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/mips-SIGEMT.patch
@@ -0,0 +1,24 @@
+SIGEMT is not defined everywhere e.g musl does
+not define it. Therefore check it being defined
+before using it.
+
+Fixes errors e.g.
+../../strace-4.13/tests/signal2name.c:45:7: error: 'SIGEMT' undeclared (first use in this function)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: strace-4.13/tests/signal2name.c
+===================================================================
+--- strace-4.13.orig/tests/signal2name.c
++++ strace-4.13/tests/signal2name.c
+@@ -42,7 +42,9 @@ signal2name(int sig)
+ 	CASE(SIGEMT);
+ 	CASE(SIGLOST);
+ #elif defined MIPS
++#ifdef SIGEMT
+ 	CASE(SIGEMT);
++#endif
+ 	CASE(SIGIOT);
+ 	CASE(SIGPWR);
+ #else
diff --git a/meta/recipes-devtools/strace/strace_4.13.bb b/meta/recipes-devtools/strace/strace_4.13.bb
index 51ff41e..cae7f21 100644
--- a/meta/recipes-devtools/strace/strace_4.13.bb
+++ b/meta/recipes-devtools/strace/strace_4.13.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
            file://Makefile-ptest.patch \
            file://run-ptest \
            file://0001-Fix-build-when-using-non-glibc-libc-implementation-o.patch \
+           file://mips-SIGEMT.patch \
            "
 
 SRC_URI[md5sum] = "4b78c7febdd24c79d5147824d1a080a3"
-- 
2.9.2


