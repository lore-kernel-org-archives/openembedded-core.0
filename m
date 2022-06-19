Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9C2CCA47C
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:37 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.22261.1655667090086561902
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=T5tpUgqO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id w6so1305596pfw.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hWVd0rH+CBBeYrFJQqZNbuCUQw9OVaHKqZbYwuRpb1M=;
        b=T5tpUgqOCaY5U69p6zNqHBCOfNN2GVdxs9HvXGblARiYOSJi0GjaUJ4ReC5/4sqmb0
         TKAzVAHfVa2mno8O/deAMe/8KJVy9HdMdoPkiCyBgInboQ9wnK61PuoDngwp3+AuDotz
         gXDVqBESxXivWVSfeaXRuTY5rGzvQ1NuRR/s2qqBkKRToRaQi6A0aXaK6MvRa0+m90nL
         Qad0MuGT8RBD7e3ojNWfJNY5NmjO1uWdqC26XjRQjD2MitB1i+JfE0NQBh1o0V5wh4iC
         WhIiTKlg+tB+QJ+/8UBmQVPNw4qx5XFL+B1HDcJ+deVHA3aeyhoXMjeyMn4BJ1VWAg7O
         oMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hWVd0rH+CBBeYrFJQqZNbuCUQw9OVaHKqZbYwuRpb1M=;
        b=ByPqI1xEpYKTYZT8RNkCTEIChPm/8LAiRcMQ7NRKpg9EI7EkhXyTsyu0zJf5T3YM0h
         XDs+xwfeWKC6LsN8w2HEDNnZhv7IkmiW07nWAgueyCzQ9GpPG+J2L9VOg9C/9GXGpLKa
         bXjU38CvbUT/tmsEIa8X8emgKuIopsXKmTR6Cr5v17i0IW2d0Za7HCB/j/NWk7db9XnS
         MbBweUqv+S+kylMLWu+VnLDT1Tr+UCOy6uj4Gomk56RSLtAzWu/2HUHlUeuZRztAGAVq
         fpnuooffK5SrB+xB7GN9+I0Y/Wgaoa5jRsJz5KXgpv5yGbH+OyQkYQvSJDUCK8AT1LEm
         RUqA==
X-Gm-Message-State: AJIora+hSSroCOvxoBym6RaQgsPmNIE8MI+1qIcPE2G2p6h6+HuDVLph
	Y/Kerepw9v0OrJH5d4Ubmn4mWs8cuZgxtvDy
X-Google-Smtp-Source: 
 AGRyM1vsA/vdN3cWvTrjxz8kbqHnS8YLkKy5bt62y8+zGhiULN6EGIz0nhS8S26ErkdaCT+24wzLcA==
X-Received: by 2002:a63:1c7:0:b0:40c:77e3:9b65 with SMTP id
 190-20020a6301c7000000b0040c77e39b65mr7730066pgb.90.1655667089126;
        Sun, 19 Jun 2022 12:31:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/15] gcc-source: Fix incorrect task
 dependencies from ${B}
Date: Sun, 19 Jun 2022 09:30:47 -1000
Message-Id: 
 <7211a6fb51ef0e7f5c919f98a33eaf8094b9c814.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167058

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Some tasks may reference ${B} for gcc-source which in general would not exist.
It has dependencies on HOST_SYS and TARGET_SYS which are not appropriate for a
shared recipe like gcc-source. This causes problems for the archiver and
multiconfigs in particlar.

Set B to something else to avoid these task hash issues.

Acked-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit beb2a76c591e985c6fc7ed473abd1bee27f955a2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-source.inc | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 0f70be7dd4..2abc0e355d 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -96,7 +96,7 @@ BINV = "${PV}"
 #S = "${WORKDIR}/gcc-${PV}"
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
 
-B = "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
+B ?= "${WORKDIR}/gcc-${PV}/build.${HOST_SYS}.${TARGET_SYS}"
 
 target_includedir ?= "${includedir}"
 target_libdir ?= "${libdir}"
diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 03bab97815..224b7778ef 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -18,6 +18,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
 
+B = "${WORKDIR}/build"
 
 # This needs to be Python to avoid lots of shell variables becoming dependencies.
 python do_preconfigure () {
-- 
2.25.1


