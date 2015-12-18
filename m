Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id DEC9D731A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:35:40 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id mv3so24717216igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 17:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rSOx/Qok6kxTLGZjqorui1rK2xhVeaSGhdwYJ/RAA3w=;
	b=xUoIVuNSP5eYY2VMgWuyrXO4fj2AQeT7VbpNFj/WD2qEZx63TfMuqnGkTkyFeClBrZ
	RtmVrjO+F8ksJn3kS6XN1+vr3cN+OWivZ9nz+bc4kqL2sp8jdZCLnt0zOyOgvvFaxwGV
	NNMo+nSY3sZWeh/RI7Fl67riwtt9t+oXc0PVdibqYXgyvZN1brl5Ioz+sSL33zVay8dM
	0+CFWPrfBOM27CYYFw6CvB35zMOCfI3Onb5yyLsuiKHTI+ocAlv0Qwh76bI12hlEYm7V
	kom/N4QA1E+y5ARGVuxtDr1neW4u2ee4e3T3NC9h4VTj+82yrjGmTNLbcBTE7wNQh5Db
	YLeA==
X-Received: by 10.50.88.97 with SMTP id bf1mr659069igb.94.1450402541158;
	Thu, 17 Dec 2015 17:35:41 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id w8sm1745659igl.0.2015.12.17.17.35.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 Dec 2015 17:35:40 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 17:35:24 -0800
Message-Id: <1450402525-11430-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
References: <1450402525-11430-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/4 v2] valgrind: make it explicit that valgrind supports armv7a and above
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
X-List-Received-Date: Fri, 18 Dec 2015 01:35:41 -0000

Update comments etc and remove usage of the _armv7a over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 3dc3cc1..0481c63 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -26,14 +26,21 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
-COMPATIBLE_HOST_armv7a = 'arm.*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
+
+# valgrind supports armv7 and above
+COMPATIBLE_HOST_armv4 = 'null'
+COMPATIBLE_HOST_armv5 = 'null'
+COMPATIBLE_HOST_armv6 = 'null'
 
 inherit autotools ptest
 
 EXTRA_OECONF = "--enable-tls --without-mpicc"
-EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpicc"
 EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
+
+# valgrind checks host_cpu "armv7*)", so we need to over-ride the autotools.bbclass default --host option
+EXTRA_OECONF_append_arm = " --host=armv7${HOST_VENDOR}-${HOST_OS}"
+
 EXTRA_OEMAKE = "-w"
 
 do_install_append () {
-- 
1.9.1


