Return-Path: <spopovyc@cisco.com>
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	by mail.openembedded.org (Postfix) with ESMTP id A89B477ACE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1478; q=dns/txt; s=iport;
	t=1490727130; x=1491936730;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=ZNkcKVS8V/tvBq5YazEXgdR1kAMM2FAbPGAb974i45Y=;
	b=bhtC2IxdkLGUn9bYTvMGfDuwEhFnEw31JjI0OQ3tUmZPyV3ZDewpzKlm
	sBJSbnhjTl+ygPTpxXKHvLd+SkZelfWbJX3Z+t49e0IhWCRDgyCpd51s2
	xQBjbacvJl10xY55ZWvIAFkGnz4VpUZYlJwy1X+YAnXiY8bNBJuj23M4G 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AmAQBzsNpY/40NJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1SBbI1xkTGTXIIPgg6GIgKDIz8YAQIBAQEBAQEBayiFFgZ5EFF?=
	=?us-ascii?q?XGYl6Da9pikwBAQEBAQEBAwIBJROGO4INiAKFGQWcYJJPkTOTah84gQQ6HxWHG?=
	=?us-ascii?q?UA1iVIBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,237,1486425600"; 
   d="scan'208";a="7938751"
Received: from alln-core-8.cisco.com ([173.36.13.141])
	by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	28 Mar 2017 18:51:50 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by alln-core-8.cisco.com (8.14.5/8.14.5) with ESMTP id v2SIpk7C010524
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Tue, 28 Mar 2017 18:51:50 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 18:51:42 +0000
Message-Id: <f5a21387a3f0ce13380e7c185d13ad002659159b.1490726618.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1490726618.git.spopovyc@cisco.com>
References: <cover.1490726618.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH 2/2] distutils3.bbclass: Fix path to python for scripts
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
X-List-Received-Date: Tue, 28 Mar 2017 18:52:09 -0000

This change is similar to the recently introduced
change to the distutils.bbclass fixing shebang
line in python scripts for nativesdk class builds.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 meta/classes/distutils3.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index a6720c5..5950606 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -47,14 +47,14 @@ distutils3_do_install() {
 
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${USRBINPATH}/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
 
         if test -e ${D}${sbindir}; then
             for i in ${D}${sbindir}/* ; do \
-                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${bindir}/env\ ${PYTHON_PN}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}/python-${PYTHON_PN}/${PYTHON_PN}:${USRBINPATH}/env\ ${PYTHON_PN}:g $i
                 sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
             done
         fi
-- 
2.7.4


