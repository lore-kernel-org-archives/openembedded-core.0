Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 936A86011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 14:14:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id v63so6836948pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oMbmqL98t8dcMNAS+W8mp86YEcqU7ruq4As7AUW/TKM=;
	b=oo8NEhxtEnHx2JvawV9aU5zZltepTV/QXSOcNldvdcdy99DDTD4MktmvdCoUwD+u0S
	Vk0epgC0rC/pmfuBMoGxYMVJzsORI69DBWFqtZjraJCXDK79p75M+xh/s3Aae1kq5E/b
	ZsbOnZkafDwxWCW2U7RVPKmypAxxTImob9kEnlxLYJAn0K+sk7J8fzG/M2oM8tnXTlNG
	NKmQawp2WxBLOgD33QJuIL1iQDbNrWFa9jAinNtOK8vBThn9QRjD/0r7tGsKnXQXozd9
	MmyW645xlRQ2mOB1HZWHXStlvPedoedstosBNe9b5IU149B5KlxmTECD8ijs6r2CzBfK
	wjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oMbmqL98t8dcMNAS+W8mp86YEcqU7ruq4As7AUW/TKM=;
	b=EqYZo0iSd2KKU2N/xxs9hmptNZhgYvb5LNkMvCywTiZh8VbfqzZUD+YZWWCHaPxLsY
	UEn6PR1R162OUokXuOm7eSXO1piiUudQPbxJHWCVR8PT+04+ixyIxR1iUwEiTsqCjS+q
	W50acjXg2uBxOhQ4nNGvANyizRHyhbPfFaGhKfMWkrHF/XYsNSP5omf4X5Pf+1kHH5GS
	z1VUDC1ysjQRrp1Mk0rhe2oXJaFn+dAfnnAlZWoMzjKj5v6TPhYT679sFhzjsG8yhLoT
	RZDzENndUUNB7xl4H3KaZA9+26Mqamx3xiVabAg8HUC8AFrIhc8zfrEAHywQJoY7zSuV
	eLbQ==
X-Gm-Message-State: ALQs6tBxls2G3QU8yalAgpOkhtxddHWXltURkub1a5rESp7QmU97c6HW
	26czN8/TNITep/uKpiNiLKE+Wg==
X-Google-Smtp-Source: AB8JxZoW2WuoySMnzV95NanX5rhxe63PPqaMK49M76O6hulSFtDjUJlpX/0/YpeCqJpE8J1aGIvU2A==
X-Received: by 10.167.132.204 with SMTP id x12mr1775303pfn.79.1525097700018;
	Mon, 30 Apr 2018 07:15:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	b72sm15781621pfm.69.2018.04.30.07.14.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Apr 2018 07:14:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2018 07:14:53 -0700
Message-Id: <20180430141455.2248-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 25/25] packagegroup: Do not add libssp to SDK
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
X-List-Received-Date: Mon, 30 Apr 2018 14:14:59 -0000

Libssp is only needed on mon-glibc/non-musl systems
Add rpcsvc-proto for rpcgen since its not part of glibc
anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagegroup-core-standalone-sdk-target.bb        |  2 +-
 .../packagegroups/packagegroup-self-hosted.bb         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 43fc599c73..f5b2d69cef 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -13,7 +13,7 @@ RDEPENDS_${PN} = "\
     ${LIBC_DEPENDENCIES} \
     "
 
-RRECOMMENDS_${PN} = "\
+RRECOMMENDS_${PN}_mingw32 = "\
     libssp \
     libssp-dev \
     "
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index adb0c56c3a..f1273e8a17 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -76,9 +76,6 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     intltool \
     ldd \
     less \
-    libssp \
-    libssp-dev \
-    libssp-staticdev \
     libstdc++ \
     libstdc++-dev \
     libtool \
@@ -90,10 +87,16 @@ RDEPENDS_packagegroup-self-hosted-sdk = "\
     quilt \
     sed \
     "
-# glibc-utils: for rpcgen
+RDEPENDS_packagegroup-self-hosted-sdk_append_mingw32 = "\
+    libssp \
+    libssp-dev \
+    libssp-staticdev \
+    "
+# rpcsvc-proto: for rpcgen
 RDEPENDS_packagegroup-self-hosted-sdk_append_libc-glibc = "\
     glibc-gconv-ibm850 \
     glibc-utils \
+    rpcsvc-proto \
     "
 RDEPENDS_packagegroup-self-hosted-debug = " \
     gdb \
-- 
2.17.0


