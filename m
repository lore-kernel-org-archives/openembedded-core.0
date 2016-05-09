Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 85987731D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 23:41:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2016 16:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,602,1455004800"; d="scan'208";a="949592050"
Received: from unknown (HELO yocto-dev86.jf.intel.com) ([10.7.198.63])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2016 16:41:28 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 16:42:25 -0700
Message-Id: <1462837346-27095-2-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
Subject: [PATCH v2 1/2] systemd: add sysusers config option to defaults
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
X-List-Received-Date: Mon, 09 May 2016 23:41:29 -0000

Without the sysusers config option, the build will not know which users
need to be added for systemd. This is especially necessary if the
filesystem is readonly, as these users cannot be added at runtime.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/recipes-core/systemd/systemd_229.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..aba73df 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -23,6 +23,7 @@ DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl rea
 SECTION = "base/shell"
 
 inherit useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu systemd ptest gettext bash-completion
+USERADDEXTENSION += " useradd-staticids"
 
 SRCREV = "714c62b46379abb7558c544665522aca91691e10"
 
@@ -80,7 +81,8 @@ PACKAGECONFIG ??= "xz \
                    quotacheck \
                    bootchart \
                    hostnamed \
-                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers', '', d)} \
+                   sysusers \
+                   ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname', '', d)} \
                    hibernate \
                    timedated \
                    timesyncd \
-- 
2.8.0


