Return-Path: <jc@vtkloud.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id BD1EF6BDAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:23:45 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x12so3465867qcv.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 04:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y63CxFI75630G68vnW31bGCrbEGfQ+pFiay/8AN/hog=;
	b=LwwPaU/siSaoarHwQFIPU1sWkTkG9wt2VVrH+Wl/asjzhuf/mqlgV+icjt14RArcfE
	zZyZ8RR8MsfpDU3JbiqCsgUj1nr23BfsRWaksm/r5Tf+tSRO0Z6pJaRXSgQbO6EU3LWq
	Q/BocqNfT+LN8EcUm9Sr035Ci0CxPhUFo43OonuVcoWYFylda3Fw+4SjEpcZqskXDjK+
	SZm2HgxAGO5B4MamwxLGT6choQJwcn+2v7sJ4/MdR3FcM92UJQuL+hOnENJcMwQehSZh
	vRWN5bY45UT4CU0l59a41XbWRdhQugIr57b+29efeEwnhGJBGCzl1PqVM8+dVv+DNibw
	0EhA==
X-Gm-Message-State: ALoCoQnTPc/Qh+E4F2kUVCwPhh/kHF/maToEiuGhz9RpZt52beaegITOwrSCy9J0WjMWL8Q0GMGS
X-Received: by 10.224.88.136 with SMTP id a8mr1535361qam.106.1379417027192;
	Tue, 17 Sep 2013 04:23:47 -0700 (PDT)
Received: from mba.Marriott.com ([12.96.84.3]) by mx.google.com with ESMTPSA id
	j10sm30550687qao.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 04:23:46 -0700 (PDT)
From: JC <jc@vtkloud.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 13:22:59 +0200
Message-Id: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
X-Mailer: git-send-email 1.8.1.2
Cc: JC Verdie <jc.verdie@innotis.org>
Subject: [PATCH] Integration of former (deprecated?) libao recipe from https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb
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
X-List-Received-Date: Tue, 17 Sep 2013 11:23:46 -0000

From: JC Verdie <jc.verdie@innotis.org>

Signed-off-by: JC Verdie <jc.verdie@innotis.org>
---
 meta/recipes-multimedia/libao/libao_1.1.0.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-multimedia/libao/libao_1.1.0.bb

diff --git a/meta/recipes-multimedia/libao/libao_1.1.0.bb b/meta/recipes-multimedia/libao/libao_1.1.0.bb
new file mode 100644
index 0000000..687e773
--- /dev/null
+++ b/meta/recipes-multimedia/libao/libao_1.1.0.bb
@@ -0,0 +1,21 @@
+SECTION = "multimedia"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI="http://downloads.xiph.org/releases/ao/${P}.tar.gz"
+SRC_URI[md5sum] = "2b2508c29bc97e4dc218fa162cf883c8"
+SRC_URI[sha256sum] = "29de5bb9b1726ba890455ef7e562d877df87811febb0d99ee69164b88c171bd4"
+
+inherit autotools
+
+do_install_append () {
+    find "${D}" -name '*.la' -exec rm -f {} +
+}
+
+python populate_packages_prepend () {
+    rootdir = bb.data.expand('${libdir}/ao/plugins-4', d)
+    rootdir_dbg = bb.data.expand('${libdir}/ao/plugins-4/.debug', d)
+    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern='${PN}-plugin-%s', description='AO %s plugin')
+    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${PN}-plugin-%s-dbg', description='AO %s plugin debug data')
+}
-- 
1.8.1.2


