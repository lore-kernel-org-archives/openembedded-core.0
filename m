Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12871.1586185918252682432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 08:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MqmAf0qkynbNaXiJRWmKJH5PUQRT8+Qp4FNYKVUEelAUZbVWwfKeqoPm+vbA002EEvX1pMZF/i
 ZFE4bGkIfufA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:15 -0700
IronPort-SDR: PkhMGB4TIirlUOsiZD68A8IubHFtfjRR49HzS00A/Ec8yp/CEct2DXi75RUdhhsj9buhFtvo+m
 gYuBsDpq8PPw==
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; 
   d="scan'208";a="424391234"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.70.63])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2020 08:12:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 13/13] kernelsrc.bbclass: Fix externalsrc support
Date: Mon,  6 Apr 2020 23:11:41 +0800
Message-Id: <5ac98c776f9b77804a0ee812f47f3ecf593e432f.1586185832.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586185832.git.anuj.mittal@intel.com>
References: <cover.1586185832.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <pbarker@konsulko.com>

When the externalsrc class is used the tasks listed in
SRCTREECOVEREDTASKS are deleted to prevent them being executed. If
externalsrc is used for the kernel then this will include
virtual/kernel:do_patch.

We can depend on do_shared_workdir instead as this will survive when
externalsrc is used.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c17d35cc7b9c5e01fd5829858d2f0234e7ac8d6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernelsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernelsrc.bbclass b/meta/classes/kernelsrc.bbclass
index 675d40ec9a..a951ba3325 100644
--- a/meta/classes/kernelsrc.bbclass
+++ b/meta/classes/kernelsrc.bbclass
@@ -1,7 +1,7 @@
 S = "${STAGING_KERNEL_DIR}"
 deltask do_fetch
 deltask do_unpack
-do_patch[depends] += "virtual/kernel:do_patch"
+do_patch[depends] += "virtual/kernel:do_shared_workdir"
 do_patch[noexec] = "1"
 do_package[depends] += "virtual/kernel:do_populate_sysroot"
 KERNEL_VERSION = "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR}")}"
-- 
2.25.1

