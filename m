Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0F5D71DD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 02:56:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v672uZ6N027554
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Jul 2017 19:56:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 19:56:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 6 Jul 2017 22:56:33 -0400
Message-ID: <1499396193-163159-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] shadow: fix pam configs for chpasswd, newusers
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
X-List-Received-Date: Fri, 07 Jul 2017 02:56:40 -0000
Content-Type: text/plain

From: "yadi.hu@windriver.com" <yadi.hu@windriver.com>

While pam is enabled:
...
DISTRO_FEATURES_append = " pam"
...

Fix below errors on target:
...
  root@qemux86:~# newusers
  newusers: PAM: Authentication failure
  root@qemux86:~# chpasswd
  chpasswd: PAM: Authentication failure
...

The configs copied from "chgpasswd" which command works with pam.

Signed-off-by: Hu <yadi.hu@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/shadow/files/pam.d/chpasswd | 2 ++
 meta/recipes-extended/shadow/files/pam.d/newusers | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/pam.d/chpasswd b/meta/recipes-extended/shadow/files/pam.d/chpasswd
index 9e3efa6..b769d92 100644
--- a/meta/recipes-extended/shadow/files/pam.d/chpasswd
+++ b/meta/recipes-extended/shadow/files/pam.d/chpasswd
@@ -1,4 +1,6 @@
 # The PAM configuration file for the Shadow 'chpasswd' service
 #
 
+auth       sufficient   pam_rootok.so
+account    required     pam_permit.so
 password   include      common-password
diff --git a/meta/recipes-extended/shadow/files/pam.d/newusers b/meta/recipes-extended/shadow/files/pam.d/newusers
index 4aa3dde..4c59dfa 100644
--- a/meta/recipes-extended/shadow/files/pam.d/newusers
+++ b/meta/recipes-extended/shadow/files/pam.d/newusers
@@ -1,4 +1,6 @@
 # The PAM configuration file for the Shadow 'newusers' service
 #
 
+auth       sufficient   pam_rootok.so
+account    required     pam_permit.so
 password   include      common-password
-- 
2.8.1


