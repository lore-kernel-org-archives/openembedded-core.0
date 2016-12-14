Return-Path: <pb@pbcl.net>
X-Greylist: delayed 1243 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Dec 2016 21:58:47 UTC
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4CB7573204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 21:58:47 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>) id 1cHHFR-0007dv-UT
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2016 22:38:04 +0100
Message-ID: <1481751480.3851.14.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2016 21:38:00 +0000
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: [PATCH] lttng-ust: Patch python shebang appropriately for native builds
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
X-List-Received-Date: Wed, 14 Dec 2016 21:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we are building a native package then ${bindir}/python3 is not guaranteed
to be available, and if it is available then it is probably a directory not a
file.  In either case, attempting to use it as an interpreter will not end
well.  Let's use ${bindir}/nativepython instead.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-kernel/lttng/lttng-ust_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
index 5869093..df22352 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -29,10 +29,12 @@ SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.7 \
 
 PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-native xmlto-native libxslt-native"
 
+usepython="${bindir}/python3"
+usepython_class-native="${bindir}/nativepython"
 do_install_append() {
         # Patch python tools to use Python 3; they should be source compatible, but
         # still refer to Python 2 in the shebang
-        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
+        sed -i -e '1s,#!.*python.*,#!${usepython},' ${D}${bindir}/lttng-gen-tp
 }
 
 S = "${WORKDIR}/git"
-- 
2.10.1

