Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 240A665D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 09:44:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s399ia6n022987
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Apr 2014 02:44:36 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 9 Apr 2014 02:44:36 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Apr 2014 17:44:32 +0800
Message-ID: <2e5aded6bd991ada5810d99cb6bfdc9bfe79c39b.1397036620.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1397036620.git.Chong.Lu@windriver.com>
References: <cover.1397036620.git.Chong.Lu@windriver.com>
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
X-List-Received-Date: Wed, 09 Apr 2014 09:44:36 -0000
Content-Type: text/plain

There would be an error when the TMPDIR is long/deep, for example when
len(TMPDIR) = 410 while our supported longest value is 410:

    aclocal: error: cannot open xxx
    autoreconf: aclocal failed with exit status: 1
    ERROR: autoreconf execution failed.

Let aclocal use the relative path for the m4 file rather than the
absolute would fix the problem.

[YOCTO #6138]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-extended/tar/tar.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index 30a1373..75c3518 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -10,6 +10,12 @@ inherit autotools gettext
 
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
1.8.1.2


