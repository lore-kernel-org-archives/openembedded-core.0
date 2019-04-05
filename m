Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 89AE17D687
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:21:07 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w10so9442873wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g/ULT3x7GungwLt4GykxRnYJgPWnHwbBn4Rj4O6qrtw=;
	b=N4Z7yoVi3kvhXIMG6eWRkQBGXS7iJPPxOs5tQRMCxTXIUG5AOqYqVRLUyIHC2C2Ol5
	cuFYnNFCew54FziogbAvpw8rcEUBn6fZolnLVA3978wroVg0ttEhaT0aCM0O1nUKd6p+
	n2CvJCNMg4WeI2pZpIiHOExdv8Newk3LbYfXegZRAv7HJRRA6Tjrb+XOCRzL+qqgsyBU
	rU2gvEru8afLIpmWb7TzJk5HE4CiKnWw8pCPikNTAEHYoIwHNOpD2Ho5ooBnf6KQUYgJ
	lml02Edz1I6AhG42GwF5JmVxPqhnvHyjyJZF4k15m6AJoZJvAq5Fu+SW7eIgTuU9dNc8
	1LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=g/ULT3x7GungwLt4GykxRnYJgPWnHwbBn4Rj4O6qrtw=;
	b=rZaJgX6AjktxDPgs06yeyvwFHNhgwA0fN2NG2asM5zvxLcKJ7JpoW4y4L3KalC8RMN
	S6WQcF4PuYPUVvsogwx5IuGUGxqsFF8qTAx/8REVxWM914jeAkHzPOCgTWlYxjVrqu2v
	iguxpM+2UTg7Iw9rsH58QFataS9UmK97XizZnIwBmWw1OuvcBy/IZX7b2JMwaJLUF8q+
	UupV+Vksv9eheMrZdXrbnhK+qIFAsL4hfHYlaxiHqWqpgq3XdK/lPapkzZlgMRrCGGlZ
	odxkS02bFyrMWARLFFWPJ9dB2iEyXZvgZf7qjkEUUyQwfE14TPmoG8C2KzI5uMC/8I2V
	rLjw==
X-Gm-Message-State: APjAAAV4BQxRN0aIbgUhuKFpA0BJTDOO+uHv4HVb7v/3xQqrATaAHtA+
	hGZeGmDx6rUS4MMRO1ZPdNfKD0Ji
X-Google-Smtp-Source: APXvYqyIH0DNnboI2nXWdm1YK/qOZXcPou7XdQ6O0isDaKmV4HBlJ12vBLSWK+OPWRwTFsSnPukMaA==
X-Received: by 2002:adf:e951:: with SMTP id m17mr232429wrn.287.1554495667927; 
	Fri, 05 Apr 2019 13:21:07 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05D917A4978A6EAA704508.dip0.t-ipconnect.de.
	[2003:f0:7f05:d917:a497:8a6e:aa70:4508])
	by smtp.gmail.com with ESMTPSA id
	v1sm31643984wrd.47.2019.04.05.13.21.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 05 Apr 2019 13:21:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org, ross.burton@intel.com,
	alex.kanavin@gmail.com
Date: Fri,  5 Apr 2019 22:20:59 +0200
Message-Id: <20190405202059.22683-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] gstreamer1.0-python: rework gobject-introspection handling
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
X-List-Received-Date: Fri, 05 Apr 2019 20:21:07 -0000
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

V1 -> V2: Add distro_features_check to inherit

 .../gstreamer/gstreamer1.0-python_1.14.4.bb                 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
index 8d45ca2668..048aaf4413 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.14.4.bb
@@ -16,7 +16,11 @@ PNREAL = "gst-python"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+
+inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection distro_features_check
 
 do_install_append() {
     # gstpythonplugin hardcodes the location of the libpython from the build
-- 
2.20.1


