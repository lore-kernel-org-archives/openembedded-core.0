Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 297497F959
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:48 +0000 (UTC)
IronPort-SDR: e1rm2aKzAxIF5agD3kk0TGy1CkvZb82tsZ4lrOHoVPs3nqPLQ49Ipou5T7pIUJTl2rRzrrb5XS
	lfzc6Ze9mLEFmeuHnKulfz9QgI9QdCCShD6V1BusHMLCR3mhevWBrTOB5FSyWwJRFsb949L1et
	15fhq1q6BgJzkpHUBtkyraXrneRJTCctFrAH5QZ6gShnallEFkZPBwoKo6RAn9nbsudvS5pGKB
	sGykNe35Dqgo5JDaWJU6McDTp1vQH0KE86ZXIxc32O4iuF+GEekYKWBtAzKOhpNV0Fg7GdvqJo
	lX0=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2115961"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:39 +0100
Message-Id: <245cfd49b5a69175db724353638c18144c2fdffb.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1572991610.git.pkj@axis.com>
References: <cover.1572991610.git.pkj@axis.com>
MIME-Version: 1.0
Subject: [warrior][PATCHv2 9/9] lib/oe/lsb: Make sure the distro ID is always lowercased
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:49 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

In commit 8689e561 (lib/oe/lsb: attempt to ensure consistent distro id
regardless of source), the distro ID returned by
oe.lsb.distro_identifier() was lowercased, but only if a release
version is also present.

This changes the code to always lowercase the distro ID, including the
default distro ID "unknown", which is used if no other ID can be
identified.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/lsb.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 4f2b419edc..43e46380d7 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -110,12 +110,12 @@ def distro_identifier(adjust_hook=None):
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
-        return "Unknown"
-    # Filter out any non-alphanumerics
-    distro_id = re.sub(r'\W', '', distro_id)
+        return "unknown"
+    # Filter out any non-alphanumerics and convert to lowercase
+    distro_id = re.sub(r'\W', '', distro_id).lower()
 
     if release:
-        id_str = '{0}-{1}'.format(distro_id.lower(), release)
+        id_str = '{0}-{1}'.format(distro_id, release)
     else:
         id_str = distro_id
     return id_str.replace(' ','-').replace('/','-')
-- 
2.21.0


