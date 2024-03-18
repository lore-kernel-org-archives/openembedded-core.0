Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF24EC54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 10:17:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.39907.1710757040076989710
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 03:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GC7JyLnj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4145ee55ad4so1515e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 03:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1710757027; x=1711361827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssPG15qsq4y+hPaPFbN1B+acb/rR/M0/6C5lfho3Eaw=;
        b=GC7JyLnjspnYJu11vhx2Ufjzx1ETQfficFkWXcvh1WQ129Mj3U46CYR8mTFZflUBK7
         UXIFA7Uwb4F4aLJ5SUYydimZQU5GV67K/CUpbGK7Emw4/wMP9mt7YtQQ9c3oYN2fWLJb
         ief4ewCuuepLn8hae7ek7zvcpUX8m8cWF6e1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710757027; x=1711361827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssPG15qsq4y+hPaPFbN1B+acb/rR/M0/6C5lfho3Eaw=;
        b=FPsdALFerBAbN0RT3Fqj/MIWkj8uNfu06OFExyQ8TpBxBkqvdHCYXmIv0AzUkxSUv7
         OqNLFej4zU1gPIX+UDwOJnfZqChD/RvmY0ojBRAVHJZBcdboFjRBZqSzZDIYzjCWn4f4
         zgA+8taXD35KaZ0O9+zmrtbza8onkMAC9GfX9wnA6C2ml1/LGqgs3HGSBblLBG/FczxJ
         R2FtK7nmCrvj8In1H1GauR0WFL5DMTP+ceV+FkdKIw+I6LDlsKvaMvZR/VHquRic8IcI
         NjomxBZjAmdaVPeoIEK5HyuinjfwcgLAQ8zscwhW3mzM8ljYHaVIV8SmCygJZEF2pWgd
         5cjQ==
X-Gm-Message-State: AOJu0Yys/bXfNp66E3tLZtn/PZrazhVupnBzVPDSlRdablL5dxra2/wB
	sWs6oaGNi+1axSzUspgGl8cUKoKHrYhNFNWnIey+hh2OfSNpA9X1bPK+t2InzZ24C7kuSzLqNw5
	I
X-Google-Smtp-Source: AGHT+IECh1r62XzMuBHoXYh5QLI7EeD6VfjEKY3WTu9tDLsZOFulOy7NmBgJv34puyxe1JBLV9ppOg==
X-Received: by 2002:a5d:6941:0:b0:33e:d4d1:1e58 with SMTP id r1-20020a5d6941000000b0033ed4d11e58mr5535648wrw.31.1710757027018;
        Mon, 18 Mar 2024 03:17:07 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f362:1430:f91a:ffbf])
        by smtp.gmail.com with ESMTPSA id bv16-20020a0560001f1000b00341798ba0a8sm1176429wrb.87.2024.03.18.03.17.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:17:06 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bash/flex: Ensure BUILD_FLAGS doesn't leak onto target
Date: Mon, 18 Mar 2024 10:17:05 +0000
Message-Id: <20240318101705.1325645-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 10:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197301

The ptest packages were leaking BUILD_LDFLAGS into the Makefile used
on target. Remove these values instead.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 1 +
 meta/recipes-extended/bash/bash.inc      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 1ac88d65ef8..f7d4ef1f085 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -68,6 +68,7 @@ do_install_ptest() {
 	sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    -e 's:\(^LDFLAGS_FOR_BUILD =\).*:\1:g' \
 	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
 	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \-e 's/^Makefile:/_Makefile:/' \
 	    -e 's/^srcdir = \(.*\)/srcdir = ./' -e 's/^top_srcdir = \(.*\)/top_srcdir = ./' \
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 2c3e6055113..7832ad052b9 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -102,6 +102,7 @@ do_install_ptest () {
 	install -D ${WORKDIR}/run-bash-ptests ${D}${PTEST_PATH}/run-bash-ptests
         sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's|${BUILD_LDFLAGS}||g' \
 	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
 	    -e 's:${UNINATIVE_LOADER}:${base_bindir}/false:g' \
-- 
2.40.1


