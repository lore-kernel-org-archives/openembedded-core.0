Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0538C001B3
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3868.1688092195629897402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YFFIS27w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-666fb8b1bc8so1231660b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092195; x=1690684195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah5WXajRgr2xOGNoSy3+6AJH1xIF5aVBVx2ttGNhZ9I=;
        b=YFFIS27w+dFdZxLBAlS3kGKs9SiN9TICrUO0p+VOxxbrZlhvkq0KYx3BiRo6z5mW2d
         aijNV5kM8azmLyWCnQrjlk1AlICz9tKIxEalAnmpuaVbxNzAAoHvgew/KMAsDBZPc0UT
         DRp92GuqM7vjmrGdx7lv31Y/FGURqUHN7E+YfDXS4wH3nl9zJjPCtP3m2oKaRjfgZpCL
         LNu0BucPwUOwHuckmRfgKwbOTpWAhPJUEVCiygcuHkuJszvFNIPXOxs7g+ZT7H9v+w5V
         PHAkHXetfiuptJgR1MO4DhVWaoIfliAHChg7no26kRJb93oPhCaZhym3rfkG5lc9JEEy
         Lpeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092195; x=1690684195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ah5WXajRgr2xOGNoSy3+6AJH1xIF5aVBVx2ttGNhZ9I=;
        b=Sqql5zOwrtKb7AnCfBBD7lmfIeMJXTSqp2YnOHeS3VYi3ZQrpQatxqKNlWi2x5eiYz
         S/b8KjlYrz3/yRvb56EXWphD+dezfJ1K2ChkoA+e1GQv6sZfokqgXcr3Ub39SdM43YaV
         itRmlqcgnC1KkSxwbXgVgMlCutR5rfSs1/Jf0C+4PvuIDRsqgB26IPbIAxOFHpcUmBwm
         GAyt9lYrReTz9ck0gscSA7NnNyanTGz14yrwZmJ6mGSsAOW2V1qDnwXNjLxjBc22J/Yo
         tt7LGqYoZZ5ObrCy1jVSd3gWlxn6SoRHg8fCyA+4+JpgVW25hfJh6AJw/vvviM4EYo2V
         LgHA==
X-Gm-Message-State: ABy/qLZWrmBcnhIAmQ/zcPbVjYruXQIRX+XDrU++CjICUjLb1094YLd5
	G3rJ98TmoAi0CPuCmsWqTu0qC++gx7+A7rIcO7HH/Q==
X-Google-Smtp-Source: APBJJlHoXfUMUAsSHJzYV91nKILJWSi6nutl5/8RnLCKxHDYKeqrLgjWL8VMlRyowbjAkgE/J1KTfQ==
X-Received: by 2002:a05:6a00:1988:b0:66a:48db:8f6a with SMTP id d8-20020a056a00198800b0066a48db8f6amr1934930pfl.12.1688092194738;
        Thu, 29 Jun 2023 19:29:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/30] gobject-introspection: remove obsolete DEPENDS
Date: Thu, 29 Jun 2023 16:29:02 -1000
Message-Id: <b5e006b15d0e95ab83a1a42de194d28152c67f48.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183666

From: Ross Burton <ross.burton@arm.com>

This recipe uses meson, so doesn't need to DEPEND on autoconf-archive.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit cb09a2d7077e4e0809e16ad6d23cd4f3b2a3bbca)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gobject-introspection/gobject-introspection_1.74.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
index d3a7ce2fd9..15265d1dc4 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
@@ -27,7 +27,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
-DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive-native"
+DEPENDS += " libffi zlib glib-2.0 python3 flex-native bison-native"
 
 # target build needs qemu to run temporary introspection binaries created
 # on the fly by g-ir-scanner and a native version of itself to run
-- 
2.34.1


