Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3F277DA1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 09:57:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3D9vUZY028182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 02:57:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 13 Apr 2017 02:57:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Apr 2017 02:57:26 -0700
Message-ID: <b295c9db31e5228f2ae906e6c0ae7c847a6bc7a9.1492077359.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1492077359.git.liezhi.yang@windriver.com>
References: <cover.1492077359.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] grep: do_configure: fix "Argument list too long"
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
X-List-Received-Date: Thu, 13 Apr 2017 09:57:29 -0000
Content-Type: text/plain

Fixed when len(TMPDIR) = 410:
aclocal: error: cannot open echo 'm4_define [snip]' configure.ac |: Argument list too long'

This is becuase it has a lot of m4 files, use relative path for them
can fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/grep/grep_3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/grep/grep_3.0.bb b/meta/recipes-extended/grep/grep_3.0.bb
index 6146ef0..b2940d5 100644
--- a/meta/recipes-extended/grep/grep_3.0.bb
+++ b/meta/recipes-extended/grep/grep_3.0.bb
@@ -16,6 +16,9 @@ inherit autotools gettext texinfo pkgconfig
 
 EXTRA_OECONF = "--disable-perl-regexp"
 
+# Fix "Argument list too long" error when len(TMPDIR) = 410
+acpaths = "-I ./m4"
+
 do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
 }
-- 
2.10.2


