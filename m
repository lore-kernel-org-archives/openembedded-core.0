Return-Path: <twoerner@gmail.com>
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
	[209.85.219.68])
	by mail.openembedded.org (Postfix) with ESMTP id 18C857FB43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 17:23:38 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id b18so6083171qvy.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 09:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JSxoqhJz0xhctCVxJ7nDneqQhFjYGODVVDnjx9uhklo=;
	b=n/OGIapxld3ofFFln4OBKex0sg50y0Zo0WpIsgRSwNyYMpWVLP0WMXIjq2937A6h32
	2W5FjrFVfTuQOcpJt3YAGf0UIeRYqoFQBakqTJyEID4gOGXtQIbA0M8BlvwCgv+DFXRl
	TUkfVJkdwD+i7wETxqG7N6cqHSWeiKnG9eYp3XkZCJNY/rqEzwxlJf4l1KgB1hT+rR4i
	zuI+Ae7H78lR7VwMBn0pTp1fEDKiHDBWKezgueNfap89rHLcxGz0viB9vF3WC7mCIzx8
	hC5z9wj83Spilu+1XWxP+4gtbO4bW410yfE5V3edfsosjzkeolGkN8s8hafcSSTgkhCJ
	etLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JSxoqhJz0xhctCVxJ7nDneqQhFjYGODVVDnjx9uhklo=;
	b=YeYF5CvH52iTzTkGGXamFKGGhHiJ/x1ObNpTVmk1jJ0fI+2yenFHA4QY8bFpfMgBQV
	De2aUVat8XyUeQpRfvDrtiq6nyVs5yVi4sBeyv76kEtejFhPlGfW/jS3mU/tDOxFIVgz
	JA8vQdjrHDlbsvXv9fWh7hra/9JZN94fi3wiLtn8ewa7jW0wUl5hGigCZBjGqbrkyFbi
	aW8UjxRofaJNd9u2whsc/WSZzfj0NWFnKbjz5uTtrrBRS5/5TrlVaQZHMtRtUV0Y/EN2
	lAunaJHYuPhdJY4nLow3yxOZ0xzw2xi0fYSlD98MzK/pipa5ChDaMCrFp3PGc72GjLXQ
	2aJA==
X-Gm-Message-State: APjAAAVDaON9GbWlJe/vfUwNaWlOcB23FXpmIaHvI6ANKJm5+xF1XNBt
	UL0+4nwuKy8nVGIgXtoUIVMCcJC+
X-Google-Smtp-Source: APXvYqxeroVsH8RnqYfMwl4Z1IiaTh81D6zzfeRPKj6yNSaFH+kOKkKNXGrmy11KgO0k139d5HbODg==
X-Received: by 2002:ad4:43c4:: with SMTP id o4mr4190751qvs.101.1576085019614; 
	Wed, 11 Dec 2019 09:23:39 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	d143sm856651qke.123.2019.12.11.09.23.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2019 09:23:39 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 12:23:34 -0500
Message-Id: <20191211172334.11377-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.23.0.37.g745f681289
MIME-Version: 1.0
Subject: [PATCH] mesa.inc: allow the user to choose the build type
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
X-List-Received-Date: Wed, 11 Dec 2019 17:23:39 -0000
Content-Transfer-Encoding: 8bit

Upstream mesa can either be built as a debug release (the default) or a
production release. This patch allows the user to choose which one they
want by setting MESA_BUILD_TYPE to either 'production' or 'debug' as
they see fit. Under OpenEmbedded a production build will be performed by
default.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5838207e6b..9ad9f2e370 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -46,6 +46,19 @@ export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 
 MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
 
+# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
+# by default the upstream mesa sources build a debug release
+# here we assume the user will want a release build by default
+MESA_BUILD_TYPE ?= "release"
+def check_buildtype(d):
+    _buildtype = d.getVar('MESA_BUILD_TYPE')
+    if _buildtype not in ['release', 'debug']:
+        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
+    if _buildtype == 'debug':
+        return 'debugoptimized'
+    return 'plain'
+MESON_BUILDTYPE = "${@check_buildtype(d)}"
+
 EXTRA_OEMESON = " \
     -Dshared-glapi=true \
     -Dgallium-opencl=disabled \
-- 
2.23.0.37.g745f681289


