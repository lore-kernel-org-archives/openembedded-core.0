Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199FBE9A75A
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:39:26 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16863.1774348764566232516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dGmkcCVS;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so683898a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774348763; x=1774953563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CFDhj73hJCBcKYIv+0AEJOiCD2EJyESe5MDwhNw2/vc=;
        b=dGmkcCVSA+xI3GWbH6coDD26vgSNxfLjGEWVsGsFM0VkvPuQJfKGqw8TSECDreCa2W
         bFFAG2nNxcUIHj8TqTRBefG8C0470bOuoA1DVLV9nElI8jVWBZmP3mLq8x51CC13Jn8q
         MwKtTphtKsRIGSX2THXu4rHTz9eKZz6mcQ9nY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774348763; x=1774953563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CFDhj73hJCBcKYIv+0AEJOiCD2EJyESe5MDwhNw2/vc=;
        b=N5HcNBGJM0fZ8vb/Y722ZkN2W55LPL6XcdYrH+Gm0U4pGj8IgT4sDXiibf8MAUdEfh
         9qguu93i33fIUFWAR4r+a137VAcwVvRTIgwtB72AgwDN7LvK3r/2fYKO/1+sWm9zOEGe
         tV45RWifpYYKpnZlnqI2hs3d2jfJQUnmDgmF1lGU+AXbd31SO2t3BjmVeru0J1JytE6s
         2gIJKJK7Kk7E4Dr3Cu2iCkF3vTbloOFcRZWd5lXQJYGK8pt9GCO8S4rMvbOTvcwYyRNE
         dSj5gsIOYiamEuXxX9Xdl+3sNZzGRC8dOHrWCBiN+pNMqzprT5MfmFP3O1V2DC0666kI
         Wl3A==
X-Gm-Message-State: AOJu0YyGhNBp3mr6B9vy9dHZ85QG3qGYssHmkubuHj26HIpclWdRmMFD
	lloq547HidwqWrPx44fisDTJO5YEKaMibYWbQRJVKHA1P9ns6FPJ0l9dZLOhboFKisWmhWgidnL
	+HmW/KV4=
X-Gm-Gg: ATEYQzwxjh6j4LHZZtfB8zI6Qjyv/Lkyu6MkHncu1D9uAjGhdkUKz4IayafWxVyW3n2
	K04VQkyMa4hl8nMuYhMUrV2Ep3BUs5sSYrnVtpA2XrNxNhMo4kTQYA7Dr1HZOi20ftS3PSYX1h4
	dn1XoAh4iYoq0Q57KDz1e8t5vhpFJ1MyDE38R7KrfThiLbeTIHrzBgxgNIjw38ETgbWwDbn9krL
	aJe9tUckMykg/1ziO8MuEhgfrBOQP4g51+cSIi/pZPIJTTCOaj5vIEOLgJAK+iFFJDlz1P0wC+c
	d5Ka3ul5kQRyxRZFFk1h+A/w8DBr5vAm3pn7Zcj5WeKxJTYt9DYDW8F+RcYkUlranYHRCu9R/Nb
	B4Tmo4mgBPJ9U/eoaIeejmAA8vdmxMV71EzkqJ9Q8cJwKE+S90RRsR6OiAdc/2R+tJh8RJ3uwnY
	EgXFVS0sP3UbduwMG3Ff3NjhBx9DXrO1RanhC6H5vNDjcFl3I=
X-Received: by 2002:a17:90a:1182:b0:35b:e4d7:9694 with SMTP id 98e67ed59e1d1-35be4d7975cmr5116175a91.19.1774348763407;
        Tue, 24 Mar 2026 03:39:23 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:44f8:7beb:1879:ea0a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c032073e6sm1972084a91.14.2026.03.24.03.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 03:39:22 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3: Fix CVE-2025-15282
Date: Tue, 24 Mar 2026 16:09:08 +0530
Message-Id: <20260324103908.798946-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233786

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch from 3.10 branch

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
[2] https://security-tracker.debian.org/tracker/CVE-2025-15282

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/python3/CVE-2025-15282.patch       | 68 +++++++++++++++++++
 .../python/python3_3.10.19.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15282.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-15282.patch b/meta/recipes-devtools/python/python3/CVE-2025-15282.patch
new file mode 100644
index 0000000000..80ef2fcde8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-15282.patch
@@ -0,0 +1,68 @@
+From 34d76b00dabde81a793bd06dd8ecb057838c4b38 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Sun, 25 Jan 2026 11:05:15 -0600
+Subject: [PATCH] [3.10] gh-143925: Reject control characters in data: URL
+ mediatypes (#144115)
+
+(cherry picked from commit f25509e78e8be6ea73c811ac2b8c928c28841b9f)
+(cherry picked from commit 2c9c746077d8119b5bcf5142316992e464594946)
+
+Upstream-Status: Backport [https://github.com/python/cpython/commit/34d76b00dabde81a793bd06dd8ecb057838c4b38]
+CVE: CVE-2025-15282
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ Lib/test/test_urllib.py                                   | 8 ++++++++
+ Lib/urllib/request.py                                     | 5 +++++
+ .../2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst        | 1 +
+ 3 files changed, 14 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst
+
+diff --git a/Lib/test/test_urllib.py b/Lib/test/test_urllib.py
+index 82f1d9dc2e7bb3..b08fc8f2b19463 100644
+--- a/Lib/test/test_urllib.py
++++ b/Lib/test/test_urllib.py
+@@ -11,6 +11,7 @@
+ from test import support
+ from test.support import os_helper
+ from test.support import warnings_helper
++from test.support import control_characters_c0
+ import os
+ try:
+     import ssl
+@@ -683,6 +684,13 @@ def test_invalid_base64_data(self):
+         # missing padding character
+         self.assertRaises(ValueError,urllib.request.urlopen,'data:;base64,Cg=')
+ 
++    def test_invalid_mediatype(self):
++        for c0 in control_characters_c0():
++            self.assertRaises(ValueError,urllib.request.urlopen,
++                              f'data:text/html;{c0},data')
++        for c0 in control_characters_c0():
++            self.assertRaises(ValueError,urllib.request.urlopen,
++                              f'data:text/html{c0};base64,ZGF0YQ==')
+ 
+ class urlretrieve_FileTests(unittest.TestCase):
+     """Test urllib.urlretrieve() on local files"""
+diff --git a/Lib/urllib/request.py b/Lib/urllib/request.py
+index 6edde1f73189b1..c378a86a70cbeb 100644
+--- a/Lib/urllib/request.py
++++ b/Lib/urllib/request.py
+@@ -1654,6 +1654,11 @@ def data_open(self, req):
+         scheme, data = url.split(":",1)
+         mediatype, data = data.split(",",1)
+ 
++        # Disallow control characters within mediatype.
++        if re.search(r"[\x00-\x1F\x7F]", mediatype):
++            raise ValueError(
++                "Control characters not allowed in data: mediatype")
++
+         # even base64 encoded data URLs might be quoted so unquote in any case:
+         data = unquote_to_bytes(data)
+         if mediatype.endswith(";base64"):
+diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst
+new file mode 100644
+index 00000000000000..46109dfbef3ee7
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-01-16-11-51-19.gh-issue-143925.mrtcHW.rst
+@@ -0,0 +1 @@
++Reject control characters in ``data:`` URL media types.
diff --git a/meta/recipes-devtools/python/python3_3.10.19.bb b/meta/recipes-devtools/python/python3_3.10.19.bb
index fbb2f80886..e2a0ae9fe7 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-13836.patch \
            file://CVE-2025-13837.patch \
            file://CVE-2025-12084.patch \
+           file://CVE-2025-15282.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.25.1


