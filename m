Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91D9CCA476
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 11:34:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.41452.1760355260520859544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 04:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LRbetNZZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ece1102998so2386525f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760355258; x=1760960058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QDdA+S/4Nkl8DkqWTTe85t//c78/MBvzvYnCrm4BVxg=;
        b=LRbetNZZoj2ZEzwX+DmxQELb93jouedJ9wOfE19yFxW3u+i6+aSkXQTNLW9NdW+hCl
         Dfq+CtfXEU+4pQQg/fBUtov8INDRO06ltHTD4aLyIhRp5XmGva/bpxEavHazM9O0JhBZ
         qzpD3CDJmZllmlVfol3kLPZDv2DK57PK4Q1j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355258; x=1760960058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QDdA+S/4Nkl8DkqWTTe85t//c78/MBvzvYnCrm4BVxg=;
        b=NbdazenQdwgEfZX0xqY2ZxpS+Cx2fw9NG8YYVP+xXObiuFCHPf0qcZi336hfgZvQLE
         UUeh7jo/FRELIskmC151tAHn3w5Gaz/n90TA5bZX4ApFGLFZ+j3VhoEnE744YsTnPEOv
         PJgvyimaUlqF8gWl1st4SLPMCZ/1gduxsy0FXik9DIxNYFNMilspKkg3rtJX2DekHeso
         mmNOJNSmLJ/Rei+AJYSC81v//mCkemh46HRlehfx7hUB1zg756rLs/ubxcmULqOfPMDp
         wZ6OuSDSXLAXdv32YrjvC8HKJHjjcXqZbW7KdFphs5S4Oko4xIHaCYp2CRto6osVt6wS
         mDRg==
X-Gm-Message-State: AOJu0YyAnWi5uMm5E7Vcchsik+J3A6QGST0at/MJgZYxKOo18mWal833
	h+Jmwx3Bi8WiAASJhZK/JL5QmXVLXLZ7rjflLpVaiRQ17C6Cbczq89bpU0THANAJXJtzvdXT5iu
	eiwC1
X-Gm-Gg: ASbGncvaeZvACjbqpeYiUVlAupbjWYAPzoPEHSdQM/JYSGJ4ySMYJtbr8WuxmydHdCT
	RlfFPZYU6iLY97p0gyimhsMqvVxznaSajagmCaAJiZ1VBcMglaAuV3caxyX5QNcFC5kawOW4gLM
	lNq66pPG9LMd61U9Fy0WG1Ph4cxbM4FoaUw05Jtp7P1kTi2dtITgzPGRaxaXG58krEAKzdBJWYf
	LRDK5+4NtxlGxEzNm40RFL0KhWIx3v984V2BJeqwU7aO54XzuoH/YuNLVG/d8rt+riCcnQtRY80
	k+o0QoiwD/FN5sYHNnmBMofRgJdnp47kB9ybgf0opju5WPfOxHIwt8zUlYSKV6c8cVUwUQKFRl2
	hnLtNrRZHX9qQA5Vr79XOUS0rq+qIWes3sj+LuW+UWTLbOfsGWeH6E6c3EtuI2lSnlHoR7YqUcW
	Qutlc=
X-Google-Smtp-Source: AGHT+IG2/TI88F2pwh0M3sAFFDcBsa/FDRa3BdqVbG1TIG9/O3dUAKz6ghEArwE30lDGqZ0BHrFZsg==
X-Received: by 2002:a05:6000:4917:b0:426:d3ef:6898 with SMTP id ffacd0b85a97d-426d3ef6f0fmr5964791f8f.15.1760355258148;
        Mon, 13 Oct 2025 04:34:18 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:10f2:650e:7ea:14f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cfe4esm17510736f8f.26.2025.10.13.04.34.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:34:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: Improve build race/reproducibulity fixes
Date: Mon, 13 Oct 2025 12:34:16 +0100
Message-ID: <20251013113416.511842-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 11:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224776

The include options shouldn't be needed with the make fix but issues still remained.
Looking at the logs, it looks like these are from other header directories and
we need to run "make install_headers" for all of the sub components before starting
the main build.

Update the workaround to do that for each component with internal header copies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3b9e52fdb84..1ac13e72690 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -105,7 +105,7 @@ EXTRA_OEMAKE = '\
     LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
-    EXTRA_CFLAGS="-ldw -I${S} -I${S}/libperf/include -I${S}/tools/lib/perf/include" \
+    EXTRA_CFLAGS="-ldw -I${S}" \
     YFLAGS='-y --file-prefix-map=${WORKDIR}=${TARGET_DBGSRC_DIR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
@@ -173,7 +173,11 @@ do_compile() {
             sed -i -e 's|\$(libdir)/traceevent/plugins|\$(libdir)/traceevent_${KERNEL_VERSION}/plugins|g' ${S}/tools/perf/Makefile.config
 	# There are two copies of internal headers such as:
 	# libperf/include/internal/xyarray.h and tools/lib/perf/include/internal/xyarray.h
-	# For reproducibile binaries, we need to find one copy, hence force libperf to be created first
+	# For reproducibile binaries, we need to find one copy, hence force libXXX to be created first
+	for i in api bpf subcmd symbol
+	do
+		oe_runmake -C ${S}/tools/lib/$i DESTDIR=${B}/lib$i prefix= install_headers V=1
+	done
 	oe_runmake ${B}/libperf/libperf.a V=1
 	oe_runmake all V=1
 }

