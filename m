Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 288BB74B70
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 16:47:18 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id o123-v6so46832812lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2018 09:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2CCskI/zZdkC0H6yZrm0M708hmkfer3aTy/HUbBrh5o=;
	b=Z8lGCO44x2wQNwJAYC8Tx8OqAEmpYovDNeRYSxh0nhXhzNHowclolUbl5RZ/itDoEL
	8qnqcbbzq+0ejGslvw4HEhVKDkDbJThhVImOEeZkz+6eUrJeXjzTT5oA7qlco0YFE6DD
	aMpHz546YRjv7u3ZNPsxqksQJzOe6N7uSYriF5J+VQsWmGeFIGy+GJ1+up2TfKkxbNKY
	/sWzT3O/EsVFoF/AKaQnB5+/f3lVRP2dytpdPCGR07LJB1q4lHKUZww15Q0RFO7LkzQj
	poIpfkYKv7aFzdKxg9s+pJ+YMnjARlgdVHXsSGzmqZFHt3EADdeTa5+oyAigJdJuH3gZ
	hjEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2CCskI/zZdkC0H6yZrm0M708hmkfer3aTy/HUbBrh5o=;
	b=CBs9n5nTT/vm3joX1sw53spPb8KIsO6RzlJOD6ji8aUdZYGuc3P39A8OXdpU+Ocgj+
	S3Bqfw3tTFt3edYcslKQ0x9cb18n9UqKfwey/yh/AQdcmYMmuo/IvrDIKJLk3L2Rna9y
	AViJQSZdOZhLfF+GDVcXzrLNglT3BP8B7H0uMSMfUqDF2A92iUM+n48ZoOYN+bV9TMKu
	O0IQfkrkVv0sDWLsNum/rS0HfePPYipfxfsEZ/slO6Zfog8+Hr7qz4ynwL+kDv3xPtXg
	QMVnZ4wpy8hPvBIHdXXOsn0YxpovuAb78KTLcBSC5m/sz7ltH3D+YMM2f5Wjg3MQAcRK
	o6vw==
X-Gm-Message-State: ALQs6tBIQq9HSAFchWnvgX1Gp743DJcUmJB/GKh22as3an+fP0CUZz3d
	vEObdNaJBbMBBuPYblwZEjF2qw==
X-Google-Smtp-Source: AB8JxZoIyh25syWMj+jtLqzN6KNz0id+cIFNWRA5mG7lrGz0h6926yKpTWjPPG7imYtQXP3aiECJOg==
X-Received: by 2002:a19:8f49:: with SMTP id
	r70-v6mr10774337lfd.79.1525798039159; 
	Tue, 08 May 2018 09:47:19 -0700 (PDT)
Received: from localhost.localdomain (89-64-61-80.dynamic.chello.pl.
	[89.64.61.80]) by smtp.gmail.com with ESMTPSA id
	y137-v6sm2266605lfd.96.2018.05.08.09.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 May 2018 09:47:18 -0700 (PDT)
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2018 18:46:58 +0200
Message-Id: <20180508164658.2935-1-taborskikrzysztof@gmail.com>
X-Mailer: git-send-email 2.13.6
Cc: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Subject: [meta-oe][PATCH] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Tue, 08 May 2018 16:47:19 -0000

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
index a9ab17d16c..71f45890b0 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -135,3 +135,5 @@ EOF
 
 # Fix the path in sstate
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
+PACKAGES_DYNAMIC_class-native += "^perl-module-.*native$"
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index 53a426289a..4c6a71082f 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -339,7 +339,7 @@ python split_perl_packages () {
     d.setVar(d.expand("RRECOMMENDS_${PN}-modules"), ' '.join(packages))
 }
 
-PACKAGES_DYNAMIC += "^perl-module-.*"
+PACKAGES_DYNAMIC += "^perl-module-.*(?<!\-native)$"
 PACKAGES_DYNAMIC_class-nativesdk += "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
-- 
2.13.6


