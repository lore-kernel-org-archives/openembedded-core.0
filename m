Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5183C28B2B
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.6822.1659705177741602045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N6PibkW4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id s13so946067wmj.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=O7KctozCA4tg6jvL/YfCpxVrdj8MFUJjpJ9u06xms7o=;
        b=N6PibkW4keK3FJ9cm2szmHOYr0QnDZ2RlU9/UOz/lS4jwBATavndEgQRwdi/XbafeL
         e53u+Pq86A/91jd6TlROAxWvleOfg7B4PJb2sRCis5XCLQuihNu/+3xcvUoL9KvmapV/
         ZyDV+ktWaIgz3PX3fpWg9+53eGUfGvtla4HWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=O7KctozCA4tg6jvL/YfCpxVrdj8MFUJjpJ9u06xms7o=;
        b=RlnwxFyR6XLcotXSEN2qHdmnYU3kTfSre690ByYBAOaOkTNw0ZbHhABU96FRfEWFH3
         ufenb4x1NFJasyYsANFQUR7Riij7gw/7SX+TXaaL67gT2mubEMMbaESS1fiOpRLIY2X9
         lfMzcuqGJPeG/iFawaUx+GTgMl7Txf0JBKK8iuTshMp/AR4yX1w97UXIiIObuSULgeXD
         xnLBC2XbFu5y7yM9ttvbKf7a5iSx6S2VHFoVvKVw1/6Y/UL+hINXY9sULCkPEjtjQHb/
         rtgEO0YRG9NfIjZ6WwKq1xZR8nsTT0zWVJMOPcWcn6aKqNcBvKXXvZLoiVp1ez46WwXq
         khTQ==
X-Gm-Message-State: ACgBeo3JyrHj/yCuNC0e+2cQedLLaBH76sadNilujSj64W1cF3jDxovh
	O61JAouVVjuOX+XY217FazGj0w4kkc6WCA==
X-Google-Smtp-Source: 
 AA6agR4otZpmgVarvbLXk2MpkDwTYz4adqBgm7+gQDFOylkjygaFgaaWDXHtCXsesDYXvRqWxZyQIw==
X-Received: by 2002:a05:600c:1e03:b0:3a3:6cd6:1d38 with SMTP id
 ay3-20020a05600c1e0300b003a36cd61d38mr9570767wmb.25.1659705190370;
        Fri, 05 Aug 2022 06:13:10 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/29] cargo_common: Handle build SYS as well as HOST/TARGET
Date: Fri,  5 Aug 2022 14:12:40 +0100
Message-Id: <20220805131252.3706794-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168951

Improve the common class to handle BUILD_SYS as well as host and target,
removing the need to a workaround in the rust recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cargo_common.bbclass   | 9 +++++++++
 meta/recipes-devtools/rust/rust.inc | 3 ---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/cargo_common.bbclass b/meta/classes/cargo_common.bbclass
index dcd0afd9801..4a419cdd0a3 100644
--- a/meta/classes/cargo_common.bbclass
+++ b/meta/classes/cargo_common.bbclass
@@ -82,6 +82,15 @@ cargo_common_do_configure () {
 		EOF
 	fi
 
+	if [ "${RUST_TARGET_SYS}" != "${RUST_BUILD_SYS}" -a "${RUST_TARGET_SYS}" != "${RUST_HOST_SYS}"]; then
+		cat <<- EOF >> ${CARGO_HOME}/config
+
+		# TARGET_SYS
+		[target.${RUST_TARGET_SYS}]
+		linker = "${RUST_TARGET_CCLD}"
+		EOF
+	fi
+
 	# Put build output in build directory preferred by bitbake instead of
 	# inside source directory unless they are the same
 	if [ "${B}" != "${S}" ]; then
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 5730887411a..12c86e02c4a 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -29,9 +29,6 @@ setup_cargo_environment () {
     # x86_64-unknown-linux-gnu.
     # Later stages are build for the native target (i.e. target.x86_64-linux)
     cargo_common_do_configure
-
-    printf '[target.%s]\n' "${RUST_BUILD_SYS}" >> ${CARGO_HOME}/config
-    printf "linker = '%s'\n" "${RUST_BUILD_CCLD}" >> ${CARGO_HOME}/config
 }
 
 inherit rust-target-config
-- 
2.34.1


