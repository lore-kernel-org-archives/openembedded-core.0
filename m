Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.6921.1620371069902832970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WzotgDaqqYlo3CYXM+Fk47gBaxwVUtmgEBknzG/7uqw6FsNNNszcp4DCG8hEj6ovYTpdY5T1zJ
 QBnXpoY8TdrQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794843"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:28 -0700
IronPort-SDR: TGhJVLgu02EZh4xwzK6Po+JpYCeZeHFkDkSoF0nlN5HG+cErVVQbn15SFIg9NGFB1iHS8jaM0R
 RSoS/dfTfc+w==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331714"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:26 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 27/31] diffoscope: add native libraries to LD_LIBRARY_PATH
Date: Fri,  7 May 2021 15:02:39 +0800
Message-Id: <73edf1b88f0997f7368bfdb59d3076f085c5da4e.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Reversal of global setting in previous commit necessitates
a local fix, otherwise, this happens:

  File "/home/pokybuild/yocto-worker/reproducible-debian/build/build-st-52142/tmp/work/x86_64-linux/diffoscope-native/172-r0/recipe-sysroot-native/usr/lib/python3.9/ctypes/__init__.py", line 392, in __getitem__
    func = self._FuncPtr((name_or_ordinal, self))
AttributeError: nativepython3: undefined symbol: archive_errno

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87884d9938829d5ae5d250f483c749e00cd83322)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/diffoscope/diffoscope_172.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/diffoscope/diffoscope_172.bb b/meta/recipes-support/diffoscope/diffoscope_172.bb
index bf4726e778..86dd5d8d70 100644
--- a/meta/recipes-support/diffoscope/diffoscope_172.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_172.bb
@@ -23,6 +23,7 @@ do_install_append_class-native() {
 	create_wrapper ${D}${bindir}/diffoscope \
 		MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
 		RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+		LD_LIBRARY_PATH=${STAGING_LIBDIR_NATIVE} \
 		RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE}
 }
 
-- 
2.30.2

