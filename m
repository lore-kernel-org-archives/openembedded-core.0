Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EE1A60664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 08:20:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7D8KGJg026270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 01:20:16 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 13 Aug 2013 01:20:15 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 16:20:18 +0800
Message-ID: <02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1376379182.git.rongqing.li@windriver.com>
References: <cover.1376379182.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Tue, 13 Aug 2013 08:20:15 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
sstate_create_package will store SSTATE_BUILDDIR into a archive file by
tar, but once other packages install the same file into sysroot, the
creating the archive file will fail with below error:

    DEBUG: Executing shell function sstate_create_package
    tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed as we read it

This kind of error is harmless, use --ignore-failed-read to ignore it.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c1ca54b..3e2fedd 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -565,7 +565,7 @@ sstate_create_package () {
 	TFILE=`mktemp ${SSTATE_PKG}.XXXXXXXX`
 	# Need to handle empty directories
 	if [ "$(ls -A)" ]; then
-		tar -czf $TFILE *
+		tar --ignore-failed-read -czf $TFILE *
 	else
 		tar -cz --file=$TFILE --files-from=/dev/null
 	fi
-- 
1.7.10.4


