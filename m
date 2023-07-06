Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC54EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 06:18:58 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web11.15717.1688624331935833975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jul 2023 23:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=VGCY3a/d;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688624331; x=1720160331;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ErOvmG73a3DRu79DjSi/qxdhrIIMZ66ZU6kVyblIOAg=;
  b=VGCY3a/dWCG3jb+sorMoP91qRCjeQpYYwcPMxMCjwF7or5QqAcRH9IFR
   BHu1EYRH3Gm2eMLjD4GnA16SXFccrmc4MWcmoTqyXGnHaQs6/bq/3717c
   robfqa5fBStkXG/7FEWxcODbeo/2AQDCrbdXJmy2rZDaV4QocukyKc5mz
   s1VFvKAvU3Jx8hdm2aD/2G9ymbz6jFIk1QwlRbi2FzkmTbIkZlo+Tm9IJ
   pJMxU1gR5PNg9q/JXA2dxTDOISmOD3Z4z6+igl1Wzt4xGuiWuBv83q0dk
   Mfpi+JbibsxWyIiIGT8GxNO+0xQapyWzRitsrNHHwLRHUomSHL2+vhLth
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343847669"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="343847669"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 23:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="863984549"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="863984549"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2023 23:18:48 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch] python3-requests: fix CVE-2023-32681
Date: Thu,  6 Jul 2023 14:07:09 +0800
Message-Id: <20230706060709.3354500-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183912

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../python3-requests/CVE-2023-32681.patch     | 61 +++++++++++++++++++
 .../python/python3-requests_2.28.2.bb         |  2 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch

diff --git a/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch b/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
new file mode 100644
index 0000000000..0110615572
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/CVE-2023-32681.patch
@@ -0,0 +1,61 @@
+From 74ea7cf7a6a27a4eeb2ae24e162bcc942a6706d5 Mon Sep 17 00:00:00 2001
+From: Nate Prewitt <nate.prewitt@gmail.com>
+Date: Mon, 22 May 2023 08:08:57 -0700
+Subject: [PATCH] Merge pull request from GHSA-j8r2-6x86-q33q
+
+CVE: CVE-2023-32681
+Upstream-Status: Backport
+[https://github.com/psf/requests/commit/74ea7cf7a6a27a4eeb2ae24e162bcc942a6706d5]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+---
+ requests/sessions.py   |  4 +++-
+ tests/test_requests.py | 20 ++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/requests/sessions.py b/requests/sessions.py
+index 6cb3b4dae3..dbcf2a7b0e 100644
+--- a/requests/sessions.py
++++ b/requests/sessions.py
+@@ -324,7 +324,9 @@ def rebuild_proxies(self, prepared_request, proxies):
+         except KeyError:
+             username, password = None, None
+ 
+-        if username and password:
++        # urllib3 handles proxy authorization for us in the standard adapter.
++        # Avoid appending this to TLS tunneled requests where it may be leaked.
++        if not scheme.startswith('https') and username and password:
+             headers["Proxy-Authorization"] = _basic_auth_str(username, password)
+ 
+         return new_proxies
+diff --git a/tests/test_requests.py b/tests/test_requests.py
+index b1c8dd4534..b420c44d73 100644
+--- a/tests/test_requests.py
++++ b/tests/test_requests.py
+@@ -647,6 +647,26 @@ def test_proxy_authorization_preserved_on_request(self, httpbin):
+ 
+         assert sent_headers.get("Proxy-Authorization") == proxy_auth_value
+ 
++
++    @pytest.mark.parametrize(
++        "url,has_proxy_auth",
++        (
++            ('http://example.com', True),
++            ('https://example.com', False),
++        ),
++    )
++    def test_proxy_authorization_not_appended_to_https_request(self, url, has_proxy_auth):
++        session = requests.Session()
++        proxies = {
++            'http': 'http://test:pass@localhost:8080',
++            'https': 'http://test:pass@localhost:8090',
++        }
++        req = requests.Request('GET', url)
++        prep = req.prepare()
++        session.rebuild_proxies(prep, proxies)
++
++        assert ('Proxy-Authorization' in prep.headers) is has_proxy_auth
++
+     def test_basicauth_with_netrc(self, httpbin):
+         auth = ("user", "pass")
+         wrong_auth = ("wronguser", "wrongpass")
diff --git a/meta/recipes-devtools/python/python3-requests_2.28.2.bb b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
index 2f397ddaad..b57f71673c 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.2.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.2.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
 SRC_URI[sha256sum] = "98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf"
 
+SRC_URI += " file://CVE-2023-32681.patch"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
-- 
2.37.3


