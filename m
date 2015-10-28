Return-Path: <tylerwhall@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 22AAF75D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 00:02:02 +0000 (UTC)
Received: by igpw7 with SMTP id w7so17765687igp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ANlEQRhGJVwtEumXlfBcCXnY1BjJRMJEEqdKJfhVvf0=;
	b=Nj+BhBnKJpxhgzHZAlYs80WNFtFko2G1tb837KxHnWMnwolVnYwZeOtGQ+bGAEX2Pn
	4ls2DGNSmBWRn08VL1Ix8UAjaMBuiPxjosfDjW7DJFL9XT9IauJGyISs8+qz8NKZuZhB
	tPMTHbFYoKU1Se2sPnn2+bcCgo9yDKpLF9vvF9ZTJVRdA85FAzxkMh//0MBmoGftBtWW
	4BaBKXDLHv+keQ/Ya1BxPKUbHxQySjcfkj0x3jUbFfoCa1mPOpV9MGefqndzxZf7Y11w
	Z8pGiCXH59UFgSu0EnKF9czSaR/ir3/v/sWEbg68Zny311v4ZXl+4J8drBSVqG/vlOXZ
	VTFA==
X-Received: by 10.50.32.33 with SMTP id f1mr26985973igi.33.1445990522467;
	Tue, 27 Oct 2015 17:02:02 -0700 (PDT)
Received: from metric.localdomain (cpe-76-177-101-4.natcky.res.rr.com.
	[76.177.101.4]) by smtp.gmail.com with ESMTPSA id
	e38sm15653939ioi.14.2015.10.27.17.02.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Oct 2015 17:02:01 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2015 20:00:51 -0400
Message-Id: <1445990451-2993-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [PATCH] classes/cpan-base: fix libdir for nativesdk
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
X-List-Received-Date: Wed, 28 Oct 2015 00:02:04 -0000

Immediate expansion of perl_get_libdirs() is too early for
BBCLASSEXTEND. This results in a packaging QA error when building a cpan
recipe as nativesdk. The split debug files do not get picked up by the
dbg package because it looks in the wrong libdir.

The is_target() function remains because it is used elsewhere.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 meta/classes/cpan-base.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
index d9817ba..080ce92 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -29,20 +29,13 @@ def get_perl_version(d):
             return m.group(1)
     return None
 
-# Determine where the library directories are
-def perl_get_libdirs(d):
-    libdir = d.getVar('libdir', True)
-    if is_target(d) == "no":
-        libdir += '/perl-native'
-    libdir += '/perl'
-    return libdir
-
 def is_target(d):
     if not bb.data.inherits_class('native', d):
         return "yes"
     return "no"
 
-PERLLIBDIRS := "${@perl_get_libdirs(d)}"
+PERLLIBDIRS = "${libdir}/perl"
+PERLLIBDIRS_class-native = "${libdir}/perl-native"
 PERLVERSION := "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
 
-- 
2.6.1


