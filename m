Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 58D286DF60
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:41:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 04 Dec 2013 08:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,825,1378882800"; d="scan'208";a="438491214"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2013 08:40:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:40:27 +0000
Message-Id: <f6f58d556b717669808c419f47297b8f1bd002c7.1386175183.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386175183.git.paul.eggleton@linux.intel.com>
References: <cover.1386175183.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] openssh: remove unrecognised configure option
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
X-List-Received-Date: Wed, 04 Dec 2013 16:41:26 -0000

ssh-rand-helper was removed in OpenSSH 6.0 according to the upstream
changelog, so the configure option to enable/disable it was removed.

Fixes the following warning:
WARNING: QA Issue: openssh: configure was passed unrecognised options: --with-rand-helper

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/openssh/openssh_6.4p1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
index 859fdd6..b48c14b 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
@@ -55,8 +55,7 @@ inherit autotools
 CFLAGS += "-D__FILE_OFFSET_BITS=64"
 export LD = "${CC}"
 
-EXTRA_OECONF = "--with-rand-helper=no \
-                ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
+EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
                 --without-zlib-version-check \
                 --with-privsep-path=/var/run/sshd \
                 --sysconfdir=${sysconfdir}/ssh \
-- 
1.8.1.2


