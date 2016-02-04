Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 77B8C77344
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 23:04:29 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 65so57493003pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 15:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EvKJ2dlV8ijHFRGQ6a9ifq2b8B7RnqRbFLsZhPxLSj8=;
	b=FmJrpWfP5QA+lHIcdnxD+ROKL0Y0pkft0pzYTVvH3SXfUyO1bnkc4W1ZPFCKFDnD5Y
	6oDi8NNx5Bj6DbgiAswK2W8vjl9wit43kBVqxqBeN/IVQ9DljJk1+KBmctxyCQbBj17W
	7+uGgShUNiHF8ea5xX0dxrHEdGqiKsDThldhw19rWI5p9QzD5PKL3Pi/xerHBiFzFKVw
	JiUCRM10u2HwcP7S0vaReNK3r0EttIew9N6cox95fO4X/ersHO4spCp95mR8n72gmBuU
	AbfRMxNaDTJQzq7V5llI099HzRV8rIte92nXwU0h4nGrke/d6K2N4GRo9wuzGrj/Tikb
	Sh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EvKJ2dlV8ijHFRGQ6a9ifq2b8B7RnqRbFLsZhPxLSj8=;
	b=GKOBq2s3Fk5sEDZyhyDtXA96pLBEBdwnQ6ugYi8Coaue1g+3sjzVl3K39PuK6aNp+9
	aq6X2A11V3v8BbekEgi4vMiSQ9ptKfVZtwM5+M+M6Af2Czon8W7jKY6e8ypsDUVDXXLs
	7ao3lrIT78ITIA0kiQBg0aXorNw8F4mRJKaamAFH3soZvVvSqnl7lsPCY4UBfPM1hGNo
	J4FKyozhJlW8jJi4PEgiJkwyaJDQ8tj8Jep7dhGlrafO6H5eNA3Mey+JIi2ZjfrT76ga
	ZgNDd9odR+h5fusD1QCbU4bejEdOcr5DfNKTtSeo1LhdXNhM8cx3LcnZ6QcOZgPKwYGG
	MNeQ==
X-Gm-Message-State: AG10YOROPMxHp01XNFe1lSGxKbhMnqloDF/MIDqWbMzDyt4R8/h9qSjMWhY9Sgx4iYvTSA==
X-Received: by 10.98.87.204 with SMTP id i73mr14994079pfj.63.1454627070260;
	Thu, 04 Feb 2016 15:04:30 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	76sm19535589pft.44.2016.02.04.15.04.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 15:04:29 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 15:04:15 -0800
Message-Id: <1454627058-26663-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/5] gstreamer1.0-plugins-good_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Thu, 04 Feb 2016 23:04:29 -0000

musl libc generates warnings if <sys/poll.h> is included directly.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../avoid-including-sys-poll.h-directly.patch      | 44 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-good_git.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
new file mode 100644
index 0000000..c7f3630
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/avoid-including-sys-poll.h-directly.patch
@@ -0,0 +1,44 @@
+From 4bfe2c8570a4a7080ec662504882969054d8a072 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 3 Feb 2016 18:12:38 -0800
+Subject: [PATCH] avoid including <sys/poll.h> directly
+
+musl libc generates warnings if <sys/poll.h> is included directly.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ ext/raw1394/gstdv1394src.c  | 2 +-
+ ext/raw1394/gsthdv1394src.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/raw1394/gstdv1394src.c b/ext/raw1394/gstdv1394src.c
+index dbc7607..3c42b41 100644
+--- a/ext/raw1394/gstdv1394src.c
++++ b/ext/raw1394/gstdv1394src.c
+@@ -37,7 +37,7 @@
+ #include "config.h"
+ #endif
+ #include <unistd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <fcntl.h>
+diff --git a/ext/raw1394/gsthdv1394src.c b/ext/raw1394/gsthdv1394src.c
+index 0b07a37..9785a15 100644
+--- a/ext/raw1394/gsthdv1394src.c
++++ b/ext/raw1394/gsthdv1394src.c
+@@ -36,7 +36,7 @@
+ #include "config.h"
+ #endif
+ #include <unistd.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/socket.h>
+ #include <errno.h>
+ #include <fcntl.h>
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
index 5f36f49..915be73 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_git.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-plugins-good;name=base \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+    file://avoid-including-sys-poll.h-directly.patch \
 "
 
 PV = "1.7.1+git${SRCPV}"
-- 
1.9.1


