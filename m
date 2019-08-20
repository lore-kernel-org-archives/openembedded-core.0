Return-Path: <prvs=1282fa9f8=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 826C36BA11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1566289158; x=1597825158;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=Wldk6lI2+r8dJQRL5KeQa0PTspzfuFrlcem9+AJg0Nw=;
	b=AQANfZOGlw17ot39HvKcmyJHSMh6IQQ1a7eSovtd+yrCDZnPeu9AQ8EV
	mLFWwnFwm5F7t3GXKyN8WcewvwVWyGz5Dx35N42P1N4sbPtIbAtV4cs8g
	XnvdDzeGTHYyy4Pb4EQvVn6rm4hVoXS4WuTxl+p0KhclyHBNaLVCymAZp
	6N/dg1z03JA5MPFGHeC5glf/KRN72mAcqS6JDae6/qt0nz4UK9HatGYQL
	An2LSOftGX7Oya45AdAJ5Mm+GkSyz24YSW/mFpx2iZ+Kms+4nNAKrqj3W
	GUB2Uc0oShRm308PRUd/i/W1cXyX2Z82IYyAF5bD+/dTCtGibEV9YbJVK A==;
IronPort-SDR: YGBXWSy4TaTFVmbmLLvTg+Oo+FAi3Ta1rfMchCe0fMmmiW0jsdbYegTFcaOUNwffOELXSc+R52
	zkEAoxH1jA3kvF21TqfdxkeZf+OMfaVuoYJoof7NflNs64rtSIg1kPR72nfRJlEXcpua5Sr6N9
	vgWdG8+6GB3L70a5m2UvT2NQzXzy2wIdhek/G7XRbg5w/GJ/58MaC1OSauZYLbX8f177Di9MlQ
	zhAXko1jEuYjCJcorvZdx2FfIwaFBiewC7/36HTnzmutF9i1u2Kuhx0vroUyDSXo8oYn7MJo6n
	Ghg=
X-IronPort-AV: E=Sophos;i="5.64,408,1559512800"; 
   d="scan'208";a="2294809"
From: Richard Leitner <richard.leitner@skidata.com>
To: <akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 10:19:02 +0200
Message-ID: <20190820081902.12426-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [warrior][PATCH v2] dpkg: Use less as pager
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
X-List-Received-Date: Tue, 20 Aug 2019 08:19:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Debian traditionaly uses /usr/bin/pager as the system pager, which is a
link to the user preferred pager. This is a Debianism.

Without this patch:

root@qt5122:~# dpkg -l
sh: pager: command not found
dpkg-query: error: showing package list on pager subprocess returned error exit status 127

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
CHANGES v2: fix merge conflict
---
 meta/recipes-devtools/dpkg/dpkg/pager.patch | 21 +++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb   |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/pager.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/pager.patch b/meta/recipes-devtools/dpkg/dpkg/pager.patch
new file mode 100644
index 0000000000..e56b9d28af
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/pager.patch
@@ -0,0 +1,21 @@
+pager: Use less instead of pager
+
+pager is a Debianism. Istead use directly pager.
+
+Upstream-Status: Inappropriate [OE-Core integration specific]
+
+Suggested-by: Burton, Ross <ross.burton@intel.com>
+Signed-off-by: Ricardo Ribalda <ricardo@ribalda.com>
+diff --git a/lib/dpkg/dpkg.h b/lib/dpkg/dpkg.h
+index 2bb067a..6cbce80 100644
+--- a/lib/dpkg/dpkg.h
++++ b/lib/dpkg/dpkg.h
+@@ -95,7 +95,7 @@ DPKG_BEGIN_DECLS
+ #define MAXUPDATES         250
+ 
+ #define DEFAULTSHELL        "sh"
+-#define DEFAULTPAGER        "pager"
++#define DEFAULTPAGER        "less"
+ 
+ #define MD5HASHLEN           32
+ #define MAXTRIGDIRECTIVE     256
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index c3dbda77a4..e6083e2219 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://pager.patch \
            "
 SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.21.0


