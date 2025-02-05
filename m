Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB60AC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 09:33:46 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.8338.1738748022940989817
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 01:33:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6OodFV2;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38da586ef14so1122453f8f.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 01:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738748021; x=1739352821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GqnaA+ldWalr46s3/xLZU2VNhAKovzMkLti8j72Z0FE=;
        b=N6OodFV2M17azgPjhFvwv1lFe7ZVUZY0HMxvF5DJTDfNCxp4NaC0NSOBHcVHG0eB/V
         psanSChXC9Xze357EnjgGJh0LJoUJXbez2QuiVGS9FmdeqsImB5aKgWWj8RDNoxmN1GL
         QTUVdGp6ZCZncWbzJLvoV47L4vzb6o48Hd2YG22hOz8NV/kjSj7lnuvr0eEipjOZfxlW
         oQgSXo/YED0i1DSAMFBAemiB3tqJlaqi0gVySUlyZyohTF3MUjYGNIHw0iXKPbx2QRfb
         2kJiWb51kH0Pd2f+UphQ2U0zOJJaNAlKCBkhNZp+4U5d1uilJVNG706tzVSzraVMmYzI
         OvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738748021; x=1739352821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqnaA+ldWalr46s3/xLZU2VNhAKovzMkLti8j72Z0FE=;
        b=p7CGBvuOrBPYp4o1lHOlcZ8y0d4QrCVxa9REXCsTkLQmVLPv3U9rNJTHPc+pzvVz8s
         SupMQv6T9xVWgwWu+qdzHGiI1d7l/l/j9Np27um+kb8FTFS5Uo2ZDb2b71b6jzigP73B
         0bhbGkBCwlCXPWaaZ2y+Nv9CONkMczSblVNHG65z0wm2TOK7uyswv9Mcgufg157vS7cY
         Lj4FEqAUZC7mHJbsmAUqVDHfNSF1KPOtjapAB6fb9RPdHZ85obdxzuju7CJwEEvwY42d
         Oi4ClgfzUm9MLC2x6AjmHgWUwb/MoKSB/v80VwaixgD+L5SWFmjFhw8Qj4hSvO3bOYbQ
         rb3Q==
X-Gm-Message-State: AOJu0Yx6gYycFji9PCaXfR5oPdNmJO8weu9HAK+Kb6dqZ1cs183oWBvY
	SimgKedKRCjdtfURAMhQga6C7yFuvzfbw/eQb9r5gfigIIrKCei+DPj1+KTE9e0=
X-Gm-Gg: ASbGncvkYxn6jF1+z2sLgE2Lz6l0qEWiAiF5LroG5rhC3fU5Q7+xE5YYtNJofVAjLtp
	tiHlXHqELt4jCuqTP/qr2rbCaqQ+fIzQFvTVi7gwgO5dvMyg2trmAv4InKMPn0+e9XnoM3XBtXJ
	SAjgTloxMySEsCPw6Vz2GHk+VD3BZx/XFGkVYtQQjilt8xPLHjXyYC9kffXaSvJVhXc0ZeztxTe
	pDfQ6RtqBIsPK7nHEI1Oars31PbfCENOrDh1FYme4rimc0UTK4+Q+gSC9MBtOwISn6XiQ9IQFeo
	HFZsQwyIYyuuOgIvu5elI9hdIJ3gYjV6Y6k70mjVDZm7
X-Google-Smtp-Source: AGHT+IGBniI3nzbdPXArTx4y4DCss5LftkcXoogoGskp7sozF1u3EOVspUhN7Pu2GVx6DXHTbti53w==
X-Received: by 2002:adf:fdc4:0:b0:385:fd07:85f4 with SMTP id ffacd0b85a97d-38db488960amr1086303f8f.31.1738748020951;
        Wed, 05 Feb 2025 01:33:40 -0800 (PST)
Received: from slackware.local.localdomain ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db501a0f8sm1396322f8f.92.2025.02.05.01.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 01:33:40 -0800 (PST)
From: uvv.mail@gmail.com
To: Openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [PATCH v3 1/2] meson.bbclass: Add an option to specify install tags
Date: Wed,  5 Feb 2025 10:33:26 +0100
Message-ID: <20250205093327.87656-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 09:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210835

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

The feature is available since meson 0.60.0. You can specify
comma-separated list of install tags (not targets).

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes-recipe/meson.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index b343480f9a..cbfc45b94b 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -22,6 +22,9 @@ MESON_SOURCEPATH = "${S}"
 # The target to build in do_compile. If unset the default targets are built.
 MESON_TARGET ?= ""
 
+# Since 0.60.0 you can specify custom tags to install
+MESON_INSTALL_TAGS ?= ""
+
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
@@ -182,7 +185,10 @@ meson_do_compile() {
 }
 
 meson_do_install() {
-    meson install --destdir ${D} --no-rebuild
+    if [ "x${MESON_INSTALL_TAGS}" != "x" ] ; then
+        meson_install_tags="--tags ${MESON_INSTALL_TAGS}"
+    fi
+    meson install --destdir ${D} --no-rebuild $meson_install_tags
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install

