Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0D01360620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:33:18 +0000 (UTC)
Received: by wmec201 with SMTP id c201so5056306wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 13:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/sck1/4YFOY73SOXhEHFrEAMrmZy5kYo5cmikeovgt4=;
	b=B+IyhNMRIvTnsQpcy8dPLHVX35dlYEQXsk7VztZTW3yJe0PhKVPkhbbKH5Nz09+UNb
	UHTxJHhmohP+Q4u68tmR6o2rtE8cYKlqR0OERvXW2+z7/VGIsbd6Y9LdjDHf03rkZSli
	yP+5oVlcb2EFzJA9R9gM7IMd8C7SeaQbypEYHrQhHJJisChvTI0izlILKM/jqYDZGxQV
	Gu7Ov0GGCPEL2s9/Wih+dIcFBZDvNgCZxa00N6C8odBft9SIfKprAynkPvRA+0VZ/yHD
	EXBhY5RfBL+iAY8t0Zj55kpN+fHZ068WX5tf0sbCDA3Me217WwYg1PwIBIIXyhcLQhtf
	0pPQ==
X-Received: by 10.194.120.194 with SMTP id le2mr45138141wjb.74.1448487199001; 
	Wed, 25 Nov 2015 13:33:19 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id o65sm5354859wmg.3.2015.11.25.13.33.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Nov 2015 13:33:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 22:33:51 +0100
Message-Id: <1448487231-25643-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <20151125212359.GS17303@jama>
References: <20151125212359.GS17303@jama>
Subject: [PATCHv2][master][jethro] package_manager.py: define info_dir and status_file when OPKGLIBDIR isn't the default
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
X-List-Received-Date: Wed, 25 Nov 2015 21:33:23 -0000

* without this the do_rootfs task doesn't respect OPKGLIBDIR and
  info, status are created in different directory than opkg on
  target expects
* people who modify OPKGLIBDIR need to make sure that opkg.conf included
  in opkg package also sets info_dir and status_file options

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oe/package_manager.py | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 964fddc..b9fa6d8 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1471,6 +1471,16 @@ class OpkgPM(PackageManager):
                                         self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True),
                                         arch))
 
+            if self.opkg_dir != '/var/lib/opkg':
+                # There is no command line option for this anymore, we need to add
+                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                # the default value of "/var/lib" as defined in opkg:
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+
+
     def _create_config(self):
         with open(self.config_file, "w+") as config_file:
             priority = 1
@@ -1486,6 +1496,15 @@ class OpkgPM(PackageManager):
                     config_file.write("src oe-%s file:%s\n" %
                                       (arch, pkgs_dir))
 
+            if self.opkg_dir != '/var/lib/opkg':
+                # There is no command line option for this anymore, we need to add
+                # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
+                # the default value of "/var/lib" as defined in opkg:
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
+
     def insert_feeds_uris(self):
         if self.feed_uris == "":
             return
-- 
2.6.3


