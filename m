Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 924A36CE9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:28:19 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id ez12so301113wid.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FRemyu0/ZRG+Dc6H41uK3RNYLHYAYeJlCM9/dx1gCw0=;
	b=NIHqV6BNLkm351Qc5HGQW2EFRo8noEW/q8Vt5uJA2mIAK5UOKI+Mjp2uewnnffqDER
	VeQPthsP6f3HD81LAJgrLAa3LnkHur4GHkLVp8iLM2Rg3MMdM85Low8AQBfn8kb0+Muw
	kIaq/TJiKTL+SKQspb1taaPhFGUiwZ73W5f+5DUnaLaIAIn+cDUGLWSTqXiOiwJkcEyy
	gyz1RaTLMexgnKtsIBoiHcw7w/4v+luZKyvCzWYTb8NjNUumAK+bCLjr/xrbAJmOs5W4
	5naswoxvj8AT58ZKu0G9rUC07iNV6MH0i4cmwgwa2JguCOwBohmPef9EIbVvfr0fJDFj
	Xhuw==
X-Gm-Message-State: ALoCoQk94/ZFT5WXoHXP3GQjpd0fQ5j896Nm8ATuFR4f6LMFkucBRGUtNO8zlS2gRzwBVWYaxnbu
X-Received: by 10.180.72.207 with SMTP id f15mr4516085wiv.60.1381768100058;
	Mon, 14 Oct 2013 09:28:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d11sm35790955wic.4.2013.10.14.09.28.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Oct 2013 09:28:19 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2013 17:28:15 +0100
Message-Id: <1381768095-8530-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] cairo: add explicit dependency on zlib
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
X-List-Received-Date: Mon, 14 Oct 2013 16:28:19 -0000

In normal use this is pulled in through libpng, but it's exposed in the headers
of cairo-pdf and cairo-ps and a build from sstate can end up without zlib being
present.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/cairo/cairo.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 06d2dee..2149997 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -11,7 +11,7 @@ BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
-DEPENDS = "libpng fontconfig pixman glib-2.0"
+DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)}"
 PACKAGECONFIG[x11] = "--with-x=yes,--without-x,${X11DEPENDS}"
-- 
1.7.10.4


