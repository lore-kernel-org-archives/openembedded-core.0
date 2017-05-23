Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE9C577EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 23:47:57 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id d72so6097544ybh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 16:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PwcHeKA2oVFvpn77gHDfywkHYKPa+aei3jfdSiLtEr8=;
	b=WtiKdad+5bSYit7CFLOkeTagHUQQjAg/gU5s37JJHn6zhJD1zTf6Ab2zRBr8RBQUVH
	tV81SOLnKnnBPURYFkYYXSHlg3wmtakje8fP6otVxpuyJiQxhO/u/BnJh5wwUqRdOKKo
	rLAzpS4GVO4ci67YsVIWisPqNawAjRzVAuUojjbl+TyoJedbk7lgJkuB7RWNkJLGQV3w
	XRaqc8Xq4/xAtF4NOw5kKEK1ZLy+GIO+CToEebRk8njvDZl/8tU1pK3/NHpFDy6xOirz
	PejKvzjuldzEUfPLQTUIzgzrYd//ee1Ehf7S/sBrkVwGycAmU1WXtEuY9qWRYJQXR7Hf
	8spA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PwcHeKA2oVFvpn77gHDfywkHYKPa+aei3jfdSiLtEr8=;
	b=rCpHQorji7Orb5EQhize0h1trgDh43BE+Wx/iV9oBoBFCGyqDVHtiGaUHicEsi3SCq
	Wa7i4PVE3HPwFKonibY1A0qK8CVaXoGiXJoakICXlkSalUEMfCIwkfLDIs/Y4D2iirWK
	vNt8wD28J28FdEqvJzHR395hwzD+dtgArmP7GiQ9riVXLb9oOxZ69TQTkXUnPOoo/hms
	b4uxMhNlFp6pIGNbF+2UEeUT0FzEelRGn/dtteKdynr+Foq//KDiRs4x/wi3mD2xtHQq
	13auXZE0GlydviaGzxnD2HPjQ/rnAFjN1YtnLfmNmzLxjkzA/xZNQx+1rFF6JqArCJ2s
	7SLg==
X-Gm-Message-State: AODbwcBPoaglGAS8HvjddgJtCug65sM4fjEZt9mY0Wao/gMjpRHqkn9Q
	H0ge21sLpSJexQ==
X-Received: by 10.37.80.130 with SMTP id e124mr25549035ybb.165.1495583278567; 
	Tue, 23 May 2017 16:47:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id v19sm975325ywg.46.2017.05.23.16.47.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 May 2017 16:47:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 May 2017 16:47:42 -0700
Message-Id: <20170523234744.34487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH 1/3] intltool: Adds gettext as a DEPENDS
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
X-List-Received-Date: Tue, 23 May 2017 23:47:58 -0000

From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>

When setting USE_NLS="no" and building systemd-boot
(which DEPENDS on intltool), configure fails,
complaining about missing gettext:

configure: error: GNU gettext tools not found; required for intltool

This is caused because USE_NLS="no" makes the gettext class
add gettext-minimal-native to BASEDEPENDS instead of adding
gettext-native.

Since we still would like to set USE_NLS="no" and build systemd-boot,
we add gettext-native as a dependency to intltool-native, which makes it
available for the configure script of systemd-boot fixing the problem.

[YOCTO #11562]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/intltool/intltool_0.51.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index 551bdf0619..ecff2faf25 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -16,7 +16,7 @@ UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
 
 DEPENDS = "libxml-parser-perl-native"
 RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
-DEPENDS_class-native = "libxml-parser-perl-native"
+DEPENDS_class-native = "libxml-parser-perl-native gettext-native"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.13.0


