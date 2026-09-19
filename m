Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0CD2C982D8
	for <webhook@archiver.kernel.org>; Sat, 19 Sep 2026 16:23:49 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15205.1789835019916351134
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Sep 2026 09:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZzZQF0un;
 spf=pass (domain: konsulko.com, ip: 74.125.228.12, mailfrom: tim.orling@konsulko.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so1043489a12.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789835019; x=1790439819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6FDJcQq0vvxjOzDt1OkhjEdg3QXbOZHcnwGzfDXB5Cw=;
        b=ZzZQF0unxERS4ngPfq3fInZfODEEXFOAqUQpK3MUC1x9ZbfBlptQLqVtd9TKJfnzaf
         IdGRvFlOmXb3QDfp6+znN3cvr5JzIDkd0ErLXU+l1NIR0rKWDe8/roVZPoDv66OTFwdF
         E1ijSSXgwYe38xLQTCN/FB6ZzSstqfz9DqRJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789835019; x=1790439819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6FDJcQq0vvxjOzDt1OkhjEdg3QXbOZHcnwGzfDXB5Cw=;
        b=STwv8bOSZh0wDZapJtoTmM6Yc7bYvddh5l8k2A6jRTMh24//Q+J6mUHCIzuQdTrt79
         sIBtahBm7QEwQA6y8dTtlIGp7LKdaFsW6hTMo1nBuLsPihWsKeMGdhdKKAdAsB8whAy5
         QJ+nW4FPRrgwBrtO9qaaK7fEmxK/2U9YyBpfZxj9IFPgAmrLkATjLYdBRH9qjFScDjWX
         Jr/wkTSexkaBT2CA1HQ5VVSmuYuEyIram5KfbCcRuwsWfmGVb5oZIrKjDNyz0C2CNv0B
         0fqi1geZIKza1qCqfV8z1DyB5RGPZrgIN+lzP4N8zQcHINKs17H2bLmGqTUPV6Q2wLgJ
         EFWA==
X-Gm-Message-State: AFuF++kVrf7DH9cjJx76ORPKmBg8hkWFZA4PCqW47kT40bQMdFceVHoM
	20slEY4Q5N7fo6GFevpTai6oPxrvA+fmmSqghZ7xSIYJJZVwB2YR25ZGBYkewz8/jYzTS2IT8A8
	T4MDu
X-Gm-Gg: AYBFou0HXO6cbzBbs5H2wP3zKl7RkaJReFnUuC7ZJ0dfxoZwUqjcLJCmpqWWSaVD+SU
	tBfFf/VWDgEAmJgU01g1LjHI5cG+l6dhzY6Hmv1fPHTciLoao0TJVV4FE9TiLbZJdS6QS9mf9df
	iA8cTwIiYJpxgQJO+0z4F+DG8FMfbHN9riiq/28V1r9sYxJbCm+vwJJKQuwFSw1CTVITpxqGy4I
	JmizrErcyiDw0e0Pcay+dESnOtDoW7pE/gRIKfcWrOuGLLmM4ZAhGcmYL8OPOVKzn7mSjY1XMh8
	YSk1/mGq0wNecEC8Cvi1RlnPpeaA+rM3OrcEgrJc0kKuq178e2w8vNOrlcvZKyDgOdNOc099JhW
	fL20lJlI2xv/X6GwJmox295IOIPRZEtkZ+vJud+duu2qzL2hiXQ18lt8rm+SsXDpAYjsHUExwaM
	NSw/8I/nVR4ht7rGQ46ZqacteCr2HeBqe50OYxBPpoHBiMq52J/QPH54i54ly65jq9uT20r5dZF
	w8Rr6qDIKkT91MxkOxEraZhCRBi
X-Received: by 2002:a17:90b:3912:b0:39e:6a7e:ee1e with SMTP id 98e67ed59e1d1-39e6a7eef95mr4832785a91.42.1789835019219;
        Sat, 19 Sep 2026 09:23:39 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6254:c727:61b4:dbb5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb3284asm5242632a91.14.2026.09.19.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 09:23:38 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/3] at-spi2-core: RDEPENDS on gsettings-desktop-schemas
Date: Sat, 19 Sep 2026 09:23:22 -0700
Message-ID: <20260919162323.3862788-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Sep 2026 16:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246238

From: Tim Orling <tim.orling@konsulko.com>

at-spi-bus-launcher aborts when no compiled GSettings schema is present.

This has been a fatal error since [1]:
"26f75dc0 bus: Abort if we cannot get the default GSettingsSchemaSource"

[1] https://gitlab.gnome.org/GNOME/at-spi2-core/-/commit/26f75dc00eb16ccec89561aefe15f4036d45b4ec

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-support/atk/at-spi2-core_2.60.6.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.60.6.bb b/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
index 1e7a16d747..5c676d639f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.60.6.bb
@@ -23,6 +23,13 @@ DEPENDS = " \
 PROVIDES += "atk at-spi2-atk"
 RPROVIDES:${PN} += "atk at-spi2-atk"
 
+# at-spi-bus-launcher calls g_error() -- which aborts -- when
+# g_settings_schema_source_get_default() returns NULL, which is what happens
+# when no gschemas.compiled exists anywhere in XDG_DATA_DIRS. It also reads and
+# writes org.gnome.desktop.interface's toolkit-accessibility key to persist the
+# accessibility enable/disable state across sessions.
+RDEPENDS:${PN}:append:class-target = " gsettings-desktop-schemas"
+
 inherit gnomebase gi-docgen gettext systemd upstream-version-is-even gobject-introspection python3-dir
 
 EXTRA_OEMESON = " -Dsystemd_user_dir=${systemd_user_unitdir} \
-- 
2.47.3


