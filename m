Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CAF170983
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:16:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s6V1GU74001621
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 18:16:30 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 30 Jul 2014 18:16:29 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Jul 2014 20:16:25 -0500
Message-ID: <08049828f89080256784461ab0ccb3327d626a10.1406769215.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1406769215.git.mark.hatle@windriver.com>
References: <cover.1406769215.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] gcc: Fix gcc-multilib-config comparison
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
X-List-Received-Date: Thu, 31 Jul 2014 01:16:30 -0000
Content-Type: text/plain

Fix an issue on a multilib configuration that contains more then 1 multilib.

I.e. on MIPS64:

DEFAULTTUNE = "mips64"
MULTILIBS = "lib32n:mips64_n32 lib32:mips32"

While normally you'd use 'libn32', the above is legal.

With the startswith code, the system will look to expand the 'lib32' element
and find the 'lib32n' instead, and will result in a warning:

lib32 doesn't have a corresponding tune. Skipping...

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index b8c705a..6134097 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -152,7 +152,7 @@ python gcc_multilib_setup() {
     if mlprefix:
         mlindex = 0
         for ml in multilibs:
-            if mlprefix.startswith(ml):
+            if mlprefix == ml + '-':
                 break
             mlindex += 1
 
-- 
1.9.3


