Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B33C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:49 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.7243.1654699240299715406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ep+gHzcs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 u12-20020a17090a1d4c00b001df78c7c209so24003035pju.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=T1Bdn/xaiLsZRvXuU5MKPGqXSLglVxxlXRfx0y2NfIE=;
        b=ep+gHzcsBREKtVwigUx/CeYaJ3DEsORVYqLME+yt7USVrfdeXHOjy0C/oPCA8+UbOr
         FUUZLMqtqNA9eSa3/m1ydNNbFOmmFZNIzbkoLZ5CJ+cRBu7p3wPonYch7QwSk2VvdKv6
         orZvfb/AksqSIP1iCNB/dRVKpu+sxeqNycIfuVSQ7vxdhSpsps5Oi9OR0nPaBEq0mTd9
         rdrtSWsgUyZBC/uGfgrk6T7XJw/8jh6jwCU3opaYoPoGwUT5+4s3h6137YVNNgQxHo5N
         N9gd79Y0fzJGMHlJ2I46x/k3XVLm/6UwJHqK05BNkGY2rc61TJRH6hfZi+jiX/1ATPN0
         M4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T1Bdn/xaiLsZRvXuU5MKPGqXSLglVxxlXRfx0y2NfIE=;
        b=OJ+zAjff1UXdsCxbIXHqQLunm/keQqxzAstEmmf9jdN5wWczRQdTc3e3SeGHQ4l4EW
         Puo/jPwVIbAGWVMYKf4LZkl8ez3ic4oYuKq7WTReKnmXL7BMuOd08yTLb7mUFsMcIH+g
         RUMkkk8ohG16TzIbWyRqqzLtKmBTY++MXLaTgUeZJFOlVA46c+x5HbaMDTODQVCaNkmG
         guVOXiHVDOO4iJzTk3ZQFPuOXDQfr+MQ4WBzVRi5kXuJN2m6Mm+9eQNfw0vlK5SW0juB
         pTfQFJjiuJFpkn/Eq30nhu6GeP9XJb80qabHZrJcRM32nNPgT/tydnWrAPxsCWmHbu6A
         9vPA==
X-Gm-Message-State: AOAM532fyXrWhRlSos6mtOv/uWyPXecQ0u5BKrO2hiLzhPvp8753ZdDI
	4ye66nGVHNyMQgsR1xVy6oujFf5Xrsp7KIZX
X-Google-Smtp-Source: 
 ABdhPJzKO82oWSylgeGsv/5kYaLmF939r9cRPGHbblFDmj/PTv8qC/Of4UG89+hVhvXGM3NtnGBSdQ==
X-Received: by 2002:a17:903:120b:b0:168:98a9:221f with SMTP id
 l11-20020a170903120b00b0016898a9221fmr2712491plh.48.1654699239259;
        Wed, 08 Jun 2022 07:40:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/22] kernel-yocto.bbclass: Reset to exiting on
 non-zero return code at end of task
Date: Wed,  8 Jun 2022 04:39:31 -1000
Message-Id: 
 <45b4597db37e3ad50ff84cda39fd14a25d6d2680.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166729

From: Stefan Wiehler <stefan.wiehler@nokia.com>

Several tasks deactivate exiting on non-zero return codes via set +e because
they run subcommands that have legitimate non-zero return codes. However when
appending to those tasks, this behavior is not expected and can lead to builds
silently proceeding in case of an error. Therefore reset the default behavior
at the end of the respective tasks via set -e.

Signed-off-by: Stefan Wiehler <stefan.wiehler@nokia.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 83a6f28d2e464f00202090e998a63045adba9e4e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 4cb638864c..afccffcf17 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -310,6 +310,8 @@ do_kernel_metadata() {
 		bbnote "KERNEL_FEATURES: $KERNEL_FEATURES_FINAL"
 		bbnote "Final scc/cfg list: $sccs_defconfig $bsp_definition $sccs $KERNEL_FEATURES_FINAL"
 	fi
+
+	set -e
 }
 
 do_patch() {
@@ -339,6 +341,8 @@ do_patch() {
 			fi
 		done
 	fi
+
+	set -e
 }
 
 do_kernel_checkout() {
@@ -397,6 +401,8 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
+
+	set -e
 }
 do_kernel_checkout[dirs] = "${S} ${WORKDIR}"
 
@@ -691,6 +697,8 @@ do_validate_branches() {
 			kgit-s2q --clean
 		fi
 	fi
+
+	set -e
 }
 
 OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
-- 
2.25.1


