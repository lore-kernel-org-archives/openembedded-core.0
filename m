Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id BF14E7708E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 01:26:27 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id gi1so3889797pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 17:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TFdDKU3NAZXYyjNbGL/tzj9GELwjr0lfzTHZ1R0AgsU=;
	b=HdjCirf2zzqTnaAcN7Lw8rYslxuKgvavQoeY0bhJQXKzCTMznVOYjUCQ6j/YUmg04x
	wwvbpAtP/T5mi4f97rf/lyMA0U8dniBU5kv2wEAAi8x/fHrIoJgGxhnX+qPvnLOj0J/n
	d1Y2EIRvxtCIJ0dHa7XAMi9ewS+eu4PPOJy32PkHR3u4dZHmgHJyTQO820sBFf9uMO6z
	LwEsZkxImU2CFZd0/uT5QxIULoocGcMO3kFPDpZ3HMMnIuqG3kG14uPxD2Xz1L6+OSR3
	d5AWX/IB5OJ/1mH0sh97jKCg3qoJZeG8NAJwP6Nvh9AKXmhrKG/HBRRb2RpE8XUMgp+W
	W3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TFdDKU3NAZXYyjNbGL/tzj9GELwjr0lfzTHZ1R0AgsU=;
	b=PeLcz/bd/1BZLsNxlWJnlY0nGlKFlwQTE0yjY/8YHtfmtfmTiTaNiAjHOqlQVBvPCZ
	oGLY5MyPw82+rYsIs5npIisjWBT5mbo11Kh1GariJPI9VRlc8EKDqccf8UfHnAmqFMv0
	WkynzKLcygyCjYlofUuoir468qj4rmTEEff5PDh5vZKtxy3lqjuztWfeMWWoKEham2N4
	aRKChA67LpWbegOueIc8EGk9YZ5PAKwPTMAlZQ/Ou+UDOtjabVNjAcYNr68ukBMCFN0k
	pq3bJHTSb/G2t6x2GJ7vPvc9eSGRrA0kyMifF+OR21TaTk7LOo5jmTJQR7cPhIxAsHSR
	3/Uw==
X-Gm-Message-State: AG10YOTdFcrHupRNQEUaN9z89R4Kk4ifZFooSCTNKiIx581s3faV8JxL17nbpRp0Uz5NjQ==
X-Received: by 10.66.150.228 with SMTP id ul4mr8798464pab.15.1453512388441;
	Fri, 22 Jan 2016 17:26:28 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	qz9sm12302299pab.39.2016.01.22.17.26.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 17:26:27 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jan 2016 17:26:03 -0800
Message-Id: <1453512366-11405-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
References: <1453512366-11405-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/7] sqlite3.inc: dynamically link the sqlite3 command-line utility
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
X-List-Received-Date: Sat, 23 Jan 2016 01:26:30 -0000

By default, the sqlite3 command-line utility will be statically linked
with sqlite3. For OE, dynamic linking is probably more appropriate and
can be enabled by configuring with "--disable-static-shell".

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index 540d2b6..87cdf26 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -24,7 +24,12 @@ PACKAGECONFIG_class-native = ""
 
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline ncurses"
 
-EXTRA_OECONF = "--enable-shared --enable-threadsafe --disable-editline"
+EXTRA_OECONF = " \
+    --enable-shared \
+    --enable-threadsafe \
+    --disable-editline \
+    --disable-static-shell \
+"
 
 # pread() is in POSIX.1-2001 so any reasonable system must surely support it
 BUILD_CFLAGS += "-DUSE_PREAD"
-- 
1.9.1


