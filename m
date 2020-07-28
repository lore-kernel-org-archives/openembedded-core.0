Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: V7rFZ/h9KtCcxM7Wgy4uncEi4vjnppqgcbE0xm0n9O+gHUc1Q9EG1b1ME+omhqMmoS6jlA0TQ1
 fmZBelalDmsg==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699721"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699721"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:03 -0700
IronPort-SDR: PEn9yRD5OjmFb5qerWTOvMTXnLfgDriwYGn6QUm15LJ7T00/1kw1Nq0fzPw4P5AmLn86Ep4Wky
 0raeKs6+xEEA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245824"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 15/32] perl: Fix host specific modules problems
Date: Tue, 28 Jul 2020 16:51:16 +0800
Message-Id: <6103cc314520280e55366d00657723e90f609d70.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We were seeing a ton of empty perl modules being created such as
"perl-module-x86-64-linux-encoding" where the name would include
${TARGET_ARCH}-linux. These files were already being filtered in an
earlier do_split_packages() expression so exclude them from the latter
one to remove the pointless empty modules in PACKAGES.

This doesn't explain why some were not deterministic but will recude
the do_package execution time and clean up the build directories
at the very least.

(From OE-Core rev: 5aaf9d3a748cbad17a4a3e5d9715ac2f289b007d)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f1a959d9831f43dda656e3b0c4d059db3363877)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 32746c7095..149885f692 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -271,7 +271,7 @@ python split_perl_packages () {
     do_split_packages(d, libdir, r'Module/([^\/]*)\.pm', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'Module/([^\/]*)/.*', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
     # perl-modules should recommend every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
-- 
2.25.4

