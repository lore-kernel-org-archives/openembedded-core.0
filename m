Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 101A1770FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 18:32:44 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id s5so57875327qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 10:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3EEoM9eSRuwxs+u8MaVUQpoDd5RwGyyz4eLf+nLZbaU=;
	b=B9QgUCTHc1Sfx7iFD8PslMumA5D1PA9KRvFTEnhKq6epOoZiB+JwdTv1/S7vTSELQ8
	yATQ3AqaVzY71PXJ619IJ3Yp977lQBMPzWR1sXqoqNN7nxw0L3iiOhe5MVo3XFyG/+aV
	hAgGxtKhs+nf3+buJ4IbEGpD0O+lSfIKYat1qxGKGkt0jqmflDHJCQe+qf4BzXV/4R9u
	6SwIYldKrTDO0r6GpPRYHqkfBySbCuRe3yTxfNIXkpO7l9GNuyc4cnL4DPl+9yyM1Um6
	7oAMRyMq0N1MD87O311JJYlFMvMmzdI0PQslK6ioyozJ0mItkGw9xpsQnT44oWvPG5qu
	7Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=3EEoM9eSRuwxs+u8MaVUQpoDd5RwGyyz4eLf+nLZbaU=;
	b=kXQN5RjqLkJZyJi2Vlsjgkx4OfS3l3P+qzhKhZSVKESKRFNPyH79aWFr+M9YilUmGz
	+PZsayBauFYTFO1yMde0K/XOe4XzrGvhzeyc1M8V+QG3cS4aeqLm3r2pJLnWOsP25e6E
	8pbbuSqbSGxlZTpFymFZqoE2t2lhTjPHd4Xt+V9ap09IboNIdzks/QCM/vqO7IfgIupR
	xeqfve7XvjXvTTBi4CNaCmItS4R1/HH/FmDG1tiZD5qBuRAonwNEs7lHjHX7ocROpuQ6
	KiLLSyl094PYIQPLsBzPKxMn0YWG//OTCAqDXFoiGaK5ADfc7w/mAHVLRkW/m75Ki04U
	4x7w==
X-Gm-Message-State: AG10YOQhTz3r9bNR/c4r4lq2j1CDDWkRa+RCj7jYYsYAzS56B8Kq5HDYmpZiPOa7be3J/Q==
X-Received: by 10.55.71.135 with SMTP id u129mr23382726qka.26.1453746765376;
	Mon, 25 Jan 2016 10:32:45 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id h99sm9201586qge.7.2016.01.25.10.32.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Jan 2016 10:32:44 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:32:22 +0000
Message-Id: <0e830ad5924e6325611a9d8d79c799ee83cdae53.1453746280.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
References: <ebc4ed16be5884afa7dfaa10f7f0db64baaca54d.1453746280.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
Subject: [PATCH 06/11] gdb: Fix build failures on musl
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
X-List-Received-Date: Mon, 25 Jan 2016 18:32:45 -0000

mode_t is needed by gdbserver headers so include sys/types.h to get them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |  1 +
 .../gdb/0001-include-sys-types.h-for-mode_t.patch  | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index e970450..4ea14c1 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -5,6 +5,7 @@ inherit gettext
 SRC_URI += "file://0002-Change-order-of-CFLAGS.patch \
             file://0003-Add-support-for-Renesas-SH-sh4-architecture.patch \
             file://0001-Use-exported-definitions-of-SIGRTMIN.patch \
+            file://0001-include-sys-types.h-for-mode_t.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
new file mode 100644
index 0000000..a0292e4
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0001-include-sys-types.h-for-mode_t.patch
@@ -0,0 +1,30 @@
+From acbee4edacb80b5eeaff2480712fe98e56443997 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 19 Jan 2016 18:18:52 -0800
+Subject: [PATCH] include sys/types.h for mode_t
+
+mode_t is used in target.h, so we need to include sys/types.h to get the
+defintion
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ gdb/gdbserver/target.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gdb/gdbserver/target.h b/gdb/gdbserver/target.h
+index 9a40867..aaecab9 100644
+--- a/gdb/gdbserver/target.h
++++ b/gdb/gdbserver/target.h
+@@ -27,6 +27,7 @@
+ #include "target/waitstatus.h"
+ #include "mem-break.h"
+ #include "btrace-common.h"
++#include <sys/types.h>
+ 
+ struct emit_ops;
+ struct buffer;
+-- 
+2.7.0
+
-- 
2.7.0


