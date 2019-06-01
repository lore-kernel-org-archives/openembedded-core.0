Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 853907E639
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id o12so956979wrj.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qJ40QvSjSbnlvIFWBL64Mv4IKoEWwWMPRy4j0eNFASo=;
	b=JesshYjtPBwM/6HY9Yl0YD1r9roIg/AQJxS11sgDrvrwarMRiEjUm+J9n37gEZ2jKr
	mZq5sjiFNW6CwE53WtfWqU9UQOMkouF4rXsVv54F2n0cVfrscSI3mVzlzdrll6zMEmyI
	5NAIlSA6aPT8q4ALyeEeYfGt3IxPuV+RDlKkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qJ40QvSjSbnlvIFWBL64Mv4IKoEWwWMPRy4j0eNFASo=;
	b=f4jYuk3k83FuqBGE+U5v5UsywbECjjhxH4c5lXRM1IOSB4+mvokSVYmAgAcVjSsgKt
	lCatUYO02NC85SMSR07fxm5NGEtbVXy3JQT7Vy248mi9rX2WlzQGMaU6zTW2/xUZlV41
	PLMSUhntRWtqjX/QI3LKJ9FOPvM7urM10NCvmAGUZsLPrHoJpuARHuU58icCDqH5j/BY
	BFiWoX1e0CcBD4pleRuo8bfrpwgvPjpz2uh40ruFW7tzjscpExaJZZ6AxU+/d/XzrCFK
	OGG2SDDSckBssOKk1yUgJJm15kehoNW67ARxBSBNsbJXVl1Yz49YIFQihkwgDBGV7HnF
	Qeww==
X-Gm-Message-State: APjAAAXgTa7lHilfO/l2G7fqZRBfDtzQI+kNGERM5MFjP6YpKfL/SSJ6
	tggLQz9UShaD7PXT0jTkyYSbgrojaWk=
X-Google-Smtp-Source: APXvYqwolaxR9jZs1usrEXaCU8I3yjARNDGdpTKf0uN+u+1MQS4iERMXn+E9mgPLyrsrdcmrHyDRVA==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr3080823wru.172.1559384735275; 
	Sat, 01 Jun 2019 03:25:35 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:27 +0100
Message-Id: <20190601102530.5995-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/8] liburi-perl: Fix module ptest dependencies
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:34 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when running the ptest in a minimal image.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/liburi-perl_1.74.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.74.bb b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
index fea4d2490e4..c27765bcbcb 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.74.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
@@ -33,6 +33,18 @@ do_install_prepend() {
 	rm -rf ${B}/t/file.t
 }
 
-RDEPENDS_${PN}-ptest += "libtest-needs-perl perl-module-test-more"
+RDEPENDS_${PN} += "perl-module-integer perl-module-mime-base64"
+RDEPENDS_${PN}-ptest += " \
+    libtest-needs-perl \
+    perl-module-test-more \
+    perl-module-test \
+    perl-module-utf8 \
+    perl-module-extutils-makemaker \
+    perl-module-net-domain \
+    perl-module-encode \
+    perl-module-extutils-mm-unix \
+    perl-module-file-spec-functions \
+    perl-module-perlio \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.20.1


