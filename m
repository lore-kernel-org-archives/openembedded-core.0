Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA8A783E9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:52:33 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id o77so7120319qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=gZOeND+Pt9QmzMLM9l+UxXSKFX36koYImv4fiFjFc0Y=;
	b=HKY3BjU61YXBXuurO7wBHMsd9t8pe+QGR53Kbv0KCRPiDjCgYxpS291VBpDRFLahJs
	Qevz7ywLE50GHCfFKC0idlWhevsZVx9pwv3STXmLzkBqtDrhcLziPr9vs7RYbYq2W6C1
	/oK+JFAGUtz7rAVVPBdlYTu4DkKo92adekPyR/zkAO1lUZ0YNEWVGdlPhWpmiCWLyyls
	ZRwLYa7J9KdYBF/nguEcCXb7XYgQZRO1mBupJWKNFGYiq4qTZeDm2Jn4WrOGXuUA95U9
	/WTzmFTi+qafAGDklFDoF4cD9uzd9aWVg4zrXpqt13ICUlktl1M0yRIljL24PDVLHew+
	Gw5Q==
X-Gm-Message-State: AHPjjUi96kYR+7GAN5wjmN2carPEPGupJ6BpzxkkG9xO0Oexh6H/QSxj
	dfPVcufbgMenCxGw
X-Google-Smtp-Source: AOwi7QC3gXk5rfpv6Yro+zhIX86mbDAnHyc9BU8GShI/9MQPQ+BZouikhi6MxgRpaNQB33zXLnKMEA==
X-Received: by 10.55.40.196 with SMTP id o65mr18975389qko.325.1505220754997;
	Tue, 12 Sep 2017 05:52:34 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y11sm7662002qkb.20.2017.09.12.05.52.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:52:34 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:52:27 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:30 -0300
Message-Id: <20170912125031.4009-13-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 12/13] go.bbclass: enable nativesdk builds for Go packages
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
X-List-Received-Date: Tue, 12 Sep 2017 12:52:34 -0000

From: Matt Madison <matt@madison.systems>

Adding the necessary overrides for nativesdk builds.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/classes/go.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 8fb41e5c09..8d363e86a2 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -20,12 +20,14 @@ def get_go_parallel_make(d):
 GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
+GOROOT_class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
 export GOROOT_FINAL = "${libdir}/go"
 
 DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
+DEPENDS_GOLANG_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk virtual/${TARGET_PREFIX}go-runtime"
 
 DEPENDS_append = " ${DEPENDS_GOLANG}"
 
-- 
2.14.1


