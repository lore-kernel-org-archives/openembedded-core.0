Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F96877AC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 10:34:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u132so15596246wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 03:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=EMUhgCkKq1IGQUQaWPKJSwbov6ZEsUOiRjvFrH5YKUg=;
	b=QhFcqW4MNd1F4jkVUhHyxPd3PElwAsQujjIT4xs2wTEFhdO4ZvnJKkxKo5tHQsNpNE
	2Cr/FNvbYdW4NXypzr+iE7WG/iqDdlPqIeF1rewThAzk2VCC7wh2mIFf46goYDggdwN/
	1X1I88BrSDsiKLoGaHDZ+yGUwSYLTQJL9cJp4C0K6KwrrOIU+JENiNsjj+WlJuA91rL4
	zHBNGFuxhUWUGYtQj7FiwoJn11yWj0dUX5DPix4EWUP3pbVUh/SjHF50bgdZEDTjfxah
	pQM3Y4Do9d6PDIKoNW+W8AqczEvvbNhY9H2uxvH5VIOqbXI4UTUrWP4jMiy/Myg3fUUC
	YdGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=EMUhgCkKq1IGQUQaWPKJSwbov6ZEsUOiRjvFrH5YKUg=;
	b=h0EvqIxe0tMv9cxMDDDpNfguRY3LOgKIzNwoLccBdmdR8OZ/KBscP1ZV2gJl6xTk3x
	TfimhZ0U+bYm2hlD3lb/mZclG58PXi/pVMP2k/VbDfgqgMqQBpnrp8AMYcUNTGv4Lacn
	Y0ESH3kZ7D36u3brOPNxRThBjG0Oxa6CLPLTk/lnZseG0WPimY+Ws49Y+G6VmH383ESN
	Oj31Mf4YhnfHJ0lA62PjOYj1bHDD6zV4nmuDahBz8wKimdeKDS4z/E0y2h1SwmbZV1k0
	hNYYdAga5vs4yfPNfuQohHd1iEFArafSPfd+k3ZlwRxth2bm/DXAS9BQ3xo9Jxm4xkIa
	b72w==
X-Gm-Message-State: AFeK/H3ecLIUi8+jtSf34X/G9/0y60PXazNijdv4bJIUno7uEyqZhRNAeHrGduFZ5O0hBA==
X-Received: by 10.28.35.66 with SMTP id j63mr2259349wmj.84.1490265261485;
	Thu, 23 Mar 2017 03:34:21 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id m7sm3817695wmi.34.2017.03.23.03.34.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 03:34:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 11:34:23 +0100
Message-Id: <11f8743396f46d4f9b43e604120521fb970afdc5.1490265213.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490265213.git.Martin.Jansa@gmail.com>
References: <cover.1490265213.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] package_manager.py: respect OPKGLIBDIR
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
X-List-Received-Date: Thu, 23 Mar 2017 10:34:21 -0000

* respect it for incremental rootfs generation
* add lists_dir option to opkg.conf
* also fix setting info_dir and status_file when they use default value, the
  problem is that self.opkg_dir is already prefixed with rootfs directory,
  comparing it with /var/lib/opkg always returned false and the options were
  appended to config file unnecessary
* with opkg 0.3.4 we can use VARDIR prefix added in:
  commit d2a8e23dc669adc398f4bb8bcfcabfcf925708f7
  Author: Florin Gherendi <floring2502@gmail.com>
  Date:   Mon Dec 19 12:25:38 2016 +0200
  libopkg: make the /var and /etc directories configurable at compile time.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package_manager.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2a4df61998..389ba7ce05 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -944,13 +944,15 @@ class OpkgPM(OpkgDpkgPM):
                                         self.d.getVar('FEED_DEPLOYDIR_BASE_URI'),
                                         arch))
 
-                        if self.opkg_dir != '/var/lib/opkg':
+                        if self.d.getVar('OPKGLIBDIR') != '/var/lib':
                             # There is no command line option for this anymore, we need to add
                             # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
                             # the default value of "/var/lib" as defined in opkg:
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
                             cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                            cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
                             cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
 
 
@@ -969,13 +971,15 @@ class OpkgPM(OpkgDpkgPM):
                     config_file.write("src oe-%s file:%s\n" %
                                       (arch, pkgs_dir))
 
-            if self.opkg_dir != '/var/lib/opkg':
+            if self.d.getVar('OPKGLIBDIR') != '/var/lib':
                 # There is no command line option for this anymore, we need to add
                 # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
                 # the default value of "/var/lib" as defined in opkg:
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
                 config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'info'))
+                config_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'lists'))
                 config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR'), 'opkg', 'status'))
 
     def insert_feeds_uris(self, feed_uris, feed_base_paths, feed_archs):
@@ -1131,7 +1135,10 @@ class OpkgPM(OpkgDpkgPM):
 
         # Create an temp dir as opkg root for dummy installation
         temp_rootfs = self.d.expand('${T}/opkg')
-        temp_opkg_dir = os.path.join(temp_rootfs, 'var/lib/opkg')
+        opkg_lib_dir = self.d.getVar('OPKGLIBDIR', True)
+        if opkg_lib_dir[0] == "/":
+            opkg_lib_dir = opkg_lib_dir[1:]
+        temp_opkg_dir = os.path.join(temp_rootfs, opkg_lib_dir, 'opkg')
         bb.utils.mkdirhier(temp_opkg_dir)
 
         opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
-- 
2.12.0


