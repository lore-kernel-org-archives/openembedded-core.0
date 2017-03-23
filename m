Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 10E2B77AF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 12:16:28 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 20so2889447wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 05:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+/NdK7VCqVDzdkXzzlT3WVaT/geLqDqNLvjf9Lpu8R0=;
	b=fE3Za0z/6xNPbV2CEIv/lH7qJqI7f9OGPasTJrHxICDvEF+hSi/Kyfz0PJmd/WKoB+
	vNS2cd1iqbciNxM0tXGNmBZILsvyTlt9qxK/QujErDj3A8bAh2PbgUJxCOVZpqpNRy/i
	vFkOxqniDp4u6qMHH35eLyV0Z/+QxZUgYZsJuR9KT9mOxWNbE3SaOzdldsmBz01LQE8z
	LgUb58nh0YIovNP/7TeD9bHpUdZVEUpyYfueh3mFcdbik7So0St5g05w296nssUXd+3s
	iRaFmuTFNitVDKVtIFgXxoRGHVKp7drejW9fJ90UOcRNRcyCqHrnbRrYuqdMTyr4D7El
	G1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+/NdK7VCqVDzdkXzzlT3WVaT/geLqDqNLvjf9Lpu8R0=;
	b=b/98pirdNCj89OmaaFcHY2sZLWXh8DnYyeWS8hDmM5k/QxQcFyh6tMxUy1LQAZU/An
	AF69RxA3D5NhTwjpPEuCvGiIhpDE5z7GugjNuPHYJ6OeGztG6Ao2Ib5mhutiV90M+A6O
	kBTYJ7mDTobhEJEG8K9bxq4FzryyWDb8KncDVjP/Wnlm5Xyehsuhj3EujDAWT4evEmo/
	k/a8f4GQNzZ0gzfjxBSkCfGkbmtxcOlGinf6rm07wi13TmrzaNZvitUe/q8A3rqDwUxq
	u52GaXzOpbGeIU//pSyO8K9Jd42rKLiQAwZ6xEySuc/3jG3kSPg3OUlOmd5XDgPjJpzw
	lxKw==
X-Gm-Message-State: AFeK/H2iZjqEMM3yuBiSff2EUOiedbkIP6KKVt6TcTbuLKcoj9qhGVl73DTSFrOGgEdZLg==
X-Received: by 10.223.142.141 with SMTP id q13mr2285338wrb.180.1490271387865; 
	Thu, 23 Mar 2017 05:16:27 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	g73sm4105504wmd.27.2017.03.23.05.16.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Mar 2017 05:16:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Mar 2017 13:16:30 +0100
Message-Id: <f9176c7761b88850dfd6d7f663bade6af83904b5.1490271349.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1490271349.git.Martin.Jansa@gmail.com>
References: <cover.1490271349.git.Martin.Jansa@gmail.com>
Subject: [PATCH][morty 2/2] package_manager.py: respect OPKGLIBDIR
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
X-List-Received-Date: Thu, 23 Mar 2017 12:16:29 -0000

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
index a9d216a88e..13577b18bd 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1673,13 +1673,15 @@ class OpkgPM(OpkgDpkgPM):
                                         self.d.getVar('FEED_DEPLOYDIR_BASE_URI', True),
                                         arch))
 
-                        if self.opkg_dir != '/var/lib/opkg':
+                        if self.d.getVar('OPKGLIBDIR', True) != '/var/lib':
                             # There is no command line option for this anymore, we need to add
                             # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
                             # the default value of "/var/lib" as defined in opkg:
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                            # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
                             cfg_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                            cfg_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'lists'))
                             cfg_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
 
 
@@ -1698,13 +1700,15 @@ class OpkgPM(OpkgDpkgPM):
                     config_file.write("src oe-%s file:%s\n" %
                                       (arch, pkgs_dir))
 
-            if self.opkg_dir != '/var/lib/opkg':
+            if self.d.getVar('OPKGLIBDIR', True) != '/var/lib':
                 # There is no command line option for this anymore, we need to add
                 # info_dir and status_file to config file, if OPKGLIBDIR doesn't have
                 # the default value of "/var/lib" as defined in opkg:
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      "/var/lib/opkg/info"
-                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   "/var/lib/opkg/status"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_LISTS_DIR     VARDIR "/lib/opkg/lists"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_INFO_DIR      VARDIR "/lib/opkg/info"
+                # libopkg/opkg_conf.h:#define OPKG_CONF_DEFAULT_STATUS_FILE   VARDIR "/lib/opkg/status"
                 config_file.write("option info_dir     %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'info'))
+                config_file.write("option lists_dir    %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'lists'))
                 config_file.write("option status_file  %s\n" % os.path.join(self.d.getVar('OPKGLIBDIR', True), 'opkg', 'status'))
 
     def insert_feeds_uris(self):
@@ -1860,7 +1864,10 @@ class OpkgPM(OpkgDpkgPM):
 
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


