Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBF6C001B2
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 11:47:04 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.11215.1671191213969697347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 03:46:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=e6TkAbO+;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: ola.x.nilsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1671191214;
  x=1702727214;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7+2g3F2D1BEDz8tO/vdGkhLdU2mrn8AtlIIvH54gHqo=;
  b=e6TkAbO+E9IIKT6GVskq6higTj9UF2j+wwFYlH670vkfFBcwWNV/0Cae
   RTG7OyljGAGyiI0GJnPL19FU6e7FTullKN+Bv4AdU/Bj95vEYjyv7Uo/H
   Q/M5ANUaMOcbnuOZSDbkebgnEuha1l3wUFGktsfylgP7WkZGiMjDzlyf6
   WZTPxW/kj6GUWzI8DXzPMs4sfVbb7pte0hnmRe+nMQxVIm2Ei2GKF/Xot
   YiiZkr+GIa7RR5XkMJ6sLgg0YwAWrJRwiLdkbDV9EdToaj264Ox/uyqMf
   YXSolYJ0wlVgAQ+PkLwJqwz9gE2LHOPVsnb3JmwPNUM9YsJottSMt7LCC
   w==;
From: Ola x Nilsson <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH RFC v2 2/2] time64.inc: Include to enable 64 bit time flags
Date: Fri, 16 Dec 2022 12:46:50 +0100
Message-ID: <20221216114650.854563-3-olani@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216114650.854563-1-olani@axis.com>
References: <20221216114650.854563-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 11:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174738

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/conf/distro/include/time64.inc | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/conf/distro/include/time64.inc

diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/include/time64.inc
new file mode 100644
index 0000000000..122ee6bf4c
--- /dev/null
+++ b/meta/conf/distro/include/time64.inc
@@ -0,0 +1,20 @@
+GLIBC_64BIT_TIME_FLAGS = "-D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64"
+
+TARGET_CC_ARCH:append = " ${@oe.utils.conditional('SITEINFO_BITS', '32', '${GLIBC_64BIT_TIME_FLAGS}', '', d)}"
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


