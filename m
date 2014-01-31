Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f42.google.com (mail-la0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7EC5B6EABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 09:30:16 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id hr13so3330394lab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2014 01:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=3nsK/WOgXZlBNyX8w7rEXR+261pQoBVXeurckZVumEQ=;
	b=mTfkJQ4L1MEPpRM2UEnih1KWvV3yftO/Oot9iWs4oxdCrrL0gfNftW4sbHxycaJXTc
	T17Xu4ij2abqLpaL/9qtNsLFeB5X8ShmCL1S3RZAhSQ7ljVA8CExxjs1Em8xEL3+aiYI
	Jv+Wus6OZ/VTQ4J4eF8OKF/KPAZnhX1YoRjVU+kKjK5yf1jlF1DH/5dhJmT90weQ9bxf
	ZjEIfH5loQ6XGAh4vvIG/bXju+L57x8hWSqqi4/SVtvXOLqdDmyrWPIl5BWktkviJqlW
	7ITQf9aB7+pPgxR7U/Of9xb3BVEkuafy8gfTPZCGvApks25QVoN5XCh3mBYpqz9VEwtX
	lUwQ==
X-Received: by 10.112.14.1 with SMTP id l1mr1207018lbc.39.1391160615686;
	Fri, 31 Jan 2014 01:30:15 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id gb8sm9502607lbc.13.2014.01.31.01.30.13
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 Jan 2014 01:30:14 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 699B01C601A; Fri, 31 Jan 2014 10:30:08 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Jan 2014 10:30:00 +0100
Message-Id: <1391160604-23629-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
References: <1391160604-23629-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/5] postinst-intercept: New recipe to include postinstall intercepts in nativesdk
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
X-List-Received-Date: Fri, 31 Jan 2014 09:30:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding ability to use postinstalls intercepts in the nativesdk env, and
making sure the correlate between repo + SDK.

This to enable rootfs generation from a package repository using only a
package repository and the toolchain tarball.

See https://github.com/nysan/rootfs-sandbox for examples.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 .../postinst-intercept/postinst-intercept_1.0.bb      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb

diff --git a/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb b/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
new file mode 100644
index 0000000..41b9a6e
--- /dev/null
+++ b/meta/recipes-devtools/postinst-intercept/postinst-intercept_1.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Postinstall scriptlets"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+FILES_${PN}_append_class-nativesdk = " ${datadir}/postinst-intercepts/*"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install_append_class-nativesdk() {
+	install -d ${D}${datadir}/postinst-intercepts
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/postinst_intercept ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_font_cache ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_icon_cache ${D}${datadir}/postinst-intercepts/
+	install -m 755 ${COREBASE}/scripts/postinst-intercepts/update_pixbuf_cache ${D}${datadir}/postinst-intercepts/
+}
+
+BBCLASSEXTEND = "nativesdk"
+INHIBIT_DEFAULT_DEPS = "1"
-- 
1.8.3.2


