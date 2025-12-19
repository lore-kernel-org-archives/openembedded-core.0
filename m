Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355DDD74948
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:06 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9480.1766114584408675147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P+Al5KY6;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so1688657b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114584; x=1766719384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mArRNn9lzQitJ3hA+v5eW+5+do2GBBNQRn/bZaVZDeA=;
        b=P+Al5KY6wf8VVkNSJMvqjgeW6NJf63A4yof7EWgQhcDuCc4YrbS176xECJyOzQXihb
         gAA+oKYQFycoRmaXlvYFc3X5kggnA8od+auNeDpdDnhiEgGaVazcH2fm57vpvHXV3ORZ
         Xi1WiUSiKKOZrvPb70mPoJ0qwVt/X2oy18SuWMA++IHBBbykWsgMS9D+bnmMjBkamJw8
         b/tnRJ0E3C+cFcmPCWWHeZ1YNXgfEoNP6rvt1RXuJ3sBoxut2orFoVU/bSbvXfFuV8p4
         UVf60dfB5rCHLxTUQq1XIv+qzGXxZ1OMk0d+Rgd3D41KlPINH0oHrN7be5uv18fZrh5O
         Izjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114584; x=1766719384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mArRNn9lzQitJ3hA+v5eW+5+do2GBBNQRn/bZaVZDeA=;
        b=ZbsBnE9lc3YNzBkZ3g/WJPq1vJ1jDl5X4kmuhah7stlKYNBrlbGVmWWm46CVWAeMUz
         kftgsYc8jyrl/DMYJGmmwKIJZUAEVRvYfkx3OKdyZ10Ly+a5q0P/oYkZ23tWIR2nH9Z7
         383HqOte712+bXjlBeHZkFBC9WpYlgq/SuEWMs18GBK1mwtJTBqms2ex/uquTd8uuNIb
         Qk9UFaSgk7CDKsoiktbCTjA93e5Bbwub42aSi3bDACEcjhB29grl8uReWSzS7SobTu7s
         WXvySv/kwCHyrpUF9xzGsPlrocbgZd0RHCFxcJK0U0YlxCdY/8EVR+Vkl3h0RvhrB2hQ
         tuBA==
X-Gm-Message-State: AOJu0Yz1mtDI502gWo0Ce7q1zJbqeVu2NP7KJuDog6UTpTJKrblrV0Mh
	BSajbXFgBPNVBfCrKm1Khu1ZHmpX9bZs4a1tL63mNs0GYNfAdNtUpATIvE2hqA==
X-Gm-Gg: AY/fxX52QWku+N54TbtMFLse2b4OR1x6MFWme4ECtfSYcDYuf0mQI5faio98j/vnkxK
	LVKkOmti2vt4Lf03wv4jRG6FMOLaQ77lWuS4as7IHQzFD+3QIjR7k5k/RxFlFzbNbz/CRl/2koq
	D0NVJ8/XNqFj1Topkwy3CcoI2I58/5BUx5GERpq2e63HTtG30APG1RPc+cHQtfre5eNcvYZwnNL
	0ZLe0QMcVAoPJ1XwRVnfTOjnMfmvnRH9lShpqOqpqEdyQY8L+oo1Vs3SqZMF9bnmUoiFWqqvzFs
	DkQmihQ8NVg5XFmldcpDlNskk6mdBOMBE8jbp+EGODo8eGpYHIam9BfAbLTL33oquHwrxSH5T2B
	epRjVEIXqqZB3jZz72UG0yGNvgpqo3gpEsVWeUebpVK0L81YrcO6+BprKy8+Lpcw1micVbhNZX0
	rUnA+tuzA9W5AFpO1GyLtQGwJFOeWCzBN8lcM=
X-Google-Smtp-Source: AGHT+IEc4Cwy9coDem95mZ9QMJoi9sUBqyR84mn+ymVSiAruwQnn/yca9svfC26Edaa1rGXNRBbEYg==
X-Received: by 2002:a05:6a00:e8b:b0:7e8:43f5:bd1d with SMTP id d2e1a72fcca58-7ff6735e5a0mr1109446b3a.50.1766114583636;
        Thu, 18 Dec 2025 19:23:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 18/29] enchant2: upgrade 2.8.12 -> 2.8.14
Date: Fri, 19 Dec 2025 08:51:57 +0530
Message-ID: <20251219032209.960840-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228186

From: Gyorgy Sarvari <skandigraun@gmail.com>

Release notes:
2.8.14:
This release fixes a test failure in the previous release, and improves
enchant(1)’s word division algorithm, so that it only considers words that
contain at least one letter. (Words may contain characters that aren’t
letters, but Enchant was for example considering “1900” to be a word, which
is probably not helpful.)

2.8.13:
This release fixes a bug in the word division algorithm of enchant(1)
introduced in 2.8.4, which itself was attempting to fix bugs introduced in
the previous release. This could have caused a crash, but it seems we were
saved by careful bounds checking in GLib. Instead, it merely meant that
characters not valid at the end of a word were not removed as they should be
before spell-checking.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03477472cfc0417241486a3d04441ebb95f087e5)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 .../enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb}          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/enchant/{enchant2_2.8.12.bb => enchant2_2.8.14.bb} (91%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb7..cf36c519ce 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -170,7 +170,7 @@ RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-elfutils = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ell = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-enchant2 = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-enchant2 = "Gyorgy Sarvari <skandigraun@gmail.com>"
 RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-erofs-utils = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/enchant/enchant2_2.8.12.bb b/meta/recipes-support/enchant/enchant2_2.8.14.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.8.12.bb
rename to meta/recipes-support/enchant/enchant2_2.8.14.bb
index 84f0156bca..4f8f2cf7f8 100644
--- a/meta/recipes-support/enchant/enchant2_2.8.12.bb
+++ b/meta/recipes-support/enchant/enchant2_2.8.14.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "20e5fab2ca0f95ba9d1ef5052fe5b028e3e1d66d4cdea6b9adfcbd3e524c2a09"
+SRC_URI[sha256sum] = "d04588769399ff7140fa214b9731e6fc6eda9bb2e75df9f67263717710bb4c4b"
 
 GITHUB_BASE_URI = "https://github.com/rrthomas/enchant/releases"
 

