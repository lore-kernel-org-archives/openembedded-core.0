Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id EE15273D89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 03:35:43 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so36527628pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 20:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3AwIRwKzQloVTw2ZRaevd8+cAm9kfDhywuudFya2tXw=;
	b=ISAUsbfC9+XqqDnlY9DiG0tD8PctQ5Y7PBzsF6L8V2/RQyBJmaAl2pEzGHRZdosEsH
	Z+TnSMU3Bc+jtjJjRucHqCq5tGstMdCdUxQZa3jZzggiW+mQqyDyC3QrDVTnx8CepGPV
	bD6GbISP9Cgpqf5Wl6yCK11Ag1TSnZQk/pw+osr2vMPjCnYcfic3B81jVfqUhP6JKEAd
	al9ZU0VhXFQMVeRwK5OTO0CPeLTEYMhMcTRnY28LRA4GcDnrPDSbO4gP1zeWnFH1ZghV
	JSG8FSb21zIIv0pd2LCz1mOt6WJ3yXT/sR8M/+YsCZUYQof7FurrbiKuGX8qnY9pvdaR
	UjuA==
X-Received: by 10.68.164.5 with SMTP id ym5mr10985507pbb.43.1429846545414;
	Thu, 23 Apr 2015 20:35:45 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id qv9sm9575507pab.27.2015.04.23.20.35.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 20:35:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Apr 2015 20:35:25 -0700
Message-Id: <278c32ff3aaa351237215ff41060a0bc8aa7fd36.1429846255.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
References: <aced357a8b994ceff87490e2e9faa526143bf4c4.1429846255.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429846255.git.raj.khem@gmail.com>
References: <cover.1429846255.git.raj.khem@gmail.com>
Subject: [PATCH 07/14] subversion: Add -P to CPPFLAGS
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
X-List-Received-Date: Fri, 24 Apr 2015 03:35:44 -0000

see https://gcc.gnu.org/gcc-5/porting_to.html

we need to stop the preprocessor from generating the #line directives
or we run into issues like

| checking for apr_int64_t Python/C API format string...
| configure: error: failed to recognize APR_INT64_T_FMT on this platform
| Configure failed. The contents of all config.log files follows to aid
debugging
| ERROR: oe_runconf failed

Rightly subversion should be fixed but lets leave that to subversion
folks

Change-Id: I02a89798ff949f79967ab0a73adcddaa4218662d
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/subversion/subversion_1.8.11.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.8.11.bb b/meta/recipes-devtools/subversion/subversion_1.8.11.bb
index 8e4cd9d..d5295d8 100644
--- a/meta/recipes-devtools/subversion/subversion_1.8.11.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.11.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-inherit gettext
+inherit gettext pythonnative
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
@@ -31,6 +31,7 @@ EXTRA_OECONF = " \
 inherit autotools
 
 export LDFLAGS += " -L${STAGING_LIBDIR} "
+CPPFLAGS += "-P"
 
 acpaths = "-I build/ -I build/ac-macros/"
 
-- 
2.1.4


