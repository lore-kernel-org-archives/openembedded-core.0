Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 7FD527C39B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 02:05:46 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 9488622046A;
	Thu,  6 Jun 2019 14:05:46 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 14:05:44 +1200
Message-Id: <20190606020544.26181-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] json-c: Disable icecc to avoid implicit-fallthrough warning as error
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
X-List-Received-Date: Thu, 06 Jun 2019 02:05:46 -0000

icecc preprocesses source files locally before shipping them off to be compiled
on remote hosts. This preprocessing removes comments, including /* fallthrough */
comments in switch statements that normally prevent the implicit-fallthrough
warning.

Rather than turning off -Werror by patching configure.ac, it is simpler to
disable icecc completely for json-c. There are very few source files to compile,
so the compilation is quick even without icecc.

See https://github.com/icecc/icecream/issues/419

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68297..8d2a20352d 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -21,6 +21,7 @@ RPROVIDES_${PN} = "libjson"
 inherit autotools
 
 EXTRA_OECONF = "--enable-rdrand"
+ICECC_DISABLED = "1"
 
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
-- 
2.17.1


