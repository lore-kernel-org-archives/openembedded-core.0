Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FB436FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 09:06:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0M96Pcr021291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 22 Jan 2018 01:06:25 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 22 Jan 2018 01:06:12 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 22 Jan 2018 16:46:10 +0800
Message-ID: <1516610771-13845-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [V2][PATCH] grep: support Perl regular expression
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
X-List-Received-Date: Mon, 22 Jan 2018 09:06:25 -0000
Content-Type: text/plain

Supporting Perl regular expression is disabled with '--disable-perl-regexp'
but the manpage of 'grep' shows the '-P' option and returns below error:
"/bin/grep.grep -o -P 'PATTERN' file
 /bin/grep.grep: support for the -P option is not compiled into this \
               --disable-perl-regexp binary"

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-extended/grep/grep_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/grep/grep_3.1.bb b/meta/recipes-extended/grep/grep_3.1.bb
index 05b6b93..71810dc 100644
--- a/meta/recipes-extended/grep/grep_3.1.bb
+++ b/meta/recipes-extended/grep/grep_3.1.bb
@@ -14,8 +14,6 @@ SRC_URI[sha256sum] = "db625c7ab3bb3ee757b3926a5cfa8d9e1c3991ad24707a83dde8a5ef2b
 
 inherit autotools gettext texinfo pkgconfig
 
-EXTRA_OECONF = "--disable-perl-regexp"
-
 # Fix "Argument list too long" error when len(TMPDIR) = 410
 acpaths = "-I ./m4"
 
@@ -36,6 +34,9 @@ do_install () {
 
 inherit update-alternatives
 
+PACKAGECONFIG ??= "pcre"
+PACKAGECONFIG[pcre] = "--enable-perl-regexp,--disable-perl-regexp,libpcre"
+
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN} = "grep egrep fgrep"
-- 
1.9.1


