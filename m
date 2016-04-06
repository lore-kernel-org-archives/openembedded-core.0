Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 179CA73199
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 09:30:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u369U5NV025170
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Apr 2016 02:30:05 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Apr 2016 02:30:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Apr 2016 02:30:02 -0700
Message-ID: <a56a312f9a90427fe47b2e5600cb9eb8698fb90f.1459934955.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459934955.git.liezhi.yang@windriver.com>
References: <cover.1459934955.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] wget: fix build when len(TMPDIR) == 410
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
X-List-Received-Date: Wed, 06 Apr 2016 09:30:05 -0000
Content-Type: text/plain

Fixed:
aclocal: error: cannot open [snip] |: Argument list too long

Set acpaths to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 049b898..dc381a6 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -22,3 +22,8 @@ BBCLASSEXTEND += "nativesdk"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
+
+# Let aclocal use the relative path for the m4 file rather than
+# absolute, otherwise there might be an "Argument list too long" error
+# when it is built in a long/deep directory.
+acpaths = "-I ./m4"
-- 
2.8.0


