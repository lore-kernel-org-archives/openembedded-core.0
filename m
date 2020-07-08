Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4722.1594242491641029000
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=m58MFqyr;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjP62Flz5b
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242490;
	bh=OkhR0MG2+Ml2x+6goq/X8ENFL6hIiZHFxWF7XriU7AI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m58MFqyrUjJkY+3G2cy7iBYubvcJoOUVnWpRPJzjZMBusIaoOmAgXxx/JyvtyOxiV
	 wB9J996V64JjEwB/9rPjR2nSXq9upnKCUq8cfZCOy30OEa9XJCupVGA6ikMRKtjp1Y
	 QbLGVqs45xnZRkFcL7xs0G1AGQRlWvjNrDRDrgvN2VbZCfIXCSgHr3IJkiJYPEJH5m
	 /30NEyOdUc43M0y5Rmxkyd8hpX8Hrge63UZOvXuWbJdZMrKag9TRGIxqy8+ldgoX4n
	 6+U74FMkKaCMMhy47vQmeQwg5/p1H+bufe3WOhtTlc2MuMM7dA6TaudF1zfsEh0mgU
	 JCuK+wUEWurM7c/Z3izSZAvnkHWL/SvpEuYJRmMrIYEYf6FiCeHhW2TgSpXnCuhPuD
	 Cug7UFJmsNtAs2NTBmNCW+A/639FQzA0Ri5A/quSH3kJ5++NnJ9J6Dos5+txDsTT68
	 tnReEC7h7bwosKXaRLPtkFIdi/Wb++r0vuKnsMQIt9yjXZUycUP6qIPyhKrb+YtsUH
	 dLM5EffDXNzjkm4rcEcLITMh+M4ariF8YXwOih2fVG5AnwgDCyRz8Gn3jGtUuoaFU/
	 /eGOb7urJYC8+/imP3yumZb5OAWjUqg/SFM8lSn0ZKT23IJJkMvbm+kOLmekoycijB
	 +rTcwzo9XcJ2wL0eGFQD5dDw=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 16/19] perl: Fix host specific modules problems
Date: Thu,  9 Jul 2020 00:07:58 +0300
Message-Id: <20200708210801.5553-16-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

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
2.17.1

