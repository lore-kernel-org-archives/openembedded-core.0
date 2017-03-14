Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2C22F776B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:45:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2E8juMd006640
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:45:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:45:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Mar 2017 01:45:41 -0700
Message-ID: <30b0c7a3bd07acb4f0b86ddb9076a4f443c59b50.1489481108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/8] mc: set ac_cv_path_PERL to /usr/bin/perl
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
X-List-Received-Date: Tue, 14 Mar 2017 08:45:55 -0000
Content-Type: text/plain

The shebang's length is usually 128 as defined in /usr/include/linux/binfmts.h:
  #define BINPRM_BUF_SIZE 128

So there would be errors when /path/to/hosttools/perl is longer than 128.

Set ac_cv_path_PERL to /usr/bin/perl to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mc/mc_4.8.18.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.18.bb b/meta/recipes-extended/mc/mc_4.8.18.bb
index 78abb275ba..87cc4d0677 100644
--- a/meta/recipes-extended/mc/mc_4.8.18.bb
+++ b/meta/recipes-extended/mc/mc_4.8.18.bb
@@ -22,6 +22,8 @@ PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL=${USRBINPATH}/perl"
+
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
 	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
-- 
2.11.0.rc2.dirty


