Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 6412B7FFE0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 03:19:41 +0000 (UTC)
IronPort-SDR: A4b3xUNq4NWt8VP4u5ZowJEhCpxytXu5/I/0mv/ZIT19vOmZzRasv82kHSqSkbOuxnUu2ud74S
	4tOKEpIZGlGkaBe0Q4EoBu8OAEOv8gOXYYGxaFY+IO2idJlCfX3D2vawYSA4PMWv2jn4sIPEQB
	FpSKasUZNpmL1XrrQcQ/lOQL1EtYjUESEflTvujd6aOgML1Znh/J35XRLvlyeyuQhGhHuCucNX
	lnxdEoHe8ZJ99QDFXniG3GXVtL4I/XkHG6NSNNOfMDir9b2eO7P+Uex8GVw824jHdE3buNlQ6w
	dPQ=
X-IronPort-AV: E=Sophos;i="5.69,419,1571695200"; 
   d="scan'208";a="4204945"
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 11 Jan 2020 04:19:40 +0100
Message-ID: <20200111031940.24296-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200111031940.24296-1-pkj@axis.com>
References: <20200111031940.24296-1-pkj@axis.com>
MIME-Version: 1.0
Subject: [master][zeus][PATCHv3 2/2] cairo: Adapt license for cairo-dbg and cairo-src based on contents
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
X-List-Received-Date: Sat, 11 Jan 2020 03:19:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

If the "trace" PACKAGECONFIG is removed to disable cairo-trace (the
only part of the code licensed as GPL-3.0), we can adapt the licenses
for cairo-dbg and cairo-src so that they do not include "GPLv3+" and
thus they can be used also when, e.g., GPL-3.0 is blacklisted in
INCOMPATIBLE_LICENSE.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv3: Split in two patches, one that adds the "trace" PACKAGECONFIG,
and one that adapts the licenses for cairo-dbg and cairo-src if "trace"
is disabled.

 meta/recipes-graphics/cairo/cairo_1.16.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index b772c2ece2..d5820166b1 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -17,6 +17,10 @@ LICENSE_${PN}-doc = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-gobject = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-script-interpreter = "MPL-1.1 | LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
+# Adapt the licenses for cairo-dbg and cairo-src depending on whether
+# cairo-trace is being built.
+LICENSE_${PN}-dbg = "(MPL-1.1 | LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '', d)}"
+LICENSE_${PN}-src = "(MPL-1.1 | LGPLv2.1)${@bb.utils.contains('PACKAGECONFIG', 'trace', ' & GPLv3+', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-- 
2.21.1


