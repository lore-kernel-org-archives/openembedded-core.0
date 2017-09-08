Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CB9EA78207
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:46:09 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r66so1489647qke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=kLmWotsPjVt8QJUfBj4PEUminaCfmManRAZVWmJ5AMM=;
	b=evTzUqGFLDqw5I1H9ZP4I2TDcjxK4QhKy+8RFK8MODcL7a1/s+bkPOEaSpXYh9T/jB
	yKfVcSM+IkntROnycQ6RCs8EYJBC8zypf6Jwk/jkx9ErDBylw7VtRKoG4im61yijf2jM
	Fdhsj9p/RpK/vLjM/3R2Aozge6wkcNW1oU25c0TvWBZJieMxSQ9IdKtF/40sx2Ec2Oqs
	4EqzJwbPfX+u3wgE9BdRArr87u/XIb8yyMzbz/KTKPVkjlYg2U4CNG1YJq59h2jUuenp
	zXByyh7HsQzi9HVU+BA+zGI4BxygSZ9F2oGMfmZOo6qbaFCRW0ug8HYjR3H1UdyKPc2u
	40Cw==
X-Gm-Message-State: AHPjjUgGkhxdLHRUozreTwslmzv+sIATB9sfP6MxFz854KmKShx8gXCC
	A+7yLROce0cgG0dI
X-Google-Smtp-Source: AOwi7QAIK2+GoG2OZYfhPFmuZnURUqvPeEsaj9RrJtoCyz4ZzVTyRPRe1HgTtkAgC2uzwShOrOZuNQ==
X-Received: by 10.55.31.80 with SMTP id f77mr3265270qkf.95.1504881970678;
	Fri, 08 Sep 2017 07:46:10 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j61sm1266945qte.84.2017.09.08.07.46.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:46:09 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:46:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:50 -0300
Message-Id: <20170908144454.14308-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 08/12] go.bbclass: Enable parallel build
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
X-List-Received-Date: Fri, 08 Sep 2017 14:46:10 -0000

The parallel build is based on PARALLEL_MAKE variable but can be
overriden setting the GO_PARALLEL_BUILD one.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 720a504cd8..f64b07fd82 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,11 +1,31 @@
 inherit goarch
 
+def get_go_parallel_make(d):
+    pm = (d.getVar('PARALLEL_MAKE') or '').split()
+    # look for '-j' and throw other options (e.g. '-l') away
+    # because they might have a different meaning in golang
+    while pm:
+        opt = pm.pop(0)
+        if opt == '-j':
+            v = pm.pop(0)
+        elif opt.startswith('-j'):
+            v = opt[2:].strip()
+        else:
+            continue
+
+        return '-p %d' % int(v)
+
+    return ""
+
+GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
+
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
 export GOBUILDFLAGS ?= "-v"
+GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
-- 
2.14.1


