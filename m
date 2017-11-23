Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53A98786EE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 05:54:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAN5sh4l006335
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 21:54:43 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 22 Nov 2017 21:54:42 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Nov 2017 13:55:40 +0800
Message-ID: <046ede95b9cc6cebadac80a79c2b75eb9fb1a841.1511416502.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1511416502.git.Qi.Chen@windriver.com>
References: <cover.1511416502.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix register location for rfkill to avoid conflict
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
X-List-Received-Date: Thu, 23 Nov 2017 05:54:42 -0000
Content-Type: text/plain

If we have 'wifi' in distro feature, then busybox would have rfkill
enabled. And we would have the following do_rootfs failure if we
install both busybox and util-linux-rfkill.

  Error: cannot register alternative rfkill to /usr/bin/rfkill since
  it is already registered to /usr/sbin/rfkill.

There's another provider of rfkill in OE, that is rfkill recipe in meta-oe.
And it also registers rfkill to ${sbindir}/rfkill.

So change the register location of rfkill in util-linux to avoid
conflict with busybox and rfkill recipes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 03970e9..248e8be 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -269,7 +269,7 @@ ALTERNATIVE_util-linux-blkid = "blkid"
 ALTERNATIVE_LINK_NAME[blkid] = "${base_sbindir}/blkid"
 
 ALTERNATIVE_util-linux-rfkill = "rfkill"
-ALTERNATIVE_LINK_NAME[rfkill] = "${bindir}/rfkill"
+ALTERNATIVE_LINK_NAME[rfkill] = "${sbindir}/rfkill"
 ALTERNATIVE_TARGET[rfkill] = "${base_bindir}/rfkill"
 
 ALTERNATIVE_util-linux-getopt = "getopt"
-- 
1.9.1


