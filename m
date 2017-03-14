Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 981CF77690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:45:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2E8joXv004800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:45:51 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:45:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Mar 2017 01:45:39 -0700
Message-ID: <d4e6c7a11c3936ca2b30246c88452b441022c297.1489481108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] guile: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Tue, 14 Mar 2017 08:45:49 -0000
Content-Type: text/plain

Fixed when len(TMPDIR) =  410:
Can't exec "/bin/sh": Argument list too long at /usr/lib/perl/5.18/IO/File.pm line 65.

This is becuase it has a lot of m4 files, use relative path for them
can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/guile/guile_2.0.14.bb b/meta/recipes-devtools/guile/guile_2.0.14.bb
index d2306e6a75..7a36ba0c3b 100644
--- a/meta/recipes-devtools/guile/guile_2.0.14.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.14.bb
@@ -30,6 +30,9 @@ SRC_URI[sha256sum] = "e8442566256e1be14e51fc18839cd799b966bc5b16c6a1d7a7c35155a8
 inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
 
+# Fix "Argument list too long" error when len(TMPDIR) = 410
+acpaths = "-I ./m4"
+
 DEPENDS = "libunistring bdwgc gmp libtool libffi ncurses readline"
 # add guile-native only to the target recipe's DEPENDS
 DEPENDS_append_class-target = " guile-native libatomic-ops"
-- 
2.11.0.rc2.dirty


