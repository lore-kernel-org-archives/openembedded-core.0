Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 26D117FA2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 12:11:46 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id c14so6201507wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 04:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eloOy4m7HfuVzuQq/cHRmk/6rZENrFGe8HjLJ5dCoko=;
	b=Vf9qjp54zyFWQmcqnSelfWLVKsY9oesi6TIacKKo5d2uA+Sk2MaLGlKIg/hWD7yMaE
	ihp1rMIid7bvdoyGzxRp+1R679Ns/tSDPalRCMFR6494fJHIlivDSbjfvrw4omqeNPrW
	G2k51k7N0q6NSiEkw9y1L993ik1YcIbV1/GNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=eloOy4m7HfuVzuQq/cHRmk/6rZENrFGe8HjLJ5dCoko=;
	b=jO2T+XCEvDXTrVp8mylqyUjWHx8qeXlsFnVAbMpkCkqrM2Lscrwpo6ihzyZAMqFn2V
	Z6ezAl7wLGXDy8bdgJWKaZ3hEUuQRJ2wptff9zr+W8ve/DAFjjnBkLbRUsRTSOerd5Tp
	3CMjVUvAvJtvgJ3e0SOHQlVVc3tI1F0bOzeGpccaTog4+MIgME9grPFzYehRsEg9X53s
	LBXizfC03u+iBbbrACNzklbcLrWSVxOHecCfI7pbPZHO9LZS3Cm/E9gNmUrJrdU/NmIW
	ZKbR/bITQfGwuASf3cua31b5kFnMG55ML6g1qDv1iQAS/B11ikKqTV8kdrO8c/ERW1+Z
	mTXg==
X-Gm-Message-State: APjAAAVu098xRJe88psbJHDokq+sHPVE5n/whEC1156EvbJIzdbq0/bJ
	DBpF+6rNd5EzQdk2MvhRalUn82C8Cgc=
X-Google-Smtp-Source: APXvYqy7R6BnQDfNyJSzK+6mtggrevuHmuTHRLwwGo9N3jODfvUYim5Oz2/+QmnBH4SeHm8MMIpBVw==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr47253889wrj.102.1574943107387;
	Thu, 28 Nov 2019 04:11:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a206sm10533956wmf.15.2019.11.28.04.11.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Nov 2019 04:11:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Nov 2019 12:11:45 +0000
Message-Id: <20191128121145.22286-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] python3-testtools: Avoid traceback2 module requirement
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
X-List-Received-Date: Thu, 28 Nov 2019 12:11:47 -0000
Content-Transfer-Encoding: 8bit

traceback2 adds traceback for python2. Rather than depend on traceback2, we're
python3 only so just use traceback.

This caused breakage in oe-selftest -j which uses testtools on the autobuilder
using buildtools-tarball.

[YOCTO #13652]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python3-testtools/no_traceback2.patch     | 22 +++++++++++++++++++
 .../python/python3-testtools_2.3.0.bb         |  2 ++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-testtools/no_traceback2.patch

diff --git a/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
new file mode 100644
index 00000000000..f3f35a48707
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-testtools/no_traceback2.patch
@@ -0,0 +1,22 @@
+traceback2 adds traceback for python2. Rather than depend on traceback2, we're
+python3 only so just use traceback.
+This caused breakage in oe-selftest -j which uses testtools on the autobuilder
+using buildtools-tarball.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: testtools-2.3.0/testtools/content.py
+===================================================================
+--- testtools-2.3.0.orig/testtools/content.py
++++ testtools-2.3.0/testtools/content.py
+@@ -19,8 +19,7 @@ import os
+ import sys
+ 
+ from extras import try_import
+-# To let setup.py work, make this a conditional import.
+-traceback = try_import('traceback2')
++import traceback
+ 
+ from testtools.compat import (
+     _b,
diff --git a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
index 896ecee65c5..a254b90a758 100644
--- a/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-testtools_2.3.0.bb
@@ -1,2 +1,4 @@
 inherit setuptools3
 require python-testtools.inc
+
+SRC_URI += "file://no_traceback2.patch"
-- 
2.20.1


