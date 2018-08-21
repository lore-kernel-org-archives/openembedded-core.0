Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C86FF79020
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:13:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L7DTiA008226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:13:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 00:13:29 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Aug 2018 14:36:07 +0800
Message-ID: <f4a2f7e627f1d85b63fa1df9dfe343bce4792512.1534832871.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534832871.git.kai.kang@windriver.com>
References: <cover.1534832871.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] sstate.bbclass: update SSTATE_DUPWHITELIST
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
X-List-Received-Date: Tue, 21 Aug 2018 07:13:28 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update SSTATE_DUPWHITELIST in sstate.bbclass.

* remove ${DEPLOY_DIR_RPM}/noarch/ which is not overwritten any more
* add directories for package target-sdk-provides-dummy

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/sstate.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c0e54a398d..4b940eb48d 100644
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
2.18.0


