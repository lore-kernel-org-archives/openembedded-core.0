Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id EFFE3611C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:17:08 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1j7CTt-0007dj-9O
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Feb 2020 07:17:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gOX3oNqegCaXclTQpkmOOYcW4JqKClsoGajucsgc6tg=;
	b=f4ma2KNqc37p0WY3ulpjEqC0Fz
	KwfipLNTtCZ3J/G/3QRZ5qdkMtMyF+zM+8m93LOLGdysc+wDAYON6V8Y59EQlqqOO9VvydrWrB2k1
	dHsHwz5lCvvA4UP5gkyt1olpOgnL17nivDhvEGJGZgZImH8nLRvQIiAdolJeCfkWmeiAEy2kNjxzU
	z80ScmK6sVD6jzMNPI5gFyIQCbgqWCaMrra1aev1V/jS5q9UO8qAid8EMcZo8r9raf0iwf0mEnqpm
	C5NNmL+C3Ah1V+tkATcWyeYcS4Cakz7IOBOri5SCpubYQxEp2mePJXdfK2ASHBZncukiz2F1sDXXU
	PNIA0BZg==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1j7CTp-0007Yk-4v; Thu, 27 Feb 2020 07:17:07 +0100
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 07:16:57 +0100
Message-Id: <20200227061657.66871-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Spam-Score: -2.0 (--)
X-Scan-Signature: e60d8c77b9093fb5a9e5e1cf29f3793d
X-Spam-Tracer: backend.mail.pr.hu -2.0 20200227061707Z
Subject: [meta-clang][PATCH] conf/nonclangable.conf: Always build mesa with gcc
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
X-List-Received-Date: Thu, 27 Feb 2020 06:17:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Building mesa (at least version 19.3.4) with clang 9.0.1 leads
to linker errors on x86/x86-64:

"undefined reference to `typeinfo for llvm::raw_pwrite_stream'"
in libvulkan_radeon.so

and

"undefined reference to `typeinfo for llvm::RTDyldMemoryManager'"
in libgallium.a.

It was reported at https://gitlab.freedesktop.org/mesa/mesa/issues/2533

It seems it is related to rtti not being enabled, at least reports
from a few years ago on forums lead to that conclusion.
But enabling rtti for clang in PACKAGECONFIG doesn't help.

Just build mesa with gcc, it fixes the linker errors.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
 conf/nonclangable.conf | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/conf/nonclangable.conf b/conf/nonclangable.conf
index 70336bb..91b9965 100644
--- a/conf/nonclangable.conf
+++ b/conf/nonclangable.conf
@@ -45,10 +45,9 @@ TOOLCHAIN_pn-libssp-nonshared = "gcc"
 TOOLCHAIN_pn-libstd-rs = "gcc"
 TOOLCHAIN_pn-m4_powerpc = "gcc"
 # clang does not have 64bit atomics on mips32
-TOOLCHAIN_pn-mesa_mips = "gcc"
-TOOLCHAIN_pn-mesa_mipsel = "gcc"
-TOOLCHAIN_pn-mesa_riscv64 = "gcc"
-TOOLCHAIN_pn-mesa_powerpc = "gcc"
+# building Mesa 19.3.x with clang causes linker errors on x86/x86-64
+# See https://gitlab.freedesktop.org/mesa/mesa/issues/2533
+TOOLCHAIN_pn-mesa = "gcc"
 # multiple definition of 'mongo::error_details::isNamedCode<0>'
 TOOLCHAIN_pn-mongodb = "gcc"
 # variant-impl.hpp:309:36: error: 'is_variant' does not name a template but is followed by template arguments
-- 
2.24.1


