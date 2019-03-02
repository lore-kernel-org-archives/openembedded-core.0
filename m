Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 542267CCB7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 16:53:09 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y15so932699wma.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 08:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=VrZAeHgycTLMFtUFeepyuk0qtmtvTjJpWp462UQ9Pgk=;
	b=e3Y3uiQatRn42HPfI+spZ6i2H0BULSHCyBjYNgZ+qqjd/0N2CyXUMgZf9tQdSqULpj
	7jxm5E8HknfwF1ylG7dW2YwcovonOUjpg0YHWqktCE4gF8YaAkt3uXj40tSJwSsMEm9Z
	AYxPSx0cLvxJEvg17J+90NYg0bI9CtQYiL/h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=VrZAeHgycTLMFtUFeepyuk0qtmtvTjJpWp462UQ9Pgk=;
	b=pfU5KJ/nvcd1SiN5xwtTw+c2pBP1ho0Bo66tlnEAlc396bTzR+NuAT68X3ya/YPtP/
	f7V55iV9BMhK8NJjudZCYBD00/OOLIArb4qunTcqF1faeflzoWYFBfHtC8KQa4OjHR0U
	OG4yc7/oAyryf/XhMYIGLgwkGgtzVwr+4RK+YbMNd2YBznXVjC/D8n8VyIefQ+rBLEQw
	9uyRS34Ve0h5qB07Aqy8Uq8DMyeK8HWlu0Z/QyU8yAaiDG7msNMGdY66/sdT6BqvTno1
	dZk8IDtXuYq6XVlAppNRGxzF3/u/Qsq+2DniDHV8Pdeywtub1uvGwpVJAyLH7SA+38JD
	hzgw==
X-Gm-Message-State: AHQUAubKJLwUOhBmNbT8rP9k53PUXec9HZ45nD0qxntw4a2aJ/zO6LRF
	X7llUKIK/vVSPnU74ym2lLWSrrDRcMY=
X-Google-Smtp-Source: AHgI3Iaz5K9ZwjT5Qn04DBiknX9/bR0RS6sDvatGyGzsIt7vh3pzDllAmCHcONb3di5Vbcu6fyv9Sg==
X-Received: by 2002:a1c:9684:: with SMTP id y126mr6653195wmd.124.1551545589644;
	Sat, 02 Mar 2019 08:53:09 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e193sm2046103wmg.18.2019.03.02.08.53.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 08:53:08 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2019 16:53:07 +0000
Message-Id: <20190302165307.4290-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190302165307.4290-1-richard.purdie@linuxfoundation.org>
References: <20190302165307.4290-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] selftest: Add multiconfig test
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
X-List-Received-Date: Sat, 02 Mar 2019 16:53:09 -0000
Content-Transfer-Encoding: 8bit

Add a test for a multiconfig build which mixes tiny and musl builds
along with using the mcextend class to combine and package multiple images
into another image. This gives the multiconfig a decent test in a scenario
users may use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../multiconfig-image-packager_0.1.bb         | 25 +++++++++++
 meta/lib/oeqa/selftest/cases/multiconfig.py   | 43 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta-selftest/recipes-test/mulitconfig/multiconfig-image-packager_0.1.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/multiconfig.py

diff --git a/meta-selftest/recipes-test/mulitconfig/multiconfig-image-packager_0.1.bb b/meta-selftest/recipes-test/mulitconfig/multiconfig-image-packager_0.1.bb
new file mode 100644
index 00000000000..ad18d865c82
--- /dev/null
+++ b/meta-selftest/recipes-test/mulitconfig/multiconfig-image-packager_0.1.bb
@@ -0,0 +1,25 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+MCMACHINE_virtclass-mcextend-musl = "qemux86-64"
+MCMACHINE_virtclass-mcextend-tiny = "qemux86"
+MCIMGTYPE_virtclass-mcextend-musl = "ext4"
+MCIMGTYPE_virtclass-mcextend-tiny = "cpio.gz"
+
+MC_DEPLOY_DIR_IMAGE = "${TOPDIR}/tmp-mc-${MCNAME}/deploy/images/${MCMACHINE}"
+
+do_install[mcdepends] += "multiconfig::${MCNAME}:core-image-minimal:do_image_complete multiconfig::${MCNAME}:virtual/kernel:do_deploy"
+
+do_install () {
+    install -d ${D}/var/lib/machines/${MCNAME}
+    install ${MC_DEPLOY_DIR_IMAGE}/core-image-minimal-${MCMACHINE}.${MCIMGTYPE} ${D}/var/lib/machines/${MCNAME}/core-image-minimal.${MCIMGTYPE}
+    install ${MC_DEPLOY_DIR_IMAGE}/bzImage ${D}/var/lib/machines/${MCNAME}
+}
+
+python () {
+    mcname = d.getVar('MCNAME')
+    if not mcname:
+        raise bb.parse.SkipRecipe("Not a multiconfig target")
+}
+
+BBCLASSEXTEND = "mcextend:tiny mcextend:musl"
\ No newline at end of file
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
new file mode 100644
index 00000000000..3c36f6e5d2e
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -0,0 +1,43 @@
+import os
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake
+import oeqa.utils.ftools as ftools
+
+class MultiConfig(OESelftestTestCase):
+
+    def test_multiconfig(self):
+        """
+        Test that a simple multiconfig build works. This uses the mcextend class and the 
+        multiconfig-image-packager test recipe to build a core-image-full-cmdline image which 
+        contains a tiny core-image-minimal and a musl core-image-minimal, installed as packages.
+        """
+
+        config = """
+IMAGE_INSTALL_append_pn-core-image-full-cmdline = " multiconfig-image-packager-tiny multiconfig-image-packager-musl"
+BBMULTICONFIG = "tiny musl"
+"""
+        self.write_config(config)
+
+        muslconfig = """
+MACHINE = "qemux86-64"
+DISTRO = "poky"
+TCLIBC = "musl"
+TMPDIR = "${TOPDIR}/tmp-mc-musl"
+"""
+
+        tinyconfig = """
+MACHINE = "qemux86"
+DISTRO = "poky-tiny"
+TMPDIR = "${TOPDIR}/tmp-mc-tiny"
+"""
+
+        multiconfigdir = self.builddir + "/conf/multiconfig"
+        os.makedirs(multiconfigdir, exist_ok=True)
+        self.track_for_cleanup(multiconfigdir + "/musl.conf")
+        ftools.write_file(multiconfigdir + "/musl.conf", muslconfig)
+        self.track_for_cleanup(multiconfigdir + "/tiny.conf")
+        ftools.write_file(multiconfigdir + "/tiny.conf", tinyconfig)
+
+        # Build a core-image-minimal
+        bitbake('core-image-full-cmdline')
+
-- 
2.20.1


