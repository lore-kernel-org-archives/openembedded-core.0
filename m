Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D7C77AB3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 10:06:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v36A64WS009107
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Apr 2017 03:06:06 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Apr 2017 03:06:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 03:05:54 -0700
Message-ID: <42d962bd1ab488f9ed3bfd5d76549ea5100fc6f4.1491473008.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1491473008.git.liezhi.yang@windriver.com>
References: <cover.1491473008.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] guile: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Thu, 06 Apr 2017 10:06:05 -0000
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


