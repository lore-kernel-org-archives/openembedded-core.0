Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECC5CD5BAB
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7372.1779265257061644031
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:20:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KyO97jiu;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so29918935e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265255; x=1779870055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Byr2DJiLDcuepDfs8WDKma8Gg647t61r7Tuty5jeuvc=;
        b=KyO97jiug55d2K36dU/FZLt1mfhtRxd8D4c4NqBs5pKMU6kbj1L5Sc+ZwG4q2u1NOq
         gOjZ8SUzQ4ao82YUfdR3K1zpY7SKK+RmGKp9RXXc4FxGRi0WAtSQDzKkLFX+kegpJTJ1
         Brk5uHwpk98YWCagcDxUPmgLmBaDkr4e/8lGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265255; x=1779870055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Byr2DJiLDcuepDfs8WDKma8Gg647t61r7Tuty5jeuvc=;
        b=TH8lBglnXswb1O9J0kYQfh/1/4U2FRwTvP6JppksyEeRYnUzmdR1C6IaYOthMhTYN3
         TabtihdI/jhQc320ULvPG0w10nhIR43yXq9Cul0lrQfqxL+LKu0whheB6vfX/nok0Tun
         PhCI2oSKG17KyOhrPSms4rdqVvHJFiT7WgnGwlTF5ObOj+PdILrdstyxexNA9YR3/hVi
         Q6RVXXefldKn1Cyt9pQ0r9D+cQVE1F6J9kAdVQUR8GCTag9b5KSFgGHPGE76yHuBE0Ll
         b2MMjjmi1VHrFyai2/KTZ/xx5cXFilaB+mViXpRCo8+vk6ilzN3ifi0YQBfZYqj+Gbql
         sSwg==
X-Gm-Message-State: AOJu0YxBnBoRJnhpHTTd7QUf18+WSTQ9IVr5F4B6dx9JWi5E8ngoFy73
	pet9AfvSfnSKrO0Ggk2CW60I5dmovI3DSxSxkYkzqrDV0eexLEmJjCpF36swSTt/NWWILKfKRKc
	M7iI1
X-Gm-Gg: Acq92OGvJqJHtFhd6M7nnvMkDKaG6XWgd7PY88CJlZHDEwxujbI9TaRNq/ignK+2lHV
	nQx/ZoYhNibru1P06yER5CvcNTz+vvBqJaZ67zEStzP4/2D5NLn+SaJS7fonXMWVAtdXY3CgzRO
	MOX3V+SwbRglamMr+XyjHvpW+ES0m5HtJn31GvkdfiCtYRdbYPS5wDvABTN/1kZW57PLGYb8CoQ
	O34nlSiCveeoF1yuYxf+PtdIxzH13KfwUPrZeWuAtE+7UEikqLRourekRZb2NXo9DtnHLc7QQZ0
	L4WJlZWADTDNSsFU1FBCYxkea1anKiZrIMJuXzf4mDPJdASDmjFgkGyZ7mYq+JEhhQXrTqtkIkn
	tylciPys5Ar7h9ZD9kLVXeMwmVaZkA2Z6qNlD7VDZp7WZpZUG42wqHORtt84NyxVg0S3GmlRu2F
	pOaCPBLyWZThXQ+m3S6fzxJWs6JsnMYVpLBpHftD2Wui5yvxpK1oydrD4Y6DmqcuiJO4UbjtnSP
	8niPGf/EM6QqpU1yYo4PUSrmogXQVp8/M+8Uaw=
X-Received: by 2002:a05:600c:470e:b0:48d:361:4df6 with SMTP id 5b1f17b1804b1-48fe60eabbcmr337537115e9.9.1779265255102;
        Wed, 20 May 2026 01:20:55 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 02/28] python3-requests: Increase chardet upper limit
Date: Wed, 20 May 2026 10:20:03 +0200
Message-ID: <545fadfed8c87d1d7d112eb78d59dfa9e815b1d4.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237401

From: Daniel McGregor <daniel.mcgregor@vecima.com>

OE Core includes chardet 6.0, while requests warns for any version
greater than or equal to 6.0. Not for any real reason, but because
it was a higher version than what was released when requests 2.32
was released.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...01-Increase-chardet-upper-limit-to-8.patch | 25 +++++++++++++++++++
 .../python/python3-requests_2.32.5.bb         |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch

diff --git a/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch
new file mode 100644
index 00000000000..662049ef94d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/0001-Increase-chardet-upper-limit-to-8.patch
@@ -0,0 +1,25 @@
+From c6a303bc6ea1d1d2ee5be86c4eed92cbb325c1fe Mon Sep 17 00:00:00 2001
+From: Dan Blanchard <dan.blanchard@gmail.com>
+Date: Mon, 2 Mar 2026 17:49:19 -0500
+Subject: [PATCH] Increase chardet upper limit to 8
+
+Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
+Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
+Upstream-Status: Backport [https://github.com/psf/requests/commit/b2a1d33f571518ca9a6148e7da787cc5827f897a]
+---
+ src/requests/__init__.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/requests/__init__.py b/src/requests/__init__.py
+index 051cda1..f22eb37 100644
+--- a/src/requests/__init__.py
++++ b/src/requests/__init__.py
+@@ -76,7 +76,7 @@ def check_compatibility(urllib3_version, chardet_version, charset_normalizer_ver
+         major, minor, patch = chardet_version.split(".")[:3]
+         major, minor, patch = int(major), int(minor), int(patch)
+         # chardet_version >= 3.0.2, < 6.0.0
+-        assert (3, 0, 2) <= (major, minor, patch) < (6, 0, 0)
++        assert (3, 0, 2) <= (major, minor, patch) < (8, 0, 0)
+     elif charset_normalizer_version:
+         major, minor, patch = charset_normalizer_version.split(".")[:3]
+         major, minor, patch = int(major), int(minor), int(patch)
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.5.bb b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
index 3477a5d83e9..4c58436cef4 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.5.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.5.bb
@@ -8,6 +8,7 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "dbba0bac56e100853db0ea71b82b4dfd5fe2bf6d3754a8893c3af500cec7d7cf"
 
 SRC_URI += "file://CVE-2026-25645.patch"
+SRC_URI += "file://0001-Increase-chardet-upper-limit-to-8.patch"
 SRC_URI:append:class-nativesdk = " file://environment.d-python3-requests.sh"
 
 do_install:append:class-nativesdk() {

