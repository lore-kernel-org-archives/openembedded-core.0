Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8132F7E26A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 18:50:00 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id h20so11647657itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OeHh445QztWIV6HamUWXJBgklCGOAYEOQnr70lahkkE=;
	b=pWTQ5tdI3xozbLxWHaJxI60Wdzd2vGUhdQlu4vooKzXVJznScIC9N0QYfO3U0oP7VS
	cBsMfrhj2blxTPixAQc0Az+RQrTD3pN3VA+sfSCVhX2qpWA+rm+VrHrauc/K203z3QwR
	6/pNmT2w2l60ZOPMf6LpoakGsURtI9EsjsnqkxJvDgGui5RLBAddaJwvCeb8CJ48/n85
	v3nH59kTK23AOJdKsKM4xa5P2rh1CBElONJL616TuBOy5YtwcWtCfvmqQfBEEFUCCpic
	qGQRv5vNYrEFJ/ES8z9gX1+1eZXJd5qUvgHOZmfdZtm5dBAtMSEVz/9lX2jxldQIcaSf
	HlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OeHh445QztWIV6HamUWXJBgklCGOAYEOQnr70lahkkE=;
	b=iz8j3f5NCklXcpGryZ5Tz2+DxMIPGrA1SGR/EIgGm+LA2Tz+ClgEB2ODht4yko+oQ3
	fs493UxiletsPvF3q66UzzaznndElvj3Ro/ocGhRLcsRcH5w3HmBpnzt8pK8V1G+5Tut
	FwK/sT3wP9lvYcW8ey2S8EblbdkEMn4jHdzuIfse1BHex/6LXKJhNs4gN/TyGUuD2wL8
	ccIsydeC4Vq2mFYEJyn7c9PsqnDkOA4vJIrIOP09Hj9wPFy15uzyKzTCpQH4sPHb5JX7
	9y2+BtxgNEC7iIc887DboYp3OZJ6gEPrH19wxkEhklfyBJ4Py2oJuTY1WB8NcspJ1jgN
	mATA==
X-Gm-Message-State: APjAAAWzgT4L1f8rpk3SOPA9D8gEFNgmb0BdPFNurVPy1UM12Sna6sjM
	hLKEf7zTecy0XjrlG1veRsowTIFm
X-Google-Smtp-Source: APXvYqx/oGDYcl4Ufpo/kii7Ux0jfAucNM6GfULJ7RAeGtCuX++VxqNrbbZUi29lrE4UdfmBKchdCw==
X-Received: by 2002:a24:8988:: with SMTP id s130mr3925241itd.79.1559242201471; 
	Thu, 30 May 2019 11:50:01 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	w26sm1151854iom.59.2019.05.30.11.50.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 30 May 2019 11:50:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2019 13:49:54 -0500
Message-Id: <20190530184954.2188-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] perl: Set build date to SOURCE_DATE_EPOCH
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
X-List-Received-Date: Thu, 30 May 2019 18:50:01 -0000
Content-Transfer-Encoding: 8bit

Perl uses an internal #define called PERL_BUILD_DATE as the string for
the date when perl was built. If undefined, it defaults to using
__DATE__ and __TIME__, which is not reproducible. If SOURCE_DATE_EPOCH
is set at do_configure time, use it to generate a reproducible string
for PERL_BUILD_DATE.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.2.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
index f175e87a12e..b74acfbbc4d 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.2.bb
@@ -34,7 +34,7 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit upstream-version-is-even
 
-DEPENDS += "db gdbm zlib virtual/crypt"
+DEPENDS += "db gdbm zlib virtual/crypt coreutils-native"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
@@ -90,6 +90,12 @@ do_configure_class-native() {
     -Ui_xlocale
 }
 
+do_configure_append() {
+    if [ -n "$SOURCE_DATE_EPOCH" ]; then
+        echo "#define PERL_BUILD_DATE \"$(date --utc --date="@$SOURCE_DATE_EPOCH")\"" >> config.h
+    fi
+}
+
 do_compile() {
     oe_runmake
 }
-- 
2.21.0


