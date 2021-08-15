Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.12642.1629043015755868597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780169"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780169"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:57:00 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820024"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 6/7] gnutls: Point to staging area for finding seccomp libs and includes
Date: Sun, 15 Aug 2021 23:56:45 +0800
Message-Id: <49dc5bde2d7ad5f965984daa1298a995e8261af3.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629041998.git.anuj.mittal@intel.com>
References: <cover.1629041998.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This ensures that if libseccomp is installed on build host then it does
not resort to use it.

Fixes
checking for libseccomp... (cached) yes
checking how to link with libseccomp... /usr/lib/libseccomp.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3751ac58720a500e3b749b2296922d7c82db49a1)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 3e1958c969..350d0a018b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-PACKAGECONFIG[seccomp] = "ac_cv_libseccomp=yes,ac_cv_libseccomp=no,libseccomp"
+PACKAGECONFIG[seccomp] = "--with-libseccomp-prefix=${STAGING_EXECPREFIXDIR},ac_cv_libseccomp=no,libseccomp"
 PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
-- 
2.31.1

