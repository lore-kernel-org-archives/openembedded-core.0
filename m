Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 7CFDA7D597
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 00:40:09 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 70041220497;
	Thu,  6 Jun 2019 12:40:07 +1200 (NZST)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jun 2019 12:40:04 +1200
Message-Id: <20190606004004.1558-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] json-c: Make implicit-fallthrough only a warning for compilation under icecc
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
X-List-Received-Date: Thu, 06 Jun 2019 00:40:09 -0000

icecc preprocesses source files locally before shipping them off to be compiled
on remote hosts. This preprocessing removes comments, including /* fallthough */
comments in switch statements that normally prevent the implicit-fallthrough
warning. Rather than turning off -Werror completely, just reduce
implicit-fallthrough to a warning only.

See https://github.com/icecc/icecream/issues/419

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68297..ddda7375d3 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -22,6 +22,9 @@ inherit autotools
 
 EXTRA_OECONF = "--enable-rdrand"
 
+TARGET_CPPFLAGS =+ "-Wno-error=implicit-fallthrough"
+BUILD_CPPFLAGS =+ "-Wno-error=implicit-fallthrough"
+
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.17.1


