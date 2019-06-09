Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFFEA7E3B1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 07:56:58 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r18so6049157wrm.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5V+x5EsTtvpPwxIe5t5S3y6SidtB/qTydR9XbzQLbKs=;
	b=VgwToYlk9QCgnQsNrFYSqIV1DOipFIBVuJ1ZAozSrE/B17LmLPElee80TAg2ipbEiZ
	pL730k+gQrvgBTnHt7JgLpjOFZeEePzjHBB2jFPZJbamQXOkTLPCLCy2/jy+4TZQbRTE
	hE1CR4oWDKdG9Vu6C043e4dG447jwWWREf4E6HNvBP8Zq5ThMoUVA6oiIcP+rjR6yo4Q
	wZZy3w5cGf7iBps5gUg5uf32a5F8SUd2s3o+VQbA+07yoyAFdDT8blQES8pgig8ekHbx
	YW3Bhn5T2JfNZPHx/GbhkcjXiyE3v1/ZVa+Uqjdyhu2aji5ViUPMBfUKMB6ybHwIKg33
	aljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5V+x5EsTtvpPwxIe5t5S3y6SidtB/qTydR9XbzQLbKs=;
	b=Jq/iBKdzpOZgI5JyF1PCF3ekMi10To3V73KS5YBDYYvI5gnUAuTAPeipNF9qhO4BA0
	OQ2rpqc4BU/Uzy61eJ2QB0HjyJxejA+3QH9ZOOf80OgZdx1N3WxOclEq52YWsnN0U7l8
	n/mHMXINuEn1hNpHpl8TGZAU5Hlg+dD4H3xv9YOw33wVRAJC9SVEj5O3Q9u5pbaC+70h
	TFSijt4BM9loZH64yBfnafSWaeJrAM39cmAKJYJFfwVmH9mGP+nW6j0X50+kmXlNK0q4
	JQ3lY7U1C25hjZN1UTzzR3PI2aiybVSErbioXJM9Z3uMjgJdAErKY74IO/0afUqTemAE
	GILw==
X-Gm-Message-State: APjAAAWABoGE1mlqQq0TITLIK+Xt2UsSpJ5rm1umGrJ+z0mLLzYsbloC
	zIU5WpebXW4T+cFdzrIZKNoBJ98q
X-Google-Smtp-Source: APXvYqwZacaCIKLa/KUf82n1NreRQoxO8HsZYaHPybn//cvWsWrMKXy9iDnMj3iv7zTW3sFEb1ly1A==
X-Received: by 2002:adf:a708:: with SMTP id c8mr32217wrd.242.1560067019216;
	Sun, 09 Jun 2019 00:56:59 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id y12sm5249085wrr.3.2019.06.09.00.56.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 09 Jun 2019 00:56:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:56:58 +0000
Message-Id: <20190609075658.688-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] dbus-test: Improve ptest dependencies dependencies
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
X-List-Received-Date: Sun, 09 Jun 2019 07:56:58 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The dbus-test package is empty, move its dependencies to the ${PN}-ptest
package. Also ensure that it doesn't depend on the empty ${PN} package
which is about to start causing image failures in the following commit.
In this case the correct dependency is dbus itself.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/dbus/dbus-test_1.12.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.12.bb b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
index f4131926c2..486a996879 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.12.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.12.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 
 DEPENDS = "dbus glib-2.0"
 
-RDEPENDS_${PN} += "make"
 RDEPENDS_${PN}-dev = ""
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
@@ -78,6 +77,7 @@ do_install_ptest() {
         sed -i -e 's;@PTEST_PATH@;${PTEST_PATH};g'  ${D}${PTEST_PATH}/run-ptest
 }
 
-RDEPENDS_${PN}-ptest += "bash"
+RDEPENDS_${PN}-ptest += "bash make dbus"
+RDEPENDS_${PN}-ptest_remove = "${PN}"
 
 PRIVATE_LIBS_${PN}-ptest = "libdbus-1.so.3"
-- 
2.17.1


