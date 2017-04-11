Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0618E77BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:57:12 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id t68so6260182iof.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 07:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nhRhRw5tGkigmhWbB9niun2L4bRJell1f10buTnB4qs=;
	b=fDeURYXLPGoYYpM3bh7qmUpSrgIMWIwUnuKFjvzQCNNJCgr1hHuVACyqcNFLS9PThR
	ilQ95h+EeyERFar7MKA93r1KIIssvnHySNvc5sLFRTfGsZDRfC5LUYlYEkE5GzHTGnAA
	Nit03oEK5j8ItDZu1EoJIqcx6PrqLz7WMPE83R54GKmUd3hnn8W3FSGkSZ1A1u+r6g7e
	CZillxX3TqrhYe7v8t1PQO9qJYsEYoBNST2ndxnaLyt2I/s+F5eAQe5XdyixrDtulr+N
	ino5Yo0WPvtqtX5IZ4+qEjc2Bj2xPg1dEMTkxgRleAAknDkT1WMYlmdRG5toRh06VhNL
	TLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nhRhRw5tGkigmhWbB9niun2L4bRJell1f10buTnB4qs=;
	b=C9xPp5aXdvfLYWiGlHHlZ67dWH8SMJPFxiphv+y2jB6Le2i5q4zWgGCkoms5O9TU9c
	9p0j+OuSFmKYHwjQkECs761EegPWPIb4bYbG/9qibe8dJtS6m3+NATKUDnbBPa1GMT9V
	818Q0TUgINa7k+NjEcPNOzrzLi0NIs2DeQgZjHMkoOZpnkSGT/Fw69TL8F2G62+akjV1
	EHiJ7ctECfWPozOj16MrT6qm7PHblKk9SoI0kPyARZKM6xSNMz9Ozhqva2D2kdiGDipQ
	73xqdJyUfjFYKu0boop9ydj8JRRWhxnt+o2h5SJ2qzYWcGpMVqG7dUvRBgWfP41pK3mm
	V7hg==
X-Gm-Message-State: AN3rC/4OZdGVimyyInV1wp0Z1FcW+a7QNq5JnMt6k+kmEzpkUKwpKYrX
	rKuUIzu1zRnfksH5HHw=
X-Received: by 10.36.65.148 with SMTP id b20mr17592153itd.59.1491922633544;
	Tue, 11 Apr 2017 07:57:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D3A2.dip0.t-ipconnect.de.
	[93.232.211.162])
	by smtp.gmail.com with ESMTPSA id 71sm8025298iof.29.2017.04.11.07.57.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Apr 2017 07:57:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 16:56:55 +0200
Message-Id: <5a067d85afa569bc5b03df89acdb5914ccd86764.1491922350.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
References: <cover.a248491aa166631c9f866a7a8314fe9f92a1420b.1491922350.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 2/8] gdb-cross: avoid tune specific paths
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
X-List-Received-Date: Tue, 11 Apr 2017 14:57:13 -0000

gdb-cross used to be specific to the tune flags, but isn't
anymore. Therefore it is enough to use TARGET_SYS instead of
TUNE_PKGARCH to create a unique path.

Fixes a sstate signature difference that was found via
yocto-compat-layer.py's test_machine_signatures check. In practice it
probably showed up as unnecessarily rebuilding gdb-cross when
switching between machines like intel-corei7-64 and qemux86-64.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index a34223e..d92f31f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -24,4 +24,4 @@ BPN = "gdb"
 inherit cross
 inherit gettext
 
-datadir .= "/gdb-${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}"
+datadir .= "/gdb-${TARGET_SYS}${TARGET_VENDOR}-${TARGET_OS}"
-- 
git-series 0.9.1

