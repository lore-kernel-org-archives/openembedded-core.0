Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SuU6i-0002ft-Gx
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:52:24 +0200
Received: by yhjj56 with SMTP id j56so2217636yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=v1KaXP3wVqYWYJPjB8y7FRKMJPlGbHAivMMRTMEXRkg=;
	b=PxTdc9Ppsy3hZmyys1mbWxKRNfL6EF4o4f3jGOQt1kSxZ6xfQGpGvhpZvV2G2wc1hZ
	BGL9Q2dKfNzcbepxRh6HXXDTXffHpSPoGh8CvGF7wwiR17NyUmWQKosZM/Y9DsDNxb0Q
	VKkZXzXMFRa6Q7dCkX6kOtqnDMhA5TsbnAaw11DbnvqiM4tySoMvSEgIk4vEF5ggwhXT
	AA4xKbKJ+K7ktgVEi8BiABXNXFn5y7XprY3qX/xjwmhwcSuUBgB5kzXokIxrfJlJB7LH
	vJeXUDiQpEvYJwtFTkhJhNHU75G6JAIfKXEiNIT5Zp+JtwlwHh/MPL7+AqapySnmf+rw
	itcA==
Received: by 10.60.18.168 with SMTP id x8mr42711916oed.18.1343331652921;
	Thu, 26 Jul 2012 12:40:52 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id bp7sm92017obc.12.2012.07.26.12.40.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 12:40:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2012 12:40:48 -0700
Message-Id: <1343331648-19882-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] toolchain-scripts: separate dependencies from site file naming
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 19:52:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/toolchain-scripts.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 44284c3..68bb661 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -137,6 +137,7 @@ toolchain_create_sdk_env_script_for_installer () {
 TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
+TOOLCHAIN_CONFIGSITE_DEPENDS = "virtual/libc ncurses"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
@@ -173,7 +174,7 @@ toolchain_create_sdk_version[vardepsexclude] = "DATETIME"
 
 python __anonymous () {
     deps = ""
-    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
+    for dep in (d.getVar('TOOLCHAIN_CONFIGSITE_DEPENDS', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
     d.appendVarFlag('do_configure', 'depends', deps)
 }
-- 
1.7.9.5



