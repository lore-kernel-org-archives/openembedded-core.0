Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4570077030
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 14:23:36 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so27694741wic.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Oct 2015 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=ifwwVMp4rAhSSFPTHUXiytIwQo+qyYklSPMqy7v+4+o=;
	b=ou+8jryHTnPqvj+dJLj0JYZdFTFEhrg5qpjo1k//0Z9lazbP/BfutE3L0V8UueWgx+
	mJKTBfKT+u+R362fmrRx5TBEFUoAQBxgKV17dBUg2oWHHS9S1QR2XKO70rh+TZgVWSZf
	0JP6apql5q0x1IxXSgvU5kTXHdjv368zfuo7etA/DytgFpFrrc26pABwjXD3CYaQAF6c
	UO/m1vsd3ik9cbaU+FxBAnyOHeZ51Z4sf7LZkgwzobo5uVvfEtuu7hnOOQK5aAvY1AJu
	5F+arGumLLN/cgTmr/IRN9SIq3USLGR07mZ7IAt1Pw7Ewo/pccmMLP039pzqFQpVMpPH
	rFvA==
X-Received: by 10.180.107.1 with SMTP id gy1mr4687125wib.56.1444314216809;
	Thu, 08 Oct 2015 07:23:36 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	bh5sm46523858wjb.42.2015.10.08.07.23.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Oct 2015 07:23:36 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 8 Oct 2015 16:23:35 +0200
Message-Id: <A2AC93FD-A1C6-4539-B7A5-47ED3224454D@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Subject: [PATCH 3/3] Perl: Remove errornous extra path-specs for Module::Build based modules
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
X-List-Received-Date: Thu, 08 Oct 2015 14:23:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


This patch removes errornous extra path-specs from cpan_build.bbclass
because corrected path specs at build time are enough.

* fixes wrong path used when building using Module::Build toolchain

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan_build.bbclass | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cpan_build.bbclass =
b/meta/classes/cpan_build.bbclass
index 3653748..fac074d 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -17,14 +17,8 @@ cpan_build_do_configure () {
 		. ${STAGING_LIBDIR}/perl/config.sh
 	fi
=20
-	perl Build.PL --installdirs vendor \
-				--destdir ${D} \
-				--install_path arch=3D"${libdir}/perl" \
-				--install_path script=3D${bindir} \
-				--install_path bin=3D${bindir} \
-				--install_path bindoc=3D${mandir}/man1 \
-				--install_path libdoc=3D${mandir}/man3 \
-                                ${EXTRA_CPAN_BUILD_FLAGS}
+	perl Build.PL --installdirs vendor --destdir ${D} \
+			${EXTRA_CPAN_BUILD_FLAGS}
=20
 	# Build.PLs can exit with success without generating a
 	# Build, e.g. in cases of missing configure time
--=20
2.3.8 (Apple Git-58)

--=20
Jens Rehsack - rehsack@gmail.com


