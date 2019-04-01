Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3677D00C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 16:01:30 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p10so12787543wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 09:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y0Tz17hQvGQqEs8qzRGdsXslpxnx4PvTQ2388gV87zM=;
	b=Q91IH6nOHezAW//jVhtfLV66Rdv8vVoFeFBsqwb3Xod9vXhpXvk6o8xuseUceOhtSo
	gGF5IePKsB7JUY27Dz1DtSULY7CJatg/i5rWBEokCsWucU+W482Ak9P3BAH5W06zlEh7
	1M0JlbyS17lB6YMiVxJpHWcamZ0+bf6oIjWwafZparEm8BJbLr1s4Y4V2GVj97CeTO+K
	rq2n8rF8umIgdYnQ0R6bADi36deu8NgdXtRGfxq0daYli9bP03l8ymkSF2AhDqXkNuqf
	F4wayzOt8q3f5b0fDECoxBSGBUrmI8MW4aftwHgxy5wnWObZrWChrOZKi5Gn08sTgBJ4
	DLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Y0Tz17hQvGQqEs8qzRGdsXslpxnx4PvTQ2388gV87zM=;
	b=AI31sd+2A/O8AtogPkGX0uTrNjgEwOPu8ux2exIP9eG0E/fxW1/Q3ie0lSyaWCQ8ST
	juvRnJssua6EN+umOmnF0HvtSc0WNc0rfpVmja++qREGd9BhXGQjZebExlmz5Bg4CLpo
	BQfbBHFwXcgg3RJgzjY+v2uWJL5jC9Nju6f/Rev87GznZW1YAp83jdcPJUqyxed0Vze3
	hWI3YjittmyGSfrzWAHTXVP8uZe+MXljrX4pIHfxUpIkstkaxQDlRwnw6fo2qY00L41R
	W90deAGVrxVlvHBxz21Xaffpjf5cGiKlgfDJf9ntld0EehFUrDMb211+/PR98xoFepx/
	Ihlw==
X-Gm-Message-State: APjAAAVtob52342cKlAyY+UJuEosCCafWwUuGH07PYd8Jv8dXCtJ5owz
	YLkCB/f4LsEveHZLtKKz8mu4JH33
X-Google-Smtp-Source: APXvYqwYoQRXQXM1HD33L6Uth4hLVx6k2IztevvHEmDq4yftmrg6NWJFYEMam06uxdWmFiVUMp6L4g==
X-Received: by 2002:adf:afd7:: with SMTP id y23mr40403457wrd.254.1554134490573;
	Mon, 01 Apr 2019 09:01:30 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	13sm11640680wmf.23.2019.04.01.09.01.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Apr 2019 09:01:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 18:01:06 +0200
Message-Id: <20190401160106.22928-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2019 16:01:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
V1 -> V2: Introduce GIR_MESON_OPTION as suggested by Alexander Kanavin
 meta/classes/gobject-introspection.bbclass | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 4ceb0c68b1..d3c92e0d7a 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -6,14 +6,26 @@
 # This also sets up autoconf-based recipes to build introspection data (or not),
 # depending on distro and machine features (see gobject-introspection-data class).
 inherit python3native gobject-introspection-data
+
+# meson: default option name to enable/disable introspection. This matches most
+# project's configuration. In doubts - check meson_options.txt in project's
+# source path.
+GIR_MESON_OPTION ?= 'introspection'
+
+# Auto enable/disable based on GI_DATA_ENABLED
 EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection', '--disable-introspection', d)} "
+EXTRA_OEMESON_prepend_class-target = "-D${GIR_MESON_OPTION}=${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'true', 'false', d)} "
 
 # When building native recipes, disable introspection, as it is not necessary,
 # pulls in additional dependencies, and makes build times longer
 EXTRA_OECONF_prepend_class-native = "--disable-introspection "
 EXTRA_OECONF_prepend_class-nativesdk = "--disable-introspection "
+EXTRA_OEMESON_prepend_class-native = "-D${GIR_MESON_OPTION}=False "
+EXTRA_OEMESON_prepend_class-nativesdk = "-D${GIR_MESON_OPTION}=False "
 
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+# Avoid triggering configure QA
+UNKNOWN_CONFIGURE_WHITELIST_append = " ${@["", "--enable-introspection --disable-introspection"][(bb.data.inherits_class('autotools', d))]}"
+UNKNOWN_CONFIGURE_WHITELIST_append = " ${@["", "${GIR_MESON_OPTION}"][(bb.data.inherits_class('meson', d))]}"
 
 # Generating introspection data depends on a combination of native and target
 # introspection tools, and qemu to run the target tools.
-- 
2.20.1


