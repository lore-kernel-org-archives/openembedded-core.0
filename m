Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BACB960851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 18:48:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 12 Jan 2016 10:48:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,558,1449561600"; d="scan'208";a="879952871"
Received: from rusilaw-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.174])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2016 10:48:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 07:47:44 +1300
Message-Id: <5b7e2d609c3d9d212225d30cf252ccb4e534b54e.1452624350.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452624350.git.paul.eggleton@linux.intel.com>
References: <cover.1452624350.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452624350.git.paul.eggleton@linux.intel.com>
References: <cover.1452624350.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] classes/populate_sdk_ext.bbclass: handle if local.conf doesn't end with a newline
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
X-List-Received-Date: Tue, 12 Jan 2016 18:48:22 -0000

If there is no newline at the end of local.conf, appending
INHERIT = "uninative" won't work, it will corrupt the line and the
installed eSDK will build things, making the "Preparing build system..."
step take an age.

Fixes [YOCTO #8897].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 87fb767..984f538 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -142,6 +142,8 @@ python copy_buildsystem () {
         for line in newlines:
             if line.strip() and not line.startswith('#'):
                 f.write(line)
+        # Write a newline just in case there's none at the end of the original
+        f.write('\n')
 
         f.write('INHERIT += "%s"\n\n' % 'uninative')
         f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
-- 
2.5.0


