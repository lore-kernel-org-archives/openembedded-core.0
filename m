Return-Path: <jc@vtkloud.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 751D26C7FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 14:49:46 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id kw10so4289091vcb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 07:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bXYnjaAwaWa4y1dPwhljP7MNFdYxQpzkXyIfT71BClk=;
	b=J9rzg6l2b6tQbxPvf2wlXCtYZqCiT8vbw64qWjHG1VjRd32gDz2DaatDLTCruJHp6q
	h0rmV73FfYjS15Ox/zLGZvR89kNsmjXcK3+TW+mCG1dgHN7JxHps85Dg4cmeoqRKeRzi
	bDPu/Njtai/743jH+iSNePGxJyFFBC4G+iIRfYQX78XC1wHJGxG5ONGYyZYNaWj8KaFA
	QqXeH13vhxt50kYNpjb9xYkOwiY0kYk6LYHjogtkcXzfu8nC4DID8zO4QlIY531HytwU
	lJqArl6bGZy/51iiMnt2iQEF7b/hgVhTqcGiK6cMoidBNq53Yfft7x8UPoy1I8QjBWqG
	yLOA==
X-Gm-Message-State: ALoCoQljcAq3yjwFQYkjawb7fidITtkL92Q+l64Jt/aMNk7mGQlEhmK42rTCZ6FCoFFD/41fkN3G
X-Received: by 10.52.116.74 with SMTP id ju10mr27360365vdb.20.1379429387750;
	Tue, 17 Sep 2013 07:49:47 -0700 (PDT)
Received: from mba.csail.mit.edu (31-34-121.wireless.csail.mit.edu.
	[128.31.34.121])
	by mx.google.com with ESMTPSA id n10sm24108723vew.4.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 07:49:47 -0700 (PDT)
From: JC <jc@vtkloud.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 10:49:36 -0400
Message-Id: <1379429376-30184-1-git-send-email-jc@vtkloud.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] libao: add version 1.1.0
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
X-List-Received-Date: Tue, 17 Sep 2013 14:49:46 -0000

This is basically a 99% import of Peter Tworek's recipe from tworaz666@gmail.com found in https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb

Signed-off-by: JC <jc@vtkloud.com>
---
 .../recipes-multimedia/libao/libao_1.1.0.bb        | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
new file mode 100644
index 0000000..08950b5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libao/libao_1.1.0.bb
@@ -0,0 +1,23 @@
+SECTION = "multimedia"
+SUMMARY = "Libao is a cross-platform audio library that allows programs to output audio using a simple API on a wide variety of platforms"
+HOMEPAGE = "https://www.xiph.org/ao/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI="http://downloads.xiph.org/releases/ao/${BP}.tar.gz"
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
+    do_split_packages(d, rootdir, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s', description='AO %s plugin')
+    do_split_packages(d, rootdir_dbg, '^(.*)\.so$', output_pattern='${BPN}-plugin-%s-dbg', description='AO %s plugin debug data')
+}
-- 
1.8.1.2


