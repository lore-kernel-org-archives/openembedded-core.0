Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.501.1589405737487299085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 14:35:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=koshGVai;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=ce53=63=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Mnyt2BzbzJD
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 23:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589405734;
	bh=Gthv4eDD2eVL8EwdFo/W8ux7q8lEXMu2s0scvxWbvSs=;
	h=From:To:Subject:Date:From;
	b=koshGVaiRbS3ePyrB2oPu5o+J4vj9N5WmYKHWyA8fCvJBfvnGITxncx9zUXdY93P+
	 0hj5decQtgYk7Ma7QmQS9XxPa5CAUhWrS6pfr2magYVx33VDltXEBxgm/uWWYPdaPy
	 Vui6eKgtpFSQGsELvmg5VthpLlnhfMHF/Xway/j4kFdCINmY8+QPI8PbG0we8vcxwD
	 eJXhuAGAqM24SiRhwgT2w1Vcy6SHIrIGgQDmPKH1deMlQ+64qOyz6/2oHqra0ScdlD
	 84HBYSJWe8FDv4hI3bM40OUQBxkNP2dyvqJCrznaBjHfm3xMNNPnbixoOYbIX7YVZl
	 1k4YDm6wkTWyW6Wu5rVSYDhA2CvLqxLPK7LEz1uLBiVxojApYb1gnKhR3fJWg03jVZ
	 dGekStCjMma0A73ajn2wPl/G2uiyzVg98xOBn+eZQLdH+8Knch4LYcaHdbVTjraudN
	 8aEjSzk/P23Q7GikEWn9+5KicFLbijI57RG4r4powJ8v0OzU0nUGK4tijggSmBRHBe
	 9v56m4TeQouEpnt9sVK6/aPueqx7cCTEJ/1ytiRNVZmgDdtvzqd2ZyPPMrsbhgF7kH
	 U4nvr5LKY6mDn4auGU9ajUpMPAYu7QlwwaLSLhD4aNx96yWLEjsWaWrTqAMtHCqXjn
	 SZtqbynbzWCRSgdTbVgqUTM0=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] apt: The C.UTF-8 locale is not portable
Date: Thu, 14 May 2020 00:35:32 +0300
Message-Id: <20200513213532.28078-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/apt/apt.inc             |  1 +
 ...le-is-not-portable-use-std-locale-cl.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 13f5969f86..87d533782f 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -17,6 +17,7 @@ SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/${BPN}/${P
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
            file://0001-apt-1.2.12-Fix-musl-build.patch \
            file://0001-Include-array.h-for-std-array.patch \
+           file://0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch \
            "
 SRC_URI[md5sum] = "d30eed9304e82ea8238c854b5c5a34d9"
 SRC_URI[sha256sum] = "03ded4f5e9b8d43ecec083704b2dcabf20c182ed382db9ac7251da0b0b038059"
diff --git a/meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch b/meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch
new file mode 100644
index 0000000000..ce5c005086
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-The-C.UTF-8-locale-is-not-portable-use-std-locale-cl.patch
@@ -0,0 +1,27 @@
+From 7e8839731ae3fdf7502b91643aa6b252f6c5eaa6 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@stusta.de>
+Date: Thu, 14 May 2020 00:08:21 +0300
+Subject: The C.UTF-8 locale is not portable, use std::locale::classic()
+
+Upstream-Status: Inappropriate [Similar fix already in apt >= 1.3]
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ ftparchive/writer.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ftparchive/writer.cc b/ftparchive/writer.cc
+index 25963820a..6ad571d2a 100644
+--- a/ftparchive/writer.cc
++++ b/ftparchive/writer.cc
+@@ -984,7 +984,7 @@ ReleaseWriter::ReleaseWriter(FileFd * const GivenOutput, string const &/*DB*/) :
+    AddPatterns(_config->FindVector("APT::FTPArchive::Release::Patterns"));
+ 
+    time_t const now = time(NULL);
+-   auto const posix = std::locale("C.UTF-8");
++   auto const posix = std::locale::classic();
+ 
+    // FIXME: use TimeRFC1123 here? But that uses GMT to satisfy HTTP/1.1
+    std::ostringstream datestr;
+-- 
+2.20.1
+
-- 
2.17.1

