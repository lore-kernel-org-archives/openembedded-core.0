Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2FBE77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 03:35:28 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.56628.1735529722664205818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 19:35:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=gDpS6ASb;
 spf=pass (domain: underview.tech, ip: 209.85.219.66, mailfrom: vince@underview.tech)
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-6dd43aa1558so49017886d6.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Dec 2024 19:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1735529721; x=1736134521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHlUQpvDmmE2LWbf2fwzafJhOi/Fr6bWjPrx1HseXk0=;
        b=gDpS6ASbWEZzhISUvheDkS9AQlBRvwY3N8BwvKew6ZkRnSzhhKm6lhaGMJrv6a2pCY
         pm4XIMxBx27iVEr0+uCkpK5jEWdjENjcX4p4/HaoYdsdoaOtI3+NC0xJ7Ce5flUfSl2a
         imN3/zrauvw7qMjTx8Gldx04H6bpgsbomo4yoYPaog8DQpH0lLdLBVwx613v6hO80tQd
         ooXMvQnqUdFZzd5P8BfU04Mv10HIBWUhMfgH/ZhibYCgzX+s0oa3cE7ANXUcz8DFH62o
         ad2qJq1BwqvTnjMCgIgWH05H98u/yP2ynHf19umz1nelYco8BDs83cPbXahj+sCmiSEY
         iNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735529721; x=1736134521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHlUQpvDmmE2LWbf2fwzafJhOi/Fr6bWjPrx1HseXk0=;
        b=n/FCJEglP1Rkecxws+GMQbXhj8qBh+qzsNXGjHZwQrBIXABZenIAuCvtTdC4sQKaGQ
         5gGnEfDndds4kHiXLtpkir8FEhFPCs/Fy1enKYWkkhpIQUVfpLm2Lnl2lqKOsujRKjyn
         fB0P7Qak2UlzMk2RzryMLToU5Y5+H4joRNgjsEOJEfKd4IJ0fHezhYKDZa3hktcpl+RN
         IuDpxp/175JUWVLDKN9Z872jxTMoDQtQy0RnhsX7M8lXUXrcFb3o2Eltd092VRwq4PQ5
         M2BMJSNeZjXtfVAWpGuWgZSK3H0l6ZcRuXxS3c1r3lxr5ke1VzPsJ5dgK2ZWAyy5JSUB
         IqhQ==
X-Gm-Message-State: AOJu0YwGVpfYovzq6FGxTAk5mnP9CCCumcYJOl6SNnhpQyIYCvQn3gmh
	4pOnI2ba7adpMdiqnBZbWjlwt72pm5y/FasvBxpXbtMwEAU+WVbYWHulk2g4QlxOyYtx0TnVJNQ
	tkv39bQ==
X-Gm-Gg: ASbGncsEG/AJTOVCp+3YkZNnBlES59J30taMWwETd7IoMjK1S5EDujn5Nx1IsKmrCAN
	fVXZt8onzjSZEeuZoYqr/GVtz+I7UXMWzgTUAUpX6i71xPgn8U1CGS0r0u0QIzePd4G6y6cf/Me
	S8IGYZZcehM9d0By3sImJERjyaTziDH+a8AO95FjghhvtEt4iTrwuwSY1v4TH9uQqLvOqFyS5WE
	cfxNwubXXbMM6/tRkWLDe4S82FV3qInvC2dSQx+db4hLAeHZjNUrTx2P+AfH0AGBA7o
X-Google-Smtp-Source: AGHT+IF9GLHW25eP/mpIaih3VhFVdQU2HZeu/N/HobHfcH//sXb77cRF905sZRzpQIRAUhwkHUKD1w==
X-Received: by 2002:a05:6214:2b82:b0:6d8:9002:bde2 with SMTP id 6a1803df08f44-6dd2334dad5mr613588056d6.28.1735529720767;
        Sun, 29 Dec 2024 19:35:20 -0800 (PST)
Received: from vince-server.hsd1.mi.comcast.net ([2601:406:4d01:1820::afe])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd194ac3bbsm98181356d6.107.2024.12.29.19.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 19:35:19 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] gettext: fix libtool: Version mismatch error
Date: Sun, 29 Dec 2024 22:34:51 -0500
Message-ID: <20241230033450.582395-2-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 03:35:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209134

Commit adds in hackish fix for
libtool: Version mismatch.

Along with subsequent errors that occur after fix.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-core/gettext/gettext_0.22.5.bb | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.22.5.bb b/meta/recipes-core/gettext/gettext_0.22.5.bb
index 0bf2a56e5f..a420d3df17 100644
--- a/meta/recipes-core/gettext/gettext_0.22.5.bb
+++ b/meta/recipes-core/gettext/gettext_0.22.5.bb
@@ -122,6 +122,34 @@ FILES:gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${infodir}/autosprintf.info \
                             "
 
+
+# Hackish fix for:
+#
+# libtool: Version mismatch error.  This is libtool 2.5.4, but the
+# libtool: definition of this LT_INIT comes from libtool 2.5.2.
+# libtool: You should recreate aclocal.m4 with macros from libtool 2.5.4
+# libtool: and run autoconf again.
+do_configure:prepend:class-target() {
+    cd ${S}
+    autoreconf --force --install
+}
+
+# Fixes
+# NOTE: make -j $(nproc)
+# make: *** No targets specified and no makefile found.  Stop.
+# ERROR: oe_runmake failed
+do_compile:prepend:class-target() {
+    cd ${S}
+}
+
+# Fixes
+# NOTE: make -j $(nproc) DESTDIR=$D install
+# make: *** No rule to make target 'install'.  Stop.
+# ERROR: oe_runmake failed
+do_install:prepend:class-target() {
+    cd ${S}
+}
+
 do_install:append() {
     rm -f ${D}${libdir}/preloadable_libintl.so
 }
-- 
2.43.0


