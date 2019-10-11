Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 658607ED3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 09:07:02 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3FA7B5C0134;
	Fri, 11 Oct 2019 11:07:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1570784823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:
	content-transfer-encoding:content-transfer-encoding:in-reply-to:
	references; bh=bmJMKd5x6PbaucAMrzomCxe+TLA74qEmAY/adbxFOOM=;
	b=pbQgTRIyeC5FdVjl66TDo0/Q08WKMTyxIXw3Q0CCYgIVaBxRkHrQPcoqPWjFFZdC/CWt/D
	zaACXTHgBvctGA59PzOiyG9p6AHn1GjFrOFfV2yZBw28pvoIlwTvpPiFaOsNNhc5SulL7w
	U6GvE3jv9gISIVuVc1AqndaxPiuhSIs=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 11:06:59 +0200
Message-Id: <20191011090659.34036-1-stefan@agner.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>, liu.ming50@gmail.com
Subject: [PATCH] uninative: check .done file instead of tarball
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
X-List-Received-Date: Fri, 11 Oct 2019 09:07:03 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

In case multiple builds share UNINATIVE_DLDIR's location, one build
might be in the process of downloading the tarball while another is
just checking whether the tarball exists. Check for the done file
instead and rely on the fetchers lockfile mechanism in case two
builds are running.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 3326c0db3d..9f8645a36a 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -45,7 +45,7 @@ python uninative_event_fetchloader() {
         tarballdir = os.path.join(d.getVar("UNINATIVE_DLDIR"), chksum)
         tarballpath = os.path.join(tarballdir, tarball)
 
-        if not os.path.exists(tarballpath):
+        if not os.path.exists(tarballpath + ".done"):
             bb.utils.mkdirhier(tarballdir)
             if d.getVar("UNINATIVE_URL") == "unset":
                 bb.fatal("Uninative selected but not configured, please set UNINATIVE_URL")
-- 
2.20.1


