Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3C185784BA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:50:05 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id d67so28902445pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wXKLEq09MJ9Peyas5pYbgl3CfYl5YDcfa9nZ48Zqf7k=;
	b=yTjwW0zYBe+qP5Eq3rRVlqTNluGuNPotLKWaI6z5LFwSBANPOwqCqFGZZ9JtXSLHcr
	sqcoCiNPJZ33CQYYrTsO7JAGXr2fv8mHdS9PXCJZfIabIWs+dGTDqUeYFK1IuvyV+MHi
	JZZXSuJAqCpZl7PQkm8xv5bAchnhS0VVk1HoUIP0rJNb8iNes7+LGfJCS9rLFdAMbIMz
	YGs9GM9B2/Nh1uapzCpCSNOQRwNrwe8+hI+dGcC7ulS7KLZ3C9eLntdfrMT4wYwdrtVF
	Xpbm7FHhgfvRykONUu4htA4dQ10rgf5U4BOe239DsCnZHN2DJuKISznoz5AwpGzj9qNd
	Xf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wXKLEq09MJ9Peyas5pYbgl3CfYl5YDcfa9nZ48Zqf7k=;
	b=JnTE0xmL/wK80QicvBf6XXjUe99sS4D42u203NV1hM6npz+4Iosrh6BRN3cEGTpUyF
	1SZssSfdBfaxpxzBJIlC3/BVt42USERM4WAqf5ilBL3bg0MOvTts2hepTmZWlRuhn+ve
	86wGgT/8Li4R1Pmovs/n9qAqCWk56MvKVEe442DSWMuD7MjtHIXWXIRRNmERQPOh341v
	BPKY/WdFs+oAHn6CZK9iTgYH1AjDqPWz/L0KrZdx5W9AR5bYrDIJSRuziWK4Km9eOpCC
	nTgRVHqTnghD4zW4d4rGeUTLZ5QNvco2RfUXB888m7ujRt2kuzH9jrPvirmHrlgocLes
	ypuw==
X-Gm-Message-State: AIVw113InE6C8iSgDLWHE8VEZx5+rkOl25lVMj2pwUag1oTxaAqAzIU4
	DmJcn+LGzi0AptRhbg4=
X-Received: by 10.98.46.131 with SMTP id u125mr7592498pfu.238.1501253406239;
	Fri, 28 Jul 2017 07:50:06 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5633D.dip0.t-ipconnect.de.
	[87.165.99.61]) by smtp.gmail.com with ESMTPSA id
	b13sm38730381pfj.141.2017.07.28.07.50.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 07:50:05 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:49:52 +0200
Message-Id: <b59b18fe8cb0efc2577b58e6af9ed848748ff09d.1501253351.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
References: <cover.1afd007ce6c93979d7d4cc2eb225b84710ca1a65.1501253351.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 1/2] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 28 Jul 2017 14:50:05 -0000

Having common macros in OE-core that are needed by autotools based
projects makes sense. For example, tpm2.0-tools in meta-measured
depended on meta-oe only because of autoconf-archive.

This is a verbatim copy of the autoconf-archive recipe in
meta-openembedded rev 1cbd1bc1, with just one change: the patch which
disabled the installation of ax_code_coverage.m4 and
ax_check_enable_debug.m4 and the dependency on gnome-common were
removed.

So now autoconf-archive in OE-core provides them. gnome-common in
meta-oe will be changed to not install them and instead depend on
autoconf-archive.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           | 13 +++++++++++++
 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 13 +++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
new file mode 100644
index 0000000..4f63e0f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -0,0 +1,13 @@
+LICENSE = "GPLv3"
+HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
+SECTION = "devel"
+
+DEPENDS += "m4-native"
+DEPENDS_class-native = "m4-native gnu-config-native"
+DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+
+RDEPENDS_${PN} = "m4 gnu-config"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
+
+inherit autotools
diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
new file mode 100644
index 0000000..0a1a771
--- /dev/null
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
@@ -0,0 +1,13 @@
+require autoconf-archive.inc
+
+
+PARALLEL_MAKE = ""
+
+LICENSE = "GPLv2 & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
+SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
+
+EXTRA_OECONF += "ac_cv_path_M4=m4"
+BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

