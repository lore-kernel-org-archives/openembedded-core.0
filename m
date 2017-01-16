Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C6FC71B26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:17:42 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 75so5492620pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=onXVwK3j5VmSodvlMaUy/Vig7tw6I1QJ04hmf29YmZk=;
	b=AHjFl7lniKNEfWaCMVgpBFGXb5D+4k+rno3q+c/3zlGuVzH+eP/Ykgd7wyZuZ+CIQu
	JMMVSSIpWiUFn1O7GHlKq1Hv5m1+ZEeQfymIVNGYi1gk84G6IzAy1NceBvTCqLqRgWNN
	LJHLVbSzp4kuw4p0/rMN92yKeekVavDBHO9LqtfjRbXcF99RGnD1o6TM0bQaQQGsSXVR
	kcj5kgWb61I6wgKuv5h8pJvAZ5BEe87CMf7pctix/i1qp15M9VPvBWwXfu1L7z6YmNMK
	nUehXmC7RbFhjBMIxEeifpVdQy2IrWB703az/KKp515IOzVGHFTqj6HynxlPxaCYaN1b
	ajQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=onXVwK3j5VmSodvlMaUy/Vig7tw6I1QJ04hmf29YmZk=;
	b=KlmOkvm6GOC76z1CO+CucssUvZW98x2SQkjvyvVaB2+sgQm6MZnV/8y8fI1vxcIC25
	oUa/s6Az9cya8SsynwMOeeePu4c/W0l9NgWb+itBP4piViWGEqkgjnLmqMz7dQPEZfd+
	iKR/Rcs99L90DLqlybrsmfvMQHC2tyvVgyyZJepO7b/SyRJCPoSYjkXQ3/sfqRe3nG5a
	yjdvduQlOQJlgzqB3h9iELQx5Zf2LoN2bR7xWLl78JJHS/3P30TXa6rPhiKszW4aXf0Z
	kQqsS3ch5ydqJL48L7zXE9HlK1S8qztrD3s4brSwQmkzoQcw3BoQMHR7BEcY9VkVyr0p
	ATMQ==
X-Gm-Message-State: AIkVDXIT0XgP8l4RZfVqk8FtYxfwcgHSrSPjbZXKqD/yViYQrac6BUoT3f7mUAlyauBEoQ==
X-Received: by 10.84.225.150 with SMTP id u22mr51408438plj.157.1484576262600; 
	Mon, 16 Jan 2017 06:17:42 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	u29sm18617117pfl.17.2017.01.16.06.17.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:17:42 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-24-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 24/30] libgcrypt.inc: Add patch to resolve configure bug for mingw32
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
X-List-Received-Date: Mon, 16 Jan 2017 14:17:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Resolve bug with the generation of the versioninfo.rc file which depends
on the BUILD_REVISION being set during configure. The BUILD_REVISION is
unset when building against tarball source due to no git repository
information. This patch sets the BUILD_REVISION to 0 when no information
is available.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 ...c-Set-mym4_revision-to-0-if-not-a-git-rep.patch | 46 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch

diff --git a/meta/recipes-support/libgcrypt/files/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch b/meta/recipes-support/libgcrypt/files/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch
new file mode 100644
index 0000000000..b7b407ab4b
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch
@@ -0,0 +1,46 @@
+From bb6f9e18b5ccef26978f3f3ed2fe7bf3d4d498e7 Mon Sep 17 00:00:00 2001
+From: Nathan Rossi <nathan@nathanrossi.com>
+Date: Fri, 30 Dec 2016 18:02:26 +1000
+Subject: [PATCH] configure.ac: Set 'mym4_revision' to 0 if not a git repo
+
+---
+It is possible for the source to not be located in a git repository
+(e.g. source is from a tarball). In which case the git repository
+information is not available. This results in the mym4_revision being an
+empty string however this value is used in BUILD_FILEVERSION where it is
+assumed to be 4 decimal values. Additionally BUILD_REVISION uses this
+value and is also assumed to be non-empty.
+
+In the case of BUILD_FILEVERSION it is used in versioninfo.rc.in, where
+it must be populated as 4 decimal values due to the expected syntax. In
+cases where it is not (e.g. when BUILD_FILEVERSION = '1,7,5,' a syntax
+error is raised.
+
+    windres: versioninfo.rc.in:21: syntax error
+
+This patch changes mym4_revision so that if the 'git rev-parse' returns
+non-zero (e.g. not in a git repository) the value falls back to '0'.
+This propagates as '0' to both BUILD_FILEVERSION and BUILD_REVISION.
+
+Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
+Upstream-Status: Submitted
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 31c0d553fa..a3deffa6e9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -39,7 +39,7 @@ m4_define(mym4_version_micro, [0])
+ m4_define(mym4_version,
+           [mym4_version_major.mym4_version_minor.mym4_version_micro])
+ m4_define([mym4_revision],
+-          m4_esyscmd([git rev-parse --short HEAD | tr -d '\n\r']))
++          m4_esyscmd([(git rev-parse --short HEAD || printf '0') | tr -d '\n\r']))
+ m4_define([mym4_revision_dec],
+           m4_esyscmd_s([echo $((0x$(echo ]mym4_revision[|head -c 4)))]))
+ m4_define([mym4_betastring],
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 483b92e157..3ef02ee994 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
            file://fix-undefined-reference-to-pthread.patch \
+           file://configure.ac-Set-mym4_revision-to-0-if-not-a-git-rep.patch \
 "
 
 BINCONFIG = "${bindir}/libgcrypt-config"
-- 
2.11.0


