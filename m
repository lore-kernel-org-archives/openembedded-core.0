Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8365ACA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 05:17:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2045.1755839852823969477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 22:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H+4fc25J;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24626e06f04so6822045ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755839852; x=1756444652; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6C1OxrkABBf5Xy6RrIqfUAsVsRp3tbg/+8ph6r1Q6I=;
        b=H+4fc25JBFYz3SfFzRNTlNfGTEeO5cshm6QpHoOy4XrV1MCrQMdlohhpyHKWnC56mE
         ZuYnLhhxz7UJdQYxYs1v6Mp1jP962RHshwpK8Y9MSLfRWlMXFbbxbd1fnRtMrk995I2s
         mEQc5hFwhGRIQpu6TrJ4HdvL6JGkhMUf5aAVMyBEjExvtgWtF4aYqgdgceYIoBgtUcUu
         LXTn41V+AzVk+RnyffE5ssPzmuPzRYHOb3U3UcTFcHKgL7qPq7J/h3hotKDXMAZ5F7pU
         xIWINVHf2i4VSK0uXCFgPbHV8VKjFOsP+1XbBIWmuwB3e45aBan1nFb76rYx3ZAIadgL
         rYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755839852; x=1756444652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6C1OxrkABBf5Xy6RrIqfUAsVsRp3tbg/+8ph6r1Q6I=;
        b=WkE7u3iVJgLS6fZPmsF4gwnXyNN+ujG+3c2fbuCaOKAojpez2ZQfkrnLeb/YKWgd82
         6GFf6soDd0UyzSFcPI1uhM64vD8fN2T3KlV9FvvPsJkSizsAp5fwkAVR5W8J2zH0043O
         kBtGNIoJ8tS1VD2Rts7KAroer5BamFDXmdq++fGuAS/VD2CNLw4moFGWtwA66k7AxEoe
         gnmC8pfM+DrlJW3QevT+HULYQZIxlcN0pR/CLwmszj4dNoFZWVV9+JhT1d5qb6I5fA8j
         bXFT+R4WvYkhdtwv5tcuE7f4sNw873vs2zArphKLKT9qTZOJW+oRd7xnrbNf2GWURWIZ
         Ms7Q==
X-Gm-Message-State: AOJu0YzyjFiswanoZo28207HS0crhRxhX9z4vbws0poCL24QTZX3oAXn
	zWVtjfW8sFm0sU7729jm9kxFvdR9QpVGgKIaxs6PDtOlyGOc4NQBvk2NEE9L0WdR
X-Gm-Gg: ASbGncvanBTf3tMgyiADccjjP5/73hazTq8jCfcjG6XIt3y+h9lB0DAKZDniKF2m1rV
	23RBQsOUvgSv7D+U0YvwJB7iXQU7pjShGIfPkv1bfhJQa5M6GlJml+1OkRz818vJCt97MQrSqHB
	RcKJ5Cmk+Sj0xVIqJ8cfoTaQeK6BR9jW7leatqvTaY8bWW3Nt6PnYCXSSlXhhcazZzjfMznq+4R
	lPvdOn7Nnvys2rcRyWBdTvQOS0SIaekCo0+/kxmhFH2eEqdhhSIB+2VKJOrK2hU0L0oPCMLgo7W
	CAeWRlBTd6pQg3/BJ3vOZPKUJWMeahDxHK9VmqocFKoGlysuT7nMrpoh+UtDBo10LI8SkfQvFT3
	BQ1rf4+0xYAjCx4ilVzro1R3YUeVtrOiTfoF51wUC8lo0BgIuDyy5c7D+a+6GRKjyn3fuBX/mUz
	mB4rFCMsbBKg15Q9QY1KcUXmhnbA+V/inZ57E36s2jBQuO+8CgNQ==
X-Google-Smtp-Source: AGHT+IHSeAsA3gk8JAzKSaZ0wjIqsmHuZxAP/C1Yr1/suAKCk50jqhfxrA67pD8kB0RdWRT3RCw0zQ==
X-Received: by 2002:a17:903:3843:b0:240:44a6:5027 with SMTP id d9443c01a7336-2462ee86251mr25144895ad.15.1755839851863;
        Thu, 21 Aug 2025 22:17:31 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ebf7dsm71631015ad.120.2025.08.21.22.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 22:17:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] gettext: Force UTF-8 runtime and skip requiring ISO-8859-1
Date: Thu, 21 Aug 2025 22:17:25 -0700
Message-ID: <20250822051726.2429206-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822051726.2429206-1-raj.khem@gmail.com>
References: <20250822051726.2429206-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 05:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222305

On musl, there is no real legacy (non-UTF-8) fr_FR locale.
These tests are designed for libcs that ship both fr_FR (ISO-8859-1)
and fr_FR.UTF-8. So the right thing will be to SKIP these tests

Unsetting LOCALE_FR will ensure that it does not enable ISO-8859-1
path, so reset it in run-ptest but thats not enough because it is
being set in the test's own init-env file as well so clear it in that
file as well.

Fixes
Failed ptests:
{'gettext': ['intl-2', 'intl-4', 'intl-thread-3', 'lang-sh', 'lang-bash']}

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.23.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.23.1.bb b/meta/recipes-core/gettext/gettext_0.23.1.bb
index e160d4839dc..509438c2a7a 100644
--- a/meta/recipes-core/gettext/gettext_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.23.1.bb
@@ -179,6 +179,16 @@ do_install_ptest() {
         sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
 }
 
+do_install_ptest:append:libc-musl() {
+        # Force UTF-8 runtime and skip legacy fr_FR subcases
+        sed -i '3i export LANG=fr_FR.UTF-8; export LC_ALL=fr_FR.UTF-8' \
+            ${D}${PTEST_PATH}/run-ptest
+        sed -i '3i export LOCALE_FR="none"; export LOCALE_FR_UTF8=fr_FR.UTF-8' \
+            ${D}${PTEST_PATH}/run-ptest
+        sed -i -e 's|^LOCALE_FR="fr_FR.ISO-8859-1"|LOCALE_FR="none"|g' \
+            ${D}${PTEST_PATH}/tests/init-env
+}
+
 RDEPENDS:${PN}-ptest += "coreutils make xz bash gawk autoconf locale-base-de-de locale-base-fr-fr"
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
     glibc-gconv-big5 \

