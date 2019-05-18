Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA267C5FC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 09:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 455fzJ0jYVz4J
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 11:30:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558171852;
	bh=G7s36FGokvyaS2gXwUfVRquYgHE/zK58rYJPEZGMveg=;
	h=From:To:Subject:Date:From;
	b=rJfBZmeDBN8FDuZSyFO/VBSVm9H+bDNQmkjcBfhyGFiqF4YQ1P9J/DvPS8S0M/a/W
	q4gMOmZHY9a74tnWb46VjqHArBDFC5JBV8FDPKI3zCZ4AHywRzdJ5VJ1gutJSU34FR
	FS0C1thwF+ykQtlrvDKKmjfHohw/5i6s3pKVNmmWQIpaDYaPO36xpW5eYmFN0b/7n7
	xogCzo2wXsh2zQrAK9qjsdg0ZNWdLE50x1iDV7AD8js/s3wSiUqE/NHWHiA546ap/W
	xbgvL2Vkk/e8GMjFaQZFBYl5F4adi8fih8QEMStOMiH1GKHh99yNGYGqDLYUSsXtdb
	4o4yHeSQqjcxLVlVgtptMO/8pAmW9r8HjPtwrZ2SfPjUjh2bqTfwu82zebHwzetV4D
	BrG85JDCLy6kk2QtlDV26U4xoKjRGR7LBJ+UqfgvCyyoyxKBQ9S4tf2FOFpH86LPUZ
	luTCNBwjQ3nni4Ls/0T8yJw2VwWZRW2ncAiGZoIrSaYjwdY8zFnoDwEIeDd8uAEw3f
	MNRwZggAF8RXo+xHJTi8EuF/7NCeFzjmw066nrklIKM7SO7Ox/gnOJnwaFN/JP6fAV
	qs00Usv5gdI7pvvefWsq6u/UNTB9OWtMul1xNVaF3gRuDK83cxIk6eFPS29xMofzau
	LQjb8aU+dzAt+DbYgPgBQQNQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2019 12:30:51 +0300
Message-Id: <20190518093051.7446-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] icu: Remove workaround for musl issue fixed upstream 2 years ago
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
X-List-Received-Date: Sat, 18 May 2019 09:30:52 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/icu/icu.inc | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index e20085fbf5..6d9728903d 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -35,13 +35,6 @@ TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', '
 
 ASNEEDED = ""
 
-# strtod_l() is not supported by musl; also xlocale.h is missing
-# It is not possible to disable its use via configure switches or env vars
-# so monkey patching is needed.
-do_configure_prepend_libc-musl () {
-    sed -i -e 's,DU_HAVE_STRTOD_L=1,DU_HAVE_STRTOD_L=0,' ${S}/configure.ac
-}
-
 do_compile_prepend_class-target () {
 	# Make sure certain build host references do not end up being compiled
 	# in the image. This only affects libicutu and icu-dbg
-- 
2.17.1


