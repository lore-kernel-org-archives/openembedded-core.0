Return-Path: <patrick.ohly@intel.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id AF08F78259
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 14:02:06 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id d67so28452358pfc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=0gSiH5MSVw9OOn6uzUgvtkK+BO2UXTanyrfd2oAGxRk=;
	b=H52UEZxXze766u3ZBQGsy7HcScFHyZaI0cs6pVeX0PqdoqcQSNoFVorFx1GMXeXNMx
	JxmjNjeYxnERsMr1lZhUBMI318Wl8FIsZa4QYXupde66mikMoxfa05xCoS8xAFZhnW1G
	OORbjWHhoSjpRSZjC1SERWLryJYrwWQginQNXiKKh+M1rqa2ITPDvRlYdRwG6Uh4vfnO
	8bFHV00tQkYRoiHTbGTiu6ZR1btugn3LAYBDNeSDLZcp5I2auMV/P9ly9Q8OP4Nf0iRp
	GPpmziSegSQzKbuLaVYtKoeztxCk4HrSsjg5se81GeNODtzw0I0Pl0N0YYYE8OswpiJO
	a3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0gSiH5MSVw9OOn6uzUgvtkK+BO2UXTanyrfd2oAGxRk=;
	b=AcZRhu1MIsVtwgVcN3y9WIOnp4UcTOhwm6Sdg0APjZVubjt+GqkmFrbaPswB/R+ph+
	s7p+zOtAqvu4uwbb5XBEEslV/6gQm2jIaRYVrPoMRkEr/clDXfI0zdFHi18MhJG+E1hm
	xndkYSlE8zvew63q3r+ZYJyqlvHcOu8xI2j0cP8pJKjZl7AyJdGPQB7+SRW5fe+KJHZz
	aVIMOlaLypJa7Z+41X2lDvUOAYLxgGqMSMCQhSkXfhi+8QQJipMeL1+Fj6V5tnpBcfpe
	4c6BDkpr8GlXR3jR+artz/qXWQA0vpN7QRFo+IHqQxCDbHGbNBOdLMvHrRrpBCPUNHbr
	dl6A==
X-Gm-Message-State: AIVw112T7dqef/jh5ww24udD2NQsfuhi9HuTDh8f8DAuUA6gshKkDmXV
	APAkoNJO13lvohCdBBs=
X-Received: by 10.98.61.129 with SMTP id x1mr6575805pfj.68.1501250527065;
	Fri, 28 Jul 2017 07:02:07 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A5633D.dip0.t-ipconnect.de.
	[87.165.99.61]) by smtp.gmail.com with ESMTPSA id
	q24sm47275318pfg.167.2017.07.28.07.02.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 07:02:05 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 16:01:54 +0200
Message-Id: <f05e1212a87f739cf27fe9a6c32f45ef92a6fdab.1501250341.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] autoconf-archive: move from meta-oe to OE-core
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
X-List-Received-Date: Fri, 28 Jul 2017 14:02:06 -0000

Having common macros in OE-core that are needed by autotools based
projects makes sense. For example, tpm2.0-tools in meta-measured
depended on meta-oe only because of autoconf-archive.

This is a verbatim copy of the autoconf-archive recipe in
meta-openembedded rev 1cbd1bc1, with just one change: the patch which
disabled the installation of ax_code_coverage.m4 and
ax_check_enable_debug.m4 was removed.

So now autoconf-archive in OE-core provides them. gnome-common in
meta-oe will be changed to not install them and instead depend on
autoconf-archive.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc           | 15 +++++++++++++++
 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb | 13 +++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
 create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
new file mode 100644
index 0000000..9684d1f
--- /dev/null
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive.inc
@@ -0,0 +1,15 @@
+LICENSE = "GPLv3"
+HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
+SECTION = "devel"
+
+DEPENDS += "m4-native"
+DEPENDS_class-native = "m4-native gnu-config-native"
+DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
+
+RDEPENDS_${PN} = "m4 gnu-config gnome-common"
+RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
+RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
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

base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
-- 
git-series 0.9.1

