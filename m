Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E93EF4EA8
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49604.1775456855995552355
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DJCwg5Yn;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso29740385e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456854; x=1776061654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFDYq1hymxGGa8wpDCm2EwDUSrGltlTF2uYzOu0R92k=;
        b=DJCwg5YnCM0vTi0hXi1aN/pKl86+la5h1y4+6jiCGO8elyzbovmDKs/bs6+Y17+aaz
         S/uDebhLYnUpKhgUWOxFX5uwkGTXPDA/r95Foi6CrsKtiaZuQ94OY+6BlF3yQLXh7grO
         mHw3hCxKLCsIUDFIAvGzn5/5LqSW4W3QvTOZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456854; x=1776061654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFDYq1hymxGGa8wpDCm2EwDUSrGltlTF2uYzOu0R92k=;
        b=L/f6QybNJ/zkJ8NW3sprvS7bm2nl1qkwLFSxZPfcwYcbwk6iwDwCoXUzLJm6LJQFFm
         uRGR+Lg3hw/ZMWLp82WJZ9sIqaIjdzc8anDfKhVcNq1p9h1Ux0DzaE0nVWqoOHcWviP5
         zAGyy/TGXYy5YaPdKdVw7ZklvMnFbbEM4uY/C0QaLi+vznGyzRyDsg4FSvxNUITqXZ12
         iHFWbKyUBf3C8Yk4j7BwlJxD+4XolGXOfqHOlCd3OXEc2T4Fx0IN0qkfYr3SLdgkQeH2
         IBgFV/cdG2jq6h48fbHTTsYawxyD/cEH9NrG2DbOriYrgLdaRJuCezmgbcITmz0IvFBJ
         SRPQ==
X-Gm-Message-State: AOJu0Yx0+aZLD9JHbkNqyFCphA8q3i3u4+0/lqrrzinHLhES4lVhxchH
	A+fT8MTDFB3zdeQYLd1fuWHlXkFpC2a+1spssTersEkgktA27JMQ84v090Y6ZYHEJZPlh5YJ40X
	8lrzv/kE=
X-Gm-Gg: AeBDiet/48E2lo1WfKCAF2Lpsjh8pRLggoaZTKuaPdRcJOETbztwYM3ux9UNOuucohP
	2WA/owPvZJxm7vl1EE9AP+JP2DyR6AHz6QDiGVIOdZwo2YAdPY/Ui7fsBk8Y//rehHx9VOcOxjI
	uRmrD/hV+duFSNumneTmzrRP6poHDGT3FmIna6hzKyShHKuvAx1r2NesQxM4QUAdU1VakiomxuE
	LobfgCn9sGXQkQQU3mF1QslDk62No6zhm/oEZqKScHVbmJ+6fSqc27rjUGPOjVPom9N2fiPDego
	MK1sDaKspVTIR88pJADrerE6on/dcvKhLspWIaksU2oeUTMlGahJ7fdwgRCb4pb4mLdcseF1FWN
	UkUQ23QFTAWTg42dhlnZeCRGI614tcl0JdPDZ/utzxUR0X/1JwHKXzsb2PA/1RqaaoQpno13fW+
	BJySmPaNHu7ko54J/3h6DdYFGy4D8VWrIz+gvk9trbmPW38fpcBNjq19o9qNkeMroml7g+Bpofc
	Y6O+4+6hvWVyDwDK6UoOJswaXE=
X-Received: by 2002:a05:600c:3b1e:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-488996cd897mr158955455e9.4.1775456854083;
        Sun, 05 Apr 2026 23:27:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/18] python3: Fix CVE-2025-15282
Date: Mon,  6 Apr 2026 08:26:37 +0200
Message-ID: <c19d97a63c2b9b145a0370a961cbfef90b450010.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775435063.git.yoann.congal@smile.fr>
References: <cover.1775435063.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234654

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch from 3.10 branch

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
[2] https://security-tracker.debian.org/tracker/CVE-2025-15282

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3/CVE-2025-15282.patch       | 68 +++++++++++++++++++
 .../python/python3_3.10.19.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15282.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-15282.patch b/meta/recipes-devtools/python/python3/CVE-2025-15282.patch
new file mode 100644
index 00000000000..80ef2fcde8b
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
index fbb2f80886b..e2a0ae9fe77 100644
--- a/meta/recipes-devtools/python/python3_3.10.19.bb
+++ b/meta/recipes-devtools/python/python3_3.10.19.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2025-13836.patch \
            file://CVE-2025-13837.patch \
            file://CVE-2025-12084.patch \
+           file://CVE-2025-15282.patch \
            "
 
 SRC_URI:append:class-native = " \

