Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3307060842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:36:22 +0000 (UTC)
Received: by mail-we0-f171.google.com with SMTP id p57so1591137wes.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 07:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xXytuZWuZffxOYI7ct9s1Y1714GvpUvEZ+/KliB95QI=;
	b=hMcRG35YTACj13V0y2QHDpu8LbPmYfpcvMU8LFU1ZkcAU3Qp1uRPAtVROYfhdref/s
	FyyKeFk8SSZuhW0mF00sPO5CQ8VhhQgJNAcWr43vVmM0pxJVhDYIo+Wxu01waxmgPiIe
	qmXL5aIdJN9IQUHxKOIhbLykdMpXVjENTFYqdIaLwAGuRVrmHqQD4BCq0fpCptFamMPS
	LTsVgnRb4UWzWZP95d4eRHxcmsv+xCJ/Ph638pMAuUjo29xiwU/g+8N5myUH0bptRRqq
	7edk21F+Ur1jlQGNUPA+pyjfK5odPJkJbjY1ky30+ZApGbNobodZ9YjI8fxVXtjFTjPI
	CZaA==
X-Gm-Message-State: ALoCoQnpCEA1tir6osckQKoLplWtv2Zlritn6J47fFUgtBsDa3MJGJBcHTccXfDrOUdfB5OZQ/wB
X-Received: by 10.194.95.10 with SMTP id dg10mr10502136wjb.36.1377182182217;
	Thu, 22 Aug 2013 07:36:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bt8sm17222337wib.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 07:36:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 15:36:18 +0100
Message-Id: <1377182178-19511-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] runqemu-ifup: when tunctl can't be found, say what package builds it
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
X-List-Received-Date: Thu, 22 Aug 2013 14:36:24 -0000

If runqemu is used without actually building any qemu images (i.e. you
downloaded the images) it's likely that qemu-helper-native hasn't been built.
Instead of just saying what command can't be found, tell the user how to solve
their problem.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/runqemu-ifup |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 5f6a437..140dd88 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -53,7 +53,7 @@ NATIVE_SYSROOT_DIR=$3
 
 TUNCTL=$NATIVE_SYSROOT_DIR/usr/bin/tunctl
 if [ ! -x "$TUNCTL" ]; then
-	echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/bin'"
+        echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/bin', please bitbake qemu-helper-native"
 	exit 1
 fi
 
-- 
1.7.10.4


