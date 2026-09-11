Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9FAC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 19:00:27 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47008.1789153222384319530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 12:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=cMAjj7Eu;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so1618238a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789153221; x=1789758021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W/Ffc9g4MtpwSdkbfayCqf38o8pT9xhM7EYKltqiueM=;
        b=cMAjj7EuLfZdlwhNXdTi5M/wVEmN5RbjdsaQ6mlJcmUeiuagbt1C4PcFzjplEFxfAR
         c/S3sgeeFYXVzxwoMyto0FG6sxF4/UkKg6hq+V/uHLleq1oscavOrVygYb2bEChunrpi
         C2WvzMXdZsqosMggqG7a47as4aA2mZs6u1kAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789153221; x=1789758021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W/Ffc9g4MtpwSdkbfayCqf38o8pT9xhM7EYKltqiueM=;
        b=TnN7Gc/e/3Ry5eL2wcAUHroZ46Osa2SD7YnX9I4/Jd9eBUSZ60DT6qcIm9Xepz72bx
         lsu5gwbvyDTOneIxq5ZGg0pSBUfXpeU7vepdh1jrkmJn/GDNqazKzhxzQnKw4nU4TpT1
         RpLyqNpNdZycLuCrLHOW1GXjv4y1FTGZc+EJobFZ7DGh0Am5drQxG2z8mXIbibzWqGMA
         4b/UxlxawR1JJRtaf1JqbWQ2nknwBQbmNbZ4CYjcb8OcvLI4kLobym3l0D3fiFQ/soZF
         DIl0qSmRrWAFU5sUy+Vo6Vy5D/2N+BWa0SNL9HGR4jGvD0SPhp0b3wbN+WfQ/6aBKYfa
         B3Gw==
X-Gm-Message-State: AFuF++kx+krAjVqM7KcLg5LBYjE7juv75hdWeAjAUbjYdWE2BZaHhjze
	/N3RxxKSfHLVIWh56tV9edFipFSDQKOLXb8rCu4+xgVEg9OmP4RAuKeg5GN/5jbOFcC7oDQXoBx
	zuI7J
X-Gm-Gg: AYBFou3O1wcOld6IBmobWS1wR8nEOyGOcVqy6K5Ol9a76BMvpXrb5SRbpvIKsV8X2iB
	4xlbOhu383uYTtQB2q6JcgGn8guvIhbmvd/bl6FJZaDbEBm1rFuteHv4YkQ0vOsW9QORMaWi6bJ
	vCcRQpoUK40puqStdoUOUE34unPCYO+Hg0NUwYDLBOmHuN9gH3Efzqezn85JZqTngP4aelg4cgc
	WdcuzDKUpKmRQbZDPmkUzUb0UX9cnSHzi9xnXVhL0fnYRIOYbkPPblemBErvbz4pmsSlvR/TTXd
	u9u1+Bvrpv+CwOxugvPgwlSNSCfpjHqUy/5YQ3/WM1KbM6Vk3OOiQg8ZApVRD/Uw12khQfqLAwj
	5hDkSsfeOiU6JFB/dmVO3GCA6OkVGIpCLln3NlidPKbinihm8ci/Jzo4KslAQI2O/EMkpm2mVLU
	sL1mc+Ors1AZUkRI7p1Ut/qkdSvJ8slfImVP6Mo7zseo1WnLaizENhriIxhg9KXdT1niBAtEATW
	C9fxYoQRA==
X-Received: by 2002:a17:90b:3d4e:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39d9c345f58mr9523917a91.18.1789153221264;
        Fri, 11 Sep 2026 12:00:21 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm8291393eec.12.2026.09.11.12.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 12:00:20 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH] libxml2: upgrade 2.15.3 -> 2.15.4
Date: Sat, 12 Sep 2026 00:28:04 +0530
Message-Id: <20260911185804.850946-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 19:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245665

From: Siddharth Doshi <sdoshi@mvista.com>

For detailed information, see the link below:
[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/96498992efa48d52b0e8b83058bd88dbdaf153c1

Note: Removed CVE-2026-11979 as it is already fixed.

CVE's Fixed:
CVE-2026-11979 (CVSSv3: 7.8): https://nvd.nist.gov/vuln/detail/CVE-2026-11979
CVE-2026-86137 (CVSSv3: 2.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86137
CVE-2026-86138 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86138
CVE-2026-86139 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86139
CVE-2026-86140 (CVSSv3: 8.0): https://nvd.nist.gov/vuln/detail/CVE-2026-86140
CVE-2026-86141 (CVSSv3: 2.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86141
CVE-2026-86142 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86142
CVE-2026-86143 (CVSSv3: 6.9): https://nvd.nist.gov/vuln/detail/CVE-2026-86143
CVE-2026-86144 (CVSSv3: 5.6): https://nvd.nist.gov/vuln/detail/CVE-2026-86144

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/libxml2/CVE-2026-11979.patch       | 81 -------------------
 .../{libxml2_2.15.3.bb => libxml2_2.15.4.bb}  |  3 +-
 2 files changed, 1 insertion(+), 83 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 rename meta/recipes-core/libxml/{libxml2_2.15.3.bb => libxml2_2.15.4.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
deleted file mode 100644
index a14e566681..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From dfad0660f7dab3b5f8317b703b16ad0b0d12697d Mon Sep 17 00:00:00 2001
-From: Daniel Garcia Moreno <daniel.garcia@suse.com>
-Date: Fri, 22 May 2026 12:21:20 +0200
-Subject: [PATCH] xmlcatalog: overflow check for large --shell commands
-
-Fix https://gitlab.gnome.org/GNOME/libxml2/-/work_items/1124
-
-CVE: CVE-2026-11979
-Signed-off-by: Anton Skorup <anton.skorup@axis.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c2e233fc1b341685fc99621b2768b503f777a72e]
----
- test/catalogs/test.sh | 11 +++++++++++
- xmlcatalog.c          | 16 ++++++++++++++++
- 2 files changed, 27 insertions(+)
-
-diff --git a/test/catalogs/test.sh b/test/catalogs/test.sh
-index 7e5eaa76..84e8b90a 100755
---- a/test/catalogs/test.sh
-+++ b/test/catalogs/test.sh
-@@ -10,6 +10,17 @@ fi
- 
- exitcode=0
- 
-+# Test xmlcatalog --shell command line
-+# Case 1: Really long argument (470 chars)
-+input=""; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 2: public + long argument
-+input="public "; for i in {1..470}; do input="${input}A"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+# Case 3: public + lots of args
-+input="public "; for i in {1..80}; do input="${input} x"; done
-+echo $input | $xmlcatalog --shell test/catalogs/dockbook.xml || exit 1
-+
- for i in test/catalogs/*.script ; do
-     name=$(basename $i .script)
-     xml="./test/catalogs/$name.xml"
-diff --git a/xmlcatalog.c b/xmlcatalog.c
-index b400c7cb..5113e930 100644
---- a/xmlcatalog.c
-+++ b/xmlcatalog.c
-@@ -135,6 +135,12 @@ static void usershell(void) {
- 	       (*cur != '\n') && (*cur != '\r')) {
- 	    if (*cur == 0)
- 		break;
-+            /* Do not read beyond the command array capacity */
-+            if (i >= (int)sizeof(command) - 2) {
-+                printf("Invalid command %s\n", cur);
-+                i = 0;
-+                break;
-+            }
- 	    command[i++] = *cur++;
- 	}
- 	command[i] = 0;
-@@ -152,6 +158,11 @@ static void usershell(void) {
- 	while ((*cur != '\n') && (*cur != '\r') && (*cur != 0)) {
- 	    if (*cur == 0)
- 		break;
-+            if (i >= (int)sizeof(arg) - 2) {
-+                printf("Invalid arg %s\n", arg);
-+                i = 0;
-+                break;
-+            }
- 	    arg[i++] = *cur++;
- 	}
- 	arg[i] = 0;
-@@ -164,6 +175,11 @@ static void usershell(void) {
- 	cur = arg;
- 	memset(argv, 0, sizeof(argv));
- 	while (*cur != 0) {
-+            if (i >= (int)sizeof(argv) / (int)sizeof(char*)) {
-+                printf("Too much arguments\n");
-+                break;
-+            }
-+
- 	    while ((*cur == ' ') || (*cur == '\t')) cur++;
- 	    if (*cur == '\'') {
- 		cur++;
--- 
-2.43.0
-
diff --git a/meta/recipes-core/libxml/libxml2_2.15.3.bb b/meta/recipes-core/libxml/libxml2_2.15.4.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.15.3.bb
rename to meta/recipes-core/libxml/libxml2_2.15.4.bb
index abf9889b3f..fc367892bf 100644
--- a/meta/recipes-core/libxml/libxml2_2.15.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.15.4.bb
@@ -18,11 +18,10 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://run-ptest \
            file://install-tests.patch \
            file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
-           file://CVE-2026-11979.patch \
            "
 
-SRC_URI[archive.sha256sum] = "78262a6e7ac170d6528ebfe2efccdf220191a5af6a6cd61ea4a9a9a5042c7a07"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
+SRC_URI[archive.sha256sum] = "98087fd181d9070724f3fbc65c7377db03038eb92bd882374daff44940138821"
 
 CVE_STATUS[CVE-2025-6170] = "fixed-version: fixed in version 2.14.5"
 CVE_STATUS[CVE-2026-6732] = "fixed-version: fixed in version 2.15.3"
-- 
2.34.1


