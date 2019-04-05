Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id AB7737D315
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 19:28:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id z24so8392400wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 12:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CmzL7+tEmIWmCgUZ6aPuXiEdUVIyUnoJ2LZwCU3VaFU=;
	b=Oj9ZkYUkp2ipRa30HoWr0p/pIZyBIn51USGppR0Vz/+SdaPoX7RSHYnZz3bYFMZkpG
	H4etIP6gxDo2gAv13dZ5HusWaNTxawh/8Q67i+3m/Cv8YQPwGLkARwBy4cwMbq5cjHyG
	k5HYEFxoGJ/CjDLTXMVI+03ADm62h4dA7Zt/bQa6fx61p8Q/IZOKS2c5zpVqCo9dR6qn
	9G+bNWnjA+t9px0JdJu0wgVHHMK8nYpJNC/7fihbkozr+aRliZzRsHEe1P1jYJxDW/3n
	XtWnYh0go2V8maL4BkfAk9sf4UGUe+hv7WT3RqHKwziUZyL2EKW5yQQk7K630Ck2EGDn
	t23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=CmzL7+tEmIWmCgUZ6aPuXiEdUVIyUnoJ2LZwCU3VaFU=;
	b=lhpt81H1lHZxRfKlVvGWyrIALcdBWZZdx8KrNVSqRrsxC8JsB8cBoqmygi6R3i7QoA
	RtWinP3923uAhznx6Rholifyi6jExy+OETjl2Xg5CD0NK5eyVln7fw7YdxBH38elll0v
	OC/mLSquKXKMBTRUvZh/CcSy9Nf8C2igJPSuSfbb7EYM6iqkcBYwR81o3839iFYzQ7GR
	HPwAaqTU5xrzLHLQrSJmPRkWOjPpfyykVpcpLmg4Rdo0GPmLhtnCVZXl+/y74oL/Qi4G
	JQ8PLis69Jh8PlAYv0hdwi8gzonByfiDMGCqsar+JnpsyycTYNINWy37anA7k3FUDSnP
	Yr0Q==
X-Gm-Message-State: APjAAAWSTAo476xPJoGX5Atuj4jyswQ8fz4UFevyJU3lNugGp+bFDH7R
	03bzhszJzeH4AdsMhnCRO0PKSWCI
X-Google-Smtp-Source: APXvYqz12jgMkNiZh5e+6GKbbMGbvTcQLRnczY7sRF7HfcWNWVa51Hcy/wtApN9+bT2anoLYDgfXYg==
X-Received: by 2002:a05:600c:d4:: with SMTP id
	u20mr7744510wmm.88.1554492525289; 
	Fri, 05 Apr 2019 12:28:45 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	s189sm6288980wmf.45.2019.04.05.12.28.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Apr 2019 12:28:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 21:28:35 +0200
Message-Id: <20190405192835.8080-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-python: rework gobject-introspection handling
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
X-List-Received-Date: Fri, 05 Apr 2019 19:28:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gobject-introspection is mandatory for gstreamer1.0-python - there is no
configure option to enable or disable it.

To handle properly, this patch does:

* Make 'gobject-introspection-data' a required distro feature
* Add
  'UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"'
   - it was removed in gobject-introspection.bbclass to avoid
  | ERROR: libgee-0.18.0-r0 do_configure: QA Issue: libgee: configure was passed unrecognised options: --disable-schemas-install [unknown-configure-option]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gstreamer/gstreamer1.0-python_1.14.4.bb                   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
index 8d45ca2668..fb76a37b92 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
@@ -16,6 +16,10 @@ PNREAL = "gst-python"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
 inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
 
 do_install_append() {
-- 
2.20.1


