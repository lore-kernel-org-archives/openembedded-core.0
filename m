Return-Path: <nathan@nathanrossi.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2819E7F9AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:47:38 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l4so3153524pjt.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Nov 2019 02:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=iLfdhVnaNV3VUQ/q6CyqdwepeLB7yNuWV8craQl7JRc=;
	b=KHEka/48udhUbZ7xGaad9PoNeL30tWHefPRqFLuveBeLsPsHImc0ezM6rjBxX0n8mW
	2UPsgWopmUIUZa4ZLh6zTyNsIiqKu7daNH6TyEaatxfffsKK9s+7oU9K35nbs5Ixpqfm
	yfQnIpHyM+if8v3pv6Eubqb53Zd/yfKttc09xguag3qo+um7f1wttzYI59gJAc8D4b6M
	JLu4EcoaPTfOFlXs+e0MVi6p45Xt8Hsuij9Ufdf0HQG/vLznV/Cx7cLbZLqD2G9L8J0v
	1z6UlE82wX7H7ROiqNP3pFI3uSkalaYKdiNPc1NqhPoBv2lMcPgggJg05lxqP1pHDvoI
	q9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=iLfdhVnaNV3VUQ/q6CyqdwepeLB7yNuWV8craQl7JRc=;
	b=KmmsNE76DZdXQaNKSrpJoX4PfizidS46iksFpLyGq3KYIZ+us1KpF5ZdN7wBJ4T2HR
	UyhyRgt+gnrBQhdTGE9VlBbZDNc9fEgO5Mw+w84RkRlBlT6BDCsvqB1vd6PaMKlYh5yn
	CYQQod4q/HS0Nbd9r2Xc4KbFa4jNWrrsf+mELbm+/yHqmfktIwYys/g1l52mCe4mEOfo
	nE76iiY9z2NW92liEcOIg2Fa2aZRDglES5WabKo6fPK7W6Q/JFOp1x5q/cCLvquMIQJi
	AooSay8+s9i5juxWmeBT4onFoGvbih5tf9P9YKe96mcE/iEJJiCIZYix/5SL7I7d2sBX
	+VPw==
X-Gm-Message-State: APjAAAVKILbeYg2JhR7cBDH8kcbxzFMFYRMj9vMRXIZY0Ta6oI6oeAz5
	yz77oKNe9iTtdJyKnO4salUGShVs0kg=
X-Google-Smtp-Source: APXvYqxn/aqA9CxrNRx30b/2TMPl6gnmUgSMEz26OEk+6EXb2pwGZBMDk2uv66Z+LU1y6NSre6ql0A==
X-Received: by 2002:a17:90a:d801:: with SMTP id
	a1mr24233855pjv.34.1575110858836; 
	Sat, 30 Nov 2019 02:47:38 -0800 (PST)
Received: from [127.0.1.1] ([101.184.60.82])
	by smtp.gmail.com with UTF8SMTPSA id
	q22sm12631088pfg.170.2019.11.30.02.47.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 30 Nov 2019 02:47:38 -0800 (PST)
Date: Sat, 30 Nov 2019 10:47:24 +0000
Message-Id: <20191130104724.584271-2-nathan@nathanrossi.com>
In-Reply-To: <20191130104724.584271-1-nathan@nathanrossi.com>
References: <20191130104724.584271-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 2/2] gcc: Improve build reproduciblity
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
X-List-Received-Date: Sat, 30 Nov 2019 10:47:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Prevent the gcc embedded checksum from containing a checksum that was
computed with build specific paths. The checksum-options file included
the value of LINKER/LDFLAGS which contains DEBUG_PREFIX_MAP and
STAGING_DIR_TARGET.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
This change along with the previous gcc-target/gcc-cross changes to
handle configargs.h are sufficient to have ReproducibleTests of
oe-selftest pass when 'tools-sdk' is in IMAGE_FEATURES.
---
 meta/recipes-devtools/gcc/gcc-cross.inc  | 7 +++++++
 meta/recipes-devtools/gcc/gcc-target.inc | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 06ba3ccd15..6784d9673f 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -68,6 +68,13 @@ do_compile () {
 	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
 	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
 
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded into
+	# the output binary.
+	oe_runmake TARGET-gcc=checksum-options all-gcc
+	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
+	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
+
 	oe_runmake all-host configure-target-libgcc
 	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c unwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
 	# now generate script to drive testing
diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 987e88d32c..18d078db0a 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -145,6 +145,13 @@ do_compile () {
 	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
 	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
 
+	# Prevent sysroot/workdir paths from being used in checksum-options.
+	# checksum-options is used to generate a checksum which is embedded into
+	# the output binary.
+	oe_runmake TARGET-gcc=checksum-options all-gcc
+	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
+	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/checksum-options
+
 	oe_runmake all-host
 }
 
---
2.24.0

