Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0CECD730DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489606755; x=1521142755;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=rjfsJPXfP0TT9RIA9rfPU2fWbZPigFs6taU0svBKHbE=;
	b=E87Pb33nabzY4SLUc4rLmWzk97FQFK9sgGAFNOg/iGcT9j/89E+9gl56
	BdfNfX+5nivhh2Qc6c+QqPf4ThB14A==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 12:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="60846098"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2017 12:39:14 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 12:39:12 -0700
Message-Id: <1489606752-37886-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489606752-37886-1-git-send-email-juro.bystricky@intel.com>
References: <1489606752-37886-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmmail.com
Subject: [morty][PATCH 1/1] sanity.bbclass: modify check for shell
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
X-List-Received-Date: Wed, 15 Mar 2017 19:39:14 -0000

Due to the recently implemented update-alternatives for bash binary,
sanity checker may end up with a (false-positive) error such as:

Error, /bin/sh links to /bin/bash.bash, must be dash or bash

This patch modifies the test: presence of "/bash" or "/dash" in shell binary
name results in pass.

[YOCTO#11108]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/sanity.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7682ffb..a11b581 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -929,7 +929,9 @@ def check_sanity_everybuild(status, d):
     # If /bin/sh is a symlink, check that it points to dash or bash
     if os.path.islink('/bin/sh'):
         real_sh = os.path.realpath('/bin/sh')
-        if not real_sh.endswith('/dash') and not real_sh.endswith('/bash'):
+        # Due to update-alternatives, the shell name may take various
+        # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
+        if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
 
 def check_sanity(sanity_data):
-- 
2.7.4


