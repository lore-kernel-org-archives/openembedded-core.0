Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id D237C762B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 21:14:41 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h68so6165lfh.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JkcWLEvTAuSP3P9rTyZ6nnIEaloXUD9RpGQ880qK+tw=;
	b=AcbIzaG+N9klNN7xVjumJM5WZbpuyoNOi1RkS89bQTaAc6ui6nYkJZxUJsBs3hZDNm
	zKi/Owrx39dUFeJuRurwYaWxGOKwXWlNobIhimnm3/E7f2e8IBKVwBCH2HRIRW6x59h1
	iUnsheoG+u0tkLD/OQXFlK2LzLaDhF4HVYm+Z32qIBpdA68ku7Z0TFzMf5l+KbNUZGm+
	cUMhRTgefWW4LLBMd5CVNCQ1FoET3o1W+Hbd9A4j5ijk/PXI+DpundcFtYr98aPLG9Zq
	C1CW27m2qFzRZgELEhT+wUItFY398sEBVGSh4ZjV/yOcMzQ+8xkF8ZYBvr7Qq7GMQxvm
	QKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JkcWLEvTAuSP3P9rTyZ6nnIEaloXUD9RpGQ880qK+tw=;
	b=Yt75P6Bz3+2kEXjX8b0xiV0wKfAycBtIBAme9vvCaQrLXmc/KvicJU0kVFvBV9RClm
	3GCP2Cgy/AwnyhzRBeeRwbfu7XJutSL9L1r3mov3/U9qeVeq8H+21KBh89R96PEJJeM/
	DVvPkaigoNc/FWK0CndmIcypPk2Ti1xJIGRHzi6kNq6xUducuPEXOKRcapWGO0qjQLW6
	PA+mGi5VZQplvKj9pCMaOVz7v1IKqU+chNNg62W+9q8h2htmcasavgvsiyguK8b+59Lk
	sQTn7zQCKSw6N/OEb4DDEsTuz81WQL5FuF/YXGA3OD2Dzz+fRpL0JPJNlkMd166OdrI9
	Ug6A==
X-Gm-Message-State: ALyK8tJVs680XlLdcdrW6+l6X+xFP9UaVt412oH3TmaWp2boHw430ikGDbuUMyM8kr/VCA==
X-Received: by 10.25.145.19 with SMTP id t19mr3507744lfd.109.1464297281499;
	Thu, 26 May 2016 14:14:41 -0700 (PDT)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231]) by smtp.gmail.com with ESMTPSA id
	ym8sm2580593lbb.35.2016.05.26.14.14.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 May 2016 14:14:40 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 23:14:33 +0200
Message-Id: <1464297273-30713-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: paul.eggleton@linux.intel.com, clarson@kergoth.com,
	Ming Liu <peter.x.liu@external.atlascopco.com>, yue.tao@windriver.com
Subject: [PATCH V2] initscripts: check if swapon/swapoff exists before executing them
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
X-List-Received-Date: Thu, 26 May 2016 21:14:44 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Not all built images contain swapon/swapoff, for instance, it is
configurable with or without them in busybox. So it'd better to check if
they exist or not before executing them.

Redirecting the potential errors to /dev/null is not good enough, which
might suppress the *real* errors.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/mountall.sh  | 2 +-
 meta/recipes-core/initscripts/initscripts-1.0/umountfs     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
index dfee2af..02f0351 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/checkroot.sh
@@ -69,7 +69,7 @@ fi
 # before fsck, since fsck can be quite memory-hungry.
 #
 test "$VERBOSE" != no && echo "Activating swap"
-swapon -a 2> /dev/null
+[ -x /sbin/swapon ] && swapon -a
 
 #
 # Check the root filesystem.
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index 94bae42..c719be5 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -33,7 +33,7 @@ kill -USR1 1
 # Execute swapon command again, in case we want to swap to
 # a file on a now mounted filesystem.
 #
-swapon -a 2> /dev/null
+[ -x /sbin/swapon ] && swapon -a
 
 : exit 0
 
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountfs b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
index 61324c6..7fb5c58 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountfs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
@@ -12,7 +12,7 @@
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
 echo "Deactivating swap..."
-swapoff -a
+[ -x /sbin/swapoff ] && swapoff -a
 
 # We leave /proc mounted.
 echo "Unmounting local filesystems..."
-- 
1.9.1


