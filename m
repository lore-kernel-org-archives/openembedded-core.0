Return-Path: <taborskikrzysztof@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5838D786BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 18:09:52 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x20so20236643lff.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 10:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=crdGaBFrCLbuUjZJbp90SP02mnIOaZJ9Rj3aUo69tT4=;
	b=rbSfL57j46qcnWg0BkMJJE1urbdgoGBbEB9cBdJB7QHXs/+7TsaJY0UFDrUKDDbEDb
	YfJFkHmCH+LzTiBnz3JJW4RAux267Yf+6vGDc6iQl3y3FJUHG9LUfOaYUSw086to02+I
	3tEoPqZsq7mofENpnkk5l1weOmnMx2F55wBNEDBwaXqkFZW5/U9ugThFtmTKHRbsuZJe
	hWoWSwl4bPW/9bAhtAc9twCEuNZjRGIYGbXoD3aMrF0+GBZX2bU2Aro1HKv0iTMkx8xK
	GNiyymJeEaJ3k7VasLarE6442lBfXHb3+uCvVcSZMhdPEWJyShnX+jj2b2GvpWstnHJ/
	CoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=crdGaBFrCLbuUjZJbp90SP02mnIOaZJ9Rj3aUo69tT4=;
	b=ZBFy5f+zmhi11TWc/BB5kGdy87otf8gUGxO2fsQJtKRVZhWGBhJ07xEpVen40k8P4Y
	EqayYdR4GazynZ1igg1X2FrXtKAgoaTtEBIarOepBcEn4yN9c7Y0eFOdQ/Ehwoywrd+P
	AFa26dmP3ke8Wl1DgmRTK1pSyxc6v8uoVe9Douss1Xu6UUNC4zFpJHiIAHrvtWbIAFlO
	WGlg/7S07a9wyD/cDniRiJgn5OLFs9URtgtf0OufcQ/OeFr2dNZ+eMtDRBUZxwYV2sn1
	Q8N/xpKYwaIPPJY8ovf5UKRU1pJsFriNBRGZTQfPDBEeL/bH2xdHGtwOPCj4pRXfgf/M
	iMGg==
X-Gm-Message-State: AJaThX4kt9roiFoECVeZBE8jellV0PclG4Zu5j6/im7/I4J2ov1tDBR6
	k9epo2G/c0IUj6YO79qCXFpE3Q==
X-Google-Smtp-Source: AGs4zMYoMTIZGgsLE/c1rZ3RhP73ru4HdrFh5UY8IEcGynUZyUSHztjfaRYh/maQWgtmcGgLIYIGXA==
X-Received: by 10.25.31.146 with SMTP id f140mr7420357lff.156.1512410993493;
	Mon, 04 Dec 2017 10:09:53 -0800 (PST)
Received: from localhost.localdomain (89-64-58-213.dynamic.chello.pl.
	[89.64.58.213]) by smtp.gmail.com with ESMTPSA id
	f82sm2536014lfg.15.2017.12.04.10.09.51
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Dec 2017 10:09:52 -0800 (PST)
From: Krzysztof Taborski <taborskikrzysztof@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Dec 2017 19:09:44 +0100
Message-Id: <20171204180944.31139-1-taborskikrzysztof@gmail.com>
X-Mailer: git-send-email 2.13.6
Cc: Krzysztof Taborski <taborskikrzysztof@gmail.com>
Subject: [PATCH] perl: native modules will not trigger build perl for target.
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
X-List-Received-Date: Mon, 04 Dec 2017 18:09:53 -0000

Currently building perl-native modules triggers
build perl for target due to PACKAGES_DYNAMIC regex.

This commits fix will cause, that perl native modules will
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


