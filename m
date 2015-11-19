Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA286067D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 15:48:45 +0000 (UTC)
Received: by qkda6 with SMTP id a6so26874617qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 07:48:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=RC0UpCbwdV6I6DY4LXHBNp3kXD5F42wp1Wm6REerkko=;
	b=Guz2Bss/BO8NRDxnspw4tGqN9wiuoD4BHXbnVMGJQVEqwLLjay2UOJdkA1WfeEHNxi
	Vv3+DlWrH8tnwag6ecJVW0egwmMVzQGM8PaD/iWV03VaB/KgjVNUQyIOFKxrSVp1+HE2
	VbFLXuoavq5ZIqRUfGhT3nOwZJF1KylGMA5eZe1hBNjSrtyBYL0WIuCuh07k8fpOakKk
	ChJkGDjiFAeJmOG77eQeXEBGWfLOsbr4mz9AKtF1fEX6VnrqfTk9MBcrhbatoYw7Z+zj
	uuB+sHCooW8K7zNZ6e+RkDH7r/eMvKl356QeBQxtcuW6RnP3szAu/lipDEbTumib0rUU
	jHmg==
X-Received: by 10.55.19.213 with SMTP id 82mr7886892qkt.51.1447948126174;
	Thu, 19 Nov 2015 07:48:46 -0800 (PST)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id 83sm2480739qhw.27.2015.11.19.07.48.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Nov 2015 07:48:45 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Thu, 19 Nov 2015 13:48:40 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Nov 2015 13:48:31 -0200
Message-Id: <1447948114-30329-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
References: <1447948114-30329-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 2/4] lttng-tools: Drop unused patch
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
X-List-Received-Date: Thu, 19 Nov 2015 15:48:46 -0000

The runtest.patch is unused, so there is no reason to keep it on the
tree.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
Changes in v3:
- New patch

Changes in v2: None

 .../recipes-kernel/lttng/lttng-tools/runtest.patch | 52 ----------------------
 1 file changed, 52 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/runtest.patch b/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
deleted file mode 100644
index 545a5dc..0000000
--- a/meta/recipes-kernel/lttng/lttng-tools/runtest.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-diff --git a/Makefile.am b/Makefile.am
-index 584f59b..c2bcabd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -12,3 +12,9 @@ dist_doc_DATA = LICENSE \
- dist_noinst_DATA = CodingStyle
- 
- EXTRA_DIST = extras/lttng-bash_completion gpl-2.0.txt lgpl-2.1.txt
-+
-+install-ptest:
-+	cp -r $(srcdir)/tests $(DESTDIR)
-+	for m in $$(find $(DESTDIR)/tests -name Makefile); do \
-+          sed -i -e 's|^Makefile:|_Makefile:|' $$m; \
-+        done
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 6d5b00d..3774f9d 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,14 +1,17 @@
- SUBDIRS = utils regression unit stress
- 
--if USE_PYTHON
--check-am:
-+installcheck-am:
- 	./run.sh unit_tests
- 	./run.sh fast_regression
-+if USE_PYTHON
- 	./run.sh with_bindings_regression
--else
-+endif
-+
- check-am:
- 	./run.sh unit_tests
- 	./run.sh fast_regression
-+if USE_PYTHON
-+	./run.sh with_bindings_regression
- endif
- 
- dist_noinst_SCRIPTS = run.sh unit_tests fast_regression long_regression root_regression with_bindings_regression
-diff --git a/tests/run.sh b/tests/run.sh
-index c6c50fd..6455359 100755
---- a/tests/run.sh
-+++ b/tests/run.sh
-@@ -19,4 +19,7 @@
- 
- [ -z "$1" ] && echo "Error: No testlist. Please specify a testlist to run." && exit 1
- 
--prove --merge --exec '' - < $1
-+prove --merge -v --exec '' - < $1 | sed \
-+  -e 's|^ok \(.*\)|PASS: \1|' \
-+  -e 's|^not ok \(.*\)|FAIL: \1|' \
-+  | egrep -h 'PASS|FAIL'
-- 
2.6.2


