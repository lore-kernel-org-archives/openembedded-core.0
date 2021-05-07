Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: o0rPoF+nJBJn0KeOBJArRxu0AjinZUaOB7g2mIPnSAZrbpQqCcwjiKLXToJp0d0Arzc8hFSH91
 tqpXDredZSUA==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794711"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794711"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:00 -0700
IronPort-SDR: KcLlNmumLSZzmrivpxtSlDzBMbw4BrnxAAa7BOGC++5Y3sTtjPDeDq3wAWoYxa4+BWrH8d9rDB
 8EJ1snAkPkCA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331556"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/31] xserver-xorg: fix CVE-2021-3472
Date: Fri,  7 May 2021 15:02:19 +0800
Message-Id: <8fbf485f24711ab29972841ba52dcb9dcdabaffb.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Ghinea <stefan.ghinea@windriver.com>

Insufficient checks on the lengths of the XInput extension
ChangeFeedbackControl request can lead to out of bounds memory accesses
in the X server.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-3472

Upstream patches:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/7aaf54a1884f71dc363f0b884e57bcb67407a6cd

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6fec5fea942ce88e33e5cf4c2102d69ce25e7180)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../xserver-xorg/CVE-2021-3472.patch          | 43 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
new file mode 100644
index 0000000000..5480f71871
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
@@ -0,0 +1,43 @@
+From 7aaf54a1884f71dc363f0b884e57bcb67407a6cd Mon Sep 17 00:00:00 2001
+From: Matthieu Herrb <matthieu@herrb.eu>
+Date: Sun, 21 Mar 2021 18:38:57 +0100
+Subject: [PATCH] Fix XChangeFeedbackControl() request underflow
+
+CVE-2021-3472 / ZDI-CAN-1259
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Matthieu Herrb <matthieu@herrb.eu>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3472
+
+Reference to upstream patch:
+[https://gitlab.freedesktop.org/xorg/xserver/-/commit/7aaf54a1884f71dc363f0b884e57bcb67407a6cd]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ Xi/chgfctl.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Xi/chgfctl.c b/Xi/chgfctl.c
+index 1de4da9..7a597e4 100644
+--- a/Xi/chgfctl.c
++++ b/Xi/chgfctl.c
+@@ -464,8 +464,11 @@ ProcXChangeFeedbackControl(ClientPtr client)
+         break;
+     case StringFeedbackClass:
+     {
+-        xStringFeedbackCtl *f = ((xStringFeedbackCtl *) &stuff[1]);
++        xStringFeedbackCtl *f;
+ 
++        REQUEST_AT_LEAST_EXTRA_SIZE(xChangeFeedbackControlReq,
++                                    sizeof(xStringFeedbackCtl));
++        f = ((xStringFeedbackCtl *) &stuff[1]);
+         if (client->swapped) {
+             if (len < bytes_to_int32(sizeof(xStringFeedbackCtl)))
+                 return BadLength;
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
index 5c6dbac4d7..755a762a73 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.10.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
            file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
+           file://CVE-2021-3472.patch \
            "
 SRC_URI[sha256sum] = "977420c082450dc808de301ef56af4856d653eea71519a973c3490a780cb7c99"
 
-- 
2.30.2

