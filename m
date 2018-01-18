Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37CF377E93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 04:01:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0I41lQs017027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 20:01:47 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 17 Jan 2018 20:01:46 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jan 2018 11:41:55 +0800
Message-ID: <1516246916-2966-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] grep: support Perl regular expression
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
X-List-Received-Date: Thu, 18 Jan 2018 04:01:47 -0000
Content-Type: text/plain

Supporting Perl regular expression is disabled with '--disable-perl-regexp'
but the manpage of 'grep' shows the '-P' option and returns below error:
/bin/grep.grep -o -P 'PATTERN' file
/bin/grep.grep: support for the -P option is not compiled into this \
               --disable-perl-regexp binary

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-extended/grep/grep_3.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/grep/grep_3.1.bb b/meta/recipes-extended/grep/grep_3.1.bb
index 05b6b93..391427f 100644
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
+PACKAGECONFIG[pcre] = ",--disable-perl-regexp,libpcre"
+
 ALTERNATIVE_PRIORITY = "100"
 
 ALTERNATIVE_${PN} = "grep egrep fgrep"
-- 
1.9.1


