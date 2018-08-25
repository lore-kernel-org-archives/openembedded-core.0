Return-Path: <kai.kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 161D5794E5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2018 17:13:46 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w7PHDj2c011085;
	Sat, 25 Aug 2018 10:13:45 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Sat, 25 Aug 2018 10:13:45 -0700
From: Kai Kang <kai.kang@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sat, 25 Aug 2018 10:13:38 -0700
Message-Id: <f41119a8163bdc5e6fe79442d41c466bb95114d8.1535216766.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
In-Reply-To: <cover.1535216766.git.kai.kang@windriver.com>
References: <cover.1535216766.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] sstate.bbclass: update SSTATE_DUPWHITELIST
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
X-List-Received-Date: Sat, 25 Aug 2018 17:13:46 -0000

Update SSTATE_DUPWHITELIST in sstate.bbclass.

* remove ${DEPLOY_DIR_RPM}/noarch/ which is not overwritten any more
* add directories for package target-sdk-provides-dummy

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/sstate.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c0e54a398d6..4b940eb48d3 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -25,12 +25,14 @@ PV[vardepvalue] = "${PV}"
 SSTATE_EXTRAPATH[vardepvalue] = ""
 
 # For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
-SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/noarch/"
+SSTATE_DUPWHITELIST = "${DEPLOY_DIR}/licenses/"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 # sdk-provides-dummy-nativesdk and nativesdk-buildtools-perl-dummy overlap for different SDKMACHINE
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_RPM}/sdk_provides_dummy_nativesdk/ ${DEPLOY_DIR_IPK}/sdk-provides-dummy-nativesdk/"
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_RPM}/buildtools_dummy_nativesdk/ ${DEPLOY_DIR_IPK}/buildtools-dummy-nativesdk/"
+# target-sdk-provides-dummy overlaps that allarch is disabled when multilib is used
+SSTATE_DUPWHITELIST += "${COMPONENTS_DIR}/sdk-provides-dummy-target/ ${DEPLOY_DIR_RPM}/sdk_provides_dummy_target/ ${DEPLOY_DIR_IPK}/sdk-provides-dummy-target/"
 # Archive the sources for many architectures in one deploy folder
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
 # ovmf/grub-efi/systemd-boot multilib recipes can generate identical overlapping files
-- 
2.11.0


