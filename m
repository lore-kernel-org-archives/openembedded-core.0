Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1ULVid-00060V-9m
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 10:35:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Mar 2013 02:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,371,1363158000"; d="scan'208";a="277558315"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 29 Mar 2013 02:18:23 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 11:19:01 +0200
Message-Id: <1364548741-15848-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] meta/lib/oe/lsb.py: fix data extraction from /etc/lsb-release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2013 09:36:08 -0000

In some cases, /etc/lsb-release file is used to extract
info about poky build host machine. But the strings are
not stripped of end of line special characters. As such,
when this info is concatenated and used as a directory
entry in sstate_cache, this is an issue.
Usually, this issue is masked by the fact that distro
related info is extracted from the output of lsb_release
command. In case of Yocto Linux, running "lsb_release -a"
will give an error code because CODENAME info is not present.
As such, bitbake will extract the info from /etc/lsb-release,
running into the above issue.
Consequence is that building under BA will crash.

Partial fix for [YOCTO #4071]

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/lib/oe/lsb.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index f4a5ba1..ebf90ba 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -26,7 +26,7 @@ def release_dict_file():
             with open('/etc/lsb-release') as f:
                 for line in f:
                     key, value = line.split("=", 1)
-                    data[key] = value
+                    data[key] = value.strip()
         elif os.path.exists('/etc/redhat-release'):
             data = {}
             with open('/etc/redhat-release') as f:
-- 
1.7.10.4



