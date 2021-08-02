Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.17102.1627890867482698076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002105"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002105"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478654870"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:24 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/37] archiver.bbclass: Fix patch error for recipes that inherit dos2unix.
Date: Mon,  2 Aug 2021 15:52:11 +0800
Message-Id: <d2405585f0bcdf80950fb41438168d622b1c3181.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: leimaohui <leimaohui@fujitsu.com>

do_unpack_and_patch error happens for these recipes inherit dos2unix.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ceda7c90c0087f52693c54d5ccab143b27f4d21)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/archiver.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index a3962306b1..900268971c 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -483,6 +483,9 @@ python do_unpack_and_patch() {
         src_orig = '%s.orig' % src
         oe.path.copytree(src, src_orig)
 
+    if bb.data.inherits_class('dos2unix', d):
+        bb.build.exec_func('do_convert_crlf_to_lf', d)
+
     # Make sure gcc and kernel sources are patched only once
     if not (d.getVar('SRC_URI') == "" or is_work_shared(d)):
         bb.build.exec_func('do_patch', d)
-- 
2.31.1

