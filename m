Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.2775.1612492194012028953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 18:29:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; 
   d="scan'208";a="104222146"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 05 Feb 2021 10:29:52 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 9DC294CE6F6F
	for <openembedded-core@lists.openembedded.org>; Fri,  5 Feb 2021 10:29:47 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 5 Feb 2021 10:29:47 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH v2] mc: upgrade 4.8.25 -> 4.8.26
Date: Fri, 5 Feb 2021 10:29:41 +0800
Message-ID: <1612492181-18260-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 9DC294CE6F6F.A9777
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Fix the do_compile error:
| ../../../mc-4.8.26/lib/tty/tty-ncurses.c: In function 'tty_colorize_area':
| ../../../mc-4.8.26/lib/tty/tty-ncurses.c:557:5: error: unknown type name 'cchar_t'; did you mean 'wchar_t'?
add -DNCURSES_WIDECHAR=1 when musl.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/mc/{mc_4.8.25.bb => mc_4.8.26.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-extended/mc/{mc_4.8.25.bb => mc_4.8.26.bb} (94%)

diff --git a/meta/recipes-extended/mc/mc_4.8.25.bb b/meta/recipes-extended/mc/mc_4.8.26.bb
similarity index 94%
rename from meta/recipes-extended/mc/mc_4.8.25.bb
rename to meta/recipes-extended/mc/mc_4.8.26.bb
index 83c8a6ecf6..291f5eab63 100644
--- a/meta/recipes-extended/mc/mc_4.8.25.bb
+++ b/meta/recipes-extended/mc/mc_4.8.26.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
            "
-SRC_URI[sha256sum] = "407dc20f70082f26c7f5716406cb755cbb6cba3f2f13b841b79a991282d310c2"
+SRC_URI[sha256sum] = "9d6358d0a351a455a1410aab57f33b6b48b0fcf31344b9a10b0ff497595979d1"
 
 inherit autotools gettext pkgconfig
 
@@ -22,6 +22,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
+CFLAGS_append_libc-musl = ' -DNCURSES_WIDECHAR=1 '
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --disable-configure-args"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
-- 
2.25.1



