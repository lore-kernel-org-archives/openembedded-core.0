Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E1575722C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:36:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2015 11:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443320771"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.118])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 11:17:14 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 11:30:25 -0800
Message-Id: <1421868625-22382-4-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
References: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 3/3] base-passwd: Don't replace $ variables in passwd and group files
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
X-List-Received-Date: Wed, 21 Jan 2015 19:36:22 -0000

From: Pascal Bach <pascal.bach@siemens.com>

This allows the usage of "$type$salt$encrypted_password" passwords in the passwd file.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index ec8f2af..a35ea9b 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -75,11 +75,11 @@ python populate_packages_prepend() {
     preinst = """#!/bin/sh
 mkdir -p $D${sysconfdir}
 if [ ! -e $D${sysconfdir}/passwd ]; then
-\tcat << EOF > $D${sysconfdir}/passwd
+\tcat << 'EOF' > $D${sysconfdir}/passwd
 """ + passwd + """EOF
 fi
 if [ ! -e $D${sysconfdir}/group ]; then
-\tcat << EOF > $D${sysconfdir}/group
+\tcat << 'EOF' > $D${sysconfdir}/group
 """ + group + """EOF
 fi
 """
-- 
2.1.0


