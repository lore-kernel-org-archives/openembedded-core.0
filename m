Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
 by mx.groups.io with SMTP id smtpd.web09.7620.1632487687178449848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 05:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: codethink.co.uk, ip: 78.40.148.184, mailfrom: tom.pollard@codethink.co.uk)
Received: from cpc109023-salf6-2-0-cust777.10-2.cable.virginm.net ([82.29.243.10] helo=localhost.localdomain)
	by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
	id 1mTkcV-0003Lt-8N; Fri, 24 Sep 2021 13:48:03 +0100
From: "Tom Pollard" <tom.pollard@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Tom Pollard <tom.pollard@codethink.co.uk>
Subject: [PATCH] libsamplerate0: Set correct soname for 0.1.9
Date: Fri, 24 Sep 2021 13:47:57 +0100
Message-Id: <20210924124757.86731-1-tom.pollard@codethink.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Manually patch SHARED_VERSION_INFO, which was missed in
the 0.1.9 release and later incorrectly fixed until 0.2.1

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
---
 .../libsamplerate0/shared_version_info.patch        | 13 +++++++++++++
 .../libsamplerate/libsamplerate0_0.1.9.bb           |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
new file mode 100644
index 0000000000..b42d564b4b
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0/shared_version_info.patch
@@ -0,0 +1,13 @@
+Index: libsamplerate-0.1.8/configure.ac
+===================================================================
+--- libsamplerate-0.1.8.orig/configure.ac
++++ libsamplerate-0.1.8/configure.ac
+@@ -53,7 +53,7 @@ AC_PROG_LN_S
+ #  6. If any interfaces have been removed since the last public release, then set age
+ #     to 0.
+ 
+-SHARED_VERSION_INFO="1:8:1"
++SHARED_VERSION_INFO="1:9:1"
+ 
+ 
+ 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
index 6dfc42b436..8345d6880f 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb
@@ -10,6 +10,7 @@ PR = "r1"
 
 SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
            file://0001-configure.ac-improve-alsa-handling.patch \
+           file://shared_version_info.patch \
 "
 
 SRC_URI[md5sum] = "2b78ae9fe63b36b9fbb6267fad93f259"
-- 
2.30.2

