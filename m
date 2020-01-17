Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DD89D7FA2B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znM22RHPz6w
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:58:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280302;
	bh=x0FxadrF2ee1AlxIZZxGuxjlYmJgky4kjDg9ax33uOg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pwyNUJy6sw9bx2Y6CsPREGq8R1Vzr6YU9CdV4Ursp03mC3NDShH7YX12hlMEGaSzw
	hQyKz/6/yq1lSyY72OBzCb+kbeT/RSGkkgNXzn7KauwCqiTSoIYeqfP2fjmbcaMe6O
	n0WXaX1mlusRvoEKL74tINcTaxGf3S79awWcfa5meJuEoRuoLO2YF44xSo0K9ex90h
	sSktPp9Hd/d2OjCI3WrbURSXkYaJfOleH79c/TLHdrSJaHn6GJvx1mv2prnukcw/GO
	EiuYxDxdNBJndsQV0XoYpQLHY4xyF1Ik/NnIobWwbbwAoOhL9xerbYzpNZPjqPA7XT
	1IlliCnlLG9OW0SvcTc6FaawcUxeLsGQYMQ7PnxWOtasU3X6SRgqb/STKsT+05FNBT
	1tN/zYAonw7QHWGXvVo+p94zp5gDaYPSezVsrnyCAnANy7i8I2Oh07EK8K2dmL2NdZ
	Qi4eFvEDbmGNSevM2YuDh5USbgCY10qGbNGPAfrFqdekQvF80MYwqJDuLTz7JXYRIx
	EcsvHhRZaPyHNqRR3p4xeeDQdV/lCn6gF3j7RfYaXvwpFL1CYQvAzxaGJZF21pVxZp
	7tnsejVxxSJbv3xegyhWlW6+ceDR4auchbQs527N8fA6CvuVc8BqwqLuUJ1cG1pXyW
	n7YsToc6gQdbaEAt4qL7UNHk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 18:58:17 +0200
Message-Id: <20200117165819.2542-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117165819.2542-1-bunk@stusta.de>
References: <20200117165819.2542-1-bunk@stusta.de>
Subject: [warrior][PATCH] openssl: Enable os option for with-rand-seed as well
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
X-List-Received-Date: Fri, 17 Jan 2020 16:58:22 -0000

From: Khem Raj <raj.khem@gmail.com>

with openSSL 1.1.1d we start seeing errors like

Error Generating Key
139979727451584:error:2406C06E:random number generator:RAND_DRBG_instantiate:error retrieving entropy:../openssl-1.1.1d/crypto/rand/drbg_lib.c:342:

when using openssl from openssl-native on build hosts, this is due to
limiting the random seed to devrandom, to support older hosts, since the
option allows to have a comma separated list of methods to try, we can
try the default first and if that fails then fallback to devrandom, this
will ensure that it keeps working with build systems which dont support
getrandom()

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index b00624650a..0e65f333e2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -42,10 +42,10 @@ do_configure[cleandirs] = "${B}"
 EXTRA_OECONF_append_libc-musl = " no-async"
 EXTRA_OECONF_append_libc-musl_powerpc64 = " no-asm"
 
-# This prevents openssl from using getrandom() which is not available on older glibc versions
+# adding devrandom prevents openssl from using getrandom() which is not available on older glibc versions
 # (native versions can be built with newer glibc, but then relocated onto a system with older glibc)
-EXTRA_OECONF_class-native = "--with-rand-seed=devrandom"
-EXTRA_OECONF_class-nativesdk = "--with-rand-seed=devrandom"
+EXTRA_OECONF_class-native = "--with-rand-seed=os,devrandom"
+EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
 
 # Relying on hardcoded built-in paths causes openssl-native to not be relocateable from sstate.
 CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
-- 
2.17.1


