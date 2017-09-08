Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 66B7F60603
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:05:58 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id q8so2246820qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=V06eTX+PrwxY6iiksWTTPc9hu0Lr5//aKwmCy64pjLg=;
	b=H2fH2w5Wk4Uxf34NNWL7YnuWYcRpuz5mcDFdAsXK0kRE9xHsQ4hMuNL5UBHlSNT1rU
	jLUL1SOvq70KyqYlp0mNL1h+cXreVI1dKuBiwFqzGSCwYTb6CDZ76K485UNo6dCPsNBD
	b0l1I99c43W5dH6GDvqNovJPagvtXLLPu6dYRzHcTp3BXGrDNF55Wspd0jkgtapCD2dc
	r6ddfH0wy4xx81XL4K5pHlIBhWOEeTfrDd6XDXXVeExkOVt8gHZtjJQYh1FJHdkOa6rE
	4Ewmkui0rVHxC1tBDJEmRi8qV+SX3E6VNRE8bT2egE/kaxThfqap/ASb8JK27ce20h52
	Uqtw==
X-Gm-Message-State: AHPjjUhiM+YmQH5zX7n1atbTxp70dwKNqa5kdiuQTA/VmRlU9BSCEcsd
	WSWXr7OugOyEqlRn
X-Google-Smtp-Source: AOwi7QCI8AK4FVdhLJ/EbFRSCcOUKf5jBqDwlLzaMH2jCXbUDLFBVX0yy14juCTOZpdns7M+CWhl/w==
X-Received: by 10.200.45.73 with SMTP id o9mr5714649qta.292.1504904759575;
	Fri, 08 Sep 2017 14:05:59 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 36sm1918541qtz.89.2017.09.08.14.05.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:05:58 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:05:51 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:37 -0300
Message-Id: <20170908210444.25763-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 07/14] go.bbclass: Enable parallel build
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
X-List-Received-Date: Fri, 08 Sep 2017 21:05:58 -0000

The parallel build is based on PARALLEL_MAKE variable but can be
overriden setting the GO_PARALLEL_BUILD one.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
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


