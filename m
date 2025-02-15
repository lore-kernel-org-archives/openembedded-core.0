Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC74C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 16:56:47 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.12729.1739638599848730383
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 08:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RbmPqQcQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38dcac27bcbso2545629f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 08:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739638597; x=1740243397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JzPHjPZqyIImLnOnbsVzwGiyXV6yBg2p1YuFmjpvYsg=;
        b=RbmPqQcQuSwmZaO2S4gb8IqhshCgfsastlisuqY4vuUyz4ZhEW9BPoY2FIipPfJphS
         N8EOjduZwM/qmxUrdYSiiEK7WbGxEfRj/NMLfBH3kQwL7ekejvwrBiG1olDQ4GHA3MuF
         lDVmPiJyw6/URCC4THch0cNZ+ySYSjcaO2KCOMWHJnNWAFkLnbGxzaJKlYJQeojRyFEi
         a7sj4iBdz1yhdg5OoOFLJ+1Aj5YV62hOnTU1qGzQAddwRnKqxoXLc34jaGW8cxaX2388
         XLy2JoA+Pzw4MRkgjKRByiBgNGhppzuMo+bpwvMxPbljDER97tiBlfQzNusV4p4gQqWh
         TDQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739638597; x=1740243397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzPHjPZqyIImLnOnbsVzwGiyXV6yBg2p1YuFmjpvYsg=;
        b=mDgodevlJYv8p+ZHXsCW3Sc3UPXBIRGuP6dKTBly0wc6jvRWdjk7TDyzjtIldXPPkr
         XqblE98AU/k0M/7iLeTrlYHh4DKYRSfwzZ8gKQtyPLzp7cy15ZGuORE5C9xLoAIgJRaJ
         hmmWG9N9Nc/V7/MXsJSVUt1MKV5AT5eI2yaCKakV/Z3jS3EAagibCY3FE35qDdtve5q2
         ryl19gRQB/5hbyZS+H3O8f2pgnOs2cVMyNOG8FfyjfoundeJTEn+RwkvN/ZZaFApD+CZ
         tcovCJoFpCXP/uXQttVuxu/0Ve85VV4Llz4EReEI/nWrVeUCjH1Z93svArggj/984h2I
         54gg==
X-Gm-Message-State: AOJu0YwOBGp0MGKYrrjhztbUBzgPHzUsO+vrprMZ9i1HxSaQgMUgwajR
	IH8bFm6bi4U4iSPfzKNb7/lf9/ccC4htKYBFm+MhqeABeYrWjJrLKXJIml7S
X-Gm-Gg: ASbGncujNKAwoOwjtb0fspIhzMaCbzB2wRmGMWImVszRqVyr3LZk3GKZQgspLhROBq1
	ECi1qIXOYUsldLUpM40fJwdQvvUE/QCf75i0u7kZcFt00kO1QSukiXFmfYHBpUmXiJhKQTXWBpw
	0wiFxjV1Jv8KiaR9jwuhEPDs0X9IrJm+9TvAGbv/vVle5xrqXgkDxVT5r85ceJe96qsLBMVKtuM
	mmcbLvCJJBmQhXS7TLnvo4RGvUuvIFI+mQRka4rlmpxQjYg2CY8DmHlpCQk7/epzChEJV3jklkT
	J4zLBsaMjYPHonVcUW9tPUkyybV2LygW06o2tzLMR68oZx1EvLmTTQzknw==
X-Google-Smtp-Source: AGHT+IE/5WjY1k6HgvT/1QbqFdZX1vGlR9LwLymuJ6TtV6aP+N7L7vIINxY+MCQO/eKp1H8TCS4/rQ==
X-Received: by 2002:a5d:584a:0:b0:38d:cc9c:630c with SMTP id ffacd0b85a97d-38f339dee38mr2862466f8f.10.1739638597241;
        Sat, 15 Feb 2025 08:56:37 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7763200f8f.61.2025.02.15.08.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 08:56:36 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
Date: Sat, 15 Feb 2025 16:55:46 +0000
Message-Id: <20250215165545.1929-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 16:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211489

avahi, systemd-resolved and mDNSResponder (in meta-networking) can all
provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
which of these will provide service via packagegroup-base-zeroconf.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index cb9d1f07af51..ac450fbdc9a7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -312,11 +312,14 @@ RDEPENDS:packagegroup-base-nfs = "\
 RRECOMMENDS:packagegroup-base-nfs = "\
     kernel-module-nfs "
 
+# Choose 'avahi-daemon', 'mdns' or 'systemd-resolved' as zeroconf-daemon
+ZEROCONF_DAEMON ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd-resolved', 'systemd-resolved', 'avahi-daemon', d)}"
 SUMMARY:packagegroup-base-zeroconf = "Zeroconf support"
 RDEPENDS:packagegroup-base-zeroconf = "\
-    avahi-daemon"
+    ${@ '' if d.getVar('ZEROCONF_DAEMON') == 'systemd-resolved' else d.getVar('ZEROCONF_DAEMON')} \
+    "
 RDEPENDS:packagegroup-base-zeroconf:append:libc-glibc = "\
-    libnss-mdns \
+    ${@ {'mdns':'mdns-libnss-mdns','avahi-daemon':'avahi-libnss-mdns','systemd-resolved':''}[d.getVar('ZEROCONF_DAEMON')]} \
     "
 
 SUMMARY:packagegroup-base-ipv6 = "IPv6 support"

