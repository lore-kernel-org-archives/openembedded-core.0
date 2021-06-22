Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.6657.1624355465315229946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 02:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dXZMahWhYl7wJSQABHH1v/8JpfgGOmqaNOOFq7/NUj0LJig7MWxeNGgFaZqTuq3BrTOcODdUv5
 CEpSKPbQbc8g==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="204014083"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="204014083"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:05 -0700
IronPort-SDR: eJm4C6/gitjtfRrFPo3/+Ad3MpBX9JVJUzDudbncJApjnI9zMLfPqhPqG+jR0/T/c7nr+qJmhe
 3FmmrnqVjouA==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; 
   d="scan'208";a="423260060"
Received: from leexiaoy-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.150.96])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2021 02:51:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/13] linuxloader: Be aware of riscv32 ldso
Date: Tue, 22 Jun 2021 17:50:27 +0800
Message-Id: <1008b02ae998324960e6192a308319d80a84d06b.1624352878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1624352878.git.anuj.mittal@intel.com>
References: <cover.1624352878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d7aa00663e1e41980afb24d0ada2d76e8723e2b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/linuxloader.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 30925ac87d..1b64be6405 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -52,6 +52,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
         dynamic_loader = "${base_libdir}/ld-linux-riscv64-lp64${@['d', ''][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+    elif targetarch.startswith("riscv32"):
+        dynamic_loader = "${base_libdir}/ld-linux-riscv32-ilp32${@['d', ''][d.getVar('TARGET_FPU') == 'soft']}.so.1"
     return dynamic_loader
 
 def get_linuxloader(d):
-- 
2.31.1

