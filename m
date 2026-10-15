Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFA1CC6B34
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 14:23:40 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41434.1792074216238562027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 07:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=SijQbgGr;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.54, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c37df3fe55bso51491366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792074214; x=1792679014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=SijQbgGr+CD4WtEN/kwZhQ42SgbdeSljd3sqfG3b5hn+IJIiO9Q2cWfAPUlliwKlL/
         uItgoOroMfB6zcdukUKilRUryZsDDWWmSuNFKYchuGdkxH+aTikOu+TukqBfkv0TIT1G
         dgljI9q5Z9C0p/rxrNg1ba8ZrP2RwnXIOMbPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792074214; x=1792679014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gx7cJZTp27XKDa/D6tqXUH7BccgF3znA3x9uQjA+mtU=;
        b=ZzYLCGIpqnKIpGCzM7Y4vxiHBGiKXoX4Kidb6XrBcbn1bHsujmTcRSXy47rA6GilDm
         cywBao/adB07vEqAOnl0pxFz1jHnKgvgINFyRAk+OF0H1YsGHFJvrH7ZRVp5NwND6WHG
         IkxqiHyAOrIFzEVms7sLysOr0GAA9MLv1dkawersdICuOhT1aX0dDWDbcHtj5Ve4hHeS
         MTKDkG6hubZddOI5+N/ySSusQ5Ag4hEw5GIoqpjXpdQwuX7ddLgjaAZO/UbujD7WSGnv
         kwyy6lNTIGQfFYHe9tMVPlWFJ4ZAlHz+fTNGJwzfRez8R1bkrRuR3w0gDJ1V7Fgab0LX
         jTHQ==
X-Gm-Message-State: AFq9FYLsikMSJ0paGclrWSzVzXvYhDfYp96xdIVCmAi2u8KkFAVuSS5h
	W+OM5qOKngw5ZdUZ25/K041nNKs64ZG6pX6ord+hc1SBUZSVYBO7QRURbRCWyp4nER0NAWw5W32
	MgmvK3+Y=
X-Gm-Gg: AYBFou2otD8IxvPSjq0MrU6Fi7sZPnhTPwroz9oCEPamSLxtJa2XYj0FV9ASifdCHXX
	W7SH/zpVFs5sixzjuNNwiKYkW/j7WXgpVZG6iak/0JlCdDjA2ElmunLF5adBVBQHBHjBobfAqe6
	PrhQVASDMojSzpe0UJbdnrfAVx5necTdVb0jyCwa+Kw5cyHPKWTvui1ENzwgJ1tW63ReGWqaUvx
	JBCrkvTH68k9NsMXLnSxZxpDeR0RinpqCG4PSQXENvqNkkuWSu3n/rZFYtXLL3CnxSmJwBbhJhH
	C41bzTkjJ6MNWwaUHWrdLAwEeLIsGxxkugbHm3bVq+lSSa40+lnTuB/RCFs5DjFa0UhYpyR5fn7
	+N0d8J3llZQbiiZj2l0tBMRVhdPIMGOgyUqqY8SHceXRl4EZay57i3EKR07yuZIVxGR5owknnhP
	JK2hyiJT6EIqwKTqtzX6bpHuIIXuXIy8owLJciqNA9+tM3OXqWouc9gbqRzngKNdwPaKcaXuqXr
	0re11l55NKxt24b0MgEY3frs8xj10ft9ff3Y+1aP4EbfhmVFg9rMpyM6soplkj5I9kZTdkcQKWf
	+CYUtmDkGFzyLQT5PoOifkK2R7j1AsXCoo2ki78Xtke13XZuWu1IlfUrJtmAOVL0aE3qqTJSjsg
	2VJCPec64UtUx838=
X-Received: by 2002:a17:907:d22:b0:c12:6db4:4bf4 with SMTP id a640c23a62f3a-c31a96e70d7mr1994874766b.0.1792074214243;
        Thu, 15 Oct 2026 07:23:34 -0700 (PDT)
Received: from adam-linux.amarulasolutions.com (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e42csm132825266b.26.2026.10.15.07.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:23:33 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v10 1/3] rpm: add 0017-critically-fail-if-post-install-fails.patch
Date: Thu, 15 Oct 2026 16:23:28 +0200
Message-ID: <20261015142331.3639101-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 14:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247886

Starting with commit b5fe8a926aeb80e3ce84787e7624685326a2f412,
DNF5 respects the callbacks of RPM and no longer fails unless
RPM reports a failure.

RPM does not report post install failures as critical. However,
Yocto does expect DNF to fail on post-install failures.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 ...ritically-fail-if-post-install-fails.patch | 34 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch

diff --git a/meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch b/meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch
new file mode 100644
index 0000000000..05e8ba0cf5
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0017-critically-fail-if-post-install-fails.patch
@@ -0,0 +1,34 @@
+From 390841ea7870408826fbddacf50f07a70778a22b Mon Sep 17 00:00:00 2001
+From: Adam Duskett <adam.duskett@amarulasolutions.com>
+Date: Thu, 30 Jul 2026 12:48:24 +0200
+Subject: [PATCH] critically fail if post-install fails
+
+Starting with commit b5fe8a926aeb80e3ce84787e7624685326a2f412,
+DNF5 respects the callback of RPM and no longer fails unless
+RPM reports a failure.
+
+RPM does not report post install failures as critical. However,
+Yocto does expect DNF to fail on post-install failures.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
+---
+ lib/rpmscript.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/rpmscript.cc b/lib/rpmscript.cc
+index 97bd8da62..a354d944c 100644
+--- a/lib/rpmscript.cc
++++ b/lib/rpmscript.cc
+@@ -60,7 +60,7 @@ static const struct scriptInfo_s scriptInfo[] = {
+ 	RPMSCRIPT_FLAG_CRITICAL, },
+     { RPMSCRIPT_POSTIN, "post", 0,
+ 	RPMTAG_POSTIN, RPMTAG_POSTINPROG, RPMTAG_POSTINFLAGS,
+-	0, },
++	RPMSCRIPT_FLAG_CRITICAL, },
+     { RPMSCRIPT_POSTUN, "postun", 0,
+ 	RPMTAG_POSTUN, RPMTAG_POSTUNPROG, RPMTAG_POSTUNFLAGS,
+ 	0, },
+-- 
+2.55.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index c27f58a0e8..a8f35f87bf 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;protocol=https;branch=rp
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            file://0003-Do-not-install-the-pkgconfig-dependency-generator.patch \
+           file://0017-critically-fail-if-post-install-fails.patch \
            "
 
 PE = "1"
-- 
2.56.0


