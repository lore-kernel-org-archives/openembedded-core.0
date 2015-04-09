Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5346873CEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 05:49:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t395nIU4017526
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Apr 2015 22:49:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 8 Apr 2015 22:49:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Apr 2015 13:49:29 +0800
Message-ID: <0be883f21ba69887c02ce4e5b63506272efe7b23.1428558305.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1428558305.git.Qi.Chen@windriver.com>
References: <cover.1428558305.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] shadow: add 'util-linux-sulogin' to RDEPENDS
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
X-List-Received-Date: Thu, 09 Apr 2015 05:49:17 -0000
Content-Type: text/plain

If shadow is installed, sulogin from busybox cannot work correctly because
it still assumes that /etc/shadow is not there. This leads to the problem
when booting into rescue mode in an image with shadow installed but not
sulogin from util-linux.

To fix this problem, we add 'util-linux-sulogin' to RDEPENDS of shadow.
This runtime dependency is specific to OE, because we have to ensure
that sulogin can work correctly and sulogin from busybox cannot because
FEATURE_SHADOWPASSWORDS is not enabled by default. And we cannot enable
it by default for busybox, because that would lead to utilities in busybox
to assume the existence of /etc/shadow which is not always true in OE.

[YOCTO #6698]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index bb3a927..a05ead3 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -83,7 +83,8 @@ PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 
 RDEPENDS_${PN} = "shadow-securetty \
-                  base-passwd"
+                  base-passwd \
+                  util-linux-sulogin"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN}_class-nativesdk = ""
 
-- 
1.9.1


