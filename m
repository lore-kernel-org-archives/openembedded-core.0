Return-Path: <prvs=1249fc27b=Richard.Leitner@skidata.com>
X-Greylist: delayed 429 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 Aug 2019 09:41:37 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE567DB50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 09:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1565948499; x=1597484499;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=tbC/UwFh5uf3zW4NRaSg2WUfsaKff+o62EgTY2JPDt8=;
	b=roz3hlOucUSFY7buy1WDtQJig81GPUlrrjwYQ34k3B9YusN+L8Yg3xyl
	jfikOnz2e7dCVr88LZaleS4cgbo2PYsxVJIx5zl6duzDlgF5Rh3dLjKFY
	wnJA+igR3n1r2uIrQPqH7uU6YpYwDeZidfPJY+QClGEWU8IO/Mt8YiudD
	EYYm6PScUBkk01cs6TMnenFhUhsFbx32LSnMrMbeb9gV4hSaj9ELUPRFe
	XAE37l304Nr7TIfDEVzBAH70/GZ9bDdqYQVAVSSloWGrBOSQ6o6Yt0Z5P
	PIJpO1pl9PnKwkUA51EQr4eSYbqMr1Gjvn/QrpGCZ5hibZU1AiFKJ6Cge Q==;
IronPort-SDR: IwRl+7RrGGXOdw2eFlnk4NbAKABDozk6XXippOoRr0uRWKbt7eq1tybvLBt4/+rPWco9davOTF
	mpe58uqz0rF/3pIdxyyAD808J8yLMLpnP21mb6uVBDpHJzfU12CGSIH6wQxP187lIne4Ewn/L1
	CCI6jeb7yrCWGVoHkYj4cS5stJg0pmv1EZ7GMovBN/u+7/EnSxjyHorPwCQOEobxjL75lo3RKc
	n7r71qSZ0mXT3XnVZt9gL/eqy1Zqb91XDRpk6u3vJiJDeLp/vqbXwOPDWgg261RIsg/OLwDxUy
	T4k=
X-IronPort-AV: E=Sophos;i="5.64,391,1559512800"; 
   d="scan'208";a="2291019"
From: Richard Leitner <richard.leitner@skidata.com>
To: <akuster808@gmail.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2019 11:33:49 +0200
Message-ID: <20190816093349.20672-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [warrior][PATCH] dpkg: Use less as pager
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
X-List-Received-Date: Fri, 16 Aug 2019 09:41:38 -0000
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
index 77fbfb5c91..b83868fec0 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
+           file://pager.patch \
            "
 SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
-- 
2.21.0


