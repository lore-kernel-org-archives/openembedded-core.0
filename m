Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46715C636BD
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 07:38:32 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.21834.1700897907919630523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 23:38:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YFleiyhm;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1964796a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 23:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700897907; x=1701502707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGYCUMXZFVzlCAWWCJD7qO+mXoxcvC8hlOTUHcxZgw8=;
        b=YFleiyhmZrLPb5YBHezkM1042Ka1W0ThK4xP/r7lCCg4Svg2yqhrnGnPDn3rBP35d9
         pCUcfgGY1jqpFmKSxn9XATfOB6brjLf0Z9tHsx1gGEaxRYOtwy4Ot4v7D3GRHjqpl2fr
         4ix3d3YIAupG98wMG1qewen9RMs/vuTpnLMprjll6Ik2Fefe7G+XK0tZipB4Kqkz7m4X
         y8xhoTortrMb9whk0kuThc3L4D4iTnrWPK+SSmDp3oy6wxIgyv48GWXpSIBitqOJYKZZ
         szlfnYn3s0htsyRFLfznWaz0N+sumOEszKbR7PqNQrCtPCNuvnAqwExLncUIEjU6KoY+
         KM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700897907; x=1701502707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGYCUMXZFVzlCAWWCJD7qO+mXoxcvC8hlOTUHcxZgw8=;
        b=bG2U12ycuBu24isuK5W63nROX/QEgbBSnw4JT/k9mp5JNS6/IhIxtPLZuKbB1lTIiA
         fwW/ZDCEJvwGfyp5xhQSFoh7QKXkBjk9gn9KbDMnc4kmfQA8/cMUmR5JdjUJJIeKXrle
         FJkQ8JUOp/ayOGooZwmLjzclr4foQgUuAAvPAU70eleXBKxrvUakDAiix3EXWOWmIYEa
         mcclp421pvXqK5RbRYthrEfjk5Oi9JZkCMdrFv+iRIOgw5Bb4bbtgh6SPliYurhilMpL
         GERpk0b1gdbhxs/Fc75k37h4LAD9Zd87a78vf0e9+4HJocucPOpS3HBBA/EnjfOhOtTo
         pH+Q==
X-Gm-Message-State: AOJu0YxcIQnr2hRs+yTrggnsjO61Oopn0iegCrFNXAZJF3jQi//Ocbv+
	a607UnkJ/AGSAQ3/9zZBUbD9ZfyArSyB5g==
X-Google-Smtp-Source: AGHT+IFlLmGYo5zkwVElZ3szYljDeUXeV9CwKKGzRdF4YNixmlu7irpcZ2D6vVyRvduls1A4OGoKLA==
X-Received: by 2002:a05:6a21:1c8e:b0:188:444e:2b6c with SMTP id sf14-20020a056a211c8e00b00188444e2b6cmr5677484pzb.49.1700897907005;
        Fri, 24 Nov 2023 23:38:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id ei40-20020a056a0080e800b006933822e7a6sm3806105pfb.66.2023.11.24.23.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 23:38:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v10 2/3] vte: Upgrade to 0.74.1
Date: Fri, 24 Nov 2023 23:38:20 -0800
Message-ID: <20231125073823.159294-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231125073823.159294-1-raj.khem@gmail.com>
References: <20231125073823.159294-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 07:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191219

* Inherit systemd class
* Add packageconfig for fribidi support

(From OE-Core rev: 6c952b332cc07aa0babec8bc2839b3701f308d54)

(From OE-Core rev: a936ac8079e468b0349079b11df41295c82f7f97)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
v9: Rebased
v10: Rebased

 meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vte/{vte_0.74.0.bb => vte_0.74.1.bb} (89%)

diff --git a/meta/recipes-support/vte/vte_0.74.0.bb b/meta/recipes-support/vte/vte_0.74.1.bb
similarity index 89%
rename from meta/recipes-support/vte/vte_0.74.0.bb
rename to meta/recipes-support/vte/vte_0.74.1.bb
index 21203adcf79..8a7054a13cd 100644
--- a/meta/recipes-support/vte/vte_0.74.0.bb
+++ b/meta/recipes-support/vte/vte_0.74.1.bb
@@ -16,10 +16,10 @@ DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native i
 GIR_MESON_OPTION = 'gir'
 GIDOCGEN_MESON_OPTION = "docs"
 
-inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
+inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection systemd vala
 
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "9ae08f777952ba793221152d360550451580f42d3b570e3341ebb6841984c76b"
+SRC_URI[archive.sha256sum] = "2328c3f1c998350a18e0e513348e9fc581d57ea4e7b89aedf11e0e3c65042b4f"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -31,6 +31,7 @@ PACKAGECONFIG ??= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
 "
+PACKAGECONFIG[fribidi] = "-Dfribidi=true,-Dfribidi=false,fribidi"
 PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
 PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
-- 
2.43.0


