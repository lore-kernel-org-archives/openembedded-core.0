Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDD467F69D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 06:15:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8J6FltK026149
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 23:15:47 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 18 Sep 2019 23:15:40 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2019 14:15:20 +0800
Message-ID: <1568873720-135217-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] shadow: use relaxed usernames for all
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
X-List-Received-Date: Thu, 19 Sep 2019 06:15:46 -0000
Content-Type: text/plain

The previous commit <shadow: use relaxed usernames> works only for
target. When test with configuration:
INHERIT += 'extrausers'
EXTRA_USERS_PARAMS += "useradd -p '' aBcD; "
and run "bitbake core-image-minimal", error occurs:
NOTE: core-image-minimal: Performing useradd with [
-R .../build/tmp-glibc/work/qemux86_64-wrs-linux/core-image-minimal/1.0-r0/rootfs -p '' aBcD]
useradd: invalid user name 'aBcD'

Here move the patch for using relaxed usernames from class_target to
the source code for all.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 7f8ee78..af38b91 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -14,12 +14,12 @@ SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.
            file://0001-Make-the-sp_lstchg-shadow-field-reproducible-re.-71.patch  \
            file://0001-configure.ac-fix-configure-error-with-dash.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
+           file://shadow-relaxed-usernames.patch \
            "
 
 SRC_URI_append_class-target = " \
            file://login_defs_pam.sed \
            file://shadow-update-pam-conf.patch \
-           file://shadow-relaxed-usernames.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
1.9.1


