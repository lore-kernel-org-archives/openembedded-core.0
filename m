Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 463C4606A8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 02:43:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2015 18:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,397,1444719600"; 
   d="scan'208";a="9286416"
Received: from schan8-mobl7.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.144.63])
	by fmsmga004.fm.intel.com with ESMTP; 07 Dec 2015 18:43:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 15:42:38 +1300
Message-Id: <3a680ca0e05ec5038c456954a48336e0e0034dc4.1449542331.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1449542331.git.paul.eggleton@linux.intel.com>
References: <cover.1449542331.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1449542331.git.paul.eggleton@linux.intel.com>
References: <cover.1449542331.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] toolchain-shar-extract.sh: ensure cleaned environment will work for ext SDK
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
X-List-Received-Date: Tue, 08 Dec 2015 02:43:02 -0000

In OE-Core revision 6d2074d477596971dc52027dd87b02af7f39138d we added a
line which re-executes the script with a cleaned environment using
env -i; unfortunately that caused a regression in the extensible SDK on
Ubuntu 14.04 - strangely, there it seems that the value you get for PATH
under env -i contains '.' which triggers a sanity check failure when
preparing the build system. Do a belt-and-braces fix - source
/etc/environment if it exists (so you get a more complete PATH value)
and then filter any nastiness out of PATH for good measure. (Ubuntu
15.04 doesn't seem to suffer from the same problem.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 8ef2b77..b20e393 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,6 +1,8 @@
 #!/bin/sh
 
 [ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 "$0" "$@"
+[ -f /etc/environment ] && . /etc/environment
+export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
 
 INST_ARCH=$(uname -m | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
 SDK_ARCH=$(echo @SDK_ARCH@ | sed -e "s/i[3-6]86/ix86/" -e "s/x86[-_]64/x86_64/")
-- 
2.5.0


