Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id D93456107E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 20:03:44 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id s2so2770204pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 12:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=5xRTSXI84/vnYZGEgQ+2LVMnfFF+9wY833qrIEjcxXc=;
	b=c+MIkmetPWpRpJ5d1aIK6w9N9CfzHrx9wwOn+kYaUAVNBvUGZe+/9TU6Zi7c8DGONi
	hOpNXzYgTdQ6Fvrb5ckxJ7P0GRBYSecxqsFnMaAj1/miORjj+a9eUdHOyB4e9EN3jMBM
	YNJQ/qC8b9oyCv2hYSdtZlk6sgkEeV4PsoD7M38RewTJgT5ZRLOJVXdYiTlAcfqrFLJV
	RD9grnT+xJQ2CnyIfWyAJNRxCgLwZzmH3di+tIpBcb+E5T8L07dHTpjtSe4E+A562wk+
	D6PMj5qg3HL0mFm3/++VJzsg8o3u7dO3b+osKoRXTRzEZW7RuJdcWaFBv/yKo811KjQY
	YVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5xRTSXI84/vnYZGEgQ+2LVMnfFF+9wY833qrIEjcxXc=;
	b=aPkmJ3R7CXh2wIvPq7eynieEVZIaMrk9ff9IAdmflmPiqVfDPzaztSNqXEL7AXVAN9
	IQ4GlBAGuMJLH+Onqad5uAXJFRBqZmXVeVarCQyJ+aOqkCWJviqHbfm+xFjsF7BAeftY
	4xe1uy1QygRafFD4e1lO/Go09AyabmIuKw8zmvO4bN8Xk3+2LunQD5JEDR2iUEJMHF2u
	AaZ3aoDZcWD7Ea2l65uXBv5RjCRWZ+zvMF2EZY1HHtejooL/10b+CABbyJ9vm0kbfEcj
	nVqrAqcv2YR3rM7dZDAiuAp7E6kbPnkbfxXXIQ75f/ovPaa4g1R0QsE7zP6pNgxi61cf
	KCVg==
X-Gm-Message-State: ANhLgQ33CaHBac2JpnO9TaADsTuT3o1VUs+g/fZDi/n9hpgu5mB4+Fzh
	1ka0Evk55cdgh9R7AUJzw2lP/VH9
X-Google-Smtp-Source: ADFU+vsx4dxQV/Bl+Cie+ADdcdk9a3lcSOO9j7E44yt+f2HCGOyn4Q4uXm+3FoOLLUBUHj+kF9z6DQ==
X-Received: by 2002:a63:551a:: with SMTP id j26mr9780469pgb.274.1583611425139; 
	Sat, 07 Mar 2020 12:03:45 -0800 (PST)
Received: from desktop.ice.pyrology.org
	(static-50-53-74-115.bvtn.or.frontiernet.net. [50.53.74.115])
	by smtp.gmail.com with ESMTPSA id
	h95sm13539617pjb.48.2020.03.07.12.03.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 12:03:43 -0800 (PST)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat,  7 Mar 2020 12:03:30 -0800
Message-Id: <20200307200330.23915-1-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kernel.bbclass: fix SOURCE_DATE_EPOCH for non-git kernel builds
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
X-List-Received-Date: Sat, 07 Mar 2020 20:03:45 -0000

From: Christopher Clark <christopher.w.clark@gmail.com>

Only use git to set SOURCE_DATE_EPOCH if ${S} is the top level of a git
repository.

Fixes the following errors with the prior logic when building a kernel
that is not obtained from a git repository:

1. With TMPDIR set to a directory outside any git repository on a
mounted filesystem, reproducible builds fail in do_compile with this git
error:

  fatal: not a git repository (or any parent up to mount point <abspath>)
  Stopping at filesystem boundary (GIT_DISCOVERY_ACROSS_FILESYSTEM not set).

aborting before the error handling logic.

2. With TMPDIR located within a subdirectory of a git repository, the
SOURCE_DATE_EPOCH timestamp would be that of said repository rather than
that of the kernel.

Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
---
 meta/classes/kernel.bbclass | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 0eadd3efb8..2603f24709 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -296,10 +296,14 @@ kernel_do_compile() {
 		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
 			olddir=`pwd`
 			cd ${S}
-			SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
-			# git repo not guaranteed, so fall back to REPRODUCIBLE_TIMESTAMP_ROOTFS
-			if [ $? -ne 0 ]; then
-				SOURCE_DATE_EPOCH=${REPRODUCIBLE_TIMESTAMP_ROOTFS}
+			# This kernel dir is not necessarily a git repo and we
+			# must ensure that git does not incorrectly query a
+			# repository in a parent directory.
+			GIT_TOP=`git rev-parse --show-toplevel 2>/dev/null || echo ""`
+			if [ "${S}" = "${GIT_TOP}" ]; then
+				SOURCE_DATE_EPOCH=`git log  -1 --pretty=%ct`
+			else
+				SOURCE_DATE_EPOCH="${REPRODUCIBLE_TIMESTAMP_ROOTFS}"
 			fi
 			cd $olddir
 		fi
-- 
2.17.1


