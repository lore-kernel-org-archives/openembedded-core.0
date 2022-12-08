Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3237EC63705
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:11:43 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7701.1670483499485246944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jRASvh/q;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670483503;
  x=1702019503;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gOcpWZH0FEjVb4cL8lKkKww8lH+A5P51JZYdqWOu8Ag=;
  b=jRASvh/qArz4d6RvhCeLtuoHvyE0FWWDq/jIYN05S20paygFNe2Y1jnv
   AmF9+Jq9r7y6mm/LvB3hC3XMzqC7QAQckqOKczn1+K4wJa4FRP9HI1iEH
   j+QF1mIgQLOKkhq3S/ap3Hy6j7nltN180IZuWBWRLE/BKsOYxZ7j6hQHC
   9qf+XMbCvs5QdYMrriYsZZ4e6Tn+lUosxiu21DGxWYAMbn7XW552kQ6Ha
   r1T4jLkiDH341Rtt6EgO5UR/8NXNRkUwt/LC4T10ynKpuMaDK2oeDS6vb
   PvKTU0fdMnA38hF1WCY1zQjhLP1BY0/Vi0RTm7EPoePRpaBVejJNICUF4
   w==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH RFC 3/3] time64.conf: Include to enable 64 bit time flags
Date: Thu, 8 Dec 2022 08:11:36 +0100
Message-ID: <20221208071136.1967696-4-olani@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221208071136.1967696-1-olani@axis.com>
References: <20221208071136.1967696-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 07:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174389

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/conf/distro/time64.conf | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/conf/distro/time64.conf

diff --git a/meta/conf/distro/time64.conf b/meta/conf/distro/time64.conf
new file mode 100644
index 0000000000..99eb06dc0f
--- /dev/null
+++ b/meta/conf/distro/time64.conf
@@ -0,0 +1,23 @@
+GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
+
+# TODO: Only for 32-bit architectures?
+TARGET_CC_ARCH:append:arm = " ${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:armeb = " ${GLIBC_64BIT_TIME_FLAGS}"
+TARGET_CC_ARCH:append:mips32el = " ${GLIBC_64BIT_TIME_FLAGS}"
+
+GLIBC_64BIT_TIME_FLAGS:pn-glibc = ""
+GLIBC_64BIT_TIME_FLAGS:pn-glibc-tests = ""
+# pipewire-v4l2 explicitly sets _FILE_OFFSET_BITS=32 to get access to
+# both 32 and 64 bit file APIs.  But it does not handle the time side?
+# Needs further investigation
+GLIBC_64BIT_TIME_FLAGS:pn-pipewire = ""
+GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers = ""
+
+INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_libstd.so] = "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioctl lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
+INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] = "fcntl fstat64 prctl stat64 clock_gettime"
+INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] = "fcntl lstat64 setsockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 prctl mktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
+
+# libpulsedsp.so is a preload-library that hooks libc functions
+INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] = "setsockopt fcntl"
+
+
-- 
2.30.2


