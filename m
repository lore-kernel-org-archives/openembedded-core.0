Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB63475ECE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:02:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA2iCu024087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:02:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:02:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:02:41 -0700
Message-ID: <7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781736.git.liezhi.yang@windriver.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] glibc: print PN when bbwarn
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
X-List-Received-Date: Mon, 13 Jul 2015 10:02:47 -0000
Content-Type: text/plain

The current warning is:
WARNING: glibc: unable to generate header for spray.x

Which is easier to debug than:
WARNING: unable to generate header for spray.x

And remove the file before generate it again to fix the warning when
recompile:
file `bootparam_prot.h' already exists and may be overwritten
WARNING: unable to generate header for bootparam_prot.x
file `nlm_prot.h' already exists and may be overwritten
WARNING: unable to generate header for nlm_prot.x
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glibc/glibc_2.21.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 8197c29..30f1937 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -135,7 +135,8 @@ do_compile () {
 		cd ${S}/sunrpc/rpcsvc
 		for r in ${rpcsvc}; do
 			h=`echo $r|sed -e's,\.x$,.h,'`
-			rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
+			rm -f $h
+			rpcgen -h $r -o $h || bbwarn "${PN}: unable to generate header for $r"
 		done
 	)
 	echo "Adjust ldd script"
-- 
1.7.9.5


