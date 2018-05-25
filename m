Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35A9874D98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:40:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4P2e5ui021935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:40:05 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 May 2018 19:40:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 May 2018 10:48:10 +0800
Message-ID: <84a7c9a7bfb77ac0f80b4f6d1c7dd5dc2fb37384.1527216285.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1527216285.git.liezhi.yang@windriver.com>
References: <cover.1527216285.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/24] shadow: fix pam configs for chpasswd, newusers
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
X-List-Received-Date: Fri, 25 May 2018 02:40:04 -0000
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
2.7.4


