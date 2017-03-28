Return-Path: <spopovyc@cisco.com>
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
	by mail.openembedded.org (Postfix) with ESMTP id 3B3F577ACD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1513; q=dns/txt; s=iport;
	t=1490729544; x=1491939144;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=xWYlHBUu3ekEsJZO2bFF41j+fEffaAPslrACqa1Dbbc=;
	b=PYCtTc3MOh7u1YuCSlHsI9etOGN2fGHF2Ubktva9NJmly0aq8oHoUbxO
	WG3d/iXcNgTr8SgFuIG6IUA/5zFFkr+h1Vq2tQNj3Ze2CA5QiTCkeQdSr
	hxYhK+8wm+n8YPmwRz+Qqwaa6jpnj7ZvUrISvlKnexjwkjhDkYVaToACA I=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AmAQDDudpY/5FdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBBwEBAQEBg1SBbI1xkTKTXIIPgg6GIgKDJT8YAQIBAQEBAQEBayiFFgZ5EFF?=
	=?us-ascii?q?XGYl6Da98ik4BAQEBAQEBAwIBJROGO4INiAKFGQWcYJJPkTOTah84gQQ6HxWHG?=
	=?us-ascii?q?UA1iVIBAQE?=
X-IronPort-AV: E=Sophos;i="5.36,238,1486425600"; d="scan'208";a="224092060"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
	by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 19:32:24 +0000
Received: from sjc-ads-6963.cisco.com (sjc-ads-6963.cisco.com [10.30.218.83])
	by rcdn-core-9.cisco.com (8.14.5/8.14.5) with ESMTP id v2SJWANP011716
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Tue, 28 Mar 2017 19:32:24 GMT
From: Serhii Popovych <spopovyc@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 19:32:00 +0000
Message-Id: <b597452e95d492173e4b4bf6d4c1cdf665146d34.1490729402.git.spopovyc@cisco.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1490729401.git.spopovyc@cisco.com>
References: <cover.1490729401.git.spopovyc@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: [PATCH v2 2/2] distutils3.bbclass: Fix path to python for scripts
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
X-List-Received-Date: Tue, 28 Mar 2017 19:32:23 -0000

This change is similar to the recently introduced
change to the distutils.bbclass fixing shebang
line in python scripts for nativesdk class builds.

v2: Rebased on top of new head.

Cc: XE-Linux <xe-linux-external@cisco.com>
Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
---
 meta/classes/distutils3.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 01ef72a..6c30306 100644
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


