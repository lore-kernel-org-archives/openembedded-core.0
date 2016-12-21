Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA36774AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 17:34:18 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b1so16984111pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 09:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=47bkImWZXCV31Xr/V58Qpo/SRiZduX6bVjExaeoqL1U=;
	b=X+Pg0EiaS5t57Z27FcW1g78de91aQ5MkggfPyjKL4SA4mZN6BA27FNrwpiF7FJa4JB
	J3bs9uFbdqSJbFzxKdkq6h3Rg/l65IdgAmrQLv0D5wOIHe4c+m1Vc5HKc8dSlpdiI42p
	X6pVLcRU+LdLPSr6kQ4uEQTZTwZCrQSEdoZyLX0EMhqp7bkTjqatgn+oIdnes7yOf4+a
	RUr/3xdr5A/JACU+4NdTyiawX971LBXEMpmfl+9fw2Kl7LNYI5Y5aVKevzwRENWDE8IE
	SwnAV83ORQldosR9FXUD8/lw1y0e2cWEqSH2qcyu3kHMQj/rNUfQzFtww/3pf5AKW9uu
	c2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=47bkImWZXCV31Xr/V58Qpo/SRiZduX6bVjExaeoqL1U=;
	b=h0C2Q5YFDr+XYbwnKJySRrSBN9ps5qkTOOp/PNUOFMpadFP1/FyNrfEfQgqii7aFqe
	LRL9NSS9Hi+UtWV4jfbsRx74N4FYLeorKk4AhXUM8LjwMihD28jtMPGzAvh8f/RYEb1O
	7s8wN0+XJGt7r37vIwoP/E9hOXzNC8wFaY9vTdJpk1eXOT9+4XP1+pu7ZvRTAVb2oc79
	8lPvv9rjI3E3xVT9Y5s75o36M6/X8946l47H7Pg50/nlSfmm7w6sVxTSGJOTt7c/ETjk
	8LB7g15CPR39p8l6bCnKlxz2QgEuheOI8XJDcoc5HtK2fKflktXM29aTgiNovB9d+d5v
	KMUw==
X-Gm-Message-State: AIkVDXJvxsSZeLaBBM41HMv1h5j1RonsEEX7/kQNArUHow0vydlaIRaMBuunf52upBhCQQ==
X-Received: by 10.84.133.99 with SMTP id 90mr10789766plf.151.1482341660047;
	Wed, 21 Dec 2016 09:34:20 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	d15sm48415964pfl.46.2016.12.21.09.34.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Dec 2016 09:34:19 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 09:34:12 -0800
Message-Id: <20161221173412.21811-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: adraszik@tycoint.com
Subject: [PATCH] opkg-utils: Do not use --ignore-fail-on-non-empty with rmdir
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
X-List-Received-Date: Wed, 21 Dec 2016 17:34:19 -0000

--ignore-fail-on-non-empty is coreutils specific, and you
are not always going to have coreutils on target systems
especially small ones. They will use the busybox applet which
does not support --ignore-fail-on-non-empty, use pipe and true
to ignore the errorcode from rmdir instead

Fixes upgrade errors on target e.g.

rmdir: unrecognized option '--ignore-fail-on-non-empty'
BusyBox v1.24.1 (2016-12-20 10:41:39 PST) multi-call binary.

Usage: rmdir [OPTIONS] DIRECTORY...
To remove package debris, try `opkg remove update-alternatives-opkg`.
To re-attempt the install, try `opkg install update-alternatives-opkg`.
Collected errors:
 * pkg_run_script: package "update-alternatives-opkg" postrm script returned status 1.
 * postrm_upgrade_old_pkg: postrm script for package "update-alternatives-opkg" failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 19a852ec62..a881bbb5d4 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -45,7 +45,7 @@ RCONFLICTS_update-alternatives-opkg = "update-alternatives-cworth"
 
 pkg_postrm_update-alternatives-opkg() {
 	rm -rf $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg/alternatives
-	rmdir --ignore-fail-on-non-empty $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg
+	rmdir $OPKG_OFFLINE_ROOT${nonarch_libdir}/opkg || true
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


