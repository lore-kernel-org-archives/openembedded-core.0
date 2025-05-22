Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE194C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:51:59 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.23255.1747918315084802626
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=hrmQDW8j;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5568355ffso716339085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 05:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747918313; x=1748523113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hsYPcUOqJToPF/7idFsCh+/P3uKIVw6KgyRGA5wxz1A=;
        b=hrmQDW8jHdal7s18PXZS57HPoF0dgP5RbbFnqtpB8aomq3FK3FwKXt/73n5FjuugAh
         Aubmr6p/t00dq1jWedYA6ol8PaP1XtkE+0f8E/0n647CH9LhtdlliJT8EQF6yXC0v7sR
         GvaZpjcrLExfyoDm6zqrGZq0Kyv00kHzMceu9EAh3nDOdVuhWj5yR7zdd9uwEEHylHh0
         ZM7dt4fJH+q5nQp6qAkj+QI/QIPRqjxOYCUTP4fI9k8mDFuTISv+CVAhMQh6WAxciOrE
         M+znI9ACi2vIlZN7YGXEsGKD7d41+5jiYpesnR0y3KqmBZSnaNEr2Zxia1D4gtiKhQWo
         fN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918313; x=1748523113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsYPcUOqJToPF/7idFsCh+/P3uKIVw6KgyRGA5wxz1A=;
        b=ejlFb3dJXUlizi5HrLQoZOULlDX3wVAOwkMt4G53ruS47FN7/mIgv+R/jgz8IyYtoB
         0HTMFSyyDQqN9le0I8yXpawnlAtRsVKPeJErUkxo1xr2c8O++4Pm4830LuCBV2stQU8m
         5Qo/1PbtaGyUTA/6aIc1cj9pm1t8lTIwN6Ybdu3wg/7P3waRL1JjqBfgz5/ZJwrdNyxp
         7ivPQDRXXGYfpxDZUrqJUT0pN0pd9R08+dWPkDvqNAdcq4IW57TLCCSD1itvHqQOFSaN
         NyY7OMdtoy6sz2n/UB+jmvp1qG+7/2CtsP6fWavami9Fe57R/VjgXiXt/FzPNetEkgcz
         j0mw==
X-Gm-Message-State: AOJu0YwphS+OA8bLq+EaG/w8qBKOSEU0w4cq+EGxcF6aD6LeyINZrB9Z
	NCv19YZlS3CjgziPwSnMSa4xedag8Q2FWx4tPIpj/lHupgDDlRcDWvxJ+3EWLXn3VKk64JpodgW
	KdEoR2gM=
X-Gm-Gg: ASbGncsNdO+1aSUUCjB9ofBPtiWpNRGbs73dlblsxQ5f/taMXbbwJBg/HWZ8+PIeRQp
	6ez1B0J/61g9yJ4FEmGzv5z6oG2G2idWszJ7g8XKFdZiFIih2ALFTWRKn2oUJi4je+RT6FwBCGH
	07Ae7VPkUcOJT71qCpypzufopZywdJ7HMmstefzA0oAje0pW8BwOqHbIukCweeu6VSH7Dg69Zly
	3eQqf2OYe2uN22Auy4UMNk1h5m9Qb6HjmCoY2VeymoCyTivVnFTQZAqT66GHE0cZjyny+oqn0LB
	ScCCtwukrFr/Ba9cfzGhJBWJavT0+FozOtRCGKkfri4K60TDJGKQ7X/ty5zV+qchHVep8NW8f4b
	TbNQsYasb5RjNXS8/XbWx+w==
X-Google-Smtp-Source: AGHT+IFTsog6uE4kYMh1AM8jcPMZ6oVgH6wEPB5c8Ky0VcIEIcUqrkAEXqViuIXrCxX6W3it61KS8g==
X-Received: by 2002:a05:620a:2953:b0:7ce:d0ce:ae9a with SMTP id af79cd13be357-7ced0ceaecemr916237985a.1.1747918313470;
        Thu, 22 May 2025 05:51:53 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc4dcsm1012599585a.96.2025.05.22.05.51.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:51:52 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-setuptools: upgrade 78.1.0 -> 80.8.0
Date: Thu, 22 May 2025 08:51:50 -0400
Message-Id: <20250522125151.754566-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217102

Changelog: https://setuptools.pypa.io/en/latest/history.html#v80-8-0

Notably:
- There was a temporary removal of the LICENSE file (restored in
  v80.8.0);
- The easy_install module has been mostly removed; what remains is a
  temporary stub for compatibility purposes.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ly-do-not-fetch-code-by-easy_install.patch | 37 -------------------
 ...78.1.0.bb => python3-setuptools_80.8.0.bb} |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
 rename meta/recipes-devtools/python/{python3-setuptools_78.1.0.bb => python3-setuptools_80.8.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
deleted file mode 100644
index 785a2192c3a..00000000000
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 92363514224b0aeba065f83b868a15a2a03601ab Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 17 Jul 2018 10:13:38 +0800
-Subject: [PATCH] conditionally do not fetch code by easy_install
-
-If NO_FETCH_BUILD is set, do not fetch code in easy_install. This avoids setup.py
-trying to fetch missing dependencies at build time.
-
-This is only used by the deprecated codepath as implemented by setuptools3.bbclass, so
-when that ever gets removed this patch can also be deleted.
-
-Upstream-Status: Denied [https://github.com/pypa/setuptools/issues/4735]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Update to apply against v75.6.0.
-
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- setuptools/command/easy_install.py | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index eb1b4c1..4fd8d14 100644
---- a/setuptools/command/easy_install.py
-+++ b/setuptools/command/easy_install.py
-@@ -672,6 +672,11 @@ class easy_install(Command):
-             os.path.exists(tmpdir) and _rmtree(tmpdir)
- 
-     def easy_install(self, spec, deps: bool = False) -> Distribution | None:
-+        if os.environ.get('NO_FETCH_BUILD', None):
-+            log.error("ERROR: Do not try to fetch `%s' for building. "
-+                      "Please add its native recipe to DEPENDS." % spec)
-+            return None
-+
-         with self._tmpdir() as tmpdir:
-             if not isinstance(spec, Requirement):
-                 if URL_SCHEME(spec):
diff --git a/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb b/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_80.8.0.bb
index 7455ec41af8..327eff57000 100644
--- a/meta/recipes-devtools/python/python3-setuptools_78.1.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_80.8.0.bb
@@ -8,12 +8,10 @@ inherit pypi python_setuptools_build_meta
 
 CVE_PRODUCT = "python3-setuptools python:setuptools"
 
-SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
-
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "18fd474d4a82a5f83dac888df697af65afa82dec7323d09c3e37d1f14288da54"
+SRC_URI[sha256sum] = "49f7af965996f26d43c8ae34539c8d99c5042fbff34302ea151eaa9c207cd257"
 
 DEPENDS += "python3"
 
-- 
2.39.5


