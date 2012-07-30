Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Svshm-0000Ve-7i
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 18:20:26 +0200
Received: by pbbrq2 with SMTP id rq2so8823993pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 09:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uog44nST8rKzcb5QV7EX08MAa9xC21NUsq6KIpiYcjc=;
	b=gqzrtNDsuYOnmJCxynxWoXQF7jtWYTAb+I6exCllTTwgETiA8SUkdrQq41GyPkS3wC
	mx4xSGSdWx2BVyaOlqMxGtgyOkSETvUHaAe4fjrRB2V1u2D5Iz3/fY7UMrXRFuDVV1CK
	OLMiaVT2VUD9fAC2opfseqmxAy2vKbfufcAjn/8MKU6EvXTY/GNuqr2hpr0itfnvM7iB
	Ax1JuNJe+eig6uWENMf5DKIcjhhomehoa0QM/6cnRrJSpDcHT76uMJd7t2OjLtMd7O4r
	c2WjPA1GX0VN04L9fFJg4FYUkIDeH57YHiTfoHM+l2Zai5FEzDSHdKG1MFJotJfbEiKb
	cLVA==
Received: by 10.68.132.201 with SMTP id ow9mr35950016pbb.160.1343664529718;
	Mon, 30 Jul 2012 09:08:49 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id rx7sm8168179pbc.64.2012.07.30.09.08.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 09:08:48 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jul 2012 09:08:46 -0700
Message-Id: <1343664526-7842-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] scripts/bitbake: unbreak the git version comparison
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 16:20:26 -0000

From: Christopher Larson <chris_larson@mentor.com>

With the current code, we're calling awk to do a floating point comparison
between '1.7.0.4' and '1.7.5' (on an ubuntu 10.04 LTS machine). These clearly
aren't proper floating point numbers, and the comparison is incorrect. It's
returning true for 1.7.0.4 >= 1.7.5.

Instead of using a floating point comparison for this, call out to python and
let it do it.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/bitbake |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 580f377..09f8a86 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -64,13 +64,16 @@ GITVERSION=`git --version | cut -d ' ' -f 3`
 float_test() {
      echo | awk 'END { exit ( !( '"$1"')); }'
 }
+version_compare() {
+    python -c "from distutils.version import LooseVersion; import sys; sys.exit(not (LooseVersion('$1') $2 LooseVersion('$3')))"
+}
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 float_test "$TARVERSION > 1.23" && needtar="0"
 
 # Need git >= 1.7.5 for git-remote --mirror=xxx syntax
-float_test "$GITVERSION >= 1.7.5" && needgit="0"
+version_compare $GITVERSION ">=" 1.7.5 && needgit="0"
 
 
 buildpseudo="1"
-- 
1.7.9.5



