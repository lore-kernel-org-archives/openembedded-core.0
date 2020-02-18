Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id C3BAC601B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 22:02:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id w12so25837330wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 14:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vo0chgsDuUBXNnoFNxaJyyVGtK1L2JPqgxTAMWUWGfM=;
	b=c++89vYbOya5+duMxrzIuUj4f5ozbboh35Bv2qsXCmUJHORBd9pk+73w0BP2SoAQve
	uTx6WS6x8jsU/CRfUYMUszD9tFMmI7rE8H/MV8rniAjbeSCiNrjag6rSypoefiHKsxbM
	TWYP8ORzJ3hN81B8xyGyDmJZeDtElx2M8YRCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vo0chgsDuUBXNnoFNxaJyyVGtK1L2JPqgxTAMWUWGfM=;
	b=E/whSxDN+BRLI9mXAryJ20S+Lg0V49wSgdqiJ/W2J/71PlPEjBT23eFIv3/V9P3jEr
	zk4RpppTMuhJ8UOy/pIXvTV0KJnSy5/Lrucf29NARGCDV8lZIagCDr4qp8eC8iRx9s0r
	8A2xC63/1fYLs4W3z4vzeRGtMrj7eZQpVR18r27izyH9OBzW84dm2GssLot+31yvkTlv
	XfYsaf8GoakNyvGKcYiHl8PKXIsNx8Lrmn/FlurpSGhVVH9mPBD/pDWj9zrXDbgHSJgQ
	yutjP//bqtrvnm2xdOdB9z4wHydsKBGKmttUVtw7HjWjoOopWJs37Kzd6iFVfk5cv/lB
	ZVGg==
X-Gm-Message-State: APjAAAWmH54nrfkVmwFXH8OX5Di09PVhbzu+Kzyt3pb+omQtqS4EL/Xg
	h+WgsEnForUadQ8wwhh1QFfQNcuQsCo=
X-Google-Smtp-Source: APXvYqyCx/Ove8JukmuMbiQNQvzByR3w1AhmsltufiYzeQo+ImQNrP9PDISUUgNlK4mVcWhgCA+v0Q==
X-Received: by 2002:adf:80cb:: with SMTP id 69mr29899632wrl.320.1582063348995; 
	Tue, 18 Feb 2020 14:02:28 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id o9sm59375wrw.20.2020.02.18.14.02.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 14:02:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Feb 2020 22:02:27 +0000
Message-Id: <20200218220227.75037-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] perl: Fix encode module reproducibility issues
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
X-List-Received-Date: Tue, 18 Feb 2020 22:02:29 -0000
Content-Transfer-Encoding: 8bit

The code is encoding host compiler parameters into target builds. Avoid
this for our target builds. This should resolve builds which aren't
reproducible between hosts with different compilers.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../perl/files/encodefix.patch                | 20 +++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.30.1.bb     |  3 +++
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/encodefix.patch

diff --git a/meta/recipes-devtools/perl/files/encodefix.patch b/meta/recipes-devtools/perl/files/encodefix.patch
new file mode 100644
index 00000000000..396ed0d53e3
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/encodefix.patch
@@ -0,0 +1,20 @@
+The code is encoding host compiler parameters into target builds. Avoid
+this for our target builds (patch is target specific, not native)
+
+Upstream-Status: Inappropriate [Cross compile hack]
+RP 2020/2/18
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: perl-5.30.1/cpan/Encode/bin/enc2xs
+===================================================================
+--- perl-5.30.1.orig/cpan/Encode/bin/enc2xs
++++ perl-5.30.1/cpan/Encode/bin/enc2xs
+@@ -195,7 +195,7 @@ sub compiler_info {
+     # above becomes false.
+     my $sized  = $declaration && !($compat && !$pedantic);
+ 
+-    return ($cpp, $static, $sized);
++    return (0, 1, 1);
+ }
+ 
+ 
diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index 5d762710df3..b37f175f973 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -26,6 +26,9 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
 SRC_URI_append_class-native = " \
            file://perl-configpm-switch.patch \
 "
+SRC_URI_append_class-target = " \
+           file://encodefix.patch \
+"
 
 SRC_URI[perl.md5sum] = "6438eb7b8db9bbde28e01086de376a46"
 SRC_URI[perl.sha256sum] = "bf3d25571ff1ee94186177c2cdef87867fd6a14aa5a84f0b1fb7bf798f42f964"
-- 
2.25.0


