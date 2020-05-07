Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
 by mx.groups.io with SMTP id smtpd.web10.6045.1588858411543672563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 06:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=XXjfEunu;
 spf=pass (domain: pr.hu, ip: 87.242.0.9, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeY-0006OF-4b
	for openembedded-core@lists.openembedded.org; Thu, 07 May 2020 15:33:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M4ySEuvAJh32X9Aw6+r08SXPsoFMd2e8UVCpswwqFgY=; b=XXjfEunuH/AegWxQ8yYSkGFs+m
	YgvVD/wGRl5DGlg+1CHfgUVbtq0emiVtZhyeS3sijnzAp1PNeKdhSGuU98NZAAwgU7zK0cHBgBoTX
	n3d3W81EE8AaMYNcbVQ+mqCUxuEBPMm/RG3tk82tII376xbHW0f7b3XotezxI1sAaM042qAmRT6lW
	hXlF1xHVMDKaBdMRTO1HNh9e68GxJSA2Zk72PTw4iWxXCz/kORhG9W5rW0zsp8i5nClPtlE3Jw81X
	sNfKNIOjLO+N3FjX/cYlwZyM+04AfPNNdMi60IJ3baMj0Wd0khLsg7xgjuQF8DspUp/7OL3+IECTS
	5LchdAJQ==;
Received: from host-87-242-33-197.prtelecom.hu ([87.242.33.197] helo=zolilaptop.sicom.com)
	by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1jWgeT-00055M-SK; Thu, 07 May 2020 15:33:28 +0200
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
Subject: [PATCH v3 2/4] libva-initial: New bootstrap recipe
Date: Thu,  7 May 2020 15:32:59 +0200
Message-Id: <20200507133301.4336-3-zboszor@pr.hu>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507133301.4336-1-zboszor@pr.hu>
References: <20200227052448.65435-1-zboszor@pr.hu>
 <20200507133301.4336-1-zboszor@pr.hu>
MIME-Version: 1.0
X-Spam-Score: -1.0 (-)
X-Scan-Signature: f27674dcb73dc349b62d57623b8ab406
X-Spam-Tracer: backend.mail.pr.hu -1.0 20200507133328Z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mesa needs libva.pc and libva headers to enable the VAAPI
state tracker and drivers.

This recipe is a variant of the full libva package build as in:
* it only depends on libdrm to build so it doesn't introduce
  the circular dependency between mesa and libva, and
* it doesn't include the libraries in the final package.

However, there is another issue with build dependency handling
in Yocto. libva depends on mesa and mesa depends on this package.
Any package that depends on libva therefore would pull in libva
and this package resulting in an error in the prepare-sysroot
phase because they would install identical files into the
per-recipe sysroot.

Using the package name "*-initial" avoids this because of the
interaction between sstate.bbclass and staging.bbclass: any
package with the pattern "*-initial" in the name is excluded
from the dependency list unless explicitly added to DEPENDS.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---
v2: The include file is not versioned, more verbose commit message
v3: Rebased to current master

 meta/recipes-graphics/libva/libva-initial_2.6.1.bb | 9 +++++++++
 meta/recipes-graphics/libva/libva.inc              | 4 +++-
 2 files changed, 12 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libva/libva-initial_2.6.1.bb

diff --git a/meta/recipes-graphics/libva/libva-initial_2.6.1.bb b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
new file mode 100644
index 0000000000..a3b04eb02a
--- /dev/null
+++ b/meta/recipes-graphics/libva/libva-initial_2.6.1.bb
@@ -0,0 +1,9 @@
+require libva-${PV}.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
+SRC_URI[md5sum] = "aef13eb48e01a47d1416d97462a22a11"
+SRC_URI[sha256sum] = "6c57eb642d828af2411aa38f55dc10111e8c98976dbab8fd62e48629401eaea5"
+
+do_install_append () {
+	rm -f ${D}${libdir}/*.so*
+}
diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index e03451240c..ac39e92de7 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -16,7 +16,9 @@ BUGTRACKER = "https://github.com/intel/libva/issues"
 SECTION = "x11"
 LICENSE = "MIT"
 
-SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/${BP}.tar.bz2"
+SRC_URI = "https://github.com/intel/libva/releases/download/${PV}/libva-${PV}.tar.bz2"
+
+S = "${WORKDIR}/libva-${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/intel/libva/releases"
 
-- 
2.26.2

