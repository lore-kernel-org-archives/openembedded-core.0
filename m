Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F947C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:14:29 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.22617.1747916063013379294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=KGiWaR/D;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202505221214138655b78c198b14980f-hmpzkr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202505221214138655b78c198b14980f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 22 May 2025 14:14:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=V+EYOONSm6cw9aK30HQMYzDv83HS6oSD+YdMPoMnqPQ=;
 b=KGiWaR/D3q0FDgf5m4a06hr61dlK6MlScHxTnOv4b851bn6xP9NauofeQKPcDufXv6BwMo
 MGWrZ+3Eo6buF9P7YTAmZetsAf2Z4j/6ScFk2SoubrBIsj0levfZp9X8iODwuPw/9i3ZG1kH
 VZlo70a/5DKN4yX2d1WKWaLC7Q+1eUeu0aYDWtOf8+GWaPyf6rBmylWRdZP4PlvavFL8wlJk
 W1pzsix4ANXD2mK2rxCzBqOZo8PTvzP7Op+qcn6a5ns46QS2Zh99wuGmFpkvyxX/RLN/f2md
 Uift2koMzs/vVMQBp08yTr3QDrgHwogV4hGR7+0GqEWTAVJvRAqqdjFA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libxml2: upgrade 2.13.6 -> 2.14.3
Date: Thu, 22 May 2025 14:13:16 +0200
Message-Id: <20250522121316.197485-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:14:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217090

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-32414 and CVE-2025-32415.

* rebased install-tests.patch
* removed testsuite testThreads (merged into runtest.c)
  * https://gitlab.gnome.org/GNOME/libxml2/-/commit/481fd6bbee029e15a6a4015e5160a332d7c18cba
* removed IPv6 option (as part of with ftp support removal)
  * https://gitlab.gnome.org/GNOME/libxml2/-/commit/dba1ed85a320c36807ee09f44d09fd30852b9370
* added testsuites testlimits testparser (already present before but not executed)

License-Update: Mention contributors in Copyright
https://gitlab.gnome.org/GNOME/libxml2/-/commit/4bd66d4549b2e8925a752e0daac3a189d2fec8f7

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch     | 4 ++--
 meta/recipes-core/libxml/libxml2/run-ptest               | 2 +-
 .../libxml/{libxml2_2.13.6.bb => libxml2_2.14.3.bb}      | 9 +++------
 3 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.6.bb => libxml2_2.14.3.bb} (92%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 1c8c13ab5c..789aeca119 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -15,7 +15,7 @@ diff --git a/Makefile.am b/Makefile.am
 index 4cb9a5c..8adcd7e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -27,6 +27,16 @@ check_PROGRAMS = \
+@@ -26,6 +26,16 @@ check_PROGRAMS = \
  	testparser \
  	testrecurse
  
@@ -29,6 +29,6 @@ index 4cb9a5c..8adcd7e 100644
 +	cp -r $(srcdir)/result $(DESTDIR)$(ptestdir)
 +	cp -r $(srcdir)/python/tests $(DESTDIR)$(ptestdir)/python
 +
- bin_PROGRAMS = xmllint xmlcatalog
+ bin_PROGRAMS = xmllint
  
  bin_SCRIPTS = xml2-config
diff --git a/meta/recipes-core/libxml/libxml2/run-ptest b/meta/recipes-core/libxml/libxml2/run-ptest
index f252a78f17..cbbdd5592f 100755
--- a/meta/recipes-core/libxml/libxml2/run-ptest
+++ b/meta/recipes-core/libxml/libxml2/run-ptest
@@ -5,7 +5,7 @@ set -e
 export LC_ALL=en_US.UTF-8
 
 # testModule isn't that useful and hard-codes buildtree, so we don't run that
-TESTS="runtest runsuite testrecurse testchar testdict testThreads runxmlconf testapi"
+TESTS="runtest runsuite testrecurse testchar testdict runxmlconf testapi testlimits testparser"
 
 for T in $TESTS; do
     echo Running $T
diff --git a/meta/recipes-core/libxml/libxml2_2.13.6.bb b/meta/recipes-core/libxml/libxml2_2.14.3.bb
similarity index 92%
rename from meta/recipes-core/libxml/libxml2_2.13.6.bb
rename to meta/recipes-core/libxml/libxml2_2.14.3.bb
index 3b3ca87e96..d5d144f793 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.6.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://Copyright;md5=f437ed9058e8e5135e47c01e973376ba \
+LIC_FILES_CHKSUM = "file://Copyright;md5=5873615e8a9ecbf5c8857c4312ee05d6 \
                     file://dict.c;beginline=6;endline=15;md5=2b4b7b827d2d8b080372433c4c9c85b6 \
                     file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
                     "
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
+SRC_URI[archive.sha256sum] = "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
@@ -27,11 +27,8 @@ CVE_STATUS[CVE-2023-45322] = "disputed: issue requires memory allocation to fail
 
 BINCONFIG = "${bindir}/xml2-config"
 
-PACKAGECONFIG ??= "python \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-"
+PACKAGECONFIG ??= "python"
 PACKAGECONFIG[python] = "--with-python=${PYTHON},--without-python,python3"
-PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 inherit autotools pkgconfig binconfig-disabled ptest
 

