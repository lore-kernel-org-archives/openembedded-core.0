Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E3EDC4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 19:03:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.45245.1707073389280820873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 11:03:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MfRUVuY3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40fd280421aso9380775e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 11:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1707073387; x=1707678187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/RFMvy9UHWfHiabmwN86kDxGeQw3rYLSZuj0fxrhaY=;
        b=MfRUVuY3sFfv+3ImbYqY2RXTMu2NUk64qPBS55L2AX9fr2kvK2LTVlMj/0Nr1EVOe4
         rGxMH2f8bfuH8V3Lc6gyWfhHqvWoaNy2r2LOAYKKE9avJTll5k7dlhzQeuqrj3T5kQb/
         XAUpIcTtScx30xRCiQ/2bzpH7HqqqhzMDOKn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707073387; x=1707678187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/RFMvy9UHWfHiabmwN86kDxGeQw3rYLSZuj0fxrhaY=;
        b=YEwE++n6zYr+xwahyQPLEXMWDOgyKOxXd3yVNwkPPpDVaQ3S/5Fw80uKTGMBr9HCf4
         C8nbpI5sG63qLWhaxTa1WjuSVeJ5Tdw8Y1OBZSkkbLJHOwYmp79YvJU/sHccI84zO4tn
         y31XHPdaql9H2WywnP3hXN8llxcp2mO9Dwv52pearht0RoXCPdZlSewEfSAVsQTjW7j0
         D+V0FAsS7SG/8Db1F8uB2WXEdIUg/Xex82DYA592njYX65MYcp0I6h8xCoLCDYYZkrxM
         t2DNfWmvVzsKw59h9cQ/ZLBcyP7Wth5hDaBl67lihyHgDx5cIlCzjOw1RqATvS7p1Y5/
         KrTg==
X-Gm-Message-State: AOJu0Yx8/od67WKTUVu0KJ1iq+Ia5RONgt1kYviAMjPwjluYRGdl1guX
	tmsgyeuLLkgEoE2ODmJAm0aLr6d9WOVnA4y5Gj4FJ7Acl9ffZfeM6H+SsHRGBdvWkCxW0dHnKJx
	E
X-Google-Smtp-Source: AGHT+IFJQwniJ2PlxrTt8Q5/WBnLP9rcPWig3Gqyqg7bFPN1kTpw9Gtym6aHzeGOrfH9L/cTD8bP1w==
X-Received: by 2002:a5d:408d:0:b0:33a:e77c:89d with SMTP id o13-20020a5d408d000000b0033ae77c089dmr4575227wrp.59.1707073386985;
        Sun, 04 Feb 2024 11:03:06 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8ea0:9a0d:a119:2213])
        by smtp.gmail.com with ESMTPSA id x5-20020adfdd85000000b0033afe6968bfsm6446025wrl.64.2024.02.04.11.03.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Feb 2024 11:03:06 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] conf: Move selftest config to dedicated inc file
Date: Sun,  4 Feb 2024 19:03:04 +0000
Message-Id: <20240204190305.2332461-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194906

Create a no-gplv3.inc file based upon knowledge currently encoded into one
of the selftests.

There is a risk that people try and take this idea too far, or have unrealistic
expectations. That said, it would be better to collect this knowledge together
in one location rather than handling it piecemeal.

Therefore move the configuration information from the test into a common
incude file.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-gplv3.inc         | 24 +++++++++++++++++++
 .../oeqa/selftest/cases/incompatible_lic.py   | 16 ++-----------
 2 files changed, 26 insertions(+), 14 deletions(-)
 create mode 100644 meta/conf/distro/include/no-gplv3.inc

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
new file mode 100644
index 00000000000..48cff29ad4a
--- /dev/null
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -0,0 +1,24 @@
+#
+# This include file is to document commonly used configuration options to minimise
+# GPLv3 content in images.
+#
+# The intent is to allow some images/configurations to build, not everything. There
+# will be a cost in reduced functionality.
+
+# Settings for full-cmdline
+RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
+RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
+RDEPENDS:packagegroup-core-full-cmdline-multiuser:remove = "gzip"
+
+# Settings for weston
+# direct gpl3 dependencies
+RRECOMMENDS:packagegroup-base-vfat:remove = "dosfstools"
+PACKAGECONFIG:remove:pn-bluez5 = "readline"
+
+# dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which pulls in rpm-build which pulls in bash
+# so install rpm but not dnf
+IMAGE_FEATURES:remove:pn-core-image-weston = "package-management"
+CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
+
+# matchbox-terminal depends on vte, which is gpl3
+CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
diff --git a/meta/lib/oeqa/selftest/cases/incompatible_lic.py b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
index 1597d30ab03..f4af67a239e 100644
--- a/meta/lib/oeqa/selftest/cases/incompatible_lic.py
+++ b/meta/lib/oeqa/selftest/cases/incompatible_lic.py
@@ -144,20 +144,8 @@ INCOMPATIBLE_LICENSE:pn-core-image-minimal = "GPL-3.0* LGPL-3.0*"
 IMAGE_CLASSES += "testimage"
 INCOMPATIBLE_LICENSE:pn-core-image-full-cmdline = "GPL-3.0* LGPL-3.0*"
 INCOMPATIBLE_LICENSE:pn-core-image-weston = "GPL-3.0* LGPL-3.0*"
-# Settings for full-cmdline
-RDEPENDS:packagegroup-core-full-cmdline-utils:remove = "bash bc coreutils cpio ed findutils gawk grep mc mc-fish mc-helpers mc-helpers-perl sed tar time"
-RDEPENDS:packagegroup-core-full-cmdline-dev-utils:remove = "diffutils m4 make patch"
-RDEPENDS:packagegroup-core-full-cmdline-multiuser:remove = "gzip"
-# Settings for weston
-# direct gpl3 dependencies
-RRECOMMENDS:packagegroup-base-vfat:remove = "dosfstools"
-PACKAGECONFIG:remove:pn-bluez5 = "readline"
-# dnf pulls in gpg which is gpl3; it also pulls in python3-rpm which pulls in rpm-build which pulls in bash
-# so install rpm but not dnf
-IMAGE_FEATURES:remove:pn-core-image-weston = "package-management"
-CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
-# matchbox-terminal depends on vte, which is gpl3
-CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
+
+require conf/distro/include/no-gplv3.inc
 """)
         bitbake('core-image-full-cmdline core-image-weston')
         bitbake('-c testimage core-image-full-cmdline core-image-weston')
-- 
2.40.1


