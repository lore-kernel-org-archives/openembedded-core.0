Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3CEEF6011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:35:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="19464584"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 19 Feb 2018 00:35:07 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 180AF5802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:35:06 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:07 +0200
Message-Id: <1519029438-11092-17-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 16/27] pulseaudio: fix udev path for pkgconf
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
X-List-Received-Date: Mon, 19 Feb 2018 08:35:06 -0000

Here we need udev path to be relative, inside the sysroot.
Unset PKG_CONFIG_SYSROOT_DIR to fix it.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 8189a56..821a12d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -80,7 +80,7 @@ EXTRA_OECONF = "\
 		--disable-openssl \
 		--with-database=simple \
 		--without-zsh-completion-dir \
-		--with-udev-rules-dir=`pkg-config --variable=udevdir udev`/rules.d \
+		--with-udev-rules-dir=`unset PKG_CONFIG_SYSROOT_DIR;pkg-config --variable=udevdir udev`/rules.d \
                 ac_cv_header_valgrind_memcheck_h=no \
                 --disable-tests \
 "
-- 
2.4.0


