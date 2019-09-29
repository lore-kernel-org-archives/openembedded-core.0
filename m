Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8EE7F276
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:44:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46hHb96Qy2z2J
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 22:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1569789894;
	bh=O41ay220zCRuXb6mZTMWtuAj2b7rLRACKnB7N5JQw/Q=;
	h=From:To:Subject:Date:From;
	b=IZGE3baFbNs5NfhOSZj4uCvnHMlNAho4TaDin9QYMa4CRkil/50iX+prq/j4psDrJ
	95Zq4wPQkAjOqV7uO7TZ6G0X46tnHQm1Gjma9ztcmpHsn4IvSnweVsdu72fZPFxINX
	H+wPzy8NeJW+Z9RW3UeAd7zoCNEKvtiyLGRELmuyJ9cbs6DQsDBtD1rL1/2q2IEjJL
	jfWYVfJS7UwAfc6wt15Uc2PiIYWvyfdKjyUqkuGfkizHX2zDkCSITxeWPoFHFno4yc
	kLBY7/6HsKbi6mISDEW8bMeO0sv005e7agOMgT+jpWIR7lCPDpS6C/ajQakOJweFfa
	fx15fvx/kzXlrQKyU1A35+Gek7N1yHk+eOHAW9xi8ZC0pCA2xn1StT0eIzcXVRIfk1
	hEvmUqSaZ8wk5JHunzYMVjhswZVsr9G735fw3EkO1UQOg8sYbgHyo0PXXrdFoq7VYx
	XETXliU+L1Bium5kYJ+oEhU3cx14IRdexjZaeBON3rv8FQDsmwoOR2SMWWvu039+wy
	bMw0wpTdgsG7mHVTP3V6bSQlJme5xvX/IcC5Af5AYBvKriux5XkAtXreKpb3NQG9ly
	ixUjT4sueYeO6UQphs7XQCytndejICeUXL0oo6SYwraBdci2YQ+yybTTsvbvsCGgqu
	Nzx9qSLcb8eEipmzfQoTMwq8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:44:53 +0300
Message-Id: <20190929204453.27066-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] json-c: Don't --enable-rdrand
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
X-List-Received-Date: Sun, 29 Sep 2019 20:44:55 -0000

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


