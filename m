Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9584EB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 11:07:00 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.3926.1691233610496722208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Aug 2023 04:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IE1FTlr4;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso2463492f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 04:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691233608; x=1691838408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXt6Y3bnSB1lhbWG1nwiJj0yzWQa0zzQltNtnWBfKMk=;
        b=IE1FTlr4+Ai+wtasyhY8B/HORF40n6ImCaSq6uFutseq2HgdfqNWKVmRmGLT6G3gGN
         XAHkLhNz9dAJ34fmQ7BzSg6mPr+4790bl1f9IIikB5VQsAYNXy29S4t9sHaTaU61ah6f
         j/CoHCXs0EYbIklLOc3OalYpFCSsSO0YG3MMpX6a5GROKPFq3rGOVfU9dlZThRSCNEP9
         v8gv6i9Sgjpj32WAVa7Q82TdIcTUOMVNOzXMXblGRSknha/U94/Vz9w+L4zBgYX/Ug48
         waX+SfO9aqs8DqyfozZz1ruDe2sMddJB4CR20MWW/npGZMTYJWBR3143hAiPF1VRtPiY
         yQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691233608; x=1691838408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXt6Y3bnSB1lhbWG1nwiJj0yzWQa0zzQltNtnWBfKMk=;
        b=GcklhzNAUdZVCoPX9A4c3oQNhkZqnLUozTAeTclrGz6m+3bwFbS9Krg6nGaU5keDgn
         CnRVItcN1fxYGj0NFYtr2D/koTouJxTIKgBuHG5WI/6WGv4dZKK0BNt6pEZ+g2ENxFx9
         PWFulscG/qVA51yttC56BhyJgpdueyu53cHmsZyRmJjMxAUmhEgTEitwzBmH/uNsv1x1
         yBo4cNgmpylnqWyNp/jeO2/KM0AqZY7GqKtNfRKNVFShITjaDN+1/iKmb3hoGebQzIRi
         ZeyjMm4K5AwEcQrxp5N4mNZoSctB0PcsKoN1WM6m0udqlB3793KDhwpMXcwciRjOUUpm
         tXjw==
X-Gm-Message-State: AOJu0YwplW60EgWCvq9wvC2KWUtKULbwVQ0rRFza66jnDNOvp//WBnJj
	/JotsgcLoDIN4rRMcm02A/TgSxJgoYA=
X-Google-Smtp-Source: AGHT+IHUF3yfBnl7MDb35ZRCum2sXda+zASsKpFHB4ujp5efNfdqvOLXkulNic72GdyIP+PowjZLKw==
X-Received: by 2002:adf:edcd:0:b0:317:650e:9030 with SMTP id v13-20020adfedcd000000b00317650e9030mr2636020wro.57.1691233608379;
        Sat, 05 Aug 2023 04:06:48 -0700 (PDT)
Received: from localhost ([137.220.119.58])
        by smtp.gmail.com with ESMTPSA id l8-20020a05600012c800b003112f836d4esm4872820wrx.85.2023.08.05.04.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 04:06:47 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH] systemd: add usrmerge to REQUIRED_DISTRO_FEATURES
Date: Sat,  5 Aug 2023 12:06:43 +0100
Message-Id: <20230805110643.2708376-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Aug 2023 11:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185551

From: Luca Boccassi <luca.boccassi@microsoft.com>

Support for unmerged-usr is deprecated upstream, taints the system and
has been removed for v255 (next release).
Enforce building merged-usr images when using systemd. This allows one
release cycle where it can be tested for any remaining issue, and can
still be overridden, before it stops working completely.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
Time to resurrect this. Support for unmerged-usr has been removed and
will no longer be available starting with v255. Better to get started
now with the enforcement, so that things can be worked out while it is
still possible to override it.

 meta/recipes-core/systemd/systemd-compat-units.bb | 2 +-
 meta/recipes-core/systemd/systemd-serialgetty.bb  | 2 +-
 meta/recipes-core/systemd/systemd.inc             | 5 +++++
 meta/recipes-core/systemd/systemd_254.bb          | 2 +-
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 55ebf99117f..88315780108 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -14,7 +14,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 
 ALLOW_EMPTY:${PN} = "1"
 
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
   busybox-udhcpc \
diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index fd888bb8340..0987c3f4162 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -14,7 +14,7 @@ S = "${WORKDIR}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
 inherit features_check
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 do_install() {
 	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index b00a49884be..f70b420e120 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -20,3 +20,8 @@ SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${S
            "
 
 S = "${WORKDIR}/git"
+
+# unmerged-usr support is deprecated upstream, taints the system and will be
+# removed in the near future. Fail the build if it is not enabled.
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "usrmerge"
diff --git a/meta/recipes-core/systemd/systemd_254.bb b/meta/recipes-core/systemd/systemd_254.bb
index 7ba4233f6a2..188151a769c 100644
--- a/meta/recipes-core/systemd/systemd_254.bb
+++ b/meta/recipes-core/systemd/systemd_254.bb
@@ -12,7 +12,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d update-alternatives qemu
 
 # As this recipe builds udev, respect systemd being in DISTRO_FEATURES so
 # that we don't build both udev and systemd in world builds.
-REQUIRED_DISTRO_FEATURES = "systemd"
+REQUIRED_DISTRO_FEATURES += "systemd"
 
 SRC_URI += " \
            file://touchscreen.rules \
-- 
2.39.2


