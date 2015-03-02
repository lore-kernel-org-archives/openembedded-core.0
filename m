Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1DD4265C7B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 02:11:12 +0000 (UTC)
Received: by iecrl12 with SMTP id rl12so44251903iec.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Mar 2015 18:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cdV4kw4fKvbwLwuGtWhRvExhaQryZ76fKJTfXiSXwlc=;
	b=g7xzhX8a2aBWDBwpD0FvSkD2qba7gts2nWMV0sNWjm1EJSBaJ6tL5xsnMupfGPP1rY
	N/38XjOUWfM7JkaHDpvhXNBcWLsGrKarIUrZWPSodyBEpWpb/2NHkeEBzMW9eMh5REdv
	R8ggqTsyBfLQpHDhhB24JwFx7v1jgh9vwygtyKT3L2uN1YT7lbgr7Ku2WKUpssdQF2AE
	rZ5zAFbLI7h4v3JdtbY8tJb/xYv96JIZA9Bg8MJceJ8QihQkyg4U116oMP8DeBPsRVP8
	Czvjcs/SpqCKU6D87tye5YknqMRUc/FU1m/phdTkbNwNhl7vvAlKvz2mTporbup0vKOI
	htRw==
X-Received: by 10.42.210.20 with SMTP id gi20mr28429149icb.34.1425262273703;
	Sun, 01 Mar 2015 18:11:13 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id t5sm6140315ign.12.2015.03.01.18.11.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Mar 2015 18:11:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Mar 2015 02:10:58 +0000
Message-Id: <1425262260-15211-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1425262260-15211-1-git-send-email-raj.khem@gmail.com>
References: <1425262260-15211-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/4] binutils: Fix ICE in gold
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
X-List-Received-Date: Mon, 02 Mar 2015 02:11:13 -0000

Found when linking busybox using gold linker

Change-Id: I47b89998b9cb3d75ac97113a1b0fba109483b198
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.25.inc   |  1 +
 ...rnal-error-in-do_print_to_mapfile-seen-wi.patch | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.inc b/meta/recipes-devtools/binutils/binutils-2.25.inc
index d69b519..d9075b6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.inc
@@ -24,6 +24,7 @@ SRC_URI = "\
      file://binutils-armv5e.patch \
      file://mips64-default-ld-emulation.patch \
      file://binutils-xlp-support.patch \
+     file://0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch \
      "
 SRC_URI[md5sum] = "d9f3303f802a5b6b0bb73a335ab89d66"
 SRC_URI[sha256sum] = "22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacfed3e2ec17b08c882923"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
new file mode 100644
index 0000000..a47faef
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
@@ -0,0 +1,36 @@
+From 54583eb23233b5369372ae41768655693d0584ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Feb 2015 09:05:49 +0000
+Subject: [PATCH] Fix an internal error in do_print_to_mapfile seen with gold
+ on arm
+
+This is due to missing implementation of do_print_to_mapfile for
+atrributea section (ARM.attributes), it started to show up after fix
+for PR gold/16980 was installed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Submitted
+---
+ gold/ChangeLog    | 5 +++++
+ gold/attributes.h | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/gold/attributes.h b/gold/attributes.h
+index c0b171f..6e3ab8c 100644
+--- a/gold/attributes.h
++++ b/gold/attributes.h
+@@ -387,6 +387,10 @@ class Output_attributes_section_data : public Output_section_data
+   { }
+ 
+  protected:
++  // Write to a map file.
++  void
++  do_print_to_mapfile(Mapfile* mapfile) const
++  { mapfile->print_output_data(this, _("** attributes")); }
+   // Write the data to the output file.
+   void
+   do_write(Output_file*);
+-- 
+2.1.4
+
-- 
2.1.4


