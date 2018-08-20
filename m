Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id D12C47908E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:Message-Id:Date:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+8RiFjp1iKOqx/YdrrPqc4pTR0OtVXoxgcicMur++Zw=;
	b=llRJ7/CdFEOnm1Rp0BTFLINSU9
	wafF9Vcija8A8oebRCW9IzRa667yd1nUebEx6dqLAshYtpDZ3ZeWpcAw0RVED2MnAyh486d6M5rjU
	HrmMmiTqs8e7hc3P621PWK2Cw2qD8qIxyoylstnwFVvRytiJ79qAv5C6SEhsCj2cauAJizCSXNb5l
	1hurwPy0dEYhiCExT0L4g7QDYaFguLYj9KfP93zyfwpLTp9tfOj50m6Bmp9QEkoAoIkNU8bf/DkAE
	Fwi/J0lelK3DUlMS0zC7JrEW7WAubKqdjALl2a3nlNrB5BdXYbQMGL2uEAAi8KYo+//F9uTvdYOc6
	D8TjqFEA==;
Received: from [91.232.154.11] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1frm00-0006DK-Ob; Mon, 20 Aug 2018 18:21:45 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1frlzg-0005DS-LB; Mon, 20 Aug 2018 18:21:24 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 18:21:19 +0300
Message-Id: <1534778479-19256-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on mail
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_NEUTRAL autolearn=no
	autolearn_force=no version=3.4.1
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH] autoconf: update runtime perl module dependencies
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
X-List-Received-Date: Mon, 20 Aug 2018 15:21:46 -0000

Test in SDK was failing to execute:

$ autoreconf --install --force

due to missing perl modules. Add the needed perl modules
for target build:

perl-module-bytes
perl-module-thread-queue
perl-module-threads

Duplicate the perl module dependencies for SDK as well.

Now autoreconf runs with a trivial example.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/recipes-devtools/autoconf/autoconf.inc | 31 ++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index df81bc6..b82af5a 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -10,24 +10,49 @@ DEPENDS_class-native = "m4-native gnu-config-native"
 DEPENDS_class-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
 RDEPENDS_${PN} = "m4 gnu-config \
 		  perl \
+		  perl-module-bytes \
 		  perl-module-carp \
 		  perl-module-constant \
+		  perl-module-data-dumper \
 		  perl-module-errno \
 		  perl-module-exporter \
 		  perl-module-file-basename \
 		  perl-module-file-compare \
 		  perl-module-file-copy \
+		  perl-module-file-find \
 		  perl-module-file-glob \
 		  perl-module-file-path \
 		  perl-module-file-stat \
-		  perl-module-file-find \
 		  perl-module-getopt-long \
 		  perl-module-io-file \
 		  perl-module-posix \
-		  perl-module-data-dumper \
+		  perl-module-thread-queue \
+		  perl-module-threads \
 		 "
 RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_class-nativesdk = "nativesdk-m4 nativesdk-gnu-config"
+RDEPENDS_${PN}_class-nativesdk = "\
+		  nativesdk-gnu-config \
+		  nativesdk-m4 \
+		  nativesdk-perl \
+		  nativesdk-perl-module-bytes \
+		  nativesdk-perl-module-carp \
+		  nativesdk-perl-module-constant \
+		  nativesdk-perl-module-data-dumper \
+		  nativesdk-perl-module-errno \
+		  nativesdk-perl-module-exporter \
+		  nativesdk-perl-module-file-basename \
+		  nativesdk-perl-module-file-compare \
+		  nativesdk-perl-module-file-copy \
+		  nativesdk-perl-module-file-find \
+		  nativesdk-perl-module-file-glob \
+		  nativesdk-perl-module-file-path \
+		  nativesdk-perl-module-file-stat \
+		  nativesdk-perl-module-getopt-long \
+		  nativesdk-perl-module-io-file \
+		  nativesdk-perl-module-posix \
+		  nativesdk-perl-module-thread-queue \
+		  nativesdk-perl-module-threads \
+                  "
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
 	   file://program_prefix.patch"
-- 
1.9.1


