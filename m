Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6E0791AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 01:24:31 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l9-v6so162379pff.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 18:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YNOtt9FsWP1spKtcl9iGMN7Vp6RmLbcHouSDggiqrTQ=;
	b=IugxhrcRPTdIZpqHnf/7M+kmFyyJD4edgeOQC8+GjQy29pNIMgG1jI9h9Gjxtd42qC
	y1Z/xo+aN/VgXG3NGHl+HlDAzU9NwoKeqy9idXJoFpBDKybwcAU0PrXQC3zjFoh4b93X
	eyTP3g6wQBenwinb9B2RtkYPs/zL7CHqj7BkZOpX6NzkCwNbshajNlQ5SFmx+AZrn1es
	e2o0MEd1GVlbTFLb9/N9mbYY664iaH9/63GfE9Y9rSFD5HyA7JXyaRoh9si9UvGBPeCt
	L4Xw/V/K/KXAESiDuFar+n1A8c8LB4CWjBnFGE0/lQaOWdEV/wanfDJeu868ZG5dWzTd
	HtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YNOtt9FsWP1spKtcl9iGMN7Vp6RmLbcHouSDggiqrTQ=;
	b=eItOuAZtGEb6NLOosHWvBy46gH0u0pjK0ACncJNSE/9XSyeV6nJQZL8mnCbAQSy6Kv
	9k7y06lyCFP5SxLsiB3tJk9bkl1TZpITK/b43dgPHeouLicW3H6oIZUXIcgD2szq4Vbp
	YbReZOuCBGQI0zF75l01hEsIkzX6pJ5w/k7FrkycrTof2PYkzHxMVXWZSpCya+hsnYV3
	1Gfi1Dqo1waAIsfmLpvbMpeu0Vgvm5LoQT2yW9G2Li32lV8c2Pmam0GzLrx7bsjGZPts
	yX5Mp4S0fkmnBtzQNknf18xS/7XrQocBSv4L+dQt1g9pt6qWXsd9W15/fwjBaa1DM8FZ
	BhUw==
X-Gm-Message-State: AOUpUlGfGKiFoqK8e8/p+Mkpy2YAbp5m52xdM91RawBPNy4ZS4YoZSQK
	8Ap1gfM8tAkuvKYNfTdJqfGPhVvI
X-Google-Smtp-Source: AA+uWPztyY9SZPMpubwXzEqYR0LtvZztE/O2tTZbVk21bYEbgcrdtkkKTwzK35THKUKfBhMh4VL1+A==
X-Received: by 2002:a63:ed07:: with SMTP id
	d7-v6mr50161037pgi.429.1534901072571; 
	Tue, 21 Aug 2018 18:24:32 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	n7-v6sm176229pfh.2.2018.08.21.18.24.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 18:24:32 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 18:24:27 -0700
Message-Id: <1534901067-15889-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] perl: avoid using += with an over-ride
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
X-List-Received-Date: Wed, 22 Aug 2018 01:24:31 -0000

Using += with an over-ride can be a source of confusion so try to
avoid the construct in core recipes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.4.bb | 2 +-
 meta/recipes-devtools/perl/perl_5.24.4.bb        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.4.bb b/meta/recipes-devtools/perl/perl-native_5.24.4.bb
index 90a1615..affc9d5 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.4.bb
@@ -135,5 +135,5 @@ EOF
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
-PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
 
+PACKAGES_DYNAMIC_class-native = "^perl-module-.*native$"
diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-devtools/perl/perl_5.24.4.bb
index 4709d3e..87a85a3 100644
--- a/meta/recipes-devtools/perl/perl_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.4.bb
@@ -339,7 +339,7 @@ python split_perl_packages () {
 }
 
 PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
-PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
+PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
 
-- 
1.9.1


