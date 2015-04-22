Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4B1073D7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:07 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so107048104igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=3AwIRwKzQloVTw2ZRaevd8+cAm9kfDhywuudFya2tXw=;
	b=CDpkxk1gI8LBalny2aTUQ6z8BV0M6cA6/1OoxCNdtX6puyIa4xOzCQtch6rrEsoG2O
	FDXGMdZprCO/7tzrttBREjkSEDAfK7XlXZD+TOMEQAXgsS9fdSxv23AZJl4F8RzviD1G
	IYix7NocHiRPvjGEswB+jv6UO5zhMJ4t1jM55Xw5H9J/jSNBI3wERSytC/wPWyhmY8k/
	rTvgvd5xz7IW8jrcJoaO49Mpob31Ak40OI0/QJ/Oh1M9YoTC/slLtcL5wsTZVg9wobGs
	J2GNz1ob6tgBryruNbYbWFY63p6NY9UqcSG1FLW8q/qSclYBuMM3Fr+56EGUyFBmE70s
	0xPA==
X-Received: by 10.107.41.72 with SMTP id p69mr33991971iop.58.1429689009024;
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:57 +0000
Message-Id: <a46aa1fee8b43e19f2d104750f477df44a41fbb5.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
References: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 08/10] subversion: Add -P to CPPFLAGS
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:08 -0000

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


