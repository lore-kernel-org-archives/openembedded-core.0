Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A6C6D10369
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 22:53:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11.1764111186752678485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 14:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Uzh/RdP9;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20251125225301fb463dcd7c00020721-vytxi4@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20251125225301fb463dcd7c00020721
        for <openembedded-core@lists.openembedded.org>;
        Tue, 25 Nov 2025 23:53:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0YJ1Lw8tuixM6h7+dFhhhMXAC+NA3qXQjoLLi/QLsos=;
 b=Uzh/RdP9meH5LFfEmvDIlF8xlI/9nEj8pvLDpbZtvv60uMY/HHrjrMGTdAsw/9EAxk+mUY
 YgAuHwVsYJMnRHpc+Q6it9MXNOJe1ZSoxMl5koGz6+JypATSMHXMBTFo0mqn3Z9mDLlgMePd
 C4nd9e3Aa/GtXIBgzhAWnc0aHFWQUMWs7BideCrCHPh/iryfq2JFWzh+xMeVgJjlfacStqaA
 3b23j4KazWv4LMOTUbHKXoLumUOUWH7NfGClwXb6t6noCkKey2Ejhtsogp7eq2Y9iPkfDPTS
 RgI5DrpihMYvFFqJxZgiJQl+WkCvDjr0/qAmx11SCNiY6BC741hXvO7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] sqlite3: upgrade 3.50.4 -> 3.51.0
Date: Tue, 25 Nov 2025 23:52:57 +0100
Message-Id: <20251125225257.2579493-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 22:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226795

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-7709.

Drop commit included in this release.
Refresh and rename the other patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ... => 0001-Add-option-to-disable-zlib.patch} |  4 +-
 ...rpath-configure-script-flag-to-addre.patch | 57 -------------------
 meta/recipes-support/sqlite/sqlite3_3.50.4.bb | 10 ----
 meta/recipes-support/sqlite/sqlite3_3.51.0.bb |  9 +++
 4 files changed, 11 insertions(+), 69 deletions(-)
 rename meta/recipes-support/sqlite/sqlite3/{0002-Add-option-to-disable-zlib.patch => 0001-Add-option-to-disable-zlib.patch} (93%)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.50.4.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.51.0.bb

diff --git a/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
similarity index 93%
rename from meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch
rename to meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
index 2855372c21..77181fe4df 100644
--- a/meta/recipes-support/sqlite/sqlite3/0002-Add-option-to-disable-zlib.patch
+++ b/meta/recipes-support/sqlite/sqlite3/0001-Add-option-to-disable-zlib.patch
@@ -32,7 +32,7 @@ diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
 index 85fe414382..77190a7053 100644
 --- a/autosetup/sqlite-config.tcl
 +++ b/autosetup/sqlite-config.tcl
-@@ -274,6 +274,14 @@ proc sqlite-configure {buildMode configScript} {
+@@ -287,6 +287,14 @@ proc sqlite-configure {buildMode configScript} {
        }
      }
  
@@ -47,7 +47,7 @@ index 85fe414382..77190a7053 100644
      # Options for ICU: International Components for Unicode
      icu {
        {*} {
-@@ -641,7 +649,7 @@ proc sqlite-check-common-system-deps {} {
+@@ -656,7 +664,7 @@ proc sqlite-check-common-system-deps {} {
      string.h strings.h \
      inttypes.h
  
diff --git a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch b/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
deleted file mode 100644
index f1e93a1c9a..0000000000
--- a/meta/recipes-support/sqlite/sqlite3/0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 87c807c6dd4df67328919fa28e89a06839e634fe Mon Sep 17 00:00:00 2001
-From: stephan <stephan@noemail.net>
-Date: Sun, 22 Jun 2025 22:48:11 +0000
-Subject: [PATCH] Add the --disable-rpath configure script flag to address
- [forum:13cac3b56516f849 | forum post 13cac3b56516f849].
-
-FossilOrigin-Name: a59d9bb25e518f5d79f654615b92f6c50cfb704b5abee0f820912644b89366c5
-
-Upstream-Status: Backport [https://github.com/sqlite/sqlite/commit/87c807c6dd4df67328919fa28e89a06839e634fe]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- autosetup/sqlite-config.tcl | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/autosetup/sqlite-config.tcl b/autosetup/sqlite-config.tcl
-index bb81123204..4dd065095e 100644
---- a/autosetup/sqlite-config.tcl
-+++ b/autosetup/sqlite-config.tcl
-@@ -334,8 +334,8 @@ proc sqlite-configure {buildMode configScript} {
-           => {Link the sqlite3 shell app against the DLL instead of embedding sqlite3.c}
-       }
-       {canonical autoconf} {
--        # A potential TODO without a current use case:
--        #rpath=1 => {Disable use of the rpath linker flag}
-+        rpath=1 => {Disable use of the rpath linker flag}
-+
-         # soname: https://sqlite.org/src/forumpost/5a3b44f510df8ded
-         soname:=legacy
-           => {SONAME for libsqlite3.so. "none", or not using this flag, sets no
-@@ -2119,7 +2119,6 @@ proc sqlite-handle-tcl {} {
- ########################################################################
- # Handle the --enable/disable-rpath flag.
- proc sqlite-handle-rpath {} {
--  proj-check-rpath
-   # autosetup/cc-shared.tcl sets the rpath flag definition in
-   # [get-define SH_LINKRPATH], but it does so on a per-platform basis
-   # rather than as a compiler check. Though we should do a proper
-@@ -2128,12 +2127,13 @@ proc sqlite-handle-rpath {} {
-   # for which sqlite-env-is-unix-on-windows returns a non-empty
-   # string.
- 
--#  if {[proj-opt-truthy rpath]} {
--#    proj-check-rpath
--#  } else {
--#    msg-result "Disabling use of rpath."
--#    define LDFLAGS_RPATH ""
--#  }
-+  # https://sqlite.org/forum/forumpost/13cac3b56516f849
-+  if {[proj-opt-truthy rpath]} {
-+    proj-check-rpath
-+  } else {
-+    msg-result "Disabling use of rpath."
-+    define LDFLAGS_RPATH ""
-+  }
- }
- 
- ########################################################################
diff --git a/meta/recipes-support/sqlite/sqlite3_3.50.4.bb b/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
deleted file mode 100644
index b822d7e919..0000000000
--- a/meta/recipes-support/sqlite/sqlite3_3.50.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
-
-SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "a3db587a1b92ee5ddac2f66b3edb41b26f9c867275782d46c3a088977d6a5b18"
-
-SRC_URI += "file://0001-Add-the-disable-rpath-configure-script-flag-to-addre.patch"
-SRC_URI += "file://0002-Add-option-to-disable-zlib.patch"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.51.0.bb b/meta/recipes-support/sqlite/sqlite3_3.51.0.bb
new file mode 100644
index 0000000000..258b2c6505
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.51.0.bb
@@ -0,0 +1,9 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
+
+SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI[sha256sum] = "42e26dfdd96aa2e6b1b1be5c88b0887f9959093f650d693cb02eb9c36d146ca5"
+
+SRC_URI += "file://0001-Add-option-to-disable-zlib.patch"

