Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5760578235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:48 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id b1so3141128qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=X7s/UpcQVeFfyscEHe7sWMxxq5bt+VZZeQqkTkNmRNw=;
	b=LJRatzT7yVcBDknIou4UdCzsDCfFAnYe+dMWLvi1H6GcjWSGoxlnWWzAx/b55Mu4Kj
	fDPQtQyFPL8a9o2+FZbNpNrcEN9RoOKn8Tglh/IhJ50Nsb4d5tKTFS1RywRdKXptXbd3
	RGk7brIFhQpLQIkIC8DJAXlKRCZuLu+VtOWtW3lNbSCk4CYywVBFVUg7CUts3WHdvpH4
	0zeWsN5X6FJP99MBi0pmo8uXCvpTbugUbtBt6OLz9e786zPL+GndWF1T4eTPWXy1GodO
	WlfgLWVnCTATxGH8I26uAAQ0eY+T5AUXA13Iexo4QW+Jok3JCo6YJuMmQchp4+e6jQ8Q
	mh0g==
X-Gm-Message-State: AHPjjUgSMZgoFOCPAE0NSxS2Cwh9Af7YpW6aBzLS6tjyI+rUTVDPD07H
	UkAFBDiVm/Q5JE7M
X-Google-Smtp-Source: AOwi7QCqMqLXNLftm+XyKG4fpEII1t7aDYTQZT0FVSeJCIY+xAvhg4ackpfbJwhSKZPh0N0Tvz7KbA==
X-Received: by 10.200.27.98 with SMTP id p31mr16446499qtk.149.1505134009200;
	Mon, 11 Sep 2017 05:46:49 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	s69sm5695414qka.95.2017.09.11.05.46.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:48 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:43 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:39 -0300
Message-Id: <20170911124558.2863-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 07/26] go.bbclass: Enable parallel build
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
X-List-Received-Date: Mon, 11 Sep 2017 12:46:48 -0000

The parallel build is based on PARALLEL_MAKE variable but can be
overriden setting the GO_PARALLEL_BUILD one.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
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


