Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A37660291
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 17:27:03 +0000 (UTC)
Received: by qgad10 with SMTP id d10so10371424qga.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 09:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization;
	bh=iLAScqFqCQAZFSGXoY2Eq84GomxhEpgIR23ER9NPpaw=;
	b=d4ijw4ANHip6bSqDKEduA4zyzoi9Z5dFTKcX3riErj5GkN/2QAvR12ZXtbVRdxZUq2
	pPqEX3cBgw0xycerQKQDxnBJhXQst+knDqXGb0z1OXwTC4BaNz3JO+ggP1+t7xH10VWS
	cWW2tCZehlQwruf6EEXZnuRE38k1NSdMc8fgjgUklefakSO+8rrImgJ+4NX89CGIk8zD
	HGwR19OeNjZadvKxRHaOybn/gZgKN1PONUQAQPJESe52DqCG5wBDXC/FaT+rqNvIvf61
	oeahkWZjys/3CUUuhvqv/BCkFXp7hDclsw1VD12MTD/o5tTtrmRTJTOqWYTOvRJ10em0
	N7JQ==
X-Received: by 10.140.101.41 with SMTP id t38mr35189284qge.53.1447781223836;
	Tue, 17 Nov 2015 09:27:03 -0800 (PST)
Received: from localhost ([177.100.174.62]) by smtp.gmail.com with ESMTPSA id
	v187sm10534109qka.9.2015.11.17.09.27.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 09:27:02 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 Nov 2015 15:26:57 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Nov 2015 15:26:48 -0200
Message-Id: <1447781210-23924-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1447781210-23924-1-git-send-email-otavio@ossystems.com.br>
References: <1447781210-23924-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 2/4] lttng-tools: Drop unused patch
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
X-List-Received-Date: Tue, 17 Nov 2015 17:27:05 -0000

The runtest.patch is unused, so there is no reason to keep it on the
tree.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


