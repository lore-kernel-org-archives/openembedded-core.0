Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 992CC73A0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 06:14:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2C6Eu08008505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 23:14:56 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 23:14:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 23:14:55 -0700
Message-ID: <418f6d2d447b8719d99dd9819cf13e213dc5c62a.1426140850.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426140850.git.liezhi.yang@windriver.com>
References: <cover.1426140850.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tar: set acpaths to avoid "Argument list too long" error
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
X-List-Received-Date: Thu, 12 Mar 2015 06:14:58 -0000
Content-Type: text/plain

From: Chong Lu <Chong.Lu@windriver.com>

There would be an error when the TMPDIR is long/deep, for example when
len(TMPDIR) = 410 while our supported longest value is 410:

    aclocal: error: cannot open xxx
    autoreconf: aclocal failed with exit status: 1
    ERROR: autoreconf execution failed.

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

[YOCTO #6138]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/tar/tar.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index fb5db78..de2ed31 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -10,6 +10,12 @@ inherit autotools gettext texinfo
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
 
+# Let aclocal use the relative path for the m4 file rather than the
+# absolute since tar has a lot of m4 files, otherwise there might
+# be an "Argument list too long" error when it is built in a long/deep
+# directory.
+acpaths = "-I ./m4"
+
 EXTRAINSTALL = "do_install_extra"
 EXTRAINSTALL_class-nativesdk = ""
 
-- 
1.7.9.5


