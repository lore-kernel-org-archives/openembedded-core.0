Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3123.1619415959561459793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 22:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zO0JuFoiJ0TZyTaLH1u1qXuDJLfxrOXqElC9+8IeZzbdWGCrqt/2WsehS/R1gHGkeEVafKzFSI
 Gbb7DKmB/DRA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="281613577"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="281613577"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:05 -0700
IronPort-SDR: ebXxm3VFqxiP+eeqtRbbSGjPud3VciOnDNCle2YNCD1Pc2K63zQ2RTrKVPBEtZa0GKqdepyPSR
 9cl8EBqbQmZw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="385670718"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:04 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 7/8] kmod: do not symlink config.guess/config.sub during autoreconf
Date: Mon, 26 Apr 2021 13:45:45 +0800
Message-Id: <b423a574496a7bf6023883584a6d1ad1cdb8f017.1619409036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619409036.git.anuj.mittal@intel.com>
References: <cover.1619409036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gavin Li <gavin@matician.com>

I was encountering the following race condition on poky:

- automake-native does do_install.
- automake-native does do_populate_sysroot. This hardlinks config.guess
  and config.sub into ${D}.
- kmod-native does do_configure. This runs `autoreconf`, which runs
  `automake --add-missing` (symlinks config.guess/config.sub from
  recipe-sysroot-native to build dir), then runs `gnu-configize` (copies
  _its own_ config.guess/config.sub _on top_ of the already existing
  ones). Since the destinations already had symlinks, the copy would
  overwrite config.guess/config.sub in recipe-sysroot-native, which
  would in turn overwrite the same in ${D} due to being hardlinked.
- automake-native does do_package. The outhash is thus calculated on the
  clobbered config.guess/config.sub files.

With hash equivalency enabled, the different outhash produced a
different unihash, which kept me from reusing sstate between my laptop
and my build server. This race condition would happen only on the build
server (BB_NUMBER_THREADS = 32) but never on my laptop
(BB_NUMBER_THREADS = 6).

I didn't see the --install and --symlink flags being used by any other
recipe, so I removed them, and that fixed the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 89d675efd633b495daa4a3a57420b9c309497035)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/kmod/kmod.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 646dff9a97..10a319ac9f 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_AUTORECONF += "--install --symlink"
 EXTRA_OECONF +=" --enable-tools --with-zlib"
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-- 
2.30.2

