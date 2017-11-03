Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8F58E71951
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 16:51:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA3GpwOQ029719
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 3 Nov 2017 16:51:59 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eAfCI-0006Mw-Pi; Fri, 03 Nov 2017 16:51:58 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 16:51:57 +0000
Message-Id: <1509727917-24444-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] rng-tools: Fix crazy defaults
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
X-List-Received-Date: Fri, 03 Nov 2017 16:52:01 -0000

Feeding the output of /dev/urandom into /dev/random is pretty much insane
and not something we should encourage.

I can't really imagine a scenario where this would be a sensible idea since
/dev/urandom if effectively derived from /dev/random.

This changes the tool to default to /dev/hwrng which makes much more sense,
feeding hardware entropy into the random pool. In the QEMU case, this will
feed entropy from the host into the guests which is also what we want.

Yes, this change will cause rngd not to start if /dev/hwrng isn't present,
but it isn't needed if that isn't so I don't see this as a bad thing.

(https://wiki.archlinux.org/index.php/Rng-tools has a section in red which
agrees with the above, "this is a really bad idea, since you are simple
filling the kernel entropy pool with entropy coming from the kernel itself!")

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/rng-tools/rng-tools/default | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
index 7aede9b..ab7cd93 100644
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -1,3 +1,2 @@
 # Specify rng device
-#RNG_DEVICE=/dev/hwrng
-RNG_DEVICE=/dev/urandom
+RNG_DEVICE=/dev/hwrng
-- 
2.7.4


