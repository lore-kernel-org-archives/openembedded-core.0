Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3033B7822B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:48:34 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id l25so2578779qtf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:48:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=O12PD8W2Lji0v37BsAMXSCvZO/e+Ro1AgER1oQWyGrw=;
	b=ZHzMlJ9n4c/tVSQG/Mx8+YrdQRN8n9z+hxaE+lj6RZVwwPa8BvJGYuNXJgkmhoHNEe
	zdl6ANuFQgXeYS2XOpVQcLDJdHcb9qyLNmdhGVl2ymE04yT/3RViHU0WKnDLuFaqhc/z
	rU7ACuaEFEmq5uNHuWCrDTEk63n+pIsIV913v8WCAQ/LUehg5dhR0IOs8gx5Zo3+yjGy
	ZhxcHmAJQx/aD3tMjLhH2gIw+ciXs+tv4joxqEeuEVPafAe1MutwivstFih+H2fuGJ6O
	quiD+oV6OympfuqnBcMpYK4GIAqOX4Rt7gd3IBMGl+jqNM/y1IChpXfgpqPnGgTs1HZs
	dqag==
X-Gm-Message-State: AHPjjUj0tcy6cQAamg+h1YJAZWs+7UiZ6eyNOOQ6y0C9FxYE6+JFjZ4B
	K3w9pTvdSEpYGomN
X-Google-Smtp-Source: AOwi7QDejObFS+ZEF5jE6VntgepYaZbSiGYqcCLi/lMLv0xjsuHIf9QQvvZECgSNtvHc/RunG/+atA==
X-Received: by 10.237.52.69 with SMTP id w63mr647693qtd.78.1505134115110;
	Mon, 11 Sep 2017 05:48:35 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id w46sm321826qta.84.2017.09.11.05.48.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:48:34 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:48:29 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:57 -0300
Message-Id: <20170911124558.2863-26-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 25/26] go.bbclass: enable nativesdk builds for Go packages
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
X-List-Received-Date: Mon, 11 Sep 2017 12:48:34 -0000

From: Matt Madison <matt@madison.systems>

Adding the necessary overrides for nativesdk builds.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

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


