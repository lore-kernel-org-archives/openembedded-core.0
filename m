Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.23227.1593614351059833749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: +8pY307BoQF0gdvUEpu7MWuSJdaTl83kSlThf2HXp2iQn8zPhaNqRiC4jeGiAIDphArvutG6e1
 ytt1jpqilyug==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="126208670"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="126208670"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 07:39:09 -0700
IronPort-SDR: F3h/BEghzRS/9fv885wW1jHw4Vh6PqZT/YnFM0qOy6lJyiP7vQinY5MFtD2H3fjGL7vzcMNHES
 nwL7q4Dkx49g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="303865165"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 01 Jul 2020 07:39:09 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/core/loader: refine regex to find module
Date: Wed,  1 Jul 2020 22:39:08 +0800
Message-Id: <1593614348-34222-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

test case in format <module name>.<class name>.<test case name>
this is clear when test cases is only 3 item deep.

but confused when it is 4 item deep, eg,
oelib.types.TestList.test_list_nosep

in this case, oelib and oelib.types can both be treated as module
since module name contains only lower cases and class name should
contain atleast one upper case.
so, always treat leading item without upper case as module also allow
module name to contain dot.

[YOCTO #13941]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/core/loader.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 0d7970d..73c5788 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -46,7 +46,7 @@ def _built_modules_dict(modules):
     for module in modules:
         # Assumption: package and module names do not contain upper case
         # characters, whereas class names do
-        m = re.match(r'^(\w+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
+        m = re.match(r'^([1-2a-z_.]+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
         if not m:
             continue
 
-- 
2.7.4

