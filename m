Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 58AFE78678
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 18:16:47 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f13so20190254lff.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 10:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H0N4hc5hLVnvqz87S/CIwS4/oDPd/TAizTaF8JQu22U=;
	b=nvSVAf0jj/a/qKgptZtDiPSnjs6zfI4BycW32j5LZV30r+566i9VuEiAzYClH6bDQM
	kV0x7wQzdw3KupQ8NKyr8RZZI7HEdb1WZ1/Jh4S0VwVe4CxKrgkYV3wiakCDcnL0+pVT
	8Oo/98jAS/6pZEWQgX16MDL19zc5EE69eAV2LhwXrYTfKkctOmQvqL8jfxpb/bTcanPI
	gukkOUvnLSNjVroWBXLklu39P3NR8jmbTsjpRDdGr3lGWpeDA6jqDw8QKiT31JDHcOkC
	cOxTJAoIpykyCD7NoPtk07vljNFimTP/0WHKxnB96buYEeUuge2TVk5n1tS966d9M0kz
	+w1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H0N4hc5hLVnvqz87S/CIwS4/oDPd/TAizTaF8JQu22U=;
	b=bgEJ7x3UlB+i8xjQ82Y+O4CRzefo/dPfAY1STTzqeqcK3o1WbR3zWIC0rTsJuJyYyo
	HEhPizYNeu5kuIMTGbzK0zJUCloYuIjaK8hL2Uh21oycEPwef9XE8rbJEdus2Nr81+qj
	ZFQXH6jtscD5PgryFUxKVhTWfGnpMInAe2Q9OIxLv7pLOrFZLCKDnanL2vOVu4j3Zxmd
	dP0IDSQCnUbvCPoDdWFsL8AWrk0mRePctJbUECJa35pHIyULrOqLYtmucRw4ZalGpKij
	N8BhZyVKcMvdf9iEO37Cy3EowarklrH4PlPhURTud9D+eMj/7k3TfT6w5lrdwxeFf+bx
	uxRQ==
X-Gm-Message-State: AJaThX79CDrRI9hE9wrV9p2TfC3ENS29iq/2PDDV7kT9rfekNiAGLGTg
	yBeLjMYpgTU36v1LCKMCQgz3GA==
X-Google-Smtp-Source: AGs4zMYF2kM3rmzzn/r4jt5fQ0C/wTaTRj1CStz3vd/C1hAivvkEa1LA8dvd+jo09s3z6VR4aUXmJw==
X-Received: by 10.46.43.139 with SMTP id r11mr9407050ljr.159.1512411408644;
	Mon, 04 Dec 2017 10:16:48 -0800 (PST)
Received: from localhost.localdomain (89-64-58-213.dynamic.chello.pl.
	[89.64.58.213])
	by smtp.gmail.com with ESMTPSA id 14sm2536964lfy.96.2017.12.04.10.16.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Dec 2017 10:16:47 -0800 (PST)
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Dec 2017 19:16:40 +0100
Message-Id: <20171204181640.31225-1-taborskikrzysztof@gmail.com>
X-Mailer: git-send-email 2.13.6
Cc: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Subject: [PATCH v2] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Mon, 04 Dec 2017 18:16:48 -0000

Currently building perl-native modules triggers
build perl for target due to PACKAGES_DYNAMIC regex.

This commit will cause, that perl native modules will
trigger perl-native build.

Signed-off-by: Krzysztof Taborski <taborskikrzysztof@gmail.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.1.bb | 2 ++
 meta/recipes-devtools/perl/perl_5.24.1.bb        | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
index 48113f05a9..a81dc4d703 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -134,3 +134,5 @@ EOF
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
+PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 6b27b22d22..3dc7805da9 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -323,7 +323,7 @@ python split_perl_packages () {
     d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
 }
 
-PACKAGES_DYNAMIC += "^perl-module-.*"
+PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
 PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
-- 
2.13.6


