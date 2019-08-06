Return-Path: <jwessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0F267F3AB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 21:16:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x76LGxsP027743
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Aug 2019 14:16:59 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 14:16:10 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 5002)	id 632B8AA4816;
	Tue,  6 Aug 2019 14:16:09 -0700 (PDT)
From: Jason Wessel <jason.wessel@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Aug 2019 14:16:08 -0700
Message-ID: <20190806211608.5801-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH v3] sqlite3: Fix zlib determinism problem
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
X-List-Received-Date: Tue, 06 Aug 2019 21:16:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

sqlite3-native in particular was finding zlib from the host if zlib-devel
was installed. This could lead to races where pseudo-native may or may not
fail to build.

We don't need/use compressed page support with sqlite so disable the dependency
(it doesn't have a configure option so use a autoconf cache variable).

The target binaries were not previously building with zlib, so we will
leave the default being zlib turned off, while the host binaries were
building with it "occasionally", but not for anything at runtime.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/recipes-support/sqlite/sqlite3.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
index daf3db5e9f..7cf23d0447 100644
--- a/meta/recipes-support/sqlite/sqlite3.inc
+++ b/meta/recipes-support/sqlite/sqlite3.inc
@@ -34,6 +34,9 @@ PACKAGECONFIG[json1] = "--enable-json1,--disable-json1"
 PACKAGECONFIG[rtree] = "--enable-rtree,--disable-rtree"
 PACKAGECONFIG[session] = "--enable-session,--disable-session"
 PACKAGECONFIG[dyn_ext] = "--enable-dynamic-extensions,--disable-dynamic-extensions"
+PACKAGECONFIG[zlib] = ",,zlib"
+
+CACHED_CONFIGUREVARS += "${@bb.utils.contains('PACKAGECONFIG', 'zlib', '', 'ac_cv_search_deflate=no',d)}"
 
 EXTRA_OECONF = " \
     --enable-shared \
-- 
2.21.0


