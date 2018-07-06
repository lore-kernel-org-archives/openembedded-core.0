Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 71E9C7894E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 03:49:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id l123-v6so7195771pfl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 20:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=wl238FBdvmOYbQmx2LgcvYTy01querdH8t7iZVGvV6Y=;
	b=sUbRRHfn4nYqUiJPbfy4hLNMdSuLcnmpa6AhvXwauzOAtedgwHrFscsq9LIt/WtFGn
	68v6yAhEJq7zBXJyw6t0tlo6KOxLTy+wrseCC3MmgaLDLXmod/JiBA0isfb3gHvU1g5V
	6Q3Up3x6SeSZvw7dN+hSXVRUA4A3FkXFILzQzbIpLUaPUEWIqtdp5nQmHauS9SqJdx2O
	DnuqnZAuQwHLrp71uUGqxQqdSKPtb1GprZWKsVlPFjpIlkujoCsN+5hiVnadufJK6tdZ
	7RrJkRoxbFg2/ooC8IjYIT1aYSpNrytvDgwiZx/OoFlNhmDJcYM5zo/ruVXvp7TcJJTO
	yZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wl238FBdvmOYbQmx2LgcvYTy01querdH8t7iZVGvV6Y=;
	b=ZwjyuQAbWk7D2NnlyBGC3mLJg6WffJsboNSALeDyU6eLwErQh4nOVWH8QkgwqmDuTl
	RAztDzabF7+9WuFjluppm+AUUUkSaFmBqpRNVxCen+ExYUnuqR3rg2Zf4jHR+kuyZX3+
	YbBQfwTjOR+fa+QuUNiI2RS8dYIq3cRJaVcbDEq+5Cb0nliAZNKPLgF+UnTzpxuS2xTg
	Z+ZN0yUHtZEOzUQFKywKy+qook+gxTGbhK4qLHymv3JoKMtfW9CEr1Ymv1+GIsB9ivxL
	a6ruSyJeuDa7CiMsX0HGb8M9MCicVHW+DwM6SWg8Vn2TFrGWyoJ+W7SGDWkCSprzaG8N
	iSfQ==
X-Gm-Message-State: APt69E3Dwri0SCUp2yVlQG7RYoTNRu1DqLm/oCFuAa8oi5KTx5fdgpIh
	ffCcr4s3R2O/BT1o/MgPOijPmA==
X-Google-Smtp-Source: AAOMgpfTr6hPHWjb/zJg+bDD2cFLZto+o4gQRTodnxlNND6mb7rb9gVZgqx5WkdVzOJ3iFxfPNcBQQ==
X-Received: by 2002:a62:4808:: with SMTP id v8-v6mr9001387pfa.89.1530848953395;
	Thu, 05 Jul 2018 20:49:13 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	j23-v6sm11981886pfi.137.2018.07.05.20.49.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jul 2018 20:49:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 20:49:05 -0700
Message-Id: <1530848946-3288-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] quilt.inc: avoid using += with an over-ride (drop unmaintained darwin support)
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
X-List-Received-Date: Fri, 06 Jul 2018 03:49:12 -0000

Using += with an over-ride can be a source of confusion so try to
avoid the construct in core recipes.

In this case, the _darwin over-ride seems to be unmaintained. It was
added in early 2013 but has not been accounted for in subsequent
updates to the recipe and (from inspection) now appears to be broken.
Remove the _darwin over-ride rather than try to debug or fix it.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index c7bb741..ff94cc9 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -16,10 +16,6 @@ SRC_URI[sha256sum] = "f6cbc788e5cbbb381a3c6eab5b9efce67c776a8662a7795c7432fd27aa
 
 inherit autotools-brokensep ptest
 
-EXTRA_OECONF_darwin += "--without-date \
-                        --without-getopt \
-                        "
-
 CLEANBROKEN = "1"
 
 PACKAGES += "guards guards-doc"
@@ -31,9 +27,6 @@ FILES_guards-doc = "${mandir}/man1/guards.1"
 
 RDEPENDS_${PN} = "bash"
 
-EXTRA_OE_MAKE_ARGS_darwin ?= ""
-EXTRA_OE_MAKE_ARGS ?= "BUILD_ROOT=${D}"
-
 EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
@@ -51,7 +44,7 @@ do_configure_append () {
 
 # quilt ignores DESTDIR
 do_install () {
-	oe_runmake ${EXTRA_OE_MAKE_ARGS} install
+	oe_runmake 'BUILD_ROOT=${D}' install
 	# cleanup unpackaged files
 	rm -rf ${D}/${datadir}/emacs
 }
-- 
1.9.1


