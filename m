Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EFE6A716A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 07:07:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9277guf013211
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 00:07:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 2 Oct 2014 00:07:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Oct 2014 00:07:41 -0700
Message-ID: <1c8f43767c7d78872d38652ea808f30ea825bbef.1412233591.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1412233591.git.liezhi.yang@windriver.com>
References: <cover.1412233591.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] bash: Fix CVE-2014-7169
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
X-List-Received-Date: Thu, 02 Oct 2014 07:07:44 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

This is a followup patch to incomplete CVE-2014-6271 fix
code execution via specially-crafted environment

Change-Id: Ibb0a587ee6e09b8174e92d005356e822ad40d4ed
(From OE-Core master rev: 76a2d6b83472995edbe967aed80f0fcbb784b3fc)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../bash/bash-3.2.48/cve-2014-7169.patch           |   16 ++++++++++++++++
 meta/recipes-extended/bash/bash_3.2.48.bb          |    1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch

diff --git a/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
new file mode 100644
index 0000000..2e734de
--- /dev/null
+++ b/meta/recipes-extended/bash/bash-3.2.48/cve-2014-7169.patch
@@ -0,0 +1,16 @@
+Taken from http://www.openwall.com/lists/oss-security/2016/09/25/10
+
+Upstream-Status: Backport
+Index: bash-3.2.48/parse.y
+===================================================================
+--- bash-3.2.48.orig/parse.y	2008-04-29 18:24:55.000000000 -0700
++++ bash-3.2.48/parse.y	2014-09-26 13:07:31.956080056 -0700
+@@ -2503,6 +2503,8 @@
+   FREE (word_desc_to_read);
+   word_desc_to_read = (WORD_DESC *)NULL;
+ 
++  eol_ungetc_lookahead = 0;
++
+   last_read_token = '\n';
+   token_to_read = '\n';
+ }
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 5849ed0..e6a04cd 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
            file://build-tests.patch \
            file://test-output.patch \
            file://cve-2014-6271.patch;striplevel=0 \
+           file://cve-2014-7169.patch \
            file://run-ptest \
           "
 
-- 
1.7.9.5


