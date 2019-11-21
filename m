Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D97C87F8AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 15:02:10 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 8so4103859wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=apaNvwfna+ckyMjKyltusAbQAPFDrXlQt5Lq22wIV5o=;
	b=KtLG55hHZJKdfMOwZsGJoWI5+FVeYb3PDY9Md8m+OHbB2rRnlWgNM+8yMNKnO/KPG2
	n6yE0G+uUdTYzrKGA1P9yV5Y93wnbUPDcr2tHD8bQn/LM3nYEvM1GiijbOotlA97hrfw
	geP/VONKn22ckDmrR4fLFOZ47Vj6Bhpp1yfik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=apaNvwfna+ckyMjKyltusAbQAPFDrXlQt5Lq22wIV5o=;
	b=R4t4coVgMXfti14I6kaaXjfQP00yXEJjjSg6jMZH43M5qYp5+0nAnPnJ8jYG/WUaCM
	vAPh73fQwx9OPOYE9hlJHy9qWQCiR8rXp9y9HeRm8qC37WZ/Ji/qeNQql/8aIIQpvxD9
	XkVALNOeGlExGi3NTfgbnWBXo1K4ue+QhAXEuL7zuMI6wIaY34nbj/szyqmOieYytQnu
	QwazSI6CwJgmKk/ISo8+dji1psWQQo3pCBTT4QHUKSGjj8TYePcX4jUVGZA8ERBvEDPF
	YCbnhVdm5f+K0YAPUxbmvCamGgK6vaze6nVX17WyaU51fhDiWY22HJuxBlnXOdX3RvQ6
	x1Mg==
X-Gm-Message-State: APjAAAVYGGl2uP6P+lcprs5j9TWAhv473VRpqMbqslNVqja9JDdi2Uj4
	bKzu9b88CuRZBAZAhy11NH17OXyg3CE=
X-Google-Smtp-Source: APXvYqyznUGMzb5M4+AxMXSCyr4RyNUz4PPUEjJlepm81w+wwXn06oYmyq6ZPbE6ry7We1nt4PECBg==
X-Received: by 2002:a1c:6144:: with SMTP id v65mr10801376wmb.53.1574348531152; 
	Thu, 21 Nov 2019 07:02:11 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	x6sm3805297wrw.34.2019.11.21.07.02.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 07:02:10 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2019 15:02:06 +0000
Message-Id: <20191121150207.3657-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/3] opkg-utils: Fix silent empty/broken opkg package creation
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
X-List-Received-Date: Thu, 21 Nov 2019 15:02:11 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../opkg-utils/opkg-utils/pipefail.patch      | 31 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.4.1.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
new file mode 100644
index 00000000000..55ddcc1fd20
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/pipefail.patch
@@ -0,0 +1,31 @@
+We need opkg-build to fail if for example the tar command is passed invalid 
+options. Without this, we see silently created empty packaged where data.tar
+is zero bytes in size. This creates hard to debug problems.
+
+An example is when reproducible builds are enabled and run on old hosts like
+centos7 which has tar < 1.28:
+
+Subprocess output:tar: unrecognized option '--clamp-mtime'
+Try `tar --help' or `tar --usage' for more information.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: opkg-utils-0.4.1/opkg-build
+===================================================================
+--- opkg-utils-0.4.1.orig/opkg-build
++++ opkg-utils-0.4.1/opkg-build
+@@ -1,4 +1,4 @@
+-#!/bin/sh
++#!/bin/bash
+ 
+ : <<=cut
+ =head1 NAME
+@@ -12,6 +12,7 @@ opkg-build - construct an .opk from a di
+ #   Updated to work on Familiar Pre0.7rc1, with busybox tar.
+ #   Note it Requires: binutils-ar (since the busybox ar can't create)
+ set -e
++set -o pipefail
+ 
+ version=1.0
+ 
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
index cf1e4670c65..2e6e0f2760e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.1.bb
@@ -10,6 +10,7 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV}.tar.gz \
            file://0001-Switch-all-scripts-to-use-Python-3.x.patch \
            file://0001-opkg-build-clamp-mtimes-to-SOURCE_DATE_EPOCH.patch \
+           file://pipefail.patch \
 "
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
 
-- 
2.20.1


