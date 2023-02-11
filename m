Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F79C64EC4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.19563.1676150647659800674
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VQrI6P/f;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id v3so5931955pgh.4
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zG32wt9CJndQoejFb159T89ZcgDfVfcLA060/WuwBA=;
        b=VQrI6P/ft2iFmm413ZMeajwbyChjLu3kAEvzZi2woa4pdd46Mt9ULw5opE9GFHl0y6
         UyncVFVaPkEr/kxyxZ91zgrHrBwhamkTKJ2vDPaDrcnXDTGgT3+UrrWKvoViX0kK3f3f
         ZNLNHubfuGw33fhqZXxo+Gi56sypQ8Rau9des/WwmbgJdJmBT6HqEtK9bHEhE1Zq3zCO
         k7Kb2nlxtmipbAKDvJ3av4RUaUByoRpNbSOZODk7ms3DoGaDepJtv+1tA6sQ5zmEhQhr
         m/gvN8Ho0CSZ6YmxtBRq/GSUzsPD4YwqP8Lwvu1fO3wpkorkYnVuCXnYjAdql8SXbrEN
         4IfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zG32wt9CJndQoejFb159T89ZcgDfVfcLA060/WuwBA=;
        b=SWnpZ2g4X1WbxlHk5IL5KKURODz4ie/8QBk5Y16OEutc8aBwULkq+JqQLkVEVRzHqY
         nrAFAIt03cgYtejJUcneyDHVQbrH8DXoF5BHVnCdhGObZCRdOPnx9R1Se1cmKU1uC6/g
         qAqRYlLeQVBJP747NfwMC7F3BTgppcVGv0Pe3sY5TsxeajZrSD5AtnicjZwJW5VeZ5f0
         0vNkOW0SHnFvgiXdK48I3UC7e4GZ+3xW1JaNYLQHRe95MggPJKIf2nHexGfCEQVrvyVn
         bDeLaq9+pgAH9E/wK4aTKIaR8nn9CYIiFpaKhX/hHaA4WAOJ+9tj7qYZUCqqz5eL/Wvx
         db+A==
X-Gm-Message-State: AO0yUKXXlDXIsAkQZtu3T3gEPjVGKoMxUwOVFjAjktqTNDuOtEFz4cPf
	h4XNxg1cun0ppONlZPQ+fTvybPdnb2PkK4BW96w=
X-Google-Smtp-Source: AK7set+9h7iYaxoLPu1FtLpvsSq71sP18HE/WU3Hhd5X8WCjT+eeUrdYdA95NgW9RsIt05LB3n9m/A==
X-Received: by 2002:aa7:9f48:0:b0:5a8:5fa0:3ce with SMTP id h8-20020aa79f48000000b005a85fa003cemr8312999pfr.22.1676150646734;
        Sat, 11 Feb 2023 13:24:06 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/28] kernel/linux-kernel-base: Fix kernel build artefact determinism issues
Date: Sat, 11 Feb 2023 11:23:28 -1000
Message-Id: <0fe1eaf485c2470a4578e19278cc60cf1406fe77.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177015

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With the 6.1 kernel we've seen reproducibility/determinism issues where the kernel
seems to rebuild headers referencing the hostname or local user. kernel-devsrc
building after the kernel seemed to trigger it in some cases.

Moving the definitions to the bbclass used by all the kernel recipe code including
kernel-devsrc seems to be the best way to ensure this doesn't happen.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60681baa97daf4f3856453c34d6be08b6771a81b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel.bbclass            | 3 ---
 meta/classes-recipe/linux-kernel-base.bbclass | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 553e17bb4e..274d748d99 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -210,9 +210,6 @@ PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-firmware-.*"
 
 export OS = "${TARGET_OS}"
 export CROSS_COMPILE = "${TARGET_PREFIX}"
-export KBUILD_BUILD_VERSION = "1"
-export KBUILD_BUILD_USER ?= "oe-user"
-export KBUILD_BUILD_HOST ?= "oe-host"
 
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
diff --git a/meta/classes-recipe/linux-kernel-base.bbclass b/meta/classes-recipe/linux-kernel-base.bbclass
index cb2212c948..65cc48f304 100644
--- a/meta/classes-recipe/linux-kernel-base.bbclass
+++ b/meta/classes-recipe/linux-kernel-base.bbclass
@@ -43,5 +43,9 @@ def linux_module_packages(s, d):
     suffix = ""
     return " ".join(map(lambda s: "kernel-module-%s%s" % (s.lower().replace('_', '-').replace('@', '+'), suffix), s.split()))
 
+export KBUILD_BUILD_VERSION = "1"
+export KBUILD_BUILD_USER ?= "oe-user"
+export KBUILD_BUILD_HOST ?= "oe-host"
+
 # that's all
 
-- 
2.34.1


