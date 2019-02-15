Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1FF86069C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 02:07:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F27HW2001066
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Feb 2019 18:07:17 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.435.0;
	Thu, 14 Feb 2019 18:07:17 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Feb 2019 21:06:38 -0500
Message-ID: <ff6bf8c57e1f7958aa7600a2e5a9464fdb61a0b8.1550195817.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <cover.1550195817.git.kai.kang@windriver.com>
References: <cover.1550195817.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] openssl: update patch to fix buildpaths qa issue for -fmacro-prefix-map
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
X-List-Received-Date: Fri, 15 Feb 2019 02:07:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Gcc option '-fmacro-prefix-map' is added to DEBUG_PREFIX_MAP. It has a
patch to deal option '-fdebug-prefix-map' already. Update the patch
0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch to fix
buildpaths qa issue for '-fmacro-prefix-map' too.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...dinfo-strip-sysroot-and-debug-prefix-map-from-co.patch | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 80b62ab18c..949c788344 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -20,6 +20,11 @@ https://patchwork.openembedded.org/patch/147229/
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Martin Hundebøll <martin@geanix.com>
+
+
+Update to fix buildpaths qa issue for '-fmacro-prefix-map'.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  Configurations/unix-Makefile.tmpl | 10 +++++++++-
  crypto/build.info                 |  2 +-
@@ -29,7 +34,7 @@ diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tm
 index 16af4d2087..54c162784c 100644
 --- a/Configurations/unix-Makefile.tmpl
 +++ b/Configurations/unix-Makefile.tmpl
-@@ -317,13 +317,21 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+@@ -317,13 +317,22 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -43,6 +48,7 @@ index 16af4d2087..54c162784c 100644
  
 +CFLAGS_Q={- for (@{$config{CFLAGS}}) {
 +              s|-fdebug-prefix-map=[^ ]+|-fdebug-prefix-map=|g;
++              s|-fmacro-prefix-map=[^ ]+|-fmacro-prefix-map=|g;
 +            }
 +            join(' ', @{$config{CFLAGS}}) -}
 +
-- 
2.20.0


