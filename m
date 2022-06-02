Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7024CCA47A
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.1495.1654188737673130248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J90tqtOo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id u18so4993748plb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qf4rcbrJUdD39vLOE3SO0se0ION5yXH8zoN9IayrSkA=;
        b=J90tqtOouspmzDIujl2YCmLgMjJSRVIB7cs0i2opP27DSRki7l3DwbmP3Ez8JPv50H
         jIVWSyKFJ51wBfJz0I/qcNgk+KRrc7o+sSLbIsKX0IVn5sUSrQd3eFGXZv9LL1KmLON5
         Fc8/80N68RM2wt5OtRvUH8QVpkhTt8FJuuNIlYPbWTUez0kl5VVHVoJHgfyfyDloYrzd
         VWMWxT3yJGVB+IqCsDEDDZ7vfNS7Yvzj2VM19+I462JQY0Utrg450PuwdyyYKPhQiWVI
         YggYlOG+Oprf6bnGEaNvALtIWVE/YO/pG4eXp6joBcchwRIBeXKsAA0KFuFTOS8Rmw7X
         KJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qf4rcbrJUdD39vLOE3SO0se0ION5yXH8zoN9IayrSkA=;
        b=rVKLCjyhlvlRegjLddlc67Ley1QxsmrTHVKUTIFyqen+XZ+e5wQ77yHSIrbUBA040r
         LeMwpegHfgY0WQCMOTkr2+ttYnSx2jiIDtdMmxjTejubTHgBgwHqMa+83SRepABvxLyB
         5uCPoD77uVnrDet78TZf4p5itgr2xhGp2hQW43wV+UgXEeVEuclJvzHqIWyVx/xK6e75
         aIQ5Hw+cv1j6niG2vC/syOIYT8+r9BoyfIGFtxz5pizytCBLpTbgTOe5uU4/PNEwz7NJ
         3iZUdC0gx2sMGuBdfmMKEn0nZhzaq/EzmA0h5NvL/Ubej8xLlbRUtUGs5h11LFyeidIO
         bM0Q==
X-Gm-Message-State: AOAM532pXoRPv91hFLafRMmV58erpgDL4ihpHqK47w5hegNLaHCq3PQc
	q6ErMTRanMEEAwHqNzzoyXcPiur35dP3WGWR
X-Google-Smtp-Source: 
 ABdhPJzkhiYd4wArMf8Gvo6PSD8BQsN++056htFcrySH8Pg7Cur5idv1teyRfdyfKek48uiZ/L5LoA==
X-Received: by 2002:a17:90a:780d:b0:1df:959:235a with SMTP id
 w13-20020a17090a780d00b001df0959235amr6272930pjk.92.1654188736470;
        Thu, 02 Jun 2022 09:52:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/26] tiff: Add jbig PACKAGECONFIG and clarify
 CVE-2022-1210
Date: Thu,  2 Jun 2022 06:51:34 -1000
Message-Id: 
 <95f1c5d0bb7bc7cae2715d0c9b569fa369a64575.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166479

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We never depended upon libjbig so this was never present. Add the
PACKAGECONFIG to make this explict.

CVE-2022-1210 is an issue in libjbig so we don't have a problem there,
mark as such.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 34e6a19f2430ee2fd0fec4bec1891e898a0d9766)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index c5e964ec8c..7a5e4816a6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -32,6 +32,9 @@ CVE_CHECK_IGNORE += "CVE-2015-7313"
 # caused by 3079627e and fixed by b4e79bfa.
 CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623"
 
+# Issue is in jbig which we don't enable
+CVE_CHECK_IGNORE += "CVE-2022-1210"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
@@ -40,6 +43,7 @@ PACKAGECONFIG ?= "cxx jpeg zlib lzma \
                   strip-chopping extrasample-as-alpha check-ycbcr-subsampling"
 
 PACKAGECONFIG[cxx] = "--enable-cxx,--disable-cxx,,"
+PACKAGECONFIG[jbig] = "--enable-jbig,--disable-jbig,jbig,"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg,"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
 PACKAGECONFIG[lzma] = "--enable-lzma,--disable-lzma,xz,"
-- 
2.25.1


