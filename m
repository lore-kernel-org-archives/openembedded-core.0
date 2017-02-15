Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2A9F07665F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 07:13:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2FB78207F0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:11 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 15 Feb 2017 02:13:11 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=en1EfhMlDzWlymllr4lfOl9/GKs=; b=bbTq8
	c0NJficnVDwxtoCjBuAdWPgBh8QksBdqJHy13HL+C3OeeqIkSiZ3KGxu9RRwi+K/
	HKrDn0TcYjhDs75FN9lGzDoD/xO4Sh7D/ORL81Bm59Agh/VLY0i3nebgIJK2zddo
	xM3u/g7l1NbvWFauo0dqdttGsPdJPYIA6+I5no=
X-ME-Sender: <xms:h_-jWBd7me91Hu2jO9OlPebsfonZdvapLuyszslxT2zyKDBcYBMSIw>
X-Sasl-enc: o5Hgg9XGQMPaXxtpAoQ1ZNgrhC2YztTi0EY3oJulD/L1 1487142790
Received: from localhost.localdomain (unknown [192.40.95.8])
	by mail.messagingengine.com (Postfix) with ESMTPA id 973B17E0CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 02:13:10 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 09:13:02 +0200
Message-Id: <20170215071303.3244-3-tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170215071303.3244-1-tanuk@iki.fi>
References: <20170215071303.3244-1-tanuk@iki.fi>
Subject: [PATCH 2/3] alsa-lib: fix softfloat enabling
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
X-List-Received-Date: Wed, 15 Feb 2017 07:13:11 -0000

EXTRA_OECONF = "--disable-python" overrode the previous EXTRA_OECONF
assignment, so softfloat didn't get enabled when needed. Fixed this by
replacing "=" with "+=".

Bitbake then complained about tabs in alsa-fpu.inc, changed them to
spaces.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 meta/recipes-multimedia/alsa/alsa-fpu.inc      | 8 +++-----
 meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-fpu.inc b/meta/recipes-multimedia/alsa/alsa-fpu.inc
index 1ca31e7498..355a9dfcd1 100644
--- a/meta/recipes-multimedia/alsa/alsa-fpu.inc
+++ b/meta/recipes-multimedia/alsa/alsa-fpu.inc
@@ -1,6 +1,4 @@
-
 def get_alsa_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU') in [ 'soft' ]:
-		return "--with-softfloat"
-	return ""
-
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
+        return "--with-softfloat"
+    return ""
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
index 5c213bebde..34a7d8802e 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig
 require alsa-fpu.inc
 EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
 
-EXTRA_OECONF = "--disable-python"
+EXTRA_OECONF += "--disable-python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
-- 
2.11.0


