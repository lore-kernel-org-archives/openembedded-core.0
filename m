Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A22C001B0
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 22:33:18 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.792.1689373991980176755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 15:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Tpt4z7MV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-55af0a816e4so1435486a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689373991; x=1691965991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoz9cfj/8YyWFsY52/0Je16U3ZOZUUZqQB654urGkT8=;
        b=Tpt4z7MVEb+2xvACNVfrU0zAvcqLXyGSWToLZd0HYEcXBqLdqZa5MhQ8kHZqIsDAqz
         PRYDm4FMUQHfmCkyBI73g6CFCrpUDv8OVt7gs7fD1Ndcv4LE0qjnQXFw38cxvIUf7wA8
         EoKexpjTc/XBf3xAX7KptqfwwUTN796rAP8DoUWwVA+/5mV5F+eFhE+re0vuXyzAMgQG
         oGS33q6HHe46e3vTdfx/yr71rB7l0qrQyML5NNZFCE+X9kQEFWIK5CerJmYZ+FqWs9vM
         Bgno3IxXjOA17j6h/elXGMhfprVz1y8KuEHylf9b9NjUG+RPRdYptjKcqvdaJ49CzxNT
         qWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689373991; x=1691965991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoz9cfj/8YyWFsY52/0Je16U3ZOZUUZqQB654urGkT8=;
        b=S2ndRzsOo57/kTZydjagxT3psJjJN3c02ZTu+sSdcnTCl7JjlpSVTAC+rziJ4CnDhG
         H8aCHmR89RogxSruHXw44g4OyDzk01udRw9g2OD4QBVGCZffRjsPpHPVabWflR+k37m1
         GDxzd0eVlmbSCXNdcnhyXaTPok+hD3YFTnnFlrqMRbZcm9rEQ1xS7EIAIQE6CQKWjcRp
         ZjL9WGnAyy0l8pW1yNweJaTcMRWOuVZyDDdAR9KtW60vshfZYwW3XWnbqkHCOQvo3Dz0
         Dn7EvDx2NzEvFssY4/uBYvemX0eAMknXI4FyRH31snNCSmyxUKO/gSdQDn78p1+1mv0W
         KMoQ==
X-Gm-Message-State: ABy/qLa8WQghuV/YtYaVUcawTvN1p1nQ2EOxzUzcZO/VGj5St9ps6z5u
	JK9IuuyxWPezhJkt6ChYRroBdMKvDeKgij4EOek=
X-Google-Smtp-Source: APBJJlG0Tcg9rpDxr6MY154zzFIyU4ak8qACNclJQxstjiF1whWAM32blCOOh21n+5Uel8VDjCXGpw==
X-Received: by 2002:a17:902:da92:b0:1b8:525a:f685 with SMTP id j18-20020a170902da9200b001b8525af685mr5202956plx.37.1689373990755;
        Fri, 14 Jul 2023 15:33:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902788100b001b80760fd04sm8236782pll.112.2023.07.14.15.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 15:33:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/26] python3-requests: fix CVE-2023-32681
Date: Fri, 14 Jul 2023 12:32:35 -1000
Message-Id: <11b6e64c07df043441824511c931fb0bc9673adc.1689373876.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689373875.git.steve@sakoman.com>
References: <cover.1689373875.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 22:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184283

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


