Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFB186FE5C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 03:01:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8931JZX002508
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 20:01:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 20:01:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 11:01:37 +0800
Message-ID: <d58dd3655ba6634fe15a01e36fc9822cbc83e13a.1410231534.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410231534.git.Qi.Chen@windriver.com>
References: <cover.1410231534.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] extrausers: add util-linux-sulogin to IMAGE_INSTALL
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
X-List-Received-Date: Tue, 09 Sep 2014 03:01:23 -0000
Content-Type: text/plain

Previously, root with password set cannot login in rescue mode for
core-image-minimal. This is because that the busybox's sulogin is
not configured with FEATURE_SHADOWPASSWORDS enabled.

Add util-linux-sulogin in IMAGE_INSTALL_append properly to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/extrausers.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index faf57b1..e9f4a25 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -15,7 +15,7 @@
 
 inherit useradd_base
 
-IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
+IMAGE_INSTALL_append = " ${@['', 'base-passwd shadow util-linux-sulogin'][bool(d.getVar('EXTRA_USERS_PARAMS', True))]}"
 
 # Image level user / group settings
 ROOTFS_POSTPROCESS_COMMAND_append = " set_user_group;"
-- 
1.9.1


