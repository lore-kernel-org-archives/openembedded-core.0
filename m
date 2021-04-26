Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: QtMLEUTXg0rnKXdg3NJzDkSbX24Mw/hXVG+r3nCBUkovynreQoIyDFH3LzzQEN+oWxQeOOyZV7
 FA7LZph5ZzpA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818219"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818219"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:46 -0700
IronPort-SDR: 69hRJF0FlHpuc9yXff+8O86nVktjg7MtBujAjNkVgczwd5aYTj8QDMT8fnQ2NjWZrpqrVZdXSv
 /hY2Pgb5cgiw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067446"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:45 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 38/64] kmod: do not symlink config.guess/config.sub during autoreconf
Date: Mon, 26 Apr 2021 08:53:09 +0800
Message-Id: <fd12e5872813a4750ef2603a357170dd3f0f44e1.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
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
index ccda9f2b73..ba5ec7f650 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -26,7 +26,6 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
 
 S = "${WORKDIR}/git"
 
-EXTRA_AUTORECONF += "--install --symlink"
 EXTRA_OECONF +=" --enable-tools --with-zlib"
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-- 
2.30.2

