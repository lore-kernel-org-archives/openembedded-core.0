Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1102672113
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 10:09:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAEA9Ppf023111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 02:09:25 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 02:09:24 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 05:09:22 -0500
Message-ID: <de1ccfe74f1e105966e3303eb19822aec5ac74ed.1415959483.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415959483.git.wenzong.fan@windriver.com>
References: <cover.1415959483.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] shadow: fix pam configs for chpasswd, newusers
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
X-List-Received-Date: Fri, 14 Nov 2014 10:09:31 -0000
Content-Type: text/plain

From: Hu <yadi.hu@windriver.com>

Fix below errors while pam is enabled on target:

  root@qemux86:~# newusers
  newusers: PAM: Authentication failure
  root@qemux86:~# chpasswd
  chpasswd: PAM: Authentication failure

The configs copied from "chgpasswd" which command works with pam.

Signed-off-by: Hu <yadi.hu@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-extended/shadow/files/pam.d/chpasswd |    2 ++
 meta/recipes-extended/shadow/files/pam.d/newusers |    2 ++
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
1.7.9.5


