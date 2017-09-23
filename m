Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id BE6D17846B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 00:58:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e69so1102704pfg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rI2HpEfHkCBMmYb8JEBxylEUAjhMkRGivHm1ibWEnck=;
	b=GU9XFXMU/Pzz7Bpv8nKgSc/0oXXEeKjsNjQtGUpQq5FxbfMQAYGTBiziTKWrxEXtUf
	zk9IyTqKvc1TTOvad931IAu+7tb0qPo/DUPERIWa3ExQS2noM/mAeIAdUHySIp1GKr8n
	bvDtNKswDPIxBd1BStpnU/jjhkxX6VprEVH5I+EEnRpG1OoV1TxJMW3QTmMOTplDdLDL
	+63DVXKfH+YjUCiPtrhR1LDFoYCGgf81MGjEBPkocJSkwFaN781BWW4litcFYJ5wVECV
	BlxbExiAhEa6X5mcCJbP135EhjNL7WJiYciwRwXG90aIISs96U0xeUwO4vZw3/MoVgKm
	qWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rI2HpEfHkCBMmYb8JEBxylEUAjhMkRGivHm1ibWEnck=;
	b=TjLbrJrj2ORf6sH3JKtLQpYaRuNFrhG52McBjJtq5J3u3IgTUHUf8FZkQ0UXyjBpNh
	tISO9BX4wHThwiS67IM33As2MntTJcdGiwZ9txgRIyR4W0v7jqcZr+fduoxgYE8KLPOy
	cDXMxKIu0CF9tx/9XDoIcc0hFgsWBLaX/jqaqrFsyRZOQEgdO7W6qh44PXNaB5pHd2cv
	Vgap0cW8hE3IsYd+Kukc2gA56EdTdoEAhX+uKApVGo6OXrNCVILMdm9UBhUluE791C4A
	2mMvMa2zIWiJWD9I+9UERsbQ/4vHLzB8cX/xIcKoSULZi+/5r3U4g9BW8GzQ3u/+t1Dy
	Gp5g==
X-Gm-Message-State: AHPjjUj56S5MRzYh0kIfpJFAR9Z4+w8To3/K3Vl0hHpvWswtenHtMBSw
	3qlUfX819Eu9D25BBX1Fo554Dw==
X-Google-Smtp-Source: AOwi7QD306ss2LZ094ecGgu1XXMO6eqEw8eCZa8XWsJ7/5L21MhnqsocIqvonHQHFLBqA4J+M/vv3Q==
X-Received: by 10.84.179.36 with SMTP id a33mr684690plc.99.1506128314181;
	Fri, 22 Sep 2017 17:58:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	b66sm1151521pfe.165.2017.09.22.17.58.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 17:58:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 17:58:21 -0700
Message-Id: <20170923005823.10278-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170923005823.10278-1-raj.khem@gmail.com>
References: <20170923005823.10278-1-raj.khem@gmail.com>
Subject: [PATCH 2/4] go: disable PIE flags for cgo
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
X-List-Received-Date: Sat, 23 Sep 2017 00:58:33 -0000

From: Matt Madison <matt@madison.systems>

If the security_flags.inc file is included, gcc
will do PIE builds by default.  These flags need
to be disabled for go packages that use cgo.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass                | 3 +++
 meta/recipes-devtools/go/go-target.inc | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e167c949ec..09b01a84c3 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -50,6 +50,9 @@ GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}
 GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 
+SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS = ""
+
 export CGO_ENABLED ?= "1"
 export CGO_CFLAGS ?= "${CFLAGS}"
 export CGO_CPPFLAGS ?= "${CPPFLAGS}"
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index b88d0166e5..6065c3c80d 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -18,6 +18,9 @@ GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
 
+SECURITY_CFLAGS = "${SECURITY_NOPIE_CFLAGS}"
+SECURITY_LDFLAGS = ""
+
 do_configure[noexec] = "1"
 
 do_compile() {
-- 
2.14.1


