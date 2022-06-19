Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60C3C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:27 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.22123.1655667325721353466
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=df0bw8a8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id bo5so8473939pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GUzIR1E959xBdVkxlqAAXlOITSPfZphrRxIw7kCLTGc=;
        b=df0bw8a8KqWJf+z9s5sphIHtrtN2lRs/c1Pmxajqua5vS6sAAJVF8I3+auqZdIbfun
         irMSZ8powPpoyNOu8uHhmNqPrVvnu2R4c5Fe16e3x4EHm4bUJ+0tg+bSrBcLkGmDIbFH
         GvAjoP58mp+KAHzgAMHxcRzCvbC8b+BrSR3pxWeLCRUk6Lbpb86vukTpKA5x8ebKJRFq
         /hlzIt2F1+yTaEdDhSOHCUhXjwY5AK7Ud4B0ymzBGne0ZLovBDw3I4hh+DhHKENsuXuv
         MwXnJhyyIV8g7soGMK1SVqXsK8OhTvBubCKy4NHsT8hCM8NSXyJ9h9dWuRr+6Ld05p2y
         BFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GUzIR1E959xBdVkxlqAAXlOITSPfZphrRxIw7kCLTGc=;
        b=Ac4EK+d87qS+QFRqZ9G4mSz4DU8ol5v2x0IJj1aQO1+5xe2oDl+RzXOFW9YbmgQTmI
         i5gOBjWf95tCa44+RozBYzNZWzVfR/FvJzEd7ddUZCu0yagx/XHCK0Umghn0uOrlzn7/
         qWJvsPIOYyhZeEmcPRISeyeiJNypLTiE0jv0ABFP7ut2vMKD7dLXHOREKIu0381sc+Si
         RMZ7Pvau6iDuk5RSzsxpSxjxQBiIwUpGHU2eb3ElZA0IqHbNxQ9GtmzytBQIEE2BsStE
         gq6j1Ro80pkqwCQaXyExEOBlF1HHp1FRgLf8UVxPw/AYQWhrpVJ/vgjsY245p3HjHXlu
         /gww==
X-Gm-Message-State: AJIora/SPyInEcRwfhFjNoWVfPlb/GO+KbW71Ms0T7p4TMAnLlsMIlhQ
	kOkdq0LGbyLwyLpIVxIR1h906HlA8oGL1q+b
X-Google-Smtp-Source: 
 AGRyM1sCQuzi1/6wJJ83a4/iAewGrbeWRCH3elG2g6JmeF4oQo0D4G2yjU0aPU24zYuzVFU8xIB+GQ==
X-Received: by 2002:a05:6a00:1306:b0:512:ca3d:392f with SMTP id
 j6-20020a056a00130600b00512ca3d392fmr21272295pfu.79.1655667324697;
        Sun, 19 Jun 2022 12:35:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] kernel-yocto.bbclass: Reset to exiting on
 non-zero return code at end of task
Date: Sun, 19 Jun 2022 09:34:58 -1000
Message-Id: 
 <7777cc853db7200b819095be6f6a3561738ac94d.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167066

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
index a1a073b738..2a6231803b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -269,6 +269,8 @@ do_kernel_metadata() {
 		bbnote "KERNEL_FEATURES: $KERNEL_FEATURES_FINAL"
 		bbnote "Final scc/cfg list: $sccs_defconfig $bsp_definition $sccs $KERNEL_FEATURES_FINAL"
 	fi
+
+	set -e
 }
 
 do_patch() {
@@ -298,6 +300,8 @@ do_patch() {
 			fi
 		done
 	fi
+
+	set -e
 }
 
 do_kernel_checkout() {
@@ -356,6 +360,8 @@ do_kernel_checkout() {
 		git commit -q -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
+
+	set -e
 }
 do_kernel_checkout[dirs] = "${S}"
 
@@ -523,6 +529,8 @@ do_validate_branches() {
 			kgit-s2q --clean
 		fi
 	fi
+
+	set -e
 }
 
 OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
-- 
2.25.1


