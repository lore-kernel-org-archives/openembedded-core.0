Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 501A371D06
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 20:36:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2017 12:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,255,1477983600"; d="scan'208";a="1096386101"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2017 12:36:07 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 09:36:00 +1300
Message-Id: <217c70e9ea20c2872a66b34294e559a113250569.1484858091.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484858091.git.paul.eggleton@linux.intel.com>
References: <cover.1484858091.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] devtool: check locale and refuse to start if it isn't UTF-8
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
X-List-Received-Date: Thu, 19 Jan 2017 20:36:08 -0000

We need to ensure the locale is UTF-8 or otherwise strange errors will
occur later on during execution - the same reason we check this in
BitBake itself. Unfortunately this check has to be before command line
parsing and therefore showing the help text in response to --help, since
that relies upon parsing bitbake's configuration (as we need to load
plugins in other layers).

Fixes [YOCTO #10908].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/devtool b/scripts/devtool
index 0866be9..c9ad9dd 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -215,6 +215,9 @@ def main():
     global config
     global context
 
+    if sys.getfilesystemencoding() != "utf-8":
+        sys.exit("Please use a locale setting which supports utf-8.\nPython can't change the filesystem locale after loading so we need a utf-8 when python starts or things won't work.")
+
     context = Context(fixed_setup=False)
 
     # Default basepath
-- 
2.5.5


