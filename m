Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9E70973DAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 05:34:30 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so39057484igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 22:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DMScgaWBF8Bbmcq7QFjQxTvUHQraEGO+qu6Xk+1tPyk=;
	b=m/nCXpEK4M4P1Bca0RJ+wIkwmcNgCShidcRSKM+M+FUNcEwf582niVwWOoXH+//vAL
	VMShOuv7H2DxB8YDy4jNsfNtjrMFynnZfKuQmJzhI2m14TQjnozk/T7KdtguVElIjt/T
	XVUzKf+778GwF5hQwltLGItFIhGjU4uMddwfFFaWahTGAY+BfKjaUyHuWCawgU1n0yTL
	5mTB4SfuR7A3znk/LW/DBxq0mofO1Z9L/me3l3yTUTP+axN22rZdxFdakiTACBPMqmhJ
	Mmv6l1hT7Qe2oZnq5itEYxY3wpU43rLgQrJdHhcGH/mVzLiBnGLAHnONKXWEwfSXW4hx
	nezQ==
X-Received: by 10.42.185.12 with SMTP id cm12mr1696630icb.0.1430285671159;
	Tue, 28 Apr 2015 22:34:31 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id pg7sm3215242igb.6.2015.04.28.22.34.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 28 Apr 2015 22:34:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2015 22:34:22 -0700
Message-Id: <f569f95695e6c5462239f4bc186c61e8456339c0.1430285475.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <9594a8c72803b604619bc23672e227ec29b239f6.1430285475.git.raj.khem@gmail.com>
References: <9594a8c72803b604619bc23672e227ec29b239f6.1430285475.git.raj.khem@gmail.com>
In-Reply-To: <cover.1430285475.git.raj.khem@gmail.com>
References: <cover.1430285475.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] curl: Fix wrong assumption about sizeof off_t on largefile systems
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
X-List-Received-Date: Wed, 29 Apr 2015 05:34:34 -0000

This issue was reported on poky ml as well see
https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html

Change-Id: Iedf22467889893111fde0433e411fd0546a38546
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/curl/curl_7.42.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.42.0.bb b/meta/recipes-support/curl/curl_7.42.0.bb
index d4445ff..d698fcb 100644
--- a/meta/recipes-support/curl/curl_7.42.0.bb
+++ b/meta/recipes-support/curl/curl_7.42.0.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "32557d68542f5c6cc8437b5b8a945857b4c5c6b6276da909e35b783d1d
 inherit autotools pkgconfig binconfig multilib_header
 
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib"
+
 PACKAGECONFIG_class-native = "ipv6 ssl zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
 
@@ -37,6 +38,9 @@ EXTRA_OECONF = "--without-libidn \
                 --disable-ldaps \
                 --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
 "
+# see https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html
+# We should ideally drop ac_cv_sizeof_off_t from site files but until then
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)}"
 
 do_install_append() {
 	oe_multilib_header curl/curlbuild.h
-- 
2.1.4


