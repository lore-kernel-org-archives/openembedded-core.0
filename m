Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GDnYWwMHLC4oAKEGdJAT/7EoWnv70n3q5vBZCbLmZrrRLkhQaUV4dPJlSIaQPrkcbB7TG7leBl
 nQv99x/YTzOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004355"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004355"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:50 -0800
IronPort-SDR: tWyBsAw8ua9QBSqeYi1zNRWwnI8jC9u7ljzyRNRint6LEL492X8kKa6cC+CCtxonPuRkm4qRNi
 w8AQd4m+jWNQ==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302605"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:11:48 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/21] kernel-devsrc: improve reproducibility for arm64
Date: Mon, 30 Nov 2020 09:11:17 +0800
Message-Id: <b627c00c624f9f9279c21ddd4d8aa9a8a592a8d3.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "INC@Cisco)" <INC@Cisco)>

.vdso-offsets.h.cmd contains command that was used to produce vdso-offsets.h.
It breaks reproducibility because it has an absolute path in it. There is no
any value to package such files so it can be dropped.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d31b4db24643b0867c654af34c684b4de2f8122b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 8373c97a31..8a900ed182 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -119,6 +119,10 @@ do_install() {
 	# but without this file, we get a forced syncconfig run in v5.8+, which prompts and
 	# breaks workflows.
 	cp -a --parents include/generated/autoconf.h $kerneldir/build 2>/dev/null || :
+
+	if [ -e $kerneldir/include/generated/.vdso-offsets.h.cmd ]; then
+	    rm $kerneldir/include/generated/.vdso-offsets.h.cmd
+	fi
     )
 
     # now grab the chunks from the source tree that we need
-- 
2.28.0

