Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DFDBA73A17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 09:11:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2P9BcWd002963
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 02:11:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Wed, 25 Mar 2015 02:11:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 17:11:44 +0800
Message-ID: <ed06418ed8a38573ec509e159a6967be46934a2f.1427274653.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1427274653.git.Qi.Chen@windriver.com>
References: <cover.1427274653.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] shadow: add 'util-linux-sulogin' to RDEPENDS
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
X-List-Received-Date: Wed, 25 Mar 2015 09:11:37 -0000
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


