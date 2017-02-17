Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id D2B5E719DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:11:51 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v77so14835756wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VpDnnsssAbb2My8OSbPVb3PmxLb1rQINkIE9TtEpo8M=;
	b=SEzwHZUnNDFOeXi1ZBTkCJIURrcfi/v/khEwu11VQjWXuEUVBdmBDu1dNvubW75dej
	ZHjOxKpybYpaoDSKwpFj9eoih4i66YDytGJ9Ej2BdDR8XMEKKDb6c43pbkhH2wHtkyk+
	2F68+A/hBwhFtpXtTmshc6iDQaFzKvWLsI/JdfRFYb9pr0JFP95USBFSby/AO7inAb4i
	yv6SZsgF1H6AIpsWEcGsvKtyi7EtO/9IjR8D8r4Wp33gclZwTVTKS3sZ744Q1RSvsXTo
	tsfYuRVaDqWhnv44iTPL4VNHLtP08rI9OkldRAe+2ReLoYH0Zs3BQjCk607djcaVk6Sm
	1YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VpDnnsssAbb2My8OSbPVb3PmxLb1rQINkIE9TtEpo8M=;
	b=AVYICzX9k0mjmvMuulvrSyC2lnVrEOFmg9VAUQ+GJyabNguNSQqYB5NpT+LDjQPBZ9
	sqKQrvZLtawzawk52E3M0XlSqdgRYN840HcqiTC6ThemHutM8RgGvWeQPr3y/BzJjmn5
	YfFrYvnWkyX/Osebfsqhrrz0S3Ssdhht5V+P+FN53cCUO/CAbmMp4+HQsJGSvQXyJ/d+
	uwaRISTRSoeYDRCMvMrsjo9jrFQqN8KpYcdSDaKfGud/La4urojPNcdxlzPWSNdGJLN4
	K/D4v+8n+x8qIs37nX4UgM/Q9XzkcTd8ZhBsTZi2cpe5wOWjBnilKwEiIubDDIlujAYG
	CGtw==
X-Gm-Message-State: AMke39k8bMDw6d9HQxRXJGms4QQuzLmpn4fj7FNp6KWYwWEsFIbTGVfLTKRDFFIOHd8FyrVi
X-Received: by 10.28.197.142 with SMTP id v136mr4840685wmf.62.1487351511249;
	Fri, 17 Feb 2017 09:11:51 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	q5sm13629862wrd.32.2017.02.17.09.11.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Feb 2017 09:11:50 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Feb 2017 17:11:48 +0000
Message-Id: <1487351508-18823-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] btrfs-tools: don't run autogen.sh
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
X-List-Received-Date: Fri, 17 Feb 2017 17:11:52 -0000

Instead of running autogen.sh (which runs autoconf et al) before running
autoreconf (which runs autoreconf et al...) just do the one task that we need
from autogen.sh: copying install-sh from automake's libdir.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
index 7047c43..6141060 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
@@ -14,17 +14,16 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
 RDEPENDS_${PN} = "libgcc"
 
 SRCREV = "144a19145e248513c7a676defad59836830535c6"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
-"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git"
 
 inherit autotools-brokensep pkgconfig manpages
 
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 
-
 do_configure_prepend() {
-      sh autogen.sh
+	# Upstream doesn't ship this and autoreconf won't install it as automake isn't used.
+	cp -f $(automake --print-libdir)/install-sh ${S}/config/
 }
 
 S = "${WORKDIR}/git"
-- 
2.8.1


