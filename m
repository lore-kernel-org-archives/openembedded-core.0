Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 84E497872C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 17:58:33 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id a12so20196467lfe.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6hkr7VRR8bH3PaVSYeuUsobMp2hQonbuirnhCQnk4fM=;
	b=n2GpmXqn6JhZMBYHXb0JfwFNbsIXHaWNjemlGsBq927eepe2BR9VSEyB8QDZOrKNxM
	IV+Rt/1DRevg2tcEJC0BPu4tvJVlJ8wgGkgzIehvDn8bWKN1JcQPxIP+no4a20ANltLA
	NmWZ8LggDLB7lpGhQ750Dgfk1alYw5iPOus+CldH1kMoJVRUQMdURS7dirMPaXTMzZ3l
	5y5u6gVm7+GVVhSOy8fFtVH/G54mSPb0xpIuvDS2vhvovsSnDzF1IxHtiIcpnb4RzbBX
	MURr9FlaLdYwackumslRDUYLVZnJIAGeXMWntW7RT4pZHs45vOWJm5MMsni9cVZUmnQH
	4NwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6hkr7VRR8bH3PaVSYeuUsobMp2hQonbuirnhCQnk4fM=;
	b=Nu7cA//pZ5RDKplPLp/cdopMW4hgZBttiVY6Wet0ek01ttjdxDnI3qPCr6fAezalJ9
	4G0IX+rSUfH0oHv9soI7V1Nhy7p2HkBmj418gnfJZbA5uW/0OomK222/umxX9+qw6daN
	/+VogB2R658SlLaQSxs/+J6KFNCoqFevDjYJ7gfp6aUUS+zgyIe4s1oB6bAXWwsQCP60
	ynip5FX53gNk5kZ6Ty+UVZulv59lz4Rr3GOiYpGzcZF9lpyNL7ARglwpoqquZK3ykE1g
	enTvcH7A0K13jzeIT4R6fE0U+aicDvBOa5O45M3SCz119zItHwabudQdpGlBQHJ73QHy
	Gv4Q==
X-Gm-Message-State: AJaThX6rnBzHFb3YQOQVSEhkjHOj8jB+LD80mH8wiu4GyQHhOjT9VVdI
	W0OiFXm0PkRsJl6Fkhpt4hRKfA==
X-Google-Smtp-Source: AGs4zMZxl1QjlNsPhbcmujRHvOY5b8NFLBzYg2ai+Rmw2ytXPWIhvuHhsHSUnZGrOSzVvs94fHzGXw==
X-Received: by 10.46.93.13 with SMTP id r13mr9478188ljb.102.1512410313869;
	Mon, 04 Dec 2017 09:58:33 -0800 (PST)
Received: from localhost.localdomain (89-64-58-213.dynamic.chello.pl.
	[89.64.58.213]) by smtp.gmail.com with ESMTPSA id
	p62sm2943610lje.67.2017.12.04.09.58.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Dec 2017 09:58:32 -0800 (PST)
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Dec 2017 18:58:13 +0100
Message-Id: <20171204175813.31033-1-taborskikrzysztof@gmail.com>
X-Mailer: git-send-email 2.13.6
Cc: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Subject: [PATCH] Perl native modules will not trigger build perl for target.
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
X-List-Received-Date: Mon, 04 Dec 2017 17:58:34 -0000

Currently building perl-native modules triggers
build perl for target due to PACKAGES_DYNAMIC regex.

This commits fix will cause, that perl native modules will
trigger perl-native build.
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


