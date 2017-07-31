Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id B918F785BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 14:57:07 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id q85so121846822pfq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 07:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wXKLEq09MJ9Peyas5pYbgl3CfYl5YDcfa9nZ48Zqf7k=;
	b=yn4zrFj/Ezlgt6chuVDqKhAPNbY6LZSfToz35fz1ec+ZHxJlGtfiLJ2C9yfqxaPFdR
	RZZR2p6187jrKNL3Et4MZ13pGQ4Y3I/LT1RUHuxDAIAnrQfWmRzbOOLe2TC5d31cYyFs
	ZsH9gO24AubFQKb/uUy8pryrSLemRSwuqlk17KKsQtqqZErHB/Q2httP/5LtR2RinfRs
	bnNJln74kvp9NYQLH8314U0gQuZQc3ybNyKECQAtlpy9pntoEXsXNkMv+snb3A7Wd1+Z
	IB0baL6nDNNALsMvILsiz1oOEG+sH6JOlR2o7ufcLnwqBTweTFw7Sn2zQ5Ag+mHGJC/F
	F+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wXKLEq09MJ9Peyas5pYbgl3CfYl5YDcfa9nZ48Zqf7k=;
	b=Twb0r7tu9nQs7n6p342LwGdteAGg+97Qsqbz3DnHmUfvJyk2xWB/c2p2KWYhuAwken
	i4ZTcrKFZthLXHJtjJWO9A8tmrrbnCHahgXqJ8QIIBfa2Ls8fuNVHb7AB8HLf0Mnehpf
	dLVdcntPsOilPfGkt/7CVmxY6LzGzmrvip/tMWvgRoMHxB1JJvgo7TtE5Hn6Q4IQ7cAS
	8uhVPPDXYS9wj9H+AI5XrkbC47ZnSVywb1bqGm6SX5NdASnzONNWbjH40KoVmyfIKV3B
	R9IpE12V04rv/9y+dcDyft9mPOoQVfDJ2snYXDRSn0GsEz8yHgk6fAhP4OXWD2J+23Xk
	5gHA==
X-Gm-Message-State: AIVw111swJONSFeGHCxab7BWJ84RESAUxkbXU5Sc8+i8UEXRRB/1h3Tp
	R8GNGu4Ht5QVZmqCN5w=
X-Received: by 10.98.236.78 with SMTP id k75mr15644253pfh.215.1501513028660;
	Mon, 31 Jul 2017 07:57:08 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FE53.dip0.t-ipconnect.de.
	[93.232.254.83])
	by smtp.gmail.com with ESMTPSA id s8sm5823850pfd.77.2017.07.31.07.57.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 07:57:07 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 16:56:54 +0200
Message-Id: <b59b18fe8cb0efc2577b58e6af9ed848748ff09d.1501512975.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.d5ac661bf06568770da90f3e88828979c242547e.1501512975.git-series.patrick.ohly@intel.com>
References: <cover.d5ac661bf06568770da90f3e88828979c242547e.1501512975.git-series.patrick.ohly@intel.com>
Subject: [PATCH v3 1/2] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Mon, 31 Jul 2017 14:57:07 -0000

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

