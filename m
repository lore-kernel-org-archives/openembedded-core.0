Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitG8-00086v-3T
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:56 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so373860yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=G9LHb/1YlpN3CgMWIcRbPg2iu34+gJ8jumJCRQwJ65M=;
	b=TRGK/MV6xH4mdzoOcZ9PHzrAxg3Zrr6mS1DRbF+DOrk/OjNULhG9Qm3ArywLJ1+lSR
	acpTBB6qapHB5PVfBEm1cYdVULEwJGYw/vwQtjumRvAw6tTX7v/7ki7E2TJA55Mq5ak0
	54wfFjR7OuyQTc3vldZKqLBJo466Visj2kqno=
Received: by 10.236.77.72 with SMTP id c48mr3658122yhe.55.1325792314445;
	Thu, 05 Jan 2012 11:38:34 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:56 +0000
Message-Id: <7152cc23d9c5471051594836c3e3177b9ac59404.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 06/10] initscripts: avoid mounting /sys if it is already mounted
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:56 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../initscripts/initscripts-1.0/sysfs.sh           |    4 ++--
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
index be28bb3..bd87dcd 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/sysfs.sh
@@ -14,6 +14,6 @@ if [ -e /proc ] && ! [ -e /proc/mounts ]; then
   mount -t proc proc /proc
 fi
 
-if [ -e /sys ] && grep -q sysfs /proc/filesystems; then
-  mount sysfs /sys -t sysfs
+if [ -e /sys ] && grep -q sysfs /proc/filesystems && ! [ -e /sys/class ]; then
+  mount -t sysfs sysfs /sys
 fi
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index ffca817..98f5e9b 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r127"
+PR = "r128"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.2.5



