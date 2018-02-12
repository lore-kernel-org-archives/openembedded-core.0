Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id EFFDE7826D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:23 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id e1so7281097ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/KmqZyt34CyuFXHUXWHJwNIXqpb7DwnedtPeGAQ69/0=;
	b=hKEBHWcykFlA7UF9lkXciEZFGDzfCz3iCaKZBJSC7QfxqOf30b5m99uf9RY4xgu61N
	YwVeBh4RhuVlohLSVWl3LDuJ8phkqvhOccyqMOxceRyzuSzgFsZYGI+mvIXzQZLNKNOF
	5ux9jkSeWb+V/H/vgrVRp07DH2rietYepa/R1/dnNPU9Bd6N8Mlin4jQtMK85kNdFAB9
	ODMP6N+glBL4uWsEBh+SyMJlR8HsKg7ixqfczzG6xHoVAC+HO4PhIIxV28EM7HSHtDGL
	Fs2OX84+uyM5LT2fJayKxempKdBhsA0lkb1ELSdA9pIlXlO+fvFxJ+iwnkI8Fk/uRfN+
	9Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=/KmqZyt34CyuFXHUXWHJwNIXqpb7DwnedtPeGAQ69/0=;
	b=ogaJhnFF5wgg0baDA4QYxNccsgIZst74b7YwI9iizaX91Hdy/L/CFAmRr0K6YeYtCp
	LslBtYVThsPxE2eKXVJIxNKh0G32Aw6h5ka0m010UEHLzzmICk6DsCudrwxDMfddhd/L
	5DMJbi+Etrf/iV1CX+CVLhVpxmvgwB3psa0uMXp1gINMG9Zj3qQ/wnuQ6PiMBx0CVdPm
	yUiSjQBwUY541utwJnhNKany7cg1um9CTe+A9ePXtxDVLyZ/l2dNQ2C6gj865SbBWybd
	z+rPIt4cJYE1M2rRFkQ8j6CGL0LUXenmhm0SmE9+yiog7BTftb1ffTDYiNGyIjwCD8yu
	9Qbw==
X-Gm-Message-State: APf1xPDxGsfrG/bLGdE9BMse1lEEgqzmKRvsue7KUIwQR+xnSDShftc9
	qqT+omKYW4Rxz4YimuymzkQWVn+L
X-Google-Smtp-Source: AH8x225Fa03nXUtzFanNprDSs5Nc3M1lhfCcXBOZ60Vi7TY1Lw1DunfN/29luRdPaxrNyTWYboXxMA==
X-Received: by 10.36.98.3 with SMTP id d3mr5265670itc.122.1518454344738;
	Mon, 12 Feb 2018 08:52:24 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:24 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:51:56 -0600
Message-Id: <fc8f466ba8a70687de131a52bc0341534cb73a5c.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 01/17] icecc.bbclass: Move to shared work directory
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:24 -0000

Generate the icecc toolchains in a shared work directory. This class was
already setup to correctly synchronize creating the toolchains in a
shared location before the RSS changes, so return to that behavior
instead of generated the toolchains in each recipe's sysroot.
Additionally, it makes no sense for each recipe to generate a toolchain,
only to find it was already generated and uploaded to the compile server
by another recipe.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 1cc1c4ddb0f..e8725b582b3 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -151,6 +151,9 @@ def icecc_is_native(bb, d):
         bb.data.inherits_class("cross", d) or \
         bb.data.inherits_class("native", d);
 
+def icecc_dir(bb, d):
+    return d.expand('${TMPDIR}/work-shared/ice')
+
 # Don't pollute allarch signatures with TARGET_FPU
 icecc_version[vardepsexclude] += "TARGET_FPU"
 def icecc_version(bb, d):
@@ -175,8 +178,8 @@ def icecc_version(bb, d):
             archive_name += "-kernel"
 
     import socket
-    ice_dir = d.expand('${STAGING_DIR_NATIVE}${prefix_native}')
-    tar_file = os.path.join(ice_dir, 'ice', archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
+    ice_dir = icecc_dir(bb, d)
+    tar_file = os.path.join(ice_dir, archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
 
     return tar_file
 
-- 
2.14.3


