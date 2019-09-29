Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1086F7F27C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:46:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46hHcx4vFrz2J
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 22:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569789985;
	bh=O41ay220zCRuXb6mZTMWtuAj2b7rLRACKnB7N5JQw/Q=;
	h=From:To:Subject:Date:From;
	b=TXtLEztSUDShXu7Pqxs0F7nuOizKLXcoaJE5vlaPdqFWvHb2D6VgzjzPCg3ggxlkw
	LaZDgyNWIUm/WIyl5Jp/3OUWmoe9nHXVfO9UOBfCMxDPGPFz8WPri8H+GPvPMpvJ6k
	pjWR5y6UuYC1W4nIh0jzdQDzSueEYgqbBukXIBEXyfTODe3TTDWmiHay8vT9RS+rsD
	8HsIKIZN5/UzCbIIfPSORZLsC/nVlgD/xg+mCy6j9DdLt0ulzkdlYidlm77lc9BvfT
	MkBB1fUFXdnAdlZ+9hO7Z6mO9iJjja/h6XlS/Cy/4DvqXzOd2nYW+ZKLP9miNprnjW
	Y4O2hgsctQeej947/ZuOZc/zUnY4wCvTx/i0SYIetTg3d0ATy3IZhfMCjwahvk/+CM
	HeM62murYAtXlRJzEdYfWqD3gFZQ4jBtSa8qySz5ir3+LbLIBYdI0IO3AoHSF83CXc
	ICltGK3bhkFAAQUs6z8w3K4TTMLg3ICB05N7KujfpjjosXqvw/ht/6uqujb/jpIGLK
	CuzgJ3KKv67xVZ0R7aueRfo9ttJZisca4wkBcdQX3iT0XGNXEDOYRG6DiHwcWJ2166
	BI5f+BaiHVH2XGMJByFii1FfXKwwGkkkWBS98GWclH6A30xOPuZp1+NMV6O9uGxchd
	JqjAHSisWtLGg/1q45/w/Q7k=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:46:25 +0300
Message-Id: <20190929204625.27198-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Sun, 29 Sep 2019 20:46:25 -0000

In recent years AMD CPUs have had various problems with RDRAND
giving either non-random data or no result at all, which is
problematic if either build or target machine has a CPU with
this problem.

The fallback is /dev/urandom, and I'd trust the kernel here.

--enable-rdrand was added in an upgrade to a new upstream
version without mentioning any reason.

[YOCTO #13534]

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/json-c/json-c_0.13.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
index 5b10e68297..e6a38995cb 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
@@ -20,8 +20,6 @@ RPROVIDES_${PN} = "libjson"
 
 inherit autotools
 
-EXTRA_OECONF = "--enable-rdrand"
-
 do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
-- 
2.17.1


