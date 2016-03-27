Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id E31316072C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Mar 2016 00:45:23 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id tt10so71732365pab.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 17:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=L6l7GO755KONPQqpGQRkLBMMiY107Ap7ylRc99jry5Q=;
	b=RpvbqpRDAMRse4HSqwp8W5Smi2AYqdAy9JTca7qJg0Gt9DJbXPCOI4W3pFxKmnaJae
	MIw/vycNRhruOhoEYC0IuOIKzWQ8+Q6liuBG6z+jeZRcpJTCkyLo7uUNcDNGt/UkElrw
	jb6emQ12AqdeP7KQctWPX4hMTSXX5dyhqH3dsTGAsJHQITgS2Yjy1Jb5zUyi321Cb8Of
	PrdibOSk8/GI7rvxliyEKkUWyd5n98O3TNaNsduTO7Rymx90bYErNPETz+ih8zH9G256
	lWYJx/z6M6pgDl5fL/qqS4/lnQxs6D3ZM7Ovt7EF/2rH2GKpJn0DQ9a6sryUTko/KUhx
	FDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L6l7GO755KONPQqpGQRkLBMMiY107Ap7ylRc99jry5Q=;
	b=fwJf0GOkn5U0O1Bl24gaY7FXGWvJSfhmtAacrR0AKBwpcJzfh8Zs4i4/XPLjAj/OiS
	dBWTHqGMg3xbl2JzZ/KiDmcTC8lkGQcvZld4zK52v7to9pu+J3LRf7b10DqHPY3qFlWi
	QV/iNKTEUBW5N9Nz9egqWSkHv3NP9CpxCI7CdAIjF2vg1qChPgJHCjdMpnEraVK77/U/
	FGCpKjX1/7zCTK4Mr8r9Erf9WTP3VbYSomEuC/vvVDSGFzN7R7g3dwvBL94xy6tS+y/Z
	Qtci3K3rFbXqXe6RwG4Rt3Cz+D+qNFl/VGuYW91PM7yHQDtlyhhZ/XlM0cyjk6dU8bau
	weVQ==
X-Gm-Message-State: AD7BkJIriWaF85VWx4ADBANUPip4IsRvN2ZMMAZ7I1IDeXbnXV5H5CxcRNO9ggf7MrqkWQ==
X-Received: by 10.67.23.161 with SMTP id ib1mr30843828pad.156.1459039524294;
	Sat, 26 Mar 2016 17:45:24 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	l11sm25533774pfb.56.2016.03.26.17.45.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Mar 2016 17:45:23 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Mar 2016 11:44:51 +1100
Message-Id: <1459039491-5480-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] gdb-cross: disable conflicting PACKAGECONFIG variables
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
X-List-Received-Date: Sun, 27 Mar 2016 00:45:24 -0000

The PACKAGECONFIG variables in gdb-common.inc don't work correctly for
the cross recipes so they need to be disabled.

Python support was not being enabled because the python PACKAGECONFIG
added --without-python to OE_EXTRACONF.

The recipe depends on readline-native and the readline PACKAGECONFIG
just adds an unnecessary extra dependency on readline. The
--with-system-readline configure argument is explicitly added
to EXTRA_OECONF to ensure we link to readline-native.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 6e44778..e13462e 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -5,6 +5,11 @@ DEPENDS = "expat-native ncurses-native readline-native python-native"
 inherit pythonnative
 
 EXTRA_OECONF += "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
+EXTRA_OECONF += "--with-system-readline"
+
+# Disable conflicting PACKAGECONFIG variables in gdb-common.inc
+PACKAGECONFIG[python] = ""
+PACKAGECONFIG[readline] = ""
 
 do_compile_prepend() {
     export BUILD_SYS="${BUILD_SYS}"
-- 
2.7.4


