Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3804876A62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 07:51:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7J7p3Zq010699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 00:51:03 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 00:51:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Aug 2015 00:51:01 -0700
Message-ID: <7f16380e7f6a96b203f3b54738330785685ed093.1439970618.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439970618.git.liezhi.yang@windriver.com>
References: <cover.1439970618.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glibc: use cross-rpcgen to replace host's rpcgen
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
X-List-Received-Date: Wed, 19 Aug 2015 07:51:03 -0000
Content-Type: text/plain

There might be unexpected errors when use host's rpcgen.

[YOCTO #8181]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glibc/glibc_2.22.bb |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 6aaf722..f0e1fad 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -97,10 +97,6 @@ do_configure () {
 # calls for now
 # don't pass CPPFLAGS into configure, since it upsets the kernel-headers
 # version check and doesn't really help with anything
-        if [ -z "`which rpcgen`" ]; then
-                echo "rpcgen not found.  Install glibc-devel."
-                exit 1
-        fi
         (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
         find ${S} -name "configure" | xargs touch
         CPPFLAGS="" oe_runconf
@@ -119,7 +115,7 @@ do_compile () {
 		for r in ${rpcsvc}; do
 			h=`echo $r|sed -e's,\.x$,.h,'`
 			rm -f $h
-			rpcgen -h $r -o $h || bbwarn "${PN}: unable to generate header for $r"
+			${B}/sunrpc/cross-rpcgen -h $r -o $h || bbwarn "${PN}: unable to generate header for $r"
 		done
 	)
 	echo "Adjust ldd script"
-- 
1.7.9.5


