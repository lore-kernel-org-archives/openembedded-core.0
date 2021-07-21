Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web12.4516.1626876717462519853
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 07:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@tq-group.com header.s=key1 header.b=GcVIg/4Q;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626876717; x=1658412717;
  h=from:to:cc:subject:date:message-id;
  bh=O1g6GB2++wUiDDOWPczs/lpjAAwzWGDVUCF/ZWQlu+o=;
  b=GcVIg/4Q/TJt1xUrYPqYta4fX3vQ24k60tXnj7ogwOFG2Y070W9NuriP
   h+emvrwUV8rHe+KRLEdwto62e4ZgV5DRF9gBYQU+G3Mayr4JX5jm5a/4x
   gObGZLg8P+gqQV7SEeMGcfePXzWuR7YIlQuMKXdCgube0k4RnqMwPQQHS
   HGGOx/HV8M3XRBAkiwWteq2Mx14CaXVFNT6CCWVW2zTFGx20VPHi3kmlV
   gOaOKHJP/3bQpz5fHSztJ14vnBHHfxuML1XqCrGB2of8vvfG1PXp6s5Ar
   eYtfpkfOB8wSJ4joYAHOZpjGLgg4UC6jYx4NkTDg3jYAYph5E7ZcNqRB6
   w==;
X-IronPort-AV: E=Sophos;i="5.84,258,1620684000"; 
   d="scan'208";a="18573452"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2021 16:11:54 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 21 Jul 2021 16:11:54 +0200
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 21 Jul 2021 16:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1626876714; x=1658412714;
  h=from:to:cc:subject:date:message-id;
  bh=O1g6GB2++wUiDDOWPczs/lpjAAwzWGDVUCF/ZWQlu+o=;
  b=fYTG8qShucxHVV/k0LElMv2aC+cci+dtyKvKL6cOXupyyZVtKVaAU8jq
   FM1zLjFbejuie2rkFIOXBhatStNXxDzIla9E98xz5PSAt3DdpWQEzH0g6
   nTUFdLe/WBLvfXe3sUEuKKPXgp4TwvMZYogDqrkVQo4s9Bsouvi8Ou/0J
   8RnoZHvpcKh69YslBuV7pU9fZlYhErhNNnyZ7M08T2cFLoynjI32yeizZ
   +irgSDNuHpRgWtJWyih1MrgzDAaqgSOxZ8qeIY4dJeobMWadIDOb9tfsv
   MZe8S0ARo5UNZlTnioLiuOEyWOCGfldfe2WcF6U0LyHcD799k3ZLM89LN
   w==;
X-IronPort-AV: E=Sophos;i="5.84,258,1620684000"; 
   d="scan'208";a="18573451"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2021 16:11:54 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 86DA6280070;
	Wed, 21 Jul 2021 16:11:54 +0200 (CEST)
From: "Matthias Schiffer" <matthias.schiffer@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 1/3] initscripts: populate-volatile.sh: do not log to tty0
Date: Wed, 21 Jul 2021 16:10:14 +0200
Message-Id: <0fb2381b97f71a3469e6c5a0de98b2c3e7aa75c2.1626875447.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.17.1

tty0 may not be the intended console for log messages, or it may not
exist at all in kernel configurations without CONFIG_VT. Just use the
default stdout/stderr instead.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../initscripts/initscripts-1.0/populate-volatile.sh      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index f21f48dd30..f8b42c6893 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -37,8 +37,8 @@ create_file() {
 	fi
 	EXEC="
 	${EXEC}
-	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
+	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\";
+	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 
@@ -60,8 +60,8 @@ create_file() {
 mk_dir() {
 	EXEC="
 	mkdir -p \"$1\";
-	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\" >/dev/tty0 2>&1;
-	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" >/dev/tty0 2>&1 "
+	chown ${TUSER}:${TGROUP} $1 || echo \"Failed to set owner -${TUSER}- for -$1-.\";
+	chmod ${TMODE} $1 || echo \"Failed to set mode -${TMODE}- for -$1-.\" "
 
 	test "$VOLATILE_ENABLE_CACHE" = yes && echo "$EXEC" >> /etc/volatile.cache.build
 	if [ -e "$1" ]; then
-- 
2.17.1

