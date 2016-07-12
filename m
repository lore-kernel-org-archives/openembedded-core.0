Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CA9C66067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 17:10:23 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id g202so1454370pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 10:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=aFaLjgorvL1nLDR1GRNCSufCmoaeRnoiqr+2QFB8hxQ=;
	b=sJFXJgVaYi6Z11QuGbzjXiX7yBYU7G33mRQiRp5At0fordw//QOn0D2o+iVVD+DsHv
	fB2foYjCrQ7S8PGP/g8BSjpEWXOIf2G1D/TNDv+o1uWKE5BY0bw7Zbpnhc26dDYMfeuY
	CWXcWvKW2B+iABfWzzUReG6qij+/XY0rEIO01QrIBRTC+UvFLV4rN0k3NS61DFEFlTbb
	zu9SXyTctZtkx08zF9L/xAxf1eSbhsSyBI2BQFLgff2NMycwnfG8uVFm2ChJAv9TtzWd
	uXkGLfWQs8KsRrvL6Qca0hj2swcPVJsBicfRifv083FGzdKePE7cuBOEYBndmUyZyX05
	F7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aFaLjgorvL1nLDR1GRNCSufCmoaeRnoiqr+2QFB8hxQ=;
	b=mOFKIYJ7hTxcUXdCzqs4NA1Am4Kd5uUb4fvlO2d4r6M+JmkYT3IG8yNtNElbfCsxyz
	9fxMjIXtRxRLgn1+xCeRbG+996jZiqIqkoH8QkKh7k3/PU0rZuCvQDtDycjiYBLHNDFd
	su+ca0WgIkTtaeGU6eaMU5yRmdK6TFjGVBr5nEUJ2mNflEBwLj8upe6VVgHfo4MYBo6W
	nknQ+73iA/HtyOxsvsaDbVwCqQWJHXGlYdEWdJ47waAvRjni/ZmL/7Z0jh9RqFmUBVCs
	JjBAaytwEOmObnbk/pCsVfU0jJNR6llqw0eWzKRbzcCIxf4eNZfV8Kq8GumClKPhw1Xc
	XWjw==
X-Gm-Message-State: ALyK8tIu2DRTtwe+hJgI3XnBhC/JiDyBqZXD5pY42PCZKh/0LaEVliPyEsK4zdFPJK4gxg==
X-Received: by 10.98.135.13 with SMTP id i13mr17558952pfe.44.1468343424173;
	Tue, 12 Jul 2016 10:10:24 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	k78sm4980277pfa.78.2016.07.12.10.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 10:10:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 10:10:17 -0700
Message-Id: <20160712171017.15654-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] db: Use cross libtool
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
X-List-Received-Date: Tue, 12 Jul 2016 17:10:26 -0000

Reintroduce the use of cross-libtool when building the target package
this fails otherwise with clang

| ./libtool --mode=execute true db_printlog
| /usr/lib/libstdc++.so: file not recognized: File format not recognized
| clang-3.9: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 1 +
 meta/recipes-support/db/db_6.0.30.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 6b0e76b..0b51a1d 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -70,6 +70,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX} STRIP=true"
+EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 
diff --git a/meta/recipes-support/db/db_6.0.30.bb b/meta/recipes-support/db/db_6.0.30.bb
index 0852820..072cbdf 100644
--- a/meta/recipes-support/db/db_6.0.30.bb
+++ b/meta/recipes-support/db/db_6.0.30.bb
@@ -87,6 +87,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
+EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
 EXTRA_OEMAKE += "STRIP=true"
 
 do_compile_prepend() {
-- 
2.9.0


