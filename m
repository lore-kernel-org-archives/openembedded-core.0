Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9489EC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 14:12:25 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.18514.1661177539611553564
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Zl9RNcIf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id h24so13380270wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=mPjEQMdAwNT9arOqT7pnPQVwK3I1dUIfXc6ZHCSOsLw=;
        b=Zl9RNcIfSEibmAra2CcR+cBYVC1ZQtRgGYmbci6wVJ+BZHkvtI1600RGK63PzX9yO0
         xE24D0FNBtJp/q1DKyK3tdTdA/5gRUI12PZJZE3H9df9jv+r/jmh7loNpVZLSqCgM43O
         jWxdDLGKmtrEksYL0qMl3cuysuM/QKiYJYLZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=mPjEQMdAwNT9arOqT7pnPQVwK3I1dUIfXc6ZHCSOsLw=;
        b=Nr20OvLJnvf55N9OW/TJ8ZdH2idRAveiKjta+gluQ6c6WCicy9VAxQRtol7Dst/RZI
         KM/vH1xkdnzjX2GQxsVolxurAXw2zzF9wrnk1hln/jha/GjaOgHrdjkh643ady2Rb2Qj
         bB9NLjOZSXtbBxDTMb6HQ4rQQIMlPZhZi8YzqsRelE4Igtx/dMpC+CpDwjRStjREc3w2
         Wl/4u6ugUEBco+mYW5LnDYJbbc8tVzHWnGXZP3nIZRjm35iO9ayLQd72hHrwGquFumwQ
         njlOJ9qLijzcCqttXStav0aWUAegiTILbB3PphKBQ5HAm8mQxZDeijETySPhEf6C+47J
         Ehtg==
X-Gm-Message-State: ACgBeo1yxEwQdr9s2bR4bQickya7VqHdNi8wvqS8XF5HymPnoMvOTQE+
	VNjVuG07n6eh+wXY/JFP6V7ohktMcdgFnw==
X-Google-Smtp-Source: 
 AA6agR712wUM1qSvjNOeuDLMW/8gtIpyHYeZF/ye+Mhba+oO0w5OLPn26Qvd351bv96t1YhPJ064Xw==
X-Received: by 2002:a05:6000:1e0e:b0:225:4e27:b806 with SMTP id
 bj14-20020a0560001e0e00b002254e27b806mr4630136wrb.605.1661177537530;
        Mon, 22 Aug 2022 07:12:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a4a9:e65c:bb6e:14cc])
        by smtp.gmail.com with ESMTPSA id
 g1-20020adffc81000000b0022520aba90asm11982452wrr.107.2022.08.22.07.12.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 07:12:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] icu: Drop binconfig support (icu-config)
Date: Mon, 22 Aug 2022 15:12:15 +0100
Message-Id: <20220822141215.2752501-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 14:12:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169674

Upstream have indicated icu-config is deprecated and they don't intend
people to use it any more. Drop our code for it to flush out users and
clean up our recipe a bit. pkg-config is a much better alternative.

(https://github.com/unicode-org/icu/pull/2150)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/icu/icu_71.1.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/icu/icu_71.1.bb b/meta/recipes-support/icu/icu_71.1.bb
index d8ef2a37460..6b56c627ed8 100644
--- a/meta/recipes-support/icu/icu_71.1.bb
+++ b/meta/recipes-support/icu/icu_71.1.bb
@@ -15,20 +15,18 @@ S = "${WORKDIR}/icu/source"
 SPDX_S = "${WORKDIR}/icu"
 STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
 
-BINCONFIG = "${bindir}/icu-config"
-
 ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
-inherit autotools pkgconfig binconfig multilib_script
+inherit autotools pkgconfig multilib_script
 
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
 
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
 # into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
-EXTRA_OECONF:class-native = ""
-EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
+EXTRA_OECONF:class-native = "--disable-icu-config"
+EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
 TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
@@ -67,7 +65,7 @@ do_install:append:class-target() {
 	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
 	    -e 's|${DEBUG_PREFIX_MAP}||g' \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
 	    ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
 }
 
-- 
2.34.1


