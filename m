Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DACC76196
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:42:49 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.437.1679092967976679208
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=HGQSm4Ey;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso10572962pjb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxWrJVAiRi75K2COtbRA+oMaLTUL7yK74e6AcQOXJwU=;
        b=HGQSm4EyfZopffCBw+40WvUtLllGpd6LUsu17uZ5owfUJXMWbNjVgoxsi/LowgCvgX
         xMKQua0iCytZWquGsVDYHJpcwnghra4mxQ8ip8Q+UqbPbNqmkAwaNoaNQ9m0GdwSO5mv
         kQTDGtHfkE3+oVWn5syIPlC1LeDPCw6M9zYAmxqDhZBfHJ5WqyAu3IBWAFvK3Yn5EU1i
         pHn1EfycjsWCXHYEkXRRMP0Zx9u2IsWxGxbCdtYGdgykwBw1MHW9kv02vwB6Z6hbSBSz
         kM2WVMwhz95Qoz5IElkSHPxfkStL/cq72ZdwA78djuxj/01HDoTXUU9Cjys4QMZfAt9K
         Jdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxWrJVAiRi75K2COtbRA+oMaLTUL7yK74e6AcQOXJwU=;
        b=Vzxx2SsaZ65BOZoxq8SgXbu4zHX3a5yaIlKzWaLYw6MvkBaG/u5ImpilslkEh00NHF
         JyTrA16Br3MN8DgzFAVZDjtZ+fu89UxiUx/4bBsB7hnmnMUXbBPfjD5nO+5QDm2W1+wa
         +lbe3ta2Hj0bRXf+5iP2LeHfQ4eV38/9/h3Q3xknTKUXP+gXLUOWd22BOGmpRvo4sniB
         zsD7QQxUUCIEDaubFxX4wXtkZiq7N+LXf+WVoVhm7TVNn5U1+C/qSn3Fmxo42iso40eA
         hEkq8bwxsKPi3EPSS1icVHoWpXhprB8veIrcGbTsKNPcahKEaTQTSb69OVswNK6gNcoR
         R6iA==
X-Gm-Message-State: AO0yUKXr3mZpe1n+PL+Za1ws+IZhLDPAiUgK8xJ0RS98gfxi503tKtF7
	tNmoQaUxYfOvwvxkMI/Lomsc6/9vNoFy6HkCU30=
X-Google-Smtp-Source: AK7set/nIT9Xx94f/7zvWA14Mhm82BSLyn8SVwixi2NjIccqtUwmGV0yLuwonHNYYaOW/khW8IYZyg==
X-Received: by 2002:a17:902:ecd0:b0:19f:3e33:b845 with SMTP id a16-20020a170902ecd000b0019f3e33b845mr10362127plh.26.1679092966992;
        Fri, 17 Mar 2023 15:42:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/21] python3: fix CVE-2023-24329
Date: Fri, 17 Mar 2023 12:42:16 -1000
Message-Id: <37defd828cc6a8267139928730d766167905d21a.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178763

From: Joe Slater <joe.slater@windriver.com>

Backport fix from cpython 3.11 branch.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/cve-2023-24329.patch       | 50 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.10.9.bb |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/cve-2023-24329.patch

diff --git a/meta/recipes-devtools/python/python3/cve-2023-24329.patch b/meta/recipes-devtools/python/python3/cve-2023-24329.patch
new file mode 100644
index 0000000000..d47425d239
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/cve-2023-24329.patch
@@ -0,0 +1,50 @@
+From 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sun, 13 Nov 2022 11:00:25 -0800
+Subject: [PATCH] gh-99418: Make urllib.parse.urlparse enforce that a scheme
+ must begin with an alphabetical ASCII character. (GH-99421)
+
+Prevent urllib.parse.urlparse from accepting schemes that don't begin with an alphabetical ASCII character.
+
+RFC 3986 defines a scheme like this: `scheme = ALPHA *( ALPHA / DIGIT / "+" / "-" / "." )`
+RFC 2234 defines an ALPHA like this: `ALPHA = %x41-5A / %x61-7A`
+
+The WHATWG URL spec defines a scheme like this:
+`"A URL-scheme string must be one ASCII alpha, followed by zero or more of ASCII alphanumeric, U+002B (+), U+002D (-), and U+002E (.)."`
+(cherry picked from commit 439b9cfaf43080e91c4ad69f312f21fa098befc7)
+
+Co-authored-by: Ben Kallus <49924171+kenballus@users.noreply.github.com>
+--- end original header ---
+
+CVE: CVE-2023-24329
+
+Upstream-Status: Backport [see below]
+
+Taken from https://github.com/python/cpython.git
+commit 72d356e3584ebfb8e813a8e9f2cd3dccf233c0d9
+
+CVE fix extracted; test case and update to NEWS abandoned.
+Defuzzed.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ Lib/urllib/parse.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/urllib/parse.py b/Lib/urllib/parse.py
+index 26ddf30..1c53acb 100644
+--- a/Lib/urllib/parse.py
++++ b/Lib/urllib/parse.py
+@@ -469,7 +469,7 @@ def urlsplit(url, scheme='', allow_fragments=True):
+         clear_cache()
+     netloc = query = fragment = ''
+     i = url.find(':')
+-    if i > 0:
++    if i > 0 and url[0].isascii() and url[0].isalpha():
+         for c in url[:i]:
+             if c not in scheme_chars:
+                 break
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/python/python3_3.10.9.bb b/meta/recipes-devtools/python/python3_3.10.9.bb
index d6b7a618c1..867958c0fb 100644
--- a/meta/recipes-devtools/python/python3_3.10.9.bb
+++ b/meta/recipes-devtools/python/python3_3.10.9.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           file://cve-2023-24329.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.34.1


