Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id BFA367D244
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:29:08 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z11so2788695wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=FDgktRJMQ2Wn2t8yDaxikpN+FpNI8yFy48JrbI7MgA0=;
	b=CuvbRbD+ggpv2kFJrvzpcOnNW8tZUhRtodA9evceWDBB6PxZf4si5ghCAr7aYCc4GL
	jqxXyLZZe9eGPzH09e3JkdIu5GZwfj7o0lDTf1vYgSjz57PebwdDEeQb27R/IGlV6pfr
	mJ65WNWOSqsml+NTn3bagR7OwZ5wvzdLWcG3bAgd5Oxo2mRdhsDQHnlzldYUouM9qn/n
	zCaOzaQm2Ts1prJrWhBBq1i/ptVnBZA7qFeoSleZSkjxKvL1l46zxhACqBPTaijKc8M6
	79CXgRIqOtdMWaV40/CHYC3JYu2SpaN1zFMK35uJkuYkMcD2k5OXumuJbMwBYXSAVgpM
	DPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=FDgktRJMQ2Wn2t8yDaxikpN+FpNI8yFy48JrbI7MgA0=;
	b=sTjtHWn2GbhQR1K32TiiaPwURmQbWSBi3bAyKz1BW4EKvai0IXk+b+mlg8L2OCVRdt
	lHaIqaVK2pdW/U2KzHb138uZICEh2CaFREun9wRWYfHcoOi0+BSgnh5bwhRAy+ASTmKY
	qgAYiVQ9gawc6fqwZUodfKh6gZKyYsFAFzOqR/eQUTh8ZMEDai4skr8GUa8k9TNMCNHv
	eUHDM4AGn6WLLQW4gq1o+jPIyNgSARg2qR4naWi4C+4hSXuQInV0SMJQPMrxAAPdv6u4
	FSY9I+kkec1FR/zRCEJTW/dOTBpemQgr83nPENv0SbpCDM6ltRhiw6vcofAZ7A69rnnt
	AZag==
X-Gm-Message-State: APjAAAUtOtvN6rUAUd1n4yOfpTbeGWeWdaQq3MFUQQBnI/98TVbz2JGL
	SU5StA1pYjlbUmKJjW0W9oEcQZHN1yQ=
X-Google-Smtp-Source: APXvYqzncUOAOzRi7shAe5N85o40h4MMfTdv11M1EY0TWk4lbYGnJssBuGKuiWKmoc/Ua9RBiMHciw==
X-Received: by 2002:a1c:b646:: with SMTP id g67mr3901853wmf.125.1553869749096; 
	Fri, 29 Mar 2019 07:29:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e193sm4358537wmg.18.2019.03.29.07.29.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 07:29:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2019 14:29:03 +0000
Message-Id: <20190329142905.20123-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/3] Revert "gtk+3: add librsvg to DEPENDS"
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
X-List-Received-Date: Fri, 29 Mar 2019 14:29:09 -0000

This was added so that adwaita-icon-theme can find the SVG loader for icon
generation, but the fix is in the wrong place.  GTK+ does not depend on librsvg
at all, the tool in GTK+ which loads the icons uses gdk-pixbuf which uses
loadable modules.

This reverts commit 66828ff04d107b7719c9c8857d7c6c2ebf20a8bb.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index b58641a4702..77b6c31536b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.gtk.org"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf librsvg \
+DEPENDS = "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
            gdk-pixbuf-native"
 
 LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-- 
2.11.0


