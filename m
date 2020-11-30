Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.53727.1606698706457667213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6haqtjfcBMayXV25WtGyJ/z4uQNYKrTiUsP7WBS7fdikGTHtekDwjRWu7RNQKSZehRCJaUxbDh
 vP7eaCMJsvIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004416"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004416"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:11 -0800
IronPort-SDR: FxI67hnQlyI/Ht01ALn5u/8qNbvBA89HwI/j/kyAZdwyKAfe2VK4lzmS7OJHgSa+Xa1sCEfgxM
 HljljASUbmZQ==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302700"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:10 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/21] eudev: remove bashism to be compatible with dash
Date: Mon, 30 Nov 2020 09:11:29 +0800
Message-Id: <af5a68b545fda9013bbe8f07a2175a04e950d768.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fedor Ross <fedor.ross@ifm.com>

Remove 'echo -e' and replace it with 'printf'. In bash the builtin
'echo' has an option for interpreting backslash escapes. In a shell like
dash the builtin 'echo' interprets backslash escapes by default.
Therefor the 'echo' in dash doesn't have the '-e' option. When using
'printf' instead it is safe to use it either with bash or dash.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c747acca33f84879a1ebd0ef972c07f4d5dff8b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/udev/eudev/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index 0455ade258..c60dbbf6d5 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -52,7 +52,7 @@ case "$1" in
     kill_udevd > "/dev/null" 2>&1
 
     # trigger the sorted events
-    [ -e /proc/sys/kernel/hotplug ] && echo -e '\000' >/proc/sys/kernel/hotplug
+    [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
     @UDEVD@ -d
 
     udevadm control --env=STARTUP=1
-- 
2.28.0

